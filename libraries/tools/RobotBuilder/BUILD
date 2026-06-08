load("@rules_java//java:defs.bzl", "java_binary")

java_binary(
    name = "RobotBuilder",
    javacopts = ["-Werror"],
    main_class = "robotbuilder.RobotBuilder",
    visibility = ["//visibility:public"],
    runtime_deps = ["@bazelrio_org_wpilib_tools_robotbuilder//jar"],
)
