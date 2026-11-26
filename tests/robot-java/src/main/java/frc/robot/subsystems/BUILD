load("@rules_java//java:defs.bzl", "java_library")
load("@rules_wpi_styleguide//styleguide:java_styleguide.bzl", "java_styleguide")

java_library(
    name = "subsystems",
    srcs = glob(["*.java"]),
    javacopts = ["-Werror"],
    visibility = ["//visibility:public"],
    deps = [
        "@bzlmodrio-allwpilib//libraries/java/commandsv2",
        "@bzlmodrio-allwpilib//libraries/java/drivers",
        "@bzlmodrio-allwpilib//libraries/java/telemetry",
        "@bzlmodrio-allwpilib//libraries/java/wpilibj",
        "@bzlmodrio-allwpilib//libraries/java/wpimath",
    ],
)

java_styleguide(name = "commands")
