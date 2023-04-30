load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def download_dependencies():
    maybe(
        http_archive,
        name = "rules_python",
        sha256 = "94750828b18044533e98a129003b6a68001204038dc4749f40b195b24c38f49f",
        strip_prefix = "rules_python-0.21.0",
        url = "https://github.com/bazelbuild/rules_python/releases/download/0.21.0/rules_python-0.21.0.tar.gz",
    )

    # JVM External
    RULES_JVM_EXTERNAL_TAG = "4.5"
    RULES_JVM_EXTERNAL_SHA = "b17d7388feb9bfa7f2fa09031b32707df529f26c91ab9e5d909eb1676badd9a6"
    http_archive(
        name = "rules_jvm_external",
        sha256 = RULES_JVM_EXTERNAL_SHA,
        strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
        url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
    )

    # Bazelrio Rules
    http_archive(
        name = "rules_bazelrio",
        sha256 = "8679cf2ef1b47c184d336bfef97ac0f98fed56546b69e1a5ed02c17833bbf025",
        strip_prefix = "rules_bazelrio-0.0.9",
        url = "https://github.com/bzlmodRio/rules_bazelrio/archive/refs/tags/0.0.9.tar.gz",
    )

    # Roborio Toolchain
    http_archive(
        name = "rules_bzlmodrio_toolchains",
        sha256 = "b24d5813300ebe9a252c5e1c69a421c0d112f50da0d7b22c8de5efd7bca6babf",
        strip_prefix = "rules_bzlmodrio_toolchains-2023-7",
        url = "https://github.com/bzlmodRio/rules_bzlmodrio_toolchains/archive/refs/tags/2023-7.tar.gz",
    )

    ########################
    # bzlmodRio dependencies

    # bzlmodrio-opencv
    http_archive(
        name = "bzlmodrio-opencv",
        sha256 = "7cf977af07ab17bcefc84daba4975b35f9d0696a46a7b2182ff79141fdce83a5",
        strip_prefix = "bzlmodRio-opencv-4.6.0-4-1",
        url = "https://github.com/bzlmodRio/bzlmodRio-opencv/archive/refs/tags/4.6.0-4-1.tar.gz",
    )

    # bzlmodrio-ni
    http_archive(
        name = "bzlmodrio-ni",
        sha256 = "0169bded6cc9e3fef1092bdafd3216e2f8bdcf247c9d7116f02a2a261c5350f6",
        strip_prefix = "bzlmodRio-ni-2023.3.0-1",
        url = "https://github.com/bzlmodRio/bzlmodRio-ni/archive/refs/tags/2023.3.0-1.tar.gz",
    )

    ########################
