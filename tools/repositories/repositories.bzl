load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@rosterpulse//tools/repositories:helm.bzl", "helm_repositories")
load("@rosterpulse//tools/repositories:yq.bzl", "yq_repositories")
load(
    "@rosterpulse//tools/toolchains/helm:toolchain.bzl",
    _helm_toolchain_configure = "helm_toolchain_configure",
)

def repositories():
    """Download dependencies of container rules."""
    excludes = native.existing_rules().keys()

    helm_repositories()
    yq_repositories()

    _helm_toolchain_configure(
        name = "helm_toolchain_configure"
    )

    native.register_toolchains(
        # Register the default docker toolchain that expects the 'docker'
        # executable to be in the PATH
        "@rosterpulse//tools/toolchains/yq:yq_linux_toolchain",
        "@rosterpulse//tools/toolchains/yq:yq_osx_toolchain",
        "@rosterpulse//tools/toolchains/helm:helm_v3.4.1_linux_toolchain",
        "@rosterpulse//tools/toolchains/helm:helm_v3.4.1_osx_toolchain",
    )