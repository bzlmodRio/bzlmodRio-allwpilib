workspace(name = "bzlmodrio-allwpilib")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

########################
# Download Dependencies
########################
http_archive(
    name = "rules_java",
    sha256 = "d31b6c69e479ffa45460b64dc9c7792a431cac721ef8d5219fc9f603fa2ff877",
    url = "https://github.com/bazelbuild/rules_java/releases/download/8.11.0/rules_java-8.11.0.tar.gz",
)

http_archive(
    name = "rules_jvm_external",
    sha256 = "c18a69d784bcd851be95897ca0eca0b57dc86bb02e62402f15736df44160eb02",
    strip_prefix = "rules_jvm_external-6.3",
    url = "https://github.com/bazelbuild/rules_jvm_external/releases/download/6.3/rules_jvm_external-6.3.tar.gz",
)

http_archive(
    name = "rules_python",
    sha256 = "690e0141724abb568267e003c7b6d9a54925df40c275a870a4d934161dc9dd53",
    strip_prefix = "rules_python-0.40.0",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.40.0/rules_python-0.40.0.tar.gz",
)

http_archive(
    name = "com_google_protobuf",
    sha256 = "10a0d58f39a1a909e95e00e8ba0b5b1dc64d02997f741151953a2b3659f6e78c",
    strip_prefix = "protobuf-29.0",
    urls = ["https://github.com/protocolbuffers/protobuf/archive/v29.0.tar.gz"],
)

http_archive(
    name = "rules_shell",
    sha256 = "3e114424a5c7e4fd43e0133cc6ecdfe54e45ae8affa14fadd839f29901424043",
    strip_prefix = "rules_shell-0.4.0",
    url = "https://github.com/bazelbuild/rules_shell/releases/download/v0.4.0/rules_shell-v0.4.0.tar.gz",
)

http_archive(
    name = "rules_bazelrio",
    sha256 = "0c5a98476ac5b606689863b7b9ef3f7d685c47ce2681e448ca977e8e95de31c1",
    url = "https://github.com/bzlmodRio/rules_bazelrio/releases/download/0.0.14/rules_bazelrio-0.0.14.tar.gz",
)

http_archive(
    name = "rules_bzlmodrio_toolchains",
    sha256 = "37780b3d3f30de72aaca12d9f80edc4216f6d708bed5b261c424d4dde49e8531",
    url = "https://github.com/wpilibsuite/rules_bzlmodRio_toolchains/releases/download/2025-1.bcr4/rules_bzlmodRio_toolchains-2025-1.bcr4.tar.gz",
)

http_archive(
    name = "bzlmodrio-opencv",
    sha256 = "6e8544fae07ed5b4fedc146f6ad083d0d8947e3efb5332a20abc46601a52a1b5",
    url = "https://github.com/bzlmodRio/bzlmodRio-opencv/releases/download/2025.4.10.0-3.bcr2/bzlmodRio-opencv-2025.4.10.0-3.bcr2.tar.gz",
)

http_archive(
    name = "bzlmodrio-ni",
    sha256 = "5ee1e2d6c1a670eba178eaa5c933f31dccf550b7ab613d4b22c37ead45497c45",
    url = "https://github.com/bzlmodRio/bzlmodRio-ni/releases/download/2025.2.0.bcr1/bzlmodRio-ni-2025.2.0.bcr1.tar.gz",
)

########################

########################
# Setup Dependencies
########################

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()

load("@rules_java//java:rules_java_deps.bzl", "rules_java_dependencies")

rules_java_dependencies()

load("@rules_java//java:repositories.bzl", "rules_java_toolchains")

rules_java_toolchains()

load("@bzlmodrio-allwpilib//private/non_bzlmod_dependencies:setup_dependencies.bzl", "get_java_dependenicies", "setup_dependencies")

setup_dependencies()
########################

load("@rules_jvm_external//:defs.bzl", "maven_install")

maven_artifacts, maven_repositories = get_java_dependenicies()

maven_install(
    name = "maven",
    artifacts = maven_artifacts,
    repositories = maven_repositories,
    # maven_install_json = "//build_scripts/bazel/deps:maven_install.json",
)

http_archive(
    name = "rules_bzlmodrio_jdk",
    integrity = "sha256-SrikyrF2v2lENdqn9aFC//d0TkIE620lR60yXTrWFTs=",
    strip_prefix = "rules_bzlmodrio_jdk-4ecd4cbc97dfbfe2ceefa627de1228e2f2ca5773",
    urls = ["https://github.com/wpilibsuite/rules_bzlmodRio_jdk/archive/4ecd4cbc97dfbfe2ceefa627de1228e2f2ca5773.tar.gz"],
)

load("@rules_bzlmodrio_jdk//:maven_deps.bzl", "setup_legacy_setup_jdk_dependencies")

setup_legacy_setup_jdk_dependencies()
