load('ext://restart_process', 'custom_build_with_restart')

load('./bazel.Tiltfile', 'bazel_sourcefile_deps')


services = [
    {
        "name": "accounts",
        "src_dir": "",
        "chart_dir": "",
    },
]

for s in services:
    # Use Bazel to generate the Kubernetes YAML
    for f in bazel_sourcefile_deps('//services/{}'):
        watch_file(f)

    k8s_yaml(local('bazel run //deployments:example-go'))