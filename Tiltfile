load('ext://restart_process', 'custom_build_with_restart')
load('./tools/tilt/bazel.Tiltfile', 'bazel_sourcefile_deps')

services_dir = "services"

services = [
    {
        "svc_name": "accounts-gateway",
        "svc_dir": "{services_dir}/accounts-gateway".format(services_dir = services_dir),
        "chart_dir": "{services_dir}/accounts-gateway/helm-chart".format(services_dir = services_dir),
        "svc_image_target": "{services_dir}/accounts-gateway:image".format(services_dir = services_dir),
        "svc_binary_target": "{services_dir}/accounts-gateway:accounts-gateway".format(services_dir = services_dir),
    },
]

for svc in services:
    # Use Bazel to generate the Kubernetes YAML
    for f in bazel_sourcefile_deps("//{chart_dir}:deploy".format(chart_dir = svc["chart_dir"])):
        watch_file(f)

    k8s_yaml(local("bazel run //{chart_dir}:deploy".format(chart_dir = svc["chart_dir"])))

    # The go_image BUILD rule
    image_target="//{image_target}".format(image_target = svc["svc_image_target"])
    binary_target="//{binary_target}".format(binary_target = svc["svc_binary_target"])

    # Tilt works better if we watch the bazel output tree
    # directly instead of the ./bazel-bin symlinks.
    bazel_bin = str(local("bazel info bazel-bin")).strip()

    # Where go_binary puts the binary. You can determine this by building the
    # go_binary target and reading the output log.
    binary_target_local = os.path.join(
        bazel_bin,
        "services/{bin_name}/{bin_name}_/{bin_name}".format(bin_name = svc["svc_name"]),
    )

    # Where go_image puts the Go binary in the container. You can determine this
    # by shelling into the container with `kubectl exec -it [pod name] -- sh`
    container_workdir = "/app/{svc_dir}/image.binary.runfiles/rosterpulse/{svc_dir}/".format(svc_dir = svc["svc_dir"])
    binary_target_container = container_workdir + "image.binary_/image.binary"

    # Where go_image puts the image in Docker (bazel/path/to/target:name)
    bazel_image="bazel/{svc_dir}:image".format(svc_dir = svc["svc_dir"])

    local_resource(
        name    = "{svc_name}-compile".format(svc_name = svc["svc_name"]),
        cmd     = "bazel build --platforms=@io_bazel_rules_go//go/toolchain:linux_amd64 {binary_target}".format(binary_target=binary_target),
        deps    = bazel_sourcefile_deps(binary_target),
    )

    custom_build_with_restart(
        ref         = "{svc_name}-dev".format(svc_name = svc["svc_name"]),
        command     = ("bazel build --platforms=@io_bazel_rules_go//go/toolchain:linux_amd64 {image_target} && " +
                        "docker tag {bazel_image} $EXPECTED_REF").format(image_target=image_target, bazel_image=bazel_image),
        deps        = [binary_target_local],
        entrypoint  = binary_target_container,
        live_update = [
            sync(binary_target_local, binary_target_container)
        ],
    )

    k8s_resource(
        "{svc_name}-dev".format(svc_name = svc["svc_name"]),
        # port_forwards=8000,
        resource_deps=["{svc_name}-compile".format(svc_name = svc["svc_name"])],
    )