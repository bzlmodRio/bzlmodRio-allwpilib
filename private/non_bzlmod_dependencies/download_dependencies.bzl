load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def download_dependencies():
    # JVM External
    http_archive(
        name = "rules_jvm_external",
        sha256 = "d31e369b854322ca5098ea12c69d7175ded971435e55c18dd9dd5f29cc5249ac",
        strip_prefix = "rules_jvm_external-5.3",
        url = "https://github.com/bazelbuild/rules_jvm_external/releases/download/5.3/rules_jvm_external-5.3.tar.gz",
    )

    # Bazelrio Rules
    http_archive(
        name = "rules_bazelrio",
        sha256 = "b439b1fa3ead015d8fb20f804e65fc877d28d39d337b963db011119c6c7a23a5",
        url = "https://github.com/bzlmodRio/rules_bazelrio/releases/download/0.0.13/rules_bazelrio-0.0.13.tar.gz",
    )

    # Roborio Toolchain
    http_archive(
        name = "rules_bzlmodrio_toolchains",
        sha256 = "1c566358f97b093916e150de10b65d6527ad268e5bd8bc0a0a8bfd04b390751a",
        url = "https://github.com/bzlmodRio/rules_bzlmodRio_toolchains/releases/download/2023-7/rules_bzlmodRio_toolchains-2023-7.tar.gz",
    )

    ########################
    # bzlmodRio dependencies

    # bzlmodrio-opencv
    http_archive(
        name = "bzlmodrio-opencv",
        sha256 = "352020dfdfbfd8e748ca158edd0dd11c0b00dc3b348dac35b4a058a7c73f448e",
        url = "https://github.com/bzlmodRio/bzlmodRio-opencv/releases/download/4.8.0-1/bzlmodRio-opencv-4.8.0-1.tar.gz",
    )

    # bzlmodrio-ni
    http_archive(
        name = "bzlmodrio-ni",
        sha256 = "07389511771222245c17b29908f539b8c84ec9acbfdf2abe940f4317f92bea77",
        url = "https://github.com/bzlmodRio/bzlmodRio-ni/releases/download/2024.1.1/bzlmodRio-ni-2024.1.1.tar.gz",
    )

    ########################
