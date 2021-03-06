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
    sha256 = "4a5d654a4ccd4a4c24eca5d319d85a88a650edf119601550c95bf400c8cc897e",
    urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/3.5.1/rules_nodejs-3.5.1.tar.gz"],
)

_ESBUILD_VERSION = "0.12.1"

http_archive(
    name = "esbuild_darwin",
    build_file_content = """exports_files(["bin/esbuild"])""",
    sha256 = "efb34692bfa34db61139eb8e46cd6cf767a42048f41c8108267279aaf58a948f",
    strip_prefix = "package",
    urls = [
        "https://registry.npmjs.org/esbuild-darwin-64/-/esbuild-darwin-64-%s.tgz" % _ESBUILD_VERSION,
    ],
)

http_archive(
    name = "esbuild_windows",
    build_file_content = """exports_files(["esbuild.exe"])""",
    sha256 = "10439647b11c7fd1d9647fd98d022fe2188b4877d2d0b4acbe857f4e764b17a9",
    strip_prefix = "package",
    urls = [
        "https://registry.npmjs.org/esbuild-windows-64/-/esbuild-windows-64-%s.tgz" % _ESBUILD_VERSION,
    ],
)

http_archive(
    name = "esbuild_linux",
    build_file_content = """exports_files(["bin/esbuild"])""",
    sha256 = "de8409b90ec3c018ffd899b49ed5fc462c61b8c702ea0f9da013e0e1cd71549a",
    strip_prefix = "package",
    urls = [
        "https://registry.npmjs.org/esbuild-linux-64/-/esbuild-linux-64-%s.tgz" % _ESBUILD_VERSION,
    ],
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

gazelle_dependencies()

http_archive(
    name = "golink",
    sha256 = "ea728cfc9cb6e2ae024e1d5fbff185224592bbd4dad6516f3cc96d5155b69f0d",
    strip_prefix = "golink-1.0.0",
    urls = ["https://github.com/nikunjy/golink/archive/v1.0.0.tar.gz"],
)

# ************************************
# Docker
# ************************************
http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "59d5b42ac315e7eadffa944e86e90c2990110a1c8075f1cd145f487e999d22b3",
    strip_prefix = "rules_docker-0.17.0",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.17.0/rules_docker-v0.17.0.tar.gz"],
)

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)
load("//:go_deps.bzl", "go_repositories")

# gazelle:repository_macro go_deps.bzl%go_repositories
go_repositories()

container_repositories()

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

load(
    "@io_bazel_rules_docker//nodejs:image.bzl",
    _nodejs_image_repos = "repositories",
)

_nodejs_image_repos()

load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_pull",
)

container_pull(
    name = "go_base_image",
    registry = "docker.io",
    repository = "scostello/golang",
    tag = "1.15.4-debug",
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

# ************************************
# Proto Buffers
# ************************************
http_archive(
    name = "com_google_protobuf",
    sha256 = "31467dc98fb43e28888357dea67b487cf9f582a47a11e3af0cfebbb0e5f461e5",
    strip_prefix = "protobuf-9647a7c2356a9529754c07235a2877ee676c2fd0",
    urls = ["https://github.com/protocolbuffers/protobuf/archive/9647a7c2356a9529754c07235a2877ee676c2fd0.tar.gz"],
)

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()

# ************************************
# Apple
# ************************************
http_archive(
    name = "build_bazel_rules_apple",
    strip_prefix = "rules_apple-8562971108c11931618a220731c335e9fab9fb49",
    urls = ["https://github.com/bazelbuild/rules_apple/archive/8562971108c11931618a220731c335e9fab9fb49.tar.gz"],
)

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)

apple_rules_dependencies()

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

apple_support_dependencies()

# ************************************
# Swift
# ************************************
http_archive(
    name = "build_bazel_rules_swift",
    sha256 = "d0e5f888b2ccce42c92e6d4686b5507b4230462627f965f9d39862e11ae9fb35",
    url = "https://github.com/bazelbuild/rules_swift/releases/download/0.18.0/rules_swift.0.18.0.tar.gz",
)

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:extras.bzl",
    "swift_rules_extra_dependencies",
)

swift_rules_extra_dependencies()
