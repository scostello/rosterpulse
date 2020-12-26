workspace(
    name = "rosterpulse",
    managed_directories = { "@npm": ["node_modules"] },
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# ************************************
# Python
# ************************************
http_archive(
    name = "rules_python",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.1.0/rules_python-0.1.0.tar.gz",
    sha256 = "b6d46438523a3ec0f3cead544190ee13223a52f6a6765a29eae7b7cc24cc83a0",
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
    node_version = "14.15.1",
    yarn_version = "1.22.10",
    node_repositories = {
        "14.15.1-darwin_amd64": ("node-v14.15.1-darwin-x64.tar.gz", "node-v14.15.1-darwin-x64", "9154d9c3f598d3efe6d163d160a7872ddefffc439be521094ccd528b63480611"),
        "14.15.1-linux_amd64": ("node-v14.15.1-linux-x64.tar.xz", "node-v14.15.1-linux-x64", "608732c7b8c2ac0683fee459847ad3993a428f0398c73555b9270345f4a64752"),
        "14.15.1-windows_amd64": ("node-v14.15.1-win-x64.zip", "node-v14.15.1-win-x64", "cb1ec98baf6f19e432250573c9aba9faa6b4104517b6a49b05aa5f507f6763fd"),
    },
    yarn_repositories = {
        "1.22.10": ("yarn-v1.22.10.tar.gz", "yarn-v1.22.10", "7e433d4a77e2c79e6a7ae4866782608a8e8bcad3ec6783580577c59538381a6e"),
    },
    node_urls = ["https://nodejs.org/dist/v{version}/{filename}"],
    yarn_urls = ["https://github.com/yarnpkg/yarn/releases/download/v{version}/{filename}"],
    package_json = ["//:package.json"]
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