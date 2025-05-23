load("@rules_java//java:defs.bzl", "java_binary")
load("@rules_shell//shell:sh_binary.bzl", "sh_binary")

def executable_tool_launcher(name, base_repo_name, macos_app = None):
    macos_subpath = "osx/x86-64"
    if macos_app != None:
        macos_subpath += "/" + macos_app + "/Contents/MacOS"

    subpath = select({
        "@bazel_tools//src/conditions:darwin": [macos_subpath],
        "@bazel_tools//src/conditions:linux_x86_64": ["linux/x86-64"],
        "@bazel_tools//src/conditions:windows": ["windows/x86-64"],
    })

    exe_name = select({
        "@bazel_tools//src/conditions:darwin": [name],
        "@bazel_tools//src/conditions:linux_x86_64": [name],
        "@bazel_tools//src/conditions:windows": [name + ".exe"],
    })

    data = select({
        "@bazel_tools//src/conditions:darwin": ["@" + base_repo_name + "_osxuniversal//:all"],
        "@bazel_tools//src/conditions:linux_x86_64": ["@" + base_repo_name + "_linuxx86-64//:all"],
        "@bazel_tools//src/conditions:windows": ["@" + base_repo_name + "_windowsx86-64//:all"],
    })

    repo_name = select({
        "@bazel_tools//src/conditions:darwin": [base_repo_name + "_osxuniversal"],
        "@bazel_tools//src/conditions:linux_x86_64": [base_repo_name + "_linuxx86-64"],
        "@bazel_tools//src/conditions:windows": [base_repo_name + "_windowsx86-64"],
    })

    sh_binary(
        name = name,
        srcs = ["//libraries/tools:executable_launcher.sh"],
        data = data,
        args = repo_name + subpath + exe_name,
        deps = ["@bazel_tools//tools/bash/runfiles"],
        visibility = ["//visibility:public"],
        tags = ["no-roborio", "no-systemcore", "no-bullseye32", "no-bullseye64", "no-bookworm32", "no-bookworm64", "no-raspibullseye32", "no-raspibookworm32"],
    )

def java_tool_launcher(name, main_class, base_repo_name):
    java_binary(
        name = name,
        main_class = main_class,
        javacopts = ["-Werror"],
        runtime_deps = select({
            "@bazel_tools//src/conditions:darwin": ["@" + base_repo_name + "_macx64//jar"],
            "@bazel_tools//src/conditions:linux_x86_64": ["@" + base_repo_name + "_linuxx64//jar"],
            "@bazel_tools//src/conditions:windows": ["@" + base_repo_name + "_winx64//jar"],
        }),
        visibility = ["//visibility:public"],
        tags = ["no-roborio", "no-systemcore", "no-bullseye32", "no-bullseye64", "no-bookworm32", "no-bookworm64", "no-raspibullseye32", "no-raspibookworm32"],
    )
