workspace(
    name = "rosterpulse",
    managed_directories = {"@npm": ["node_modules"]},
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# ************************************
# Python
# ************************************
http_archive(
    name = "rules_python",
    sha256 = "b6d46438523a3ec0f3cead544190ee13223a52f6a6765a29eae7b7cc24cc83a0",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.1.0/rules_python-0.1.0.tar.gz",
)

# ************************************
# Skylib
# ************************************
http_archive(
    name = "bazel_skylib",
    sha256 = "1c531376ac7e5a180e0237938a2536de0c54d93f5c278634818e0efc952dd56c",
    urls = [
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.0.3/bazel-skylib-1.0.3.tar.gz",
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.0.3/bazel-skylib-1.0.3.tar.gz",
    ],
)

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

load("@bazel_skylib//lib:versions.bzl", "versions")

versions.check(minimum_bazel_version = "3.6.0")

# ************************************
# NodeJS
# ************************************
http_archive(
    name = "build_bazel_rules_nodejs",
    sha256 = "6142e9586162b179fdd570a55e50d1332e7d9c030efd853453438d607569721d",
    urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/3.0.0/rules_nodejs-3.0.0.tar.gz"],
)

load("@build_bazel_rules_nodejs//:index.bzl", "node_repositories", "yarn_install")

node_repositories(
    node_repositories = {
        "14.15.1-darwin_amd64": ("node-v14.15.1-darwin-x64.tar.gz", "node-v14.15.1-darwin-x64", "9154d9c3f598d3efe6d163d160a7872ddefffc439be521094ccd528b63480611"),
        "14.15.1-linux_amd64": ("node-v14.15.1-linux-x64.tar.xz", "node-v14.15.1-linux-x64", "608732c7b8c2ac0683fee459847ad3993a428f0398c73555b9270345f4a64752"),
        "14.15.1-windows_amd64": ("node-v14.15.1-win-x64.zip", "node-v14.15.1-win-x64", "cb1ec98baf6f19e432250573c9aba9faa6b4104517b6a49b05aa5f507f6763fd"),
    },
    node_urls = ["https://nodejs.org/dist/v{version}/{filename}"],
    node_version = "14.15.1",
    package_json = ["//:package.json"],
    yarn_repositories = {
        "1.22.10": ("yarn-v1.22.10.tar.gz", "yarn-v1.22.10", "7e433d4a77e2c79e6a7ae4866782608a8e8bcad3ec6783580577c59538381a6e"),
    },
    yarn_urls = ["https://github.com/yarnpkg/yarn/releases/download/v{version}/{filename}"],
    yarn_version = "1.22.10",
)

yarn_install(
    name = "npm",
    package_json = "//:package.json",
    yarn_lock = "//:yarn.lock",
)

# ************************************
# Golang
# ************************************
http_archive(
    name = "io_bazel_rules_go",
    sha256 = "7904dbecbaffd068651916dce77ff3437679f9d20e1a7956bff43826e7645fcc",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.25.1/rules_go-v0.25.1.tar.gz",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.25.1/rules_go-v0.25.1.tar.gz",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.15.6")

# ************************************
# Gazelle
# ************************************
http_archive(
    name = "bazel_gazelle",
    sha256 = "222e49f034ca7a1d1231422cdb67066b885819885c356673cb1f72f748a3c9d4",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.22.3/bazel-gazelle-v0.22.3.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.22.3/bazel-gazelle-v0.22.3.tar.gz",
    ],
)

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")
load("//:go_deps.bzl", "gateway_dependencies", "logger_dependencies")

# gazelle:repository_macro go_deps.bzl%gateway_dependencies
gateway_dependencies()

# gazelle:repository_macro go_deps.bzl%logger_dependencies
logger_dependencies()

gazelle_dependencies()


# ************************************
# Docker
# ************************************
http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "c15ef66698f5d2122a3e875c327d9ecd34a231a9dc4753b9500e70518464cc21",
    strip_prefix = "rules_docker-7da0de3d094aae5601c45ae0855b64fb2771cd72",
    urls = ["https://github.com/bazelbuild/rules_docker/archive/7da0de3d094aae5601c45ae0855b64fb2771cd72.tar.gz"],
)

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)
container_repositories()

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_pull",
)

container_pull(
    name = "go_base_image",
    registry = "docker.io",
    repository = "library/golang",
    tag = "alpine",
)

# ************************************
# Kubernetes
# ************************************
http_archive(
    name = "io_bazel_rules_k8s",
    sha256 = "03b93595d0fb967dcd5a73071a916f23ca9ca9b0a3fba7029bfc0461990f3cb0",
    strip_prefix = "rules_k8s-89ce5528b3c133f4a37f5ca843a3b76eb9769346",
    urls = ["https://github.com/bazelbuild/rules_k8s/archive/89ce5528b3c133f4a37f5ca843a3b76eb9769346.tar.gz"],
)

load("@io_bazel_rules_k8s//k8s:k8s.bzl", "k8s_repositories")

k8s_repositories()

load("@io_bazel_rules_k8s//k8s:k8s_go_deps.bzl", k8s_go_deps = "deps")

k8s_go_deps()

# ************************************
# Helm
# ************************************
load("//tools/repositories:repositories.bzl", tools_repositories = "repositories")

tools_repositories()
