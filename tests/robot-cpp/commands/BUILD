load("//styleguide:cc_styleguide.bzl", "cc_styleguide")

cc_library(
    name = "commands",
    srcs = glob(["*.cpp"]),
    hdrs = glob(["*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//robot-cpp/subsystems",
        "@bzlmodrio-allwpilib//libraries/cpp/wpilibNewCommands",
        "@bzlmodrio-allwpilib//libraries/cpp/wpilibc",
    ],
)

cc_styleguide(name = "commands")
