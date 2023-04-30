load("@rules_wpi_styleguide//styleguide:cc_styleguide.bzl", "cc_styleguide")

cc_library(
    name = "subsystems",
    srcs = glob(["*.cpp"]),
    hdrs = glob(["*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "@bzlmodrio-allwpilib//libraries/cpp/wpilibNewCommands",
        "@bzlmodrio-allwpilib//libraries/cpp/wpilibc",
    ],
)

cc_styleguide(name = "subsystems")
