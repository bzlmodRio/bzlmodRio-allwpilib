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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-headers.zip",
        sha256 = "12d193b7e0fc288c3b6d281bbf4a7efbcb6b6d57693099eca06e1e6435d31254",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-sources.zip",
        sha256 = "d910da97ae3e57fdb1cd92eb22f29d04eca1c063f363667e9d9c2c53b12c322d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-linuxarm32.zip",
        sha256 = "71e009f5203f14e1018872a8d5512de477f8c6b105a5077a1f004a3cc2dd5da0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-linuxarm64.zip",
        sha256 = "cbc5965b2df64c97d48b23f64765a0726193dabca768185085a139e8ad507e2e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-linuxx86-64.zip",
        sha256 = "658da2863e3c57a73668b1c4974d00ccd4b0d20a23f0c139e3af3c0c1c55f738",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-osxuniversal.zip",
        sha256 = "24017a5ee182ca00fc42f46c302abf1b5e23fb5232074e242955878be2b81adf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-windowsx86-64.zip",
        sha256 = "6b0010545ac7abf9560a0ceb979e0fae01652f3fc1224ab8ede41b085a33dd23",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-windowsarm64.zip",
        sha256 = "cd56751b047cc10a9c05be2ddea4397408c15077495c9ba1a6c71f5db2e873e5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-linuxarm32static.zip",
        sha256 = "cbc162352508baa9936537658628ee0a2909ac11d84912989d937cc48bad045d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-linuxarm64static.zip",
        sha256 = "c67e9649db92510a52528f39ee9f0ddf562776f7f08b3dc1608d3a1d72df4048",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-linuxx86-64static.zip",
        sha256 = "e41884df0745774901d78ecb2da8baf30fd1183f8093dfc74685ec4653595bf8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-osxuniversalstatic.zip",
        sha256 = "0b095555c9a8a46e47e1b59b9ede580c581826a45271bacdf74c60751ca9fd37",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-windowsx86-64static.zip",
        sha256 = "c6349e90dffd73cba9d819bfbfff44aeaadb3b22f0eb9abc191bec161e7e34e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-windowsarm64static.zip",
        sha256 = "970844d7df46de3929bfbff480a30bab5713994e5f8209bb332cbf79886dfc1d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-linuxarm32debug.zip",
        sha256 = "e2af68b82d08b0262d2c9e6ce488f2e91d25d5971e9731fae6d0c7d0b9ccc0ac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-linuxarm64debug.zip",
        sha256 = "e09c8155c5d48fbcb0054e11f46d4985d5d39a5148f23a628bfc82514ba9f0d9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-linuxx86-64debug.zip",
        sha256 = "d5b556f3e10b9a6e3af2e1e11368ac0281f29b7b308f805fb9ce1d6c738f8598",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-osxuniversaldebug.zip",
        sha256 = "c856ad24c58e0002720b3c866969370d2d5a0696fc1a3e97195d58cb55dfd352",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-windowsx86-64debug.zip",
        sha256 = "d3b52946e80f76cc86ecada59367b64d0ceae1b81f7107a00092487e22a92911",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-windowsarm64debug.zip",
        sha256 = "a9cde5596e648a4862a4ba6e371c2924607b1ff9901d1e81479788191deb0071",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-linuxarm32staticdebug.zip",
        sha256 = "4afa2d15fd1679345b113dcb52e38658831b8172941e789e13905d6614d5284c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-linuxarm64staticdebug.zip",
        sha256 = "bdee8d670c88d94d6e2e6108d6de7dbb1a27a43de1d0ec6bc0e2d92e8422907a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-linuxx86-64staticdebug.zip",
        sha256 = "a31c5a965dd7e1cdd1821c9226670e9032ea4159d8f396ea3a1dd9adeedfe748",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-osxuniversalstaticdebug.zip",
        sha256 = "409190420b831800fed03c4bc8467e36cf8febb9ae041ff92700155cde85b6bb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-windowsx86-64staticdebug.zip",
        sha256 = "aafd27cdbb37755aec697669f83648acd47d783527ddbfcd3010dc44ab7d3b41",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-windowsarm64staticdebug.zip",
        sha256 = "7520e2b935ccbe5e4fd17aa07e4bd99543c1ba7d33aae848cb9dd9c18485e86d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-linuxathena.zip",
        sha256 = "152e2adde9968e47cd42c08d12144f83e94325185ba37022c9155bce6e9bc0c4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-linuxathenastatic.zip",
        sha256 = "2b9128f529ad644662e38ab802b1add6efb588ebe3f8fb4e78b91256ade8e9fc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-linuxathenadebug.zip",
        sha256 = "36ddbb892f76d8103cd7ee9211cbb7485d6f3fd28a0a063893181bce857e56a5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1/wpiutil-cpp-2026.1.1-linuxathenastaticdebug.zip",
        sha256 = "e071e0e108ad6a907cce5d1f75d743e3e2d875d23a1cf764e367605ec05fea97",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-headers.zip",
        sha256 = "7a1ef35093f20fc9227f505ae46169265d6c4047a41e73ecd4f4e814f702f643",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-sources.zip",
        sha256 = "191846ec14d10248a9211898e25d963346ea5c91c5e508ca863923326850150c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-linuxarm32.zip",
        sha256 = "4cb33d82f1a2f3a41615335b1d571d4808e00ec43d1dbc9b236373df4ec18dc3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-linuxarm64.zip",
        sha256 = "4763b9a4a3b348849135021d46450d483a1a8b255ddda8c02f21d1fdb04b6077",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-linuxx86-64.zip",
        sha256 = "b9234b61541ab7fe6c00d493720322377bad7ba437e4e26fea30ed46b6ee35c7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-osxuniversal.zip",
        sha256 = "cc85b229062325a4a917c9af79a931fba8948049675f20b0e60f28240e039e88",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-windowsx86-64.zip",
        sha256 = "e1c275b4b0234144021f8bf7b0bf85d1a83335d558679bc737faf0167df3e1bf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-windowsarm64.zip",
        sha256 = "69a6439cb44a178ec416cc497e029cdec4a6506850369c61713f8cc4c890fe25",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-linuxarm32static.zip",
        sha256 = "9bb65c4246a83a921e18f32bc38566f12675689533c85e3fd7ebe9a00bf97a9a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-linuxarm64static.zip",
        sha256 = "e66ed4d3b521405c0ca796f0191da92ab99d35c28ba9f115cd4d4515161226f6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-linuxx86-64static.zip",
        sha256 = "be02178e227c73b96914a049551358e8650d45982f8c006617d5ecde04aba634",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-osxuniversalstatic.zip",
        sha256 = "8982bd1886ffbf1de6d0cd8c1d27461863a1474cf2687fcb4f4557d681686ddf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-windowsx86-64static.zip",
        sha256 = "b1415be7630ac6240e702e8665fb01209cd33de36f40e5f8d8d637d033eab9e6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-windowsarm64static.zip",
        sha256 = "63fe0a2a4cd90e1822ad477deb13f2a0ad9054a1e246924671375b3739ef79ad",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-linuxarm32debug.zip",
        sha256 = "8d81ebf07758700678835585584f41b7a93e143fd5b072bd53c777d2c3d24bbf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-linuxarm64debug.zip",
        sha256 = "b557e28b0f78120f9ebfc3f4f8039924bba9b4ee1c006ac7099c5262ca6d7052",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-linuxx86-64debug.zip",
        sha256 = "2c26e2ac69d2ec27e35100df3bfdc8539ba65ab86c1e759fbf4d6362c7e0fc44",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-osxuniversaldebug.zip",
        sha256 = "15abd34943abc6ae70c7d872bca4bbb998dba673fc0b5669bf7fe220e2602e22",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-windowsx86-64debug.zip",
        sha256 = "97a5777579e7945d8f1a48a4573416c16fad03b63fc1258ea3f8d42af55ff4d3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-windowsarm64debug.zip",
        sha256 = "364368b874854e990e7ba17d0fd4cb4d67414d39d9b1404cb95a63cafca19849",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-linuxarm32staticdebug.zip",
        sha256 = "a52c18a7ad1053df170b6010922ea61354736ab3da11e0fdb0acc15827394919",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-linuxarm64staticdebug.zip",
        sha256 = "7d1d3e4646c61e76140d8acb38d4da3d0ace8bc0ca7d188fb18936ad3e91123b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-linuxx86-64staticdebug.zip",
        sha256 = "03a4439128f6d1c9c7f43938d1684066f5c748e4da2046f4d80c843874c40b26",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-osxuniversalstaticdebug.zip",
        sha256 = "e9ea29ac922db7a650a774472afa57d9c9d5f550eb52731678894eacf1bb20bd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-windowsx86-64staticdebug.zip",
        sha256 = "1fc34e16e5bc9ed2f35c586da1f34aba2bc603e45dbeac3a91461c414dc8de91",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-windowsarm64staticdebug.zip",
        sha256 = "646c999bb001f01a13faa20d979ceaeac9777c94b4c31fe698308c5c95b24678",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-linuxathena.zip",
        sha256 = "78912df3d487569897e06a7c4565c3eb1bc66d75d4af5e4744ec3b2efa53f707",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-linuxathenastatic.zip",
        sha256 = "9f72890c7d0bd1f6dd9e5f1f6d5f44e4fd87a0102f09e3ed4b291021ff8c98de",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-linuxathenadebug.zip",
        sha256 = "bda7dd2a424937903583c16d97afd00cb18e1b06cda26bc9b65802ea29ae376e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1/wpinet-cpp-2026.1.1-linuxathenastaticdebug.zip",
        sha256 = "3a8e9515aa975f768d78b96c56e4534eb1287d56cce23bb5517c5b6ed518a5ca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-headers.zip",
        sha256 = "c49deed76ad8c40f4bba6bdfc782fe81d9486927bc847fa347d5a3f8b1bc0c70",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-sources.zip",
        sha256 = "aa7c5c5a345d0bd1b6d8da66a283be8b37cea76f62e111aefbd3c98fc580ce04",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-linuxarm32.zip",
        sha256 = "af97c786aa8e59a79a609cc3c8aa5bfe9154ec9a772d66de716cf4b4c0eec698",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-linuxarm64.zip",
        sha256 = "3d7052d184f5a71011ce8d0a305fb7e9fe981c16d481384cfb4c764be736d85f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-linuxx86-64.zip",
        sha256 = "1f99a8391cb5cdffc7fd35782a997929ab147ecdfd7e9f69b2d3bd26edcdb78a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-osxuniversal.zip",
        sha256 = "b6a5782546da72d70621e24c304fde8c8cbd0cdc8d88300261fa7a664a53518f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-windowsx86-64.zip",
        sha256 = "7da21dd563eadf52b2d6f38f3c9738bd804eb8fbd6db4fb308a99f0bdf94af0d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-windowsarm64.zip",
        sha256 = "984e5314beb6e9defe8f4d04b744284d4a49494fa3af7995988115a3ac1d50de",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-linuxarm32static.zip",
        sha256 = "e7ca0fd11fa47e5e9e6ca2d97fb28e37fe172d232a2e296388294e53aed27d7a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-linuxarm64static.zip",
        sha256 = "96f587ce15ce1cd8889a61e677a108393eced888747e0750ebe55d9146007464",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-linuxx86-64static.zip",
        sha256 = "a2a2e38b82b4f506951ab27049b609bc012286af559158051df677a3b4fec7b2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-osxuniversalstatic.zip",
        sha256 = "2b7d19b40b231ba9acee486340a7c1a90eecb09d11565204038e4ff501cfc114",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-windowsx86-64static.zip",
        sha256 = "d6ed88d2dabb78ca095ef34a549e09a468ad984203c18bb74ab2a14b36089a5a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-windowsarm64static.zip",
        sha256 = "5377aa04a19786e82ca4da9fa1bad0e23f82887712760b9fdb53c8938c78fb03",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-linuxarm32debug.zip",
        sha256 = "1b6a4f739aba0814a01b1a9af74fbf583b88b4e9f8b3bf1e40a83e2c8b566fa2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-linuxarm64debug.zip",
        sha256 = "fed344744dcb7e5523ace3feaa7871f04ce878a6eec85ee0c09d32bdc97e0fb5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-linuxx86-64debug.zip",
        sha256 = "5f8a9a044c5607e5ebb670e16ee83fa979db5c42b170136db886f3fb0322d012",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-osxuniversaldebug.zip",
        sha256 = "ca8252c04b865471ab0d5639be1f708a803715930a92fdbb53323f0d0ada3cbf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-windowsx86-64debug.zip",
        sha256 = "a0f6d123d81abb4e41ccc6703c6ad11fa8c37b7f507f28c2f81fdc00ca861168",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-windowsarm64debug.zip",
        sha256 = "0cf1d91403118fc80aaa8be15329660a96b8e37f3e98de757dc0693019bbf673",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-linuxarm32staticdebug.zip",
        sha256 = "3e4436c0457997114169b3d345807989c487b70f25dc2e13e046c439722c642b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-linuxarm64staticdebug.zip",
        sha256 = "f8fe0d1c5311b2f4feda59a165b461507089d770d5da5ffce60752c0d97a71c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-linuxx86-64staticdebug.zip",
        sha256 = "c22f479022aec8440c5f6e974ae6260421a12a4ceb16455f169677cf6dca0085",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-osxuniversalstaticdebug.zip",
        sha256 = "5ee2a78794a3dbc3d5675e1f62173cbd965087d5c25c8fb53e4758df832d4a00",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-windowsx86-64staticdebug.zip",
        sha256 = "85578146e9c7aa5bd978b7dd3b2ea645aa2a4eabbd6a65110553d6337a2601b1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-windowsarm64staticdebug.zip",
        sha256 = "2b22bfbb41c174608fa77ca326a1119533629e8e7e03fbabdf65cc4b10fe0515",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-linuxathena.zip",
        sha256 = "e5ae700d1e560500183f686f64ce4457ef6166702cf85209c62b5506dde661ec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-linuxathenastatic.zip",
        sha256 = "510dd341fd6a9b14e64b0071e98ab674ac47deff1b28d390db2befbcfa2eac26",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-linuxathenadebug.zip",
        sha256 = "a07aa698a2c3736f6a4d346f5073eb73220ff2b17419bfc8a3802d734e61f2a1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1/wpimath-cpp-2026.1.1-linuxathenastaticdebug.zip",
        sha256 = "14974715d63f93a6da5e5ee381ceaf39bf2c1727bf5f9e1621616ee4442cb986",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-headers.zip",
        sha256 = "3f8e0e797ad206dff84bf3f14412b411e91323e3bc03c78d6a4520f8088dbeb6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-sources.zip",
        sha256 = "198e754f27c8cf26ff71600b3377ac3d610cca4b2b31bd433d110f2d0b6d2730",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-linuxarm32.zip",
        sha256 = "cadf7db52d20787b0a8baf297f8b882ed5c083bc155c095cb4535755970eb517",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-linuxarm64.zip",
        sha256 = "fdb7fdccd99525b5fe5a8516269fe6aa161b22890f2cd783696c684884c76f8c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-linuxx86-64.zip",
        sha256 = "ae4bb6f81dd5cdac56a914e99527b1db55f9155585f15f8960c8d456bfd6e310",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-osxuniversal.zip",
        sha256 = "d3fc0b0fcc2e61774f466ac70b9cbc4712afbd5f3712db7edd9bf0f04b2b50e7",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-windowsx86-64.zip",
        sha256 = "9e13e2982c736be0fab85a56ca0cbc07ea5ad85e832dcacd6d28cc4b90a18db4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-windowsarm64.zip",
        sha256 = "2a3db280513e53ed6f76220321746ef5230f5eea57c57b8dfc737b1f89beedfd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-linuxarm32static.zip",
        sha256 = "f9be8593ded4f5f89e828617fb024158f9dd6b72c8ea8b4429a8d935addba2a3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-linuxarm64static.zip",
        sha256 = "18eb68cfaf55a0dcb2feb1ac68db5360f5021e17c6c0e58ea5b4d6ea2bed11d2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-linuxx86-64static.zip",
        sha256 = "9240cb98a47466b85fc408bde232e547c88c33dc0266a52ba34a63c03673b999",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-osxuniversalstatic.zip",
        sha256 = "ac70d5da5dfbe9da08b5ccd2f56eb9fa63f1f8376f7f4c03f08c9ff854480ab5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-windowsx86-64static.zip",
        sha256 = "ea9817953bbdf7b92a186d5dbf479ad89035af10e8667519a2235e4e87ff9d54",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-windowsarm64static.zip",
        sha256 = "50ad7124b2bb77d8269c63e74b02dd0ff043c0b777aab296e0e9a5bc77988304",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-linuxarm32debug.zip",
        sha256 = "6d66d7775397c8f229343064a65e5ebb0705f34585f22f4c3a8c79b5a624046e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-linuxarm64debug.zip",
        sha256 = "4e469a810b24c6f7b245ada96db99fa9c11cad06988cfbe25ef299015957cae2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-linuxx86-64debug.zip",
        sha256 = "e98fd75f8f8d4871c663832a3e15faa0e1467e681721e85bb61b193d22718006",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-osxuniversaldebug.zip",
        sha256 = "5aa48fa0d5f33083336e02b37dc645bfa123b124d32e954f582cbcdf2929d48d",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-windowsx86-64debug.zip",
        sha256 = "f76a91524571082a219bcf3fc0f52536239a42e8a5e67f80d278db9f2142eba8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-windowsarm64debug.zip",
        sha256 = "44464d2ae583d6f52df2039ca626d9738eabf03255153f613a1d2ffe9c7f8d1b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-linuxarm32staticdebug.zip",
        sha256 = "d52f8fe588b110a3d00c6d3d72001a2942cbe57a6c8557aecf0190c2bf5e7035",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-linuxarm64staticdebug.zip",
        sha256 = "361029b01d0f1ec7c15e3ac6350a8bf230bd0641981c0b39b49c00bc89034c1b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-linuxx86-64staticdebug.zip",
        sha256 = "9f53f913b8864914bf952b45314a8d8175111c18b87c415047772162cb1b0ff9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-osxuniversalstaticdebug.zip",
        sha256 = "f6a3c25ecff67af28d60d1622c5e8d61c61ddd1ac2318757b80683b664b8c62a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-windowsx86-64staticdebug.zip",
        sha256 = "03598a5f9c16226e59ebd60c0ad22bb83cf0d5b02d5b0ea929bc1e81b9e64e08",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-windowsarm64staticdebug.zip",
        sha256 = "43210394e51068378cade83aa293cb25af0f313f4cc7366779ae410c3bedbfe7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-linuxathena.zip",
        sha256 = "bb7b65fffdb00271e709b48c8653b3d8db488b93e4f46c009923e284f6e5cb7b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-linuxathenastatic.zip",
        sha256 = "36db85a0105bcdcd2f7b0e1c0ee600f4fafd2570d336a84ee9486b91d72cfb77",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-linuxathenadebug.zip",
        sha256 = "f617629ec50c4b67d947ccab533319b1023243c821b507a115d41a841f80066c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1/apriltag-cpp-2026.1.1-linuxathenastaticdebug.zip",
        sha256 = "d68dc8e7d584a74cc0da72ffb42f9f6af960c6c2bc499114d95399f11e5ecd6d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-headers.zip",
        sha256 = "b6f7f1a7e3311b139f2af6c2921e1b1744d06d82ee3064bb6e0cd24150a3fb78",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-sources.zip",
        sha256 = "c20f177ed78203019a271b88a400c9d911b11844a8a68b616518a6d3a40eb4eb",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-linuxarm32.zip",
        sha256 = "8eace86e5a056c97044c302b6727149be24a2e45351041cfe0ab3064d8318332",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-linuxarm64.zip",
        sha256 = "c49753780f84b13f56db5d583c6971b9f086a7020166d3716b695e9051136dd0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-linuxx86-64.zip",
        sha256 = "abe00073b72cdaac248d1c7d98c83ef98cba7e42f7e1778c34c58d34c29f71b9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-osxuniversal.zip",
        sha256 = "884198100e0981b6dcd56d22b20de22e622db43e6db2ed705dccce8fa0de0e32",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-windowsx86-64.zip",
        sha256 = "451b392cd9d6d48932c3042f2f67a5c050bcb6231ac3b3267031037587bc9680",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-windowsarm64.zip",
        sha256 = "aed7cd29024e8136c04305152b315b0d735949e4e070aedc54aa550e9c1c40c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-linuxarm32static.zip",
        sha256 = "8d3abe7bbd6744e7ab98b925017d9ea9288ee5b231d6f4cf92fb43d72ba1482a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-linuxarm64static.zip",
        sha256 = "8284151cfffb0c25145d72f34f12649bf04bb63876d717880884cad981286317",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-linuxx86-64static.zip",
        sha256 = "8a243bae346cca3b872fe8206aef7c0bb1d9d2a09367db386ed0e42f896d1c1d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-osxuniversalstatic.zip",
        sha256 = "0b48f963277d0db0cd8bb249ca9c895cef09fd78b3730f6cddb068651d6c667b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-windowsx86-64static.zip",
        sha256 = "87cebf095c62d7f9fc72cd055e74c01a05889a3a9c11d4d4ead4e0e723d67988",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-windowsarm64static.zip",
        sha256 = "50375ec8b76d935ecefb3ee66b1994e56a918d86d2e10f64dbb6aed52800b853",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-linuxarm32debug.zip",
        sha256 = "9ec9de9df2cbac03f629eca2553d0964456dc500f0440609953ea63bdf3d9583",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-linuxarm64debug.zip",
        sha256 = "7671df0b4c512d7ae2aecf60b8661600756ce473a5daa9f0cf8f44a1778c7eb6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-linuxx86-64debug.zip",
        sha256 = "b7a9a4b8884986544e369c91703b3d804effc4114f44f70c156a1c240504c339",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-osxuniversaldebug.zip",
        sha256 = "9a6bcd5e4af9cec2143841616b4a2ce65d579b54278262c06523a1f1e315099e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-windowsx86-64debug.zip",
        sha256 = "3ad2c8ccf1c7e16a8e17c9b8cb257064c6f4e3d2ec3401739e4159848c1b61d8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-windowsarm64debug.zip",
        sha256 = "87ecc7fc72a0942d4162530a5b89c7b5fe5ede899d19de8dbb14fd00a336a2ef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-linuxarm32staticdebug.zip",
        sha256 = "1000948afc401f51c19798d6320d03568ff38fa37da8a652f2dc5d9d1b90d50c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-linuxarm64staticdebug.zip",
        sha256 = "86351a04821540c59062626d0c8f7c9cf0abafacae8d8771ca99a8fc24f9c74a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-linuxx86-64staticdebug.zip",
        sha256 = "03a513e4139e33873696ad76b6698007a914eef7e6f31c3b7f3780099941dd20",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-osxuniversalstaticdebug.zip",
        sha256 = "174df7210527d5dba30b92980436142ee5024ae73cdbc040b3694eb3c4f4c686",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-windowsx86-64staticdebug.zip",
        sha256 = "0eda3c75cf8ea2a1307eaec37891c453a093f9a5dcec7df928cffe08b78c459f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-windowsarm64staticdebug.zip",
        sha256 = "fa58c6cee28b736aa7b1f9030fe851ba8de7efebe9351bb0024f6c92bfcaee06",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-linuxathena.zip",
        sha256 = "9444daf205329851d2c89ebfc58d5525aa96abf1658b5531d9dada4d3c04a9f6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-linuxathenastatic.zip",
        sha256 = "d2648343679c7e4b0156791bf4e256b81c0a278d1a2a7779f58ced4e09df15f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-linuxathenadebug.zip",
        sha256 = "887f6894cbfc40e58c8d529ea38be359f4d4d5fa6f29fada49fd41b59d34bb97",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1/hal-cpp-2026.1.1-linuxathenastaticdebug.zip",
        sha256 = "d6f7398288a2d58e128b1cfda14aa7cddde2b26c97900bb91d5b0494d8be774a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-headers.zip",
        sha256 = "47adda504c1e877fe521b476f860a6e258966b2d4a5b27713d4ceaca95644a51",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-sources.zip",
        sha256 = "f3306fe568d9e3deb1db98aa35e53cf876810a9f4dfc1132a25a85c2dd675c5d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-linuxarm32.zip",
        sha256 = "207707a3e16cb3429147071f4aa44582314499f9f5a4097ffe33e2333dd29472",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-linuxarm64.zip",
        sha256 = "b589eb1eee5dd27e9838307cb72856efa0f981042444a6a71a9d7552d6d2d716",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-linuxx86-64.zip",
        sha256 = "3059c872a49c2351f743720e0521dda6510abfe6b4ee9c41cab94f165fd9077e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-osxuniversal.zip",
        sha256 = "1c0d22faa8401a4cec10d109b3c3e78ef3e6616c3133759b514be8ea051dfc20",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-windowsx86-64.zip",
        sha256 = "820a0d9efd0f2d1599819974b99ba8e1e9b8fcd233506e96ebe05e7f8f8025aa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-windowsarm64.zip",
        sha256 = "b9f26b829df98aa7f001b3312ff1f89313f110fb30180171fb01b3e0ff4f857a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-linuxarm32static.zip",
        sha256 = "05981749a6f1e325bcda20d8c9b320dde0a6fde857b0a6952d6de50eb1c91251",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-linuxarm64static.zip",
        sha256 = "bf3052e25df83f472025937e1138a72cc535d540af012393042b80a3fe46ecf1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-linuxx86-64static.zip",
        sha256 = "e1ba6673df7400102314d36d086768ed0034709366548dc0b1ee8092380d9363",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-osxuniversalstatic.zip",
        sha256 = "00c8b85c5affbfaf5222de7b8672c20e8e0cc79a0dbfcd18282dfc169e43f682",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-windowsx86-64static.zip",
        sha256 = "6a98a0cc266b7da4a1f872662c879f660f74e38926c41f0748b6e7a484d9fa64",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-windowsarm64static.zip",
        sha256 = "975fa51c280a679bfc86641eea8975c09cf60570b1fbcaf9663f0557dc10e24d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-linuxarm32debug.zip",
        sha256 = "4099ff465e5ddb3e54f2f4880680aa898a415e9016525bdecd86a83913864b8e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-linuxarm64debug.zip",
        sha256 = "26d640ee3920c14d362956c6b098d7b24fe1a7f10ffea970003aa513b6938c77",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-linuxx86-64debug.zip",
        sha256 = "0bd002854c34f3b1b5e6e42080a0906118be7b4b6ebf651f3c79bd44fff1bbd5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-osxuniversaldebug.zip",
        sha256 = "84ceff0619a036c3c392a888de0fb764a9be5b6a5001ad39391a2b6c280b55ae",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-windowsx86-64debug.zip",
        sha256 = "b5ac2af4812914947f071d4dae1b4a39c8d0fc246b623dcf1fbcd677786d4a40",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-windowsarm64debug.zip",
        sha256 = "b862f71d5e6b4f9b603a149c42a4ffe8e364bf6edd5ee7c448c5ecc68999fb0b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-linuxarm32staticdebug.zip",
        sha256 = "611901e2c5733e912ee75e2a457e59a9f8959b6ffc161a3e5fd22227b2a38766",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-linuxarm64staticdebug.zip",
        sha256 = "cb9ed057ff481f8490e9680d3c52ad20e12306e0b317132d5c25734321f67adf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-linuxx86-64staticdebug.zip",
        sha256 = "880808e84766bbd722f64749b2442ed4af3f72a9c0b93161f743f7acc16ab134",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-osxuniversalstaticdebug.zip",
        sha256 = "767fb7dae03214c385edb0210b36aff3433c35312b74b0bae45ace34bc484c55",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-windowsx86-64staticdebug.zip",
        sha256 = "fb66444cbb7e3155840bd5b9345c57dc3e7bedb2c975cdccf58d85b86571d17c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-windowsarm64staticdebug.zip",
        sha256 = "c304645917e9aea067db551ef24e151519e7f4cc2d289f7daedb92c18d208e88",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-linuxathena.zip",
        sha256 = "e7cafeff7a16b1d6d62aa6b753baa0dea32cb400c76899a06914a98383e1c36d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-linuxathenastatic.zip",
        sha256 = "8e969f115b355b34f7c21df33a924480f4ccec0ede4d0acf58926f6c6fceb932",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-linuxathenadebug.zip",
        sha256 = "73838bd1df733b5ab52136b35908c313e5fb51d2a1d5874702a5a0f026168e7b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1/ntcore-cpp-2026.1.1-linuxathenastaticdebug.zip",
        sha256 = "42ca1123bd6d82d8fa55129aa1514a9f0dee3ae55d5cebb6c408e235ec613dee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-headers.zip",
        sha256 = "62a48ef187bbf4a52696897606fedb6d7e05f2f64fada7b87697f4698732c434",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-sources.zip",
        sha256 = "7624e13d14c84ed7cc56e4ff4aef0767985192ed6e66b7fa7eaa7296f4f31bf5",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-linuxarm32.zip",
        sha256 = "911236bb6127867f1a7fc6a1e843ce19f9adb61992dcf448d18a3deea59f8d58",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-linuxarm64.zip",
        sha256 = "ebbbaac93ed28389a0c35eb8615e2d9cc9d84a358152ed580d8d214ba2a23d15",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-linuxx86-64.zip",
        sha256 = "bc79e677698f085af6f93ceada73bce294e66a3e0dc207699dafda38514c1947",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-osxuniversal.zip",
        sha256 = "7d8bde91508fae443a1560b0206041bcd864e07fa2f62efa6a9956144f34d111",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-windowsx86-64.zip",
        sha256 = "abdd459e9b24f8b4d686238e61016457a6af4fa73be759d2881050a0c0d8fdc1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-windowsarm64.zip",
        sha256 = "105895fa64d8681881044c2250057b4b796276961e6658333154d13a703bfa34",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-linuxarm32static.zip",
        sha256 = "1497327dc31ca526bb76d8881df8ff77c39bc43c80a68db77702f69f05b704b6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-linuxarm64static.zip",
        sha256 = "c187717bb5c0ff62578f08f7a31dfdcac29dfed7b9a9375c75ed4a36d269ca80",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-linuxx86-64static.zip",
        sha256 = "d4ba9fb82ea161f252ed9d45f8ad5d4a6c7fc3bb16ebf47b0d3b254fc583a6fa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-osxuniversalstatic.zip",
        sha256 = "05914c37d2684623bdac83c4df9a006d995c29f1ea858940a9229e0c893ddfaa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-windowsx86-64static.zip",
        sha256 = "72a806c584e3bb0520d48776d068444f7de5fadcb4f069d51ee3277ff2f52f86",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-windowsarm64static.zip",
        sha256 = "001760c42a814d6165a4eb9c765285c90f7de47d652b4a7ed11574fd8d4ae744",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-linuxarm32debug.zip",
        sha256 = "c3a6134dfb546c4e0a82c43abbe7279c50a347abc5c9d4732655d81f47c53612",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-linuxarm64debug.zip",
        sha256 = "f1b88363c46d50d2378974a78679d5201b15f92835845cc1cbc61edd0c892f6c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-linuxx86-64debug.zip",
        sha256 = "f027a625f0c468abb793bb2f1bb842a3ac4e1a97b3f07abcd5b15de64a4e45b7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-osxuniversaldebug.zip",
        sha256 = "1d6a88ac98ab9e1e530043bd28ce9e0a02ea470bcabc1a620ee734715877b85a",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-windowsx86-64debug.zip",
        sha256 = "601d752a0c3e925fc2f699ca2f9ef1a4af4d54d01e58e03255bf40885c9beddd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-windowsarm64debug.zip",
        sha256 = "4723156172ef85622a79d9237717e0fe20fba2a96e071f8dafb259942e9590dc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-linuxarm32staticdebug.zip",
        sha256 = "d84dae0303730f02fc623d900ea38948372f22966a966df42f7431338b716388",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-linuxarm64staticdebug.zip",
        sha256 = "3ff78da196586351663bfa1ddb655f76119d2e82ffc0b1ede8b03437dacd4a40",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-linuxx86-64staticdebug.zip",
        sha256 = "d25031f849918918595659942ff1d6547d7e737ac748ee665d43e70187ffe898",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-osxuniversalstaticdebug.zip",
        sha256 = "b7fcbc88082c95d921986d4c326b85c89b7afbff3c8aae5873b794d41e5ae13c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-windowsx86-64staticdebug.zip",
        sha256 = "0851f1f732d6ab99547fbb420cf9b7fb9885e631c726ff5fb513cc315194a2bd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-windowsarm64staticdebug.zip",
        sha256 = "d9e1470f424ca7230d30040af406962bc247b8bd1c1a989cba8e70aa7af9ef3a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-linuxathena.zip",
        sha256 = "9305f7d7aa2f42c4d3f8178b939efbb5b9b629994c4e40950c14a007f60af466",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-linuxathenastatic.zip",
        sha256 = "6e6ef479f437abf8be9db63dd212427ab1bc47dc84782b4ddf2ee45083c36fc8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-linuxathenadebug.zip",
        sha256 = "d26f3e0e1181e0247e568063bc16a8e7572e399052c3978052048910d4d21783",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1/cscore-cpp-2026.1.1-linuxathenastaticdebug.zip",
        sha256 = "fcfc24b7d9e0a64b83e5e9eed63ddeb9e4c40603c5c9468be54d99e29586287c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-headers.zip",
        sha256 = "192ee31d82dab141d10b1ed6ea6e2c92b61bf46529b986b5fd456768d884ba8c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-sources.zip",
        sha256 = "1000253a05eaa2a895cf62c72872998b8b535693e374ccb971ce3cd2cba2c370",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-linuxarm32.zip",
        sha256 = "d03b5ac188b5526dfcc1c4b37316825321e078b53c43c22b4a037d0a1b6b9524",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-linuxarm64.zip",
        sha256 = "11ae938c0273f92a5a70544793d2cac7d4b307d22fd85a36c6c6472deb16df86",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-linuxx86-64.zip",
        sha256 = "104ce02f50e22403280c638458b4e947ed2f9896c904bb729a5238a6cd4e903a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-osxuniversal.zip",
        sha256 = "65bcd58e6dbe1fb6684d70cfff3232edfb0c31a8ede6aa83460f72521c063060",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-windowsx86-64.zip",
        sha256 = "957415f889e885b777d58ffa050607eac4b1866b779fdd82d3ccc558e2bf0831",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-windowsarm64.zip",
        sha256 = "99e9f6e4541c8c1259eb475b14e8585821d293c5e80fafae69c7b87aa046e1eb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-linuxarm32static.zip",
        sha256 = "fb306500429a7e0fe4e3791c5560f7b71d8f5719b280f312332eec73c2db458e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-linuxarm64static.zip",
        sha256 = "c8ff6a2ea66a643e5b5a402634e69a27382c6e1fb673cad134986474485e77d4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-linuxx86-64static.zip",
        sha256 = "bd87fa02fc662c79ed8ffa453cefdd4b6d046317d018e4a051416bc329050c18",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-osxuniversalstatic.zip",
        sha256 = "27336bb7666298df8e4771437ccaa39e639421953d6735f66a604f9c8e29b8cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-windowsx86-64static.zip",
        sha256 = "1762e11441fdfc6a82b8c2dde3e98fcdd11081a889ef19f789eb977c999d9b64",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-windowsarm64static.zip",
        sha256 = "aaaa597f6c727f252423b7e1536bd62a935fabd90dfc2a06ee924ca60be4bcc7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-linuxarm32debug.zip",
        sha256 = "f33ad885e15e023a192581dbe2a949b84424fe1af5e8a93f467bd19d202e363a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-linuxarm64debug.zip",
        sha256 = "1b9ac445c290d8955610194adddfe161c2be9f1746fa02c23838549af93ef36b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-linuxx86-64debug.zip",
        sha256 = "74f690d8d158c1072272651c92e6d5c88e484ad7195d0f05050b8c9a983b5d96",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-osxuniversaldebug.zip",
        sha256 = "252dc73c39610cf12caffbecfd6d58827cf8563cad58c580cbaa46ebf1ddad01",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-windowsx86-64debug.zip",
        sha256 = "2a6a6f8ddaa79bf6477436eed3f2a639608104846e73cafda8e96b4f6b0614c1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-windowsarm64debug.zip",
        sha256 = "2ca1b4b4d810b9119cb6642ff757a2c70447f80be9bb8771de52694a9556a941",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-linuxarm32staticdebug.zip",
        sha256 = "ab800df01e25e1ebaaefb53ea7d8e6ee54bb6f15f419f0f1e5731d0a0f18d442",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-linuxarm64staticdebug.zip",
        sha256 = "49d398894373c24b4d8250e3547b3b76d3150247bdb85703a709526f6f448d71",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-linuxx86-64staticdebug.zip",
        sha256 = "8845e6ff9a63c4160df6306425c0f6b2245e4af6be65a46db401cd00cd9be9ec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-osxuniversalstaticdebug.zip",
        sha256 = "9fd27dbb6eed35be2858499bf7786ee917e837a91d413bb9694ad56d589b682b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-windowsx86-64staticdebug.zip",
        sha256 = "aee60f25d3a749f4f3e04799f7a7d486353e84cab60c6dec02a65fb702658cbc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-windowsarm64staticdebug.zip",
        sha256 = "8c73ad6ce0cea1f5bf11faa219a22564fb4503b657d4ce012a3774cba216c954",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-linuxathena.zip",
        sha256 = "356ee3be7a1d9ac154c412bcc1322edacdec7d0800ebc55b999a3e9a7175b453",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-linuxathenastatic.zip",
        sha256 = "e5b6a4b016d5a0427c1457cc3e92a812489db3782432429b4d9f09f1bb5a1898",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-linuxathenadebug.zip",
        sha256 = "1bbc9f0728113f6fbd124960259eeb130377813819101b66c803fac19a039ad0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1/cameraserver-cpp-2026.1.1-linuxathenastaticdebug.zip",
        sha256 = "ff982f61017ec2ee5caf5bfc2f71338787032f81d46b37d16cb3b827ed82a524",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-headers.zip",
        sha256 = "4a22d5ca7b3677854444a5ef688b639f4076df8d0f72984510ec6a34c76cdc2f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-sources.zip",
        sha256 = "fd10ade4fee33c552fae818f5d46b2dadf35f75551d142803890088505ab4641",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-linuxarm32.zip",
        sha256 = "5eb8bc4905b503d2699f04a9db61b4d1d9673e53eaf41b42271f66a9c2bf1ba9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-linuxarm64.zip",
        sha256 = "2124d552cbcacd1bf65ba1adfe6994e70e539380053924ab6fe967039b3cc92a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-linuxx86-64.zip",
        sha256 = "bcb97399214b667af3aedb3ad93142e755c8d5f6067327f4e5447b0c85365f56",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-osxuniversal.zip",
        sha256 = "368e0f46b57020a3b48704e32108d18216e8e5a505090b2e2eb6d15049701e76",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpilibc.dylib osx/universal/shared/libwpilibc.dylib",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-windowsx86-64.zip",
        sha256 = "38902c160bc741c2025eef4b39602867cf5f6a9ddaa4be84507ff57358e647bb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-windowsarm64.zip",
        sha256 = "f1d596c15225c0cbdcf60098001e73aff66e519b0e488436822e563eaea69910",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-linuxarm32static.zip",
        sha256 = "956e52e771469aa3bab83b701f2b362812a6c11578a29fe6ca80daee8b48c7f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-linuxarm64static.zip",
        sha256 = "e8f8ca40c6ff62006c4dabeda41c21ddfe01b63c3dfad4c070b0c53086fea944",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-linuxx86-64static.zip",
        sha256 = "40d61118e1d8f36659058be260a1645a345411c10da9b98cbd193a98444933c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-osxuniversalstatic.zip",
        sha256 = "58f31661c36ad6941c2765b223aee0af25dd4671ad807bddf46aa7be9e6af963",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-windowsx86-64static.zip",
        sha256 = "6f2072cb9a49536e0fec27e49b847f0f9fe1f3da553b079945b38b5d15b79a4e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-windowsarm64static.zip",
        sha256 = "644616ee66489e5e054f041a2436bb205d544316d74738f09600b640c7796180",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-linuxarm32debug.zip",
        sha256 = "6919e0c4c9723565f92197500537b7ac740b55b04d35457143b01d1ed37cd7ec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-linuxarm64debug.zip",
        sha256 = "fd9811ecdc8bc57861a65141b62cda551aa327c144a23bb65ea00c6b56009e82",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-linuxx86-64debug.zip",
        sha256 = "6837e5c1530af29d231b006edee6abd2a3dfa0fc2f8b01d21d8c90e49bf4310f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-osxuniversaldebug.zip",
        sha256 = "56a6be90fb08d535060c416e934f72398e5821ae7f5d88b54445542a61eb45c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpilibc.dylib osx/universal/shared/libwpilibc.dylib",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-windowsx86-64debug.zip",
        sha256 = "dc068e755622851d2ece796abfee0412aea9baef85ff9320a9b387d80cfb95c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-windowsarm64debug.zip",
        sha256 = "4fa587be741eb754035350a75a848a62074da42c209d4614e19f46184b799e90",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-linuxarm32staticdebug.zip",
        sha256 = "8f103e04f6afbcdb2b65f717b194475bf47a91b7266dcbbcf75b0050c7647fd2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-linuxarm64staticdebug.zip",
        sha256 = "930884344b5df11f3d8c67a07f43aacf21edaa53a31dfce27b841cbd8615a172",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-linuxx86-64staticdebug.zip",
        sha256 = "e3fe19e846b04098ab4d1a06d595562666b0e701aa94daa78dbf7e892beff508",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-osxuniversalstaticdebug.zip",
        sha256 = "e58bc228df4d388e5a42669d7bdfd6d78a7cc0474de0557bc9c4ec1d80ad824b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-windowsx86-64staticdebug.zip",
        sha256 = "ff038376a6b7e5c28408b9b4a9d9c75d0f095d3aad5b75c51b569de74ec903ef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-windowsarm64staticdebug.zip",
        sha256 = "3b840e6df2c03312c48c36f2061a808b4a7aeabc63dff830ce8c3567d4c0590c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-linuxathena.zip",
        sha256 = "bfd1fb8235c4a0a4d45ebdf969dea9237284f600314f1a9c58c708866c9a7d58",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-linuxathenastatic.zip",
        sha256 = "eb93eec098834b7e03d5f957163deaf29ed3d13200697c07024181cef8746246",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-linuxathenadebug.zip",
        sha256 = "33d641be92dbfe42ca79c868afefeb2edc02329414ddcadc0614a58a192543dd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1/wpilibc-cpp-2026.1.1-linuxathenastaticdebug.zip",
        sha256 = "2c13dc0f2fe746b9d78ff80bcb353a7d68678f4e7e891fac567a21280781ba57",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-headers.zip",
        sha256 = "df4b59a4f244dbb2101d5b3a8aeff74e79860f5ed27dd059155e698e20b0cf73",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-sources.zip",
        sha256 = "f533ca35310e81b553031d001f6a5dd52d00cd9ad232d8a8012080239cd6b1b5",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-linuxarm32.zip",
        sha256 = "1a9c6b7f58f66a2d5687a89c7ab0a6e5a049ecc99a95a15d86fa75637e2d4daa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-linuxarm64.zip",
        sha256 = "af52e019bd5fa8cea8b5b77d3e8b2c8208602b8ee49e99ac774d2cbb53f7e4fc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-linuxx86-64.zip",
        sha256 = "7b369e02dbfa9613c85c46315a788821c169e3d0c67bbbe96cd88e1f6b4f5216",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-osxuniversal.zip",
        sha256 = "7589e27786addf33487687e73ab6e73677162db07e87e61a355600edc2ebdfe3",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-windowsx86-64.zip",
        sha256 = "30e4afb00c2135cc203741af2b622b1d274c270943070af045618ea176a7d4eb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-windowsarm64.zip",
        sha256 = "4aeaa004efc11f0e7d23e1207490a236ba3a7bd74254575e11e0439df8f85074",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-linuxarm32static.zip",
        sha256 = "b3179853dba7a9f7f5f75a1689313fe9e3fc92ae788f311b278a06324ba45ba4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-linuxarm64static.zip",
        sha256 = "35f86c4dbcd5020bbf64c06b6eaa531873081bdf9e41c7234f02a887a6d057b0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-linuxx86-64static.zip",
        sha256 = "12cf7a94ffcf47ed20ea28684bfc0ab5eac9bca52f4c6802209f7447946ec795",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-osxuniversalstatic.zip",
        sha256 = "77ec665cbf19486bffda014e34ca286b97608286d88d93dfe18a38df5f3edd37",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-windowsx86-64static.zip",
        sha256 = "aef30c97c327262b04fce1292dc55566dc7069c6e5cd9792d644a8c92fbc5d1d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-windowsarm64static.zip",
        sha256 = "3348f15f591e4fd0a0c8adffcde72512dd870ea883e04d6d98e42a790f0a9c81",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-linuxarm32debug.zip",
        sha256 = "4b594da32401abe31f8028f0ad7ad8a1e70e69f1dff3439f46d819b29bdec2f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-linuxarm64debug.zip",
        sha256 = "d7a9816504637990301d23897e5becfb1d581c549350ae107e19d93015feec9a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-linuxx86-64debug.zip",
        sha256 = "8828203d3a102c7aec5c339229b981ce2ed348ce1fe5393b5d42ac3c9b8d5621",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-osxuniversaldebug.zip",
        sha256 = "1dd374ba2c4db5c675e2632f8c4a9c0a06a54fcd8929437a08710b67be9aab16",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-windowsx86-64debug.zip",
        sha256 = "5b862deb35f8752b8e718560e659e12dce27b316e3896e723d049bc01c7ebbce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-windowsarm64debug.zip",
        sha256 = "057a399f3afea0861b5fbdf610b5abe845978c9b8381c49988f6dc87e8473e1e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-linuxarm32staticdebug.zip",
        sha256 = "9bdf86d84aa73ec11508fb6be1fdfeac6d066c55d76cf36083be431de05cc841",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-linuxarm64staticdebug.zip",
        sha256 = "0f75e37a5fe863dc8017386be8fd79c75520c9b145f4a2a43b1c6e26801792d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-linuxx86-64staticdebug.zip",
        sha256 = "739ddfa2f84ed92185f14be05ece8b2a1d1470d7eb0537de7145175293e9bf8c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-osxuniversalstaticdebug.zip",
        sha256 = "1dbabc3f8d9ace88c0e53e8c7e3b801f07b27ff8396e0b484502ff517d738e11",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-windowsx86-64staticdebug.zip",
        sha256 = "70b3082c1f10059624453275fa18484217925f5c63cff361dc120f3a24dcba27",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-windowsarm64staticdebug.zip",
        sha256 = "c0fc2bfbcbb6c11db7065c6d126974ada2c67dcff5fce0d04fa69af55f5607cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-linuxathena.zip",
        sha256 = "b745188fb8c02a004ee808c41cb68a826c47ffec294ad15dd57a867498157f4e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-linuxathenastatic.zip",
        sha256 = "f27a736779f6b05d99a0c94a4981b14593ad3c3707c3b7ef71c1654f90f9d4a9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-linuxathenadebug.zip",
        sha256 = "95f085564dd99c02d1b2fbb613053d454803e2d9542e57cbaec269087678dc37",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1/wpilibNewCommands-cpp-2026.1.1-linuxathenastaticdebug.zip",
        sha256 = "32b069b81729ff507bb2adef0fc3fccf7f257e8f63492e94b843144f686c8eb6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-headers.zip",
        sha256 = "28641003d9110e8b15d2d44ef38dc449afe73a9207f39d3036cdb4d8aec7cc62",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-sources.zip",
        sha256 = "d81d99ca95ab0452e6f1c1d82e74c48830c9b033b315b153ff68f3e2285cd757",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-linuxarm32.zip",
        sha256 = "c1bc9555c8f618b83ff84f98e6673b9c37b2ef42c42d79be8655c4bd91961e1b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-linuxarm64.zip",
        sha256 = "35c3da327b3216270484c5e4f8c8d617fc674d8121635935857f528058cc263d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-linuxx86-64.zip",
        sha256 = "71874c48751d7224836d7423f8b92f246312c4d4303b5f459061e1fae3c049a1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-osxuniversal.zip",
        sha256 = "5b0d32e4763a6662d8c77d6580e0f3015e5936136cc240d507a7c3aab7956036",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libromiVendordep.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libwpilibc.dylib @rpath/libwpilibc.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libromiVendordep.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-windowsx86-64.zip",
        sha256 = "594e20e911baacf543ea160ae440597b2d9c6d41421bbb45248273797ad3372c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-windowsarm64.zip",
        sha256 = "a772b43bd1bf94e321ec01f774422f2c9a1fd026823766c5dbc36e9d5074e35c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-linuxarm32static.zip",
        sha256 = "f8402a4efd23be1f1f6d93a943cf928a96db3df9986a903ba6ef74dac2728f1b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-linuxarm64static.zip",
        sha256 = "35b378796d6cb2868897c1d53dd62b1c6ba1be198bd81465894fe83a1fcb4023",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-linuxx86-64static.zip",
        sha256 = "9010fd33703530f9a698b08927f56e43f996c8daa47d012cd5aa167cd95b6595",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-osxuniversalstatic.zip",
        sha256 = "2042275ea77fcf98da89c925c04491fb9fe651bcff43f9e0c0becbb006e95318",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-windowsx86-64static.zip",
        sha256 = "0c4de5689e70ad319c7269cf14fcd1338ae4dc8bc439fae785d1af7721bda535",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-windowsarm64static.zip",
        sha256 = "72375c06f57b50d2f0d8c5eaca24d51c84c3e0f6de92d12856b34c8c6de6a5f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-linuxarm32debug.zip",
        sha256 = "8bef5f8fa3995ed98f2d9354ed0acd59580184978386ea7d8e92d9a904caad2b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-linuxarm64debug.zip",
        sha256 = "5d6a91b457e42f96acce618614ad59412b9361c47a762bdefd42b7842e63a258",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-linuxx86-64debug.zip",
        sha256 = "e53f5cad387a40fe1135ffd00e406561a8af5fa906b24ec383d256dea0fb85f0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-osxuniversaldebug.zip",
        sha256 = "6e4e07def13ecf04c7ee123783b6856c837ae9cd6c1ef9e82f9a13264f236a1f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libromiVendordep.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libwpilibc.dylib @rpath/libwpilibc.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libromiVendordep.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-windowsx86-64debug.zip",
        sha256 = "63269074c5441b743b34ed09405fbf70c1e338b2062d19e36c32eb0b7c30c899",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-windowsarm64debug.zip",
        sha256 = "dcb1fd7604e84fbe85780f724c595ceb18c418eaef1d146b93363650f7c1e9ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-linuxarm32staticdebug.zip",
        sha256 = "ede368d32009c5cd0e100e5f825fecf2038082a7753225c46cd5801b71d3ec05",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-linuxarm64staticdebug.zip",
        sha256 = "59921c9266e9084213fc95cf14be99987c0ae95b09e318ba42c324d225354069",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-linuxx86-64staticdebug.zip",
        sha256 = "51a06865a52056dbc6934b7c68ed503729dc26f2f3919af2ceac9ae7f4ec029f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-osxuniversalstaticdebug.zip",
        sha256 = "cb41ef3791406ac3e7d69a34bcba8441adcfa9e8fbcbce66fc6352678aea303b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-windowsx86-64staticdebug.zip",
        sha256 = "4c7703e4fdd54de45bc241dbc5da77992d64cabb05c16b80ef886a005d7334b3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-windowsarm64staticdebug.zip",
        sha256 = "b33a60245eda14aa07c0bd6020b8e96cb17c1b8a69a7286aedd0e82bc009a04f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-linuxathena.zip",
        sha256 = "6d11ed42a91c30b13da9c1bbde6535b37330f5772383d3cd87bde963564ab218",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-linuxathenastatic.zip",
        sha256 = "68b64b25125d8884794e116fdf68853b5cb404c3d2d1bb5ee29984e3e0e79982",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-linuxathenadebug.zip",
        sha256 = "9a4f741d26bafe74a159755d4b245a91f755840d93c86c7a55c1cac1f825f3f9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1/romiVendordep-cpp-2026.1.1-linuxathenastaticdebug.zip",
        sha256 = "cdcdb75dc82deb1988ae48f9ad2fca1b2d0ffba7f17d642a503c86a4f1d7a495",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-headers.zip",
        sha256 = "13bd38b444174b19927b289f6f5e44e91818035b6b5a82eac4e1d63decbfcc7f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-sources.zip",
        sha256 = "1ad334e18bd12e98570cb71c7327ad591daf3c8aa5e2ec2208a85e95575dec40",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-linuxarm32.zip",
        sha256 = "1c368ff46ff36ed0d7b93e7a7dd01c6b1e03f9c58dd1cd8eb1b47a9d61efa99f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-linuxarm64.zip",
        sha256 = "db8f20b184ffd4e19f2ec646d29fdd06a721e585646622bb596d7fd5702e2f59",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-linuxx86-64.zip",
        sha256 = "0ecdff58da86fa456673b54a9399f71e17d6e7190d2c0108efb988ebd726d5bd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-osxuniversal.zip",
        sha256 = "65494e6c496aba18c74d59e277889402d91f2a7b8b6e991143b8424653029c37",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libxrpVendordep.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libwpilibc.dylib @rpath/libwpilibc.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libxrpVendordep.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-windowsx86-64.zip",
        sha256 = "a87a3c95dc4f935539d1c06bf5d27272db62f40ad4e21bde2f721c58f45a8b09",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-windowsarm64.zip",
        sha256 = "4ec9d9170d24434b7b87c64144b49c983525c1e143017f0f8414ccf988972af6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-linuxarm32static.zip",
        sha256 = "2b87ca5a267abb2f3c5a0989106c310f2ec32aa5a5f2ee3ba47d79b1234c20d0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-linuxarm64static.zip",
        sha256 = "8bdbaf53ee6d35fb52cef9f29c00e99dd0afac04bc43bac5662cef7d0ee7b56a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-linuxx86-64static.zip",
        sha256 = "521086c2f08fc22c385b4a83fc1d5af144a3ab295941c2a85ae96499e318db47",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-osxuniversalstatic.zip",
        sha256 = "1325b6dda47638093584d4a6b005238cb30e9df8cae2a849643c326978de0a42",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-windowsx86-64static.zip",
        sha256 = "f9b26114b34a631424753c53cf10d6f23bfbe880a0e806aee75f5e51e520a5e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-windowsarm64static.zip",
        sha256 = "53b6fee29eaa4c40fc002d11d1c73f0e76f97b07762f6103aa1575c52dfe9add",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-linuxarm32debug.zip",
        sha256 = "4807f52c18cdf0005affd21c8ca63aea33804a8d54c903d3a60573da1619851d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-linuxarm64debug.zip",
        sha256 = "8ead088ee53e86fce552dcad6f42f84e553fea1429d5026bbd7d36695e625cb5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-linuxx86-64debug.zip",
        sha256 = "c32a5da281e2ff3b110c1601070c0e3a3733ba3ad8286052386c75510fbca67b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-osxuniversaldebug.zip",
        sha256 = "87edf6306ee30e986112c66aa9ded86a0523ae00df7fd9cb7799f7d6dfbeba52",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libxrpVendordep.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libwpilibc.dylib @rpath/libwpilibc.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libxrpVendordep.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-windowsx86-64debug.zip",
        sha256 = "fe643d74b3fd529f5524ca36a39e720fafa3c6bdfe03f016129bd677d7997445",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-windowsarm64debug.zip",
        sha256 = "46b89cea80790cc27b9b799b827cd21ba3cf713ae30684f0dd577b3de0f8e5c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-linuxarm32staticdebug.zip",
        sha256 = "a4cdbe548b45ff65947836e7aca2e9256f84201f6eaf128332dec0dfff84122f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-linuxarm64staticdebug.zip",
        sha256 = "7ac7a97c92b0dd11557b89bdca2f7ec800a29ce204f1a29bdced1ae6c453d66d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-linuxx86-64staticdebug.zip",
        sha256 = "078e338b230118a8b31c6621cd98f153ecc3b1b93ff026e25343bb0d597e7129",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-osxuniversalstaticdebug.zip",
        sha256 = "08cac0e7688c8d8a34d704851d0368bec2f47f77313103e22660a31226b5710a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-windowsx86-64staticdebug.zip",
        sha256 = "69d14502502c398a3e3ac05be418ca03cad1e32f7f75023194d78a2a9e27c05c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-windowsarm64staticdebug.zip",
        sha256 = "21abd2d546a16e90b87639f42bebc519ade0c52768a6b9ab71cfce3f5ffc564f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-linuxathena.zip",
        sha256 = "3829b8acce32117b4329401624b0768461c39bae11a6d8f29a5313bd3714cc77",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-linuxathenastatic.zip",
        sha256 = "84807f1dc7deed01750940d893afc1c88d7bd2ba650f1bf172f21caf47a06431",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-linuxathenadebug.zip",
        sha256 = "bce74806df6eadd96e4838160018fb866dcad0a91106b6858495f171fa033c66",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1/xrpVendordep-cpp-2026.1.1-linuxathenastaticdebug.zip",
        sha256 = "614a470bc201d3ffa36acc1d064e6377c72a0a79858b097d610b4cc81fdd3da0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1/halsim_ds_socket-2026.1.1-headers.zip",
        sha256 = "e2e496054766843fa9338a6230a7a2f06b668e5f5f2ebe5c927ac6f8e30b4b1c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1/halsim_ds_socket-2026.1.1-sources.zip",
        sha256 = "b7d53e353af9c6f98618c3b7407120897bf4b5381f38c5e9a76f3c05c438b17f",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1/halsim_ds_socket-2026.1.1-linuxarm32.zip",
        sha256 = "dd123d97ce5103662616ac12a695973936b9a7c1006f6166208be774399566dd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1/halsim_ds_socket-2026.1.1-linuxarm64.zip",
        sha256 = "763212eb92d25c0d3f3dac77ad0fff0a107fcc9b93af3ccf3a35eb7355829e8d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1/halsim_ds_socket-2026.1.1-linuxx86-64.zip",
        sha256 = "efd2b9a16ba21ed1d227fc802c64c40dc5a4abc3c9450018b007a0efbbb8c42d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1/halsim_ds_socket-2026.1.1-osxuniversal.zip",
        sha256 = "4929fd7830b63e2ac4726c56a30671e1705e4ed128f3f48e1c6055e18cfc556f",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1/halsim_ds_socket-2026.1.1-windowsx86-64.zip",
        sha256 = "0d83079615097529794cbc3b90d90ed6ee3796270fb3f1fa745f8b39f33482ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1/halsim_ds_socket-2026.1.1-windowsarm64.zip",
        sha256 = "d2bc9f91ed1a3e31687daf66ef00a38d84a4b7119221f945964ef9717971fe8a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1/halsim_ds_socket-2026.1.1-linuxarm32static.zip",
        sha256 = "281d9151388c6b34610e09ab0f5f6640a1079954b23663f162acc674a7db6fe6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1/halsim_ds_socket-2026.1.1-linuxarm64static.zip",
        sha256 = "8498a3557538e6990dba33435cc3016b051890c63791d2c6c4cb10df9c8c16d4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1/halsim_ds_socket-2026.1.1-linuxx86-64static.zip",
        sha256 = "d6678afe958a268c3fc808b2a0e27ab1ea7d6a78cb52beb8842a8082cb4f047d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1/halsim_ds_socket-2026.1.1-osxuniversalstatic.zip",
        sha256 = "322f870796ff76afeae6ed14524f3938f6f51054c47347d2a936b20516c3d85b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1/halsim_ds_socket-2026.1.1-windowsx86-64static.zip",
        sha256 = "71b0785b2b32809de0d586ff608c4e4922052d36dfc990ac8de34190f149bd36",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1/halsim_ds_socket-2026.1.1-windowsarm64static.zip",
        sha256 = "312afecdae17a1851fd5c3eca5020fb351cc0d5a4713d9f3232481eba02e059e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1/halsim_ds_socket-2026.1.1-linuxarm32debug.zip",
        sha256 = "946c54dc8f0c88577ab21f79aa5ca06e01680e726cc41648b458e508370ae052",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1/halsim_ds_socket-2026.1.1-linuxarm64debug.zip",
        sha256 = "3c229ce218e142d954081408a43442d8f8cfef6c95d5de9e8fb42805c202a15e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1/halsim_ds_socket-2026.1.1-linuxx86-64debug.zip",
        sha256 = "a16a64b46d595c9c0d8cc5af584aa34126334e7e3f7894a72b3586f02b35b77d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1/halsim_ds_socket-2026.1.1-osxuniversaldebug.zip",
        sha256 = "d87f5b9f1ef1fa1cf7af62f294588754dd3badc39c87ce30529b40b418f95eaa",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1/halsim_ds_socket-2026.1.1-windowsx86-64debug.zip",
        sha256 = "c34a861be9327af79b9861e368ddb8e9e5eb518338b83593038ef86e945f021b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1/halsim_ds_socket-2026.1.1-windowsarm64debug.zip",
        sha256 = "5073e90eecd8824db81b152539364a7260debc02b5f2f9e3fb7a5200296c3d36",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1/halsim_ds_socket-2026.1.1-linuxarm32staticdebug.zip",
        sha256 = "4021517fd6e4470276c8d4e3537c3bf3206c0496419278a7d449e84c729ecd68",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1/halsim_ds_socket-2026.1.1-linuxarm64staticdebug.zip",
        sha256 = "5c9cb3f03e964d560da0f8d70dfae769873726da0c7cf3b08196a21f9efc8d95",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1/halsim_ds_socket-2026.1.1-linuxx86-64staticdebug.zip",
        sha256 = "4e87840ee07407cb44432522493b51db18cd7e702ea14c1d2a4858ce0a844da7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1/halsim_ds_socket-2026.1.1-osxuniversalstaticdebug.zip",
        sha256 = "cd9b4293d1461f0917b9105cdb9f4de3bd607c17c2c5a392b8f424b7b39f330a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1/halsim_ds_socket-2026.1.1-windowsx86-64staticdebug.zip",
        sha256 = "62e400dbf178e9b37bd5d435f30b02c55301e0dcc9c5bfc33ada59b402dccedc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1/halsim_ds_socket-2026.1.1-windowsarm64staticdebug.zip",
        sha256 = "4982a83f9f747f471a778c3f807b1a7a829e58ede0b5a4f5866a69a4b0a15265",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1/halsim_gui-2026.1.1-headers.zip",
        sha256 = "149f5d39493148f3b4b1d3b5fee301aac6c170be896110c8a83a2a7d902e23cc",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1/halsim_gui-2026.1.1-sources.zip",
        sha256 = "91246dd724f36611540ab52f2660a5260f25ec00882a0f0946934a9e142112b0",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1/halsim_gui-2026.1.1-linuxarm32.zip",
        sha256 = "3fc4773dd2bc75fba79f806a13200db6f754c3e25730575265ddfdd3975573cc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1/halsim_gui-2026.1.1-linuxarm64.zip",
        sha256 = "974f65c24c6f028c007055b1f9c45233ca13fd08f7028d4ef1935844fa4247f8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1/halsim_gui-2026.1.1-linuxx86-64.zip",
        sha256 = "e78b9a051dec5b2cfd7b082dea28eaab7249f05330b8ec55e9f98a3cdd655cdc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1/halsim_gui-2026.1.1-osxuniversal.zip",
        sha256 = "c51832b43cb7213d24aa24a51eefe1fd1053fd6dd79e433e50b75a25e50e0db3",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1/halsim_gui-2026.1.1-windowsx86-64.zip",
        sha256 = "c197c3f5577385cc11fd4c70647184916a2467a35b618295be4260e7df85991d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1/halsim_gui-2026.1.1-windowsarm64.zip",
        sha256 = "669bdde073d65decba634425324dc9c2cf15a41f998b344760e2fe3b991af1de",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1/halsim_gui-2026.1.1-linuxarm32static.zip",
        sha256 = "00050e5acdab1d4e2eb5774c3fcb6dbe0611ecfe4542ebf5ed2b082b5018b75f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1/halsim_gui-2026.1.1-linuxarm64static.zip",
        sha256 = "1926c0f52413e06cff226fc2dc77322685ca9a3d3ab6081fc4e3a8404e923224",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1/halsim_gui-2026.1.1-linuxx86-64static.zip",
        sha256 = "9c552e42865368d2d0d90d372d61f2ea5e65adacfaab00880080c4e67368d751",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1/halsim_gui-2026.1.1-osxuniversalstatic.zip",
        sha256 = "50311310b36124d7baa63920abd500af7fbb7663b8f3360e58d024407c1f741a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1/halsim_gui-2026.1.1-windowsx86-64static.zip",
        sha256 = "dc5859f8fbd16b62a521f2ac3d9d5f995927e8eaff01982bc259adc661f1679b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1/halsim_gui-2026.1.1-windowsarm64static.zip",
        sha256 = "a3e2de4a711019afe3740e87221472498a7c793e9094fdeddc054f60207ed4cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1/halsim_gui-2026.1.1-linuxarm32debug.zip",
        sha256 = "f9abe4b115a7396f5ed9fd7298e86f52746fe2c6fc6fed1099f3960224e7b78d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1/halsim_gui-2026.1.1-linuxarm64debug.zip",
        sha256 = "2e2b2efd26d6773e32bb9c84035c8d82007f7157b1234bbe3b5aaea52dbaf2da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1/halsim_gui-2026.1.1-linuxx86-64debug.zip",
        sha256 = "b538b5d902e321f3d9ad153d650b11f74dc2c5939d12272b4477259e5e048c4d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1/halsim_gui-2026.1.1-osxuniversaldebug.zip",
        sha256 = "4803c2b1933e5df9258f287b3be6a43c66505eae74f7836b95e951235a8f6905",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1/halsim_gui-2026.1.1-windowsx86-64debug.zip",
        sha256 = "bb021ec1b1e718f74240f95c0d968e35a06be3b5d9cc7bdc9a76982e1a38f609",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1/halsim_gui-2026.1.1-windowsarm64debug.zip",
        sha256 = "a598edb16753f2b0409776536d673bc070a5a05f8a5cda4f7d4a76b9af1766e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1/halsim_gui-2026.1.1-linuxarm32staticdebug.zip",
        sha256 = "a99bceecfa3bd2606d9dd840680b2e3233e3f7e7140d146df95f5253e5bcbb58",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1/halsim_gui-2026.1.1-linuxarm64staticdebug.zip",
        sha256 = "a74283667e39146230d68bb16eed9019ffc6b975004e5db748d8957c91e57248",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1/halsim_gui-2026.1.1-linuxx86-64staticdebug.zip",
        sha256 = "573e0a98c24ae24d640fd6c39b8ad47d28185f22b9a10f09b4e891044254d786",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1/halsim_gui-2026.1.1-osxuniversalstaticdebug.zip",
        sha256 = "5465ccdc10e7846464c4d5df151376a679595bf83064fbe5a3f0e10346566019",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1/halsim_gui-2026.1.1-windowsx86-64staticdebug.zip",
        sha256 = "e6d2667f5927cdcb624ec3f172d7620e6cbd51013e2e6a9e30f52d3a24c8d6ea",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1/halsim_gui-2026.1.1-windowsarm64staticdebug.zip",
        sha256 = "ca4ca4c37ece650d340c30242ce7bd8b67d4b7a5a8bcbd2d2ebf9c4eff92e09b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1/halsim_ws_client-2026.1.1-headers.zip",
        sha256 = "b4f840825d738b1cbef6bb3a4ff38f3f3fd6a4a509987acfadf34796906685cf",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1/halsim_ws_client-2026.1.1-sources.zip",
        sha256 = "8f1d4d9dc5142a2e26b98ffc663d42b84183908f1ab4df33f5a8485788356ac9",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1/halsim_ws_client-2026.1.1-linuxarm32.zip",
        sha256 = "eaf53adb086109a9aede2c42e5e75df2ec4b56c06f5b1576a3d4ed3aec0e06e7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1/halsim_ws_client-2026.1.1-linuxarm64.zip",
        sha256 = "81f7b10f3dfa6fe07eb411138288414da2418ad31ef52719335aeb85dbb6a701",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1/halsim_ws_client-2026.1.1-linuxx86-64.zip",
        sha256 = "ed45c8d1d571f240e3ce4165efdf365666b832dcd065d35672de1839e16ff1a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1/halsim_ws_client-2026.1.1-osxuniversal.zip",
        sha256 = "1b85353427721f9367ed6f78f665bc6de22bc4b1d52bd4cdbf27015b5e110968",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1/halsim_ws_client-2026.1.1-windowsx86-64.zip",
        sha256 = "5704804f76721ffc4bae3c18ab52878dce9058d076ed556e6331200f8137e02e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1/halsim_ws_client-2026.1.1-windowsarm64.zip",
        sha256 = "3059cbcb08194d4e71ac101e46256182989eb869f5c2f312233dedfec903bcec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1/halsim_ws_client-2026.1.1-linuxarm32static.zip",
        sha256 = "4891959cc8e14ef315a229b99c710a8d3d025d742583b7d3e61c3cc3d74e68f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1/halsim_ws_client-2026.1.1-linuxarm64static.zip",
        sha256 = "b964720db4c8d421c2de43ee8ad107b52da4079c8f509c4c7fb6e571a28723cf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1/halsim_ws_client-2026.1.1-linuxx86-64static.zip",
        sha256 = "af9a772c64f77d6260fed29ddd6dff9fa88a09d8628f6ba85c169a3a74754294",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1/halsim_ws_client-2026.1.1-osxuniversalstatic.zip",
        sha256 = "6f504e50fd29e180134fa286c7f2b147b7dd18ac2239e6cee3f004962ae6ec40",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1/halsim_ws_client-2026.1.1-windowsx86-64static.zip",
        sha256 = "7d05b7d5a596585b33c87edb339465a49dc1809c650bcf28cb45c57a6825f2d3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1/halsim_ws_client-2026.1.1-windowsarm64static.zip",
        sha256 = "94d701c0133880e4ea3e6fd5663ae0906bd55f53c363a7e7a3f068e4f2e37613",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1/halsim_ws_client-2026.1.1-linuxarm32debug.zip",
        sha256 = "ca811eb8c016e7208447a0c24313490e5d1527ec505a9ac4e580709c8b58f3b8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1/halsim_ws_client-2026.1.1-linuxarm64debug.zip",
        sha256 = "d3a0a3af41eb5f16f0f80779690275d8c63fb231611ac4db7316fbffff048294",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1/halsim_ws_client-2026.1.1-linuxx86-64debug.zip",
        sha256 = "0e9693d163495c292cbbc7c230c81687c214ea14ac8dd598b247b5d12b5b4b68",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1/halsim_ws_client-2026.1.1-osxuniversaldebug.zip",
        sha256 = "f2c383762745e83fd7abf803eb5d990ad974f13f26e8da84451a7f3b4385418c",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1/halsim_ws_client-2026.1.1-windowsx86-64debug.zip",
        sha256 = "02e03e3dc4d63bc9cf159df65920f2a7c9b58d37c50222e801a76e88ea0613ea",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1/halsim_ws_client-2026.1.1-windowsarm64debug.zip",
        sha256 = "50e8eb585dbf1296e2a2c9709d9ce1bc87dffafa6d3b2a0266057561ee4e986a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1/halsim_ws_client-2026.1.1-linuxarm32staticdebug.zip",
        sha256 = "bff772e21190027ff1e31383df18f453cb5a03c6a2e4bcab6522a394cc9767e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1/halsim_ws_client-2026.1.1-linuxarm64staticdebug.zip",
        sha256 = "1e2604778eafbe7fa1037e32cfdba9aca120573408969cbda202e260e4ff1177",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1/halsim_ws_client-2026.1.1-linuxx86-64staticdebug.zip",
        sha256 = "c1102d2a5e0e347775d88268b0d7b4b6970cd93aea59f5b7f8a33a8fc1b346a6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1/halsim_ws_client-2026.1.1-osxuniversalstaticdebug.zip",
        sha256 = "e078115fb255998ed437c2fa664d1208889cf45ac0d1a52589928320c76f2a8d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1/halsim_ws_client-2026.1.1-windowsx86-64staticdebug.zip",
        sha256 = "9b2bf87d40f0d21c407f04f1f6f7c232c92c860f9cee8a132222e4bf412dfaf0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1/halsim_ws_client-2026.1.1-windowsarm64staticdebug.zip",
        sha256 = "6fc644e95c069c59c3041345a2d6f6ec727c519c3e164f3d23afec5183a438df",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1/halsim_ws_server-2026.1.1-headers.zip",
        sha256 = "99e68407e9dbf0bc7bea14a2c783d2ea87c0c8769e48a4bfbca78ba465d6d648",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1/halsim_ws_server-2026.1.1-sources.zip",
        sha256 = "fc0f98d27741421eb460d144544bb92ace73844e5420223a38d7ad2533d2d385",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1/halsim_ws_server-2026.1.1-linuxarm32.zip",
        sha256 = "cb0d75ddbcc66af347bf59565efd37448c2718f45a11ee9d205746a63967ab65",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1/halsim_ws_server-2026.1.1-linuxarm64.zip",
        sha256 = "017f6abc3bb12f22392f6dc3461e9eb665f989e640448afbc185b1fc608dfed6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1/halsim_ws_server-2026.1.1-linuxx86-64.zip",
        sha256 = "9f59be594a13d7454e3734a6f747fc6eee950a9ca1aaf9ee4a72e20422cec2f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1/halsim_ws_server-2026.1.1-osxuniversal.zip",
        sha256 = "74e3eaa1fa7fb5b1c614a2d40c19b6178d7d35c1bda474760da3eb73d23d79fd",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1/halsim_ws_server-2026.1.1-windowsx86-64.zip",
        sha256 = "eb831600744587472bf49cfc290d997effab2de3e6158210bbd69723f54cd2d4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1/halsim_ws_server-2026.1.1-windowsarm64.zip",
        sha256 = "a46c7cd5dea3d60313405979872a0dc6b0c8a6468afaf453dcbf39e970ae9dce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1/halsim_ws_server-2026.1.1-linuxarm32static.zip",
        sha256 = "5a214ec1bcbbbda030f299738266d5d890bd8df2b5099df380f5d86cd470762b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1/halsim_ws_server-2026.1.1-linuxarm64static.zip",
        sha256 = "d2c1c4447e4e9522c4f8fa41aecaf52ce7a40f2320d8adc259d829b7a5c7c513",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1/halsim_ws_server-2026.1.1-linuxx86-64static.zip",
        sha256 = "6ed63ede0fc4609229687fdf9e717cfd00dc6b17c8e3d7e2cd521e0bd8dc6113",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1/halsim_ws_server-2026.1.1-osxuniversalstatic.zip",
        sha256 = "41dcca488b257a75b7843c445faa17a13f734a46cdd881c55599615bb347ba0c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1/halsim_ws_server-2026.1.1-windowsx86-64static.zip",
        sha256 = "f58d61db2c5b0bdcf0efe0a5eda9f23683d148e5a9255eadf1870b11d2cbe4fa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1/halsim_ws_server-2026.1.1-windowsarm64static.zip",
        sha256 = "86f0215e3de5b254fe9ef9f0312cce06ea231540df007d583fa68ae9cacf023c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1/halsim_ws_server-2026.1.1-linuxarm32debug.zip",
        sha256 = "b4e1ae8ec41def18f2ecd21d175771e50464a0edb2f84943ab857a275dc321e1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1/halsim_ws_server-2026.1.1-linuxarm64debug.zip",
        sha256 = "230d01a4aa7681f1e0a604a3da6c1efd4f105136614093c24969485a79a30175",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1/halsim_ws_server-2026.1.1-linuxx86-64debug.zip",
        sha256 = "de12b9ab33bb896c852c4953c8f901ceb0e4715cb8ee3e68ee015b4b3358bff3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1/halsim_ws_server-2026.1.1-osxuniversaldebug.zip",
        sha256 = "0a5a9c9ecb42c43d9ca05b3c8877ce45f1633ea926e7942031fc8f1ab3b0d51e",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1/halsim_ws_server-2026.1.1-windowsx86-64debug.zip",
        sha256 = "9131df3d29a9f774e3e511b684f609431435057ca6193c8569c4412f338a17d9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1/halsim_ws_server-2026.1.1-windowsarm64debug.zip",
        sha256 = "6f714b761df2a9332d15587db5a0a4bade54d0939a657b3c18b179c108d683f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1/halsim_ws_server-2026.1.1-linuxarm32staticdebug.zip",
        sha256 = "8287bbeca4edfb0847876dfbd9da139c2fa65425f53159acd3fafbe55266ac30",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1/halsim_ws_server-2026.1.1-linuxarm64staticdebug.zip",
        sha256 = "0e5e1d09626af6f3b9e389501ca6911a91f0771b0048e3bb2499d093a1722b77",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1/halsim_ws_server-2026.1.1-linuxx86-64staticdebug.zip",
        sha256 = "d770074eff9d8c083a223a97492abfce22b6eb17b3d7f2c116d3dad834e3141f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1/halsim_ws_server-2026.1.1-osxuniversalstaticdebug.zip",
        sha256 = "c48d27367fcf5c81c0aa6c30a9f7c6cf52b6d847a2e5e6ceb10f8af795afd5b2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1/halsim_ws_server-2026.1.1-windowsx86-64staticdebug.zip",
        sha256 = "ecadaba9251dd07ecde6f20bc07b95b275d27b4070515b2913f4eb873ebafbb2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1/halsim_ws_server-2026.1.1-windowsarm64staticdebug.zip",
        sha256 = "872307474801a29f51dc37ced2b02b19c9cbc870decc564c0a73fad8f84acba3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2026.1.1/SmartDashboard-2026.1.1-linuxx64.jar",
        sha256 = "344e01748dd5cae1017836e726e7b66120261cfc920a23d15884639928f711ec",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2026.1.1/SmartDashboard-2026.1.1-macx64.jar",
        sha256 = "d76470c6c5f8489b9ea928686399105e31be0c8799cdeace241c6f26cee159bc",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2026.1.1/SmartDashboard-2026.1.1-winx64.jar",
        sha256 = "f23e99e02cd29bdd410bda29f6f92b1c7eaf273f100a3fe5cb94265a12415daf",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2026.1.1/PathWeaver-2026.1.1-linuxarm32.jar",
        sha256 = "d16ab8f8b45084a7f684f44fe7921ebba4c19debd983f22c95cf98210d5bc7a4",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2026.1.1/PathWeaver-2026.1.1-linuxarm64.jar",
        sha256 = "e772af7cf21e783e70d884590955dfe602904424dc9116efca0b0649faa16f9d",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2026.1.1/PathWeaver-2026.1.1-linuxx64.jar",
        sha256 = "ae47e91d168dd2584b880582499edbbff2ee51faa6e57cdf6eb8065b4ea8216a",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2026.1.1/PathWeaver-2026.1.1-macx64.jar",
        sha256 = "de57ab4e9f9334fb9f66a33de8ac92429177790f0c80f3f33536aeebaf6aaf65",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2026.1.1/PathWeaver-2026.1.1-winx64.jar",
        sha256 = "4c5fee29ac06ed53deb4b0b8a7b1fa0ff0ff88b84f6ecb2112a93a906171ccc5",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2026.1.1/RobotBuilder-2026.1.1.jar",
        sha256 = "001cc95412138bb02e7dc7b1dbd0a2e9df715ffa0bd834383ee6f84f5535a015",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.1.1/Shuffleboard-2026.1.1-linuxarm32.jar",
        sha256 = "84af7b9976fdc3695ac2688dfc6d7a15172d72cbbe30af540b97362077d7bad8",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.1.1/Shuffleboard-2026.1.1-linuxarm64.jar",
        sha256 = "a3c9ffccf4e190ea90f0b3fd879299e24a373c2ef9e0113844026f731ca5317c",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.1.1/Shuffleboard-2026.1.1-linuxx64.jar",
        sha256 = "194f1caded4008fa9412f0e7cfecd8724866bdd5ecb5859aec3f53802f92c79f",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.1.1/Shuffleboard-2026.1.1-macarm64.jar",
        sha256 = "2a1a40b1e5a3a0f128e4fde639e5828097d847a20295d34b88847578968d07e5",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.1.1/Shuffleboard-2026.1.1-macx64.jar",
        sha256 = "95f4e63c09737ff292802b885f80b34ad43e765c2d8098bd2f4c295c48fe1222",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.1.1/Shuffleboard-2026.1.1-winx64.jar",
        sha256 = "b45fffdfd223203cad3730670c1d6c29e61f01e7ca58187fc597af4217a16a7f",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.1.1/Glass-2026.1.1-linuxarm32.zip",
        sha256 = "7f8b15e51caf2eb2596ae4475e9dcf4a5aaed228b6a9b3467b864418fc29407d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.1.1/Glass-2026.1.1-linuxarm64.zip",
        sha256 = "051411cee52ec79ed9042fddeaa6b6bea2a7ec2cc7d0aad478dd773e4e6963a3",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.1.1/Glass-2026.1.1-linuxx86-64.zip",
        sha256 = "edb543410365e91edc2b56e93be705a10dcf2706a3e4f67d1b6110d28bb0d809",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.1.1/Glass-2026.1.1-osxuniversal.zip",
        sha256 = "d2a65ce2b31bcfaf42d5351e5adcb4af11477bf4d29aca3fc45618f5aba99a6f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.1.1/Glass-2026.1.1-windowsx86-64.zip",
        sha256 = "84055a66a875f96749f6ad95d735439b81778e3f398c7e8aff04f3a7aa8708b5",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.1.1/Glass-2026.1.1-windowsarm64.zip",
        sha256 = "15146d828540083634d04846ddf722a2c07209b7844ce2d61892296f9381b137",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.1.1/OutlineViewer-2026.1.1-linuxarm32.zip",
        sha256 = "3d7d6b486571536db3057a746bcdc619eabcdeb2c258fc367af0484e426bd6af",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.1.1/OutlineViewer-2026.1.1-linuxarm64.zip",
        sha256 = "d1823c415f8696ad4109d6e386e89fe2a1b48a6fb4c8897ca4e0761571bd12e2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.1.1/OutlineViewer-2026.1.1-linuxx86-64.zip",
        sha256 = "0de877962e86489f75f65d223c05e1dbd0770fb6f081c43328e92097b8469d6a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.1.1/OutlineViewer-2026.1.1-osxuniversal.zip",
        sha256 = "41aec6deaff06784323345360381db12e59c1feab85da3420d86aa3c9d031211",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.1.1/OutlineViewer-2026.1.1-windowsx86-64.zip",
        sha256 = "e1c9464bd9cf0436d7a0da43c4e9a5f2516db53081c6180738f83591f569adff",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.1.1/OutlineViewer-2026.1.1-windowsarm64.zip",
        sha256 = "91950b91af074d6a381f127e52e8103c239880b3cabd7773f2b54cb265077c05",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.1.1/roboRIOTeamNumberSetter-2026.1.1-linuxarm32.zip",
        sha256 = "0c6cc003e6d1c420462b33544c04b394ddc9b026757d3fe9c84364387058d2f6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.1.1/roboRIOTeamNumberSetter-2026.1.1-linuxarm64.zip",
        sha256 = "52c21fdaac05b611f094c7d334f96445efe39d132c44e3a2c08bf5f27ed2f797",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.1.1/roboRIOTeamNumberSetter-2026.1.1-linuxx86-64.zip",
        sha256 = "6ac38688f46e044b8d11848498f180bb4f83c5f5e481109fc3fb1ad1c8491795",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.1.1/roboRIOTeamNumberSetter-2026.1.1-osxuniversal.zip",
        sha256 = "afc1ee9749cad012dddc1eab7e521d8d92ec926ce0cb44faefa21a0aa0f5a319",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.1.1/roboRIOTeamNumberSetter-2026.1.1-windowsx86-64.zip",
        sha256 = "b86fe8b14ccc377b153c4af820a29e9bd1931ba13ad36309c3ba2d621870cd3f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.1.1/roboRIOTeamNumberSetter-2026.1.1-windowsarm64.zip",
        sha256 = "0a457381384194080d1e2f58eb9e4c4e497ce6d22027198975ce1e7b8d6aee47",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.1.1/DataLogTool-2026.1.1-linuxarm32.zip",
        sha256 = "dc9310f97c00ff93aeafa155c9bb0e6e03d6682d03ce8f44fd8d832839d079f5",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.1.1/DataLogTool-2026.1.1-linuxarm64.zip",
        sha256 = "7d7dc97f4c072c25998601a84bb647d375cca14511407eaf974f44d1c7e12b57",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.1.1/DataLogTool-2026.1.1-linuxx86-64.zip",
        sha256 = "072e5c819a9957611492026899109b427190ed9b411e09556049f6daf79c63d6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.1.1/DataLogTool-2026.1.1-osxuniversal.zip",
        sha256 = "e3ed4001948bdf286607f426babc9b2ffc1e8fd414b21f375ecb37543e64f89c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.1.1/DataLogTool-2026.1.1-windowsx86-64.zip",
        sha256 = "08abfc70447f6d8e5ce746915df1c10f026b7599aac2550b1dbe322b834fbc29",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.1.1/DataLogTool-2026.1.1-windowsarm64.zip",
        sha256 = "6362039468c5d30f2177a52a3a10fcc2cf7ac15729e66dcfc526e4b077f15557",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2026.1.1/SysId-2026.1.1-linuxx86-64.zip",
        sha256 = "755b19e65683457b66c4a484fa0c69098c25ff8c3482364edea4227329ee7db3",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2026.1.1/SysId-2026.1.1-osxuniversal.zip",
        sha256 = "fc47df910ef81f1e5739bca6323fe539dff4730c75ddc01e384c14b9f8ba8f9b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2026.1.1/SysId-2026.1.1-windowsx86-64.zip",
        sha256 = "fd96b348aa92199056bb0980ca1d6973aa9082f7f48e1c33cb23be50ac8ad86b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2026.1.1/SysId-2026.1.1-windowsarm64.zip",
        sha256 = "030866fba012fda278488e4d89a99da5320d28952ece04f3c1f09a6afb5410ff",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
