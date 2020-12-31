load('ext://restart_process', 'custom_build_with_restart')
load('./tools/tilt/bazel.Tiltfile', 'bazel_sourcefile_deps')

services_dir = "services"

services = [
    {
        "svc_name": "accounts-gateway",
        "port_forward": "8080:8080",
        "platform": "golang",
        "resource_deps": [],
    },
    {
        "svc_name": "accounts-service",
        "port_forward": [],
        "platform": "golang",
        "resource_deps": [],
    },
    {
        "svc_name": "channels-gateway",
        "port_forward": "8081:8080",
        "platform": "golang",
        "resource_deps": [],
    },
    {
        "svc_name": "documents-gateway",
        "port_forward": "8082:8080",
        "platform": "golang",
        "resource_deps": [],
    },
    {
        "svc_name": "root-gateway",
        "port_forward": "8001:4000",
        "platform": "nodejs",
        "resource_deps": [
            "accounts-gateway-dev",
            "channels-gateway-dev",
            "documents-gateway-dev",
        ],
    },
]

platforms = {
    "golang": "@io_bazel_rules_go//go/toolchain:linux_amd64",
    "nodejs": "@build_bazel_rules_nodejs//toolchains/node:linux_amd64",
}

k8s_yaml(helm("./charts/eventstore"))

k8s_resource("chart-eventstore-admin", port_forwards=2113)

for svc in services:
    svc_name = svc["svc_name"]
    svc_ports = svc["port_forward"]
    svc_platform_name = svc["platform"]
    svc_platform = platforms[svc_platform_name]
    svc_dir = "{services_dir}/{svc_name}".format(services_dir = services_dir, svc_name = svc_name)
    chart_dir = "{services_dir}/{svc_name}/helm-chart".format(services_dir = services_dir, svc_name = svc_name)
    svc_image_target = "{services_dir}/{svc_name}:image".format(services_dir = services_dir, svc_name = svc_name)
    svc_binary_target = "{services_dir}/{svc_name}:{svc_name}".format(services_dir = services_dir, svc_name = svc_name)

    # Use Bazel to generate the Kubernetes YAML
    for f in bazel_sourcefile_deps("//{chart_dir}:deploy".format(chart_dir = chart_dir)):
        watch_file(f)

    k8s_yaml(local("bazel run //{chart_dir}:deploy".format(chart_dir = chart_dir)))

    # The go_image BUILD rule
    image_target="//{image_target}".format(image_target = svc_image_target)
    binary_target="//{binary_target}".format(binary_target = svc_binary_target)

    print("binary_target", binary_target)

    # Tilt works better if we watch the bazel output tree
    # directly instead of the ./bazel-bin symlinks.
    bazel_bin = str(local("bazel info bazel-bin")).strip()

    # services/root-gateway/root-gateway.sh.runfiles/rosterpulse/services/root-gateway/root-gateway.sh
    binary_target_local = ""
    if svc_platform_name == "nodejs":
        binary_target_local += os.path.join(
            bazel_bin,
            "{svc_dir}/{bin_name}.sh".format(svc_dir = svc_dir, bin_name = svc_name),
        )
    else:
        binary_target_local += os.path.join(
            bazel_bin,
            "{svc_dir}/{bin_name}_/{bin_name}".format(svc_dir = svc_dir, bin_name = svc_name),
        )

    # Where go_image puts the Go binary in the container. You can determine this
    # by shelling into the container with `kubectl exec -it [pod name] -- sh`
    binary_target_container = ""
    if svc_platform_name == "nodejs":
        binary_target_container += "/app/{svc_dir}/{bin_name}".format(svc_dir = svc_dir, bin_name = svc_name)
    else:
        binary_target_container += "/app/{svc_dir}/image.binary.runfiles/rosterpulse/{svc_dir}/image.binary_/image.binary".format(svc_dir = svc_dir)

    # Where go_image puts the image in Docker (bazel/path/to/target:name)
    bazel_image="bazel/{svc_dir}:image".format(svc_dir = svc_dir)

    local_resource(
        name    = "{svc_name}-compile".format(svc_name = svc_name),
        cmd     = "bazel build --platforms={platform} {binary_target}".format(platform=svc_platform, binary_target=binary_target),
        deps    = bazel_sourcefile_deps(binary_target),
    )

    custom_build_with_restart(
        ref         = "{svc_name}-dev".format(svc_name = svc_name),
        command     = ("bazel run --platforms={platform} {image_target} -- --norun && " +
                        "docker tag {bazel_image} $EXPECTED_REF").format(platform=svc_platform, image_target=image_target, bazel_image=bazel_image),
        deps        = [binary_target_local],
        # entrypoint  = "sleep 100000", # binary_target_container,
        entrypoint  = binary_target_container,
        live_update = [
            sync(binary_target_local, binary_target_container)
        ],
    )

    k8s_resource(
        "{svc_name}-dev".format(svc_name = svc_name),
        port_forwards=svc_ports,
        resource_deps=["{svc_name}-compile".format(svc_name = svc_name)] + svc["resource_deps"],
    )

