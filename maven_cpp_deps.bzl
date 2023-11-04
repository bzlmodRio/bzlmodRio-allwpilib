load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_jar")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

filegroup_all = """filegroup(
     name = "all",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

cc_library_headers = """cc_library(
    name = "headers",
    hdrs = glob(["**"]),
    includes = ["."],
    visibility = ["//visibility:public"],
)
"""

cc_library_sources = """filegroup(
     name = "sources",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

cc_library_static = """

cc_library(
    name = "static_libs",
    srcs = glob(["**/*.lib", "**/*.a"]),
    visibility = ["//visibility:public"],
)
"""

cc_library_shared = """
JNI_PATTERN=[
    "**/*jni.dll",
    "**/*jni.so*",
    "**/*jni.dylib",
    "**/*_java*.dll",
    "**/lib*_java*.dylib",
    "**/lib*_java*.so",
]

static_srcs = glob([
        "**/*.lib",
        "**/*.a"
    ],
    exclude=["**/*jni.lib"]
)
shared_srcs = glob([
        "**/*.dll",
        "**/*.so*",
        "**/*.dylib",
    ],
    exclude=JNI_PATTERN + ["**/*.so.debug"]
)
shared_jni_srcs = glob(JNI_PATTERN, exclude=["**/*.so.debug"])

filegroup(
    name = "static_libs",
    srcs = static_srcs,
    visibility = ["//visibility:public"],
)

filegroup(
    name = "shared_libs",
    srcs = shared_srcs,
    visibility = ["//visibility:public"],
)

filegroup(
    name = "shared_jni_libs",
    srcs = shared_jni_srcs,
    visibility = ["//visibility:public"],
)
"""

def __setup_bzlmodrio_allwpilib_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-headers.zip",
        sha256 = "8353e0b22ae9d02c93011d8dcec3f1ee122a208f593bd8c97f768b47d999b346",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-sources.zip",
        sha256 = "d87e08881fb78031eed61c2bbab2b89881fed9d9b6c96be22e1c7e237cf3c87c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-linuxarm32.zip",
        sha256 = "1049e82e0ee83c56f94201edf032d51526d1dcceef12ce0dd0aaa822047e7e3c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-linuxarm64.zip",
        sha256 = "62afce9b7da526adb6fafb6b08caacc5200a23b1197991ddd4b0df5171eb09fa",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-linuxx86-64.zip",
        sha256 = "69b5e55c870db24d82ded780c790feaff164869f796c3872eb32dc4e962a07e1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-osxuniversal.zip",
        sha256 = "56e9ec0a3919ad8d6161a7a7f1d1ea7715c0de69eb97bacd08311f4dfb537205",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-windowsx86-64.zip",
        sha256 = "8b1405a0673b821135592ee1318155e6db7b9c64d103556f5afe0d1a16faa9a9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-windowsarm64.zip",
        sha256 = "66e9aa5413245f971c390bcc6880149c30daf6eb1f0cd24dc741255baf1cc5c5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-linuxarm32static.zip",
        sha256 = "6aa1f16e9131c1d1990456dd0823b9f8aaeaa42ef184f3a9e0543d438b6a7943",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-linuxarm64static.zip",
        sha256 = "7cbf9bbf10078b12da78e2f791311c386114b430899d5f58476e8207550d2806",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "90b939b96105147d82cec50944782b9bbe3518e98a1b98f6500f9d897bb964bc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "6f614dabae7fec8fe0f78fa77cb5564484dd30137065fe91944d3ab78c636f8a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "3ae0ef9edb146a3da6699167b3a0bab674a5251ec0446056c9fcffc78278b8a0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-windowsarm64static.zip",
        sha256 = "269748d51a8032477485688bd0d5d6f2aaf6066d32e3b16a17912260cdda21e8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "a1bd811bb5f7f8647caef91e4ddc59b1cf4b739cc326cc20e74df05435bc298a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "bbf89c2bd015d6690e780b0862f3b6af599ac26f16fa0e4310c531c0ddc146f0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "b1ee653754c133d4100d2860259907b51a4170e625fed3a4cf854da32ca00803",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "5e958ca104a2823fc57969e15dfa57bdb066a8cdfc181efe71535ed8c6eb0f48",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "6b887ad235e3842cd09fd8c23c244b34cac40a3f389f0b53b673c479f2151c8f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "dbb6c80919db5754135b4bf828304973103f98548bb380208ae8cdcaba789b10",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "5894f99ce6cc18c3813222b57079d7960d7c50398a301e64e6d06073f470ba20",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "8a7bd3ca35a6f36850de04647df85aab1fc37b6eca2efc6f06c5325b94e4a995",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "0c2c285cc5f1b5134b2da1b8e159358ce461d2e80b45a9fb45601fe96f0f5eac",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "9100d92610e76780aa0ef18f05e7d0edc3cbe681eaced6bf2dfc769e68b994d1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "c328fd6883bc1b2aa65b1ad419f60a1f627fd88b10b468b1ca4d6bfcd5cfd9a3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "b2ef0b85acaf541af93d66f8e1dbe8c10d8b0ca6af74ebbb0d304512a42aaf78",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-linuxathena.zip",
        sha256 = "a615cb27e9cb439210f309240300f1645ed0e3f16dc22c87287c9be4391febef",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "16283a624bd66da780bc3a6a84feed38c98f60ebc5e5124c49461b50a4a19a92",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-linuxathenadebug.zip",
        sha256 = "f5f04e85497a51611ea9137637e347b0c88ff5a8488a906fcf35a5ffe0eca6a9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-3/wpiutil-cpp-2024.1.1-beta-3-linuxathenastaticdebug.zip",
        sha256 = "af54ce8db91f18d1b1b8383f23d2b39fbd9dca36f29cc91ae5548f345768eea7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-headers.zip",
        sha256 = "1b1ee07dc637a5d70dcd4eab0b5f9037c91ec77d1cb715e4ca85931855aef6af",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-sources.zip",
        sha256 = "78132da4462affaf947b9dd2e0844b0e25ec2bc02abcbdadc5b61d1973d6bef6",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-linuxarm32.zip",
        sha256 = "6bc89f58b2bfd89884d610a28f6b66305de6f9391662ded08cd6614b09caebf2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-linuxarm64.zip",
        sha256 = "dc35be36238b569fa346bcfbf24db239120dbe8d98363104a5eaa6f530e7f07c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-linuxx86-64.zip",
        sha256 = "a7905a3b9bbea753f2923adeef3d24224d6b5642d7846925fd7690e364aaf29e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-osxuniversal.zip",
        sha256 = "4e51f883146fd122697e9e5c63e081421f0466b5105cc88763073d72743de662",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-windowsx86-64.zip",
        sha256 = "6b222e242ab259012fa8410f94e188af327eb19391e1a7e787e9b71ba3bb7194",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-windowsarm64.zip",
        sha256 = "af2627eb4a2cc728f4ddb943390826098a1a25fd55b6b7bf0d9bed9bd86e9fa5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-linuxarm32static.zip",
        sha256 = "8a8222c1f7fafc486c60aac27303588c43c17b7e42814c3b2fc573506d82f953",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-linuxarm64static.zip",
        sha256 = "1049884ad2cbf249c82def48820e395b7e330052b4204471f583e8960611f40a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "b1efec60c570697862718490e04f4907af860639d3950db3ba9b25d6f2912896",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "5244c6e56bb66f869f61378fc353a787eb842bf193521aabf9399c4f40f71673",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "2da1662a44c10f825ab03c8f8d33ff0861c5d7e1e8a152851c86f5d08b87e859",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-windowsarm64static.zip",
        sha256 = "986c075cdf1762d45940aaca86cb1c315f69c4f5fe8300dd89f0b99d01a0f059",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "11a585dc0a9cf4d1b215c63a4b959e092c8c987c478e36c223d36ad04baa2733",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "cce793b0095384a803869634e9653168e60f35adbc1027fde66184ad53c7c434",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "6b513e3a3373083640669b1c62bcc34e6a9328fd2732ea9d711862259c2ea148",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "ab3710c60b51b2ed35db09bfc14487c94be228dd8fbd68349546cddcb9add39f",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "36a98df330360217d3714839c9b61bddc85f948422149dafa6782a672f3cdc81",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "4bca3ebc529d6f032a46a8c4c8acd6d94ea06987eaf573b4e7f5d11d276e7007",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "539342c47570d7671a34551b74a6899cd539544948861bed770dbe77b8bdafe0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "b3efae8de4cba720f59eedcc82a2b480093698e91f4f2785fcbfdf49e7841a6b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "306b7b4982ebb6a73194bc9c15a4bc0b16d5639049524fd21594d4b4e75c2b61",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "7e750e4569473e10a071fa77b1fb06f9265d62547b86afa3abc35338aa70c14c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "7def31452d5f437ff5ff10cdeb326025fac8ff799e2a0f66e2d39e65a6ed58e5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "2b04a53627d0b0feeb8a39ac5aea611ba1bd08397ff682b887af8b9988ce2e20",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-linuxathena.zip",
        sha256 = "34c5872ea2810b4a1230dd92b1f9bfccc9313f9d37c2a8d5dcb96de23e1ec4a0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "d08a316a3d4cd94cccba0d4af2dddecf3b40b5a2e86bfae2fb9b2df41de268b7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-linuxathenadebug.zip",
        sha256 = "10cca80b38d6ba8ac8e3280fd10fc7ef487c1234c64d09c05a47ff2147fbf94b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-3/wpinet-cpp-2024.1.1-beta-3-linuxathenastaticdebug.zip",
        sha256 = "54162fa46a93ca66f3412be9e37532cedcf3cea253a7f5c2a2a4938f8f32d2b9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-headers.zip",
        sha256 = "eff6977a8f736d34da2531ae45380846274924648751888861f44b37047a1d93",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-sources.zip",
        sha256 = "dbba730b01fbbaad09d25f8dd29e2444e40081a6c04be5bc6a777c8c61f627c3",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-linuxarm32.zip",
        sha256 = "940a47f78389ef02b7ccc41efd203b0a36a76f153a33ac6995ea55ee361673d7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-linuxarm64.zip",
        sha256 = "13b6f53d762b55e9dccc12b7f96930e0178b643a1298598c4e013bffb505ab3a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-linuxx86-64.zip",
        sha256 = "6a30250e9cfe09347ba09a2f2b736b3c1fded2a6b1cc01a77289cb1d0e8805a4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-osxuniversal.zip",
        sha256 = "2f389fe0873750697f3c78657ffd51139974e933de129e21fdfe2fbc785faada",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-windowsx86-64.zip",
        sha256 = "569bd469733431d214cbe96334e4ae0d4258ff32494b043454c6d38e3f799a78",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-windowsarm64.zip",
        sha256 = "1947ac1fda89ab040e71ff263f03af35a9c0ae47dfa02a48f2f320935a31d321",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-linuxarm32static.zip",
        sha256 = "8198f9f55b970ba765d28ddf09fec80618d4dd2559928cf64457e9ff88e5ffbc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-linuxarm64static.zip",
        sha256 = "35b2dde8e593f6b9b17b2829ee145307585dc266050dcb810b1471ef4218ff99",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "8245512dcdba4748fd1383ae69d2e96db8f97d7825071477463d46e40120b1d3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "efb84c81c51cac4eadce46ff901669f3ef25eb1b833d57c50db2b9d3c2df6854",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "87441f03cbefc0c6743ed5e0a2f7a10e85c1bae38a8b1f232c9112b5e5afd3fe",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-windowsarm64static.zip",
        sha256 = "316194a829140228b01cc095f84e6cc0763065a44802d4dc207e314ff4d5f5a8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "597fdfbb0415f7e4ccb5484db7ae0c6f3a925abf5e1c4aeefbbae6623a3fe87e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "a4a6d01c1cb8f3f5f8aad4a8f9845f4a146529e28b48790b729b41862e503f9b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "66213343d56ac8fc95166c70942e6a2fe864b4f8cfff03710e4e15763ea8b808",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "fca8c81fe7f575951cb69fcaae12ed2934f2d541bbfff0a06c289e2c3bc5bb31",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "3f9f1040f64eb71604c2b66688ac183898c55199d1d3b44d1cbe125e2fc30da0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "0c63a3a313186a4ca93cd4530138c39f66cf587c1300a7afbfad20291336e77b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "0865bec322787d2352a0006988d4e45cafeb4c2d08814c30b360a636379d023d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "dafc0531cfa94a658fb50bdb86108d5e650a4b43e4e4c88ca1cdd36df300155f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "a20ca06b16a30201618b9dc916bbcbb1f60cafd5bed5b77d94711026be17b4cd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "f2875eb27ed6b1320b0f58f35e725b69617b7db668837618179b829fcbf2bd98",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "5ce4bacfd904f462c2894653bf91fef3d7a93d1eb92250d993447dc23ae37a9b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "97e529b2cfe78743869d2cd22ca4983af5d9d2f4c7a05aadeb71fdc53969a703",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-linuxathena.zip",
        sha256 = "e6af3f11d04fd24f535078bc7a06a9227b517751a0ae5f21fee825f09210657a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "07bb4f44529d13eda7ebc540688d19a83e3b50862d49eaf8f4120ba00e11319b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-linuxathenadebug.zip",
        sha256 = "7b21799b26660c6ef76e100aedde63e35f96bd2b1be9bf0671393593db62f036",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-3/wpimath-cpp-2024.1.1-beta-3-linuxathenastaticdebug.zip",
        sha256 = "16cd7bd12d59c640142254ce56b6976321f44834e3d3e5fda13903c21fceae1f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-headers.zip",
        sha256 = "85d91ef723132c4f4ab0d496ad33b5801904b42b47aa75dc99c0465b8e3e4803",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-sources.zip",
        sha256 = "fa749f50dff98b5e1c7c4659ac75202e1876acc69772d3456b07c5dea97f499b",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-linuxarm32.zip",
        sha256 = "f34b7a63f04d8f7ab18266822d836d742436d2592fcf28c5a53a83b1c637dfa6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-linuxarm64.zip",
        sha256 = "4db00d44d42b82cece1d55fce9ad145d8dcbccf80dee44e8b6f151b33fb289f9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-linuxx86-64.zip",
        sha256 = "4392c9992ed9eca3bdca3bf039d2d650f6913a25d3a492404808c872abbd2e79",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-osxuniversal.zip",
        sha256 = "5befd48ea0cf72b03270890faee40427eee692905f206281e8fcbbd3ec72c2db",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libapriltag.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libapriltag.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-windowsx86-64.zip",
        sha256 = "11272f9b228b6acb0426249fbbb59f999673da7a7de11b160adeea9ff4d75912",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-windowsarm64.zip",
        sha256 = "ef1d78312c2e5b9ba883b2cce6206241968b6a38167b8b26681eff3c124882f0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-linuxarm32static.zip",
        sha256 = "d6cd87bbb8d7e16d92a8c68f306b6c8394ba4eaf1b34057df01c5fab1c8c0d04",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-linuxarm64static.zip",
        sha256 = "7d35782416be93add834d463faded530eb33ba0ed1a0865546d5e124d9ba38b2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "48a729b92077956bc8fd104fe979687aa2a12e87b4b24d48b67416f54a694ff7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "b9f4bb079d7a41629572c9696b7aa55ad24564fa63eea5958aec90c92da4b0ab",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "a49bb35397f1b145c92ad71a297e55c092d36091491417f0b35698992bafd747",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-windowsarm64static.zip",
        sha256 = "ad68bd7f2f31672353a691ac9290eb79b1b1f1b5441ed2f8efa1b6a3974bc7c3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "35e260bb0bc34c7c0e88897e41d869a0d41ec9f55d20a14770b1a96755d36aac",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "cfd119d53d6c9efe86482857eb1e387c94c62f1a7fb88cb621e9817aa2a27f4e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "c80ae88611a68a732becc2faf01d1fe4800b52ed72692eb82a774155874f78f4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "f4b361b269260a0d7fcff0cc17a18f3570361cb11ce2fad7bd5b76df87b9716e",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libapriltag.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libapriltag.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "a1bc3251220382c3c93d38dd0cf952d9a0bb8759dde9bb9ed4bf23e5a29e297c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "07e4fbc446fead10f4837ffcb5555b2c047eea2267e9105e34b726b906f3ad27",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "ac96fd0f0e7920d93bf2e9755082f7aa4cd249258d285d3e62999b0deb524525",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "5395fdc67397119abb2184ae4723063b8423f6d01c592d340a278d73de770f12",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "7e77f8b26eb6f71b178a99df9d64ca88f9ac92a0892985be6058ff92223ee749",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "2e8089384d0ba8a5c91fc4a3da7c74a84131e20a17d2c39bb68144ed6828aaf1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "4b27fbd8c7172ea864408c9ebb18767d4dd29d0ce75b9ec38f677ea06cd65fc7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "d800286a8373e99b3c52eccdc6e68bbe1f6f59e3569e5e4d6782c556ddaf3b39",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-linuxathena.zip",
        sha256 = "d7c37f70ee30817e1d61bc6dce750c03d3e8f9e74db7d3ad6b2eb0b5759c2e45",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "294241f5147f5bd83d77e8c3e033b30b08f4eeade5cbe654a5fa7c98671b3ee2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-linuxathenadebug.zip",
        sha256 = "30022b985d03b95dce00f71b8bbd34beac05730b41c3567c38ac153d150d2100",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-3/apriltag-cpp-2024.1.1-beta-3-linuxathenastaticdebug.zip",
        sha256 = "ff7ab54dc19a5f9b8be91e519ebe2858730cfb2c9c425251de15ea2b80b00a35",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-headers.zip",
        sha256 = "35f7ac833210be3bcced6cc82facdb3c85a684f88ace88ca4c72f7b7507305a0",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-sources.zip",
        sha256 = "875f7b01512b50903b8baa00be0b2987abe3972dba36347de7f156e7371b2ede",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-linuxarm32.zip",
        sha256 = "daca69ff54a643ded43e70f8761315000a80e2a6c1f174f8eb9cd6ea981eb3e0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-linuxarm64.zip",
        sha256 = "47efec8c9a7265a45af3a80deb5ab648df732c00c1f145120d59247a707dba9c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-linuxx86-64.zip",
        sha256 = "6b977f0963028330d32be9a4e1e2c036f044c3fab4fbfc3d66cb07cdbe8aa82d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-osxuniversal.zip",
        sha256 = "6012550830c5ac5d0acc937d0fd78c63a8457b0649f3cf1d2ee555349e48cefb",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-windowsx86-64.zip",
        sha256 = "e2fce8aaa6e5770cb957dd63f27cc93ae7d77d604fd044a4d26153dd30396a48",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-windowsarm64.zip",
        sha256 = "11fdbae83228a1bfe40bf7f2f08b4998c4c9208f8cc9eb8a1d4eaa3dda2ac8fd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-linuxarm32static.zip",
        sha256 = "655f9de5be2a1c2229d21a467ed78fd71614cc03961504691f1e0126a8bddb62",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-linuxarm64static.zip",
        sha256 = "8d9789708eb873d7a1588edba8438b63ee5df14a5c1a4b1f5f185b6828fe029a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "4c0183a7d8f053b0a4a4386a241a8c5aad197d16d6c2298ca4e4d45e274d0e9b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "990d3dd1a87fc6b55d1d017a7acc7dcf5c7155a981467fedd771a9eb1816cda5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "03cf764ace23c73f610812f78597efde0c8ab4baf1d4d1c9872a01cdc290438b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-windowsarm64static.zip",
        sha256 = "b96f5f517c45ace4534fa3db929f50df505c8bd886d7f1ba8f2d75a137601002",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "42ef73c3ab578a4e60d91fb735c273b34ce32e250a02f799bcddace9ad1f06fc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "39d9b04575331abd92a5a10699db8b04697da3fbfe11d2aa348b1ff902c8b5a3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "66d8eb9dfdef51dc07b6271e2864a30e8353ab3db9b41df438601ef8f2e3f898",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "eca622ebc655fa6665187040b2709a283b7da72c79692cad8655027fb3e900a8",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "838b7e61bf2edeeffef96130a6bdfa67274090594558484203ad2d212e3014a8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "a2dfc44688e0eb72dcc845781fdb525b3ea46ba37e2174c5861dc490e3b8a196",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "afd3e69882a6502bef85138bea6856c32f4ec735003257f2e502b03b66145b5e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "2b98b33c4329b204aa33240fb06293db848afcd3c91e59c5c0df24e3836dbb11",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "35d3c6270f3cc5762c7c156a55bb4616137fd11f36883971af86f9f9ded67670",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "a04c6586647a4e41e67fc278b7554a72872629d9a4eb109c0cfdf89b414c0f02",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "6a9abab719e30a435205cf9439c4175b84f0daa7413d9693f098b96eba5b967a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "6ebef084a66ae9485d099acdcc389d20ab99ba964c2c095dcaaf1646608e57db",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-linuxathena.zip",
        sha256 = "47f351abaa2f4f5481b17619bada74d385006cab93371300e9eba9b0da01bb90",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "97949ff62d4e945f954bcfa7678bf01e2e15614bc19426a941dd6e7962bcf2fd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-linuxathenadebug.zip",
        sha256 = "4ad58306a768486365acbd813112f9a5ca84cd12e8d9bca35ee6b5e49ecff620",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-3/hal-cpp-2024.1.1-beta-3-linuxathenastaticdebug.zip",
        sha256 = "92f6cfe091f9a55542574c190c0af6acaec714f1a583eadc24906ed426411c4c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-headers.zip",
        sha256 = "db3588dd197e1815240eb49b8100b216873baa0afc52ae49fc583e0482033aab",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-sources.zip",
        sha256 = "5d878ed459d9c7934210dd1d0253cf8b10d4a0cda8688944161fdaf7ce92dd09",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-linuxarm32.zip",
        sha256 = "68eb7c74b25def22baa0d25e93b5ad08130d11d02736d237a108ae72971a345a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-linuxarm64.zip",
        sha256 = "227d29ffdda88e0bf04f01a30ede56705bea2e86ab612ec49d96e5fefee91c88",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-linuxx86-64.zip",
        sha256 = "4aa6225d9b747da30567f67f4d835c9d81e0f940a2be67dce0a38f834437ddbf",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-osxuniversal.zip",
        sha256 = "cddd5f418ca476b1a845ed5c8a36fc0fd86c9d08ac89741ed05d3a903e38f46f",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libntcore.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libntcore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-windowsx86-64.zip",
        sha256 = "0b18203a4a8ac0171b05d86fcc47b4a004ee71c20040d9958731d560cd9b1743",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-windowsarm64.zip",
        sha256 = "c843bb376d7e0e44632bfc89ba7b586d8e500b8856084904f03b25fd1d7bfd72",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-linuxarm32static.zip",
        sha256 = "035bc0f49fbe290e33baa9d1e16eb948f04ffaae815f64051772653f7d763dfb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-linuxarm64static.zip",
        sha256 = "9282b6ea75a241e2146448edf17ea7ac9c4e82a8e86c6428a0e0e141401f1a60",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "ec134f1e04e664cd63682b93b54eb41c9625e6eb529d8bbe597288cbe5e1cc13",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "6510c5c093cfbc96c6daea183879ba7658864eeee027412d59f5ca00c61f3554",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "49ca533baaef4359522e875a3e6eaecabdad300acceaa409837c082d2ee769c4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-windowsarm64static.zip",
        sha256 = "1c56f65263fb74b34f2d6043d576e785763be4dec5f326f4586d992ac7d5afd4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "28b3dc30a3c4aa4a651f2a8d373d3bc094e65b5aeb30b3e9092a2ac0b701be0d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "804e932a9078b5e2b52a3721942369b0b35b0a2aeaf62a3e6a31a8c52369b9bd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "72099172b3909c400ae9e21147b47b2d0a24713fbb1c46f483afaaa736cb223b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "e6ec85c0905d7f41def82bdfd892baf23bed4dbd060fa218861dc8e943234eb5",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libntcore.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libntcore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "ec9af1f5ae9258e6b0eaf9f1c35940cb54ad5f9af68c0b689bd5c0ae61fe4a1e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "e261fe1d7e38894e1442821546e2a0a9fcc1ffb50b353f0aa0b2efba61ad5566",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "50547d5c18a23ff8d2a5701a2f74cdfc75935a367e231036860b0644e5928f14",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "cc612db36e422cdf6fd215b24fc1cd038cd5247c79c7a4b5f8fbee91381ba502",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "f171440b2da49f7e9cdd41101316f551bdfff63fbb1a51fa142b6e3c2eeb7ed6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "f6cfb7343f2e67bff00007ddca5db34a8012ffbb8ef226fdca934a668506962a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "3ed173b9d7fbf304ba590af03f1a74ed2bd1f61d2f8ef335ed35eecbab85679c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "4ea0a2ee4b507fa129e7bbc1bee4cf47e4635e8e76b7d82ae9d3748cc1f0640e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-linuxathena.zip",
        sha256 = "ee89d8015400ea74083dc253516e9181d8116b1cacafbcb3a4ce70bfb1b967cf",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "43723c33a1ac8f434dbd52e37271d31148e92b8d8937734e478656ec58959e5e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-linuxathenadebug.zip",
        sha256 = "a1da87ff349f048d10ec1fcd90bac321b0b58dd1c587d7adfadd707e81228469",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-3/ntcore-cpp-2024.1.1-beta-3-linuxathenastaticdebug.zip",
        sha256 = "cbd6b98ff282de76f80f0f864cb209ee01107369fca4d9f9e28096ebcec08a34",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-headers.zip",
        sha256 = "fbdbc3d9d94369e728e4e6253955cf2527398cb3b5537d1c51e1ebd00263d851",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-sources.zip",
        sha256 = "d9345ac61770febed7bc7d7aab06d49756182a3af5f581e2a5be684d8135d313",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-linuxarm32.zip",
        sha256 = "de16cffdf599ad41e2896c55e9193d0fcd52e640918969a76f1286943cb6a563",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-linuxarm64.zip",
        sha256 = "04eec8c080d3e94fbf4764320a8a887ffde790c6d6575fd32410d302a0da9a95",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-linuxx86-64.zip",
        sha256 = "5eefbedf13265041e89d351da2ffd5315bb3a1086e3c8905343a85e661cb25b0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-osxuniversal.zip",
        sha256 = "8270272d77b99dd27a1726e482dce09d3a8b7a78de0b9037ea8849348212b1cd",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libcscore.dylib osx/universal/shared/libcscore.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcscore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcscore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-windowsx86-64.zip",
        sha256 = "033eb85de2b153a08e2deb86563e38d0905e47c4a17eb5d7306df800c63f583a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-windowsarm64.zip",
        sha256 = "cdd2ae3184a0387074ca770a1cc2f9cefffdabd5543668d401236056cca692ef",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-linuxarm32static.zip",
        sha256 = "2d23069623032434b9c012d9f785628ed287c19069d89513dc97f6a29b6fc560",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-linuxarm64static.zip",
        sha256 = "475c849bdc69a909cb542b102f7e5416ed53439a4afc3dcd775e5547466e0862",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "6312997ca3651a637fe35d1b70e3ed29c12a59a1641fae942ba6609735ab491a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "8d3b8b23dc0b5c32d485ea7879589b6baa78a5e66ae7f3c8264006258b099d60",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "6b2f3b22f640f5ffe85755af43ddb002c212717b4ad3a0acb3a771a6f9f7dc05",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-windowsarm64static.zip",
        sha256 = "a449a9c0bed7e6337ab7ce764c613b12af1b5187b236787ceaf20523be2def47",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "9c7d23b824b5e196a21982fea1e502eb5a1d2fc82bf4145ec1c323e66d06a0d4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "39556bc17848de215622c466c345f8193d6992ce573aae6827c532b8443f8aea",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "63fbe96d584f58b32a729f2cd41c5883f2b9cb48dfd7b6ffde388f2c5f3cac2f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "1f1b930a0679f7d2c919c25915a9d2386bbe800576fa280ce4ddcc7a9b07ea7e",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libcscore.dylib osx/universal/shared/libcscore.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcscore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcscore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "c095ebc104480126a591f5c44ddf981272100c6f5d977c632d1e77dc200fc374",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "89e5f25e5e74bc6d7b3f6653775e5119c3d64cad9159b5e1a1d76a461f19e7d4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "cd522efd16d568c642d5bed5ff56e720883803d4467cf362ae00680cbd78d890",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "6ba95a2ff2e7cc16f57f6d0f719c3bcaa3ff5bd6a540b990550562a5b6939a8a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "643da104728e03af1847e38e3ea7fa88db39d75a76c76204844c276d9a5bf868",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "94ac4a382733cce765d4715bf7f1f97544e9cfb046b6853a75a5b499c538e097",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "90f2c8a717d8b7eb2d1266df0677fb93bcf21c2c5bdee39a3fc7e1abc82ec2aa",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "dc744a2cc52c4ec7db9fdee8ff434d16bc747f294732207903443606931b8e2b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-linuxathena.zip",
        sha256 = "3f356ad25a8aa390b43f2ea7ba411209c26b8f1289466a72e5c97b14aa7121ef",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "32201e86b38d71afa9bea098a8a5d134373f5261c49dbc953b2b0e0aea97015e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-linuxathenadebug.zip",
        sha256 = "03e3e5dd82c64a2d69f49847fb0680fe3294ab1e0978129190618158030e6113",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-3/cscore-cpp-2024.1.1-beta-3-linuxathenastaticdebug.zip",
        sha256 = "b3d4d61c3600947f2aa9c10e1e3887c094f6d60effe739b0cf5d346b0f6db6d8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-headers.zip",
        sha256 = "fb89ea4d84c038dbd69145b921a133b7ba9adaf9f8b8a7f714103641e8176cde",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-sources.zip",
        sha256 = "c98543c2033a3d389c625f56d4ceafefdb45d202b226957b567b05a055f1d3b2",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-linuxarm32.zip",
        sha256 = "9fe2718c3206639c3f612f4cc0960c56c1358add25c87735766bde2af4641827",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-linuxarm64.zip",
        sha256 = "65195676e0affca145d51f55f87f17a3925bfce917d7801516a05b0e251a7677",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-linuxx86-64.zip",
        sha256 = "fc14c90433e137f03089249bfd3782a4d511616fca16c4f95d85087eaa19560e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-osxuniversal.zip",
        sha256 = "8f2692c822242fd424921e15d4046a00547642acc2240f6a038e09f92d7d1374",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libcameraserver.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcameraserver.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-windowsx86-64.zip",
        sha256 = "380039dca829996875359bd27fd4427cd59d3f104fbdbf15c643b8fe21dd5daf",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-windowsarm64.zip",
        sha256 = "983a3808a41a5da189aafcf31fa8a4c74fa8b6313743122fe0b2f1939e67e0c9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-linuxarm32static.zip",
        sha256 = "4aadf0c5e6b56f4c7632b4ee8f0834cae89b555774114d73054171d7a2425c0f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-linuxarm64static.zip",
        sha256 = "3d67e9c3ec849dad784a9ee38de6d199c282895af271184ae7fa8ea63617beaf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "b2c780dcb37206334d27ec24d4f34fdb1f4740c8325100147e62348e46827ba4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "91519e8c67c2607e77947fd3382c3f9668aae564a9f9037a65cde03dcd85798b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "2ca10db97024bbc092687571b9139a7b1a272f87b709051b0a8c88a89a87eb51",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-windowsarm64static.zip",
        sha256 = "1db9b1ae2ee4651162fcc0c17d21ee4544c4d6017c41f2e7d3a21d2a11eda08a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "0599d4a68494f14b4904bf436706d7c723406f59dd9bc0bf9661d2181d1a18d7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "e106a25b3014a8cec70b5f13fdbbd120be9a49f166a73af89f7fe6463aafadba",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "47bef82a3f8cafe9a934470da1c249c09ea442e11bc5cf926a5582f11733592a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "5a07d7f9d99af060838d33b4f0dcf8d8729ac904e61f4d8db9f8bdfa8dc42d07",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libcameraserver.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcameraserver.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "4fa0f81d7e75792541238ace0faf7d4d63fd8c8c6468d2188f65d5c5fab130f5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "7a3b2bb365c47343ed0388af1b50603a5a342a7bd2459c52562396e524acf8f3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "47ae37d60961c80ac68a2a0813de2ca111935402a1de13a00a8f04c9949bbb60",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "844100297ad2aed711ebc81cc487fee8b3982aadce209dd29e61aa58849a9ba1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "713abc0fd4629e19ad9a8bb37ee8df5a1aa29ad38434cfa89570974db10f2507",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "7772b6c170ca34cdeb50b42dc1dba4a4b5244c9d6df929024051ff02c5ee7d5a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "547b26c6f19c943a00f0646d042eec9975f8dd27f5fe6153c0ce40ff9afbc401",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "dbf98cc032bf4840dce24fd80973c31b749f3f7e8bee282df0fabdff9cf455fc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-linuxathena.zip",
        sha256 = "0581dc77742b40df8e47233362c6f24abd05dc581c0c90cf851137c150bf4fdb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "c1bf39ccb7f904b9573139a4a50f13fd7fe0e114ea9b9f7b77c97244de0f7b8e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-linuxathenadebug.zip",
        sha256 = "650dc039a90a8c7050fc94ec15c7b5e0a74eab7b67df46ff71c905bfdc7923e5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-3/cameraserver-cpp-2024.1.1-beta-3-linuxathenastaticdebug.zip",
        sha256 = "6a20800c9f72a0ce69f30151f237a19609068be1904da20cd58af3a257d2f26b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-headers.zip",
        sha256 = "42883d8acc6ac0194312d016335c13fa20719cea06f810713f0858291e3a1ea2",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-sources.zip",
        sha256 = "b6c8d78f6ce0b78c88bb2d6585c25af24fd4c9fbda5bc8e17f451062fa631262",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-linuxarm32.zip",
        sha256 = "8a04d0b2e8c31a158139923b7b063ca46b4dae4f352c300cdf2a6ff48b65cf0a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-linuxarm64.zip",
        sha256 = "e03b5ac79928cf13d59639cc07b018df32a7caf57a863eae6b1460f2b989889d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-linuxx86-64.zip",
        sha256 = "478ef957cc0fd05c8cc56957581f5b73ed20cacb594910dbdabca6ec09fa662e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-osxuniversal.zip",
        sha256 = "c8105235f28e53afedb2a1747488a21bc7b3cf45003a8fa5c04d2620b9d83b26",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpilibc.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libcameraserver.dylib @rpath/libcameraserver.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpilibc.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-windowsx86-64.zip",
        sha256 = "a66d099faea4b43667ce03100957ea7344132177ddb547d13470bc75a0939525",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-windowsarm64.zip",
        sha256 = "dcdcf08b35ba24ae95042c2c08eb01c6c98ebe8f2cf6aaa1bbcd3ee180d79aa3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-linuxarm32static.zip",
        sha256 = "8ef1966da680da6dcb26ed3a0ef383053e7298ef63fa866bfc32d5a5d461d19c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-linuxarm64static.zip",
        sha256 = "9db223461902669f3f9bce1f8a1135863396e6556b0689536fa7f6cdd764b4c3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "9741b22eae09d539981d786b0e88b57a245b1b2c0236a25e95aca6ac035a1e14",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "b3831cb3ec0ebdb9a1afd0fe8600d7c5b4c972dd7821aff8f39a8f0d6cc278e1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "90bc2f3ba433c52b01ef9f76feb58774fd0208770482619a843549904f46131f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-windowsarm64static.zip",
        sha256 = "348a1250b5a0e428794dfe720d65289881db1c18c9e8a8b9da54246e28b07848",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "35451920a3e6dbc9e4b0918b785cfaad94d52a202b0f9fbdfd51112b2ba4773e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "99209c5696c7e597b1bbf40038e03bb6ebd86de4183c9c1dcdec6e21027555cf",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "9e5b35a9bce7092bfc5fa1b4a26de467512d724d583b962e9f5e97709732af0a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "ed83f22218f3220488203ec1bc02fc3888d72efa666bd1ed26e5001fa47370bf",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpilibc.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libcameraserver.dylib @rpath/libcameraserver.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpilibc.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "446098a4f599b58fa63f80a57d255d8cc5db30921a6cd8c6bf0c345851154eff",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "5c7f4a6bffac2d5927a1b2cfc074889dbba829d4b040f6de682c5a918500f503",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "b0b6176273085789ea456e72d73a49cb1fbb7cbed1e3f07c974de80647419408",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "66d65afd259d36d746a97aeaca9fed41705ff2ff75f33e066727f6741034c42f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "5058ea20c9b2b4faba56de4251474acfc9c4e785d443757dcc4a091df17f1c4e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "46c49bfa06f73250fdce776bc95d1da0b39268c7be5059b27185a44be14becbb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "fdd35202dbd5e5aa95df63959b89d9b2948c4273f201991cf8f966fe11b4655f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "98c49042ec9a243cf5fcaf016af44979554d3615fea8fbac00e17e518cfa8953",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-linuxathena.zip",
        sha256 = "4ecdf8e93fa336e3306354f1b6488a12a4eed69232f4579ef6e398889adcd1e2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "9a09385ddf7f52db5d77643db18914fb5b9014d242a07b2a8af5818d6602aebb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-linuxathenadebug.zip",
        sha256 = "f660fd45bc72ae4a462bb4264d4c8bee8c6517b67ae66ecf02c9c35e33460d88",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-3/wpilibc-cpp-2024.1.1-beta-3-linuxathenastaticdebug.zip",
        sha256 = "81c74205b64b06be22355e1f1016fa18a11a4f51848d058667b7b6bdf14e249b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-headers.zip",
        sha256 = "297f8ff38aa69d03fdfdef2fc9f81d084e7b4c566f67e140269fe1f64d0d8473",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-sources.zip",
        sha256 = "9160e12af9340779fa0ad17f04a6f1675c30f38627b6e5ee21fb3b482997d1c7",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-linuxarm32.zip",
        sha256 = "f4b6dc76ab8ee3404449c5b594e8c1a2d62d73f85bf0f81c7975ce35d73c3307",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-linuxarm64.zip",
        sha256 = "65cf1a12289c2caa870feb0438ec28d8627d397bde065f1c67873f76b6199e57",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-linuxx86-64.zip",
        sha256 = "06b618705ef2688c64535b0c9da842a7e58e6a9a62e9fb8e5fc6855216e0c486",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-osxuniversal.zip",
        sha256 = "a1d20884d183b9cb4da4e638652846f558bd4873d5558192b3ba581e7c488249",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpilibNewCommands.dylib osx/universal/shared/libwpilibNewCommands.dylib",
            "install_name_tool -change libcameraserver.dylib @rpath/libcameraserver.dylib osx/universal/shared/libwpilibNewCommands.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libwpilibNewCommands.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libwpilibNewCommands.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libwpilibNewCommands.dylib",
            "install_name_tool -change libwpilibc.dylib @rpath/libwpilibc.dylib osx/universal/shared/libwpilibNewCommands.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libwpilibNewCommands.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libwpilibNewCommands.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpilibNewCommands.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-windowsx86-64.zip",
        sha256 = "6878a4f48986b9e7cec8bdab54ed78cad81f3bd41df64a340f05034f098a3154",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-windowsarm64.zip",
        sha256 = "028b97627a6406a086c9511e802b0dbccba21a44e46bf89f6b1dc6d04fad05ba",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-linuxarm32static.zip",
        sha256 = "80ed042cfef46fb40a6fa0fd85fcf9e69050bfc66f6fc7fbeaa18b8721b95f86",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-linuxarm64static.zip",
        sha256 = "f3b11bb180f606616bded4c926a2d538ff3d030620e0a4f62af04e3a6ece9c27",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "779be9ab2ee1b2b01626b36be49db474a0c9807432d908141d256deca5d12926",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "f019167b3b570d11c8d21fcebfd9adf3ac27bd27453c0d99afd04807f102861c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "f0a9da679a157cad93fdbf973b5a9f425d9ae1634829bb59a838f22e77115283",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-windowsarm64static.zip",
        sha256 = "03612d888946b7efbc760aff8672aa1f04d4f23f6714aaac05e343d505712baa",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "a742306ebb4dd2a1f057c0b55af8fa4af79aa249b05ea8f4ba5907084076890a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "a848e4e3efb635f20a7169d3503f4dc00a7a6b967d84e57606d31f06889814c2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "1adc7b208e71f36ad7e9b394a19a7c171097c9e6088f0b62bcee44e56fe4a951",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "f36186fd2e54ab084ddc319cad74b5125712be41c1270dde17fcc606379217a2",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpilibNewCommands.dylib osx/universal/shared/libwpilibNewCommands.dylib",
            "install_name_tool -change libcameraserver.dylib @rpath/libcameraserver.dylib osx/universal/shared/libwpilibNewCommands.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libwpilibNewCommands.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libwpilibNewCommands.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libwpilibNewCommands.dylib",
            "install_name_tool -change libwpilibc.dylib @rpath/libwpilibc.dylib osx/universal/shared/libwpilibNewCommands.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libwpilibNewCommands.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libwpilibNewCommands.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpilibNewCommands.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "d95ba4f0ff271ea9bd37dca19cad03e9aa00adb0c4e236d57eb4a8966cfa93d3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "faa331a95346966a4e6201e563a5718b57c238978616ef1022282882f0e219e3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "cf34b4bfa9bb30d432b397cc676ed6aec4df3d3f40e3a258f00bbd7c9fc76f2e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "98a581aa7e9182b99788a166fa9d13c51562ebfed4daf6a2184d1c4085f0da02",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "d4da861a8c0018fe5bd2750c1cf17f43582df67673445e20b1f5765f6ef0a3d7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "826a6d84896effe33411e9f4a5fd56f281468c00a936f1f9385fc09c9e945a0e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "4733c49343895711a3d01fc91cc55e4fa1f39eb2a8040885af1facc841cdf884",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "d941641c1a487b14941e551b52b3efd283031c246789af21ae3b2fb9c2010164",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-linuxathena.zip",
        sha256 = "a40102243efa6bf4102ab4cb335ad24a6e195e3fc32647eed575e99a26f53661",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "3f6767fac18d71f8ae9a17f753ed6350cecfc075dac75d7a2e5af29d9a9b69a9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-linuxathenadebug.zip",
        sha256 = "e955aa69b41c642cf39c98e0e64de83dbe5f8220f33d8e4bdb43a28384911aeb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-3/wpilibNewCommands-cpp-2024.1.1-beta-3-linuxathenastaticdebug.zip",
        sha256 = "b8cacccd5516e1ed9b172a7072dd7d007aac5fadfe98bb111dbaf288e1dd4847",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-3/halsim_ds_socket-2024.1.1-beta-3-sources.zip",
        sha256 = "b7b3cd1df4506c587c88a2744a47b443ae7a5c27e6fb9ee711d8c24d9a4e600c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-3/halsim_ds_socket-2024.1.1-beta-3-linuxarm32.zip",
        sha256 = "3df1291686cd083daec9f2fb2c0bbb9a64bb0accc32fb5ff3dbaf7ef982e7d59",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-3/halsim_ds_socket-2024.1.1-beta-3-linuxarm64.zip",
        sha256 = "7f24adcc0aff56ed135cebbf6144c5f139ca3adae7c7eafc0e15aee85a949171",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-3/halsim_ds_socket-2024.1.1-beta-3-linuxx86-64.zip",
        sha256 = "3826dc19c77b2f14a30b48a6c087740d01ad443a38d54df4b2642b7a984f123c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-3/halsim_ds_socket-2024.1.1-beta-3-osxuniversal.zip",
        sha256 = "95d581503cd08072971a3976477591da895a6b034f967276b2be474b0c3452dd",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_ds_socket.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-3/halsim_ds_socket-2024.1.1-beta-3-windowsx86-64.zip",
        sha256 = "f7ca213b4025f9d6dcfacb07ebbcabe09e0db0935a36be8f6f469333d8ffe14d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-3/halsim_ds_socket-2024.1.1-beta-3-windowsarm64.zip",
        sha256 = "b8e22b4290a7303b8effafa481962283f584a573042423340fc09cdc5f664bd7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-3/halsim_ds_socket-2024.1.1-beta-3-linuxarm32static.zip",
        sha256 = "f92f1af9f92fae00d723fc90b4c3aba465abfe4dde2e9b855093e7ca9b2cccb1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-3/halsim_ds_socket-2024.1.1-beta-3-linuxarm64static.zip",
        sha256 = "8b37c8f9b0963cf472cbec7012c1ad1a4265ad240f55de414528d4feed9d7d07",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-3/halsim_ds_socket-2024.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "c60dd4213ccdaaa770e4b53f81fe1a93163f889cffc7436ac544ca42c6b646cd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-3/halsim_ds_socket-2024.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "a9312f4b029f7ceba2b168e1abeb9c12fa6c517e798d7ad359f510c6f47c89ad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-3/halsim_ds_socket-2024.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "ff46ef1aa5dc1b835608c8d67351f4c7645a2d082c6a303aff0defbbeb968b2b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-3/halsim_ds_socket-2024.1.1-beta-3-windowsarm64static.zip",
        sha256 = "49daa9ebddcac9c6337ee5dcf5a206669b8de4fe81704e80097b60946b2b5b7a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-3/halsim_ds_socket-2024.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "a21c235f66ed3e65c0306f245da4dc235571eec0d14df6712741b783369baf02",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-3/halsim_ds_socket-2024.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "7c06476f4156bb8d97f0d8f84461c4541b22723668f4edba273e2c025c62b193",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-3/halsim_ds_socket-2024.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "86c5e957645a9e457ae543b123d353808db9a2b67d8d814dd71f262429a6cbf6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-3/halsim_ds_socket-2024.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "86db28cda33b0735fdb5e81981737cfd2601d13465b96cda5d375e08fcf8215e",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_ds_socket.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-3/halsim_ds_socket-2024.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "f127be74d19bafb1645f7cedd9ea8045921191a21f2976d3ea2e7ed491004699",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-3/halsim_ds_socket-2024.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "5cb1b6cc54e89d082d23ca612836cac8c7959799d5728b04c57df539ea3e991f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-3/halsim_ds_socket-2024.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "d6d7df9500ce09e42f264df593a1f67823d3759ecf0b022aa5a78638c60f5048",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-3/halsim_ds_socket-2024.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "a11926996ad6e7a3075af198e1e8f968555aa5092ae0417f70eb2cf49f333af0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-3/halsim_ds_socket-2024.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "7ab11e3d73fd6f1582ce118ff6776a2ba8865cf1aab1453e9659364989933bd2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-3/halsim_ds_socket-2024.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "4f92fccac54b56ade2d6b9db7a810a183323b427c4022b8af17d54baacebff01",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-3/halsim_ds_socket-2024.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "5617cf7f95e72d73e396708d981211ab1ffdd12a665dee0b036a455269008238",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-3/halsim_ds_socket-2024.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "a093f5486509d7ae523696848b47b47b9056949e2d8f2bc78dbb49bd2a56598a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-3/halsim_gui-2024.1.1-beta-3-sources.zip",
        sha256 = "b0d340ce90e3176c77418069a0081191dadc2be75419f2a3d2fc3a92df13b56e",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-3/halsim_gui-2024.1.1-beta-3-linuxarm32.zip",
        sha256 = "e6504c5190f7ed04516ded95f01a7a8a46b106309c400f4b12b398cf11ed83c0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-3/halsim_gui-2024.1.1-beta-3-linuxarm64.zip",
        sha256 = "619caa1711e0697a9f86ce7c761349aef80439e71039078fc3917e5be963007c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-3/halsim_gui-2024.1.1-beta-3-linuxx86-64.zip",
        sha256 = "173dd04c51d9f70c226c5da6c313abdba538f8150829440c6396c73dea178139",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-3/halsim_gui-2024.1.1-beta-3-osxuniversal.zip",
        sha256 = "d743782a5df060a4fe89f11e4769a2e0430e3c031c94f304282d00679d82dec8",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_gui.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_gui.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-3/halsim_gui-2024.1.1-beta-3-windowsx86-64.zip",
        sha256 = "5c2932998b0a82f14cd1b502e1d3ce6e386a4e495118d0c30b50cd193679fb73",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-3/halsim_gui-2024.1.1-beta-3-windowsarm64.zip",
        sha256 = "d761bd394eb3e48427012b1f931f2a28113740164b57d1174f07dedd38e5be9d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-3/halsim_gui-2024.1.1-beta-3-linuxarm32static.zip",
        sha256 = "302702d095aa858920ad0e168319ca18dd9ded1ce5796057f8cf5f5e753c3b15",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-3/halsim_gui-2024.1.1-beta-3-linuxarm64static.zip",
        sha256 = "e64c2f71a83003b7f60c5bcc5f0517076c98aeeec3964b868054ecdc985be22b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-3/halsim_gui-2024.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "a730497d1709348a128d76e03b5f21ba6fab4cc96db1eeff7f2a6078849cad24",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-3/halsim_gui-2024.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "491b8c1f5efb4d53060234d82ed0f022f5d72fd29a7909f9c6dbbba06e69724d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-3/halsim_gui-2024.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "55d5bfa118bd9d28b67bf3cbd7b5f761d7c28459fca538840b09c31190499b81",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-3/halsim_gui-2024.1.1-beta-3-windowsarm64static.zip",
        sha256 = "8a4c0e151b73a5d32a097325f52ae7f6f0bb2fd6c0ec3df410b31feeb1ab70aa",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-3/halsim_gui-2024.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "8059ae1690907859b9f652d1ccbba560c3eeb85becab08a61ca2db757d0308e3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-3/halsim_gui-2024.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "08ce534ede2e8afd2769cdfce6a0b9a98e0851fd737cf24c480ce15c700f6b30",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-3/halsim_gui-2024.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "b2fa39d2bd786d473fa8637bd7de0d7b4e73d2cc09488c3d4854d90999f05af1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-3/halsim_gui-2024.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "c948919a406062b03f0ceb2362bdf392cd6f3fcc0839e142e02a0a1e3c5863b5",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_gui.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_gui.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-3/halsim_gui-2024.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "c4cb0f6998e33aad9e62c3fc9930280cacfbb4f132e6e983ce6cecb1bc404d29",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-3/halsim_gui-2024.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "80bee3e220c1939f854083e1db6c5346db2d688a9aa6b34501ff780a2f2205ff",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-3/halsim_gui-2024.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "03489fb35636fed02174087270229322be49544ea7a8704f13b625a240dc8735",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-3/halsim_gui-2024.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "bb8cf8529e551e5e7bdc2f35c756fcc0b182af3fb7b60eb28d34a5a28d095a7c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-3/halsim_gui-2024.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "8a83ab7a3360b3a90cfcb72dd37b040cd36f67de45996f5c8b6fff8c0ba10dae",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-3/halsim_gui-2024.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "429c98c0704a9eca8049b1273d7019a0377fe73a1667b1104b77a654ebb5493f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-3/halsim_gui-2024.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "37333da18f1c6579531233d06bf50086040eed1a75931b4313fe50c03169cc0c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-3/halsim_gui-2024.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "2a5a37624703735113a28dd66d2ba2a08b3542c08acf724cb3db1b576e29d0a5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-3/halsim_ws_client-2024.1.1-beta-3-sources.zip",
        sha256 = "993c889908c35bbb78b4f158d2e5179dd3b04efdce5fbf9588a87820e48fb12b",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-3/halsim_ws_client-2024.1.1-beta-3-linuxarm32.zip",
        sha256 = "8d0e73e3cca184e2a316c295d122766c29dc81c7086ab6f6b7398520538498c8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-3/halsim_ws_client-2024.1.1-beta-3-linuxarm64.zip",
        sha256 = "78fc6b5daade103a915fd072da2a335180a2fcc6a1ea196b3902c1ea8d2a21ba",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-3/halsim_ws_client-2024.1.1-beta-3-linuxx86-64.zip",
        sha256 = "f40d051987e466bce21fa8c3ebe0c4669979b498c2a016ed48e1cb9f7fda531b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-3/halsim_ws_client-2024.1.1-beta-3-osxuniversal.zip",
        sha256 = "1ee473a0275a374ad4e5af9d816c1d0e11b2b87ac20a250aa11f6d54308afd84",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_ws_client.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_ws_client.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-3/halsim_ws_client-2024.1.1-beta-3-windowsx86-64.zip",
        sha256 = "debd277e3df08010f39768a7ab9f82a402e88cdb36f7b2f98eb9c58c86ba6574",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-3/halsim_ws_client-2024.1.1-beta-3-windowsarm64.zip",
        sha256 = "5e7069fa4ec0cfb1caa47399d2fc6d4043c3af92e555f7d823b1f8c11310e42b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-3/halsim_ws_client-2024.1.1-beta-3-linuxarm32static.zip",
        sha256 = "85e83c4cd064c94920a66ae5639b5ef2eb7ae00b6ce7712d824e7ae77dde182e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-3/halsim_ws_client-2024.1.1-beta-3-linuxarm64static.zip",
        sha256 = "74a789a6ffc167aafa3f6be939fa8b410de1a145c3ffc8de311573dafde0aa93",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-3/halsim_ws_client-2024.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "ab5396a1c11ff8a5d9ded798b1b6ae214ce901e8ff9041fc8e141134e7f0d0b9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-3/halsim_ws_client-2024.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "d49ce7826d8dbf9220dd6eb92cbe78c261acbf251aab59b0727d4ded90f1c94f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-3/halsim_ws_client-2024.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "1c189658739334b77118f40b89e5bff7a179055c0f715a041e36c291960ee111",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-3/halsim_ws_client-2024.1.1-beta-3-windowsarm64static.zip",
        sha256 = "b4650bca1ed24815cfe557dc0c1a62c8db254bd5050af9debd1f6682d633a370",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-3/halsim_ws_client-2024.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "002bee6cec652ddf0fa31b257064493a6fe4252561bed9cfaa0493d2f44a0a33",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-3/halsim_ws_client-2024.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "4be18519df01223d818136996016120faab7d02093df66209b1751a21ffc82d5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-3/halsim_ws_client-2024.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "252d09f3e5fbd38074f5531030a75a7bf62736f6c23b8ac2745a931f2f6a5056",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-3/halsim_ws_client-2024.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "6bcfce269001921f8f0a0b9104983f4dd80f609b8289ab9bc78d7f8dde6363ac",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_ws_client.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_ws_client.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-3/halsim_ws_client-2024.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "2020c020566e9a51c6b0c27384842f1c4b9e27fa6f912809b69af8210830d67c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-3/halsim_ws_client-2024.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "985e85d5f565de7f22a50cd8a1df83845f9d5951e2e09d3f496353bb8df30db5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-3/halsim_ws_client-2024.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "2a6b51e88a7bcaae56bb3f7124e5fcf36de9160758288105ae2cf50d34e89849",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-3/halsim_ws_client-2024.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "9806cfd5a873160a3414c964ef9a248fc58f633fdbb6ff1e732b154f55af4894",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-3/halsim_ws_client-2024.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "80b9afb8cc86fb0f6b58dca51ad17c6b1a13e4e0f04cbaea46f217eb7d7d83ca",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-3/halsim_ws_client-2024.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "1a89a7a53af2a236ff3d5d439f88e3b9b98cdfeae1fa07e649d5e61c5ff68d37",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-3/halsim_ws_client-2024.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "06597481bcc009f3a003d2c13e7383cd27c105eb641d7385c1e68c0c6afdb732",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-3/halsim_ws_client-2024.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "4428b207e9cb16bffdc03d3b54d2ff36c1e8c0e17feef8e6d69226fa300f3b62",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-3/halsim_ws_server-2024.1.1-beta-3-sources.zip",
        sha256 = "dff16e1649238d42cb1c8143b2c7d60cd2d271a5a1ac7c7b030fefe603c9a6d8",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-3/halsim_ws_server-2024.1.1-beta-3-linuxarm32.zip",
        sha256 = "030e785ff29029dfd71f5b4a7fb094bf8f20f98ce355fbcac8b85392ffb39292",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-3/halsim_ws_server-2024.1.1-beta-3-linuxarm64.zip",
        sha256 = "ace872d38a6f1b6f3736f379d525a72cf91ea8233c7a596fdb9abee6dc5e4330",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-3/halsim_ws_server-2024.1.1-beta-3-linuxx86-64.zip",
        sha256 = "6242ae927ce981452020ae61a51b5cc05dca2bf8ad299883d6eb4649dc5f7fed",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-3/halsim_ws_server-2024.1.1-beta-3-osxuniversal.zip",
        sha256 = "477711fcfbcc38e58b702869580a66195f395fc8591275d11cc672516b1406d4",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_ws_server.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_ws_server.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-3/halsim_ws_server-2024.1.1-beta-3-windowsx86-64.zip",
        sha256 = "84d94818b1c66a657a22c58dc5d25fd434dd8e398742fad9fc6560b8e80f1ee2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-3/halsim_ws_server-2024.1.1-beta-3-windowsarm64.zip",
        sha256 = "b5fafeb7e612b192a8a1f4a4563e8fe9f2e63b6ea94003007bb896045f16aca5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-3/halsim_ws_server-2024.1.1-beta-3-linuxarm32static.zip",
        sha256 = "f64e21f7d610628e04e7bbd641f579fd648d5bc30b3772095fa1f10a165755ed",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-3/halsim_ws_server-2024.1.1-beta-3-linuxarm64static.zip",
        sha256 = "38041aa52610525b01b6b3fba4313750c7f25bbdee81a398cfab31dda0eafe88",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-3/halsim_ws_server-2024.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "9e39ec21cd0a5534745e1a153abc99dd8adf9dda15a03e84fc54a00a5237b191",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-3/halsim_ws_server-2024.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "de6c7a6639770effa0321be0d49cd17b65eda734ab1f2f97ca05f0919b3ce6a5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-3/halsim_ws_server-2024.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "d464abc09a352caef8ecfac7f7ebcef0715b0d7a0c01f6a308ce0e0044a83315",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-3/halsim_ws_server-2024.1.1-beta-3-windowsarm64static.zip",
        sha256 = "1264e669808ab3a667ee4f9882aaaf0c8d46175e959b1a887bb24a50bf686cfb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-3/halsim_ws_server-2024.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "778bf7f5a2b6852ecfb591df0ded035e43a6f1f20ee118fb73c280cded65d93a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-3/halsim_ws_server-2024.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "0cfe5bdaf5d30e54f12027de8c4be1b02545bb463178bc200a9889c51ad0782f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-3/halsim_ws_server-2024.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "716850a86fa953ae9b40de613915597c7cb05b8adcc89c1acd0e4c4d0ffa8f90",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-3/halsim_ws_server-2024.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "61aec90ae96cf1b09ac73d01289cfa77adbe628b7ae72434f99f685c703f30f8",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_ws_server.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_ws_server.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-3/halsim_ws_server-2024.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "4e2bfc23335a2354bdcb02daa175fd1cff3c60ef02854c0b371e3a27552713ae",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-3/halsim_ws_server-2024.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "94703e295dd423168704cdf01f212491b9b63614fc406094cc07bdb5f8b2e13c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-3/halsim_ws_server-2024.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "710c4aca0f59a2fce79c975388c2c96e73c5432a1231820d59402947330fda96",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-3/halsim_ws_server-2024.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "952a691b15e5e02f504c7fadeae7c87e5f70a368357bf8429d4d9196d2a4aee7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-3/halsim_ws_server-2024.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "3834904ad551715991c09faeded0faea960917de3b31724ce83a49757946b6d3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-3/halsim_ws_server-2024.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "8404ac49458c55563306baae96d972df03cc3a562d67238be219639e1d5527c1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-3/halsim_ws_server-2024.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "6ff999471d628f241361c7949fd396a8697101104cb6922479125f8eb170fb28",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-3/halsim_ws_server-2024.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "ad2e05d18d9800e67c91d52d2b01a39f1e38992efee3aaba296c598d506f822f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.1.1-beta-3/SmartDashboard-2024.1.1-beta-3-linuxx64.jar",
        sha256 = "b9a120950b8b83cb994dde6eeb31e075123c754d73644b1747126ed7fd512d35",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.1.1-beta-3/SmartDashboard-2024.1.1-beta-3-macx64.jar",
        sha256 = "31196fc6cd7aed2eb4312853a995b5a5186ee88b217d39b5dcc9cb52faf129f4",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.1.1-beta-3/SmartDashboard-2024.1.1-beta-3-winx64.jar",
        sha256 = "af2d2ea4b4fcad07cc6ccd67cd91d0ffeb7a8c2ac2afb215362af9d07c615ccb",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1-beta-3/PathWeaver-2024.1.1-beta-3-linuxarm32.jar",
        sha256 = "d343e1597cb0a82678e89af4ad553a7c40582aac41880c9d497d916556001f77",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1-beta-3/PathWeaver-2024.1.1-beta-3-linuxarm64.jar",
        sha256 = "3bdf33612544d8792c9c994d461ef15897b34db1b6b252bc7ddb737c78aef9f2",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1-beta-3/PathWeaver-2024.1.1-beta-3-linuxx64.jar",
        sha256 = "aa4d7985baced67c9929cbbc4cd1770006bdedcd6e5d5793ce117b1855e930a6",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1-beta-3/PathWeaver-2024.1.1-beta-3-macx64.jar",
        sha256 = "7cb7133bb234873e6edeb1dc1b13257130586f01fcdf73c085a5ec2860e8da27",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1-beta-3/PathWeaver-2024.1.1-beta-3-winx64.jar",
        sha256 = "4c0509acf1df82ccb11a31aa74c3e34a13a7584b16e14e5138979f297f2b5fc7",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2024.1.1-beta-3/RobotBuilder-2024.1.1-beta-3.jar",
        sha256 = "cc1c5004f83ad2319b9f857a0fd757f6439482308a7dfa73228e5e05db0f781b",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-3/Shuffleboard-2024.1.1-beta-3-linuxarm32.jar",
        sha256 = "e284282d4625f431fa5303b4e5442ebcfd53bdca3f0bfb611d848797cd14a5c2",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-3/Shuffleboard-2024.1.1-beta-3-linuxarm64.jar",
        sha256 = "03054fd5c763dc34ed1cc05852f98850fd06f7d4b1244040a1d04c7beb769416",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-3/Shuffleboard-2024.1.1-beta-3-linuxx64.jar",
        sha256 = "6548c57d68e7bc28f58bb51a475cf7f16c9b17104f658d8403a4b51b66f49b5e",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-3/Shuffleboard-2024.1.1-beta-3-macarm64.jar",
        sha256 = "ac5dfc602d9721203c257dc09edeb64dea4dbc18605b8e3c332664ae11accd90",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-3/Shuffleboard-2024.1.1-beta-3-macx64.jar",
        sha256 = "e62f2b94de93cf14fbb5332a122715a34a3286c8250444ecf482cc44415c49a2",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-3/Shuffleboard-2024.1.1-beta-3-winx64.jar",
        sha256 = "d533397ca5440284e2573f5cf9d73bbea7a56a42c897724a6710f3c1ebb3785b",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-3/Glass-2024.1.1-beta-3-linuxarm32.zip",
        sha256 = "dd1836529c374314ed785980dd91c444db2b47f5d3809eb4947ff77532b6b61f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-3/Glass-2024.1.1-beta-3-linuxarm64.zip",
        sha256 = "752e24952bc8e91049bdb391fe377427d56e72e266dd9e95d7a10d6e43471cf9",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-3/Glass-2024.1.1-beta-3-linuxx86-64.zip",
        sha256 = "4600669e7ab075d7993ff435786932ff58995d21cf6ef2999805c1926e9d62da",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-3/Glass-2024.1.1-beta-3-osxuniversal.zip",
        sha256 = "0c3a41271dde5488dff48e1c48304dc41d23744266a2f22781be0143a4bbbb48",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-3/Glass-2024.1.1-beta-3-windowsx86-64.zip",
        sha256 = "b027b865e2c224292b098b116a5990c9e26e01b3cc669c8d8cf43c2d40bdec4a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-3/Glass-2024.1.1-beta-3-windowsarm64.zip",
        sha256 = "c7f0b5d6421ee26678d045dd70420c882e23a88316e9df4e7e1f6dc763635a0f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-3/OutlineViewer-2024.1.1-beta-3-linuxarm32.zip",
        sha256 = "dca3d955a3bb26689d2dccabfe52c3506564127080a5ae371f446fc29872f443",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-3/OutlineViewer-2024.1.1-beta-3-linuxarm64.zip",
        sha256 = "9caacebedfdc6f0a1d50e937f2c625895095594146d67f2fb13c2217f83bd672",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-3/OutlineViewer-2024.1.1-beta-3-linuxx86-64.zip",
        sha256 = "efc82b27c89de8c1841352de1681b94f0f0a9d93cf6c6e5cf0191da4559a17e8",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-3/OutlineViewer-2024.1.1-beta-3-osxuniversal.zip",
        sha256 = "b798ed351c4dedad80515d83e61240ebcd1de9ba0b5ef15820bb2b8f8b7cad3d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-3/OutlineViewer-2024.1.1-beta-3-windowsx86-64.zip",
        sha256 = "86b5e9a151a15c225d694dab6f21284f469a54329219cc72060ce0bfb6fdb481",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-3/OutlineViewer-2024.1.1-beta-3-windowsarm64.zip",
        sha256 = "f197ebe8dee6fbbfa59be8cd3d485e53676bd352f646de2dabed3227d11c5290",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-3/roboRIOTeamNumberSetter-2024.1.1-beta-3-linuxarm32.zip",
        sha256 = "6a1a5a75d5e8b8a592bf6c3ae4fd30b151c941970a9e31e986e5936529fe8a6d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-3/roboRIOTeamNumberSetter-2024.1.1-beta-3-linuxarm64.zip",
        sha256 = "3604d210d5ba76c883509b0e86d3f0db609b73553c35f848fd26752e720e3365",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-3/roboRIOTeamNumberSetter-2024.1.1-beta-3-linuxx86-64.zip",
        sha256 = "cf5398da0fc2dc04f7d88cb75752a43f714d3de7a9382b4785b4d126ff87fa8e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-3/roboRIOTeamNumberSetter-2024.1.1-beta-3-osxuniversal.zip",
        sha256 = "f42c51efd8f1cc6adb8d952d404248a6db2241434d76fa4d107da1f7949bcf83",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-3/roboRIOTeamNumberSetter-2024.1.1-beta-3-windowsx86-64.zip",
        sha256 = "77ddd61e8f9a7934bf6c5927c38c05dd9e640ff2d0bbf028569ada028af6c55f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-3/roboRIOTeamNumberSetter-2024.1.1-beta-3-windowsarm64.zip",
        sha256 = "25e0abfbe933b315a86c535daacada88f75f0eb28c9d49ff61b3ccbd28b17199",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-3/DataLogTool-2024.1.1-beta-3-linuxarm32.zip",
        sha256 = "c0f2e1b663077dbcabbde0b40542c213beb50d7f75803dd4a3cb326004be9ca5",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-3/DataLogTool-2024.1.1-beta-3-linuxarm64.zip",
        sha256 = "7a9c3982f57c64b564a8407cfff3640b7bcf5302e88a0257904216480783dd4a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-3/DataLogTool-2024.1.1-beta-3-linuxx86-64.zip",
        sha256 = "ccb379b0b1bb5609292f53b5a9d311d9746dcd1e4155fd2e0fc338453fa8a9e8",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-3/DataLogTool-2024.1.1-beta-3-osxuniversal.zip",
        sha256 = "182fe1147e153b11dd19413beb3378a3ff9a59dd7c7199373d36623f884c9b6e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-3/DataLogTool-2024.1.1-beta-3-windowsx86-64.zip",
        sha256 = "cd54e5a13908617f55c418950e2fa4f3e76ffc56da4ed4aab7b41449e11a7658",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-3/DataLogTool-2024.1.1-beta-3-windowsarm64.zip",
        sha256 = "ecc4d1660b52d901daa4f693c551b902a6839eb1ab9ede9ed2cf2c96030c378e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.1.1-beta-3/SysId-2024.1.1-beta-3-linuxx86-64.zip",
        sha256 = "504b872eb49b0d0f1fb4970c3058b64efdcf7eed4a05870568657d0361321da2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.1.1-beta-3/SysId-2024.1.1-beta-3-osxuniversal.zip",
        sha256 = "ed089940b759a95740279b3b541a4d2009f2abed908120b69d682fc96b510661",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.1.1-beta-3/SysId-2024.1.1-beta-3-windowsx86-64.zip",
        sha256 = "4c5154c9235915e4fabc4c7f284d660faf5e4edde16150c771e9ccda5181953b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.1.1-beta-3/SysId-2024.1.1-beta-3-windowsarm64.zip",
        sha256 = "53698503abc3e121d876807ff5e09be4955f8195ab8ca463e123f1693d305147",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
