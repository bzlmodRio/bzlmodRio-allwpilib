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
        sha256 = "b237805c8429382723aaa50885e3a5b088ef44dba29b5eee22cdadf94b50dc9f",
        url = "https://github.com/bzlmodRio/bzlmodRio-opencv/releases/download/4.6.0-4/bzlmodRio-opencv-4.6.0-4.tar.gz",
    )

    # bzlmodrio-ni
    http_archive(
        name = "bzlmodrio-ni",
        sha256 = "cf1532c896bb95f4eb73c8cf5bac968f74f6986c12de141d8c4f5d8ff95cd520",
        url = "https://github.com/bzlmodRio/bzlmodRio-ni/releases/download/2023.3.0/bzlmodRio-ni-2023.3.0.tar.gz",
    )

    ########################
