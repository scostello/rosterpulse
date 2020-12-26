load("@npm//@bazel/typescript:index.bzl", _ts_library = "ts_library")

def ts_library(**kwargs):
    _ts_library(
        devmode_target = "es2017",
        prodmode_target = "es2017",
        devmode_module = "commonjs",
        prodmode_module = "esnext",
        **kwargs
    )