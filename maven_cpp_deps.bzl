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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-headers.zip",
        sha256 = "b1b8c8a17e75ccea60e00542ce5ae233a5c484ffd5aa1a03fbe40d2744389269",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-sources.zip",
        sha256 = "c0898cba707fab8c77c5fac735cf99f4559695e4adc9597c8575c9f7bef59997",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "13a7782321ce7e80ae2a90a1d200a8d89d2bfe25cf7d60da0412814baf776454",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "f88f739827c283eb7d4dd2ac6ed634cb524e4480d46f56ad6fe06a6cd93c3818",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "b9d364d2d8ee651f48cb9a5704c8595396c82316420c066aac7a4c83296060d9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "32a35c4c0c3bbe57b2654d49807e4de600dcdc1e68275df20cb6504e173e51a0",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "9d9d6103a2bdc91cf1dc3cf27867262eb75866c880999148900c219c40f1e3e5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "f1e7ca6a9268e7a578103bd12af9dcbb2de4a7304870b3becf2e315be3d2ddc3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "16b54196563cf0385bdd83a307ade9ecb950f7d3ba0d08853e1b25c00a4d611b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "731711c486ecd57d7660fc2e2373bca8f14bdde52aadc4aa0e350ed03e8b243e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "333dfa7546ca6a7c406dc817cc5e57309115360b0a3199900b67fdc382e82c2b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "cfd847127da6bedf206fbac2561f41a583338f55895ec5817bc7bcc6d42032a1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "56a567164eea12dd6fc2819698fa2841dffe7d0d915002f9ee7936e1e2173159",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "b898c433f9e3221b69f07037e364c0f4fb8de167c785188224959aca07fd1d57",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "b76b80bfe9aeef6afb1fb87e70c62848658db365a76682b9d15d0db15f8e2437",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "e208b8ff29575bef36bbe6c58ad20eabb24b6dca348f46f5dcc9f9ee4a90a467",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "a2e70715c14276489140ccceeb714658d5d35838e25b28b2f1fecb457e691841",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "786dad4c5d11512a351c42ec73404bcd9f6f2497976d5354198bc8e750d28366",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "95b1fc41e824c6942efef03a7a51cc6b533a58b0380b4d266ecbc013e1de1ea9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "c295932927453b3cb98fd2170146c469848a3059854f7a94de32e17c5f561aa1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "7c476d697bd423958e4ba936a57f363502764146e8bb4fb2ffb4a0218f4f91d7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "57cf0f95e1c60ab3ce1a9b3eb0822f1fe9ac6d837d227c6bca00a3910c3a1499",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "611d8ecfcc9a19f13adc6fe695b86d55bd88b9d288b224f0a620d4a1db2e7c1f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "9a4f1beabb5b3dfa99cf36e0e8bddf8facd44b41dd24e8feccd126a91644c06d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "d189ba213efd8b5860ba4dec90896b64c518a5fdd22ecb8f159c2483986c1af2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "ed1c5ce34af8ce3083723dbb66da6d3bc260c36c8f971e668af1a3917c590f23",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxathena.zip",
        sha256 = "448b449346655879cf4fd87ab1e4bc2698167938846d591ee3ed9ee70db3560a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxathenastatic.zip",
        sha256 = "cb39e1196dcf8ce4b18eb900bc2cd726ad42bab02d786cbfe92e31f0183dfee4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxathenadebug.zip",
        sha256 = "77cd6de73ee28359301866ba689364a997d92da4e6802da43844e796cfd51737",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxathenastaticdebug.zip",
        sha256 = "75d320f6afcef33f08747c9c7431cc5ff7f2dcd91f34904c7502ee1262afa431",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-headers.zip",
        sha256 = "8a66425a0a2b10961dc0657d7ddb814d0eebfc090fc347eaadd8a4846f73c44d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-sources.zip",
        sha256 = "64d5c668a4b23fced6f7e4ce7dbea1a5813fa5db5976986cba76d3ff3a60ee04",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "35c185ae65542b3cb373469164538a22cf66d4051c31991528542b3a97f2b990",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "bc639bbb558e18eeace40d886990a6c56885acd4b5a37317e4a4ffd6292be532",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "80c70a409c1ede29b7ee21f3f0a7641d4d527a1cd733f403dd2c879bb1010e91",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "ef7d4aa32ee7efa21f2623f3ea2f7536840cbc08282bfb0e70133f5a8a74a0b7",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "1dec873817ed4aed659432703c635422a35ede4f1d9e61e5905bf1d24df5e87e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "04bb71cef980c5bb7f89d57cd0b87485302d0d01e2f626da2a0fe34004da981b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "963fe1484fc5993bb2dab655e9e284e4306591f98ec1e1d7396b3f8f892813d3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "32526bfa998123469330b1e8e901cf583312d3238a647cc2c9bb9cbfed7b8a25",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "96bb30a98cc1ece37e65be86db02d4e6ed91aadb917ff3e78f34c408183e55c6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "8724f1a74f9fb2a1a060b49d78bde56f81f96184093d4c8fe1b115f4d35e978f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "7e31bfd78c98447ccff29b30ea1447c1c5a3baef4d7ea0201ca09653f93e5927",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "3059ed58ecf57a2d3b28d7a2d23773d1001b7b504e6b809b1ce790d119333451",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "96b6909db3b6d336bc17f37af2f7f95389006072db40a76cf1c9e6552c94b3b1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "9abd320094d5c63c485c471b4e1b0c0358760374acaeacc4c2ca380d56c34b39",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "e7ee0cae947022806180b5d5dd0a892fe11bb129a92633b24bde10bfbbb3f58a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "d803dc17b767631991990773142ab766db1590282b2a526c8a8c4f24dcce44e8",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "52feb52ae8f46ca7e74b1c4e6dce39d142961b3c21d8ed39767233e36c9b6dad",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "52274f37b761a5f1d17ae6ebaca1b3cc2608fe713ef9e92a75e3f19fd8294148",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "250fab14709800e76547a6b23d3fa1805a2aeb500f4453e478d792f6f053a9ac",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "68390eb1e51e44f02f3676c8fb3ad9f7487c7067e288f9a155665f4cbb5ba347",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "ddced32ddeaa5858aa009dc73a7094518b3de6fe1898cdbc3954cb4a74185414",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "65c45ef33ab6c3c3d212b6181019162ca727ef7c85dd3de14c2bb40d9fc934b6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "039b9df2cc297a3706ea4aeb29d9764b73932f4dfe3574204a09fb4f19fc2569",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "6d3517af43c72f61828caaa581cb0ae94fedbd270395b90324448dbf5da00f76",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxathena.zip",
        sha256 = "9f1c859c823e680e867e712d5c9063458f5d3708b0e62144ce25a0dfe01d4478",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxathenastatic.zip",
        sha256 = "ef5fcf194560530bb57d3129e923d9ad1eb455d9fa3768297d788bb719ad56e9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxathenadebug.zip",
        sha256 = "d17d74aad34175bb914b759c8e848bfaa47972d16d4f984edeb4c5d109a21ac4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxathenastaticdebug.zip",
        sha256 = "d749a82dcd168ee04b9b2522a35fb8b7dbb454baa304ba91221393d8137307b1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-headers.zip",
        sha256 = "aeab2a466db44cc78b73dabf6fe13bdf20737b8597ffcb28d0db2e4cd3be986c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-sources.zip",
        sha256 = "36abe3f7792c6d8839a5922e8371d276d0566f39b111a2ac25cbe91aa88b2e0f",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "0c53de08ad88a8b3a5a64118852a7aea7eeedda31037e0c20c16acd81905bc06",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "434802b9995652188dedfe96acefa8813c4bd8e0f6ced8bb00a0fa2ae378bb7e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "2dd72eaa736b963e0083cecefa475c8467e578b92edf04d5b4cd29f445ab1bec",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "c6d9e16a7463eefe6cf142ff6480db21b57ce83878328fe3586615f577f89751",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "3cb84669bf60f5cc70d7c5dff51c590a41c014ddc6ac026a0895f2544ea5b2e9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "54ce123c7bf3dc8c838384f555d30aea9bc3c449944964780bd3cadb9ddc0763",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "ec6b49fc7d838712167b8e7fb9f624585b6cdf83b6fe0712ac948452b219d881",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "0df5f5f84a485ca6fcc00f9a3871e81de9fe1adbfca47418388a2f56008bb160",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "ac9f26ab1e54ac11e56c75b94a2fa1474c3d8390dcde73cbb5efd58b737ffcc9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "66f5a77545ffaed3d4e8fd9549da2a202bf26a14278ac46d6ccb063d86ecda5a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "15aa327d18b1ddf3960116135e0201cffdfa1ab091791ed3fe89a4c58aa01e7a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "9b3daa45b517f7120f8de6a1407226b6a67960c44f894a6443c6a321c30869b8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "29e2f96a67c5baec58bdd64f51e716ffeed7841925b9bd584e67ab36537f313b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "8fbcddfb31064ccfac9cdfcbf443aac1dabee4681cbc17fc9b57ca901985cc2f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "9503bdce99fd8ebbfb0bc9094d1f97a0ea22ada3bcef1a3b39f1135888b0e87b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "47d45df6109a8aec8206752f2bfc668c787f8c21be42c9ae8427621e4df5c152",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "159907ff0731f0fa8978b97eb89d02c93c4b4e8825b56e67ccdc10b484b5a704",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "575d2312bd012f61d54d4214fe9dafd4cce8274e91948956918763d9010ef1bb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "f70e96358f8258b9a140b277a90064c76a3d1061c66768561c6d65e85b565b8a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "debd932bfb0028acdc0393f85856c75c6b9b623953745baa54cffcf00a719d56",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "2442866e5abec127e93832bdb96ee55d54c4ffe0662aff9b1b6262e30feaef64",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "b5c7f40bbf74e82f998218084518b167edd5b925f8af4ac536b6cb4bd86ca5f3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "43d71f6ff9130816a81a0eeffc7567dded4a8dada6a59fa475e8d2fc2deba4a3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "320bce2415cb92eae7a747a2fef8ad21492915ed2b4b8b8c8b0a34f16338d03b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxathena.zip",
        sha256 = "23f797b50e5bc3c960d8501fa3a7fc54ee844b2039c9b00c17d937e8930d5d50",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxathenastatic.zip",
        sha256 = "4b75d74f80c40649efb16d9029c9ba92423c1604af563faff863265696bd2d62",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxathenadebug.zip",
        sha256 = "d8d157a995a0d283385481c8e206e2c7f285254157928f7a622da64918ad4d5c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxathenastaticdebug.zip",
        sha256 = "d72a2140d65a4b216248126965bcfa175c6c1d1feb881ccd22b8187c4b33001a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-headers.zip",
        sha256 = "0b25498446c9fc7b0f7d4ba8cba58e389f5968a29c9b22fae1d897300dcc5178",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-sources.zip",
        sha256 = "554f6a3ac285670450e8e05a0a59ff38bc9650c2845580f66173643978f7c451",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "307a0e8800db0fb276e2144ba4e4f58e3943e47dc35a5eeb36b386900003797a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "fb8b180749e05570d74045c09ce6c804a37dc96b7cb55ef2560c93334f5950fb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "9166ed361e2161b0c54b4f62b1297e3850f072f798c396d8a52a8a6fe177de7b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "d365b38824e4378bc6d3599543d5445416c9d0e6fb7d1e3d325b2bd1bcdf2d0b",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "83526f38a960c5a157e0b5417287421985820fe9b2a0681b43f42385573ff5ca",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "4f06dc3677171f3d6a022ecac8fd314971c471d1603df1d00a6e07abe8541b87",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "c0f763a91447879339fdcace3b6b7a4d7a98e507b91412d93e962b6f9ebcfa36",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "fb925a9cc44fa5fcfb3eeae00f722a85244cfefea8cfe62312e5ef240cc93915",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "1e0e0517c0eba1543e3af257e9f8cc9b6087fb38a73e18c0d171b55c123d7523",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "31ea9e867df6845f05adbbb2712fa0e9255ade3e27e30b5c5504fc8c41012e1a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "2d40ac44819fee71024757b422dbe006503faf6a9c61ab6012c72bd4c0bd5195",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "acc634e9f60736a1e8b51cd0a48e0371f9e938edc80da47887dc371a33c1dd28",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "8748f8a40c346b00a16fdab8899e87720c987dd1bd71fc47095a4af811cf6d0c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "d586e41816ab0616c026112158c5b8a57891daa9af498c227515774598ecaed8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "6a60c333fd09e2ed2a39318911d0a1c7bee469baa22ce787a4ec58c5cdd2a6be",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "5bf58c4d090bd2bf36b3af9e79057fe35a6c887b0563e99452a43df3e942faa2",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "aebcdbbadd077afd55e0de49562371bbf4b8978881867ca2b76e67e23ee7c276",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "b796bcb0fbd6b36daac1d8ca8a5b893e90319d97ef0bd5a59c46a76e3da3b0b1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "2623ccef44509ab19875db569aa032f4ca8ca7872995cbe3ac345c45079f0a7f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "fe8505b6f5d8938bf3ecfd227b4958810a6244077595c4636ede57c0132086f1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "7b8f030cbb30fda2ecd48bd68909503c4061ad383967d7d5e4ff1fb17203c085",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "2c97a2471e958245fe629133defeccec88df95d9fb0b3bcd3b8258e1e332cad6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "f7f130c651825dedae5896a4986cb58be8ececc08ed8616060a7d1844a837b23",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "85f64f457e69a8e522f971be13840c2a8c0ea0cc54b646df637351b9c0fa1056",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxathena.zip",
        sha256 = "0773ab64713c337204938c42965a281adea2bd92130bb10fa0738683bdfd546b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxathenastatic.zip",
        sha256 = "8ff27c0cffa0345759aa833e32a7706f4e87ae9baf2b73664a15681f8c52563a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxathenadebug.zip",
        sha256 = "3d066ee8a07f7125dc68d2a8b10a86ecfd36520dcc64413cfee63c062e452587",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxathenastaticdebug.zip",
        sha256 = "62959a7dbcea32e6b82e27f6395ba4a8c8562f65e2f32ebc4e5eefc2b294f6f2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-headers.zip",
        sha256 = "3616382bfa86d521af652240f1754c1b1c31f045ee39ff25f324b75ee9831a9d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-sources.zip",
        sha256 = "322e0cf87e6dc66bede9fc901d0657b8fb9d6a3f56befad4f757ee57140827f2",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "1422528d9362c977a850355a021456d79a9ab35a9a99bbb0b2756524a82a3eeb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "d7936760b439883bbf5ed70053168fa6f133cec733e8a5c7d57b0f17b621917c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "96eab68a4d9dc21db73bcdd98d42b9fa19dc708282339b4eea37bbba6c5f1d04",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "7e7d92774a8b6429e0f62dc1071dfa0b7122cfa16cb68e8a33c6a84f2fc967ed",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "a4a7e4b7fbce441fd6809e3962e0d59fd42a8acb4d863e698b34837082751fb7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "14b8418d12be435b322df5143e80eca5a3930ef4a88b5879aab492d4073c457b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "7b038aa5a32a3787d7edcf73290c83517ea9bb39a7395abdba8c76dfcb76779d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "63ea3ec9542b0d8ba8747ebc29b101857a2ec97e5baac310c1ddf0898e0e4bb4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "3effccfdaa0ea4b687fdac72c4c2c39da9ef5114b1a7766dec1257278dcdc0db",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "4d535c27b9ba531d1654d75aa97e08b169fcbc13e8192857e4d67d2823ce27cc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "1392c8af58c84a54a51dd42ab9a0a4c408eebd70332b1e648f63850d8de74478",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "2bed820ce2d53575aff8f27189ae06fa1aa2b75d35d54454a995a4e8a3956982",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "63dbf6a63b72dcd4363b37d35fb29e61d1ae2b84e94e6f51a72586c7c1103d1f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "652f4b2cf2d1da8cde74d9829f8c1754947ebfb454d55f2e6d28cf4f8d30e2a1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "9b22946f49fbd1567f420bf9cc2d047f5b6c1cf7400455b5062b2b8749211a31",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "29ec625936e5da4b49e38df9530c98b3acb1fa42f258657480cc5921a0aef20d",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "be1f65fb0c39a9f21e49bb26f88a8e910d64fdbca743c0ffed6cbff45c643d4e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "979b4fb22618a3d9f321599a211ccc4492130159dd1c4d82e30c6e0f5a507f08",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "6e6f8db4a9ab1497d5795352aa9e2631175c8480f84f3ff50f81bd260c9296e1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "615e0718e946982477824263af447a48a2317114b5a47de4ebe17dbaf35a0a45",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "e6e280c9440e05a71d94d5c09552de777cfe300af00fff4df2be54e57b218e2f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "a877da781af288d47776ade97becb80d5a2c3c4067201d1010cbce7b380eed24",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "55e13b30b6b3b99a0422ac42e7e090ee734eeaa6cf6334312547e11dd9c013fc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "c22b09ae5dea167f076762f49aed8005668e9be2e1ea7190b01b9d6f8388115d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxathena.zip",
        sha256 = "0a74acd05f31a06148d68ea1f8e9a55ad90b0efcf275a791548238bc2aac980a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxathenastatic.zip",
        sha256 = "c3813d6644a743b7db29288ae8cf1753028f0bff16ad7c571ff21e542552cb3d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxathenadebug.zip",
        sha256 = "fc1c7a55b11f4ce2e25c3e62006707d2c93564a9b801a21a5d1b9bfec07305ec",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxathenastaticdebug.zip",
        sha256 = "b833f4577be82259cd26fbc0471b028d728a5c66ce43e8d03b56c3f59183a270",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-headers.zip",
        sha256 = "15f01cb08ab55a6bbe9bb3e69f26bd7eb29a07887ee4f667af3260c89c221802",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-sources.zip",
        sha256 = "cd6cbf73d3a3c1dca3d611a47517f7ebf758ba1177f2c08ad89f0f48411f60ff",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "f15797d58977c362804473c0c2ebd5ec9c7919d1acf4e05441c200427c40aac5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "ffc6d6f7649c93a4e8bb91deb44ce52810f44b6107b78c77051d137def117d70",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "efa1eaffc565c9199bc253b4c55366c740f2487380edf2d82e851e57ee63ca2d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "17f426e31d0c7f2a82b78eae73b1e74d64271d6f6778817c2411811b1e40e738",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "b7d639a1cb2f3ce2229d8a4504180abb82c3c16fc99e0e07b2bfa75506b63666",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "2a9a49f1a77f3c4a9c58084fe04350eadc3865dcc7ae42ddd88893ab190eb714",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "b1afaf1731b356da452246f09dee3ba28b98d9130676dd7df159ca805bfde35b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "5d6eb72ad581a722d907fa29f4984278a2d9b9ff415e8687fd82d714fb89ea86",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "de676f117f855aa5da6b025e5af2085921c8b50a7d7b1588c4ecb09ff2cd3670",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "a9b3ad7855321870d9b0d29bc4df40ee499649c1748f3469814e01148eeec3e6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "f2dbd932f2065aa8ef8c4aa7db4a0d97a0f62c2cd6b904e200a42cc0935e03df",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "ba4d2773d9ff3c1f6485e9487791ecf6c4deaa57aae4054f4518437a6d46c5c0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "df5850a6a7b2e16fbb6e1daece0fd952ae47141a8599efd2d2760013009ed03e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "28ac7cdf122f352fc456051f6299991a3992d516044ebd6e0d239db0548ab190",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "bbf656859c4d0414b35b1368a18f1170c08ee878adb9b7faabb3588e4d2f647e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "e8815d253bd1264b90ecda84b90542b88d23b1f284f10d85725ff8757a7b6f1c",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "5ca2556052bc80e52823eff7c120be1fa42b0c949eaf7616d4a1c05bccd1f158",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "ecae388d31e16835f939ea6efc38c9c569877fd5385e14be0acb90cfc9880820",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "7b6cbca9e1703ed66de509f5eaecfd72a6ac19fb803d53b70e9349ceea9fe3ad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "8fc2a63a8806f7644ef499977b7014ab3bc075bdf5fcb327222deb83cc8b0c03",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "b0c6f0c2803f2c689ea0b23b681601690504548c2bcb998c14dbbf309cad1540",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "6ecf21e64119a4087c0152e18da605619dc9929a83cf37e41925b1c040806e0e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "95ca84650d8001b946788827c6c57413909ea879345533a26d1c5ca19f9ad6f1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "508ea0f722515aa37a9d8c6f7db8067bed6d00c21f879b1d2bf27fea43216f9a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxathena.zip",
        sha256 = "0ee88caf059d32d01b7ede4aa26fad0da056660538890de1a46c86afeaa593c4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxathenastatic.zip",
        sha256 = "fe6ab535246c7400e6c30c348247c5b82ac69fa28da4b83fbb97fb12fbb70245",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxathenadebug.zip",
        sha256 = "351cc7530e68e0f55036d0d8a06a86b024fb665e8898a615c7166765b1c7b8ff",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxathenastaticdebug.zip",
        sha256 = "32bdc0e6af14e99f63dfef6e09dc6891055aa3787c1a67adeba09591b448dc80",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-headers.zip",
        sha256 = "1b8f36c7f45bfdf4b7ef8a19349fd632ddf34c9a56db00a55640c11f76c05e4d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-sources.zip",
        sha256 = "32bae25844f7cf6df5aee09c2ed14d3fca96272fb1990d970fca7ed26fce1cb6",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "2c46cba012c43717522d83e4458e19351ca4a1ea0cccdfbcd5372b9b4eb653da",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "28f6e6424b68b57f080f2ff2328eb7e6d5fc947aae3618218f5006b2793d9ece",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "eeaf6ace468137752ccbc1ab6aa71653248f98e14218f2ffed8163af6bdf18f2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "aa9681b6045a6159bd0b6382ed26e6402e367d11829899e03b4914b238d391a4",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "f9bc3016864d3f2afe339dd35b21ec9914fd0710b8a176fe1212610c1e7434c9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "af5f07eaba0dfdf4420645b315b3098accfb85121ddfc41d00e4dea39a40ff17",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "9a795337d355e4b40d8ff86ba3d7f71fa792606e6f5fdf3376004a53aad0f878",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "b07b4e6bd5f4b87a9f8643489e79415156329f40548141f5045df033d610c506",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "6d7f03e658c95038a263f98e33be291d3c30dadd514d2e839ef7b77ae79a1832",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "0642f4f4dbc97f7fd7b37d279524bf6b39464ab4bc0b2bd675bb8a32abd3215f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "8cdf7a0da3e96b01821cf08a9f264dbd6f24db4af688ecedd8f4c35cb82c29d1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "2c87e2d9ef318429be25c9d2e02b30a6c43236b4bbcd5517803f96d8dea18dcc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "487bdf5c13f9cf624a41fe43b3290315b2339341e2fa554701a5aa59d58497bb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "48514f7cfd69f2d641eb514a1b8882e099beedc6b000d14d91865a49664317ba",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "6240c1f4daf9be596da0276f7de805cf5f3ba6476ddc00b7eb51828c1551a491",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "227cf959343579249bbd969bfae2cfce85e9f1883f190870b9f32621740c20ec",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "a0ba26be2cc13f597b9a95a568e4ea1a798aac452c05d99d243d7c71c1596b13",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "733391931734d1cb33c153b56523d5b7560248aef26da546383beb7e39856cf1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "825c5952fe313354d87c9460d83a2277a61f80842aa4764d83c429f76a1a0e19",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "296d86a5723fc60aa49a44c4bc2342600741d247ff7c1b4fac9410cbcb19c42a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "e9c9ba6eac5620a55ba43bb3f35db14a5f81b77473f7fef4b007921f73ba780a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "83eb130086b1bf720a72443402089b0b9b3fab06bee9bfa18ecf307f835d2717",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "c2b93c3a96754aa3d6747072c7be47d878c4cc653c6b363059280164e27b476d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "bba8d7c125977c818996343589c878467f530933a9f8b554ee2c3ab6ba544fba",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxathena.zip",
        sha256 = "7b7a924a7927548e383150f6f1997dd65053a4cedb060fe46959041c09818daf",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxathenastatic.zip",
        sha256 = "21ecc62f0a154e72561ce0bc32d719cde9c1697db7cd59b3f1fd063226812272",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxathenadebug.zip",
        sha256 = "a465b833c36bc6e7027d8899526abf26ad2944d04bf2ff00f368ad0e73bfaed4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxathenastaticdebug.zip",
        sha256 = "2ca6968acc95e3d0fabbf6d6799c6d7fb1e18dda6869498d8cd1fe3e4f7ec696",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-headers.zip",
        sha256 = "776da425f99d05e278a3e0cd78c89d867548b1504f934db0f234a3b94645ff1a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-sources.zip",
        sha256 = "a4811247bfe8899440fce5f724914ca727772a1b956f516a45db6cc3ce6cd1b0",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "51ddcdacd1d9df30a914c038dae76337bbffaa5b6248aea6aea23cc9181def48",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "86fed55f1fcf28d3def06caba933cb9753fb516ca64a250a7de0e41fce2bbdc5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "687c8bf21eaa23320b06cd7b67f56de73cbefc00c0870d2319e9444c9ab17657",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "b70456746b811211312a4b5fd0f87f728b3ac68d94f9e3b581b595c9e82df043",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "b50fc31f93a5d4067a7600f81ec71b0746c1b132de4c3ca20b0931bb8c4bc7df",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "a1f00e6eb03fea146faa4b32cf2fcd7d683adeda0f389345ddb76cc7ad8051a6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "672cbd0366af31b15b90b2e1e77f0818e7ee28912828806e2404f13dc66748bc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "708367d5127e17f13cb369cbe6b98e8e1f94f02db405692ddb753eb4467174a9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "3288dbace7f82523566f386950e51c7ae42378cde1259159289617c33aa4df99",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "4043e50b256707b3b5590b6e2adef846c4237587836de2e1e03366b7ce9da863",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "5dafe5db39a694d21cfd9091f894c572849b5456cb9e83fcad7edac84a691a34",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "96a74742454a9eb7ced5dd0a9fe4ee21e79724a089c9cb94915fb86f36f3357b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "2d24edb7c1778142461b1f6b6be4bc8ecdfbcc37a6590cf86def7e120f1fcb0f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "75c668f6d838b73475f37b3b8d461a1c1d847e88e4e2658361256852129db3c2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "fe8a40149b68bdb20c74427862cdc24f93c5955f32a79f614107c6b73b234d78",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "54facd1666ec51871997a1628dd94ebae6ff408da4ab14c8f1de9172fea0241f",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "fab2db2c714a055b31d823a2dc27b9ffbeefc8826b09c9feab160f20fb86ea42",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "4abed66f0790ab92f336086d78d952b4e1defe389a23871e1214aa15455168e4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "231eddc6beb3981462485e22da7d1679a6743484d60ec2cd1f6c691d5274121d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "1f885b21d53d66778a9b73742e21fdb0c7cf7d11d02ca723e35c33d0d80fb395",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "1e00c8e921cacff9f891f8572358753fce5669ec9169d71d24fe3390a9bf1b00",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "ade7ceba8f8681f46dd537af2783fb805ffbb6fe6a8115d0593fecc3085aa4f2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "626a5897379c60f2d28ae8c7891919aebe31cb0731bca5836020d860959aac71",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "17e6f39fde0f61efcd2a534fb46735be293a00c55a99d13b79afe8a21d0401f7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxathena.zip",
        sha256 = "d90507c51cfc89acb50d6e726ad12a82a22fadb0310f1076f69d88d838119836",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxathenastatic.zip",
        sha256 = "a2ad70bd13612dcb65b3a255d41d8bc23b6f92ce9eefe94411c033f2ff4f7a6c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxathenadebug.zip",
        sha256 = "919f35a8050dfb30960bf87c561c7eee09638f3919ee9cf01cf4303ad8a6f990",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxathenastaticdebug.zip",
        sha256 = "0334f2375931a88604c989575ab8baf014bc76d758b73053818c5ca7055f6b88",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-headers.zip",
        sha256 = "8b7ce65de4ba96251d73eba78dde655792635fc1569d5657ae901c5c89790fe3",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-sources.zip",
        sha256 = "1e164ce6c22cf69651fadbdfe1e0adfeddbbaf4eb5f365cedf62b126ad30359b",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "180dd26016de0732dc4438ba9f6c86b00c9ea1e02c246749b12077344644fe45",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "ba9d76fb3d3823fed94df36cb0d8a3c1fdc2eae21a9f43cf75fe62091c824807",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "5172b617fa7aedf18ecfcc043b16c3e0ce5caf9dda6ca9c77c6e438eda6d4b15",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "7abe8c92ae02eefc881d511737045b43fcd66a2642b80dccf144f27070b472f8",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "aa4164c02c1ea2bbb94df2afebf7796742232a3459c530977c6dea153b649c55",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "5bf7b41d9a0a01ef7464b0658e61f332e48536845d1631c5d52d44516a58b6ca",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "fa807431ac2712bb84c505a5500ea2eb8eb12591e201f4802ae0ee8c156e9ee8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "498a2c8af64b5b628645c9e4ebb1d07a056651253f8bc289a0207c457cf2ac5e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "b61d99773ecfef64d3a34857f38255f7bb3b2c7cd257a147cb215409551da6bd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "577a9080418443b2baff5467b01ae735ada7d5f633a91978e0871615c0a17de2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "d656c983e848cdfeb8695b88b3ff983dff006ca59a413ec6f346193097af128f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "68de34b282e84f6412933ff7c56b379576d821e541014b361938eb6aa02832cd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "c4dd767aae1101961b33c81d959f24f41eadca0400607b6be2143859a7009ecb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "5bbc828b42fd61f3dadcdde83b96797abd99f03e5dd8d9528ad5c0b9a08fe21d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "1d495298bc457a688fcdec2da8d62e532b6db27c71ebdc5a1a55fa0ae55a5ef9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "4e398cdbe73bfe71b4537c3a92fc3eeeb988ba619448b8a4d0414c4e2ed6de3d",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "4a4f8dab77b9e5bc08913ab98cdd380f826ee00ed11084334995777cdbc7b880",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "439aa5a888c2cd8263855595f303857da57fa699223725be39d64df17bb1a130",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "8ffd80231e7472c570ee88d41ebbcaf3d3eb5d1bdd5e871fcb33edfdd5db8df8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "0ca6c18acd1eaef19f6503e14b2bfe884738a3c1f493d763c99935435f726e96",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "e6041ff31028cab57d59f69ebe4cd9bf8cd122d07ade4604ca140f269951d42a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "e642ceb7d84c78aaf5407426ccafe1c55ca479b80b660c74f3b482bed0dea524",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "e4657c3ccb989ac1265a7919ddd13af1e1f55a977d421aee0f31fdc23b5b25e6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "dbaaa2e688b80c2e0d29111cea42c1daf5d0fc70ec479089ddb3d4ab6a3b0c0f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxathena.zip",
        sha256 = "2038439ae3250dff8b730a955085f075077b2ef3317e2674da91b72dc6c2fad6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxathenastatic.zip",
        sha256 = "d8140179c4315306bfadfc044f8cd2c277b02997aab6e824600c8480ce4975e4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxathenadebug.zip",
        sha256 = "4e125c27d7af521e6dffc9d372dbc13957a72260ed9cf049c698797f99e7cf92",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxathenastaticdebug.zip",
        sha256 = "1cff086946d2764c5cc6f0a793b0f8e16658d2dc8b467d98a26c25af65978af2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-headers.zip",
        sha256 = "af591b40481b3b58997a8d06dd90a702490f7098ed370a61ea600c95bd016eb4",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-sources.zip",
        sha256 = "afb5284227ecfadc2224cfd5e4caaa732fb528a8c1300f19a22eba040cdef410",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "5e356195c9764568f9097772059a295674abedecaaa07f9bcb4e99cd59cd21ce",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "634ef75ca84f35d0fa521a5e031a4ec5cf61aedcd8ba70d2a71155f01b7018ca",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "d2abd07ed30d77a0f4efa044a0cdba1ca667277d4c21bffb578ab36c382bb5f5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "52889050a169b3e281cdf2a98af1d004f04fad3bd3ee3da021936cf53c672d67",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "8ca59423716c09ca429862b82d72d44b0d98a2f15336ff98b7c7575b82f62f44",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "afbaa77fa4f50b6ca3c3408a8885080d84925e172c2c0386c7fca66d122e1e37",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "5bf0af015260699086dbda989d02150ef694a43f19ccd50ea9f5fe23e864885c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "b560a09c37305e16a2f7320c355d9d124a997b680b2e022522b19e8a51e55dd9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "f9a80bc4b5e7958dea361a79b51be4bf29a14f07dfc77ed150852f7a761eaf05",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "e09ac833053357740c3d7df79a8fa9eda34ce5c702f9059d235783c7976c0d70",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "09eab31e68ed9a057962697b26728b48bb51990d2b79cca52699b6c680cb3907",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "7e870337cd2c8ee37b81276b09efdcbaf0ae9ceba6561d9eca292077227091c9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "6b6f9a5657606cdf3d1a529256a15508a80e5701accbba5344aab4bbe0decb01",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "b3287de721d81f6067dbb2577b15e4273c40c916bbd774bd91e445a5a5f12c61",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "b29557a090bd31d6ed83c629a83a9ad190e716e00988679bb75d07a203a8a6c1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "d21e29411e6d4fa80883dc009dd3963f8e44e12ff91094d5a639c1a3ab281b0c",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "e98c65b92fa3328014ac8d4156c74a89a1648ec963c4b274ba0db9b2e30ca1a4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "12500c17355da585eb39434c510a16a96e2c067a35df2bb7d0125f40484a8897",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "2e992d341434a6da8a294392e38ebcd110f695bf8d2eb2ebb64ae86557dd991c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "ce622bd1404810cd682e9541f0d76396adf6bbdaeb67f2f648971edd5ec1bba4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "c6c721f0d7ccd2c2ab2db50c44003735e2ec722a5c0b1c0984b856f5a2f85bc1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "3f383380525d67530c7a5831b9f5dd017e99aa5c800c5dc5b44e25f3a8772ae8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "fdfcc4f75c1a9539ccbfeb499f4ee9399e39746589c3577ff87f12fbf561332c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "bd680d052d6e41d1db2d7a8d539d943a5208d0eac0faa83e51f0a4de043484d8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxathena.zip",
        sha256 = "573e3902882198c9ecfcbaa8cf4ac06dcd70cf07580a06838e3999ae5464463e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxathenastatic.zip",
        sha256 = "b0bfab1ebe040a3dfe4b6cff1b68f7fba3174cb87235da38b6deda01b2e542ea",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxathenadebug.zip",
        sha256 = "06c837ddc595e511d149f73e3c03298bcc3fa7d82e79816cf74de7c1c58a569a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxathenastaticdebug.zip",
        sha256 = "860fe35f58d8c123412f8092d41d488224b87ff586e6fa630ec8cc14af1dae82",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-sources.zip",
        sha256 = "5ff00fd7fce6650388043c457cfb95a437dee820bb1ff7f1a256635e26c9fe5f",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "c6dbbfaff82dcc7936e1042e3306ae5f031b46a9b5736c6ad5712177b7dd485e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "b96755b8fb65c3ca69c5749205c548c6b253046c928ba6a6f22560ac4869e045",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "855b4a2428b317439039cab262dcf73e04c9cfbac8257f81e71cd99b4fa64ea1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "4f3f80c91927810ebd3f5c462dd6d49a7740921288e309ae3a98d53a35418ebb",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "b1cc698cdbc2634e1affe79abeeb3378a475d0b6925b40e44526f3aefd8e929e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "5929b6e888a42fdca8f4865f30e47e9554c4dc64230457ac17a538cccd777e80",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "ff53be0ee00f688720b5e7085974bed80ee78fb3f5760b93875366d22ad83683",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "3bbf2e6d97a9b4841cfbcb51e2eac5de66a26f8e25d5529671b430345dbb2185",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "27815fecdd829e8f564977363e7ef2a11a9bde27df251b19b855ddd8cda529c2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "0039cd2db219e050976a0626cbf701dabd7d78f8987fe381a91c2dd46857ab93",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "5c7dca1030b0ddec794f6a6b2ec9fbd0699ada8d2080f01ae770ef9678fee443",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "b8cd4e0da87001096a86043b13310bda4c4ef61e4f333623d748fc18f5c14896",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "edf460c786b19291ce5d24365377df703ae596be7a4e8a1c153bbcc0d898a304",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "5163f6866196ebbc58b8ec3720d166c5cea77cb08b098f7c5484912912ce1e94",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "359f646d94f5efe48e67aa7cfb30f0c2bab6aabb72c139a148da1fe9946f7b1c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "429ca538563a94fdc0c0e4a1680d509abef75396b46921ead8b4cde1238d8f5b",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "5709f85a3a8581963d67d39a6c0a51ffc0610a077112f32fbce030a7b5c48052",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "13db3b874cec2d81f03825d67d4c9939db1274a616f979a8edff2a7de325ceee",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "941359d94cd99392ae69c5786d27955b8fe48379fb427d7f66a050f2b7359d3f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "5c03cc96856f9256fb6ba430d3b0dcae8edc1d6493c6b6a77a6d5db20ab2d242",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "f3f9b30c9542c0274cf2b565e3e8491dc1bbb3fe94342cee9aa5db824a25a87d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "fdda2e466bfaabd9694fbabee2adce099125cc1005ad0676c7a701b4e6008a54",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "9554cc7006c39a65a9066557ec44ff73fc25b2f5b5ef6ee423f646b822ee5517",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "eec9ba98dd2a7473830f54592fcbe466259225ee31ffb844975dce7b4f59d72b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-sources.zip",
        sha256 = "c071e60a56f40fa6d1341735ff62adfb019d7d60fc4f50b4f6cdad57198c6f34",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "5b38a81546ab9b8afe94ea311d9ccce6aebd8c56ce6b36d3171c78a51af8dfdb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "e7be0c75a490ca843128ca907311eedd6353cf1680c1987ff4ce5c28253bcdf3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "3829970c9d19a9debcd952efb4537dc406f9d1358fd30aea83ade1ff10d31597",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "36442703ffe2e87aa8f56e4eeff43c2c0ae8256d931fcc2b48d0cad274fc66dc",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "71984f60babf9cddfc7aeb35ee06ba26f0856f010c19730d5cd168994503d4a8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "1ccf51cb66c86f14b8cc264f4675f8d6de1a041e844882a049657781f4290b5e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "415ef235642d3688448754f55d1045a9623aca03160ec5be57f0fbd1087657fc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "88bad3b689a3eb3071e7c920de7fd0da6e9fede46fab44cdc3d87adcb3b5ad98",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "25533e0f2a9d0cd2aa859cd044d3ac694b9369254e9a861bae965b5ee0152e8e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "8afb8245c52d4dda3467cf64f60bf54428aa910bd88a512b9430e6e8beb0d3e0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "b48444f83d0fb5d5e2864a50f733688d13c9cf6089efd2aaca4414c1fa5253f3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "79baee5ca11fbfa380df0d641fce5ae45712f521f6bdfb82418e2848793cf437",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "c72656b057fd3c453ff904126fc72a6a7c3cd3666e12e0a4f7b2f0f6d9ad5ecb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "0d223a88aa900be9ba81357aea329a2314524dea36ba5feb3377087c07b9a088",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "84d3d1e1fb2b622958312becb1e3cce520d288f84ff1b482d40f88b557876ce8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "593cae1df74ad080066aad6bf780a8bad3b52fc9f2c3822370196e69131df613",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "ebed87601b7a1e83766fa5530f06d53fdf5d143cd7b7137a3f15ef41c7018610",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "63266780195d2b4073a6fe36ad102e9412a6d1241e3165cacd51de6b90f610f6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "8366fb04e97b3e49aa69018253d7ca70bbaa0b460a91c8f3d6e62783eee97291",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "ce1c22009f0ae9af2b1859b13e75ca84ded1ff5626249d5921fb997a289a4ff1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "7954c60f69801aa4ac545b4b57e6e63b8659bf15a3b8346ba9c660ccf1e4c124",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "4685d426ef6d847b2faba709a2909acdd95521a65bd0eeedb0ef626febd591b4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "aaac8489fa76fe9836bfe70882a704b617129a9afaf9afce90aff64de6a12ab1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "d115b725e4fe334350af647dd6831a300d7a52c84362f49b8e7440c2b4ab6761",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-sources.zip",
        sha256 = "715425735ea8efa788735325e65c8ec951d627c2e0cad37fd48fbf7efac2bc8a",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "4f5bf690ce145a71c83dcc2c94b206ef0b92c2c6bd216735c8dffc45d7b2fd86",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "185d91d60e8ce1478fbecfa3507052114942f2ef57da3b0af2ba18fcec1c5971",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "c5a1e74ff28f3fdd6d0e0e6680673479b8fcdca002336b5c66e20d9c39ef1db4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "158f06a5c0d03a6e43a633b1748d4c4faef984cf48abea618681498c70f7cf19",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "16446ed6c1e8d58cfffbaea9b4d0953e2c5382d6f7745b367b08230ed9555aab",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "65c32258ce5ec1a6a7bc2d8ba21f3f15130d7bd2e1e76dc0f7ed7f2cd7950acb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "8c065dbb61ff19dd3528dea0782691521d3fc262f76e24d8ce72df0f544904eb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "8ea0a2e69c0791de295ff725b7e113f2b4819cb3b4fa25897e541b76c0da1102",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "460aebae203f23d902de411419a68db6d62f6a94edca63ac7aa8ee6a8f6c794b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "d1d10e38077ccb1080d7e72b2071c1aa2254861272dabc7429decd76425ef390",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "7f9bdf70649db0e27dc572e245f43a2b5814b5cda24e9239b9ee341b062f4134",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "af57b239eb6410071567511a76ae8fea2c72440b1135f4037f295cb6107b8433",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "a69853c8c26d639fdc52c5167edba3a22f866714bd452580492eccb74220591b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "17a9828a9c9ac247c1719deee3ae2c0d646ccc9350aaf95a5186c9bd2dc1907e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "a838baac41fa6c7c818056efa16c0328f0ac8b87590069d4a34f55b630ba9911",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "2eab08836f5773ee50bacedefc996bfa569fa19317633a972c09b861acec1b57",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "23618e82ad31573cd23245655ad4f7b7fe683573e5510824edfd67490b3b9d08",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "bbd6bf5395fb146072c5bae21da4e9d8191a8a61622d5a166e7027a302be09f2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "0603ba0fdb619cef65f8fb681e92f23b4ce65d8c59a8aaed232780a306b25246",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "c8de37e3affcc23cad9c8e71b5524eadddc9d59bfab4725a33e4f0b702e1132e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "d6fc9174122594f1e5914dfab9e5cc109e4af78fb25273e0ea7aa8130d52b274",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "a43b8229b22d4c0b4fedab6f08460d52062628b77399a5895ab170af879e98bc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "f79d8d36dde2f9536d62cceeff2aa3d62d263af465afc1d082a6a730a9ea402e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "84abb6f85dccd9b8141a5bc8e8a81b09df8cc643e2d20bed795d8eca84f9295f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-sources.zip",
        sha256 = "49cf4413cd49e5943eeb5a0882d45c8499ea2939632c98ab2242f9ae5ace2d76",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "df0096c3917fa1327b9a19a8b360ef354eefed2e2a71992fd2742e4dad52fc05",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "f7c2790edd70cc9f79f33fa802243ad449f1907acccebca2a57e898e150ce07f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "110fc96107fc0d54c65534b5e9763eb83842a9ed9b43c2d1fcd353da26cdfc90",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "6c3279fefbd5162001e6a849561615a2bcb201ed858ff7169bc8c8ed509bba40",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "6c3bcf9be0c09981014044d6b5feb6447c8ece6670c8a7aa600bac1ca1bba8db",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "7baf1fdab95626f4aa7dbd59f415fa9f000ea469dd7fad20ef4c5cdf3061e7d8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "592d3c4a79f8c4897128a17bede34da478212fc6bbb7f845eeb8674648fe71c1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "9feba9381f8959a2b3307b23d03e09452cc6d8710b8d5d411c77fd7e21688cec",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "a0e3a21d720b1d32acb0bf4dbdbfe4903046106c5995a2cfa8a8288bf83755d3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "8ce15f424a3f8f00202f6725e22096dd02b15edb22413325c8c48e2a5bf0b64a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "f70b6e973af396a96067f7d203fa921f20bc65f0e4987b9b787915fc90be4bd0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "7880ace90562aefeae0fd0a9cf6ec22ef5900e365d837d9c24d96d89b2e9481e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "ec30b998e20183c1bc2fa78fb7cc2140646a597e28952edfed8ce825c2fcd172",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "faef80317857f11f75345605513f80ae5bc286ab3b8445f1bd121496ede9d88b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "a47d0c3ae9f943815f2f9cc75a93940aab70973a53eace23680e0de87d042f95",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "7544dcdae719c17fbb36080c6f8101d42a00e7eccea987c291d16e0d4d6beea9",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "fb5d1fd5ddab629a124157d4639e61c9d3d9eabd35d12e1e5a54f92bca4ce52b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "ff11ba009b2901ac0c0bae0ac721583d14dac112edca3cc31980071b0f16475e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "bc6859d4f6a9667d60205b94425d13cab94ee3b8302f17ce354f1f77d55a372d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "a301b92478769a21cb50e56e7a3a658d1128857fa7bfb3aa876db73d149a570d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "3f297c2950abd990a1e857b522971e6a27d24fe875524124ca03ee226c344a25",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "e8277ce966d616b213ca3d8377d3d9b698c5cada0920d38d9db84b54d593bff7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "527ae3277fbaa1b0a6e8a1a516ef0033e052bbcb87cbdb57f94b1d5750d5504f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "266bb01438c1aabb896b7dd9a7decc77577c1d5f53547d2d3dfbbbe2c6fc04f1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.1.1-beta-4/SmartDashboard-2024.1.1-beta-4-linuxx64.jar",
        sha256 = "6a782e7716c771b87b5ed3792e4cb1690a66afbf27452d33c13927d496757794",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.1.1-beta-4/SmartDashboard-2024.1.1-beta-4-macx64.jar",
        sha256 = "f33628a44f781a89ff5041606cfd258c2ca163475ee14eaa9375386880752a4d",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.1.1-beta-4/SmartDashboard-2024.1.1-beta-4-winx64.jar",
        sha256 = "9e5c7bb12b75897693475b9ec084c9c8dbdcfc41d427f3cd81a0bc268970bc38",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1-beta-4/PathWeaver-2024.1.1-beta-4-linuxarm32.jar",
        sha256 = "c5e0dcdf1a87e78d1874c0c1379ed9c3e7a613ffb892c16a12cc9f5590ae1f1c",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1-beta-4/PathWeaver-2024.1.1-beta-4-linuxarm64.jar",
        sha256 = "88f9ae2edb3f342bcfc776f943061f1463374312556c31eaa38710274a29a5b4",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1-beta-4/PathWeaver-2024.1.1-beta-4-linuxx64.jar",
        sha256 = "cf6a7f2eedac69212b9d4adcf0558ab917b6fc9a257c9b2457a69b736f3917ee",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1-beta-4/PathWeaver-2024.1.1-beta-4-macx64.jar",
        sha256 = "bddfb5a53d996590fc6df252577e88d1e7ebf3a7b85db272af0c4bd5debb2b53",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1-beta-4/PathWeaver-2024.1.1-beta-4-winx64.jar",
        sha256 = "6e4f28583e6f4b835be1831164ae07514fffdeb352b2d9e7e34bfe0790a4c0b6",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2024.1.1-beta-4/RobotBuilder-2024.1.1-beta-4.jar",
        sha256 = "8e88bf7557192ef62d7251a4cc6dcdd4b26034ef25509687e59e98bb35dfb96d",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-4/Shuffleboard-2024.1.1-beta-4-linuxarm32.jar",
        sha256 = "9ffee7a10cb7c55744f22ac64293c30104ca861a651913668474b1982dc25a03",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-4/Shuffleboard-2024.1.1-beta-4-linuxarm64.jar",
        sha256 = "061fa97c23dc6e1163decbb95fcaf432ddaeb2dd5a691675d458924a6ec1accc",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-4/Shuffleboard-2024.1.1-beta-4-linuxx64.jar",
        sha256 = "07279ad0463c45a9dab67c483f5b06468396b658b0a6df43ef50d484f718c4e7",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-4/Shuffleboard-2024.1.1-beta-4-macarm64.jar",
        sha256 = "28abdcc5ae3ae7aa8aa57a8d4b8572f3b1dc471d2ff04485b0d128b2d6e91ee7",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-4/Shuffleboard-2024.1.1-beta-4-macx64.jar",
        sha256 = "d7ec1407188184ec9012e7e3e4c742e2ce8a7802ca267c43e92b8b4169ff7bf5",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-4/Shuffleboard-2024.1.1-beta-4-winx64.jar",
        sha256 = "70bcfeba4d70bdea8d1e4ad31ff271f1c7f82470b7345d55d7546d634ecc6b04",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-4/Glass-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "f013607d45943009ba603fef1365ccdddfbf7bd98080b4368c3ef7a7a000ca71",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-4/Glass-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "e91395c1f6b26c4e964f6884514c5cbae1571bb3187d594a363a901d52373f3b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-4/Glass-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "6949a5f70e29fa6cb3649889e9e4754f2376be69c62ccef8aacbb6ba05f2a46e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-4/Glass-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "9f4d93cbd58c6fbe16d38c43dcffe8d8adad8571ab4b00eb270f413c37fb8ff0",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-4/Glass-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "aff65d2f6b740280d51527806154ecf55cdd357dcded7cee8557ae2e334969ee",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-4/Glass-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "27c0b3bdbc1a1c9df0f0226b08eedd9868ec18b1a36da366ce5583219aa94466",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-4/OutlineViewer-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "5e5b95f6186e9a8f9a02b4e046c4020d40413040e602e4715a4b875917eba724",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-4/OutlineViewer-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "5a263e4c4f5a9f4261b87954219c58fd8a90daf8c7ee7df269917ea8bf8b5874",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-4/OutlineViewer-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "3fd5c4216ac8067c800519e062f59dc8ddcd26d198fd270d893d37095c9c01b2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-4/OutlineViewer-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "ce84c97680ab4e95ad71c77f4f6dad75cec158668e14cae262c44d33042b399a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-4/OutlineViewer-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "f7792b8d5899587bed5d88fc16cafb9387c91851519e7d18a02bd167cb15df2e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-4/OutlineViewer-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "e9eaeb6a87ce5cef0858c81e170cc9cde152bc1d008be1639216eecd81ae40e6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-4/roboRIOTeamNumberSetter-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "0ba44061bcaa913f9e53020b39ae4f0e3996cd6ced996d1c75895bce31690415",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-4/roboRIOTeamNumberSetter-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "8142fd1cdf9cb8ad6553641a2d92576c9a3c184c68f1fbe489e4bf58e436d87f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-4/roboRIOTeamNumberSetter-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "581c1d6179b55ddb2f1e96d56cab25b778f4001f382f6177a5eba7ca9e472081",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-4/roboRIOTeamNumberSetter-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "b09342947ed0c9e0657cd26371bcced9c672bed8380a43ead13687832af3dd69",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-4/roboRIOTeamNumberSetter-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "c70aae4e0f5b6d1ae10dceac89c195d36262a122c2c91dcf803967560f3eef3e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-4/roboRIOTeamNumberSetter-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "8accc4b6b816219e4ca43004df67d176d967cf7432585b98f0a76d58d881ab9b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-4/DataLogTool-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "19d0dbe2240acf102f1c3e64a4b161a4e36083e50d901be9f6812ec1302cd9f2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-4/DataLogTool-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "5b49ac1ad476b01410c3940eb13b5bcdf9ce8369ceff390bb1371e2a92dbcf83",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-4/DataLogTool-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "7ccce3d1a7c81ac385fbfab5aafc5af07609588d43b242a88ae5ad878530b5f1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-4/DataLogTool-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "14b727abed32cb66d5f6da6dd570135efa18ccd16922d232cee0c9cea946c820",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-4/DataLogTool-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "cc3f4676fcf06f80e29a76830f70ecceb0655627f89f08e951e84f666d5579c6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-4/DataLogTool-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "e650d23a8265ffe649e16355eed02c6df3c8f1e9c3ec977a8c4aaf1f2a486463",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.1.1-beta-4/SysId-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "8768205cd5179aea6c0989b04cb9008608970b6c2233a5e801c637009a16db52",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.1.1-beta-4/SysId-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "88844395a622b4e380bce341f56c33a5ffa8726c37307d424efede88d959d201",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.1.1-beta-4/SysId-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "06721f8f9af27af2d8d56c251111e86d2200146b37855150d36d382c9e304a7c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.1.1-beta-4/SysId-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "3f7cd38a8701d73970112122935f34d2e95695a65fd4f10504a3a8bb7e3ceadf",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
