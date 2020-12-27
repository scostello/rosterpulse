def _helm_template_impl(ctx):
    helm_toolchain = ctx.toolchains["@rosterpulse//tools/toolchains/helm:toolchain_type"].helminfo
    helm = helm_toolchain.tool.files.to_list()[0]

    inputs = [helm, ctx.file.chart_tar]
    release_name = ctx.attr.name if ctx.attr.release_name == "" else ctx.attr.release_name
    helm_cmd = "%s template %s %s" % (helm.path, release_name, ctx.file.chart_tar.path)
    if len(ctx.attr.namespace) > 0:
        helm_cmd = "%s --namespace %s" % (helm_cmd, ctx.attr.namespace)

    for variable, value in ctx.attr.values.items():
        helm_cmd = "%s --set %s=%s" % (helm_cmd, variable, value)

    values_cmd = ""
    for value_file in ctx.files.values_yaml_files:
        inputs += [value_file]
        values_cmd += " --values %s" % value_file.path
    helm_cmd += values_cmd

    out = ctx.actions.declare_file(ctx.attr.name + ".yaml")
    ctx.actions.run_shell(
        tools = [helm],
        inputs = inputs,
        outputs = [out],
        progress_message = "Rendering Helm chart for %s" % ctx.file.chart_tar.path,
        command = "%s > %s" % (helm_cmd, out.path),
    )
    return [DefaultInfo(files = depset([out]))]

helm_template = rule(
    implementation = _helm_template_impl,
    attrs = {
        "chart_tar": attr.label(allow_single_file = True, mandatory = True),
        "release_name": attr.string(),
        "namespace": attr.string(),
        "values": attr.string_dict(),
        "values_yaml_files": attr.label_list(allow_files = True),
    },
    toolchains = [
        "@rosterpulse//tools/toolchains/helm:toolchain_type",
    ],
)
