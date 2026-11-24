load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
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
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-8/wpiutil-cpp-2027.0.0-alpha-8-headers.zip",
        sha256 = "30b8a860cee7b46992d0239a345260d9e7271f837a76b071e89c7ccf790f0c0f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-8/wpiutil-cpp-2027.0.0-alpha-8-sources.zip",
        sha256 = "65a000596b9c0b9605186be3ea6c6460cb5d66fd5c2eb93c2ef6fd9ae01680b1",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-8/wpiutil-cpp-2027.0.0-alpha-8-linuxarm64.zip",
        sha256 = "afb9cc1fc04a6ee7cf29a5017bae92d677eae6015b6c68f645bc46942ad450cc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-8/wpiutil-cpp-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "61a07c9f8311a677cc540bd0a952ad088b56af06d1c4bed3bb675037bbc1c471",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-8/wpiutil-cpp-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "9e97af9e3a6659300429528369456bf1348b2cd9ddb939cf5556dca075b37ff5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-8/wpiutil-cpp-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "7d4b856bb5a60571b3552c75d10eaeff7fadf9bca71552e02d3f296890e56282",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-8/wpiutil-cpp-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "6f4edff5d6e590db569fedd99ed003a4cde761f6e99e54e208451c08d6706841",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-8/wpiutil-cpp-2027.0.0-alpha-8-linuxarm64static.zip",
        sha256 = "11352462a808798ed3b5cc55f9d5f63e009e412c834dc097e99d949bcbbdc62a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-8/wpiutil-cpp-2027.0.0-alpha-8-linuxx86-64static.zip",
        sha256 = "2a4c62841514bce3133b6d0e7d13cb747bab01ac795b91a3488e86795f6091ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-8/wpiutil-cpp-2027.0.0-alpha-8-osxuniversalstatic.zip",
        sha256 = "d696871c28a7a2a880d0d8e41030381c547460cef7c972ea1912a19ab3b33713",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-8/wpiutil-cpp-2027.0.0-alpha-8-windowsx86-64static.zip",
        sha256 = "5b8ba91555a2e162fdadf708e5c5ebee72793f57db84c104d7d1842256d8614a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-8/wpiutil-cpp-2027.0.0-alpha-8-windowsarm64static.zip",
        sha256 = "72f88151c6867f278e330982009d3b019edb158d9f4e5999ae97d49045b33335",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-8/wpiutil-cpp-2027.0.0-alpha-8-linuxarm64debug.zip",
        sha256 = "e291001668d872d48c8279ad6c7f2683bd5416876cbcca0202f877f89580f1f8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-8/wpiutil-cpp-2027.0.0-alpha-8-linuxx86-64debug.zip",
        sha256 = "68a925209d3f760bbf0b873781c8a5aec29e88e82371ea5c568bb3cba562e542",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-8/wpiutil-cpp-2027.0.0-alpha-8-osxuniversaldebug.zip",
        sha256 = "a7cf4be96e98be79099170ec953a39cc4e971dcd535704716e76dc7ed58843b1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-8/wpiutil-cpp-2027.0.0-alpha-8-windowsx86-64debug.zip",
        sha256 = "4f1b4781e0cb780836fb033c1f0e84d67cacb00dd7c010c1ce8aacccb6d61465",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-8/wpiutil-cpp-2027.0.0-alpha-8-windowsarm64debug.zip",
        sha256 = "520ad95ad9873c62d0ae9457b3a25fa2fda690c2c8ece9f2cf9a3ae7f687966b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-8/wpiutil-cpp-2027.0.0-alpha-8-linuxarm64staticdebug.zip",
        sha256 = "553097bd71a1d5b534b8ec5187e29f2f468b2c7bdd437ddd401cbd551192dbdd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-8/wpiutil-cpp-2027.0.0-alpha-8-linuxx86-64staticdebug.zip",
        sha256 = "023590b8f129b1bc03557ad7ad7d06da42b7f402274806f28258c28d9d3fc531",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-8/wpiutil-cpp-2027.0.0-alpha-8-osxuniversalstaticdebug.zip",
        sha256 = "66327f0a4723c26662a4344a049e180269fa5bccff93e2b50cc0877806e07e65",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-8/wpiutil-cpp-2027.0.0-alpha-8-windowsx86-64staticdebug.zip",
        sha256 = "cf6ea3108e83fd5bb970770643fa012de762d61e6336fc9a43d26ac2c34d4013",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-8/wpiutil-cpp-2027.0.0-alpha-8-windowsarm64staticdebug.zip",
        sha256 = "b9e15e28ec66057c3870d18df118d03ef2f8b24d5deb6244c8d76f68b7232343",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-8/wpiutil-cpp-2027.0.0-alpha-8-linuxsystemcore.zip",
        sha256 = "2a02e8e4fca85ebfe4303e38da22b1ff6ff04d6e7c330bb80c0b90469cc6b4b4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-8/wpiutil-cpp-2027.0.0-alpha-8-linuxsystemcorestatic.zip",
        sha256 = "ce3f7ed2d0ea3ea259b9ffd6141501427c877c2e6581a131ffa0ca6f60cdda44",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-8/wpiutil-cpp-2027.0.0-alpha-8-linuxsystemcoredebug.zip",
        sha256 = "eab233d75b6f5205e7135b9423169438712014fdea7948048f47346b97500cf5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-8/wpiutil-cpp-2027.0.0-alpha-8-linuxsystemcorestaticdebug.zip",
        sha256 = "3a02ab32e61f617408743bfd4a61250f9876ab85e1007a8c48de23b9dc85ada7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_mrclib_mrclib-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/mrclib/mrclib-cpp/2027.1.0-alpha-1-116-g5288562/mrclib-cpp-2027.1.0-alpha-1-116-g5288562-headers.zip",
        sha256 = "1020629cbdd8218e9a13f72c1b31b284ee79ecbbc10373d44a938c873783e003",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_mrclib_mrclib-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/mrclib/mrclib-cpp/2027.1.0-alpha-1-116-g5288562/mrclib-cpp-2027.1.0-alpha-1-116-g5288562-linuxarm64.zip",
        sha256 = "de65721300dcc7d99a19750647c118ad2cf66936375b12f38e16515d80d0c809",
        build_file = "@bzlmodrio-allwpilib//private/cpp/mrclib:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_mrclib_mrclib-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/mrclib/mrclib-cpp/2027.1.0-alpha-1-116-g5288562/mrclib-cpp-2027.1.0-alpha-1-116-g5288562-linuxx86-64.zip",
        sha256 = "5edd36845bbf51bae2dc2dbe0cbce37f11b3990e11ca8d8fd889e83ae89326b0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/mrclib:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_mrclib_mrclib-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/mrclib/mrclib-cpp/2027.1.0-alpha-1-116-g5288562/mrclib-cpp-2027.1.0-alpha-1-116-g5288562-osxuniversal.zip",
        sha256 = "13cd4ec2890f40de96e9d942297dfb4ed19861318a3b842910c1d26d1da9822d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/mrclib:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libmrclib.dylib osx/universal/shared/libmrclib.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_mrclib_mrclib-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/mrclib/mrclib-cpp/2027.1.0-alpha-1-116-g5288562/mrclib-cpp-2027.1.0-alpha-1-116-g5288562-windowsx86-64.zip",
        sha256 = "95b7cb77b4a4fed6d610ce6872d705d27178bcd1a5d1326c267c9cbe4fc71d5c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/mrclib:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_mrclib_mrclib-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/mrclib/mrclib-cpp/2027.1.0-alpha-1-116-g5288562/mrclib-cpp-2027.1.0-alpha-1-116-g5288562-windowsarm64.zip",
        sha256 = "34c3bfa2a1693e2181554383ba72245eb11a57325c25d1c07ec28f02233d6518",
        build_file = "@bzlmodrio-allwpilib//private/cpp/mrclib:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-8/datalog-cpp-2027.0.0-alpha-8-headers.zip",
        sha256 = "918b3dbc155ede64d98bec4dc5014023a48a70a720d778142dc16a3ee9352d69",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-8/datalog-cpp-2027.0.0-alpha-8-sources.zip",
        sha256 = "11e3016d07c2e2d629281ba557943ed03d90cf23c804175b7033d54863bb9b38",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-8/datalog-cpp-2027.0.0-alpha-8-linuxarm64.zip",
        sha256 = "b5dc7db0e62dacd95953f3cefef8e4443987839ea460fac979126df0e85dcb8f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-8/datalog-cpp-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "96f1bd18b1393f05941975dea9f2cba8b37de50f02416a4049bfdfa09d084057",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-8/datalog-cpp-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "839b40f59854aa43d9dc827631108b94869b27e3323b195c67867ab5ec7a64b7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libdatalog.dylib osx/universal/shared/libdatalog.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libdatalog.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-8/datalog-cpp-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "192f07d3ed9b88deb58f361c34785410a9d07f7530c9998923dd6e6001f76c35",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-8/datalog-cpp-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "5aac8c07eb60e8a8c6899ff3f69e7251d599c8f314487ec216f0c01ae6deb08c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-8/datalog-cpp-2027.0.0-alpha-8-linuxarm64static.zip",
        sha256 = "80b0a8b93a99d03e3da8de77aceba988534767831d77afd978e6ea53b9a4663d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-8/datalog-cpp-2027.0.0-alpha-8-linuxx86-64static.zip",
        sha256 = "5ffff2acaaea6ac1a6e2da254bae760f6ebd19d2b44befeed951873e82561174",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-8/datalog-cpp-2027.0.0-alpha-8-osxuniversalstatic.zip",
        sha256 = "c42fe93bb4ea59685f917bf459ed104f49654d5e82689cf7dd58e22f5efb9a18",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-8/datalog-cpp-2027.0.0-alpha-8-windowsx86-64static.zip",
        sha256 = "cd0d72ee6918c43012995a5cfedf322b4a82a7aefda8a961e6c092d0b16f432b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-8/datalog-cpp-2027.0.0-alpha-8-windowsarm64static.zip",
        sha256 = "979323f4c4ba503405d505baa21f99cbeda71014970ff4b2d7e3f431509faea5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-8/datalog-cpp-2027.0.0-alpha-8-linuxarm64debug.zip",
        sha256 = "3c5c33165d54c6cfef2a02a000e03e4e8326c601d4487bc202625e5348fafc65",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-8/datalog-cpp-2027.0.0-alpha-8-linuxx86-64debug.zip",
        sha256 = "5f44cd9f05db547cc8317e77de584adc681def3de3bf2beefa66a0a346778d58",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-8/datalog-cpp-2027.0.0-alpha-8-osxuniversaldebug.zip",
        sha256 = "50986b7636fac737bef7d04900d003ddc2dfd6a54d3ff0e0f7fb7920af68b709",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libdatalog.dylib osx/universal/shared/libdatalog.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libdatalog.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-8/datalog-cpp-2027.0.0-alpha-8-windowsx86-64debug.zip",
        sha256 = "c401fa6d3eb3869202dbb193b354eaec21db1958750e3a761581abe2c7a55f60",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-8/datalog-cpp-2027.0.0-alpha-8-windowsarm64debug.zip",
        sha256 = "ed7d67101a0562b9b2941c581127f2fbaac0acae6ce325dee6ccb7e9993ff6ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-8/datalog-cpp-2027.0.0-alpha-8-linuxarm64staticdebug.zip",
        sha256 = "42941bb4b492290b32800660af8d070ae4cea5d67c5a3f0e242a1767bd9b020c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-8/datalog-cpp-2027.0.0-alpha-8-linuxx86-64staticdebug.zip",
        sha256 = "21691963b1db02e9638782cd60ce5a1d6ee56fd5ba78980e54bda39f5f7f1e71",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-8/datalog-cpp-2027.0.0-alpha-8-osxuniversalstaticdebug.zip",
        sha256 = "53924867dcc238945a5701fc5e00d6cc0d9deebe97499c9ff7b440e33628cd4d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-8/datalog-cpp-2027.0.0-alpha-8-windowsx86-64staticdebug.zip",
        sha256 = "66b53d7c4a5aa3a494ad67c58c27b2bc1617544905ed3d2fe14a670de99272a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-8/datalog-cpp-2027.0.0-alpha-8-windowsarm64staticdebug.zip",
        sha256 = "baea6153e856e2bf65912e920ce10e4f6c90baece25e47f7bf321f1ff59b8796",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-8/datalog-cpp-2027.0.0-alpha-8-linuxsystemcore.zip",
        sha256 = "119c5d10a9fa4edd521afa489221a10a3e15931dbaf4ca039862a8720d2d0d9d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-8/datalog-cpp-2027.0.0-alpha-8-linuxsystemcorestatic.zip",
        sha256 = "19ff0db776d751f15a6a3a6914c11ce5d7f377af56aa7e46f3114536eb21fe1c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-8/datalog-cpp-2027.0.0-alpha-8-linuxsystemcoredebug.zip",
        sha256 = "d76e149d4c7fbfc7011a28053a944c45c6889f2f0dbb0e48b47cb7bd49cca0de",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-8/datalog-cpp-2027.0.0-alpha-8-linuxsystemcorestaticdebug.zip",
        sha256 = "91738a9df4421856c9ca6da05139c37f8159efd3fc97f06a53f8f5a7a430797d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-8/telemetry-cpp-2027.0.0-alpha-8-headers.zip",
        sha256 = "a6c326e257c6cf08b25a5b98b106010d8ac8f7ae2fb18f5571fbbd2453b5fbde",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-8/telemetry-cpp-2027.0.0-alpha-8-sources.zip",
        sha256 = "2e0612bff02416c9a19de3a24412921ba4ffb99541746b5906e4624308aef3e1",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-8/telemetry-cpp-2027.0.0-alpha-8-linuxarm64.zip",
        sha256 = "92113b8d8657d31f69540647922868152923b755278095c95b3c537fd4495628",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-8/telemetry-cpp-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "b90af09d5367a85b1e2b1b1d59fc6e71f61f41a3636653f08a30cae4b1bcd378",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-8/telemetry-cpp-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "9144d82c5148e6951d762bf96b347b8e198d72fdc2c77f542e1f91a724c73cda",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libtelemetry.dylib osx/universal/shared/libtelemetry.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libtelemetry.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-8/telemetry-cpp-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "cc7087a413f7fb05e7dd75b7ceeb5f3fef79871e348967c0d4339a5b29ac87be",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-8/telemetry-cpp-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "3ec632926a1d185c346cc4d970a3940c36df40d5d7dc65b3aebb8c42208a25fb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-8/telemetry-cpp-2027.0.0-alpha-8-linuxarm64static.zip",
        sha256 = "56c0bb0fa5bc354b7eadec8a6f406a89f369155c424d475aca70833b061270a2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-8/telemetry-cpp-2027.0.0-alpha-8-linuxx86-64static.zip",
        sha256 = "0a4f14007571b71f12a5bf93a8b54a15306138f6eee865dd4935fe3b2178b695",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-8/telemetry-cpp-2027.0.0-alpha-8-osxuniversalstatic.zip",
        sha256 = "331efea8870c846db46f2c9de6dd8eca763b827aaedcec1ba2e30cc0136a2638",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-8/telemetry-cpp-2027.0.0-alpha-8-windowsx86-64static.zip",
        sha256 = "4e09cbff6dbe943123f3b8a5dbeb8574bd481891ffca6ccc9b8c8a7c58adbbd1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-8/telemetry-cpp-2027.0.0-alpha-8-windowsarm64static.zip",
        sha256 = "9eff3c24ec417c2f8d6b1b9870010a731e0b9fc877bc13bccf6c25fd500dea6a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-8/telemetry-cpp-2027.0.0-alpha-8-linuxarm64debug.zip",
        sha256 = "2d3a8a1166e9bd33c8d25148e233d2a1961a35f8af967ad4edc3ae84b115bbf8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-8/telemetry-cpp-2027.0.0-alpha-8-linuxx86-64debug.zip",
        sha256 = "b6de8954509e0e1500582030b7d3e86c7fcd4fcc4195238b9891e046bbee96e6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-8/telemetry-cpp-2027.0.0-alpha-8-osxuniversaldebug.zip",
        sha256 = "9c0630e82a267661b2ea9bb0aad12f43ece3a4e5aeaf2c25aaf1e646ecad60cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libtelemetry.dylib osx/universal/shared/libtelemetry.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libtelemetry.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-8/telemetry-cpp-2027.0.0-alpha-8-windowsx86-64debug.zip",
        sha256 = "f580fbe23567ab489afc25331f7e05d7de134fff420d9956456843263ce0dfd8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-8/telemetry-cpp-2027.0.0-alpha-8-windowsarm64debug.zip",
        sha256 = "95dd06fa71006dd8a73de6a28d6c3fe1f1b3024718539dd34272e5e273ecde41",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-8/telemetry-cpp-2027.0.0-alpha-8-linuxarm64staticdebug.zip",
        sha256 = "00278bd1db37dc46f43bdce2911d3d43ee8a5677af809acdb9dbdda24269c351",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-8/telemetry-cpp-2027.0.0-alpha-8-linuxx86-64staticdebug.zip",
        sha256 = "dd48d673c54951f24445a0d32dda3459a39a51a2c7906a69d2c9ee24c060de94",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-8/telemetry-cpp-2027.0.0-alpha-8-osxuniversalstaticdebug.zip",
        sha256 = "910fcc71d170499b8e5001dc1d40842b1e73c2e64e687480796ba61cef07bc99",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-8/telemetry-cpp-2027.0.0-alpha-8-windowsx86-64staticdebug.zip",
        sha256 = "2ab8b316a58fbd07d8a208ddeea358daab8a3d00d38e96c32466fa627ab7369d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-8/telemetry-cpp-2027.0.0-alpha-8-windowsarm64staticdebug.zip",
        sha256 = "fb2a9c58d3d67936dce7ea42774152b2c903520a411efed784f78627eb76e299",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-8/telemetry-cpp-2027.0.0-alpha-8-linuxsystemcore.zip",
        sha256 = "3e9c1d844752442b1303e6e53bbfc4565f465cef9bfa2b82bfc2ad5c139021d7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-8/telemetry-cpp-2027.0.0-alpha-8-linuxsystemcorestatic.zip",
        sha256 = "98b1e3475689640d6ef6350287a414cce07d5d0605b66c8bd4641133b98740ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-8/telemetry-cpp-2027.0.0-alpha-8-linuxsystemcoredebug.zip",
        sha256 = "52b882fe117b4c7f1a114619f97e9412af89de57438818311d6ddd4ae857f4ab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-8/telemetry-cpp-2027.0.0-alpha-8-linuxsystemcorestaticdebug.zip",
        sha256 = "ae7cbdbe4a5a9bac3d17a7cf3c9a58a6c227e19a88dce92abbc9e6c0e5636f47",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-8/tunables-cpp-2027.0.0-alpha-8-headers.zip",
        sha256 = "4538b44ca503ce366635cfb7ce1fa0dc644ba9c844ee9538149196c7522213d8",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-8/tunables-cpp-2027.0.0-alpha-8-sources.zip",
        sha256 = "39b3ee4ca80cd87ae0721c859b7877e8823a54dfed17821c13c9b2b3da6057c9",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-8/tunables-cpp-2027.0.0-alpha-8-linuxarm64.zip",
        sha256 = "3e791458d22e2c039cf8ccdad47f01a98e3b5b1cf46345d50890d8c6d4bf6a09",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-8/tunables-cpp-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "b2d2f4936b77a0a7e6a6357ca906a46d4bdccd92c3394f8997e77603546a2174",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-8/tunables-cpp-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "bb0d6420b243d233eaaa92e62f9074446767c8a00c988ee9ad2fbcf35d443eec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libtunables.dylib osx/universal/shared/libtunables.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libtunables.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-8/tunables-cpp-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "2c1462998be16174b32678b01945d4dd5676e4601974f5fef3bad97422a04691",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-8/tunables-cpp-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "ab984c9a9b3a828745294755fbc3afe9ac66025efadd358b05c10cffbe0c7156",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-8/tunables-cpp-2027.0.0-alpha-8-linuxarm64static.zip",
        sha256 = "d3f9606be13f0085849d002b92ae7c7d4820915f146c6dd62b48a8d7a284a88e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-8/tunables-cpp-2027.0.0-alpha-8-linuxx86-64static.zip",
        sha256 = "01081f9746ff43a22fc5cbbb447ff2b6425e59eed860a1477919a6e82b8bba31",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-8/tunables-cpp-2027.0.0-alpha-8-osxuniversalstatic.zip",
        sha256 = "c2b083bb19886e8862bfa5b8b9d80b8dd18b6def5da5a6f562734a95b9ad0966",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-8/tunables-cpp-2027.0.0-alpha-8-windowsx86-64static.zip",
        sha256 = "7027b2a55c3da47250d0050c0a4981691706ee6fde6077c209df0c25b33aead5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-8/tunables-cpp-2027.0.0-alpha-8-windowsarm64static.zip",
        sha256 = "ca2310a7a7e2907478a296735961c297740f0ffba4b142c959a8aaa77369bb97",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-8/tunables-cpp-2027.0.0-alpha-8-linuxarm64debug.zip",
        sha256 = "faca514e2fd02207d266cbdf80836fabc8613711bf5c34a278f3ebc0d95c0385",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-8/tunables-cpp-2027.0.0-alpha-8-linuxx86-64debug.zip",
        sha256 = "6c581ba7af73316f6a0d95fdcad053b12e18df0af06459efd8528ad84d752981",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-8/tunables-cpp-2027.0.0-alpha-8-osxuniversaldebug.zip",
        sha256 = "0edffad847a3cedbe5300b1181c4586ddae2e7848de331b4dd7d6a6a72d4a0e0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libtunables.dylib osx/universal/shared/libtunables.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libtunables.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-8/tunables-cpp-2027.0.0-alpha-8-windowsx86-64debug.zip",
        sha256 = "e41dabb09e80ac0a4fdf462b1d8b6ee80f3307e7cc3610e512e2e981efdc2837",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-8/tunables-cpp-2027.0.0-alpha-8-windowsarm64debug.zip",
        sha256 = "00b0e304cf2fe4457defc87c2eb49fb278bfb3f8676f16d5568243fb2c273704",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-8/tunables-cpp-2027.0.0-alpha-8-linuxarm64staticdebug.zip",
        sha256 = "4cf6ff18033cee2ea87e5abe9da1367bd40f3e850b7ad243350d6fedb0f951f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-8/tunables-cpp-2027.0.0-alpha-8-linuxx86-64staticdebug.zip",
        sha256 = "b06775b87e9ad5ed4b0f6fbe42478db7f21132c45f24e793d265dc30e622d664",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-8/tunables-cpp-2027.0.0-alpha-8-osxuniversalstaticdebug.zip",
        sha256 = "f9c5242dc32abf9de82c8bec17f1e0ca358d4fb7d426ed39920b48905f808b4f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-8/tunables-cpp-2027.0.0-alpha-8-windowsx86-64staticdebug.zip",
        sha256 = "26067e0d934502e024bf7c3700459d1bdb4422bf243579e45d782e5446ea4a79",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-8/tunables-cpp-2027.0.0-alpha-8-windowsarm64staticdebug.zip",
        sha256 = "5a57e002263ca2c165bb33bf1abd3fb5c5091d0f5a172e5ca4b9dfc1c55275ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-8/tunables-cpp-2027.0.0-alpha-8-linuxsystemcore.zip",
        sha256 = "d90cc5e51e0ed718f71181a74f92dcf697f593b796a72329504f2d8df3c90634",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-8/tunables-cpp-2027.0.0-alpha-8-linuxsystemcorestatic.zip",
        sha256 = "57b022d9cad575ca1a940e8b9efdc872c8a421d65f312f13bc9469491747bba5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-8/tunables-cpp-2027.0.0-alpha-8-linuxsystemcoredebug.zip",
        sha256 = "f3e73efb59dd32eee485772630fef652bd69426094dafe7da4d2f42999260e9f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-8/tunables-cpp-2027.0.0-alpha-8-linuxsystemcorestaticdebug.zip",
        sha256 = "99860b121516008afba961436ebe6f9eb14095dfd9ff2525d8f55032b507df5a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-8/wpinet-cpp-2027.0.0-alpha-8-headers.zip",
        sha256 = "151f22f6c0f2b4a7b174cc4a3957695c8b90c6ab095e66fd92985a3174c55ed0",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-8/wpinet-cpp-2027.0.0-alpha-8-sources.zip",
        sha256 = "e50270f5b147d7d50fe5d9393a08eb00c6a3e0e4e954dc37123e8c3199138723",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-8/wpinet-cpp-2027.0.0-alpha-8-linuxarm64.zip",
        sha256 = "97cfd3bfda3d0c33ec930c587e765217686e5a3e48fc862edd06c9089d223add",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-8/wpinet-cpp-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "7a0ca32d89026506eeb7c127fb5609e8e2136a2b524c5d192bea3d0208573205",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-8/wpinet-cpp-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "d82ae35c7abc76afc30afe89837b5caa95e66b04e203fb37ae65f5045bc8e326",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-8/wpinet-cpp-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "5b91661afc0dc8470c9842418ff79c90ba19a717ae04fbd301d2ec96e12aa3aa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-8/wpinet-cpp-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "5666650997595102de70d0d503a655266cf4496bfb74712d1f02af77f787a582",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-8/wpinet-cpp-2027.0.0-alpha-8-linuxarm64static.zip",
        sha256 = "7a6a20202ed1eae042d740c58fcc6b460c9b1534ebfcd949a38673981cd8f024",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-8/wpinet-cpp-2027.0.0-alpha-8-linuxx86-64static.zip",
        sha256 = "602ddb9e177b3f8d4694877f455c193cc74079f0cda624a8417ce317d1b27eb4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-8/wpinet-cpp-2027.0.0-alpha-8-osxuniversalstatic.zip",
        sha256 = "96e4ec031b36a49af66ffef3c004f8b04ec8691570d8541d47547661f3c504ca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-8/wpinet-cpp-2027.0.0-alpha-8-windowsx86-64static.zip",
        sha256 = "684a02a491607839708c16f56aecb95cb05dd62b41a79e6cc0ae90800239437a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-8/wpinet-cpp-2027.0.0-alpha-8-windowsarm64static.zip",
        sha256 = "5a5af5ccd11df0ad09a81f6fa4c9526fbead8869f4a90fc80522e300a72451fb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-8/wpinet-cpp-2027.0.0-alpha-8-linuxarm64debug.zip",
        sha256 = "f0ac85b59b6d92cd0b0302d0b6368aad3f35fe105564d0325d72d8e6b2ff7bba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-8/wpinet-cpp-2027.0.0-alpha-8-linuxx86-64debug.zip",
        sha256 = "8cff42ef3606fb705c3238487b7747422a89ae953568f24f41c9c13679975bf9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-8/wpinet-cpp-2027.0.0-alpha-8-osxuniversaldebug.zip",
        sha256 = "249cf8107b9484e2b107eca4b72efb98be9da7d492ff7db5078fd8f280df4e0d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-8/wpinet-cpp-2027.0.0-alpha-8-windowsx86-64debug.zip",
        sha256 = "88b6d11ed6c612f4a1416d268ff832a1983af8ac795856b7ec039c8b508d011c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-8/wpinet-cpp-2027.0.0-alpha-8-windowsarm64debug.zip",
        sha256 = "c16ff06c559547b7f3bb92d3ba7fbb482c1169634ca18c2662bf92bb1cf79f80",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-8/wpinet-cpp-2027.0.0-alpha-8-linuxarm64staticdebug.zip",
        sha256 = "f467ad48e2d74d979d6ec6bbf54c9ca3c78c088841adf1cdc460e7573f50ac07",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-8/wpinet-cpp-2027.0.0-alpha-8-linuxx86-64staticdebug.zip",
        sha256 = "e481f4e86f401c2fcccd439ab1a03d361c5b3f644288a02de85911ea23f42c18",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-8/wpinet-cpp-2027.0.0-alpha-8-osxuniversalstaticdebug.zip",
        sha256 = "7453799e82efef25e01053eb1495392e2295fce978ce406b1d42a299eb9bb120",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-8/wpinet-cpp-2027.0.0-alpha-8-windowsx86-64staticdebug.zip",
        sha256 = "a38d9ad28f82de42e2f96df53987832f0aeae19e26722a3860d6c8ea7275c9d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-8/wpinet-cpp-2027.0.0-alpha-8-windowsarm64staticdebug.zip",
        sha256 = "051d51a74b01bb98fbc138cc40e9f7378e8f8255488bca98fd596cab6ab16b87",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-8/wpinet-cpp-2027.0.0-alpha-8-linuxsystemcore.zip",
        sha256 = "ab7e41e6037136079280f5230f87e10b9c64985cce883bc1317f9b93fdac1019",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-8/wpinet-cpp-2027.0.0-alpha-8-linuxsystemcorestatic.zip",
        sha256 = "f57f67d2f0adfce89ecd7c10e888df162ea13c9a52314a7ca17c5f9fb8210e49",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-8/wpinet-cpp-2027.0.0-alpha-8-linuxsystemcoredebug.zip",
        sha256 = "ffca62c498501baf11d95cb30c247395c3429511df2196c94e9b988ee76c9d58",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-8/wpinet-cpp-2027.0.0-alpha-8-linuxsystemcorestaticdebug.zip",
        sha256 = "be370c11996cf51c14fe2634e8928258f45fd0c5fb0e067870f7047fa44d8945",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-8/wpimath-cpp-2027.0.0-alpha-8-headers.zip",
        sha256 = "5de3ba845f5da514a0a92589b831d6f18d4de3ea60d25c285150ba4972340e02",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-8/wpimath-cpp-2027.0.0-alpha-8-sources.zip",
        sha256 = "4e7e68ead45e20d7bca4daf61d87a04a7df8353175eae70d8856848578cc5378",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-8/wpimath-cpp-2027.0.0-alpha-8-linuxarm64.zip",
        sha256 = "47d5856b191b3a99b95c02400d95c9b909c493ff7efd67a51924e15504b86bc7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-8/wpimath-cpp-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "17d9872ffe943c2a35d4ac7c044f06f095146225078a7cf011b90cb070174b75",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-8/wpimath-cpp-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "cf5eb280fa6db28372b015cbc0e05b12273a84b8a70d47f55e7c82fd2c4df44c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libtelemetry.dylib @rpath/libtelemetry.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libtunables.dylib @rpath/libtunables.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-8/wpimath-cpp-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "88b0ad3c6d35217444dc7c6965a4b594b1f6fc294e393e65f00b62c7829edb86",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-8/wpimath-cpp-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "cb739dc71d737f3701328ccf0f3a9532e0822014864487604787995d103e22a7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-8/wpimath-cpp-2027.0.0-alpha-8-linuxarm64static.zip",
        sha256 = "6419fcaab7c6d787420fbce30f0e6a6863e21e5b27bdf2e220cbdaa549704766",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-8/wpimath-cpp-2027.0.0-alpha-8-linuxx86-64static.zip",
        sha256 = "b9399a135f2693aa5d3114c38e97ab7e85038227bd0faa49f20f0b39af5e5b41",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-8/wpimath-cpp-2027.0.0-alpha-8-osxuniversalstatic.zip",
        sha256 = "50485c606b793b33a2908be8eb400f4a3f577721f2b1c4aacb740c672939ca70",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-8/wpimath-cpp-2027.0.0-alpha-8-windowsx86-64static.zip",
        sha256 = "ebb037de7766f16e2fc6b905f5414b66e3a565b38718b93b3ae78e8697096a65",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-8/wpimath-cpp-2027.0.0-alpha-8-windowsarm64static.zip",
        sha256 = "4293ca5212c72007ee2db52904aca017eae9c95fbcaba6fdb6d5087d20c2ca10",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-8/wpimath-cpp-2027.0.0-alpha-8-linuxarm64debug.zip",
        sha256 = "4d60f3d9c2ef5fedc76e6457494fd95772fa20b8cf936636c9662651d1448221",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-8/wpimath-cpp-2027.0.0-alpha-8-linuxx86-64debug.zip",
        sha256 = "265d7d1d11d3d85f8c3f28a9c28aeda07dd0c07f85e6f9168eb57fd0c1a1f136",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-8/wpimath-cpp-2027.0.0-alpha-8-osxuniversaldebug.zip",
        sha256 = "9f9295d970f065422530f177a19c793b445d0c1b9b0f25354478eceba66aea52",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libtelemetry.dylib @rpath/libtelemetry.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libtunables.dylib @rpath/libtunables.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-8/wpimath-cpp-2027.0.0-alpha-8-windowsx86-64debug.zip",
        sha256 = "4fc7e9d884f822dce9cb9fe1475654b71a9765333d975195349464fe1fbcf305",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-8/wpimath-cpp-2027.0.0-alpha-8-windowsarm64debug.zip",
        sha256 = "13b9567901068cc4e5602127105b1662fb7a2577b69ac05dcb1fbb0af7241f57",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-8/wpimath-cpp-2027.0.0-alpha-8-linuxarm64staticdebug.zip",
        sha256 = "fcfdee9890797b26b9d1b56381d815d9af1643f0c7f402b4b62306ed4ac6210d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-8/wpimath-cpp-2027.0.0-alpha-8-linuxx86-64staticdebug.zip",
        sha256 = "19322ad314ffbe8f23e359383fb735b7824db68f0e64f5c85d45d8c3d9f14a12",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-8/wpimath-cpp-2027.0.0-alpha-8-osxuniversalstaticdebug.zip",
        sha256 = "ff56aa85d2b7e7d4db290b86662a7e4eee70a8aff89f32ade214bdbf38636776",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-8/wpimath-cpp-2027.0.0-alpha-8-windowsx86-64staticdebug.zip",
        sha256 = "48741d90dd1c5c0a84904c810b8f2fe5466211de2aae7a0caffbdbe7add7eccf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-8/wpimath-cpp-2027.0.0-alpha-8-windowsarm64staticdebug.zip",
        sha256 = "bef04773ed228d1df183280e283ade7c82c8e3808acfc8d174e667c7f6554e62",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-8/wpimath-cpp-2027.0.0-alpha-8-linuxsystemcore.zip",
        sha256 = "67bbc01b67e2a0cf6f3d4d75ea408f84930fb7e63efad1ade3ae06e3e199f016",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-8/wpimath-cpp-2027.0.0-alpha-8-linuxsystemcorestatic.zip",
        sha256 = "3a0306a359a2eceb596e600e780c8b114104da01d5bedaac667f71f20128f106",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-8/wpimath-cpp-2027.0.0-alpha-8-linuxsystemcoredebug.zip",
        sha256 = "0d59e53a9621eab65dbc6dc8d5f4e51de7ff72913c293e0e8f3846a52b2c45ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-8/wpimath-cpp-2027.0.0-alpha-8-linuxsystemcorestaticdebug.zip",
        sha256 = "7ebab40e72666108ea44287611c146609f2e642e58431c74b41aa30fe9afd96a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-8/apriltag-cpp-2027.0.0-alpha-8-headers.zip",
        sha256 = "a8fc361c417d9318b0aeaf5df903aa0883560e26153cda96bdb0ae65756dec76",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-8/apriltag-cpp-2027.0.0-alpha-8-sources.zip",
        sha256 = "c9e3f1942635c1f5f688bcc9ed0564c9ca94b629e2b8ced0401f290b9fa43e04",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-8/apriltag-cpp-2027.0.0-alpha-8-linuxarm64.zip",
        sha256 = "f8d3dacd5db7bb1ac9ebd9506610e4d659fc3aab7390d0d4dabcd9d42caa3d04",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-8/apriltag-cpp-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "da437202de8778525f00ab3ef54ddf91b193d4bbd4361b9c6fd26277ed09ad3a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-8/apriltag-cpp-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "6c441f57d33e43ab85dd5f1091ca8a7ece8c89dae95322aa61a4d3eb3edc0e12",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libapriltag.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libtelemetry.dylib @rpath/libtelemetry.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libtunables.dylib @rpath/libtunables.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libapriltag.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-8/apriltag-cpp-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "fa0e31e4defd511277e8934686a0556b9157019dd3a79be0cb70a684947deecd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-8/apriltag-cpp-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "f97aea6eaca577e3409d5f1f48878e9ee51b7455bb76ff9a51c169bc02af0707",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-8/apriltag-cpp-2027.0.0-alpha-8-linuxarm64static.zip",
        sha256 = "11d20e6462ec75054ee1d5cd1c483f6271c1f591f196e2bd1f209a9e8e08d5d8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-8/apriltag-cpp-2027.0.0-alpha-8-linuxx86-64static.zip",
        sha256 = "7458e5c8c9e645c98c13433a1849ec101a67b596e9b331e91ab6da69ece61bc3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-8/apriltag-cpp-2027.0.0-alpha-8-osxuniversalstatic.zip",
        sha256 = "cef1199b411b7ac82c0d90ef8a6207431c9fece5e2e3fb2663a0b5f941be7d5a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-8/apriltag-cpp-2027.0.0-alpha-8-windowsx86-64static.zip",
        sha256 = "bf152836d9bdd9e0e2ade3f42078d6297d909e7e690054607ce8b027f119b08e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-8/apriltag-cpp-2027.0.0-alpha-8-windowsarm64static.zip",
        sha256 = "6718c9eca4e5379243cc82ec554a238f0743d9fabeb8bb40c28d1f90680c5cd7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-8/apriltag-cpp-2027.0.0-alpha-8-linuxarm64debug.zip",
        sha256 = "37444b512b3a98fa495c7d048b563ceb9955d00c3be01a5523734d7546495297",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-8/apriltag-cpp-2027.0.0-alpha-8-linuxx86-64debug.zip",
        sha256 = "7cc5cbae846bd401760f721f591106d239606cae2158485e6f217570f9cfde55",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-8/apriltag-cpp-2027.0.0-alpha-8-osxuniversaldebug.zip",
        sha256 = "1d553b52c988f80ec718f4a5efb1df9962ad6894ab4efc92187091e3996403f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libapriltag.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libtelemetry.dylib @rpath/libtelemetry.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libtunables.dylib @rpath/libtunables.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libapriltag.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-8/apriltag-cpp-2027.0.0-alpha-8-windowsx86-64debug.zip",
        sha256 = "033e2306a292dff06be631840532055a5a56e0cf0bdfbda89d56c632641b14fa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-8/apriltag-cpp-2027.0.0-alpha-8-windowsarm64debug.zip",
        sha256 = "c49c7a98b0d98f92ac334cb7fd13ec92e7fb0b9520d6f95551e7f0f12264fcc0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-8/apriltag-cpp-2027.0.0-alpha-8-linuxarm64staticdebug.zip",
        sha256 = "535873d046425b0a9e83d0d08577560d32c23a25c309c2bf7beb5ee902716a5c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-8/apriltag-cpp-2027.0.0-alpha-8-linuxx86-64staticdebug.zip",
        sha256 = "183a8a3e44de2405c376e3a5578a3b805c69169d0cf5a3884d6216a104606545",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-8/apriltag-cpp-2027.0.0-alpha-8-osxuniversalstaticdebug.zip",
        sha256 = "55ace3dfa297ad9a8f8d21fa77ddd221f7798177855dfaf459451774eed6f9d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-8/apriltag-cpp-2027.0.0-alpha-8-windowsx86-64staticdebug.zip",
        sha256 = "f47d3a73e8bef06587940af7a33dacfd3ffcea97d70d13cb518a0db2d42f1b0a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-8/apriltag-cpp-2027.0.0-alpha-8-windowsarm64staticdebug.zip",
        sha256 = "810c91d4836ea16b9715f316ad5ce9923b1bad0d37b9ce0ae2b6776824d89dbe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-8/apriltag-cpp-2027.0.0-alpha-8-linuxsystemcore.zip",
        sha256 = "2f14bd4801beaa6ee7acf932342b9a32ea69a2f8d014b5bacce491c702eaec90",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-8/apriltag-cpp-2027.0.0-alpha-8-linuxsystemcorestatic.zip",
        sha256 = "8eb9a12b32c1b59f33480f91eab3d648af791b8deb3f9b6872b83b7d92cf881c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-8/apriltag-cpp-2027.0.0-alpha-8-linuxsystemcoredebug.zip",
        sha256 = "069f342d3a5f641819032d0b4970ecb443910fcf49c3b577127735f249fe2dc4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-8/apriltag-cpp-2027.0.0-alpha-8-linuxsystemcorestaticdebug.zip",
        sha256 = "dce9cd2467ae0cd35c926857b7fbb0694528dbc0c0388699e5de742bdf7ec330",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_fields_fields-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/fields/fields-cpp/2027.0.0-alpha-8/fields-cpp-2027.0.0-alpha-8-headers.zip",
        sha256 = "75caeeacd5d602b4fc78342b4ac7abd8e61de474f2e6533ac2fdf4c03d594113",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_fields_fields-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/fields/fields-cpp/2027.0.0-alpha-8/fields-cpp-2027.0.0-alpha-8-sources.zip",
        sha256 = "6d0e8c71be857d68dbfbfbd8a6a3e21cd2f71f6fad769695094fea0d552122ec",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_fields_fields-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/fields/fields-cpp/2027.0.0-alpha-8/fields-cpp-2027.0.0-alpha-8-linuxarm64.zip",
        sha256 = "3eb3edbc81dc15c45fae11828df7144888caa4862f71ade76ff0bace12383adf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/fields:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_fields_fields-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/fields/fields-cpp/2027.0.0-alpha-8/fields-cpp-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "e7fa67c3a6d407c50a6b918ec9d848f311f5b1dbf708063f0a85b34e1cdfd417",
        build_file = "@bzlmodrio-allwpilib//private/cpp/fields:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_fields_fields-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/fields/fields-cpp/2027.0.0-alpha-8/fields-cpp-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "77bb7829c708c7e21f2c337daf9cc4591242a2c4df076ecd8448418e26a30aaf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/fields:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libfields.dylib osx/universal/shared/libfields.dylib",
            "install_name_tool -change libtelemetry.dylib @rpath/libtelemetry.dylib osx/universal/shared/libfields.dylib",
            "install_name_tool -change libtunables.dylib @rpath/libtunables.dylib osx/universal/shared/libfields.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libfields.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libfields.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_fields_fields-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/fields/fields-cpp/2027.0.0-alpha-8/fields-cpp-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "187a8e7531cb95d56c2880bb0a60a0d9f6a81b2e93a6eb4561446622e7f8a5c1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/fields:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_fields_fields-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/fields/fields-cpp/2027.0.0-alpha-8/fields-cpp-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "05be6c9f05f2deab8ea1efefa865bd8fbe4af0d2d94d9670e04f924fbe06db3f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/fields:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_fields_fields-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/fields/fields-cpp/2027.0.0-alpha-8/fields-cpp-2027.0.0-alpha-8-linuxarm64static.zip",
        sha256 = "82d7e5f64cb60aa4d276d89e1bb4bdf68f26df7bd74ea24f41c6095e097a2b46",
        build_file = "@bzlmodrio-allwpilib//private/cpp/fields:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_fields_fields-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/fields/fields-cpp/2027.0.0-alpha-8/fields-cpp-2027.0.0-alpha-8-linuxx86-64static.zip",
        sha256 = "1cd4ee5a6d58775098cc70b0db7a7af8d8a22d013db653310d670123ebf81d4a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/fields:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_fields_fields-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/fields/fields-cpp/2027.0.0-alpha-8/fields-cpp-2027.0.0-alpha-8-osxuniversalstatic.zip",
        sha256 = "c5d03349c132e676fc3b4c35e75aeea505f1c877ba8cee34ab62de4e49150c22",
        build_file = "@bzlmodrio-allwpilib//private/cpp/fields:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_fields_fields-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/fields/fields-cpp/2027.0.0-alpha-8/fields-cpp-2027.0.0-alpha-8-windowsx86-64static.zip",
        sha256 = "819f9207e32208f6e573c6657c92982caee6a0f083b83b0c1925a9759595effa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/fields:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_fields_fields-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/fields/fields-cpp/2027.0.0-alpha-8/fields-cpp-2027.0.0-alpha-8-windowsarm64static.zip",
        sha256 = "1d829cc9855f26643bc08302b907a1c6bf954433d690313607ce4399fc8561dd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/fields:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_fields_fields-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/fields/fields-cpp/2027.0.0-alpha-8/fields-cpp-2027.0.0-alpha-8-linuxarm64debug.zip",
        sha256 = "f4a27ef9173c4f63946918b926bc82193d7e00a1c71fdd0ab0863fd074c91914",
        build_file = "@bzlmodrio-allwpilib//private/cpp/fields:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_fields_fields-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/fields/fields-cpp/2027.0.0-alpha-8/fields-cpp-2027.0.0-alpha-8-linuxx86-64debug.zip",
        sha256 = "08dbeb884a95833afafdd0a83f789fdf159440a16536792162f188f66eabe4ba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/fields:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_fields_fields-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/fields/fields-cpp/2027.0.0-alpha-8/fields-cpp-2027.0.0-alpha-8-osxuniversaldebug.zip",
        sha256 = "33567259a49297b329605567033927b47f098c3fcbc33750e0949f72a8eb3f46",
        build_file = "@bzlmodrio-allwpilib//private/cpp/fields:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libfields.dylib osx/universal/shared/libfields.dylib",
            "install_name_tool -change libtelemetry.dylib @rpath/libtelemetry.dylib osx/universal/shared/libfields.dylib",
            "install_name_tool -change libtunables.dylib @rpath/libtunables.dylib osx/universal/shared/libfields.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libfields.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libfields.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_fields_fields-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/fields/fields-cpp/2027.0.0-alpha-8/fields-cpp-2027.0.0-alpha-8-windowsx86-64debug.zip",
        sha256 = "a2136f2e0958b23bbfcda6b67736cec051c0e3bf1f4419648c1a9d9dc8b47eed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/fields:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_fields_fields-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/fields/fields-cpp/2027.0.0-alpha-8/fields-cpp-2027.0.0-alpha-8-windowsarm64debug.zip",
        sha256 = "f47b596a76a36b5872e33f1b7927ab63f18cfbbfe7d335a3acad319fdd5dff63",
        build_file = "@bzlmodrio-allwpilib//private/cpp/fields:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_fields_fields-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/fields/fields-cpp/2027.0.0-alpha-8/fields-cpp-2027.0.0-alpha-8-linuxarm64staticdebug.zip",
        sha256 = "e21d09ec1c220023d705b6ebbba85d2f7e894f3a78a8be8887479a23aba2ccc8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/fields:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_fields_fields-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/fields/fields-cpp/2027.0.0-alpha-8/fields-cpp-2027.0.0-alpha-8-linuxx86-64staticdebug.zip",
        sha256 = "59949427a196177459da197c94ef9dc9247365eb69d3118058af3712730d5663",
        build_file = "@bzlmodrio-allwpilib//private/cpp/fields:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_fields_fields-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/fields/fields-cpp/2027.0.0-alpha-8/fields-cpp-2027.0.0-alpha-8-osxuniversalstaticdebug.zip",
        sha256 = "b70c306dd3639e26a658f179030f68ed1f9f1c68489291fdb7ae4f1c40100790",
        build_file = "@bzlmodrio-allwpilib//private/cpp/fields:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_fields_fields-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/fields/fields-cpp/2027.0.0-alpha-8/fields-cpp-2027.0.0-alpha-8-windowsx86-64staticdebug.zip",
        sha256 = "980b38e6521bb9abf43ad20f1b5c54617813e41eb727d587b0a4c915f0c19c34",
        build_file = "@bzlmodrio-allwpilib//private/cpp/fields:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_fields_fields-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/fields/fields-cpp/2027.0.0-alpha-8/fields-cpp-2027.0.0-alpha-8-windowsarm64staticdebug.zip",
        sha256 = "af2eb06d72e91e3b95c3e67475d98029d805f088aaedc43ba7d255f3dd7bd740",
        build_file = "@bzlmodrio-allwpilib//private/cpp/fields:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_fields_fields-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/fields/fields-cpp/2027.0.0-alpha-8/fields-cpp-2027.0.0-alpha-8-linuxsystemcore.zip",
        sha256 = "28911c23e688f2fe1691cc919156c8cf36cbe155e0030d5c03267a5623c4a304",
        build_file = "@bzlmodrio-allwpilib//private/cpp/fields:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_fields_fields-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/fields/fields-cpp/2027.0.0-alpha-8/fields-cpp-2027.0.0-alpha-8-linuxsystemcorestatic.zip",
        sha256 = "364fb24660793a7e67dcde7632bf7ed915793691009fbc0c87c2f652acbcaafc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/fields:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_fields_fields-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/fields/fields-cpp/2027.0.0-alpha-8/fields-cpp-2027.0.0-alpha-8-linuxsystemcoredebug.zip",
        sha256 = "4c80ab000092dcd52617fe09d3e4213f4440b5b6b357c151e612360d39d1ff83",
        build_file = "@bzlmodrio-allwpilib//private/cpp/fields:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_fields_fields-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/fields/fields-cpp/2027.0.0-alpha-8/fields-cpp-2027.0.0-alpha-8-linuxsystemcorestaticdebug.zip",
        sha256 = "42bafe246961ab02ed2c9f51205937691a967006251ff1c344211cbcb82982be",
        build_file = "@bzlmodrio-allwpilib//private/cpp/fields:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-8/ntcore-cpp-2027.0.0-alpha-8-headers.zip",
        sha256 = "4bb6e3ab53410f10e769c38102029d08ecaaf01425ab181929458f2f7a0f2b43",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-8/ntcore-cpp-2027.0.0-alpha-8-sources.zip",
        sha256 = "0b6011cdc4c715c9856b705c3221f03071cc159603671acb1bb425458eacd3a4",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-8/ntcore-cpp-2027.0.0-alpha-8-linuxarm64.zip",
        sha256 = "5d539cb04bc53858b21d26aad1ca4ea9f6453e35359bdf9e063f82c05b96b5e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-8/ntcore-cpp-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "af3ed838b551c65e0b3c0e708824999dfb1dbbaafcc952a7c0245062efe0a5b2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-8/ntcore-cpp-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "d76eea7c8760a9f485a0444d341035c2161debcb15c5efe8d9f7bbb905910960",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libntcore.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libntcore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-8/ntcore-cpp-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "15f6c6c27d141ae85633ffed818dabe82d53ee5c16fd3cee4f42a23145fe097d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-8/ntcore-cpp-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "5307e7fc14e37872d587341280a6a0af362c533da5d0a60a3158400a60e8f963",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-8/ntcore-cpp-2027.0.0-alpha-8-linuxarm64static.zip",
        sha256 = "f89775bb5d0909857f68f6f01d09d6c989477055118e1347b5f1ea84e86de957",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-8/ntcore-cpp-2027.0.0-alpha-8-linuxx86-64static.zip",
        sha256 = "186d101c6c5c1efb7900c9c02188985baf54c53ec9432820f5856fb7e7df0200",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-8/ntcore-cpp-2027.0.0-alpha-8-osxuniversalstatic.zip",
        sha256 = "ddddb591dcedb7fc032141137eebbfcc9c50feee1e7fb2f5a57a8608291ba1f6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-8/ntcore-cpp-2027.0.0-alpha-8-windowsx86-64static.zip",
        sha256 = "7a8c578e96f8286308b359b878343710494f4128feb7bf438bf4ca8f02dc909f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-8/ntcore-cpp-2027.0.0-alpha-8-windowsarm64static.zip",
        sha256 = "b97ad1d91dfef8c59e91a043679df1cb157165fb280dd97476c7b8327608e162",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-8/ntcore-cpp-2027.0.0-alpha-8-linuxarm64debug.zip",
        sha256 = "940cd90ad04a2b6601b7d3cc900d8a5f17c87f02b4b214f5f10066dcfc8e470b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-8/ntcore-cpp-2027.0.0-alpha-8-linuxx86-64debug.zip",
        sha256 = "44464bf908b52fde57499da8cf4a7e09d9da6394524f91421d0f6454619b1075",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-8/ntcore-cpp-2027.0.0-alpha-8-osxuniversaldebug.zip",
        sha256 = "019b976701b550e139f6a271d6a4317952d26ce4d89d026af29cf02aff04969c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libntcore.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libntcore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-8/ntcore-cpp-2027.0.0-alpha-8-windowsx86-64debug.zip",
        sha256 = "f93195ec18d706d233b005a3c7896cc3e0a9562b7284ae5f820410b198a03b97",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-8/ntcore-cpp-2027.0.0-alpha-8-windowsarm64debug.zip",
        sha256 = "370afb28de11e75b0469ad451ea10112515beca45ebb7cb32031556e875d5b15",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-8/ntcore-cpp-2027.0.0-alpha-8-linuxarm64staticdebug.zip",
        sha256 = "fe78616ae632a8f22709d019c3e2b48496f14f42bedc9a103aadd2df81623096",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-8/ntcore-cpp-2027.0.0-alpha-8-linuxx86-64staticdebug.zip",
        sha256 = "faac4b02d73df58f8e3404441153bed2a46de9089090b353a38048bd6ecfb041",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-8/ntcore-cpp-2027.0.0-alpha-8-osxuniversalstaticdebug.zip",
        sha256 = "7c22bb2aa5a5a7cf4667c9bb79385d59cc7832e035dab5f177c4199e4e823334",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-8/ntcore-cpp-2027.0.0-alpha-8-windowsx86-64staticdebug.zip",
        sha256 = "8de2dd1168f01c4ac3b5fe1d466ebf9dd6e01d37e1f4d9c666d3042feadb933f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-8/ntcore-cpp-2027.0.0-alpha-8-windowsarm64staticdebug.zip",
        sha256 = "4e914d9f31f18e5348f3d1d5e533fe648c651ac197d6c3a4de0eec81f3fe2b86",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-8/ntcore-cpp-2027.0.0-alpha-8-linuxsystemcore.zip",
        sha256 = "ee6b17c785cceea75026ba0f437b9f2471e5c6df670742bb0b5add2885e02ca7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-8/ntcore-cpp-2027.0.0-alpha-8-linuxsystemcorestatic.zip",
        sha256 = "177c3814b5eb48f70a3acbb32bd2ad18a168d9a1e2794c7317b17e4e84e1b416",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-8/ntcore-cpp-2027.0.0-alpha-8-linuxsystemcoredebug.zip",
        sha256 = "b1828189ceb8819ebdeb21e896942f906476a96f28c32e716c1b1be4c29b5374",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-8/ntcore-cpp-2027.0.0-alpha-8-linuxsystemcorestaticdebug.zip",
        sha256 = "aa47f85a2ed654234c7592fe198984f12cd2165e2deaa3ab407b67e00e570926",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-8/hal-cpp-2027.0.0-alpha-8-headers.zip",
        sha256 = "c274de2e1dded6b518fbe66f68c234bd8d889c3e5f283cf185d2f6797289066e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-8/hal-cpp-2027.0.0-alpha-8-sources.zip",
        sha256 = "c4639a77a18f36e975c2cabf23310dc9e8ae37798f07bc119bd93fbb6103094f",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-8/hal-cpp-2027.0.0-alpha-8-linuxarm64.zip",
        sha256 = "30538acdf074cce1670c61b2ac0e41153fc6fd8a10840f9b36888594ff4a0f04",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-8/hal-cpp-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "1c48f6fdde57e895aadc387237d61076d4931ee8ecfd668f599d7668e2bae2a0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-8/hal-cpp-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "b44dffe1d7818138c9666a22408f5df9e176c19fdfe5d7ade52998cffbf05bc4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-8/hal-cpp-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "949d2401f4faed52b74d7e07427f24a0eb9838eead7a156014a0289e5f2fa6b2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-8/hal-cpp-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "e968fb99c5382096c4377ca1a0259197f0e15ae5da26860e8939955e05c148c7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-8/hal-cpp-2027.0.0-alpha-8-linuxarm64static.zip",
        sha256 = "ccb37bfb88baf4471c9b720130d024a4c22b1ac256f468c5fc5b1888b5f0f2f2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-8/hal-cpp-2027.0.0-alpha-8-linuxx86-64static.zip",
        sha256 = "601c6f90f33b46922930e4bbcea4266e10d901665d41c6d87bbebc405523d8f9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-8/hal-cpp-2027.0.0-alpha-8-osxuniversalstatic.zip",
        sha256 = "73a0cd383ff5c503882f5c2ef6823f00583d3cc92be41fa2a938ad2eeea01e28",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-8/hal-cpp-2027.0.0-alpha-8-windowsx86-64static.zip",
        sha256 = "b307695de9867e7f85520daac6bb4b4737001d1b20285db6cb82673cafd75769",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-8/hal-cpp-2027.0.0-alpha-8-windowsarm64static.zip",
        sha256 = "dc53a086391f2f39f6d811020129609e2bb1be5ada1ae431c4e55ed224b88717",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-8/hal-cpp-2027.0.0-alpha-8-linuxarm64debug.zip",
        sha256 = "705d1753796a454f9eb575231847bedfbf9ceb95009e7ac62b2eb4221e19f2b6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-8/hal-cpp-2027.0.0-alpha-8-linuxx86-64debug.zip",
        sha256 = "cca4da065c5840e36bf87eed85ac2894415e7a2a9bfd4153e548ddfd0ed50a07",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-8/hal-cpp-2027.0.0-alpha-8-osxuniversaldebug.zip",
        sha256 = "3397133ef2bf5d9ecc0d2cec40efa6a66484f4dff5006ce8146c0c4beebd5f27",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-8/hal-cpp-2027.0.0-alpha-8-windowsx86-64debug.zip",
        sha256 = "185e3eca0b427d6d440818abe0f57a9e4086648905577ac3738788247756028a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-8/hal-cpp-2027.0.0-alpha-8-windowsarm64debug.zip",
        sha256 = "b1fce404dc2988408777b37bc6f98af6a622ccdc79da92a182278287a93950e6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-8/hal-cpp-2027.0.0-alpha-8-linuxarm64staticdebug.zip",
        sha256 = "60e4ee015af0123dd12c3dd75933d11ed4162cb34f50e191b699e069c193ebb4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-8/hal-cpp-2027.0.0-alpha-8-linuxx86-64staticdebug.zip",
        sha256 = "76d70d891144c0e082adb4c3fd2cf71dd77114733d7ad52e8ded55c37886603d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-8/hal-cpp-2027.0.0-alpha-8-osxuniversalstaticdebug.zip",
        sha256 = "53c1ad839fca4b586bce93529c2e0d9a90bcf84bb21bdf0b1c0dbb3a37a4409c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-8/hal-cpp-2027.0.0-alpha-8-windowsx86-64staticdebug.zip",
        sha256 = "733ebaeea45cd96b0a16cb10938698f132aa7537dee1db67a4f8b6df0461b015",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-8/hal-cpp-2027.0.0-alpha-8-windowsarm64staticdebug.zip",
        sha256 = "18db8dd544b4ff9e464a6f4d59d4452711047ecfe39e5a53d097c1ed3444c750",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-8/hal-cpp-2027.0.0-alpha-8-linuxsystemcore.zip",
        sha256 = "83212738741975c251e75107990fd123ff4aee488e40bfa3137de0da19869f93",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-8/hal-cpp-2027.0.0-alpha-8-linuxsystemcorestatic.zip",
        sha256 = "8f68ccaf87d7127c374c51355366f0f384eb339a91130d998422d69e05b6af5a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-8/hal-cpp-2027.0.0-alpha-8-linuxsystemcoredebug.zip",
        sha256 = "9a1416de2b3172967e54a3114ebaf212faba13fbcbcfc18b5bd0f3a56fc89eb6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-8/hal-cpp-2027.0.0-alpha-8-linuxsystemcorestaticdebug.zip",
        sha256 = "a84f9b7b04952d94cd93c4779a960abd8eb5f75c7f54883ec8de37fab14f6954",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-8/cscore-cpp-2027.0.0-alpha-8-headers.zip",
        sha256 = "42dfa2dbbb40e91cc7954442a7de05c76034468f4b08c5ddb7c1afa9a8c78470",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-8/cscore-cpp-2027.0.0-alpha-8-sources.zip",
        sha256 = "76f8a59d5c1b4fb77532c8dc0075f1a664026beb67297aaa360b8ae9e2ccc88a",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-8/cscore-cpp-2027.0.0-alpha-8-linuxarm64.zip",
        sha256 = "84b4e1be83156aa83c739f52561d102782ca33b42a0b50ae150f7d011cf35861",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-8/cscore-cpp-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "009560edbd650f049316a26672cf9482d71228a9459f924b17767416eed3a803",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-8/cscore-cpp-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "feab0473e5b604182521574b8f3db8d4964890a0ff0669c864d7d7d6046159d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libcscore.dylib osx/universal/shared/libcscore.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcscore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcscore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-8/cscore-cpp-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "cf13bd190ac8f05db55d41d9e113889f385ce84d7a9a4411e3eceea0908a0dd7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-8/cscore-cpp-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "a31c8fbb42fdd81f35b71c0591b8564f5a73f63e93322649c7cfe5184448e617",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-8/cscore-cpp-2027.0.0-alpha-8-linuxarm64static.zip",
        sha256 = "7a58da11ddf1016c2c380231f36aa6c6671d7845c06a121b350f66d588ad237e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-8/cscore-cpp-2027.0.0-alpha-8-linuxx86-64static.zip",
        sha256 = "d714d9eea2d2c89c0c2057c66c3b2bcf3efb1f5892a8611e9cadfd4aee2c98cf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-8/cscore-cpp-2027.0.0-alpha-8-osxuniversalstatic.zip",
        sha256 = "f07d51e2f764c0b58ce61fa092116d7211da33f601934b9a75e319b8f280c85a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-8/cscore-cpp-2027.0.0-alpha-8-windowsx86-64static.zip",
        sha256 = "818925558339b02b0034fff992daababb0b24bf12f34efef9440b91c455502b3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-8/cscore-cpp-2027.0.0-alpha-8-windowsarm64static.zip",
        sha256 = "c71707abd7f4badb3ca97b01f76cc1e8fd944428ec7aedaf115b5b717aa3dc91",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-8/cscore-cpp-2027.0.0-alpha-8-linuxarm64debug.zip",
        sha256 = "28a6609a517ae1d20eac21e57f05943849e508d908e74422dd49a3df73bc5da9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-8/cscore-cpp-2027.0.0-alpha-8-linuxx86-64debug.zip",
        sha256 = "3ec9f4142649ca43be5b8c23b1f86f6685ab678edc085147f05ee7dcb0cbb56e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-8/cscore-cpp-2027.0.0-alpha-8-osxuniversaldebug.zip",
        sha256 = "c4c39888939918ae7ac6f2f62010f91cb2a3ce9813599bc098fc249ea9c3da48",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libcscore.dylib osx/universal/shared/libcscore.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcscore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcscore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-8/cscore-cpp-2027.0.0-alpha-8-windowsx86-64debug.zip",
        sha256 = "fe8487af8fb9275e9ef1e8b942a94f224313670d146be38c26f6f93a3dc08010",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-8/cscore-cpp-2027.0.0-alpha-8-windowsarm64debug.zip",
        sha256 = "2fb2538fbce14be051a7e782cafdc7f6da62c3bfa7e742425399732f2818c76f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-8/cscore-cpp-2027.0.0-alpha-8-linuxarm64staticdebug.zip",
        sha256 = "4a3e52f36823de0618ae63aa65c025ef403999686a3b98b63897fd21ac77d192",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-8/cscore-cpp-2027.0.0-alpha-8-linuxx86-64staticdebug.zip",
        sha256 = "787552624958b83099e868eec26fd187821c56056fa9e8e52ef0350c249e22be",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-8/cscore-cpp-2027.0.0-alpha-8-osxuniversalstaticdebug.zip",
        sha256 = "86375741fc44323bce336975731b571cee9e35eb959fa9618a9e517be70a7b53",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-8/cscore-cpp-2027.0.0-alpha-8-windowsx86-64staticdebug.zip",
        sha256 = "943db4f801da845134da4ff75598d815c1d172439ff69fae3401bd51dc71c5a7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-8/cscore-cpp-2027.0.0-alpha-8-windowsarm64staticdebug.zip",
        sha256 = "c01169a7b96034dedf49c66904460650cd345bc5a8a4741e87be33acf541e1dc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-8/cscore-cpp-2027.0.0-alpha-8-linuxsystemcore.zip",
        sha256 = "e2ad9c562797585af9af78a7d7bbd856bcd2546429be8c02b7fd8eaa8ff6f514",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-8/cscore-cpp-2027.0.0-alpha-8-linuxsystemcorestatic.zip",
        sha256 = "56844d84543fffec68c69802aa6a7cc79e5dca6b78e77fb0d27ae42f9453d608",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-8/cscore-cpp-2027.0.0-alpha-8-linuxsystemcoredebug.zip",
        sha256 = "a11697ff38ff7d5b67d7b2a44d443f4592f37f6ddd4c1104623c0d432606133c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-8/cscore-cpp-2027.0.0-alpha-8-linuxsystemcorestaticdebug.zip",
        sha256 = "2b0eff32288859ee9bb0d9fa9d21504c5b363fce521959fa9357dc3f5a2050b2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-8/wpilibc-cpp-2027.0.0-alpha-8-headers.zip",
        sha256 = "fe71afe131304963a50fbcb595147f9f45511ae9a87b009ed7fafd8d008ce59c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-8/wpilibc-cpp-2027.0.0-alpha-8-sources.zip",
        sha256 = "9f479616dbd67f4db7ced281fe5b9f713ea2ec722519a64479c3c1570dbcb50f",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-8/wpilibc-cpp-2027.0.0-alpha-8-linuxarm64.zip",
        sha256 = "8db81cb9770ce996d959bf7ffbf286878a4a8254ffe70be93c7f809d8ee0d109",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-8/wpilibc-cpp-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "402ff7069003469df4d0a02ec5e3bb54c078e65f0fd67442bcd834bbc546471e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-8/wpilibc-cpp-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "8c58318fb80059f0b505d1d667552d69a243853272c2f59142eb6566fc728f6e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpilibc.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libtelemetry.dylib @rpath/libtelemetry.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libtunables.dylib @rpath/libtunables.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpilibc.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-8/wpilibc-cpp-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "a9f3d3bd38171755da36a5a3e3e9b016316692f0506b4101e829190c03f1d0d2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-8/wpilibc-cpp-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "0095a7c14dc0c3e3c8e231dab23cdab7390c3ef0be6f4e615e782b6188e1227e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-8/wpilibc-cpp-2027.0.0-alpha-8-linuxarm64static.zip",
        sha256 = "3b35d831f9256d7c19af83bca9467d3dcf0e48a95377259d67a636967b9f7e20",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-8/wpilibc-cpp-2027.0.0-alpha-8-linuxx86-64static.zip",
        sha256 = "1d81cf5654562ac5aa0d69712f9883ff8b90c64b7fa94fa08890264c4443fb81",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-8/wpilibc-cpp-2027.0.0-alpha-8-osxuniversalstatic.zip",
        sha256 = "c9fefe2553cc8222e484f742445ca62bd43f8472b1d35fe23cdb5a392363f2ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-8/wpilibc-cpp-2027.0.0-alpha-8-windowsx86-64static.zip",
        sha256 = "2c544e039578ba26723d6bf372e8210d8669c179f54df225518d1a90b5a50547",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-8/wpilibc-cpp-2027.0.0-alpha-8-windowsarm64static.zip",
        sha256 = "684083cef5e7cfd180590fb417eabcbaa4c7c659c14c3cb9a30172edc9658091",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-8/wpilibc-cpp-2027.0.0-alpha-8-linuxarm64debug.zip",
        sha256 = "a648df43c207022376810dd92cba147c37c5cf4df7831a65965cc96de4aac511",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-8/wpilibc-cpp-2027.0.0-alpha-8-linuxx86-64debug.zip",
        sha256 = "0827b58adb4f6e8fe158d0c217455aeeaf0290e5ae1ab0c8f52f5aa8a72fc5ec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-8/wpilibc-cpp-2027.0.0-alpha-8-osxuniversaldebug.zip",
        sha256 = "1f79bf02f66947e2d9b1b3ee23672dace81921b505e76ccae772a6e5e5ee4c3c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpilibc.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libtelemetry.dylib @rpath/libtelemetry.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libtunables.dylib @rpath/libtunables.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpilibc.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-8/wpilibc-cpp-2027.0.0-alpha-8-windowsx86-64debug.zip",
        sha256 = "86e9421f84668f2c0a26ef20a65295ee2a1418d196fc0f6949cedc429d2865af",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-8/wpilibc-cpp-2027.0.0-alpha-8-windowsarm64debug.zip",
        sha256 = "7e49aae741765dff8214964ddf4ba9db9179a64c09b8f2f06015ac89e1af4c53",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-8/wpilibc-cpp-2027.0.0-alpha-8-linuxarm64staticdebug.zip",
        sha256 = "b1b5e2aade1b07229a53bb6d55ae050082ed663dadfd772f4d3fce9caa0aebe1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-8/wpilibc-cpp-2027.0.0-alpha-8-linuxx86-64staticdebug.zip",
        sha256 = "e80be48e53d462c259eb7ef113e8b781ee2bebe1f13a7be089c07de93ac978f6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-8/wpilibc-cpp-2027.0.0-alpha-8-osxuniversalstaticdebug.zip",
        sha256 = "21015503335148f7c5dfe4b572c1d4df65d081d7b65a8395a93e7d2169471d0b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-8/wpilibc-cpp-2027.0.0-alpha-8-windowsx86-64staticdebug.zip",
        sha256 = "8d8fa38a64d871d294d3ffa0c359ec918c128f2401130d852cea569e5a1be395",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-8/wpilibc-cpp-2027.0.0-alpha-8-windowsarm64staticdebug.zip",
        sha256 = "8029845640c16748bfcf46b62a6f23ef44938ddb88e62a5c79c143fef07712b7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-8/wpilibc-cpp-2027.0.0-alpha-8-linuxsystemcore.zip",
        sha256 = "23bcaec7c348d7660a1f0b491909030fbfd4dc274ced1fcc0573c5f7f3c7d3cc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-8/wpilibc-cpp-2027.0.0-alpha-8-linuxsystemcorestatic.zip",
        sha256 = "1d7a3bbe446139c1d674e94e920a1aa71ac9228068eaeb48d10372926ff71166",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-8/wpilibc-cpp-2027.0.0-alpha-8-linuxsystemcoredebug.zip",
        sha256 = "992dd7dc49ce00cae8ae4a277f99ae5cc22f143243c0a7fa0dc9c4afb0e4106e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-8/wpilibc-cpp-2027.0.0-alpha-8-linuxsystemcorestaticdebug.zip",
        sha256 = "ca6b3921831401927abc50b65c5dc5bb12269e7ff01ac14e43e1085720b2aadb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-8/cameraserver-cpp-2027.0.0-alpha-8-headers.zip",
        sha256 = "cf2ff5c2587c69135b1430d95cb0457c683a28b528e2bd24c072113e3414865d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-8/cameraserver-cpp-2027.0.0-alpha-8-sources.zip",
        sha256 = "2aa97b610d8e6dc9ef8a5cfdde3abf38cb0d4484747e78dbe2400ea977c243fa",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-8/cameraserver-cpp-2027.0.0-alpha-8-linuxarm64.zip",
        sha256 = "4dc43bd43cb290c97bfa5f53c80eea3fe99ad8926280fc01497815bcb3a45084",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-8/cameraserver-cpp-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "2bfdc44dcbaa7a7bf9bc26e1083d8cd2b3e32e040f0fc67a71e2d29430367e5a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-8/cameraserver-cpp-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "92a7d68ba0f2e544b5794630017e49b01b2e0cc7696836b5d3f4216f731b16ce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libcameraserver.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libtelemetry.dylib @rpath/libtelemetry.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libtunables.dylib @rpath/libtunables.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libwpilibc.dylib @rpath/libwpilibc.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcameraserver.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-8/cameraserver-cpp-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "b74ed82ac8df85e28abc2a582376128752d9657cff86a3588186708d49a69030",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-8/cameraserver-cpp-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "19f9694ab5e4023353a385e881dbd990fb3c3d72948a8bb2b0658a2f36a2f6e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-8/cameraserver-cpp-2027.0.0-alpha-8-linuxarm64static.zip",
        sha256 = "12d434f10ff1a2c5cbbe9be3fe1dec163bf94e8f082ae0a300257facb6d75396",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-8/cameraserver-cpp-2027.0.0-alpha-8-linuxx86-64static.zip",
        sha256 = "d0190fe4cb39cace7dfefcc5682bb96765dccbbe4314cd8b9f94cdeed6c74116",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-8/cameraserver-cpp-2027.0.0-alpha-8-osxuniversalstatic.zip",
        sha256 = "b3c9697ae663d3081812f7b18758589c112aadc0deec5b91d90f7e039888511d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-8/cameraserver-cpp-2027.0.0-alpha-8-windowsx86-64static.zip",
        sha256 = "9b3ea098629704d1781ad3769df61d6396a691ba78c0e5cf8d56ff94e8ec1624",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-8/cameraserver-cpp-2027.0.0-alpha-8-windowsarm64static.zip",
        sha256 = "bf85c82f57ec810799f73633b26d55aef11dbe0b9aea50660d0e7805b031d629",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-8/cameraserver-cpp-2027.0.0-alpha-8-linuxarm64debug.zip",
        sha256 = "18eb32d455c05cd461f364c75b843a18c4307f2c4ddf1d9b40ffe6294eab7ac1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-8/cameraserver-cpp-2027.0.0-alpha-8-linuxx86-64debug.zip",
        sha256 = "298700c9f26ed74cfd173f243c3faa1108d2e327c5c8b14ddb5e022865c625c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-8/cameraserver-cpp-2027.0.0-alpha-8-osxuniversaldebug.zip",
        sha256 = "d13c6175e7cd362f8ecd4b067d1948c14f9f7dd82c311d7e424c7893e061e37b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libcameraserver.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libtelemetry.dylib @rpath/libtelemetry.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libtunables.dylib @rpath/libtunables.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libwpilibc.dylib @rpath/libwpilibc.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcameraserver.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-8/cameraserver-cpp-2027.0.0-alpha-8-windowsx86-64debug.zip",
        sha256 = "99e1315b20567fd43da26c38990ec66b2f9ec054fae07859b967fe7a7c179bc3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-8/cameraserver-cpp-2027.0.0-alpha-8-windowsarm64debug.zip",
        sha256 = "6249c1c8cac302c3371ce548ef3186deff28e06bc26983414ff94e7f47f155d5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-8/cameraserver-cpp-2027.0.0-alpha-8-linuxarm64staticdebug.zip",
        sha256 = "0c7446b1604c68213ea0a0224851c2ee35e012c8091113e77d9513030abf1321",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-8/cameraserver-cpp-2027.0.0-alpha-8-linuxx86-64staticdebug.zip",
        sha256 = "06b9c3688bb86c037c84d4c204851ab040ce1ba074a0673965aa3922962c120c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-8/cameraserver-cpp-2027.0.0-alpha-8-osxuniversalstaticdebug.zip",
        sha256 = "7ae77b14dc37c43cb0c987de0ec237910c0e618975aafa1543e983235216729c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-8/cameraserver-cpp-2027.0.0-alpha-8-windowsx86-64staticdebug.zip",
        sha256 = "49d7ecf0a6142668e58ad607d6bd4df50bca9da01a114ea993f3f0cc6a6acba6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-8/cameraserver-cpp-2027.0.0-alpha-8-windowsarm64staticdebug.zip",
        sha256 = "bd903b901fe750b0725511b0443835b2c11348c74eb16bfbbea6206f45b41553",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-8/cameraserver-cpp-2027.0.0-alpha-8-linuxsystemcore.zip",
        sha256 = "9549f594a95f37c71cc232fb2298f5fc895665e4f9b127f17dc5dc501ccb7799",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-8/cameraserver-cpp-2027.0.0-alpha-8-linuxsystemcorestatic.zip",
        sha256 = "699a3bc9fca403e4937031c30f5d2ec2c0c767d5f74640e48956592d148ce336",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-8/cameraserver-cpp-2027.0.0-alpha-8-linuxsystemcoredebug.zip",
        sha256 = "c23a7e98871b6dbab29e6ccdd2c4670b273b1779e6e1f81f7b26ebfd7985849a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-8/cameraserver-cpp-2027.0.0-alpha-8-linuxsystemcorestaticdebug.zip",
        sha256 = "f41de48751a1ae974a7c4a1f42bf530505147c1438e96c56fd481ad57b5a6807",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-8/drivers-cpp-2027.0.0-alpha-8-headers.zip",
        sha256 = "3b043572a8488b0e7f96570894a7ec49f4472c7284c189a03937910bc9ddc44c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-8/drivers-cpp-2027.0.0-alpha-8-sources.zip",
        sha256 = "0c903a0e0f851051c7f32f2880a5f4c960f7e98e06636ebbd21b4f54a8bfc8a4",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-8/drivers-cpp-2027.0.0-alpha-8-linuxarm64.zip",
        sha256 = "3c0aec78a6c4c8808ace2e6722c80757d9730ed5e1f810e01d5354579b988b05",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-8/drivers-cpp-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "a657bc42eeaeff61b555981a70e50623dccdd7a9b75df7a610c8c51aac0519f0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-8/drivers-cpp-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "1373e5c075456ba9df79c98657abbb5bfb92d3a47609672f56bcfefbb2edc045",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libdrivers.dylib osx/universal/shared/libdrivers.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libdrivers.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libdrivers.dylib",
            "install_name_tool -change libtelemetry.dylib @rpath/libtelemetry.dylib osx/universal/shared/libdrivers.dylib",
            "install_name_tool -change libtunables.dylib @rpath/libtunables.dylib osx/universal/shared/libdrivers.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libdrivers.dylib",
            "install_name_tool -change libwpilibc.dylib @rpath/libwpilibc.dylib osx/universal/shared/libdrivers.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libdrivers.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libdrivers.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libdrivers.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-8/drivers-cpp-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "f474367646c651f5928a09efdbd64e1801a2974c810374e6213c69c8313e0e23",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-8/drivers-cpp-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "97518f2bd30f83e09d93ae7ff9cfb3710b227588d3432e2be10d3beac932a072",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-8/drivers-cpp-2027.0.0-alpha-8-linuxarm64static.zip",
        sha256 = "3b494155cb89563106709115712659b2d715d588f7798ffd403ff2eeb9d71d04",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-8/drivers-cpp-2027.0.0-alpha-8-linuxx86-64static.zip",
        sha256 = "dcf026f8731f4f50448709265e6de5824b2d2316d936449ab9a96a51d324c49a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-8/drivers-cpp-2027.0.0-alpha-8-osxuniversalstatic.zip",
        sha256 = "fabd6c5e64336c82e68d81c9155e3ad756ebe47d8d0dfd450959cc8fc1e494e5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-8/drivers-cpp-2027.0.0-alpha-8-windowsx86-64static.zip",
        sha256 = "13a61e6a3133bec4cf49e48a9c901fda9a5013246fa2e231e086d41314da7000",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-8/drivers-cpp-2027.0.0-alpha-8-windowsarm64static.zip",
        sha256 = "574073bc77005c7a5b01dca941c26c6a09c809460b4210b4bbb8943797a7a6ce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-8/drivers-cpp-2027.0.0-alpha-8-linuxarm64debug.zip",
        sha256 = "39fe5354468dd5c2d27ff47d275a5448f6b45b252e195c18e8e91e2812418ff7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-8/drivers-cpp-2027.0.0-alpha-8-linuxx86-64debug.zip",
        sha256 = "2dacf63a1e16497f4e4148d7bebba32799655710aca59154d5197dcce85a0a18",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-8/drivers-cpp-2027.0.0-alpha-8-osxuniversaldebug.zip",
        sha256 = "60d6ab863b30fbca697775665c33cb884dc96e78c70c04b14b3169a164161fd5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libdrivers.dylib osx/universal/shared/libdrivers.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libdrivers.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libdrivers.dylib",
            "install_name_tool -change libtelemetry.dylib @rpath/libtelemetry.dylib osx/universal/shared/libdrivers.dylib",
            "install_name_tool -change libtunables.dylib @rpath/libtunables.dylib osx/universal/shared/libdrivers.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libdrivers.dylib",
            "install_name_tool -change libwpilibc.dylib @rpath/libwpilibc.dylib osx/universal/shared/libdrivers.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libdrivers.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libdrivers.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libdrivers.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-8/drivers-cpp-2027.0.0-alpha-8-windowsx86-64debug.zip",
        sha256 = "9e34e57aa298a801b9bb967fddf5712fe257134092b39772dd51c3ff609563a4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-8/drivers-cpp-2027.0.0-alpha-8-windowsarm64debug.zip",
        sha256 = "d490483deeeb049f99cb23b1ffa1f5cd4e61320b7e862a16e3c0ed136c400c3e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-8/drivers-cpp-2027.0.0-alpha-8-linuxarm64staticdebug.zip",
        sha256 = "2b6ebc8300978d9fa5363689911e421640d677e3773c4a824832ab716dfd916c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-8/drivers-cpp-2027.0.0-alpha-8-linuxx86-64staticdebug.zip",
        sha256 = "eceaeb1b3bad071e4f6e53c667d0323a20e3a769cfb5b7f5f434e02ff1cd6f06",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-8/drivers-cpp-2027.0.0-alpha-8-osxuniversalstaticdebug.zip",
        sha256 = "9d0ae505fa9fce17e32496bae9fe7fdef86b7d6e4c93c3c011c286e6fed074ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-8/drivers-cpp-2027.0.0-alpha-8-windowsx86-64staticdebug.zip",
        sha256 = "cdcecefe1bbc1ba8e8d2e4f26b70d96afe4c9e92bd05469005908a01d34e8dbf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-8/drivers-cpp-2027.0.0-alpha-8-windowsarm64staticdebug.zip",
        sha256 = "6a042293a532f17a5a020f73b6165dc07513d988785f9cc08a7a63a532397d9a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-8/drivers-cpp-2027.0.0-alpha-8-linuxsystemcore.zip",
        sha256 = "efe2102f06db95e93db7d8ae74c57705dac76b9432b5d65f91eef4c14266b56d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-8/drivers-cpp-2027.0.0-alpha-8-linuxsystemcorestatic.zip",
        sha256 = "3e2f6bf7a6a2d7f477c8bd7ec9f197741342b1810ba389c6d934b8effd8b1a8c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-8/drivers-cpp-2027.0.0-alpha-8-linuxsystemcoredebug.zip",
        sha256 = "93b65633d216d1330ed3e6c7c5a554774f2baf80affcb393897d9f2763f785da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-8/drivers-cpp-2027.0.0-alpha-8-linuxsystemcorestaticdebug.zip",
        sha256 = "612db8709cbb31c3478f1e7a1802f04eaa2554a74e0589d9a351e7c8e879d5c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-8/commandsv2-cpp-2027.0.0-alpha-8-headers.zip",
        sha256 = "61d5c409ad44d9851552d97639ca92d3849fb103f6a03bf4d0dc233f5fb92a19",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-8/commandsv2-cpp-2027.0.0-alpha-8-sources.zip",
        sha256 = "2a07c11ff04cc9b2643b80017e10e9eef8ed1112e78d9b3bfb223df1fc6fc216",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-8/commandsv2-cpp-2027.0.0-alpha-8-linuxarm64.zip",
        sha256 = "731af75b2579285a315760b2f94601892b28471095decd8560c14cab95fc886d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-8/commandsv2-cpp-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "e022b0cbe8d91fa5385d12d6915cc3b11f30aae496f29d6612428815dbd403d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-8/commandsv2-cpp-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "96872f007db3f44acc48fea5063cad09b4b74756bc50467412712a6a847fa1e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libcommandsv2.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libcameraserver.dylib @rpath/libcameraserver.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libtelemetry.dylib @rpath/libtelemetry.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libtunables.dylib @rpath/libtunables.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libwpilibc.dylib @rpath/libwpilibc.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcommandsv2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-8/commandsv2-cpp-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "c12b823febe160593ea884f2902105c71503730a071787ef20fa3ca245eb2a19",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-8/commandsv2-cpp-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "4810f79b990aaca5c9c066df3f62945c38e8268397ae46c0164f8eea38624e64",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-8/commandsv2-cpp-2027.0.0-alpha-8-linuxarm64static.zip",
        sha256 = "008a6c3ede9daec49f847b37f5dd7044abea31b02f0ad7dc9a0029773f1d7c02",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-8/commandsv2-cpp-2027.0.0-alpha-8-linuxx86-64static.zip",
        sha256 = "08a0313922f3f11a9e5d0ad9c8507c80f9579258e9eaa988ffa0cbdd3d490873",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-8/commandsv2-cpp-2027.0.0-alpha-8-osxuniversalstatic.zip",
        sha256 = "5489692247cde5d957cf14895c3b4c6f845771ce8c83f28d0146096f86713c51",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-8/commandsv2-cpp-2027.0.0-alpha-8-windowsx86-64static.zip",
        sha256 = "ff2d64dba638023247f517493219969807bd553d476b2dc63b41ff718443b23f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-8/commandsv2-cpp-2027.0.0-alpha-8-windowsarm64static.zip",
        sha256 = "f4ba0b7d6e5a21e926e6149b83743ae4245a76a641416266f27e0f7e37751175",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-8/commandsv2-cpp-2027.0.0-alpha-8-linuxarm64debug.zip",
        sha256 = "48daa112d869c90d0117c525c450ae3552dd73f4c65987c67eeff25a43ef9a28",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-8/commandsv2-cpp-2027.0.0-alpha-8-linuxx86-64debug.zip",
        sha256 = "a79577d83bd1beba29b52b77ffb3c238d85683bfc0ddc27a5bca0d6b02476061",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-8/commandsv2-cpp-2027.0.0-alpha-8-osxuniversaldebug.zip",
        sha256 = "02ffbe1d43f8c2bb5daaaa077b44398818b9b45082bace4d95d98fe09373ad75",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libcommandsv2.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libcameraserver.dylib @rpath/libcameraserver.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libtelemetry.dylib @rpath/libtelemetry.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libtunables.dylib @rpath/libtunables.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libwpilibc.dylib @rpath/libwpilibc.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcommandsv2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-8/commandsv2-cpp-2027.0.0-alpha-8-windowsx86-64debug.zip",
        sha256 = "a6819326003f62a4357b50acbf80d8fbb2ace512e41911157e79e4fc3fbc692a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-8/commandsv2-cpp-2027.0.0-alpha-8-windowsarm64debug.zip",
        sha256 = "6e05467882b9b34cd7291ebaada6c793a5fc3e71de4b86bb3fabc707668eeef1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-8/commandsv2-cpp-2027.0.0-alpha-8-linuxarm64staticdebug.zip",
        sha256 = "383c49e6036d00c1d353d97473b13a1a6dab3ffdad8c649d0aa8ac00d0455225",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-8/commandsv2-cpp-2027.0.0-alpha-8-linuxx86-64staticdebug.zip",
        sha256 = "4c4c39502a74689f9d6483078fee43845ff84deb52f10caaf6e307610fc90fde",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-8/commandsv2-cpp-2027.0.0-alpha-8-osxuniversalstaticdebug.zip",
        sha256 = "353bfe25ae5246c60f118ade5ff195b18ffcd4ba397f0e36349845e7cb4a0375",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-8/commandsv2-cpp-2027.0.0-alpha-8-windowsx86-64staticdebug.zip",
        sha256 = "63bccf3d68087b3b28b4cde375e0fad27fea3b6a8edab3a06103f6eea394d13e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-8/commandsv2-cpp-2027.0.0-alpha-8-windowsarm64staticdebug.zip",
        sha256 = "ff8cb6c1b6c8ac736e422b65900695796aa3cbf347635170658613e33d1a8bb9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-8/commandsv2-cpp-2027.0.0-alpha-8-linuxsystemcore.zip",
        sha256 = "c0e7e1d472ee41a5d169aa02bad9820674cc3839b0d7a218c49a8dfca13d8c54",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-8/commandsv2-cpp-2027.0.0-alpha-8-linuxsystemcorestatic.zip",
        sha256 = "1797ee4aa6dda3fea08f126d3465159549ec604d4dedc1ee75ae989afd04158f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-8/commandsv2-cpp-2027.0.0-alpha-8-linuxsystemcoredebug.zip",
        sha256 = "b67b25c1f3994a3ec7c3ed181b6d1d300dba06604bb59ec21263804cae1be68e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-8/commandsv2-cpp-2027.0.0-alpha-8-linuxsystemcorestaticdebug.zip",
        sha256 = "41e92f19eba61ac96358d92ebaaf953e904da8625cfdeb170b5401fcdca780ce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-8/romiVendordep-cpp-2027.0.0-alpha-8-headers.zip",
        sha256 = "b02123f3deb075e3c369ed4b8f34e42bbbd4b49c70afd5b1de24fa90af118109",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-8/romiVendordep-cpp-2027.0.0-alpha-8-sources.zip",
        sha256 = "d8914ef2f92dd5619cda5d96f87631a45a93468f4499792d0571d75b97fc8fd8",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-8/romiVendordep-cpp-2027.0.0-alpha-8-linuxarm64.zip",
        sha256 = "811aa42fa16a27d702324d1438252056fdb505082aebe385779592860b0c8815",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-8/romiVendordep-cpp-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "a69cf20ef69701c47926cf87a81c55d9556d60878e925569a686ca882e8ef4fe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-8/romiVendordep-cpp-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "758c1e9346f76e304e398357feab5186b4d6bfc50e75f84b7814f3d4be2ff85b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libromiVendordep.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libtelemetry.dylib @rpath/libtelemetry.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libtunables.dylib @rpath/libtunables.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libwpilibc.dylib @rpath/libwpilibc.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libromiVendordep.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-8/romiVendordep-cpp-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "0790362558cc340d07e0b77e8de827d6f747089b1c845ce414dab514a9407c43",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-8/romiVendordep-cpp-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "d04df8a4912d05207b3b8ecc1538310a5a0f812923d69a47b29ccac7222aba85",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-8/romiVendordep-cpp-2027.0.0-alpha-8-linuxarm64static.zip",
        sha256 = "6f31b72aa3448e340e9dd0c5cc63c816b78fc57c484d7ed47bd64dc8925afa24",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-8/romiVendordep-cpp-2027.0.0-alpha-8-linuxx86-64static.zip",
        sha256 = "ebd685025ccc959053dacadb243e006e583722383f89f1e948cdd04d4ce6d96a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-8/romiVendordep-cpp-2027.0.0-alpha-8-osxuniversalstatic.zip",
        sha256 = "f8af763019830264dda63232c2b4a83f058309e4522f59b7e5b9a8ca4fa83a6c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-8/romiVendordep-cpp-2027.0.0-alpha-8-windowsx86-64static.zip",
        sha256 = "1c3e20bffe6cb1be94a7ba83c0fe5410c4eddaa5274c08c6c3d87f2dc779a520",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-8/romiVendordep-cpp-2027.0.0-alpha-8-windowsarm64static.zip",
        sha256 = "b7ea80967059f0f5ce198701649397d2a4e628939df1e52df4370c8174aa3b64",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-8/romiVendordep-cpp-2027.0.0-alpha-8-linuxarm64debug.zip",
        sha256 = "d535afff0605842c39e5805a837a7c364a9c8f909357a7e552cbaed213a80f92",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-8/romiVendordep-cpp-2027.0.0-alpha-8-linuxx86-64debug.zip",
        sha256 = "aceb10e81086957b0489c10810f7a0afbf053bf21882fdd93f6bf72ce3ac3ea5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-8/romiVendordep-cpp-2027.0.0-alpha-8-osxuniversaldebug.zip",
        sha256 = "2c596e3a2d836f246bfa43dcde2a34a3dfa278f1b72e5d8042f7c556a4b71a1b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libromiVendordep.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libtelemetry.dylib @rpath/libtelemetry.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libtunables.dylib @rpath/libtunables.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libwpilibc.dylib @rpath/libwpilibc.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libromiVendordep.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-8/romiVendordep-cpp-2027.0.0-alpha-8-windowsx86-64debug.zip",
        sha256 = "56f560f9f4c8948f722cd8beb59b608abb9a08471504e64c523b649f5fb9d397",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-8/romiVendordep-cpp-2027.0.0-alpha-8-windowsarm64debug.zip",
        sha256 = "145ef106986e98c93d6b1cc8947df55bc52ae34cb6b43970c5afc9ba08dfb390",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-8/romiVendordep-cpp-2027.0.0-alpha-8-linuxarm64staticdebug.zip",
        sha256 = "8c1aac87bcf126b70a87ac1d5bcb2bcedd412428626577f3f1ed0a4b557b35d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-8/romiVendordep-cpp-2027.0.0-alpha-8-linuxx86-64staticdebug.zip",
        sha256 = "9cf9fc80097752437e115feaf553b119b550c9758f17065c5200fbf60ba1c45b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-8/romiVendordep-cpp-2027.0.0-alpha-8-osxuniversalstaticdebug.zip",
        sha256 = "8b4c8220e8bee6b779cb70e721d5296547fa7e00ec6a085d2cda2f772dd382a9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-8/romiVendordep-cpp-2027.0.0-alpha-8-windowsx86-64staticdebug.zip",
        sha256 = "e79e9a3b5bbc9835d20c6cc0cfee576b7472e03b21137f3541ada9a1f1b2931f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-8/romiVendordep-cpp-2027.0.0-alpha-8-windowsarm64staticdebug.zip",
        sha256 = "eee0a051f5a5bf5a419a78845ed25c7bcd4cfff4d53ff2d24c14e500473d3384",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-8/romiVendordep-cpp-2027.0.0-alpha-8-linuxsystemcore.zip",
        sha256 = "15109b543fecfa4d9da095d4716ed597227d191ae57716aedd7f8bacfbe7cdc1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-8/romiVendordep-cpp-2027.0.0-alpha-8-linuxsystemcorestatic.zip",
        sha256 = "4a511f6a41624bc5004c607702d1416db331a5f9d0e87da227e008f960e06e6f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-8/romiVendordep-cpp-2027.0.0-alpha-8-linuxsystemcoredebug.zip",
        sha256 = "9bf5ed946d82a6df8ce754dbb5070274cdefa71e14919191d7e0aabfa868d7f4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-8/romiVendordep-cpp-2027.0.0-alpha-8-linuxsystemcorestaticdebug.zip",
        sha256 = "177adf2583190daf0c91d3dcff1d961a1185a760a4a3f1d0213e764d7db5207d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-8/xrpVendordep-cpp-2027.0.0-alpha-8-headers.zip",
        sha256 = "c830880158cc9968dfb6e856044bee88c8b797827d7a944a3fa409cc45ebaca4",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-8/xrpVendordep-cpp-2027.0.0-alpha-8-sources.zip",
        sha256 = "ca20657653d1ca7804bd8266beee4889158cf6813ecba7f6e84910a257740264",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-8/xrpVendordep-cpp-2027.0.0-alpha-8-linuxarm64.zip",
        sha256 = "85a1a628b93a41572e55a52e35c9aaafb2a58d5f5b739755b84a7f4febe52d80",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-8/xrpVendordep-cpp-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "d1b7e16f171fc000f6c6b89823bb73dac985e72865f4693b68d299e0949fb117",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-8/xrpVendordep-cpp-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "43393565691add4d40e9600db40c8ae4971653089feb9de0d390acc83ac4f16c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libxrpVendordep.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libtelemetry.dylib @rpath/libtelemetry.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libtunables.dylib @rpath/libtunables.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libwpilibc.dylib @rpath/libwpilibc.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libxrpVendordep.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-8/xrpVendordep-cpp-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "fec71b134bdd40aa1f67aeccf5d8610cf02d02044ce3289f20ad5e4e615e14e5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-8/xrpVendordep-cpp-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "7a14376ed36ec09736034f76719d349740ebc3adce5e5119ef3cf8744f14a796",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-8/xrpVendordep-cpp-2027.0.0-alpha-8-linuxarm64static.zip",
        sha256 = "adb162b4220906183e30d4ec9365c6e8c9b72c7f9e949db78c07e9dcf14e7110",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-8/xrpVendordep-cpp-2027.0.0-alpha-8-linuxx86-64static.zip",
        sha256 = "667cbafbb2dddaf122d086bb43b3dd5eaa311d08307e4e208244e0f55972c593",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-8/xrpVendordep-cpp-2027.0.0-alpha-8-osxuniversalstatic.zip",
        sha256 = "5cb9895ea6d0ca19eae27d47e4b661fced6550eea6811e94bb42a23ba53d65b8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-8/xrpVendordep-cpp-2027.0.0-alpha-8-windowsx86-64static.zip",
        sha256 = "63210e168d3f4e04a8d31df676daf20ada285768374784063771b5cc2385f552",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-8/xrpVendordep-cpp-2027.0.0-alpha-8-windowsarm64static.zip",
        sha256 = "c2b4b8656aaca0e2da0a1b748b007403916da7b93175d46e07037b205c51cac2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-8/xrpVendordep-cpp-2027.0.0-alpha-8-linuxarm64debug.zip",
        sha256 = "7b44fd31bcc37503d5552aa61379cb002f989a27f99e3881434a7bb81f0096cf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-8/xrpVendordep-cpp-2027.0.0-alpha-8-linuxx86-64debug.zip",
        sha256 = "c3772854f01e017159397c85689771c98f8e8f8ceb4147a9ed72297152454556",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-8/xrpVendordep-cpp-2027.0.0-alpha-8-osxuniversaldebug.zip",
        sha256 = "1cae3f31242e5ca2e1b74f210942a21aa4f7c91d18e02c8c0be846e767277e33",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libxrpVendordep.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libtelemetry.dylib @rpath/libtelemetry.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libtunables.dylib @rpath/libtunables.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libwpilibc.dylib @rpath/libwpilibc.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libxrpVendordep.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-8/xrpVendordep-cpp-2027.0.0-alpha-8-windowsx86-64debug.zip",
        sha256 = "60f007198ed5e0d55ae98d650ad17d540171c5c9578a0bd34b7c138c6620344b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-8/xrpVendordep-cpp-2027.0.0-alpha-8-windowsarm64debug.zip",
        sha256 = "c3377abbf3311056b35eff8171aedae3dc89403013975f1bdb51b8604bda2b5e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-8/xrpVendordep-cpp-2027.0.0-alpha-8-linuxarm64staticdebug.zip",
        sha256 = "e66bd373b7f63b499ca71e37b2eb06e24ac91260d36ea6bc0c265acd14fad509",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-8/xrpVendordep-cpp-2027.0.0-alpha-8-linuxx86-64staticdebug.zip",
        sha256 = "fadc0f1e1b77b6da6ac63553b782966156c76f697f6d2fd272fa81671e0b588c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-8/xrpVendordep-cpp-2027.0.0-alpha-8-osxuniversalstaticdebug.zip",
        sha256 = "5bbb4f3ff763c3b6d38b01f009f336cbaaa5010e0b716cdcfb142d6ce75f5685",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-8/xrpVendordep-cpp-2027.0.0-alpha-8-windowsx86-64staticdebug.zip",
        sha256 = "2dd07473443f04d933bde70c3c7210a7aaa7ad71b9492b8141a732fd0827b1a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-8/xrpVendordep-cpp-2027.0.0-alpha-8-windowsarm64staticdebug.zip",
        sha256 = "6591d2a11ece2944aca84104eeba6838a1db4fd7366fae58909611eb881b5a7a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-8/xrpVendordep-cpp-2027.0.0-alpha-8-linuxsystemcore.zip",
        sha256 = "8fbdd6ea268347c6d391dbaed2f66a326bb51d1f09913cf6829c728c1318e5ad",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-8/xrpVendordep-cpp-2027.0.0-alpha-8-linuxsystemcorestatic.zip",
        sha256 = "622569afff35ab0c6da9ee3450b4e674e3ad1663ec39b7d36cc726eecf2c008c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-8/xrpVendordep-cpp-2027.0.0-alpha-8-linuxsystemcoredebug.zip",
        sha256 = "b823a907d97c351a5738832d82cc3f9bf162fbf837795d183f6af60a1cc5bf67",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-8/xrpVendordep-cpp-2027.0.0-alpha-8-linuxsystemcorestaticdebug.zip",
        sha256 = "7532be5d2a26951baba65d069dbe41836342a36c53705818126ce279f67c0644",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-8/halsim_ds_socket-2027.0.0-alpha-8-headers.zip",
        sha256 = "bbe8988b5bb01ff054557288f5b98b4fc5c8c44e4e731f9b287f3d7d08620e82",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-8/halsim_ds_socket-2027.0.0-alpha-8-sources.zip",
        sha256 = "d11e20bcf41d4542d504a02888009259c14181a6c438672ced90a48a6794362d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-8/halsim_ds_socket-2027.0.0-alpha-8-linuxarm64.zip",
        sha256 = "2dc76f515482993793daae5e1471b66aaa6e1e48f85c883c02fabee8e7e992e6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-8/halsim_ds_socket-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "426a1502fe97e90922713c2ed40742b424695e54438e9a83dff8861b4dcf33d7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-8/halsim_ds_socket-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "125cbc1b5e66cf28e37ff5dac54dfc02aa7f1124ed2250ce0bbb2b72e2ebd30b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_ds_socket.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libmrclib.dylib @rpath/libmrclib.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-8/halsim_ds_socket-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "4a35f3008359658e4d119e520f1831d27f89d78d6e8a7510082228f4a1a60333",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-8/halsim_ds_socket-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "d3bfe7dedfcb0b286bd856ad79d681bcd0afdff2a9753b72ec7c00ed6eefdcea",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-8/halsim_ds_socket-2027.0.0-alpha-8-linuxarm64static.zip",
        sha256 = "cc5ba7bf4c68d9fe353b127b740ae49b1588c84ab5c20139c046f2f4cd5a27c9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-8/halsim_ds_socket-2027.0.0-alpha-8-linuxx86-64static.zip",
        sha256 = "ce83e40567e131e444847f85fa7ba43f62c74d0784fb489987a65fee22824a9d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-8/halsim_ds_socket-2027.0.0-alpha-8-osxuniversalstatic.zip",
        sha256 = "fe8828d5148a919753fede0ef7e9acb338bfd535e377eb411671c0bbf088657e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-8/halsim_ds_socket-2027.0.0-alpha-8-windowsx86-64static.zip",
        sha256 = "a192bde859e8f0ab426df49d97484fbf1e011c510898541380bfc366b6d6d7c0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-8/halsim_ds_socket-2027.0.0-alpha-8-windowsarm64static.zip",
        sha256 = "9539a6e10f63308ad86d8d7f6e10027f99f36ca25ca3e47e02fd0bc9b224beb2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-8/halsim_ds_socket-2027.0.0-alpha-8-linuxarm64debug.zip",
        sha256 = "4a1daf8ec06e9f8652f790e5a266c2c7822873391556f673cbe62d85cef2cc86",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-8/halsim_ds_socket-2027.0.0-alpha-8-linuxx86-64debug.zip",
        sha256 = "d77f6a8aba69950355300cb34a2df93ad44116aa0e8e69d1a4d0b94b2a0cba0b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-8/halsim_ds_socket-2027.0.0-alpha-8-osxuniversaldebug.zip",
        sha256 = "b372864ce7b8e5618f65e493dcbab596a67c08286beb5d9826fa86f40f23baf5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_ds_socket.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libmrclib.dylib @rpath/libmrclib.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-8/halsim_ds_socket-2027.0.0-alpha-8-windowsx86-64debug.zip",
        sha256 = "3b0e2b4d11407d8a404130ded77415d688ecb502b019161eb7b9f611806df18c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-8/halsim_ds_socket-2027.0.0-alpha-8-windowsarm64debug.zip",
        sha256 = "fbbd64b68021876ebe15433689a2bef7782ab0dfc82a8e31fef1ac53e043f230",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-8/halsim_ds_socket-2027.0.0-alpha-8-linuxarm64staticdebug.zip",
        sha256 = "af53706fce5d2857fa71d98a570079d72cff5ed70ba7507cb637954ad01823b0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-8/halsim_ds_socket-2027.0.0-alpha-8-linuxx86-64staticdebug.zip",
        sha256 = "c71f11225d709c26532865b490324185c53e2ffd9739334c18fd6b21cc48da4c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-8/halsim_ds_socket-2027.0.0-alpha-8-osxuniversalstaticdebug.zip",
        sha256 = "2dcba90340ffff0b0e29780ff00e3d54321cd06b569d89cd829e142e82c91b63",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-8/halsim_ds_socket-2027.0.0-alpha-8-windowsx86-64staticdebug.zip",
        sha256 = "eb0bbc4e9954a610e4ffc418f70a82fce89d08429116fdb4a0e6b7bfcf454a2f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-8/halsim_ds_socket-2027.0.0-alpha-8-windowsarm64staticdebug.zip",
        sha256 = "4f0d3002d71690f13b84fe12f19fee1267b5751e27fb708c1ba4fbe1d5d8213d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-8/halsim_gui-2027.0.0-alpha-8-headers.zip",
        sha256 = "4a455521b896bbc6881d1e0f25472ce9ca9c80b3a9419abfe09a8d2ea7ffe45e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-8/halsim_gui-2027.0.0-alpha-8-sources.zip",
        sha256 = "8126a4d80e4eeb7c29ee03ff7600510bf1067c82c72c00dd53f7e2ffe233167e",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-8/halsim_gui-2027.0.0-alpha-8-linuxarm64.zip",
        sha256 = "a020f67387018092fddebd63be6fe6d1629de196f4733247325b2827fe132467",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-8/halsim_gui-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "eb8c4c68857cb0d8d927d22f543ef59f8d68da70cd869012ccf5eadf51c349fe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-8/halsim_gui-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "9996bb524e7ba915b71b485f3a0fbac6b9abaaff4a47e16690edbc04b9e7c3e5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_gui.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libtelemetry.dylib @rpath/libtelemetry.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libtunables.dylib @rpath/libtunables.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_gui.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-8/halsim_gui-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "aaf4c0721ccb2f41755af90d1589097179a0b2c35386d001ccded6d2854f657d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-8/halsim_gui-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "5135fbe10834799868a90bd1fa74058beb15d6733e00af0d0db88dad2b6fa002",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-8/halsim_gui-2027.0.0-alpha-8-linuxarm64static.zip",
        sha256 = "0b8322f436d6519944f8ffee47988b1f9de18a42bde43286c87b3739fefbc084",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-8/halsim_gui-2027.0.0-alpha-8-linuxx86-64static.zip",
        sha256 = "2653439255b4a99bac77beb73f759871ed0564a50bfb1f043ad0d4e65024c040",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-8/halsim_gui-2027.0.0-alpha-8-osxuniversalstatic.zip",
        sha256 = "ed6a3beeb8f2c2bc301fe48c1d5154b6bcce43d7e987e9ae7d6fd3e74f468cd5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-8/halsim_gui-2027.0.0-alpha-8-windowsx86-64static.zip",
        sha256 = "a0627072c68d7efae3fdf07a17f18fa79be3e15bb22e114ed87202eaf4ba74fd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-8/halsim_gui-2027.0.0-alpha-8-windowsarm64static.zip",
        sha256 = "491e7fe597b9ff4d79af0081bf3603b77b6944b5b4025b69faec4eb3a88e9a44",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-8/halsim_gui-2027.0.0-alpha-8-linuxarm64debug.zip",
        sha256 = "173400f1457571bdcd647890851eb9ae5431c6374088dae3a268afeb17e26cc3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-8/halsim_gui-2027.0.0-alpha-8-linuxx86-64debug.zip",
        sha256 = "162ba64e17c798bddf6671a8b45267a15312a733b07656e963baf32ddd2a6d35",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-8/halsim_gui-2027.0.0-alpha-8-osxuniversaldebug.zip",
        sha256 = "ee5c29271053a34103e818d6e5e2617e8b2c965052e5e387aae0ff2af8b6ecf9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_gui.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libtelemetry.dylib @rpath/libtelemetry.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libtunables.dylib @rpath/libtunables.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_gui.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-8/halsim_gui-2027.0.0-alpha-8-windowsx86-64debug.zip",
        sha256 = "9a5decc999181f1ce2a30245e9126306519c2b2db08c672a1322e2168cce45e0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-8/halsim_gui-2027.0.0-alpha-8-windowsarm64debug.zip",
        sha256 = "9d97b076ee571c56abe47a48be264c7e28ee974d5f3b74b76905979d8a78ff37",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-8/halsim_gui-2027.0.0-alpha-8-linuxarm64staticdebug.zip",
        sha256 = "77f5f55ed7aa9fb4c63e12eeaf17203731ca5f444388627aa4c4456fbf48e023",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-8/halsim_gui-2027.0.0-alpha-8-linuxx86-64staticdebug.zip",
        sha256 = "250b2a4c427086922daa66414ca8bfd6d365f6ad70d202687c779d9a4dda4e6a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-8/halsim_gui-2027.0.0-alpha-8-osxuniversalstaticdebug.zip",
        sha256 = "2dfec04cd29d1de07c1b080e0cb7b7d0dfdcf087a9c89a79bedb959d16fa41e6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-8/halsim_gui-2027.0.0-alpha-8-windowsx86-64staticdebug.zip",
        sha256 = "0abf0d1e6ffff4013a0826f9bad570c1b93316b301976597cb705182f3ea60e6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-8/halsim_gui-2027.0.0-alpha-8-windowsarm64staticdebug.zip",
        sha256 = "99c9965da0a1ec8ebf3f70f4ba68eab52318af02eb87de8a8553997c03619c02",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-8/halsim_ws_client-2027.0.0-alpha-8-headers.zip",
        sha256 = "b6023364ca78cbb2716233d3318a0d74fa31a1fd9844235951e4b8e48ebf3c7e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-8/halsim_ws_client-2027.0.0-alpha-8-sources.zip",
        sha256 = "9a300453a4ea0cd8665c435a667d2f8291fa530510ee0b69c589fad49dc36a4c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-8/halsim_ws_client-2027.0.0-alpha-8-linuxarm64.zip",
        sha256 = "1dc63054b456c8eb5e30439d2bb6b1151b3694a3d7c1ae38badfbb947d64d78b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-8/halsim_ws_client-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "df0c31c3f593bd521991c0345e36ea19e7db7fb39af31017ef2565043e30449b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-8/halsim_ws_client-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "70236c2f12def1bf844890323ef3c392d12ff023ec25c3df219eaf5a53bcb5c4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_ws_client.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_ws_client.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-8/halsim_ws_client-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "a555a730053340d02f5eac7d41c3dc28b617285e666847953166db0d4c110cd5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-8/halsim_ws_client-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "e28abbd9d2af6bee9a71a5a6e73857599b4fe9d1c5ad51ddf0cd0eb30742fe96",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-8/halsim_ws_client-2027.0.0-alpha-8-linuxarm64static.zip",
        sha256 = "e5b18d98625d86fdb8694b0cb403acbaf4e6a94052ae7bdb8e439cf5679a8592",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-8/halsim_ws_client-2027.0.0-alpha-8-linuxx86-64static.zip",
        sha256 = "86bb1d4b8cef69a9ab13205d2db2b363a3c8b9493fa2447d678072999447a55d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-8/halsim_ws_client-2027.0.0-alpha-8-osxuniversalstatic.zip",
        sha256 = "395e9c856212b0634ae66725c7485b3fff951cde9d75830ec3bd041de75dd672",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-8/halsim_ws_client-2027.0.0-alpha-8-windowsx86-64static.zip",
        sha256 = "fa79c02144a2ec19c6b6b97e4e5c05590d4d30eb64cd5964edb7dd6ed69f09c0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-8/halsim_ws_client-2027.0.0-alpha-8-windowsarm64static.zip",
        sha256 = "770f106f72a169764c169e460ca8582b010364e2570cdd7a5e95775443d11df3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-8/halsim_ws_client-2027.0.0-alpha-8-linuxarm64debug.zip",
        sha256 = "e0a58a66b3ac680746759066bcdf5870c57fdee0a1aa024cb45e09229ef15cbf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-8/halsim_ws_client-2027.0.0-alpha-8-linuxx86-64debug.zip",
        sha256 = "106b5d05842d0611400b4d1d662885dbbda33505d2ed5a896bfa005c2372162b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-8/halsim_ws_client-2027.0.0-alpha-8-osxuniversaldebug.zip",
        sha256 = "d7e7f2fed2ef6e9c08d037b0d86e909605c415d0d7e2a07f1eeccd565a17a850",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_ws_client.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_ws_client.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-8/halsim_ws_client-2027.0.0-alpha-8-windowsx86-64debug.zip",
        sha256 = "21618a38f45f44fc9ed553f13eb187b790a9b46b4f1b54b9cb19038f42fc538e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-8/halsim_ws_client-2027.0.0-alpha-8-windowsarm64debug.zip",
        sha256 = "7aa3a763c01dff290596775bce6b0ec5654123fb87af2ec16b086dad7a1450fb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-8/halsim_ws_client-2027.0.0-alpha-8-linuxarm64staticdebug.zip",
        sha256 = "93f8680c5199fb6ca0804d8b899ca095d5447c01427e19eb27a7e73cafdcd18d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-8/halsim_ws_client-2027.0.0-alpha-8-linuxx86-64staticdebug.zip",
        sha256 = "4039b5fa592bf5fc7b853d258ca45447dc36c3a57ddc02d6ea2bdbfa885720c2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-8/halsim_ws_client-2027.0.0-alpha-8-osxuniversalstaticdebug.zip",
        sha256 = "2695a409c647e1d8cfa3084ebe21847052dc64e558b503a5653830e23ad4d406",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-8/halsim_ws_client-2027.0.0-alpha-8-windowsx86-64staticdebug.zip",
        sha256 = "69480f7ed4c5006ea411fda65134769d9f9ed23ede595505d394a1e025b52fb4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-8/halsim_ws_client-2027.0.0-alpha-8-windowsarm64staticdebug.zip",
        sha256 = "2423c589f60245a4cef9c4b501b62ac43e0d75711e8551843b2d0c02e09a7435",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-8/halsim_ws_server-2027.0.0-alpha-8-headers.zip",
        sha256 = "b1a70f1886d53485c7df1626fcb0879c35d4941cfd0ea2a68745f4f438a62363",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-8/halsim_ws_server-2027.0.0-alpha-8-sources.zip",
        sha256 = "7a15734166717daf4fb19cb7b5e201b798927b444a1b6ce81eddd0011020cc4f",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-8/halsim_ws_server-2027.0.0-alpha-8-linuxarm64.zip",
        sha256 = "d6eae73b9a8046e41cb593fe3e189bb7e41d93429dee5f8bc0fe5ed4f4b4b5b4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-8/halsim_ws_server-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "4d014393716126857de95a73d20fd0155b65cccf58cefb8d59fdc8615651e56c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-8/halsim_ws_server-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "ea2a85c3ff74816330feea1947dce14234ff49f323498363161a8f602e834002",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_ws_server.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_ws_server.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-8/halsim_ws_server-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "1588834118f4355d3633310000456026c70b8f9d9885ee1f063083b1a0940f19",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-8/halsim_ws_server-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "ab15454896e5c70ce0015745a3735cc0159506c345017ab05258a0c4f84b9e51",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-8/halsim_ws_server-2027.0.0-alpha-8-linuxarm64static.zip",
        sha256 = "eb070e193596cc32a2d432f521952aa1134eb401e688194a7feb5e17475ecbf2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-8/halsim_ws_server-2027.0.0-alpha-8-linuxx86-64static.zip",
        sha256 = "4ee0a9978ff4f0bd8925643aeb528468f7764528d556b0cc9c5190dc6798e1b0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-8/halsim_ws_server-2027.0.0-alpha-8-osxuniversalstatic.zip",
        sha256 = "8e44976ce55c81ab3b00ecc99262856b67207e5ca89c0e4183dcd57a7b833ca3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-8/halsim_ws_server-2027.0.0-alpha-8-windowsx86-64static.zip",
        sha256 = "361db91d66a0fdd8c7ab84e8f91c6f2847d66c0328afd9beb694caed5e8a8930",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-8/halsim_ws_server-2027.0.0-alpha-8-windowsarm64static.zip",
        sha256 = "1c2594d98efcc84ba28e0334b27ffd9221e7eff50d1abdd037842512533274a2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-8/halsim_ws_server-2027.0.0-alpha-8-linuxarm64debug.zip",
        sha256 = "ac251bbab27a8a76dc0118d35bf951a3dfa08b8c8ed7c5f5499e958dbe56ea38",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-8/halsim_ws_server-2027.0.0-alpha-8-linuxx86-64debug.zip",
        sha256 = "2c861f49b61ccc874faa85a7788ad1734b20df129abf2b2d96f28ffb3f6d13aa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-8/halsim_ws_server-2027.0.0-alpha-8-osxuniversaldebug.zip",
        sha256 = "b98b058b402e74a877f0b4c4f3fe2e1f89173afe7572f61b1f05b7718d424ab9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_ws_server.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_ws_server.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-8/halsim_ws_server-2027.0.0-alpha-8-windowsx86-64debug.zip",
        sha256 = "20116565202295ad96f63134019eb6f17452ea3f301428a01446d496450e64c2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-8/halsim_ws_server-2027.0.0-alpha-8-windowsarm64debug.zip",
        sha256 = "52ab8169ab2a457b763ae57100e7b30af353304f9feaff8925f835ae20b046ad",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-8/halsim_ws_server-2027.0.0-alpha-8-linuxarm64staticdebug.zip",
        sha256 = "0ac81f8d662a1b81f413cca2e91913e0a26a9233c7e0c91d09bf2f43145716d6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-8/halsim_ws_server-2027.0.0-alpha-8-linuxx86-64staticdebug.zip",
        sha256 = "0d7093b52a817db04db3a9bc6f6d49b0d0c64ca319ec63f306d0ad97e543bae3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-8/halsim_ws_server-2027.0.0-alpha-8-osxuniversalstaticdebug.zip",
        sha256 = "6becd836f1c516fb854a79deca5f1ddc77e1953fa7495c08e7c40acc906acbda",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-8/halsim_ws_server-2027.0.0-alpha-8-windowsx86-64staticdebug.zip",
        sha256 = "a0f47fbe5b9fbcda50d0f3252e9762356ede8a1a83b30ffa288b83812aa9bed7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-8/halsim_ws_server-2027.0.0-alpha-8-windowsarm64staticdebug.zip",
        sha256 = "abff44e404c8e97efdec2d98cbcfb2b06a88abf05309e1170994c6c8bfa778e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-8/halsim_xrp-2027.0.0-alpha-8-headers.zip",
        sha256 = "d91d1f184918d14b60ead89a30d73e57efcf7a424dcbf964c2834188132b1629",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-8/halsim_xrp-2027.0.0-alpha-8-sources.zip",
        sha256 = "62b71391d37633c1882d57f2bc8640f2677f0dd2f8cf5cbfda2fbd3768b734ce",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-8/halsim_xrp-2027.0.0-alpha-8-linuxarm64.zip",
        sha256 = "484b1a221d4cd9b65bbcf483ab81397eaa11d56e676b147031a3e438ca1c07db",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-8/halsim_xrp-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "f8bc3684481c90a0e93d560cc15174cb11d49007cac6102ed695ce6bd5af6fb0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-8/halsim_xrp-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "a758efe0a19c2ab347f4812b4076af064ccc5b0dc3c234a581fb5018ec9c1328",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_xrp.dylib osx/universal/shared/libhalsim_xrp.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libhalsim_xrp.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_xrp.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_xrp.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_xrp.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_xrp.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-8/halsim_xrp-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "ef140b4ec1717d44891d66c72fc5f57c610a7c0de6786632c2da4409e5bb8ba5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-8/halsim_xrp-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "2e2954a2c433c4e13eb44255caff30c93dc1316729f3d4e9e3dc3fde98efbebd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-8/halsim_xrp-2027.0.0-alpha-8-linuxarm64static.zip",
        sha256 = "b60e35ff61b0bd9d4fd5d6d8a00b626f42de4f4e2c86a956b94158848c098bed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-8/halsim_xrp-2027.0.0-alpha-8-linuxx86-64static.zip",
        sha256 = "fe34e544e064da270e4ad04104a6af0eb119cf5b131b3cec8dadf6faf3f165fa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-8/halsim_xrp-2027.0.0-alpha-8-osxuniversalstatic.zip",
        sha256 = "d65624ab00bf20526e276b867453d3bb3d1101a1e18cc329baeff7d9fafb9cc8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-8/halsim_xrp-2027.0.0-alpha-8-windowsx86-64static.zip",
        sha256 = "80306308a645c823b85706bcb7912283055c52952e46bf84c2f99f39af522f17",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-8/halsim_xrp-2027.0.0-alpha-8-windowsarm64static.zip",
        sha256 = "8508c9d31f31cda65baf21a5ba4864891499cde87460261771ec90321b134b2a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-8/halsim_xrp-2027.0.0-alpha-8-linuxarm64debug.zip",
        sha256 = "225a7ed85b8a95418334c0d16c193b3b9d43c60e938d62636a97c30afa0c90d3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-8/halsim_xrp-2027.0.0-alpha-8-linuxx86-64debug.zip",
        sha256 = "4baf3bcdb357e7a6f150b3d584bdea29a4cf4fb78520498b684fdbecd9df479a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-8/halsim_xrp-2027.0.0-alpha-8-osxuniversaldebug.zip",
        sha256 = "075ed247e3d5781355ca4117a61c846ab83f8c44f2d5c27d75ed4033e5265a68",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_xrp.dylib osx/universal/shared/libhalsim_xrp.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libhalsim_xrp.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_xrp.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_xrp.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_xrp.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_xrp.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-8/halsim_xrp-2027.0.0-alpha-8-windowsx86-64debug.zip",
        sha256 = "5a5e0d200ef74a019a9e38c1143e73e69d7f97702232db4bce6191d33089bdaa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-8/halsim_xrp-2027.0.0-alpha-8-windowsarm64debug.zip",
        sha256 = "dbc67e554f142c647bf5bd128f28e509aaa750e00ba339cf248db410f964d37d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-8/halsim_xrp-2027.0.0-alpha-8-linuxarm64staticdebug.zip",
        sha256 = "dbf12574a7a0b1978c24261ca77cbac8bc107a36ac035ba03e85d5dbe61d337d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-8/halsim_xrp-2027.0.0-alpha-8-linuxx86-64staticdebug.zip",
        sha256 = "9434472b548839c0836b7429119de0066e837e3a2810789936e2c26ad6c49001",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-8/halsim_xrp-2027.0.0-alpha-8-osxuniversalstaticdebug.zip",
        sha256 = "09083b17379fe1f26c32a491a4f26dee33cdaa5ebb3bbaf5c4ce91c4d71ed067",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-8/halsim_xrp-2027.0.0-alpha-8-windowsx86-64staticdebug.zip",
        sha256 = "68da033377d749dbb478fe11c28493d7062ae7e8e0226afd183d8be2794ccde4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-8/halsim_xrp-2027.0.0-alpha-8-windowsarm64staticdebug.zip",
        sha256 = "0c14550c0b01045a29ab095bce772ec8f1bdc6c30969422e30f3f2e982aa0638",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/DataLogTool/2027.0.0-alpha-8/DataLogTool-2027.0.0-alpha-8-linuxarm64.zip",
        sha256 = "8fb076c300243efbe21f4f898f79548e5d33878631cfb566407567ea40c0d4a3",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/DataLogTool/2027.0.0-alpha-8/DataLogTool-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "c7add8f64e4846b69b4df7e30e583a21e6622d50cc3bef66d9cf4d31a944b2c6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/DataLogTool/2027.0.0-alpha-8/DataLogTool-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "bf762cfc3d5788a96e262b28366a55e7a794110e366eeafbcdc9249a3824b972",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/DataLogTool/2027.0.0-alpha-8/DataLogTool-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "b1aba302515be3bf4114e035935de67560be0c091b3946c77a6cbf217a763aa9",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/DataLogTool/2027.0.0-alpha-8/DataLogTool-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "5f4b0c01a60490421f2df1c9773cb98b7b8af7773193e8cc69ab1d59c9cd70d2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/Glass/2027.0.0-alpha-8/Glass-2027.0.0-alpha-8-linuxarm64.zip",
        sha256 = "1a4ed5ce3d49a0fb4ec5919da940a2cd98454ad2aa156d08efbf9cdd6e0ac4be",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/Glass/2027.0.0-alpha-8/Glass-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "0a4951a7e2d855bf2cd36b12cdab301d60125d9fb9334bf36f008ac77da8dc09",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/Glass/2027.0.0-alpha-8/Glass-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "c8130116203d674b77e31a4ab790156903afd61a2c11deececabcbe6be14b9b2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/Glass/2027.0.0-alpha-8/Glass-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "f163b19c23f0fbea4814be93f13ad002d029d243dd02a4c39f6e2b16660bd6c5",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/Glass/2027.0.0-alpha-8/Glass-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "70d53e61eaa01c76f2cf56ad70061d860c5e1cf03bc0ca888440f1aa035c4f3f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/OutlineViewer/2027.0.0-alpha-8/OutlineViewer-2027.0.0-alpha-8-linuxarm64.zip",
        sha256 = "5a0b21f050af15c4a47e63cc67825f4ff6ef70169640edf5ee0f7646481354c4",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/OutlineViewer/2027.0.0-alpha-8/OutlineViewer-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "109fbc313a73d8a74ec8295dc760ebb241452b89bd8db772f3c83b5eeed47993",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/OutlineViewer/2027.0.0-alpha-8/OutlineViewer-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "cf833f21f676068393004007c66b4cf51d425523a994731347ebdffe3648ca36",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/OutlineViewer/2027.0.0-alpha-8/OutlineViewer-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "bff53197ca4125865ba907a644328a62c4d6ee3b474169e920f995b88fb3e349",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/OutlineViewer/2027.0.0-alpha-8/OutlineViewer-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "ed2cdf0a4e5b7a1758b918be5609c23eeae6993573bef82cdd8315ac88e07c34",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_processstarter_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/processstarter/2027.0.0-alpha-8/processstarter-2027.0.0-alpha-8-linuxarm64.zip",
        sha256 = "None",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_processstarter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/processstarter/2027.0.0-alpha-8/processstarter-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "None",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_processstarter_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/processstarter/2027.0.0-alpha-8/processstarter-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "None",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_processstarter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/processstarter/2027.0.0-alpha-8/processstarter-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "None",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_processstarter_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/processstarter/2027.0.0-alpha-8/processstarter-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "None",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/SysId/2027.0.0-alpha-8/SysId-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "52b9bfa12e50b149d9137e401f3d993ccc3ed9ec2768ff34d36b1908ec144616",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/SysId/2027.0.0-alpha-8/SysId-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "ca47ef15eac0f730f9753ed0e7c77bfd4ec7958f4e7ecea687607192f5432206",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/SysId/2027.0.0-alpha-8/SysId-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "0dce5e93b7b410978b8700fcac47ec860b96418d9ea67823615d63e52906bbe6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/SysId/2027.0.0-alpha-8/SysId-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "987589c62f0773e8dfa7b47cccf685a0d1cebc4e7bd57d886f77824e82c4350f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_wpical_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/wpical/2027.0.0-alpha-8/wpical-2027.0.0-alpha-8-linuxarm64.zip",
        sha256 = "58f06d75203fe34679a4cb41a9c8f487fe39f2ba6d12c74b266556093c864442",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_wpical_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/wpical/2027.0.0-alpha-8/wpical-2027.0.0-alpha-8-linuxx86-64.zip",
        sha256 = "0d36a4bc3e196885c5d189b3aa7206a8fae94f292d521c07a06eedeec384bcad",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_wpical_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/wpical/2027.0.0-alpha-8/wpical-2027.0.0-alpha-8-osxuniversal.zip",
        sha256 = "f7112c7dd27cc382cc32d075b8a8e3136db50c500a3f04985ebc8dc0253311c6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_wpical_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/wpical/2027.0.0-alpha-8/wpical-2027.0.0-alpha-8-windowsx86-64.zip",
        sha256 = "86e18d50e0f0fe4ca5e084603862a3da2aa29b3fbe7c44b19d455e06acd5b804",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_wpical_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/wpical/2027.0.0-alpha-8/wpical-2027.0.0-alpha-8-windowsarm64.zip",
        sha256 = "67b7a3ba9c4636ae55dcfa9f43edce441ed6847071fbd137dedbffc097b7b8ce",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

deps = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
