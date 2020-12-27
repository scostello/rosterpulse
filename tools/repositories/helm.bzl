load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def helm_repositories():
    http_archive(
        name = "helm_v3.4.1_darwin",
        sha256 = "71d213d63e1b727d6640c4420aee769316f0a93168b96073d166edcd3a425b3d",
        urls = ["https://get.helm.sh/helm-v3.4.1-darwin-amd64.tar.gz"],
        build_file = "@rosterpulse//:helm.BUILD",
    )

    http_archive(
        name = "helm_v3.4.1_linux",
        sha256 = "538f85b4b73ac6160b30fd0ab4b510441aa3fa326593466e8bf7084a9c288420",
        urls = ["https://get.helm.sh/helm-v3.4.1-linux-amd64.tar.gz"],
        build_file = "@rosterpulse//:helm.BUILD",
    )
