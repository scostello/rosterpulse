"""Rules for manipulation helm packages."""

load("//tools/helm:helm-chart-package.bzl", _helm_chart = "helm_chart")
load("//tools/helm:helm-chart-template.bzl", _helm_template = "helm_template")

# Explicitly re-export the functions
helm_chart = _helm_chart
helm_template = _helm_template
