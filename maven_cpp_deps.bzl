load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_jar")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

cc_library_headers = """cc_library(
    name = "headers",
    hdrs = glob(["**"]),
    includes = ["."],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "header_files",
    srcs = glob(["**"]),
    visibility = ["//visibility:public"],
)
"""

cc_library_sources = """filegroup(
     name = "sources",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

def __setup_bzlmodrio_allwpilib_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-headers.zip",
        sha256 = "de5f1d63beb4178b10e3c87b772dfc9d14524522f31195eef6e1cce6ef294645",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-sources.zip",
        sha256 = "d8ebbfed02c6070f74f050bbbf8b28b544e61a32597166cd8e1534706000655f",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-linuxarm32.zip",
        sha256 = "6fa7a30d7a887820d8e4cd7fa22177176980b15ec9f40266957d1d1485997407",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-linuxarm64.zip",
        sha256 = "a8179792cf6b50b3bae02e32eed01d9efaa24de73dcdb71514dfecde7ef1352d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-linuxx86-64.zip",
        sha256 = "cf821e1400b90986a15035dccfdc60f5e01bc836e360b79d984870cb46c439e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-osxuniversal.zip",
        sha256 = "6ab2dcbeae0e35a9372c3e75e89e5b509cce5f5ff74768a590994f5be35fab22",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-windowsx86-64.zip",
        sha256 = "29bae7f6624d992c59020cd00b3b5621172ac6255d4bf60f1a2937e466374620",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-windowsarm64.zip",
        sha256 = "3b7f77f26525a38f5c1f97628fd875659e4ea552312949ce3ecb03e25222a9b3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-linuxarm32static.zip",
        sha256 = "6c879907bc53448ab871a914facd063894247850d35a15fc3991f5f29dbed75d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-linuxarm64static.zip",
        sha256 = "34e58bbdb36b20e02af5474b0c9175a752fa7f8e402efebd5dbe35ff61ae59b1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "9e18c6e5e258a366bcf804babbb557ece897a6089b369286150786ee49eba437",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "17e5bb46b60aa45d3a260e102f1eab357a6c2b01c3ddf2abd72655569294db76",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "0232f2e84d9ae95cf8ca8c0af098c641349d79dcc6662458afbc865bc9c7b81d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-windowsarm64static.zip",
        sha256 = "3182a06ca44de7f0b64285e10348cabbea0d9dadc5bdfcadbbae525255f0c78f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "dfd22de537f19cb3b2640a38789eacb4393eddf1c98af7ff964a869f776861da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "6aab2cbba2fbc63ba2e7a07596293d0081495d62c68b83b38c17eae16bcd91bd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "8819faee527ba274ace1d3b8666f0385901fff6a70841e289d0c3072ebfe6324",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "326011c543566361ce905e38159cbfee8b7803afccef871d050901d596efea32",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "b3787a1d2d09d4bbe3bf11887e809e4c6b54af3a26dbfb98da99a0afd7c33fee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "2777b128f4701edccc20730840639cdc0ed1b0a78065f947f5fa48a49acda8f3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "0046314bfdb86221c1ee62b98c96ed24ee151a0680677dd1b8578dd4f0675858",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "a058f13ae8abe03b8c5ffb45fca770996849d245d8c5b8d5826b12b7b759594a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "6eb9a88c6ea373328ce7793e2b2bea31c6a13c45a683d21a65947bfee92a4d61",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "195c536a0ba82b915ae8a25dac2e01f73d72cfa56dbfad73fe797d544b1f2e57",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "a00bd9a097824467107df95ac249068f5c8695ed7daeb715676bc4e154d43f52",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "8875ba3361dbae588ebb68fce8e2efc21de313becef1c786a7a933b63865d065",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-linuxathena.zip",
        sha256 = "9919636d390b9789614a86e37327f3edcb9bff7011a5c4bde4feda2c520b43cd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "f834454dd24e106494174ed63d49a78ce89a752c2a6b9c2bc6d57cb3dd8a528b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-linuxathenadebug.zip",
        sha256 = "bbe011954ecf7c0e181d464e3b678cf8c0d20655511eccca9de6f97ee95e63e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-3/wpiutil-cpp-2025.1.1-beta-3-linuxathenastaticdebug.zip",
        sha256 = "366aa67efe5f77b283e8344cf921a65b145335d69118647e48f673e162ecb46c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-headers.zip",
        sha256 = "afe0c06549d56f07a995632130899dd4184ee31b3c95ff70c0c75be9d0d84854",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-sources.zip",
        sha256 = "0bec62ec6d69e4aef2e98ad9f40c588b50cbf48d53145e66336aab5bc6cd52a9",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-linuxarm32.zip",
        sha256 = "33147235ca288c14c365eca5dc110fca69236aeda1861dafad1c94c74b042a69",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-linuxarm64.zip",
        sha256 = "b9243bbeb14ed02d55eff8e9817c1d08928a24efb9d6247cba935ce0d51f51b7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-linuxx86-64.zip",
        sha256 = "ba6aada49bd6308caac5053751e50c26d3944491e2f9bec9c6dc98fc379746c1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-osxuniversal.zip",
        sha256 = "a497089f3f09dcfcedbc9095fcf69d74875db380a83f3d63f5109761612b18f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-windowsx86-64.zip",
        sha256 = "6574403fa105836295edf64587d385119c18ad367f5fd2beb51b9f6b452d48a2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-windowsarm64.zip",
        sha256 = "a3be5e45de987db44a73361e194c2262a86f63c922a020ab834ace01c3a7c6b1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-linuxarm32static.zip",
        sha256 = "5e2f7107817b24f6064c5a6a906eef900874dfda1f3b9dd796542e0590536a44",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-linuxarm64static.zip",
        sha256 = "c0385b2d7d7c8c1b277ed9ffba4b345881622c979f5f06cf56fd43e7ca1539fc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "2133a3ab758f24f7e71252d1ca2207a92b5962c069f68c0e87d6523803c005a9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "19340c6c922ebefc6d6f9897cf80ce09148f609211eb20af28f478c07d1b4497",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "c78a9bf19171db3bf397ab7c49a8f2be31bff41c72d7e8be5ddb273f217c2be4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-windowsarm64static.zip",
        sha256 = "a02c6376e8de60dac0b1dc716a5a2cd82d901a886d3db9fd357366843d769871",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "079fdba9a6d26fdade51d32ab96d7b0f07f15acb2e5d58578e387b8c4629099b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "32cc32ff627fab6bd01b90394dd975d5f6252405c230ac3a9f636cba04ad57ab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "2de3009fbed1c0fc8a731b3f4f096b75fad6b12f98b84929c8d43b5878acec3e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "a4660b543ea08fdd0f582b71d68859d656e593413fe06a927a556cc2a7ab622b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "160c9763dc556b62aa00fb86751b0d6110907c29d6c50260422cdab637bff4a2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "e2e393eab82ef4cd8e68f86f29159d3d8f1fc9ff2b27b2f59d1dcc5f1630bf1e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "cae124bcf576aff1a50f6a4688d1ab0c4953046b89236a4b3c87a118f7cf1398",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "ac63639fc2ea5bcef7f8a3d53e55f0301555e00f5a430cb3084116b182e88693",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "d32ee665b1125df7393f97af96694a36a0d5cbe8062a9a2fa7fa0b696521e6bc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "dbf213816599af1d295edaf29bb614e611051740f7d8192efe2d82666cd30aac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "fff248ab7a160fce98fad14a4974aad523001c2c038a9618e98536fd47eddaa6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "382db6f5aff1b027dea7a6b8af3261d616a62b523ec37691a8094ab6b300c4ec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-linuxathena.zip",
        sha256 = "6ed73ad248edc2e4799201e7dd48406686c8fca029436aeecc4f5b19329526ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "706c51103caa4121b65c4e988b9f04fbe0d0c83b57d7544e0a4cec472481367d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-linuxathenadebug.zip",
        sha256 = "eac232356ddbb532cfd6a6f2456c8ab1aaaea5a55661cb9dc65781fa443c7ddf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-3/wpinet-cpp-2025.1.1-beta-3-linuxathenastaticdebug.zip",
        sha256 = "2f676ee4afbf68a0e6c04f178bbb9dfebfdcea38247cb153c497796120bf7560",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-headers.zip",
        sha256 = "5e283070826c4d34da57c665177eee4a2a40dae94f292fd68510cf9880c088af",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-sources.zip",
        sha256 = "ed69b32e616e477ffb36fb3e5a12bd825b7017d2e4c78c45ec3ff649fe448ec6",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-linuxarm32.zip",
        sha256 = "361c842bd247d3eabe8cb727c5bcc91954daefd16e871dd238a5284fdabf8a08",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-linuxarm64.zip",
        sha256 = "8fe2cb11033d3388a6c4a9a7b5950be88d67dc7acd94b9b40d62f02a2e5bd4fa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-linuxx86-64.zip",
        sha256 = "56aba7cd19738f0171a974fe4b259b4bf1d19b5101dbb04f31eca9085b4a4674",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-osxuniversal.zip",
        sha256 = "c6cfeac1ac7490ae31af576dd1dc82d4e411eaf54b53437a09c66f2e09bacbbb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-windowsx86-64.zip",
        sha256 = "c887f0abef4904b24eabb33ce8b44ad5b3d4e2c01346685b285e72317d9b017c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-windowsarm64.zip",
        sha256 = "dafa350f50c91707962c9f782c72aafef130e19b0e875d995fc82af507138b27",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-linuxarm32static.zip",
        sha256 = "eb6057b23e0d57d112125090056814e6580ad6f385a4e4a9fb6f7391edc6b853",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-linuxarm64static.zip",
        sha256 = "96c6a86cebfb16a8b4ac3073cb5d9d1be5e76f79a1612e6254785591e4eb465b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "feb626ee0d68e857e3a955cb7ffb169b9dc6b26763d20c496219d2940c7e94c7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "21c82aea37909c4ecb6ed474fad6fb68ebf9c23ef367ed6bea2213edd5c8fc1b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "08b689c6359fa15a1ec1cfac90f0948d2cb7d193502bc6784fe31b197f5a39fd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-windowsarm64static.zip",
        sha256 = "a1d47005a7d5e37d42ca499d4d2f0e72671c97193f4956a2b2a294cf70e28ddd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "69e3775ca9ba00c55d3e5e31e54eb699076a7e09c452475c61640b5e1277b4bb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "c3546e8796677733a5e306f6c864c79b0109c6bba5a52f4a6fe7bbe5f1f40a00",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "552ee133699e5c3bf91221cf2e805df7ad7c4ab20649453f2726b4b2ffd86f75",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "8917feb79925e009c5e917f1f6e996758d37fb090eff32d4cb76d2d211de3c9a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "3612e7cc91353ce423136d67b6cdf0b95c17c3fdaa6b082e9015bc80b3a5c4a3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "5f98c02d326b60f4e41e76271d0426bc3615a7e421753d7d4f5a5634de3dd122",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "869fb50cc37ac603914a43d066f9cdeffd602a6d71b7454b8de0ff864e38db59",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "de60334610b6e0a80751d0525cea01e38d62e96d638e5b1055a1c78f3396219c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "bbcf3d8485cab6015aa835e0ef67e64eab2030f0d53de363f293038a0e1f4987",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "5b17f8d4cd99113a7f420a26207dfde876b4afe660cb6a04e79c588cd262eb28",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "17825d578f4d7308560be8ad114cbb5bf373f5f99eae0e25f42f18aa3c23ddd2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "d6bffc51e6c37fd59f6b5fe42a8305abae53a6f5a40ffedbed2b1f819292b6cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-linuxathena.zip",
        sha256 = "5aa86744a4b2117f942632365683397086c67cffbe526f97231735d3b51c3859",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "be9bd2793385ca28c69de6f59f37e8f3d206f44ba240a3406d9b639631d27d33",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-linuxathenadebug.zip",
        sha256 = "85a779b34c1da88e88f54bccc12c766132578c8fefe78c45b6cd337dd84043fb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-3/wpimath-cpp-2025.1.1-beta-3-linuxathenastaticdebug.zip",
        sha256 = "fb37875aeb35098b51c284134b3c5861485b539698dc1f27e7aed3fb695626b8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-headers.zip",
        sha256 = "479eb6f9ef40d1bc3cd497f91e960c72c778dcc49d4066abc3af00647b1dcb4a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-sources.zip",
        sha256 = "6caed3e5580f0ac8db7965b663f22542e4e2c1b5f9f228d11a6c652bef22e87c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-linuxarm32.zip",
        sha256 = "4708fc9a83be16c5df3b394001b56dac1f2f16d5f26ee98678c84d5a8a874357",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-linuxarm64.zip",
        sha256 = "a201842a1624a8efda0c5a597bcb4abcff530229533354d5e3d439daa822747a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-linuxx86-64.zip",
        sha256 = "cbc788c69bb95208539b016e3d2c3f170827a2089a27c9dd52729549ce994005",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-osxuniversal.zip",
        sha256 = "760071f3885c4a2f1888a08927a1374ea4f317723b18401764271f47fec81cc6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libapriltag.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libapriltag.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-windowsx86-64.zip",
        sha256 = "55a4150334ee710a5c3adf86525143985be31294ac72a5e4ef6a78118a5863e7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-windowsarm64.zip",
        sha256 = "f0bed5a8e7f0692a5f01088b47f8e86b191db3bc9cd31bebba7d0fe73d56811a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-linuxarm32static.zip",
        sha256 = "e2a39e9f91f47dc3246a9e521c45dc0367b51ecfc36c007497b49459830ff35b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-linuxarm64static.zip",
        sha256 = "4c95b6bb726c38dd9a838215bef43b984fbbd20331cda46cc3085bee1081aaab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "4b4ba01c88559cf42bc542194769f5d09ba854dea9b0bf7a3dda2aea14e4ef6c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "84e28cfe8c9a91c9bfa095fd7b7b503dd1b7ed22549d22e228fc844b1cbab6e7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "dc47db9434030b81b0a615352fcc91e12a257f77f18d3fd989dfbe4b6b1954b3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-windowsarm64static.zip",
        sha256 = "ea3a40f6feb7448ad54dd7a26d5f460d05d4b3f13a58e089e72b370d8df3436a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "9505ddc1ae5d111740f626b01f5997d3188e74740165929fbeb806de350194bb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "0858dbb3c9b81b18257c88a30ed7b04403cf25b5bdb620a5a3be212c2d9f14d2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "3db5b948c5b6658558191d01f12d30a852c52745de5f96ab89b7e83d356352f3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "23c701b531beff1075e3dd64a811f2518ca510957416d40e7f7e090a8fdf372d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libapriltag.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libapriltag.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "a73e884517232a991f8778ffa6847f9593d31b01fc06f526806579b8e5467b78",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "94883fb18de1a793a8030454178d2a15ad13b1291307d31a582a598f8a6d92ac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "4337fbaec6ead9428e78d212936b7c1d66eed5b4dafbc05e92c51453786686fd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "5fd002bfe2abedf119f868684066f9363c048e1982ff103cdde00261f4c28679",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "26148c8743b0154e0fb60e829927120a611155322f6f87885483fdc39a0d668c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "d41ace51e30de6708c01cdf038ad5d9c88f076dbac0e50508a8cb477cc142b3a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "a6f10d2b0bc3d804979e1633a0b9d55505bc439958a87d57df686b65bd9ea235",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "450561a432405cd457e13b87be7af3441bf3a940a12c58bb657d75d0cd425696",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-linuxathena.zip",
        sha256 = "e08edb1548dd60f25ffc8628a1fd8b2362ce36b2ba587138c463a62d333d50e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "02aa4cb44dfe4bc77942e7a2d064b3053687734d429510ff058c06649af4326c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-linuxathenadebug.zip",
        sha256 = "eb725217edafa7fbaa0b7080da39acd0c38e12ff38e3f052cec1609ca69395be",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-3/apriltag-cpp-2025.1.1-beta-3-linuxathenastaticdebug.zip",
        sha256 = "8065e42830c6c4477664602549a69e1c3a074d5113eefb0468758dd3d3008449",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-headers.zip",
        sha256 = "cc33631045b478af347662ef4ef621df8bfa6d8431751283f4985c559622612f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-sources.zip",
        sha256 = "8e31a742bd8042f5bcbb6fad14fca7a5e1ec9ebab156ec93d00ac43908849f80",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-linuxarm32.zip",
        sha256 = "034a824710f9d1a41faf6fd534010c15b5ece4047f87c0a0398d0797b4cf97a5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-linuxarm64.zip",
        sha256 = "38e98b5325ab7a5c5c49cee23a3c22281ae88d20a288d3ca8db186b2a754ec42",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-linuxx86-64.zip",
        sha256 = "4b04e526a1ae85fae43ce4ae13dcffde8462f114643ad2077500476ed875cbec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-osxuniversal.zip",
        sha256 = "86d8cf3eaaee09459a1e4f844906759f0bed45f8cfad9e606ec1efa0f1e8e9f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-windowsx86-64.zip",
        sha256 = "a493545865646021c375a161d53f0fd657207f88e3f9baae985f6afb6886d872",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-windowsarm64.zip",
        sha256 = "2772d01f2c146e98d7aa04d51a67d01d46fbc50517adcfe9b9ddebf3d210fb19",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-linuxarm32static.zip",
        sha256 = "fcdd18edfb60e5744c6389510e9bc7cfbd8821400f44dd1dc0dba801abf3e2a9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-linuxarm64static.zip",
        sha256 = "3f42874e249934a561996a26ee188e188ee4684ac887d948309502aa486c3ef8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "2b7b75d29a2a103a916814da5b837fc3ad8fda50faa1ad3c410e05afa0780809",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "d1a1ae2bab83289dff9e3c7a8665d7cfdea5e0481ed2761899ef16c0a5cc29a3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "44163ab0df1c951658310daaaa15fce11f3abadeea040a91dfa35bf21cdcea59",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-windowsarm64static.zip",
        sha256 = "3fa42575141808c4292b8bdffd999f2e2a1d87d9714ea1274de4584cadaa055b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "701d00c539f0ab18aba3a980a7a2872c39eb841cb8405c0f43c403a14cde634a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "750c7a0bedff7cdc2df203f36846ac98fa41d0f4b23d98f3a061f84e270fd020",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "0728a124b76aa7eeac3ce5c53b658ffc2ba10ad590bda664c9525a81727f5955",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "e9abef477b1de1dd3c21f4e51d3446b4745caa18652a704508c0a8af60052b81",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "0f00584084bb06d9829bcae3c0ef78bda75056d10ecb62b1363beec5e58bd968",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "4d88f5d868af428780d6ac13982eb81f0eceb7a2b2eef52a3c24d9162cae93cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "bd6bc4761eff03794d4b3288abd8f95c115985928d95af79b41a6c9984fc6d01",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "514ee28ef1019fd70a6c201b894acdaf3737b0a1b9b5cf450b6e66e4c7a08c89",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "cf383abf80ebd06eec43f9279001f4e63e749166a51fb3c2614132cb5ae63d55",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "9f28045476e74460189fa9c51ff5cb9124fc6433470e41e3254d8debab97b28f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "c15a41bed9f030ae10656b672b09452ea9d13b900654c8ea9bb3492212c8360a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "7f723f7d0ea77e1e6231e37ebb77b0752489e551fcce6236afed7bceed97061b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-linuxathena.zip",
        sha256 = "c080d1e0a86b843af888e030224cf9b4e15ce8f0f35f504faf6b2a92c4e2cfda",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "fbb020e1382a6285217053d000a02f48f57bc1baafbb1a67bc4ffd6b9da146bc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-linuxathenadebug.zip",
        sha256 = "868d7ea6331a8b2c81cda841ccc3ed2c88007d11eedd58811cb3d21ce8412d52",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-3/hal-cpp-2025.1.1-beta-3-linuxathenastaticdebug.zip",
        sha256 = "a067797c56dd45faccc3a2a219b7b2dae1ae015a26196b2b7a0f6fb310e54373",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-headers.zip",
        sha256 = "60cf6dc5cde47f9ae16517b1e4db0cf3e968e581460dccf2e94d671f29bb522d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-sources.zip",
        sha256 = "02722a0112eca0c4e17203f1ca42215707925f1aa4fb2facd5c98b13b54f94e2",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-linuxarm32.zip",
        sha256 = "82290e6702183b0a5fe15c3b7390cd45512720d34fa914f875efbbae93b37e0f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-linuxarm64.zip",
        sha256 = "8413a7ad72cf5e75585ce33c2fc5338b1403bb7b262659015c7608c2667fe3b5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-linuxx86-64.zip",
        sha256 = "2bdc42c762c7b16d084eb7650981e41936470aa5d759071702c994e19f26b08b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-osxuniversal.zip",
        sha256 = "ec72ced52813164418be7f042811d1b39f4b50d56b93e557b3058a822432a507",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libntcore.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libntcore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-windowsx86-64.zip",
        sha256 = "cc656a15061d45c7ff3f89f5da9c097758307921e35250f96257dcd4901d7e7a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-windowsarm64.zip",
        sha256 = "b3dfbfc10e57ced72f5d1930dbdc3fd467c927c13398acffb558fe92f421fde5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-linuxarm32static.zip",
        sha256 = "ea5da7f63282db9c5d2f37ac52c375e00bdb4c026c10d6d76a0aa96e847e6e90",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-linuxarm64static.zip",
        sha256 = "af801bbada2f1fc62461843498204989af14e2ccf4d5f1289c089d3970315e2c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "9b8c91c900f550f66bff70c9eaa6411a92175678df40940833693715ed24540f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "b341aec8a441a15faeb054d2c8134982a7704982dd4b0d9e92a550f18b057f98",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "0be3092e666f70a2cb5d8419926b44fc77aba15190517e2c1cb030cf1f75132e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-windowsarm64static.zip",
        sha256 = "2bf71441db4dc1b599f35aee74b03852b7f65e57c11fd876c5d4ea149f7a0050",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "2dffb9a048d2ef76cf7c7b5af6fc3bd6d2634c8e4f2ddbfad594ae0e6963d92d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "f71e66d9c088dda06903516e8d34e66fbe74e309709eb0df6f1dc0e239200d8d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "9a9e37162f25cc1abc0dc1683cf2a5a46d00d94711af8bc419bb347e8f431be8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "709c4c4f793f39c626073fd2c18f203bb9d9a7e4734d8ad13306a59966acd4a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libntcore.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libntcore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "eab1f32c60aa1bf0656a72080925a8b2c589bc9282c9090020393e6fc7871cd8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "fa4757f8a64fa5df264d7ebf5e8f625a53d21315a892f2d5d923a308c03e3971",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "b81574e8722cdde27379f574299cb20614d41461ebdae2ff004f96cb5d356eac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "93e6b2dc28cf4508a8856010ffc4ec8b146cdc5523c9fef83599bec0bc6fd7da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "7b029c0a3bf11598f780173e53af9e736763e3f8d25507d811bc4392f0d2afb4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "88d1ad3388eaecc39e204f8d0561e98594b5415a27660f379745168fb433b6f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "84d93c0471f0a8847fbe22ff5c471cce754f859a68dac5db5eda8462294118ab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "cdba595f11fdee7e64813924350389d9f66008803a0c1fef4560072a0d2d123b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-linuxathena.zip",
        sha256 = "847c7a4c7d5d734fd725132e187b50bd0d57d8eb57ab5f0ca5b77aa962581e2a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "a912237e23ff2171d4259e0c051e7bb1b2a7f70422ef5445a973851e31c14b1e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-linuxathenadebug.zip",
        sha256 = "33b0a8050a771ca2d8e90ba8cf78a7e695c0544c5774db3965d81d026a2dc5eb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-3/ntcore-cpp-2025.1.1-beta-3-linuxathenastaticdebug.zip",
        sha256 = "a3600de722c081820c69198e3e87c4039906104ee884ea9de552762de98ee74b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-headers.zip",
        sha256 = "0371d9e3030b061a4decfd0c4e9635502ad2a6622562d0eea12933f16538d625",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-sources.zip",
        sha256 = "10885e7a6455a61e309527c921292b8b24fce6d2e40346bd947a3aaaa6958ae3",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-linuxarm32.zip",
        sha256 = "ea4753154f2da726093879195c337b53d96f7db5df3fda6cbeb05b2aa3a93120",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-linuxarm64.zip",
        sha256 = "f8fa449476b43f77e404c21aab65ac9cee02b02da69c5e7572d182703e575505",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-linuxx86-64.zip",
        sha256 = "7f3061a2eb5b8d427fd983d4a31e1cc87ea6764cad2cec28f37ebef20f0048c0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-osxuniversal.zip",
        sha256 = "cf9fb5fdb8c4f17fa670007a543682607a35c2266289bf0de98102d3c216c5a6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libcscore.dylib osx/universal/shared/libcscore.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcscore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcscore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-windowsx86-64.zip",
        sha256 = "f34d10f92fd0e6a812f111068a7fa7923306566564302d5d26466b922e4c5f53",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-windowsarm64.zip",
        sha256 = "28776989ded1179e01b21570f9c5fb035f7dc832b7d19363b0b2735a859c77c1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-linuxarm32static.zip",
        sha256 = "4c446e8535c2a6c71acc2606d591d3089fb03c94b5f428c3a0f68815df432b71",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-linuxarm64static.zip",
        sha256 = "df25c50a1f2180056f1a1152924ce0c90406f69d6cc4e7cebd1ecd8d197c115b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "c561d5d6e05db39d59976c1c3a79167778b1699d93971d183514d3637cb75d77",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "14adaf0050eb4c02de526b47f1be64e049ccfd9bf44616065471c1d9f5156da1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "5f0b5871800b54587e0a1b963e6390f43f99a1d3fb5bcd397199a8230103abad",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-windowsarm64static.zip",
        sha256 = "859275e5a54d8a9cde58ffa091705841b4e14dfbfd00138b932ff6053dda99e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "2b7f692f206fb3db0aa000d62f06118b4a3c026168c8ab770352a3c277f9ce99",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "02ee56920daec8b1039dae83efc9eabac13058f8ddc5d56990a86f86c3f32713",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "ea2b7317e0f1b2a36bc9e41255659b17aa70b52f69e39d818fc3c37c3ac6389e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "145eaa7352ba665db639cfb36aec1334d6351b6beca3306ccd5c281dbe329400",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libcscore.dylib osx/universal/shared/libcscore.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcscore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcscore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "3cd5abc5629ab91ebf49b0b60a208857becd52a472833c23f467fee3e4306294",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "1be708984bab13f3b52d3d1d1c867a6afd631e1137f3eb14d2d2685037b67cd6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "1a399feff0c227a986d01d6fec3ed8231eddd49beba2611d4674910c6c037fda",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "342af23643179c18e6008fa168fb26395ab7b8f0dc2cfd6a435f3eb50b0e62a1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "72ded4e65e4ec6429ed11d62fbc057fb151f6fe388937b094fe8fd518e8d9041",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "9627176e4131cee30a5a959f74d638f020489a4c54caa76be8261b56167a951f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "5152fd3ef2f10c770a09530b34645a34a3217c735c9e039fc6b20f22ccd03a00",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "3c79e25de7deac038fb00677d284211a26e561ca3945b5228a4c1a178f7a31fd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-linuxathena.zip",
        sha256 = "c7fcfb3ec3751a10bc705d39d433b20fbbaace2ceeaee5a8f025891f16feb4b6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "7d4b2422c6bc2f15f8665f368f18f329cfd7ff0ddfa00c816d6cdb3ba250f5cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-linuxathenadebug.zip",
        sha256 = "06fd7f8fd8149249fc0ea885e147e98c0496ed0124358a723d73a98f0db7401b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-3/cscore-cpp-2025.1.1-beta-3-linuxathenastaticdebug.zip",
        sha256 = "690fff12ba94ce125dec0c3b7b53250c6c0220a4601c9be0d9b88f2e1c304e57",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-headers.zip",
        sha256 = "d9bcb745ff0c62503b0be86cabdd887b8115be2885363f26f1c6e71a46377ed7",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-sources.zip",
        sha256 = "5dea0040513f08a22bb88314dbef94f743d1a370bde5e233f2c95cd1d6eeffed",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-linuxarm32.zip",
        sha256 = "4429ce13245651fd9d61d6c1c5ec2942b4b4fd87b22c5e7632b109eb33392c57",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-linuxarm64.zip",
        sha256 = "7829044d620beb77e8eaf19ca78620f19058ccdb03dea3c68aea63d03efc9a18",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-linuxx86-64.zip",
        sha256 = "2b3ee00b65d41f97d71643481b22e3f4e164feebd040f944a4478a855011d905",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-osxuniversal.zip",
        sha256 = "63780f07cf7b41ccd7bd8823755d8ac03352165b5ea59bd6a9d828d0b2065fa4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-windowsx86-64.zip",
        sha256 = "13d0fcd1f89068162368edfa99cbff45826885ccf8eb239a497f31968b8c49c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-windowsarm64.zip",
        sha256 = "8f6df972819ef7e6e351d600869754c9d92063b28290de41f5447b250bb5272a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-linuxarm32static.zip",
        sha256 = "1ffa23103da1564eeed767d1625659d1a100d430687ce0fdd5ebff05320e4f10",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-linuxarm64static.zip",
        sha256 = "df2dd659185634d979f4900315f29132731fa9b751bd0c0a34610ae3c9913337",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "84e1abe373b8ad08925ed057c472ed39f18a6bc7757a6acf55167e47791e4648",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "5a2640ffe6d7edb79529d08aa43d44fe06bd24fec4cfe639dec949cd0dbb7765",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "a5145ea5e48e3121b61635e94caadac18b358814b9d77a37b093bbe09bbd46c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-windowsarm64static.zip",
        sha256 = "aa0c8ae38f6222d466802375dda3d5e91e97f36b1606f074a2ca2c5fe9070a68",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "8ecef6fdce6156bbce7b0e50b4e155d4b0e4dd6fe20ff9c2ed05ab4ef7d485f3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "3d48c83a1dacc960bd4e5c5c11e0b006503226f9fbfd47690052c9d1a7e2e142",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "2abd9364be79f8159a99265756c8c3f0d09a124552f047e1dea9985fdf8b8882",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "ff6224c255cb02c46bee5a4a8e377b45a892fc04dc4788849801fd39fda186ac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "d378eb9d5d292b40d2aaf63b2a799985a8c4e28d72be1d02b1eaf791643ea240",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "d4d40c6c5f5ef1b379d06c644f469a4f395fc8352db6404bedcdf0a58ff2bc58",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "fbff73317764ae272e1b89a55668a099988061ef9792d7c350a17ad4f483829e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "d4fcbff4069f6125a4dcfdef6647978334c6ee06b7a2078c630a36268f4f6547",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "bfaa1cde275cb211a6bf32246197d8a2dfb939488f01a72f237b156abfca5fe5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "f48da2e54f45e4638198f964114a28eaf61502c9f5430de43565480712f8f7fb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "757b5f54e6b80246a1340da589ac36e74419fb7886eb752f60adaf50734e6091",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "ae7bf8da5524501858455491b99eadbcd8af0b3031cee4f7f308d2ea62def6b5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-linuxathena.zip",
        sha256 = "4860896977eab6d0f5df768a425e7a6bced95878375fb7d3952ef89372614934",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "9b70c804196a6bab8601f2906ab993afd39498fb5699858f2facad4f95b55e1f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-linuxathenadebug.zip",
        sha256 = "562ea4ee9aa39ca0e8f381b4c0367f41311bb98f537b1332a1a95396cee35e09",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-3/cameraserver-cpp-2025.1.1-beta-3-linuxathenastaticdebug.zip",
        sha256 = "911b50d2bfa11aa1602b2ade01406e9961ab9b7de300c3de54ca38724736882b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-headers.zip",
        sha256 = "fda643448427368b808fa2781a355af7d29d134dc8035fbb74ba82ff16b8dffa",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-sources.zip",
        sha256 = "f5df48847c0f2beecfa757e33c43b967fc242e67190b2768434b70316857656a",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-linuxarm32.zip",
        sha256 = "9877e2896ef4227a5e86630e731df5a053126042a1a121c43dc04fbcf9ac8c0e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-linuxarm64.zip",
        sha256 = "39bc9bb5feec69256e6d3b4ff80cdfb3f349d842614c026b45c89d69b41a9d17",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-linuxx86-64.zip",
        sha256 = "0657523eb07d89bb5d3a23374513d42abccf0f0132985431e36a106f25b080ef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-osxuniversal.zip",
        sha256 = "bdeaa15cc2fd0285a36db64b9496a0218719d517baac0918002d0f52c68b0c65",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-windowsx86-64.zip",
        sha256 = "8e3ef982f2bc9478a39375799e131b3a9fc01c7a3a4d34539944a638e81c5b8a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-windowsarm64.zip",
        sha256 = "17906e3cf29a6c55c9b84fd8df9492a998218f97b810b95ff9e6328fedd71236",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-linuxarm32static.zip",
        sha256 = "7c48bf54f2164756bb8f99c94c72dfd0276f23eb53a34a0440d7396648ddf8ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-linuxarm64static.zip",
        sha256 = "3713e9770a551e47714bcc487ce29afe0262f4e924a5909c3a60126e104115cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "0ae87a62b0abce7b5b0c16264a17c934a86e9391ef92fbf83cfbc997279378af",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "12ffb4f306b4df663773d6db4e651bae65e2f3ad6d75bda570cd3efab75c6352",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "7c1966b28214c1b459eb58a819c61a23ab07f07cf20778f26b24e0ca1ce37a80",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-windowsarm64static.zip",
        sha256 = "6406415d441ed8627b7bf8fc75a7a729bd662169cad276592975cddf4c81a055",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "8705c80c9aaded7e6638e6e121973268bd6cc4975fea97104b7821bae1c6b0f0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "cbdcc4049fa80eae35dfc2612021c61ad3276d67ae86203750cadb8a141cbd63",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "a48a81029c382ebca18c6deb45522a2bef272be14de939b76f44ec59ed50a676",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "50a2039284176a32826ca4788c079a41b7ad0ab3d53efb9edb3c778bff0fdbc9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "64256b9fd044dfa3e338f0877984a646350d3a567e87e3664d320b3061a0ba3e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "1e9ea87052b9d1f5a34a777d268afc1295cbeca766f01b86df0b34eb6ac71fbe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "0f3f516a72962dcfce183b9e596505291791820de6fccbdf7db1b653000b71d6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "0f4f1b5c48e81e5235cec04e2eb0744adc63568a079d7bbc6afbea84d3e74a61",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "d021f2c4f1d8d847156a66334993375b8c629cd9a405015ab3db7264c4c4c75f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "e75e8bc7ea9f8d7957400b500d905011485187f0fb998125905bcc5820acbf1a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "e369b44ed2bc013528bf19c4448509f6c51c941009e2e299d4a2f5dde1a68a04",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "c6e4080b95bd6fd4fbe083c7c537ba0b3c0b013d7e0758f2a01df17e69919f45",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-linuxathena.zip",
        sha256 = "47cabbda3d4d4c111b7da9a74062894766f8a15203ee7c5ffc1b09f919944673",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "903693bcad35bc9309e7b9d6a038ff076b671e77fb5183a78297d84f0ea6676b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-linuxathenadebug.zip",
        sha256 = "416447d2bf3a1014c5348582447cbd8aec6c8d79c85f49ade1ff78a04fd48c93",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-3/wpilibc-cpp-2025.1.1-beta-3-linuxathenastaticdebug.zip",
        sha256 = "c1f60798319fb187fc70c74e1fffad1183f075a3018d1d61dc01dc833240b67b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-headers.zip",
        sha256 = "e844d9fbbca43a4175ad676bbb9cb9ed1b304d76af30a5c6c5f32f45132d0759",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-sources.zip",
        sha256 = "fc6aee35a54f48b11fa774abdce007e332764b17baa9a02aa4a88e870ae2c67f",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-linuxarm32.zip",
        sha256 = "abf9e603ead18f802f5fe25443fa75b97f57eeab71040ec5fc8955c52d485a8c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-linuxarm64.zip",
        sha256 = "02193bd35d13f91545a732e9dca4eecc06b15d1fb4fd8ab5702b40046e6f3bd2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-linuxx86-64.zip",
        sha256 = "c5abfc3fbe29d77471b769f1fcf02905d4ffca8fbdc9e7e3134d59eb4c8d99a9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-osxuniversal.zip",
        sha256 = "1828aaa307c94c9c06caf0a5bf2557cff67174bb5497739685c108e2447e5ea2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-windowsx86-64.zip",
        sha256 = "e839824252320ff1b90a2977f2fd5b8008cc6af72fc682dab3471af3140e3d3c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-windowsarm64.zip",
        sha256 = "c9746cc56a078ade1892ee996dbff96cce554aed8d857583eca1e6985700d446",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-linuxarm32static.zip",
        sha256 = "26d88051a0b687b69ad0329b434537d1b707397a9744a9d96216deb6d9195149",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-linuxarm64static.zip",
        sha256 = "f4b315f4683161a40169b6533e6349138cb045a464f820136623063619abd3aa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "5b700f4d80d39516f9dae30f032259071d70ce93eea3e9beef3eb8ed6367def0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "dd572af2c7f3b84414543810fb72c7b99f4d57de7289c0ee44483690965f0098",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "41260bc8b6bb151a25b8f583b16f1190372b78ff6bddeb785ddbc59c6c14eee3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-windowsarm64static.zip",
        sha256 = "9d6be677f3b2a87e32353ae74e2a1ec73d060bd79c3bc4bbf924d1fe9b27eb67",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "3f3192c920ae3d26f5e475366ed919fcfbdcb955752fddd21ea42e0c732f374d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "f917fe4e9a3bcbfd51aa2ce4e7c7f1b91d571cb28ce5c10df5eeaf65b5ff7f34",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "e2b6755eda72d290646815e198aadc968baf75b9d49c56e5a90f78a277a21846",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "4c1a26c2cc79223c6bce9d327932f4c69276843149a2f97fbe0ebc448c7b77c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "cdc5b7630bee516c8bd2e0b770a4cf5176e6808b29780a762e56adfd98b9f767",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "64eec01f1cc24c648f3ccb774dc08568485ece3dcb0629ea06137dab0b338d87",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "b164c26ebedde71cdd2a76fd37b2e35473feff80e51ca50e3e163f00b15c4485",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "5d74e47a3d155779fc121a6d6ce0f805089fd5bfc297ade7b7238fb00f08c283",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "38d1146137be4c18d401330ca9b3d3d2966a7ece5d7701d1a55f36c295353b4d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "983d25d83848fb3670609d97cb1bbcb97da11efe2b9a0b271b3fe4df418aeed7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "ee5c601cb69b35df2ee68f7f5b3ceb5a4d79eafb789f1b94e757822accf24635",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "5a0c91ced3122190e77e94d8931b66e505634aef9c92cdabe82668927bfde070",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-linuxathena.zip",
        sha256 = "f001ad3c34657fc3fa178e155dbcf0ff9d1c324c01286ca95426b3ba21162e1d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-linuxathenastatic.zip",
        sha256 = "455ffb5547e984f6bb215c8b1de47d2c562f89579aaa87a72bcf03747fe38353",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-linuxathenadebug.zip",
        sha256 = "ef33fff3a3a75c774f7e6a6d9d344cb295c48beb0ad517655553d2f042a98fa4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-3/wpilibNewCommands-cpp-2025.1.1-beta-3-linuxathenastaticdebug.zip",
        sha256 = "fda57e60757402860fe5c4121cbf961bbd52092e8242994bbf684d052e7707a6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-3/halsim_ds_socket-2025.1.1-beta-3-sources.zip",
        sha256 = "e84717990fb19e6faa9a6e2bd6c9f53c82fd5cdaa01862bdd0b56098cc7c2450",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-3/halsim_ds_socket-2025.1.1-beta-3-linuxarm32.zip",
        sha256 = "d34ed99ec88e7249ae42a36bd812f5664e9d5b74ec42646455e7b40ef6dfcc0e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-3/halsim_ds_socket-2025.1.1-beta-3-linuxarm64.zip",
        sha256 = "f23d453ce2d43f0866016a0d0ef47510e2a2519ac0af2b360977ac777e6064f2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-3/halsim_ds_socket-2025.1.1-beta-3-linuxx86-64.zip",
        sha256 = "f9425ab5a91d5b86d4ca0ee4d125ecc0818041518214884fb50f190e489aaae6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-3/halsim_ds_socket-2025.1.1-beta-3-osxuniversal.zip",
        sha256 = "500ffdbecc65db734d4463608ea855508b1f60983064b76e85a65b2e2ac63f35",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-3/halsim_ds_socket-2025.1.1-beta-3-windowsx86-64.zip",
        sha256 = "bc558159ff0e54662d03f2a635a98aa66e60e299b00bc9164023713849c97035",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-3/halsim_ds_socket-2025.1.1-beta-3-windowsarm64.zip",
        sha256 = "f7d9b1f54f16e67d65d85d8944482e48d6996628da53959c6873d156e8f0c481",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-3/halsim_ds_socket-2025.1.1-beta-3-linuxarm32static.zip",
        sha256 = "daeedb87cfd3d71d7e2dca8b9ee766469e212e52c596f7e324a04f3cf52aa333",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-3/halsim_ds_socket-2025.1.1-beta-3-linuxarm64static.zip",
        sha256 = "5d6f495428a30674753e9606f41b44c927ca55270e67ec450a371700930d5a98",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-3/halsim_ds_socket-2025.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "d2f1463e49e7ac362d79a2ca690215e38013b350e3c86928de64f1ccd42b2d58",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-3/halsim_ds_socket-2025.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "4c630d91ee1a7bedf731224cbe742b7fc92b48b9333204f25cfaa02404a799fd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-3/halsim_ds_socket-2025.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "8cd58eb174354ed851168416453f9d8dae6f2473abe7d69ee285c2169bf626ab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-3/halsim_ds_socket-2025.1.1-beta-3-windowsarm64static.zip",
        sha256 = "6711c1ea22c9f0e0f7b641a5cd227dc73773dd13c9676f467584a16f992c0533",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-3/halsim_ds_socket-2025.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "2f4273e2458a1fd0186fdb2ee21768fc3d291729360b84337680e58c48f5f30d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-3/halsim_ds_socket-2025.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "425c4e26c289f3766abe8ecd0f3659e622a815f0e50c18bf25d6ae6ce1febe6f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-3/halsim_ds_socket-2025.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "4b4959dbe9ea9cd1bbfeac054220046544cab809304d260eeb9236f8ae704b83",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-3/halsim_ds_socket-2025.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "cdfa40e3f516680a337e3917158a0e45646e23f08c9111b9db292c7abd1cd5ad",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-3/halsim_ds_socket-2025.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "1d6b14f886b15f6bb5b8fe02c041722a244d42cdff89364849bce927051dec6c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-3/halsim_ds_socket-2025.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "e1410bca5844526749ae2cc97aa9d8356516ee24af843ae5cc4d5030ec9bdb0c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-3/halsim_ds_socket-2025.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "ae95070b4fd0d16de321f328c1da8d690de0b73675d77a5dac07925ef39d3ae1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-3/halsim_ds_socket-2025.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "1ba1de3f5b966954995d6b666594f6bac90df6d75a1fdcb6fe07379cc1a103fe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-3/halsim_ds_socket-2025.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "ec7fa249fbfaf8624f145887614980a874dde46b9db1be5910164133a38adeaf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-3/halsim_ds_socket-2025.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "786c716d253824a5f1f3c53c732be4188db0e6f5825171079cd92056bcd09c42",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-3/halsim_ds_socket-2025.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "f7b31e37cc2b9a4d58d0e0d9d4880c81db70302b4d1c4086a3db688ec0cba01b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-3/halsim_ds_socket-2025.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "b227053aba518e37a708b18c36efa53a2162e9725afb78893acd24b6174d8190",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-3/halsim_gui-2025.1.1-beta-3-sources.zip",
        sha256 = "63b0fd3343ba9d3dfe49ae83e8d63f4f17f2df7d4259a2e3e4bf19d26c572ae6",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-3/halsim_gui-2025.1.1-beta-3-linuxarm32.zip",
        sha256 = "4e433c215a074a23bee28f253de7389625ccffa6dff2c2d773f8d1a7ea9eaaa1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-3/halsim_gui-2025.1.1-beta-3-linuxarm64.zip",
        sha256 = "661d0735e99d75704f70bfc18fd2d9d53388747f145f6266ffab47cdb8216248",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-3/halsim_gui-2025.1.1-beta-3-linuxx86-64.zip",
        sha256 = "cd9138171ec048b06c39869705c8e52dd048c96cfd0c17c520a0a81f31a637e6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-3/halsim_gui-2025.1.1-beta-3-osxuniversal.zip",
        sha256 = "e94fa0faab2e1338f1ba93258bd74ad80cb30a40c01db450c37233315f172c61",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_gui.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_gui.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-3/halsim_gui-2025.1.1-beta-3-windowsx86-64.zip",
        sha256 = "a4d5308365c3acda50327098b935e6a7c9d05f01e811b19495bf5e7fb89e85df",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-3/halsim_gui-2025.1.1-beta-3-windowsarm64.zip",
        sha256 = "2283aa13828989234051583b20dfb154b56c491523f72f634786315fc12497dd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-3/halsim_gui-2025.1.1-beta-3-linuxarm32static.zip",
        sha256 = "ca56a9b86a30941745a9ae64e78f8c585bc715c882284a01f69e661dd4050f4c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-3/halsim_gui-2025.1.1-beta-3-linuxarm64static.zip",
        sha256 = "1a8b2a5a9c7f49995c2500be27227c1814d8dea622e3aed72d3d2d9c0b5e69b2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-3/halsim_gui-2025.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "4af9d79f72da093cf47f443690517d7674c87c9358cf7f3bcb53a0fea2729e6d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-3/halsim_gui-2025.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "8fbf18c9d24da580141de97e9050e0fa7e57457035018f98609a088cd5a83193",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-3/halsim_gui-2025.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "3374afb6fa32e8c47a3444ca7594e0789021abfa6837d1db0819d2b469f5f339",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-3/halsim_gui-2025.1.1-beta-3-windowsarm64static.zip",
        sha256 = "6b2cf2ce86e29cb49f0ed86a6ffe16a558be2b1d7c6fd6aa655719392b3f9825",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-3/halsim_gui-2025.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "5e5c04d73d2218e0340ff7dc86c57a0f61616b625a2756d132a25594c9760b92",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-3/halsim_gui-2025.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "6273aef07dc7ebcc361f9e84e870069b29c487d6f99a640ca065d5ce96343a47",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-3/halsim_gui-2025.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "b9842f84aebcf1a60362c62ed84fd49ebe2812a899b13b8a64ded14963f84aed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-3/halsim_gui-2025.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "51974e33f15623cce34c24d5fc405f4eaf361948a978181e4c4d1894b72b1cf3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_gui.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_gui.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-3/halsim_gui-2025.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "10edfc2ac2c3f1de63dd4e86eba4bfea10d713a5a4e83b1e0ef7ad07b3fe87b2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-3/halsim_gui-2025.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "ff89b96f535ab8a3151daef119c39d71cbe2b4cc6ccc939940af723beb135c0f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-3/halsim_gui-2025.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "a287780ca06b70c38ce98fc17e44fdd881079e9340115eabe7a72b643db7832d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-3/halsim_gui-2025.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "822dab6f0e4cd141d761f47524ca4c6799420677c3af8d217787bd61f2edb7ef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-3/halsim_gui-2025.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "a0abc70b9ececeb52dec7660f3248ba11e65c3c7753d35e68e05042401f04f62",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-3/halsim_gui-2025.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "7b2cf187a5b73d2b380a3d2b29e9634b1ae505514c41d5c3097b150f56666dcc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-3/halsim_gui-2025.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "968b0e2c780652e43e9d09b8b531b380393f02a019b319689f9c65eed259f924",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-3/halsim_gui-2025.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "bf363f23617a0ce8f159210db53dc1b682d57004b2bd11823c93414e504e7bed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-3/halsim_ws_client-2025.1.1-beta-3-sources.zip",
        sha256 = "8aa52565fde52d0162cdbc19259de25b615522a005deaf7ee9c2d90275cff453",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-3/halsim_ws_client-2025.1.1-beta-3-linuxarm32.zip",
        sha256 = "d97773b248366aaaf237daf7ff6ca3aafccb2664479dba43a052b2cb76f7fb31",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-3/halsim_ws_client-2025.1.1-beta-3-linuxarm64.zip",
        sha256 = "bbe7bf1388b9e3924eba4a87913a9eaf4649ad5350885c46055405fbaf648fff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-3/halsim_ws_client-2025.1.1-beta-3-linuxx86-64.zip",
        sha256 = "ba8fb38e963a10f0576e9403c3867cdc79b8238802f42af880709da910ee7c75",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-3/halsim_ws_client-2025.1.1-beta-3-osxuniversal.zip",
        sha256 = "9ff0da89f4243b8db7280dfa3caeec9c0b2e578a59a6b26b5275da55b5fb78dc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-3/halsim_ws_client-2025.1.1-beta-3-windowsx86-64.zip",
        sha256 = "6672910e6de8dda04f8ebcb642593f3249dbdc9639213d1dc3490af3dc4d111c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-3/halsim_ws_client-2025.1.1-beta-3-windowsarm64.zip",
        sha256 = "be5c8a36f0e1520187c14f46cd1a64520419581f7dfea242254017e6029c6d7b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-3/halsim_ws_client-2025.1.1-beta-3-linuxarm32static.zip",
        sha256 = "23af14e30803ad0bf668448ecd57a7dddd5af164705dbee68964e119263d0009",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-3/halsim_ws_client-2025.1.1-beta-3-linuxarm64static.zip",
        sha256 = "5ff97ede4fdf4ffd09168ffcf0fecbf140d88dac3b34477e62ceefe19f72e5a6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-3/halsim_ws_client-2025.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "94e2afe18e12cb5d41be1b20fa7fc57db93ca6edaab6d7fb896c876a8ea45611",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-3/halsim_ws_client-2025.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "7be4b1bc030260f09f63e5204056eb5909fd7a50e0cae6f38b19de11cc0cc243",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-3/halsim_ws_client-2025.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "2589c323fdbd45b877022788a5c034c00e2c4f316a3b683317f507f8d0dd7750",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-3/halsim_ws_client-2025.1.1-beta-3-windowsarm64static.zip",
        sha256 = "0c9c9ef445601bcf1bc73d3c8eb99cd0c0f4ebbd4340dea846c0fd0454bae7f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-3/halsim_ws_client-2025.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "9ba071f0e93a06f67cbfd08810e8f575ce8e8c31186e5a46d4e3e299e603c280",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-3/halsim_ws_client-2025.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "bd3d5de5f25b312e23a1cf3341cdd48e073225ff3db9333f8837c784d3d23ea8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-3/halsim_ws_client-2025.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "724e1bcaa45168d816f891d2e665d6bcce2111631bc8469870ead6ab7a266068",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-3/halsim_ws_client-2025.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "8a8b80bc47ff741b3e03609a60c4e76a3a2c977db8ee97f37fd2339ce96fbd5c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-3/halsim_ws_client-2025.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "26ae06d16effac27258315e99baad2f6a831ff0fc61544ea561ef601d61dddf2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-3/halsim_ws_client-2025.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "79c9d4699cb9862e1b57ec1b6806e3abf23727c23451cba503236d2461ed4634",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-3/halsim_ws_client-2025.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "526788c52c941d0d13aa43a39d09a640f942af47a6788221d91695f738c6d0fa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-3/halsim_ws_client-2025.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "8d297e5fdc23c484933312c55093a2c653e03a31a2c96115addb4d0d2e6a9d7d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-3/halsim_ws_client-2025.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "9f440a305f3b9e5dcb0e41bd55e53652f229e908a3c06d846dab2827e05935f3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-3/halsim_ws_client-2025.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "07fe8e355903227494ae4901c1a8cd91817bd0e1ba8c5869b0983bae7812b073",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-3/halsim_ws_client-2025.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "267bcb247045b0d851ee929d502517fd0427693395fc7857000883eea6e444f8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-3/halsim_ws_client-2025.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "f185648fa57d24cd641573a3dc7fe7429ae02b15907233bd85b47b957434511d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-3/halsim_ws_server-2025.1.1-beta-3-sources.zip",
        sha256 = "607f8cedd264772b886d99b5545ce1e76785739b7271d4377fd511a389a9421c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-3/halsim_ws_server-2025.1.1-beta-3-linuxarm32.zip",
        sha256 = "50d3c7b6bca948b3001c8a2ef1a971712461e2cd31db7a57cfeefec206187711",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-3/halsim_ws_server-2025.1.1-beta-3-linuxarm64.zip",
        sha256 = "baf9b7c7a4aa0c8a58256bf477ca58f5c8df55545d6f1c3f37283863334a9103",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-3/halsim_ws_server-2025.1.1-beta-3-linuxx86-64.zip",
        sha256 = "bd051a30822f4c458b6e225e31e2137487d42c74a03900c1e9387a4a474af153",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-3/halsim_ws_server-2025.1.1-beta-3-osxuniversal.zip",
        sha256 = "59c8e6252a3b5154e4eaca469a4077fbac6f3766c828a12dae3a4b2d364e0297",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-3/halsim_ws_server-2025.1.1-beta-3-windowsx86-64.zip",
        sha256 = "923137fc3f85373a38cfc760f4629ffd4ff8945633d1a53323bc964274baaeca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-3/halsim_ws_server-2025.1.1-beta-3-windowsarm64.zip",
        sha256 = "ba19d061b08a34bafbd34d7998cfdf1bfedb7554a2535688db2307fbf96a1924",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-3/halsim_ws_server-2025.1.1-beta-3-linuxarm32static.zip",
        sha256 = "d08f9989f800aa0354625be02b0296d4bf220d8bbbe02a28829cd879d580cdf4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-3/halsim_ws_server-2025.1.1-beta-3-linuxarm64static.zip",
        sha256 = "c79c8e30ee1c95a8795179281045c3f8b51cf2eb4e73e5fa44d7c44f6287f3cf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-3/halsim_ws_server-2025.1.1-beta-3-linuxx86-64static.zip",
        sha256 = "aa73c80afb34d3c846e76eb15bbbf73d7f770ccb881b93806dfbf8323d9e4483",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-3/halsim_ws_server-2025.1.1-beta-3-osxuniversalstatic.zip",
        sha256 = "c8a58223e7a11ad59aa6ec3e3a4cab175b83a2f90b7b8fecd2c7254c4bd93792",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-3/halsim_ws_server-2025.1.1-beta-3-windowsx86-64static.zip",
        sha256 = "a86d739da9c083d746d7e8b8d32575bc2280f4008e7d81468cc724c103499ac2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-3/halsim_ws_server-2025.1.1-beta-3-windowsarm64static.zip",
        sha256 = "acb801be14991bf2cf0569bf160f484e758ec821cdd64b54e66ebbbdb63458ea",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-3/halsim_ws_server-2025.1.1-beta-3-linuxarm32debug.zip",
        sha256 = "bc094ae4c68ded3636e4709c824cd47fbfdca19aa1242c0e166b140816fbddf0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-3/halsim_ws_server-2025.1.1-beta-3-linuxarm64debug.zip",
        sha256 = "46ec19fa4de0027563ead19102ec19c65f0e563883018ca01efec0d636432ced",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-3/halsim_ws_server-2025.1.1-beta-3-linuxx86-64debug.zip",
        sha256 = "132e974aa4b34652c09e721d7c8f8a4a33e543b8518b162b85d661953c228634",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-3/halsim_ws_server-2025.1.1-beta-3-osxuniversaldebug.zip",
        sha256 = "89ffd6a5906883c39f8acecc54821712b5f59eeb878cd1b186de3be84bfeb006",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-3/halsim_ws_server-2025.1.1-beta-3-windowsx86-64debug.zip",
        sha256 = "ff88d47f8c5ba997722aafd3db361c388b0ba0b852b4fa4186fa05a50793ca89",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-3/halsim_ws_server-2025.1.1-beta-3-windowsarm64debug.zip",
        sha256 = "c9f9f194fc834b00385ab9227c5862ecd7c80caaf3cb39d1c695a8595e05b6e1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-3/halsim_ws_server-2025.1.1-beta-3-linuxarm32staticdebug.zip",
        sha256 = "ccec31dca887695fb6a18cb467283d69d49f47cbcb4aa09c7e8dd81d5d077cfa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-3/halsim_ws_server-2025.1.1-beta-3-linuxarm64staticdebug.zip",
        sha256 = "3016c68184eb1282b2358c40e71b6b931115a118e10576331365377941cd66e7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-3/halsim_ws_server-2025.1.1-beta-3-linuxx86-64staticdebug.zip",
        sha256 = "16ba3fd867b3c5c59f337ba4722e244ae0fc35a8f4a7b59d2f1bc155a72232b8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-3/halsim_ws_server-2025.1.1-beta-3-osxuniversalstaticdebug.zip",
        sha256 = "d278dbc6ce1f60821a862d545811db7e5d4c9c58ad22608deafc909b0099631c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-3/halsim_ws_server-2025.1.1-beta-3-windowsx86-64staticdebug.zip",
        sha256 = "4f5c7d9f48454025f2269ce4017724dd619a313e8a73e279211289a5217cf296",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-3/halsim_ws_server-2025.1.1-beta-3-windowsarm64staticdebug.zip",
        sha256 = "c6dcb51959cfa250730f29c14c2f6ee99614c70d9eedc00e39c483d47f6530d0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2025.1.1-beta-3/SmartDashboard-2025.1.1-beta-3-linuxx64.jar",
        sha256 = "95f7cc3c7c7c6647072badc74ed4b8cadd89323e5a64c07b243e5a472ad4c34e",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2025.1.1-beta-3/SmartDashboard-2025.1.1-beta-3-macx64.jar",
        sha256 = "c5f3a573007722444fa779a76222c9a6beb09d9d1f6f2037b14515cc1092a82d",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2025.1.1-beta-3/SmartDashboard-2025.1.1-beta-3-winx64.jar",
        sha256 = "5799eb942507d3736be5df17734bde21d7b3a3a111269c47d8f80a96b2f5a6c6",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1-beta-3/PathWeaver-2025.1.1-beta-3-linuxarm32.jar",
        sha256 = "9a4a0ae45922ae2ae086079f63f5f8cc03e128cc332ba983350eea36edd7d4a8",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1-beta-3/PathWeaver-2025.1.1-beta-3-linuxarm64.jar",
        sha256 = "9cf0d61470c5199354e1f36add66c3b06fc839d7fbd57a0a6b5c410104bf85ca",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1-beta-3/PathWeaver-2025.1.1-beta-3-linuxx64.jar",
        sha256 = "217bd5c537ea1ad75481b111fd0ff9d492f7444b58f0ec03506a0b60709b9ad5",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1-beta-3/PathWeaver-2025.1.1-beta-3-macx64.jar",
        sha256 = "6e6e0a03740e828e72b99e7a8e88eb59a789b777c82c985a7f75ed36afee53bc",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1-beta-3/PathWeaver-2025.1.1-beta-3-winx64.jar",
        sha256 = "dbfbc7f05aa0e7e7d4bfc7d3f7f13ebd4b9e895392661ac2b7e054a4c6358bc8",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2025.1.1-beta-3/RobotBuilder-2025.1.1-beta-3.jar",
        sha256 = "774109f5949d6a1682348b1283d14c263b5c112921840c2182c532904fd0b601",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1-beta-3/Shuffleboard-2025.1.1-beta-3-linuxarm32.jar",
        sha256 = "30c94c67003411714f370f4dcafba641c23f8251cd58767c31e09351eed4acfe",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1-beta-3/Shuffleboard-2025.1.1-beta-3-linuxarm64.jar",
        sha256 = "a465d339f001c736c68469e8414c66ec1ff8b99d11a1d36cd711771dd6fd2bc8",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1-beta-3/Shuffleboard-2025.1.1-beta-3-linuxx64.jar",
        sha256 = "5e397f840059f00dfb5123b2d6ff5a3ff9f6b21aca77aa51c09154aab0551d15",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1-beta-3/Shuffleboard-2025.1.1-beta-3-macarm64.jar",
        sha256 = "28de2783d3a3eb4f42b871891a53ccc14a77d907eb6122fb65a29fb2fa0558bb",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1-beta-3/Shuffleboard-2025.1.1-beta-3-macx64.jar",
        sha256 = "b0ad7d8c51f7a9bd817e85b550a3410af8d50b88be0549c0d8c8bb541f141cef",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1-beta-3/Shuffleboard-2025.1.1-beta-3-winx64.jar",
        sha256 = "58e2a2e3c876383796861a40a39f69db75e61c50433fa644464f512694ec8226",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-3/Glass-2025.1.1-beta-3-linuxarm32.zip",
        sha256 = "227ae026f89a86f10b05fc6236b6f35222cec0263765b79d8fd670772eee36a3",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-3/Glass-2025.1.1-beta-3-linuxarm64.zip",
        sha256 = "73df2f9fb174bb23264fc6802726438478c3135f5a3ae0220e9dcadd45bf3995",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-3/Glass-2025.1.1-beta-3-linuxx86-64.zip",
        sha256 = "c902be68ba2ea53b93c28a0ce56ef6d76fe7273f2b96d95a7351d8fd38da04c0",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-3/Glass-2025.1.1-beta-3-osxuniversal.zip",
        sha256 = "b9d0c9a94abc7c8e1c635dd0381bbd19b4f7a66c8385cba67fca3c50faf95924",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-3/Glass-2025.1.1-beta-3-windowsx86-64.zip",
        sha256 = "02a252e0ffbfc37fada78e5faa78fe5385117e1d36275ad60ed2fde9e7fa084a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-3/Glass-2025.1.1-beta-3-windowsarm64.zip",
        sha256 = "3a695309e4bbc0d8f35a90ea2dde177787fe6f0410e809782d22bed0f5452abe",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-3/OutlineViewer-2025.1.1-beta-3-linuxarm32.zip",
        sha256 = "fdfd072c64c9ccba5dd895e621853b30d2029f32b9bcea1115ff863448d74fc2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-3/OutlineViewer-2025.1.1-beta-3-linuxarm64.zip",
        sha256 = "68dce34b11aecd9770c78b74884cc8f9756c6e2192c602eeec462f05b7d7dc7f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-3/OutlineViewer-2025.1.1-beta-3-linuxx86-64.zip",
        sha256 = "11d50520755e47704d45ee9c7df30465ff85f4bc994736bf9a6d24a62af042c4",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-3/OutlineViewer-2025.1.1-beta-3-osxuniversal.zip",
        sha256 = "a670a106b8251590081f29243186e9299dc900c34c624f26b2fb988d2b6df119",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-3/OutlineViewer-2025.1.1-beta-3-windowsx86-64.zip",
        sha256 = "88ce9047bf76e3e509da3a9f8cb489c6c9ee50e3b427496fbe86260357b5aba8",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-3/OutlineViewer-2025.1.1-beta-3-windowsarm64.zip",
        sha256 = "b3d432d17d30e49e7550d0ca0dbec2546784cea9d9310b75ad7ce22db47a3347",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-3/roboRIOTeamNumberSetter-2025.1.1-beta-3-linuxarm32.zip",
        sha256 = "ba5082db5bcd5ba457d809918a0b611b132a3ddf08c1a79ed519a8d5c403b1f3",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-3/roboRIOTeamNumberSetter-2025.1.1-beta-3-linuxarm64.zip",
        sha256 = "7c6ba609876d5f4b22a80e7f7ce656ba88881577fb5d1e6018d4a0282c50fc50",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-3/roboRIOTeamNumberSetter-2025.1.1-beta-3-linuxx86-64.zip",
        sha256 = "1a5b5cafe2a3105f7d5dd7c6cca9b4f622c740618f138fa81c7d081991306601",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-3/roboRIOTeamNumberSetter-2025.1.1-beta-3-osxuniversal.zip",
        sha256 = "5bf60c1fe30415bd6413336bf85bd891162bc112fca82b7e88642a2c7917c6cb",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-3/roboRIOTeamNumberSetter-2025.1.1-beta-3-windowsx86-64.zip",
        sha256 = "d4d8b6c5344b0211cfe5a124e31ee7fdd71e9caf25f5fc5d4a61ab3a89529336",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-3/roboRIOTeamNumberSetter-2025.1.1-beta-3-windowsarm64.zip",
        sha256 = "a896b4f4cba6d6c09ba504aa4d49871c0e47d9c18bcf87b019edea985ded72dd",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-3/DataLogTool-2025.1.1-beta-3-linuxarm32.zip",
        sha256 = "3fecb95f6b3b7e045c4496b83b132c5eb07dfa16bf602a6e416a302e031c86c8",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-3/DataLogTool-2025.1.1-beta-3-linuxarm64.zip",
        sha256 = "7f557408675c8a2b4ba5722cf3867f888bc0c3f71f6ac6b4acdd47876277e365",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-3/DataLogTool-2025.1.1-beta-3-linuxx86-64.zip",
        sha256 = "efabfcc16399a0e1d9a2c49d4125156364faa80d4cc568bd483cdba9423a810b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-3/DataLogTool-2025.1.1-beta-3-osxuniversal.zip",
        sha256 = "9356ea6fffef9ad6793eafd920038fdec5f802b238752eaa044b348e5d376f97",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-3/DataLogTool-2025.1.1-beta-3-windowsx86-64.zip",
        sha256 = "dbc0887e35a5ee6b7d6e6d61760a64b8cab1542b60a50907df2a101ae57b9417",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-3/DataLogTool-2025.1.1-beta-3-windowsarm64.zip",
        sha256 = "60785805dbe559c20b1ad620a8d7bf41f12e866a82ea6399fffdf9c225f58330",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.1.1-beta-3/SysId-2025.1.1-beta-3-linuxx86-64.zip",
        sha256 = "8cee278dddec890b675d7b1d3c5ce45dbfa9a6c5bd9af66c64348b01652c2131",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.1.1-beta-3/SysId-2025.1.1-beta-3-osxuniversal.zip",
        sha256 = "2ec25f90a0823fefdcad06ff2eacdd25b2b9afb22f8aac447711af690d87dfcb",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.1.1-beta-3/SysId-2025.1.1-beta-3-windowsx86-64.zip",
        sha256 = "a5884c001c192f719a93b512b86a122c01288504be03a62a2630e382b8c6ff94",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.1.1-beta-3/SysId-2025.1.1-beta-3-windowsarm64.zip",
        sha256 = "ddb80051f528d56745a81f6952c6e1a25e8ba81c2f49ace84c95316f61d02a94",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
