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
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-4/wpiutil-cpp-2027.0.0-alpha-4-headers.zip",
        sha256 = "252329fb661f89dbbde25039e4b3c68ec2136616a3c9cbb9b5e2d80af4f1a51d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-4/wpiutil-cpp-2027.0.0-alpha-4-sources.zip",
        sha256 = "a6c74d2eba85871dc93461a89787916cd785936b2a6c823bb9af13707f92abad",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-4/wpiutil-cpp-2027.0.0-alpha-4-linuxarm64.zip",
        sha256 = "4968069b73566b0009ec744ee261f328c7d60b3abb23e444d8bfede0064fe87f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-4/wpiutil-cpp-2027.0.0-alpha-4-linuxx86-64.zip",
        sha256 = "f263af38e360f0d49cd08aa17ed8be08bc1b37d8468f9c10e69303b2116090bc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-4/wpiutil-cpp-2027.0.0-alpha-4-osxuniversal.zip",
        sha256 = "83bd52add3b08031f68b28689d8d86161af3ad58835ac61f7eb4baeda99d2550",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-4/wpiutil-cpp-2027.0.0-alpha-4-windowsx86-64.zip",
        sha256 = "32f33d4d5e8ae0c600a2856b2b817b72cddab7c218be70d31392b82907cdd923",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-4/wpiutil-cpp-2027.0.0-alpha-4-windowsarm64.zip",
        sha256 = "1d78ff6fdee95924e1d0386dc1e813fd9a1ffb5e1658a4a2ce7e62acbb76b27d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-4/wpiutil-cpp-2027.0.0-alpha-4-linuxarm64static.zip",
        sha256 = "43483b6fa3198cdf1ccd485b8e8e4c440cca53de7dfc8e8875887d5083ed8fe4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-4/wpiutil-cpp-2027.0.0-alpha-4-linuxx86-64static.zip",
        sha256 = "744feda86ec4ecc5d3e5d236de924974ee968f0228bc2ed9978dd483d4ad00bf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-4/wpiutil-cpp-2027.0.0-alpha-4-osxuniversalstatic.zip",
        sha256 = "158854f021f52d8173f579c736636f882ee8a915b8569d37ddf93c205b831e64",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-4/wpiutil-cpp-2027.0.0-alpha-4-windowsx86-64static.zip",
        sha256 = "309c4f9d8def17cafd85765dd8ff82682fb59b6fb3d4e60381b7f7122ebf1d3b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-4/wpiutil-cpp-2027.0.0-alpha-4-windowsarm64static.zip",
        sha256 = "24f90fd2469c44256e45ee0af63b0fd9f5e3e4d44f4def04aeaaf09284173438",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-4/wpiutil-cpp-2027.0.0-alpha-4-linuxarm64debug.zip",
        sha256 = "4cc01af5701ad4f1dc2d8f9572f77a821771082a51c46fe5864403eef82e5210",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-4/wpiutil-cpp-2027.0.0-alpha-4-linuxx86-64debug.zip",
        sha256 = "7848b8ce6b8914f6d34cca33a3db63b503c08c1ef6ed7d49605f4529809d1ad9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-4/wpiutil-cpp-2027.0.0-alpha-4-osxuniversaldebug.zip",
        sha256 = "c25fad9dfafbbed807766294a986ae3fd8f027ace3b9688687c02670c54c2eb3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-4/wpiutil-cpp-2027.0.0-alpha-4-windowsx86-64debug.zip",
        sha256 = "2ba22b34104794b046d71ef55da13f482c73bcd9754fad8eeeee62788f1febd3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-4/wpiutil-cpp-2027.0.0-alpha-4-windowsarm64debug.zip",
        sha256 = "c924e78df3b9a12801494a0822fc987049ec08227fc1220b6b861e55b8457763",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-4/wpiutil-cpp-2027.0.0-alpha-4-linuxarm64staticdebug.zip",
        sha256 = "504e2f67225f0602bd3aaf7f59f714770ef62fa78ed3e1b2caafb358c81e8730",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-4/wpiutil-cpp-2027.0.0-alpha-4-linuxx86-64staticdebug.zip",
        sha256 = "248cc32ede7d764809049c54f13b395209ef48f70ff55823da408d5b1e41752f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-4/wpiutil-cpp-2027.0.0-alpha-4-osxuniversalstaticdebug.zip",
        sha256 = "42947a80727d694b8a2ca8e4f132a81aefe786986d6bc2b4895cd1be1b809fc8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-4/wpiutil-cpp-2027.0.0-alpha-4-windowsx86-64staticdebug.zip",
        sha256 = "8bbf066d31f663bd32516ec17ce57b9264183d0eda41999b9f71b8986b6b567e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-4/wpiutil-cpp-2027.0.0-alpha-4-windowsarm64staticdebug.zip",
        sha256 = "4690f671720937fdd28bdaa161a70c9cad2d43bff9c196feeb7a297896b7ac8b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-4/wpiutil-cpp-2027.0.0-alpha-4-linuxsystemcore.zip",
        sha256 = "f04461d430d5faebc510fd1960ebe4ee0588fe2359e857d801ec19cde324ca71",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-4/wpiutil-cpp-2027.0.0-alpha-4-linuxsystemcorestatic.zip",
        sha256 = "b4b2258e10c49c7650f24f9aa176c6266e46d8ba37dd94407ab4323a10564643",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-4/wpiutil-cpp-2027.0.0-alpha-4-linuxsystemcoredebug.zip",
        sha256 = "d230a55efd17887a599ce006597ffd59217748bd0051dfc44371d16f1a562f28",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-4/wpiutil-cpp-2027.0.0-alpha-4-linuxsystemcorestaticdebug.zip",
        sha256 = "96ebc5c62a13a1b8a4da42ad7ea4d815d582ad5dc73fbac44f147688cdf6c0b1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-4/datalog-cpp-2027.0.0-alpha-4-headers.zip",
        sha256 = "87caa7e84c69a54b41e414fc7249b201ecd09651c23abe203787b79d0e359018",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-4/datalog-cpp-2027.0.0-alpha-4-sources.zip",
        sha256 = "17f4049f252130c5aceac4c2293e1a5312514e6673523302fbdd58de8272d99a",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-4/datalog-cpp-2027.0.0-alpha-4-linuxarm64.zip",
        sha256 = "024701c961f380571e8d215e7cee1955f9df92089f2a3c76c74bfc33f22829d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-4/datalog-cpp-2027.0.0-alpha-4-linuxx86-64.zip",
        sha256 = "57c501a63eb733a10e4d602320f6c9c5551d78dc8c1424c611d9c5e927aa78ca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-4/datalog-cpp-2027.0.0-alpha-4-osxuniversal.zip",
        sha256 = "a39b7c1c21e83ac4899a9c9b9189e0bd1aa2adbacfbad312525a54749e6bc606",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libdatalog.dylib osx/universal/shared/libdatalog.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libdatalog.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-4/datalog-cpp-2027.0.0-alpha-4-windowsx86-64.zip",
        sha256 = "35b854c103c9c5040fce2d13cb657f4681659472f3c78a26c3aaed629c711315",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-4/datalog-cpp-2027.0.0-alpha-4-windowsarm64.zip",
        sha256 = "d41ffd7a0226f5445b3c1a413e40ab0b0dec1daaf21c7e66beb8c93631a945ae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-4/datalog-cpp-2027.0.0-alpha-4-linuxarm64static.zip",
        sha256 = "d889562c8398c1e2d504731e28ea55aa988fa0e6cd7587348ef3101b1f681020",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-4/datalog-cpp-2027.0.0-alpha-4-linuxx86-64static.zip",
        sha256 = "4d4027abd5fbd5c87d8b828e5d2f88dca09d128f10cdac7ba52f9eaeea97b506",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-4/datalog-cpp-2027.0.0-alpha-4-osxuniversalstatic.zip",
        sha256 = "258a1a2ff8784419064bb89aad7d3a46e30a6ddb815a1dc63474c65f18fef152",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-4/datalog-cpp-2027.0.0-alpha-4-windowsx86-64static.zip",
        sha256 = "86500648dab99aa347ab3075a3b7bdb79b03c3a29c8e2b94ed61bfceeb25d715",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-4/datalog-cpp-2027.0.0-alpha-4-windowsarm64static.zip",
        sha256 = "0d1f7c62359ec77a19c43feeb564a135e1c1f17c2dca7bccca928e3192be4f88",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-4/datalog-cpp-2027.0.0-alpha-4-linuxarm64debug.zip",
        sha256 = "fdb7e8df5b71b8d009a0d341b682c0bc6b9c46551a41dca7ce9bcca29bb04dae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-4/datalog-cpp-2027.0.0-alpha-4-linuxx86-64debug.zip",
        sha256 = "088a65a91436b0a696d8569f738e057b499c60cd74efd05b9c0cd6f2ac6dbe45",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-4/datalog-cpp-2027.0.0-alpha-4-osxuniversaldebug.zip",
        sha256 = "12a808840235449d5472d06b076abdb344a33f2dd81038879c1e11f3e9790c4d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libdatalog.dylib osx/universal/shared/libdatalog.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libdatalog.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-4/datalog-cpp-2027.0.0-alpha-4-windowsx86-64debug.zip",
        sha256 = "00b4a662815f49c18b980b66b76ea5c2e59a894c392a554b5b78429f7220927b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-4/datalog-cpp-2027.0.0-alpha-4-windowsarm64debug.zip",
        sha256 = "c82ef575333995368edaaff80cc3c64edd09989963367de070b40380c7485f99",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-4/datalog-cpp-2027.0.0-alpha-4-linuxarm64staticdebug.zip",
        sha256 = "eea48b91be96e0eaa4b58fb93a29718994317b3a4f957246fd3b914bf55d9907",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-4/datalog-cpp-2027.0.0-alpha-4-linuxx86-64staticdebug.zip",
        sha256 = "4f2d66d803b3ae54f7a2a67a7c9c77724afa4b9a5dcd79b1beb6b4ca224422ae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-4/datalog-cpp-2027.0.0-alpha-4-osxuniversalstaticdebug.zip",
        sha256 = "fbe9275ea55e37bf2c77193d972d31f2ecdc4f1d1b603273f693b6dc7205911f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-4/datalog-cpp-2027.0.0-alpha-4-windowsx86-64staticdebug.zip",
        sha256 = "241d461ff41a46a62e9d92cf9b005b8cf647e039d23e96ebe7d43cad0c151eae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-4/datalog-cpp-2027.0.0-alpha-4-windowsarm64staticdebug.zip",
        sha256 = "c172735935cbeea8ab20f6d9f6e0f3267951890607cac343664fb522599ceb4f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-4/datalog-cpp-2027.0.0-alpha-4-linuxsystemcore.zip",
        sha256 = "51747cdbaa4c92746ff38cc4925d575c67d78f613aac11fcb20f42709e2baafb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-4/datalog-cpp-2027.0.0-alpha-4-linuxsystemcorestatic.zip",
        sha256 = "8570d9e6945a3fbd48ac992944a1c08f968cea193c0e194f0f1a2ff76d785709",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-4/datalog-cpp-2027.0.0-alpha-4-linuxsystemcoredebug.zip",
        sha256 = "293dd1dae0ac86b914a9641bf460f5424855bf3cc836578345dbaab3a0af628c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-4/datalog-cpp-2027.0.0-alpha-4-linuxsystemcorestaticdebug.zip",
        sha256 = "b496204d2730bd11a1f8bed43cde9c9298d02c7cd66bc8b51a6b6f6019f0614f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-4/wpinet-cpp-2027.0.0-alpha-4-headers.zip",
        sha256 = "abf9275bb921ad8b250f508f32f0b7a7403899f316b2b94df0cc245f5283e85f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-4/wpinet-cpp-2027.0.0-alpha-4-sources.zip",
        sha256 = "e722c83b8423d37b414e3ad0df5733dae2ad4e9c6b38421697c104e7725d4113",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-4/wpinet-cpp-2027.0.0-alpha-4-linuxarm64.zip",
        sha256 = "9b713dfe53865a49276d36acadab41cb885fd0772936fb11f1a234868568b54c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-4/wpinet-cpp-2027.0.0-alpha-4-linuxx86-64.zip",
        sha256 = "382d5791cf21d0717f881996d45648afa191cb894d4a3df1eaab2a6ce049ba43",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-4/wpinet-cpp-2027.0.0-alpha-4-osxuniversal.zip",
        sha256 = "a5c3e0bbadf9bd4ecb8ac0b25626e93372cb018915a976369ba80186f58bb472",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-4/wpinet-cpp-2027.0.0-alpha-4-windowsx86-64.zip",
        sha256 = "b5d712dbaafbf8e2d885cc226e4ff3aaef1383fc05d145bd203d8833b27ad729",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-4/wpinet-cpp-2027.0.0-alpha-4-windowsarm64.zip",
        sha256 = "3e9452dba3b28340b6c8fa3c51edf0224eddc367d7e4f5da248af5ebdcc5b1ba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-4/wpinet-cpp-2027.0.0-alpha-4-linuxarm64static.zip",
        sha256 = "4a8a9906f498f1bb59f547d4c3a608e8d6bbbdde94801ea1063e0c1b52987d73",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-4/wpinet-cpp-2027.0.0-alpha-4-linuxx86-64static.zip",
        sha256 = "4b034bda6442a25b87d74bfc69a1b9652f9aab11071e2ed7a13d781a00f7d7fe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-4/wpinet-cpp-2027.0.0-alpha-4-osxuniversalstatic.zip",
        sha256 = "3b2863e2d91ef63939b8e1733ed142df6fc2036b756bfc96a6a5df978c286853",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-4/wpinet-cpp-2027.0.0-alpha-4-windowsx86-64static.zip",
        sha256 = "51925044bf834ba0ddd2080e7893e5460c0f812becd071567f7039c1a7779e7d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-4/wpinet-cpp-2027.0.0-alpha-4-windowsarm64static.zip",
        sha256 = "019c1d0f20d01adb3217627d9f78791abaf940b9db4caaf47a713889668541ec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-4/wpinet-cpp-2027.0.0-alpha-4-linuxarm64debug.zip",
        sha256 = "eafca9aeb6794e250a608e8aa4958a04531e7bce154b4237ff8b4aecb4c68859",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-4/wpinet-cpp-2027.0.0-alpha-4-linuxx86-64debug.zip",
        sha256 = "d43d86d410ffba6dc918c649c06db6fa0c808a1cc8c5f2e07ebe4dff472d5c62",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-4/wpinet-cpp-2027.0.0-alpha-4-osxuniversaldebug.zip",
        sha256 = "9c6e845765c6f70275856e2cfd8331daf31d24303f5ad4786ba2e4b2296bf37c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-4/wpinet-cpp-2027.0.0-alpha-4-windowsx86-64debug.zip",
        sha256 = "9b76d438f692aba534994af8bb38047796ac48897eb53dbef352e89d4ed6b997",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-4/wpinet-cpp-2027.0.0-alpha-4-windowsarm64debug.zip",
        sha256 = "67ed7fe878a7407b4da19000398172a8790118d824a34c70f6e06834ea714a2e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-4/wpinet-cpp-2027.0.0-alpha-4-linuxarm64staticdebug.zip",
        sha256 = "9cd3b23ffd440d41305994f586154ca66fc398bdd61a6e8118a1956e9ac2996d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-4/wpinet-cpp-2027.0.0-alpha-4-linuxx86-64staticdebug.zip",
        sha256 = "ad2c4a369e8f283d2e6f3bf1e8008247db9935213a6d546196f80299c9babca8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-4/wpinet-cpp-2027.0.0-alpha-4-osxuniversalstaticdebug.zip",
        sha256 = "3f0530b4d1f62cb051567b5c86d3c75235e2f4fd205d6eb2e201d7837179b5a3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-4/wpinet-cpp-2027.0.0-alpha-4-windowsx86-64staticdebug.zip",
        sha256 = "3db96c0728dee18e5a5e51e6cb228f4623a7990c8a51625523cbbdfb224228c4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-4/wpinet-cpp-2027.0.0-alpha-4-windowsarm64staticdebug.zip",
        sha256 = "656e830acb6ccd4a84f13013d39aaaa8098837c4feb0b6594eb72d295b178c6b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-4/wpinet-cpp-2027.0.0-alpha-4-linuxsystemcore.zip",
        sha256 = "bdb5a3be9516a81a7a47d9081ed2e3a081fc5df7ae4aba4f08c9ee22a4932b0a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-4/wpinet-cpp-2027.0.0-alpha-4-linuxsystemcorestatic.zip",
        sha256 = "f8c2593e74764a051a768b52671b33aac7ad6cb25e1a65a35c3e9fb0f796a830",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-4/wpinet-cpp-2027.0.0-alpha-4-linuxsystemcoredebug.zip",
        sha256 = "816a201e77547700a7ca4b3d31d45a1813725ccc73512fe846350173bfcd2a35",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-4/wpinet-cpp-2027.0.0-alpha-4-linuxsystemcorestaticdebug.zip",
        sha256 = "fe7a00bf5ac840a4cc2dc9eb9fc01b8492964422a7e8d1093f03c5cba544725b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-4/wpimath-cpp-2027.0.0-alpha-4-headers.zip",
        sha256 = "f3d548ebb28319cbf89fc79f25a82fce9087555db5895ebf8772bbad7bc3e2f0",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-4/wpimath-cpp-2027.0.0-alpha-4-sources.zip",
        sha256 = "d2d3b2fae37d444bb1c4a50a8176c99bc04f42d0aea6e79b2c727c70e3cf029b",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-4/wpimath-cpp-2027.0.0-alpha-4-linuxarm64.zip",
        sha256 = "dcad917a240e2737cb41df2878fd539f2af7db1160c5d3654b86274062930a14",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-4/wpimath-cpp-2027.0.0-alpha-4-linuxx86-64.zip",
        sha256 = "afee65e8288958c69f05904318c33ff9e162b97e4eab1379dae415958e177230",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-4/wpimath-cpp-2027.0.0-alpha-4-osxuniversal.zip",
        sha256 = "6cbb2ff9af71cddf9b6181b31afc2ab960b0f1c412a1f395e1743150db2af8cd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-4/wpimath-cpp-2027.0.0-alpha-4-windowsx86-64.zip",
        sha256 = "ae801f89832b9b6f62c2ee37f092ac9fd2ff8d75fb8ef5db02105b480716c667",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-4/wpimath-cpp-2027.0.0-alpha-4-windowsarm64.zip",
        sha256 = "c5a041df9baaf9a93e4a936ec859229e1cc21c47b47e692dc5acf3724666608f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-4/wpimath-cpp-2027.0.0-alpha-4-linuxarm64static.zip",
        sha256 = "e28fa13f978fe037dc6eae149564cd802e42c07bd4276bfc893c92abea6dfba1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-4/wpimath-cpp-2027.0.0-alpha-4-linuxx86-64static.zip",
        sha256 = "c40b06bd8cbfe40e74fd54d007b95d9bc02f87ddc5770ac06b35bb531b1a59ae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-4/wpimath-cpp-2027.0.0-alpha-4-osxuniversalstatic.zip",
        sha256 = "46501da423bdbb6285a4b1d94f103dad236b60b923a09e9cc0d40917f9269213",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-4/wpimath-cpp-2027.0.0-alpha-4-windowsx86-64static.zip",
        sha256 = "021de9712de8606146d5b0f537374fb423e0a7f08ada2f404aa67cb28cd0cd45",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-4/wpimath-cpp-2027.0.0-alpha-4-windowsarm64static.zip",
        sha256 = "96bd507f77cd63f5e6a8042af4497f1c67308e5a3b8750f857e7c53e04cee57c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-4/wpimath-cpp-2027.0.0-alpha-4-linuxarm64debug.zip",
        sha256 = "4b955ab345282e0a1fbbb61ec2699dbc5799a4e5f7886e9e701b7df29f720690",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-4/wpimath-cpp-2027.0.0-alpha-4-linuxx86-64debug.zip",
        sha256 = "3e4494288c4e7a992ce1d7f1e0997587acb3aaf2cb46a5874d4bfbc940599906",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-4/wpimath-cpp-2027.0.0-alpha-4-osxuniversaldebug.zip",
        sha256 = "9c6a3addff53bc954179c81963aae3125021636622d8e82300f96c834d7e04c2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-4/wpimath-cpp-2027.0.0-alpha-4-windowsx86-64debug.zip",
        sha256 = "b1b491c082d74ab568ef0938778d4f568a839344d4647a9556d175fbf4225e5a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-4/wpimath-cpp-2027.0.0-alpha-4-windowsarm64debug.zip",
        sha256 = "01a0346d5437735f07d0fa2c99bf329ca3f884c26d9e6fc41b78fcfcdf4cf2c5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-4/wpimath-cpp-2027.0.0-alpha-4-linuxarm64staticdebug.zip",
        sha256 = "4d691207c36a7d06cbf7d1e86f530aec3d3b9beae2c96102b89b93e287972e25",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-4/wpimath-cpp-2027.0.0-alpha-4-linuxx86-64staticdebug.zip",
        sha256 = "12a981837bb3eccb389e5d1f03e1cd5462dba320476eece5e42dbb1601158ea5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-4/wpimath-cpp-2027.0.0-alpha-4-osxuniversalstaticdebug.zip",
        sha256 = "5996753d194d0dcaa9a9daf3ef7c023b69e1e1d8052d699ea0fadbab337e25a6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-4/wpimath-cpp-2027.0.0-alpha-4-windowsx86-64staticdebug.zip",
        sha256 = "acb2aaec65b964c8d70c7d18480e5ff7f4ba031390af1f41b1bfc6896f444a11",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-4/wpimath-cpp-2027.0.0-alpha-4-windowsarm64staticdebug.zip",
        sha256 = "16810f72cec6457f2ed563bc5c3dc6a992bffb65fa2b43f54ed780fb0446fb54",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-4/wpimath-cpp-2027.0.0-alpha-4-linuxsystemcore.zip",
        sha256 = "145ac3c8a9f0ba5bf0f279c83353ffa7625afad436394d504cd4c36718626534",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-4/wpimath-cpp-2027.0.0-alpha-4-linuxsystemcorestatic.zip",
        sha256 = "36148bf772f455010e437a06aa116b6976ef3ab26f2aad0e05a3b00b79ad62be",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-4/wpimath-cpp-2027.0.0-alpha-4-linuxsystemcoredebug.zip",
        sha256 = "512820988f1c21b91f111fab86f1a9f36882ac98279c845fe39733adbe347e38",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-4/wpimath-cpp-2027.0.0-alpha-4-linuxsystemcorestaticdebug.zip",
        sha256 = "342ef3a7db6650aaba3a2b8726d4eeeff8880c704e1e440e5f671632f7ff5fce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-4/apriltag-cpp-2027.0.0-alpha-4-headers.zip",
        sha256 = "97de2221812edd0c7e56b54bcb741b9725b1fc2bee313998aa359878d75e1bec",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-4/apriltag-cpp-2027.0.0-alpha-4-sources.zip",
        sha256 = "c55cf83c96b608347cd85988d677f287346d964dff0cb78d0179f6707d2bf1dc",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-4/apriltag-cpp-2027.0.0-alpha-4-linuxarm64.zip",
        sha256 = "c5a48cde68fdbc1aed1cb793860de917e06166b797e42f677cdcf2ed0c7bc1ef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-4/apriltag-cpp-2027.0.0-alpha-4-linuxx86-64.zip",
        sha256 = "e0cf4274804edce0b7c90f8cb1e9dfac60cb629f9093f0c4d025c58a681db27a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-4/apriltag-cpp-2027.0.0-alpha-4-osxuniversal.zip",
        sha256 = "f88851d54a828de4a275bd7b1b6e8f887d6afd2fe6ecce72ae67cd97e9897e46",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libapriltag.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libapriltag.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-4/apriltag-cpp-2027.0.0-alpha-4-windowsx86-64.zip",
        sha256 = "4df0ae2686cf31f9d45d1dc128cb35d25ddbb2ed0b675b1a0fd9ac5f845bb9fc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-4/apriltag-cpp-2027.0.0-alpha-4-windowsarm64.zip",
        sha256 = "081937af5a89f658ab2180c054b8942de3e15839747b72c1eb3654a515d239a2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-4/apriltag-cpp-2027.0.0-alpha-4-linuxarm64static.zip",
        sha256 = "7a1bc76aa0c21252107784fc0b084472492573c665703058ca428d0770933ada",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-4/apriltag-cpp-2027.0.0-alpha-4-linuxx86-64static.zip",
        sha256 = "40e45d65f6ab3c24d20ce5aaeafe1ff406d49667864f71fe4892ee6f0f2c1024",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-4/apriltag-cpp-2027.0.0-alpha-4-osxuniversalstatic.zip",
        sha256 = "df1c31ee3519151267fcd6cd7364f1f6404aa766b2163d2317f4b5c8cbaf1f32",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-4/apriltag-cpp-2027.0.0-alpha-4-windowsx86-64static.zip",
        sha256 = "a65138e7b7aa1bb87c18e72bcef04d5002ccdb2f4eb316a00725473db9f22f7f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-4/apriltag-cpp-2027.0.0-alpha-4-windowsarm64static.zip",
        sha256 = "996410f278123fc2b5aa12abe81acb9323967a7608be5ffaa4aec9ff928696f0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-4/apriltag-cpp-2027.0.0-alpha-4-linuxarm64debug.zip",
        sha256 = "7d46300b495a2c1236d4cddaaa3681db2d0a6dfbaac85f9d41620ca14587bf78",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-4/apriltag-cpp-2027.0.0-alpha-4-linuxx86-64debug.zip",
        sha256 = "44fa1c3deb67e5e8a302aee944d95c1debbd47aeb238e00910385da0142a735d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-4/apriltag-cpp-2027.0.0-alpha-4-osxuniversaldebug.zip",
        sha256 = "337589afa48fe2e3b3241d29ecf8e7daa374194846596ab971f967544d575821",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libapriltag.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libapriltag.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-4/apriltag-cpp-2027.0.0-alpha-4-windowsx86-64debug.zip",
        sha256 = "5c61c48817d45c4aab1e44adbeabe0f4f738696c533c50131e7a8eca64cebd88",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-4/apriltag-cpp-2027.0.0-alpha-4-windowsarm64debug.zip",
        sha256 = "093ddee569a507354a660acc1cdbf76a573b8ce2e9cdfcbce8dd5f9fb8e17609",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-4/apriltag-cpp-2027.0.0-alpha-4-linuxarm64staticdebug.zip",
        sha256 = "1a85f3ed27c64c1ba83643cf91bb9cf644b37611971136b8dcca1551e7c4b274",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-4/apriltag-cpp-2027.0.0-alpha-4-linuxx86-64staticdebug.zip",
        sha256 = "b5f6aaad63b3397506193c4aedc17f9dd5c8a1a98d2de19e24ebba632bdb12c9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-4/apriltag-cpp-2027.0.0-alpha-4-osxuniversalstaticdebug.zip",
        sha256 = "1db3ed42e3a7da2bda00078f21496d4ddb0b691ab02fe91149cd1677a83c68bc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-4/apriltag-cpp-2027.0.0-alpha-4-windowsx86-64staticdebug.zip",
        sha256 = "85e2a5094826d06c22753c1ec51065609c2ed645dad44ec10b78f1c66c792723",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-4/apriltag-cpp-2027.0.0-alpha-4-windowsarm64staticdebug.zip",
        sha256 = "a93b4de9f5d5aba31cc14f9a4a4d9946c7bbbe19cd667bdf7fd633361a946b06",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-4/apriltag-cpp-2027.0.0-alpha-4-linuxsystemcore.zip",
        sha256 = "e10dae3eb643d864eb22aca9f917c91f85a0d9bee5ad3336d93e4bebe746a400",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-4/apriltag-cpp-2027.0.0-alpha-4-linuxsystemcorestatic.zip",
        sha256 = "ffeef8016bbcc43f23076d22155d1dbc89104a9cd6063ecd1cd4dafd29b4590a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-4/apriltag-cpp-2027.0.0-alpha-4-linuxsystemcoredebug.zip",
        sha256 = "1290e1d543ca60add7c7fa41d71005f95441e64aa374be5d558a53facd3d17b5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-4/apriltag-cpp-2027.0.0-alpha-4-linuxsystemcorestaticdebug.zip",
        sha256 = "49d6dcec2814b955e3805a3f4f4e832442d5b28ad4527ed2b5b9754bf5ffe2bc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-4/ntcore-cpp-2027.0.0-alpha-4-headers.zip",
        sha256 = "98512451f7c512ece9fb9a2eb00e7a8941acea08e4cf81c1569fe52d5fc134e6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-4/ntcore-cpp-2027.0.0-alpha-4-sources.zip",
        sha256 = "e165be8917ff409c721695d64c51fc880ff0961a54f88505ca5251ba8ee385b8",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-4/ntcore-cpp-2027.0.0-alpha-4-linuxarm64.zip",
        sha256 = "0b87505ab082e798a899513efb62c063fd1f77574e5b25f804f0eb8ae9a44121",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-4/ntcore-cpp-2027.0.0-alpha-4-linuxx86-64.zip",
        sha256 = "45bcbdc6e6e86073df6b0012fcac9eea7860a1b48d9db84096df9001bc428f80",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-4/ntcore-cpp-2027.0.0-alpha-4-osxuniversal.zip",
        sha256 = "341ce08bedb00f1a67cd666a17bd8aebcd9be9d049fc443593ab051f37c04653",
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
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-4/ntcore-cpp-2027.0.0-alpha-4-windowsx86-64.zip",
        sha256 = "8b056af06c6ae272312607e45ef3fd056209331a4c7e7ba16ff5726418e263e7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-4/ntcore-cpp-2027.0.0-alpha-4-windowsarm64.zip",
        sha256 = "2d851260d677240bf8bd6b2a6f12e31078f82ed45cb399b7e75120f53d7cf304",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-4/ntcore-cpp-2027.0.0-alpha-4-linuxarm64static.zip",
        sha256 = "2a25c577553b95dc60bb963fc45c79516af521dac95acf58c5996285d1148b65",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-4/ntcore-cpp-2027.0.0-alpha-4-linuxx86-64static.zip",
        sha256 = "eef3f38434e62551b081f033d2b1943afcf2f53517766068c364d9b67461b87c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-4/ntcore-cpp-2027.0.0-alpha-4-osxuniversalstatic.zip",
        sha256 = "e7ca82537284d3731277057147515cfba07bb14fab6bfbc7021f5287d2f07a8a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-4/ntcore-cpp-2027.0.0-alpha-4-windowsx86-64static.zip",
        sha256 = "1cf87165e10efba1f2acef55a9ab4e6bcbaaa30d3d521413d914518dcbe7ab9c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-4/ntcore-cpp-2027.0.0-alpha-4-windowsarm64static.zip",
        sha256 = "8a17902dd817648001d1773614ff0a3aba5b8ec19e1ee9f9dce750dbd0ae51d3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-4/ntcore-cpp-2027.0.0-alpha-4-linuxarm64debug.zip",
        sha256 = "ef85038e9898114a72108ec1e31658a6ea9b6eb9633c0c5dc5c82abaa8c15cc4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-4/ntcore-cpp-2027.0.0-alpha-4-linuxx86-64debug.zip",
        sha256 = "effd927644a103e2f646cf0d7d7aea20c077dde5760d85d73db9b5a0ca823f8c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-4/ntcore-cpp-2027.0.0-alpha-4-osxuniversaldebug.zip",
        sha256 = "b7dc0cb0b1818cc205fcad70a24f6387401d3b13a4cd2c6048a8dcaefd940907",
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
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-4/ntcore-cpp-2027.0.0-alpha-4-windowsx86-64debug.zip",
        sha256 = "2b04089ab091ad32a1e72ae036d8c832b00420ade809debf95f8b1f53b587e0c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-4/ntcore-cpp-2027.0.0-alpha-4-windowsarm64debug.zip",
        sha256 = "c7f2c7e9abef470f0ef3156b5dbf9191c8d7cf5dc6d3ecd38663f84c35cae033",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-4/ntcore-cpp-2027.0.0-alpha-4-linuxarm64staticdebug.zip",
        sha256 = "45e00569b95b920895f3bbb73c26a038631d0f252e58d466f4a6c776ff86f618",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-4/ntcore-cpp-2027.0.0-alpha-4-linuxx86-64staticdebug.zip",
        sha256 = "f5e5745bd34ff88e1591935ea37a27ecdf628b9bef3ca89667551c8ff6cc44bb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-4/ntcore-cpp-2027.0.0-alpha-4-osxuniversalstaticdebug.zip",
        sha256 = "1d4054a91748a44c344030929b593954361a32134068c6130f624c770b42879c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-4/ntcore-cpp-2027.0.0-alpha-4-windowsx86-64staticdebug.zip",
        sha256 = "dcc5d967fd2f704c019cf52539ee039a748b6320ba236b89e3012f1138b84d9b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-4/ntcore-cpp-2027.0.0-alpha-4-windowsarm64staticdebug.zip",
        sha256 = "eb8cdbf73ebb0f33f7ad0a2fb8307248d2215088ff0b8eb81d66d8cf04973ac1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-4/ntcore-cpp-2027.0.0-alpha-4-linuxsystemcore.zip",
        sha256 = "170226b1c908f72eae53ef62ab07db77b71f53f78290639e748b3417dd7e6489",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-4/ntcore-cpp-2027.0.0-alpha-4-linuxsystemcorestatic.zip",
        sha256 = "1b7aed10854f8409b92aa02fba32c077beb6b5f3cdfa5d56db1d714ad9551bff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-4/ntcore-cpp-2027.0.0-alpha-4-linuxsystemcoredebug.zip",
        sha256 = "3968e69b897495a36ebd565deff71375d5ff91fb444267abf3802561c5fca3b4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-4/ntcore-cpp-2027.0.0-alpha-4-linuxsystemcorestaticdebug.zip",
        sha256 = "abf62c08a44881039eca373415ece8024428fef93d1a55efbe7bc1394d883439",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-4/hal-cpp-2027.0.0-alpha-4-headers.zip",
        sha256 = "0fb831e507d499eb90632b3f808e3af427133ea8f1505eec3bbcf5b6e54ed2ad",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-4/hal-cpp-2027.0.0-alpha-4-sources.zip",
        sha256 = "8feb0bd9d0bb6a79618a7401ed8ee0f0cce76b2059403d383453ccc3ec0c1149",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-4/hal-cpp-2027.0.0-alpha-4-linuxarm64.zip",
        sha256 = "eea045ea7d6f351f261bd5aa5d05e652fc397218d66ac42c8b37d8a5229f3a1f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-4/hal-cpp-2027.0.0-alpha-4-linuxx86-64.zip",
        sha256 = "3c7918f47cd3d4cb10754f549015c5efdbb255d60d0f607c2e437cafd499e190",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-4/hal-cpp-2027.0.0-alpha-4-osxuniversal.zip",
        sha256 = "3cf76f406937377564162d78490b17a732887649bb8b81ce14c9cb7db72cfd90",
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
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-4/hal-cpp-2027.0.0-alpha-4-windowsx86-64.zip",
        sha256 = "c5964b663959516aadfe1c1b317a4b5a962005509819abf1808099130c955b5a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-4/hal-cpp-2027.0.0-alpha-4-windowsarm64.zip",
        sha256 = "38e410914503df2e573fa4f53d41f9e5cac0d1a86aa9d1cf84d74f40a0ad6945",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-4/hal-cpp-2027.0.0-alpha-4-linuxarm64static.zip",
        sha256 = "e6ec662e0476d03a2a4b524d323ceebd6cfa83371d88698c7597b4e6eb950e45",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-4/hal-cpp-2027.0.0-alpha-4-linuxx86-64static.zip",
        sha256 = "f9e2fa942d4c1b805f7b677863d40de41589fa6b9e05e099e469bbecab5eafd6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-4/hal-cpp-2027.0.0-alpha-4-osxuniversalstatic.zip",
        sha256 = "edd517812e9813c00aa82ddbd1901052e62fe000c15b8b6f8ef0200052637380",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-4/hal-cpp-2027.0.0-alpha-4-windowsx86-64static.zip",
        sha256 = "5fa276d551ea089a088332406bb74c24a579f16e44277304680a4707ce487a89",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-4/hal-cpp-2027.0.0-alpha-4-windowsarm64static.zip",
        sha256 = "2a6fe5f253c92531c300454b3c52f626fa7217e89298f2bbb0255d39b9350fbd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-4/hal-cpp-2027.0.0-alpha-4-linuxarm64debug.zip",
        sha256 = "4274565c26d32688c4417841fc1cfdd26ab705a8d670b468f0f38be25092de30",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-4/hal-cpp-2027.0.0-alpha-4-linuxx86-64debug.zip",
        sha256 = "3bac8fecece9b96875c6a481cd7f53562e3bb9969394966a24048440bbe678b4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-4/hal-cpp-2027.0.0-alpha-4-osxuniversaldebug.zip",
        sha256 = "b0798e34572272003b94b863c65b1ad742cdd9c21ba869e03e86fa782b76d5c3",
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
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-4/hal-cpp-2027.0.0-alpha-4-windowsx86-64debug.zip",
        sha256 = "ad3c600a7f3a3bfa922fb5bfa0110bc29a131ce77064933ccdc9ab1483078312",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-4/hal-cpp-2027.0.0-alpha-4-windowsarm64debug.zip",
        sha256 = "2df059bbfe5b570abd33892bc36d36671926384bde3de3deddcae39eee8c8030",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-4/hal-cpp-2027.0.0-alpha-4-linuxarm64staticdebug.zip",
        sha256 = "42b20c38d2b45298eb36fbbc0ad5150d1ed218fd5fe5d567762dded3fb8122ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-4/hal-cpp-2027.0.0-alpha-4-linuxx86-64staticdebug.zip",
        sha256 = "80958fa4c57101eb56e91c717a64c7bc025acb7d6c55ce8fd9d1b4f9a2ab48d3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-4/hal-cpp-2027.0.0-alpha-4-osxuniversalstaticdebug.zip",
        sha256 = "c8d5bc878f2910f0d044a55d699a98cb6a580db8a4558a19ef0d62cc89e65f90",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-4/hal-cpp-2027.0.0-alpha-4-windowsx86-64staticdebug.zip",
        sha256 = "22e3e38fbcfc18b69cb26064dcd106d00d23b2885bf712ea394fd8e9119c8848",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-4/hal-cpp-2027.0.0-alpha-4-windowsarm64staticdebug.zip",
        sha256 = "3400786b764cfec10d1a4fa904affb69a39f26678d180595a3b4072424ba0ce8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-4/hal-cpp-2027.0.0-alpha-4-linuxsystemcore.zip",
        sha256 = "553a019d13c053eda6d0da7693e6bb52dfc51a6587bd08f840573adf544394c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-4/hal-cpp-2027.0.0-alpha-4-linuxsystemcorestatic.zip",
        sha256 = "64f9183966391c81db814330eae4bb8914519406f757e70a8efe9e96657953d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-4/hal-cpp-2027.0.0-alpha-4-linuxsystemcoredebug.zip",
        sha256 = "ffcf19f25e7fa588876704df31d1711e69f3932bc15005d757f0236ed012d357",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-4/hal-cpp-2027.0.0-alpha-4-linuxsystemcorestaticdebug.zip",
        sha256 = "74de8f08861aba54267eb4f35f9fc6891871db00a825f0b0e0356391970bdf3c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-4/cscore-cpp-2027.0.0-alpha-4-headers.zip",
        sha256 = "74feb1bca77327c5ce699c9ec58f42ed96259ebce385a7c4634188a5102ff050",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-4/cscore-cpp-2027.0.0-alpha-4-sources.zip",
        sha256 = "41f3ee17107a91ed829a2d05db210d43607527bcd025320579a62fecf0f21244",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-4/cscore-cpp-2027.0.0-alpha-4-linuxarm64.zip",
        sha256 = "29ce7e891efb03474705752c486ab99b5cd8cba3a7e89b6674d7d2e0780cad9e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-4/cscore-cpp-2027.0.0-alpha-4-linuxx86-64.zip",
        sha256 = "d70ae66b2a7ee7b4edee3761dcd93d675848ebbdf506d4c08dbe59e133efee50",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-4/cscore-cpp-2027.0.0-alpha-4-osxuniversal.zip",
        sha256 = "88b961313b1cc35926188af65097a79bdc7fa91feec29a6b1bc92854be6e8e94",
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
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-4/cscore-cpp-2027.0.0-alpha-4-windowsx86-64.zip",
        sha256 = "2e1814aef74dbb3bf6f160afc8011aeaec40f32690fa2561d2e45a314e65869e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-4/cscore-cpp-2027.0.0-alpha-4-windowsarm64.zip",
        sha256 = "4510a53c0e89949b67783f29dae85e0c8c4eda38d367a4e003237623c7891e11",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-4/cscore-cpp-2027.0.0-alpha-4-linuxarm64static.zip",
        sha256 = "68b8e2212e907a9c4052be183be69a07e9064fe6b52aa6725470f08485dabdb3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-4/cscore-cpp-2027.0.0-alpha-4-linuxx86-64static.zip",
        sha256 = "fcee2216520a014333f3948856f3cadb53ed5aa48567c426354f9b32206c1233",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-4/cscore-cpp-2027.0.0-alpha-4-osxuniversalstatic.zip",
        sha256 = "7d22b5fa47ad91a3b2e36142e78efce778aca8e8ddad5fcaff21c52edcf83311",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-4/cscore-cpp-2027.0.0-alpha-4-windowsx86-64static.zip",
        sha256 = "42676a14cd3783a385a5997029b0c0ec665a73c2206b7075b158891365bf2010",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-4/cscore-cpp-2027.0.0-alpha-4-windowsarm64static.zip",
        sha256 = "b1c38d5434ae8a1a6026b5a0124d5d48601bd1b7fac6aea9d41592489ba9af2e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-4/cscore-cpp-2027.0.0-alpha-4-linuxarm64debug.zip",
        sha256 = "1a9b94a7e2e1700b3d23607ab346c69be1f56001053cbe8ad32a1c5f52d904e0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-4/cscore-cpp-2027.0.0-alpha-4-linuxx86-64debug.zip",
        sha256 = "f45e42fc6907084caf8cc909ca13ac229ffbef112b43b2d04eb2c0c368f6119b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-4/cscore-cpp-2027.0.0-alpha-4-osxuniversaldebug.zip",
        sha256 = "0862d13c3b836cda609f821687fa90c9120caa9e983f259f3e21518878a3f10b",
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
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-4/cscore-cpp-2027.0.0-alpha-4-windowsx86-64debug.zip",
        sha256 = "a16301ceee173280757303a61a290d593fd0245273f2b269ef99b1a91c6f2a63",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-4/cscore-cpp-2027.0.0-alpha-4-windowsarm64debug.zip",
        sha256 = "73ea19422f1a68c9f70936504afec6fa5d0791e34f00f1500ebb889717ec7df5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-4/cscore-cpp-2027.0.0-alpha-4-linuxarm64staticdebug.zip",
        sha256 = "ead3b52784ff0b25d5573fc1389d58966e29b38bc52495eb733e72d7d6c2ab2f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-4/cscore-cpp-2027.0.0-alpha-4-linuxx86-64staticdebug.zip",
        sha256 = "117691502b04807911f2402a687400f97ba6223f1dc1dfbd31ff50b7c9ae0939",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-4/cscore-cpp-2027.0.0-alpha-4-osxuniversalstaticdebug.zip",
        sha256 = "dc3b2aab48af35028856b53d47df5476bff5f0c38ba3c09d12c9782d97d26a9a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-4/cscore-cpp-2027.0.0-alpha-4-windowsx86-64staticdebug.zip",
        sha256 = "fcc38723d796040914b35362982f81f27b49281eeb8e584cdcb58abf01a740d0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-4/cscore-cpp-2027.0.0-alpha-4-windowsarm64staticdebug.zip",
        sha256 = "da34ed479c4ee02caedef80f27aef9f5423ff6fd186e9ee6f68cab476dae4957",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-4/cscore-cpp-2027.0.0-alpha-4-linuxsystemcore.zip",
        sha256 = "9ea7ceae689bed2cb49537d851bcdd9246580936e4897ca8596206fb779c1803",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-4/cscore-cpp-2027.0.0-alpha-4-linuxsystemcorestatic.zip",
        sha256 = "82c4445adeb136dcd2a8797799ab9785a7321f3680048c27aaa3e10cb100e23f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-4/cscore-cpp-2027.0.0-alpha-4-linuxsystemcoredebug.zip",
        sha256 = "a498e4819d6599e5013cd0af75cc5c13fe3a49b6fe8424121eda7ce40811620b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-4/cscore-cpp-2027.0.0-alpha-4-linuxsystemcorestaticdebug.zip",
        sha256 = "fbddb969d6d8ef7d1606f73738a52dc9518dcb7c78d2713457d651065057ae92",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-4/cameraserver-cpp-2027.0.0-alpha-4-headers.zip",
        sha256 = "02c71cbb1703f3973c464cf6d11444b72589bb51f6faf59c624be2656a8a97f7",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-4/cameraserver-cpp-2027.0.0-alpha-4-sources.zip",
        sha256 = "e29fab3778425adffdaeb6433bedaab8b016c3c46bb6472f1a4c1929ba22bbf7",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-4/cameraserver-cpp-2027.0.0-alpha-4-linuxarm64.zip",
        sha256 = "dfcc0598a800119f119d2a070cf058391c0bc65730d569426f6598b5fe061c93",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-4/cameraserver-cpp-2027.0.0-alpha-4-linuxx86-64.zip",
        sha256 = "3d07e709c8f8f515f4b0848606cdad38c7ac54167e7d45f4bb4a5c20090efe2d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-4/cameraserver-cpp-2027.0.0-alpha-4-osxuniversal.zip",
        sha256 = "fd79634db23f03c6340af7972bc22e3bc9e98b0f8e113fd5336fe2907235d34a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libcameraserver.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcameraserver.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-4/cameraserver-cpp-2027.0.0-alpha-4-windowsx86-64.zip",
        sha256 = "9f0851f1d4c7df265b57ed118b6872403f332b31c003db200f3a1eb40804adc7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-4/cameraserver-cpp-2027.0.0-alpha-4-windowsarm64.zip",
        sha256 = "eb822c9854c99645fe54496cb3cd3bc93e244e5bf2aeba346121821213c8bfa9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-4/cameraserver-cpp-2027.0.0-alpha-4-linuxarm64static.zip",
        sha256 = "ab00e8c656e50d0cc6cede391a48495e1421dc34c6abc0f294f988420290ed26",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-4/cameraserver-cpp-2027.0.0-alpha-4-linuxx86-64static.zip",
        sha256 = "5b075bb12cb7c1bd6ed07a1818423d28093cbe525d3a512027e60cb8b1b66637",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-4/cameraserver-cpp-2027.0.0-alpha-4-osxuniversalstatic.zip",
        sha256 = "98b26ffa3c3e65722771c2106ae1645caf46880853da686752f2da0e2c244b5e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-4/cameraserver-cpp-2027.0.0-alpha-4-windowsx86-64static.zip",
        sha256 = "a9ae9593b96e48205a2b2130b9fbe2cd63bf1d673928560c2f0da6a39f8edba8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-4/cameraserver-cpp-2027.0.0-alpha-4-windowsarm64static.zip",
        sha256 = "a47f63517ebeba78633df32d90e245dd7622ed1fcee3e2e3fcf4dc835756f0ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-4/cameraserver-cpp-2027.0.0-alpha-4-linuxarm64debug.zip",
        sha256 = "85c7256a6eef27623f08133aa3070dec877d58ce468d2ccf132461042362efb6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-4/cameraserver-cpp-2027.0.0-alpha-4-linuxx86-64debug.zip",
        sha256 = "2437fa882a3351cb46e52b63de78834e598214d0368bf2875ebcbd70ea8dd930",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-4/cameraserver-cpp-2027.0.0-alpha-4-osxuniversaldebug.zip",
        sha256 = "db5b48342044aaf7ba10541c5f2841070444e4ffe98c3170062474904ea7b016",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libcameraserver.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcameraserver.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-4/cameraserver-cpp-2027.0.0-alpha-4-windowsx86-64debug.zip",
        sha256 = "8d30dfd13919b40daa8a392939d024d9e24e23a36ac0378e45e3b2d247379a58",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-4/cameraserver-cpp-2027.0.0-alpha-4-windowsarm64debug.zip",
        sha256 = "e73b711951869c69dcc0170150502468bb681d7a558f8a1bcd8678d09872cb3f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-4/cameraserver-cpp-2027.0.0-alpha-4-linuxarm64staticdebug.zip",
        sha256 = "aa09e90d6532e0cb9c04fae5891c5fd682470c24acb8e2da96a76f53f35313b0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-4/cameraserver-cpp-2027.0.0-alpha-4-linuxx86-64staticdebug.zip",
        sha256 = "d0327821cf6b7c99ba6f873d28f09fc9efc240ad6743df065311d9e79ce1dcf5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-4/cameraserver-cpp-2027.0.0-alpha-4-osxuniversalstaticdebug.zip",
        sha256 = "d439dd9e231b5004ade3b87f47978e4047164b2062dac93289157f03504eb64b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-4/cameraserver-cpp-2027.0.0-alpha-4-windowsx86-64staticdebug.zip",
        sha256 = "7f0e058ce02affcf433db41c3f4eaace1c6bd3f358db5556b63cf2d5a32f0160",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-4/cameraserver-cpp-2027.0.0-alpha-4-windowsarm64staticdebug.zip",
        sha256 = "b19b1b9539631c03d1e4129795cc57cb762062bd24d077365f3d5365b54a41c4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-4/cameraserver-cpp-2027.0.0-alpha-4-linuxsystemcore.zip",
        sha256 = "6e1721d005e8feef48185564b5d3d3117fa7f12723932ba18655766dc7460dca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-4/cameraserver-cpp-2027.0.0-alpha-4-linuxsystemcorestatic.zip",
        sha256 = "9076a5221525004c8dca321d6dec40ef0e46f91d35a3e0dc03cb97308b49fe85",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-4/cameraserver-cpp-2027.0.0-alpha-4-linuxsystemcoredebug.zip",
        sha256 = "dff261aacde198e76d615da7c0ec68635bcddf6ecedf10c438e46f5b7976a9ad",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-4/cameraserver-cpp-2027.0.0-alpha-4-linuxsystemcorestaticdebug.zip",
        sha256 = "c18d7bf22b3699dea2bfc541091082cc876a5ce2aa8fd020a402eefdb9995921",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-4/wpilibc-cpp-2027.0.0-alpha-4-headers.zip",
        sha256 = "ba536e40430d750dcabfeb3e2e17672654829882d1a7c4ba10f14524c56b4e7d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-4/wpilibc-cpp-2027.0.0-alpha-4-sources.zip",
        sha256 = "64b48c4a5c6ca19e280b47663201c4267be13d93d9e3f8beed83801d4a2d2cd6",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-4/wpilibc-cpp-2027.0.0-alpha-4-linuxarm64.zip",
        sha256 = "98a7b9be2ea6f8387babd6c0992c3f9bd2b6b793fd322fa96533f0629ff193a0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-4/wpilibc-cpp-2027.0.0-alpha-4-linuxx86-64.zip",
        sha256 = "e3ffa27daff49c289593c893e43ca133c4366baa89feee3b2983b0994f5eb5f2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-4/wpilibc-cpp-2027.0.0-alpha-4-osxuniversal.zip",
        sha256 = "d489bd909bdd7617b74994d3e3d693a4d4925f2ac7c8b7fee581a3db249de917",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpilibc.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpilibc.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-4/wpilibc-cpp-2027.0.0-alpha-4-windowsx86-64.zip",
        sha256 = "13326480c1c6460ce96e411292136e2d813d7f03d49e4839533459e16dc06622",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-4/wpilibc-cpp-2027.0.0-alpha-4-windowsarm64.zip",
        sha256 = "33e8c66237373649419f05617302aa50d50442ce6bc02005a93128080ac26849",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-4/wpilibc-cpp-2027.0.0-alpha-4-linuxarm64static.zip",
        sha256 = "89cca44eb45fc7242843767487ffa5812c4db965f183a36bd7bba043cff9237e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-4/wpilibc-cpp-2027.0.0-alpha-4-linuxx86-64static.zip",
        sha256 = "eb185472caa024e525fb0af0cfe9ba7ad26faa0eef7c2864eed98ae70c24a39d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-4/wpilibc-cpp-2027.0.0-alpha-4-osxuniversalstatic.zip",
        sha256 = "e79ea7d45e0dfd6ff5ddb9dc9c1d83a4c3d111783bb186a6e3285cd7ecdf6d3d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-4/wpilibc-cpp-2027.0.0-alpha-4-windowsx86-64static.zip",
        sha256 = "9a995b11eca62af9d651ec9ef7f316e72239b5af8c52ca41d99ff9d4fee3b3c9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-4/wpilibc-cpp-2027.0.0-alpha-4-windowsarm64static.zip",
        sha256 = "f8b72e31e884ac466436312e7788b0134f4edd432ef6c823a86f9e1f3649f980",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-4/wpilibc-cpp-2027.0.0-alpha-4-linuxarm64debug.zip",
        sha256 = "ef68f1e8b7f0a9f3ac84ea9bb7c8d0098652cff7c40fa1ef09ee2e0a689fdde8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-4/wpilibc-cpp-2027.0.0-alpha-4-linuxx86-64debug.zip",
        sha256 = "d16d7a7c9abbb2157fdbadb797877fec5d157d5c2db0692b43e8c013e551e18e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-4/wpilibc-cpp-2027.0.0-alpha-4-osxuniversaldebug.zip",
        sha256 = "8d53bec880253e270674ba8aa956f28b5507c059e2b91a8c2ddf9d27dd55c5be",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpilibc.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpilibc.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-4/wpilibc-cpp-2027.0.0-alpha-4-windowsx86-64debug.zip",
        sha256 = "ffe6751197035a1c7950c9de02313a46f6b90254c3f6ebaecedfc61a7af621ae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-4/wpilibc-cpp-2027.0.0-alpha-4-windowsarm64debug.zip",
        sha256 = "aeaa9b482d74ff4562fae1daad393160593c68cbc8eba8aff88a1be6437c2979",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-4/wpilibc-cpp-2027.0.0-alpha-4-linuxarm64staticdebug.zip",
        sha256 = "af7c9c456f9d68f946019ff2c48f5866b28b11794fd844c60c58b79ee58b9920",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-4/wpilibc-cpp-2027.0.0-alpha-4-linuxx86-64staticdebug.zip",
        sha256 = "a3306a56f1cb4e55531d067423a0be4822d40f281f8b3cd8e1382594d99fe5e9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-4/wpilibc-cpp-2027.0.0-alpha-4-osxuniversalstaticdebug.zip",
        sha256 = "78131f95a17a6596f566b3fb5e9b0820784af3d7bd9e7c831ea5097a2863abff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-4/wpilibc-cpp-2027.0.0-alpha-4-windowsx86-64staticdebug.zip",
        sha256 = "3c78ef9a41a2914edf6b9cd0a9ef623e15c0c33ae8b89a6d0eeb324c203777e0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-4/wpilibc-cpp-2027.0.0-alpha-4-windowsarm64staticdebug.zip",
        sha256 = "03774f4e0ff497d1132c5603c5014b8ab08970992e72b49052ebdaaa474f1be7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-4/wpilibc-cpp-2027.0.0-alpha-4-linuxsystemcore.zip",
        sha256 = "2566bd5a4572550fc5d73bbecf71026b3fbc53658fbc593a2327a3f7b541fa0c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-4/wpilibc-cpp-2027.0.0-alpha-4-linuxsystemcorestatic.zip",
        sha256 = "aa63c1128c165a6d6d6f91ce102ce43cfa4d8a576faff2982138521dc7b13b69",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-4/wpilibc-cpp-2027.0.0-alpha-4-linuxsystemcoredebug.zip",
        sha256 = "209e7782a5dca87ffe7e29484fd64686a765b89121a89451083ba5abc35da429",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-4/wpilibc-cpp-2027.0.0-alpha-4-linuxsystemcorestaticdebug.zip",
        sha256 = "1b81e1ae2c357489fca4b61fc52f094275f4fa35321a78abc13daa71a130e4a2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-4/commandsv2-cpp-2027.0.0-alpha-4-headers.zip",
        sha256 = "2ee04e574775cdc7c9d08c852a571a1c1fa08e4ee33367dd485c49b67f466fc7",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-4/commandsv2-cpp-2027.0.0-alpha-4-sources.zip",
        sha256 = "ba1ef891c020c29ad08194fd793cb9a2772d2f2dcacb4359caa508c6d05ad7d0",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-4/commandsv2-cpp-2027.0.0-alpha-4-linuxarm64.zip",
        sha256 = "707d639320adf2cc9931e7dd72f889cec58de15071a075f94ba20878134256c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-4/commandsv2-cpp-2027.0.0-alpha-4-linuxx86-64.zip",
        sha256 = "600884ffb61fa183fd518c7b7aa629aa8320667a246661dacd4a7031b8a73add",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-4/commandsv2-cpp-2027.0.0-alpha-4-osxuniversal.zip",
        sha256 = "22de61bcb6e278e358065a2a55fd9754d7cfb519ebab7335e4822bd92945fdc6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libcommandsv2.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libcameraserver.dylib @rpath/libcameraserver.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libcommandsv2.dylib",
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
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-4/commandsv2-cpp-2027.0.0-alpha-4-windowsx86-64.zip",
        sha256 = "dc54eed714bca770acc9921935cb7dec93ae751dd1256e808734d96adb68e731",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-4/commandsv2-cpp-2027.0.0-alpha-4-windowsarm64.zip",
        sha256 = "c1d162d32397c19a2cf23d35355b7f92ea4abb0a0a0235bb7b372ed1b5793bda",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-4/commandsv2-cpp-2027.0.0-alpha-4-linuxarm64static.zip",
        sha256 = "aec700b8fbd0470ebc22cc0549cb337a30d625fd5e962be8b5643703d29e6ce4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-4/commandsv2-cpp-2027.0.0-alpha-4-linuxx86-64static.zip",
        sha256 = "da54dc5a0f487511809c6f58135757cc2f9889a606223d771f266301d2ea3905",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-4/commandsv2-cpp-2027.0.0-alpha-4-osxuniversalstatic.zip",
        sha256 = "21f0e8794641282bc9695af0ab1aff1a371921a4f37d7c96299927e253de6177",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-4/commandsv2-cpp-2027.0.0-alpha-4-windowsx86-64static.zip",
        sha256 = "e481258bb4d79c375d63b88da3add7a6435fcb84630279a4a27ad87ba5a758a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-4/commandsv2-cpp-2027.0.0-alpha-4-windowsarm64static.zip",
        sha256 = "94b316d81f91b62f5e61ab793cec399e7eb0d3d983127093c1e342614850e231",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-4/commandsv2-cpp-2027.0.0-alpha-4-linuxarm64debug.zip",
        sha256 = "935a5ee46f3add03f449169efac0bafcfc95f7c52301b9a956e803631acf1d0b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-4/commandsv2-cpp-2027.0.0-alpha-4-linuxx86-64debug.zip",
        sha256 = "708cbea0c60f61db52dbca409e969ee6d7d6a6d475b22fcbca170b84f2e34b0d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-4/commandsv2-cpp-2027.0.0-alpha-4-osxuniversaldebug.zip",
        sha256 = "22fbaede869256482246b3bd985a9baf76348b4bc9534b0dccb679e29acbb69f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libcommandsv2.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libcameraserver.dylib @rpath/libcameraserver.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libcommandsv2.dylib",
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
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-4/commandsv2-cpp-2027.0.0-alpha-4-windowsx86-64debug.zip",
        sha256 = "8ad16ff21069c49fb44e45947b9a2bfbb3b9824f7530e54bcbbdb7d60fe307d6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-4/commandsv2-cpp-2027.0.0-alpha-4-windowsarm64debug.zip",
        sha256 = "ee9fbe3f02156c68d495a68f45158135ecbcf4b5f7e0d8a95a375b5a9749fd62",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-4/commandsv2-cpp-2027.0.0-alpha-4-linuxarm64staticdebug.zip",
        sha256 = "780454714e9687e74304aa7f5ee09173c74edd246557e45297816cd7cc28eef0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-4/commandsv2-cpp-2027.0.0-alpha-4-linuxx86-64staticdebug.zip",
        sha256 = "4ecdc4c463248b6e624b6f6b1fe16e982854cdb823c304d8701dab477637e8ea",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-4/commandsv2-cpp-2027.0.0-alpha-4-osxuniversalstaticdebug.zip",
        sha256 = "c12645b30e504ddd283d383bb4a56ae9b9be4f3a26b995ccf11669bf32fbcae2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-4/commandsv2-cpp-2027.0.0-alpha-4-windowsx86-64staticdebug.zip",
        sha256 = "bdee5222673902ee2b6b2411842c8aad642bccd8316bba8a9fe274d7182d88d7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-4/commandsv2-cpp-2027.0.0-alpha-4-windowsarm64staticdebug.zip",
        sha256 = "b2772baff1f2d58809b92f4944001172121a93db085779625186b29ac0448f37",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-4/commandsv2-cpp-2027.0.0-alpha-4-linuxsystemcore.zip",
        sha256 = "7c04561f668549f6171945a315d7d4faddfc3b99a4c7c1acef98a3d75431d96b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-4/commandsv2-cpp-2027.0.0-alpha-4-linuxsystemcorestatic.zip",
        sha256 = "8d9221dc9b75c6dec5e606c7004fd3946c94997f3f6c33adfedd045df5efe842",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-4/commandsv2-cpp-2027.0.0-alpha-4-linuxsystemcoredebug.zip",
        sha256 = "af84026b6fe9bd4daed7f642b64c824daf356b74db3f3f0db53b66e41d686ac4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-4/commandsv2-cpp-2027.0.0-alpha-4-linuxsystemcorestaticdebug.zip",
        sha256 = "ead973858658d1677f63ea6e8a37ea04de53536906964e66a750bb374933eaa1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-4/romiVendordep-cpp-2027.0.0-alpha-4-headers.zip",
        sha256 = "d46aae117ff6464509e97c1b663c8ddb12b1ba7d02ba90ea001ee2817ca25350",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-4/romiVendordep-cpp-2027.0.0-alpha-4-sources.zip",
        sha256 = "8ce3501c1c35c4f798512ced7c4f0c759fdc6f292c2d567e27e7104428ef123b",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-4/romiVendordep-cpp-2027.0.0-alpha-4-linuxarm64.zip",
        sha256 = "f177932bb25fd51db17eaeb165219830c8a3f76e9d1ba7767c1d78799243014b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-4/romiVendordep-cpp-2027.0.0-alpha-4-linuxx86-64.zip",
        sha256 = "4c7c08af2db80b138624692d2aeaf3823dc05323278cba5748ef9c0087f99fe3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-4/romiVendordep-cpp-2027.0.0-alpha-4-osxuniversal.zip",
        sha256 = "88a71430842053cbaf842a553e1ffde9dac5527fbcc6e9805941645c5b63ba7a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libromiVendordep.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libromiVendordep.dylib",
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
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-4/romiVendordep-cpp-2027.0.0-alpha-4-windowsx86-64.zip",
        sha256 = "202ee5fa025ebfc66f1b6fcbc4300aced2bc6380722012101554318ece011af0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-4/romiVendordep-cpp-2027.0.0-alpha-4-windowsarm64.zip",
        sha256 = "973f5af9933e0b94fd05c3b8a77afb55678c790d29fa42beafd3635e78d814d9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-4/romiVendordep-cpp-2027.0.0-alpha-4-linuxarm64static.zip",
        sha256 = "9bf00b4c1ca78d5f4af551553b50bd2ca96a28b083ed16e98f9f3352f593afbd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-4/romiVendordep-cpp-2027.0.0-alpha-4-linuxx86-64static.zip",
        sha256 = "e121b1e48486a9dc9e48a15268b53d26e9c3c7b3761a3400fd988b4afe6cbb47",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-4/romiVendordep-cpp-2027.0.0-alpha-4-osxuniversalstatic.zip",
        sha256 = "1708943caf9021b28738fc649c90ded0de7d58e9cc61ca60762e7ff1cffc78cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-4/romiVendordep-cpp-2027.0.0-alpha-4-windowsx86-64static.zip",
        sha256 = "54fb14993f46b4596c9406dc658f01bbaf385e5c44d25f1058ade85b44811d74",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-4/romiVendordep-cpp-2027.0.0-alpha-4-windowsarm64static.zip",
        sha256 = "c12c96fa6f5a95f45f6999bb33c406cbb9f3fe4c02fd85f27eb4b6e76d85d1bf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-4/romiVendordep-cpp-2027.0.0-alpha-4-linuxarm64debug.zip",
        sha256 = "68f942e87a73fc75440e85992c39fa0783542a060147ad2cc0852308e967174b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-4/romiVendordep-cpp-2027.0.0-alpha-4-linuxx86-64debug.zip",
        sha256 = "79a37df0358a11dca9f4706603595cf5891071edc757f23c019420f658125272",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-4/romiVendordep-cpp-2027.0.0-alpha-4-osxuniversaldebug.zip",
        sha256 = "e3e295ec203a2c902874e8916079790ade387c264d26d218aaac4778483a0144",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libromiVendordep.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libromiVendordep.dylib",
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
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-4/romiVendordep-cpp-2027.0.0-alpha-4-windowsx86-64debug.zip",
        sha256 = "484590090dc0dfeb5d7c6cf6e93101ec4757a7d5941877ed979fb0c1e17a5568",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-4/romiVendordep-cpp-2027.0.0-alpha-4-windowsarm64debug.zip",
        sha256 = "b00eae0f682e12ee9d46116f00977cbec0c1ee1d4adbd236c77d62230f6ed302",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-4/romiVendordep-cpp-2027.0.0-alpha-4-linuxarm64staticdebug.zip",
        sha256 = "c5556a6b5ddb26224d063dbb044c247013ee4221236b152371361c07ca536198",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-4/romiVendordep-cpp-2027.0.0-alpha-4-linuxx86-64staticdebug.zip",
        sha256 = "cc0bdf425ddf72f6b741e0f60d8b9f3d0200c0c9a6126226d40e996bbf91ab7e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-4/romiVendordep-cpp-2027.0.0-alpha-4-osxuniversalstaticdebug.zip",
        sha256 = "1e0abf800cd773590591d79d865fb36b479409a394c97aade0debb771200f47b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-4/romiVendordep-cpp-2027.0.0-alpha-4-windowsx86-64staticdebug.zip",
        sha256 = "013853e09f52926b6525e4649521b89270baf428b66232fc5611ca6860c6fc0f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-4/romiVendordep-cpp-2027.0.0-alpha-4-windowsarm64staticdebug.zip",
        sha256 = "895d91203b90af55fb31386e8ef2384e639b2e26e5d8fcdc38d6db28a683e4f4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-4/romiVendordep-cpp-2027.0.0-alpha-4-linuxsystemcore.zip",
        sha256 = "c98cdba455a881e2b116b72a704140efc5576a9c365322dcbd6d7c8d51e21944",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-4/romiVendordep-cpp-2027.0.0-alpha-4-linuxsystemcorestatic.zip",
        sha256 = "e37b77ec3f43fe0a4fb01eb82bdc895dbd3f63d923330092a4043950ebe55714",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-4/romiVendordep-cpp-2027.0.0-alpha-4-linuxsystemcoredebug.zip",
        sha256 = "3f756ed08c073249719b3b23b93dba80dcdbf4a995d30fa04c1705fe533e9f78",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-4/romiVendordep-cpp-2027.0.0-alpha-4-linuxsystemcorestaticdebug.zip",
        sha256 = "6c2cce9bdd1b6b0ead94d7a105614116db7c60d389e6736dc201c6ecc67d8730",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-4/xrpVendordep-cpp-2027.0.0-alpha-4-headers.zip",
        sha256 = "0c39703362e3cbe3681d8f1d0ac70552c97d513f6f6c4a496c07b113f7cd1bc4",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-4/xrpVendordep-cpp-2027.0.0-alpha-4-sources.zip",
        sha256 = "17a1571106c467f11c7773a9a3d591e5f45ffae879d11edec85746d2910728d8",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-4/xrpVendordep-cpp-2027.0.0-alpha-4-linuxarm64.zip",
        sha256 = "43d558c7a39620c53f201b62b0601889bc0a04bb41ae8a6ec25e56d41ed70752",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-4/xrpVendordep-cpp-2027.0.0-alpha-4-linuxx86-64.zip",
        sha256 = "f0d65a88fac507290652753fd6ef80262ae0ec09d043ba4846a54b951ddeac8f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-4/xrpVendordep-cpp-2027.0.0-alpha-4-osxuniversal.zip",
        sha256 = "23de2cbf1be5c9d6a36355653d082d43611a37bb67ae186bad6e05960783eee0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libxrpVendordep.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libxrpVendordep.dylib",
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
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-4/xrpVendordep-cpp-2027.0.0-alpha-4-windowsx86-64.zip",
        sha256 = "58a370f200c31304ceaa8087f792319faf254bdf680f77d6b209184d46eeb6fc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-4/xrpVendordep-cpp-2027.0.0-alpha-4-windowsarm64.zip",
        sha256 = "23f0b2c68f612cfa34d03066baa5d08dcb7cc8985c0ed73c4376673e0490d65b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-4/xrpVendordep-cpp-2027.0.0-alpha-4-linuxarm64static.zip",
        sha256 = "29d5237e1ebe300eb8ce02aef04828bb9da30713576c9bf2c7a2c9b7fe75cc1b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-4/xrpVendordep-cpp-2027.0.0-alpha-4-linuxx86-64static.zip",
        sha256 = "a63ed52c1bcd5ed3c966c3911e083063b4c8b5a9a7a0bca385e3e569b7dd42f0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-4/xrpVendordep-cpp-2027.0.0-alpha-4-osxuniversalstatic.zip",
        sha256 = "154f661f7f08401aab3dccc9dcc83de494e4bf1a8f3329bee0241d4028de7f26",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-4/xrpVendordep-cpp-2027.0.0-alpha-4-windowsx86-64static.zip",
        sha256 = "191f16fcd947e28b6aea55e425240ef11e2b298da9ccb731e1d5a90c25505e48",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-4/xrpVendordep-cpp-2027.0.0-alpha-4-windowsarm64static.zip",
        sha256 = "bcb1b1264a7210ae9d6f7503e8e65a8176b72dc174ff0e5531529e554946cf6e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-4/xrpVendordep-cpp-2027.0.0-alpha-4-linuxarm64debug.zip",
        sha256 = "3ba54fbe2b1a30522d6a368565712678edd0b986ff1ef932b8f30ea11b7e62f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-4/xrpVendordep-cpp-2027.0.0-alpha-4-linuxx86-64debug.zip",
        sha256 = "cdda44c446436ed65789edd1a101c1b2c8c5da27518dfed3e757f1947666ad72",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-4/xrpVendordep-cpp-2027.0.0-alpha-4-osxuniversaldebug.zip",
        sha256 = "aaa12aa99a0dd8c9b3bb553f3c31442e801ab81e7bc23440474bc8e1798d5be7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libxrpVendordep.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libxrpVendordep.dylib",
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
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-4/xrpVendordep-cpp-2027.0.0-alpha-4-windowsx86-64debug.zip",
        sha256 = "9aee4162a21d022cf947ad4aed0d349ff16285c6bd9e977c30cafba0d280be63",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-4/xrpVendordep-cpp-2027.0.0-alpha-4-windowsarm64debug.zip",
        sha256 = "8765f259d8512f069cc107b6be71b0847fd02f8abc6f53247a9a86aadd31fb49",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-4/xrpVendordep-cpp-2027.0.0-alpha-4-linuxarm64staticdebug.zip",
        sha256 = "362274fef3d13d11b5f660af0473e4fb1d6b8508254efd9339ee60e661cdba3e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-4/xrpVendordep-cpp-2027.0.0-alpha-4-linuxx86-64staticdebug.zip",
        sha256 = "790e645876d6e9933bbeee0d71da4035b970e4815543c7c738a055933114e395",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-4/xrpVendordep-cpp-2027.0.0-alpha-4-osxuniversalstaticdebug.zip",
        sha256 = "8d4897fb48ced2a818467f28abd5882bbd4e6bb73e9fc06af89062a9d6bef26c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-4/xrpVendordep-cpp-2027.0.0-alpha-4-windowsx86-64staticdebug.zip",
        sha256 = "f6744343d42e3e581a77e8b97649e85edb0345bc516b589eee519690bd552cca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-4/xrpVendordep-cpp-2027.0.0-alpha-4-windowsarm64staticdebug.zip",
        sha256 = "95e2f91130c1d2c8c78495c402d83db27dc85c10366149df48fe44ad39e843fc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-4/xrpVendordep-cpp-2027.0.0-alpha-4-linuxsystemcore.zip",
        sha256 = "bc002685bfa68a2a078ebde83e8a8d14a7c24d3d9660f05674ed1a256418f48c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-4/xrpVendordep-cpp-2027.0.0-alpha-4-linuxsystemcorestatic.zip",
        sha256 = "f16c5604df29c28faea47de6c565001956f3ecfa24ad316af0e634fb7268abd0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-4/xrpVendordep-cpp-2027.0.0-alpha-4-linuxsystemcoredebug.zip",
        sha256 = "c4d3f75cbb709122a784070bbaa085d04b21725785271adf22850276f1c89446",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-4/xrpVendordep-cpp-2027.0.0-alpha-4-linuxsystemcorestaticdebug.zip",
        sha256 = "36ccdc77a72d57fd0e5294da020fede1c5eddd25fa4dee61281edc967a8ba1a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-4/halsim_ds_socket-2027.0.0-alpha-4-headers.zip",
        sha256 = "5bc29a13855d8bf1d944a808a38cbfb4da7aba2aa28ca798a99097af0c1eb76e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-4/halsim_ds_socket-2027.0.0-alpha-4-sources.zip",
        sha256 = "ebd6ce1b3afa224946e966088a1bb33e0564c627da4b1f2efc256276d5f2eafc",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-4/halsim_ds_socket-2027.0.0-alpha-4-linuxarm64.zip",
        sha256 = "304fd839f4d4596ceab2bec93ac11289020850b29c7d9967cd432236df7725b8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-4/halsim_ds_socket-2027.0.0-alpha-4-linuxx86-64.zip",
        sha256 = "df8871d75d137e33406a95c94e5f2f495cb3832b44799b3065ebc107bdfc2517",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-4/halsim_ds_socket-2027.0.0-alpha-4-osxuniversal.zip",
        sha256 = "86a55dc6b629ee76a05331f4607403c3fb9a7af2ff147149d86c376980b61901",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_ds_socket.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-4/halsim_ds_socket-2027.0.0-alpha-4-windowsx86-64.zip",
        sha256 = "25a47d0c582b36790b41ac0863ff87ed97e674bd79bb6d26177a79b3b4125174",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-4/halsim_ds_socket-2027.0.0-alpha-4-windowsarm64.zip",
        sha256 = "c83eefb421fec681e9c6bf2f5e4b91a2d5042369f7bd24966ae5f8c73a09e536",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-4/halsim_ds_socket-2027.0.0-alpha-4-linuxarm64static.zip",
        sha256 = "17371f7b18241f34448f48629cade31b6b41155a39c506fafd3c4431e6fd6327",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-4/halsim_ds_socket-2027.0.0-alpha-4-linuxx86-64static.zip",
        sha256 = "471f8f8fd432e5943b75a5b00b88e11a86eb734b4c919e25ac9d34badd7b914f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-4/halsim_ds_socket-2027.0.0-alpha-4-osxuniversalstatic.zip",
        sha256 = "13a8abcfdf6a7d87ec6fd383cbbd30c5c514891b5f8edc5f8e7021a901477aa6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-4/halsim_ds_socket-2027.0.0-alpha-4-windowsx86-64static.zip",
        sha256 = "708f48c47624ca308e8f34016d2e65aede5b6fca56d14cc0a452024cf75cedd7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-4/halsim_ds_socket-2027.0.0-alpha-4-windowsarm64static.zip",
        sha256 = "137b48f737ac774485e3da57950b6393d06983767d2e1af4fd4efc59707ab1dd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-4/halsim_ds_socket-2027.0.0-alpha-4-linuxarm64debug.zip",
        sha256 = "a58500accc9a17ba2407eb47146c183dcd3aa89224172f02c71d590534186d0f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-4/halsim_ds_socket-2027.0.0-alpha-4-linuxx86-64debug.zip",
        sha256 = "d4d9e850b8da1110fed98a7755411e21a8ca9d6a7274807aa6da5fb997369dae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-4/halsim_ds_socket-2027.0.0-alpha-4-osxuniversaldebug.zip",
        sha256 = "df1231e3459721c4c5265a77ba7c7d5bc00dba032041cae8b80dd04adf278298",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_ds_socket.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-4/halsim_ds_socket-2027.0.0-alpha-4-windowsx86-64debug.zip",
        sha256 = "bb0f0ada840ee0d56c9b40f4bf403eb5f9854ce0a42532ee2870519ced3123c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-4/halsim_ds_socket-2027.0.0-alpha-4-windowsarm64debug.zip",
        sha256 = "966e5482760636a0c30ed27c169072d9727b734067132040c3b5341c58505b6f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-4/halsim_ds_socket-2027.0.0-alpha-4-linuxarm64staticdebug.zip",
        sha256 = "58b1678642379668dbe5fb9ec4e6a3e7ef7fc50459e0e6f57256512ab19733a4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-4/halsim_ds_socket-2027.0.0-alpha-4-linuxx86-64staticdebug.zip",
        sha256 = "abcc1f2c26c69002becfc624821bb0bd8a5585f3118e8b79a29162bae620afef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-4/halsim_ds_socket-2027.0.0-alpha-4-osxuniversalstaticdebug.zip",
        sha256 = "593fbbc97ef8397618373c188174a2c11e21a0320fb6979964a248f642e52665",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-4/halsim_ds_socket-2027.0.0-alpha-4-windowsx86-64staticdebug.zip",
        sha256 = "0f28de23a440f0b89c1485876b30ee8b549907de0c200f3e7cd359216b336741",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-4/halsim_ds_socket-2027.0.0-alpha-4-windowsarm64staticdebug.zip",
        sha256 = "d61556dc1e2c1b6ad9fff3765b89b6481ad18baaa576e0a824da1947c64a6479",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-4/halsim_gui-2027.0.0-alpha-4-headers.zip",
        sha256 = "54116199e0c5ea15be0e5b26140e1bbac2396106cf20b5d0d78ad06636d24292",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-4/halsim_gui-2027.0.0-alpha-4-sources.zip",
        sha256 = "78ff414eea627fd3a3b1d44472b860d1bc0a4e2c5309724273a055b059c99dbe",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-4/halsim_gui-2027.0.0-alpha-4-linuxarm64.zip",
        sha256 = "3a0ad517fe32cc0cea30bd142d1f8151e4afa9e3fb35c1309f6235ba648ce792",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-4/halsim_gui-2027.0.0-alpha-4-linuxx86-64.zip",
        sha256 = "f0321d5204faf4b58c22e1621daa3d17c89cd93d6ee067d06bfc9564182887d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-4/halsim_gui-2027.0.0-alpha-4-osxuniversal.zip",
        sha256 = "c73d543a14177d6b58b4296e49f678c5cd7a81290abfee087e1b774ced989b25",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_gui.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_gui.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-4/halsim_gui-2027.0.0-alpha-4-windowsx86-64.zip",
        sha256 = "e61687c7422b48d41c4967f9a51ac14954998aeed9c50a2eefbcd277d3ef2deb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-4/halsim_gui-2027.0.0-alpha-4-windowsarm64.zip",
        sha256 = "43b5006850c0a8364360c99b963db721bd83f64bcb6f7219fd0fdd95f3369d46",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-4/halsim_gui-2027.0.0-alpha-4-linuxarm64static.zip",
        sha256 = "329a7fda8ab33f84df6088885d335edd690f1a8b500d075842d19eb345b32ca8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-4/halsim_gui-2027.0.0-alpha-4-linuxx86-64static.zip",
        sha256 = "a80b1e2fc74f62b9e8f697aecb7fc4adafb074e504a022ffc9eb563272d1e3c5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-4/halsim_gui-2027.0.0-alpha-4-osxuniversalstatic.zip",
        sha256 = "6dbf303cf25a09db0176c31fce9390c75cec96c1e5f8d828b0dfda3a005626e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-4/halsim_gui-2027.0.0-alpha-4-windowsx86-64static.zip",
        sha256 = "fe0e2ab9197d8d85bbf2fbb6a6266939aeb08a1769557dddae2614bd175877ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-4/halsim_gui-2027.0.0-alpha-4-windowsarm64static.zip",
        sha256 = "a77e536f287a043106b1c87ee0dc9f22787cfcd02e78bb7b2aee439a2478186e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-4/halsim_gui-2027.0.0-alpha-4-linuxarm64debug.zip",
        sha256 = "3f619f0e2b86202118c9a207bb36fb460d2e8277dcdc41f420520c3722f071ac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-4/halsim_gui-2027.0.0-alpha-4-linuxx86-64debug.zip",
        sha256 = "be09cdbe2f669b4ae9253ee0771d73f7b517087ab34d0ed23fdc3b54ef01d5b3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-4/halsim_gui-2027.0.0-alpha-4-osxuniversaldebug.zip",
        sha256 = "d99a14966ce6a6767229b3d2526b1871fe5f3527e8665f444cec6e21c98efab2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_gui.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_gui.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-4/halsim_gui-2027.0.0-alpha-4-windowsx86-64debug.zip",
        sha256 = "2d72f62a6ced249d6a55fb8c0523e05f02191f06969519046898ec4bbe9b1fc5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-4/halsim_gui-2027.0.0-alpha-4-windowsarm64debug.zip",
        sha256 = "d4f3b64ef590878d98bb7d0914589a2343f5b73c7fdd6ee1a39c812837bc00bc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-4/halsim_gui-2027.0.0-alpha-4-linuxarm64staticdebug.zip",
        sha256 = "fcde0f8aef483ab6c24c8704b2e9e59a7c93b7fa7d9279a262853eb6e8a66d66",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-4/halsim_gui-2027.0.0-alpha-4-linuxx86-64staticdebug.zip",
        sha256 = "4751198d453f42c68f1b2eb2575416f432f295f7d11bc6db829f976c1bb08183",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-4/halsim_gui-2027.0.0-alpha-4-osxuniversalstaticdebug.zip",
        sha256 = "5abb550fa5d3d082dbc58d1db1775ca782b5fb7b72c4e5f80b829b90bce99229",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-4/halsim_gui-2027.0.0-alpha-4-windowsx86-64staticdebug.zip",
        sha256 = "5053464d3c402bd436ab3adbca8a7d3f0654bd0c820e3855262dd3015c15671b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-4/halsim_gui-2027.0.0-alpha-4-windowsarm64staticdebug.zip",
        sha256 = "bf782db19b5b96e39deb935052771a91dfa70716ea1b1da8ca2f1114de53d8bc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-4/halsim_ws_client-2027.0.0-alpha-4-headers.zip",
        sha256 = "d447a5e84a6227875a6277a82f666a1d051d74a01a86f30201bfa7a4d5d5c23a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-4/halsim_ws_client-2027.0.0-alpha-4-sources.zip",
        sha256 = "161be2efc576217c2eb8c06b23de34419871a58326419620270bb779e3a80b74",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-4/halsim_ws_client-2027.0.0-alpha-4-linuxarm64.zip",
        sha256 = "9d15da0dc75750c016acae477fa50639a07fade2bd75da9c0a5692c1c0e477c9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-4/halsim_ws_client-2027.0.0-alpha-4-linuxx86-64.zip",
        sha256 = "8e7e1c1b019f4a839fdf18d84075c7911bedc0987c056352a03aa3db8b440ade",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-4/halsim_ws_client-2027.0.0-alpha-4-osxuniversal.zip",
        sha256 = "4ee316b9d62b24230d365c5020e0265f86d01bdf8b276e26f758e2dd5269e787",
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
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-4/halsim_ws_client-2027.0.0-alpha-4-windowsx86-64.zip",
        sha256 = "b4f95a8f14ef7b308c4d50de92cb4479866936333463fb794615b6cc010c292b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-4/halsim_ws_client-2027.0.0-alpha-4-windowsarm64.zip",
        sha256 = "b34fff701d179ceaa9667141a0947fe8ecc1c9e5d3700de0bad4bb983f0cd242",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-4/halsim_ws_client-2027.0.0-alpha-4-linuxarm64static.zip",
        sha256 = "14bf904dd2273b6e0c7d97302dd107956a6334a78d15fb11554e734a3c8ce7c5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-4/halsim_ws_client-2027.0.0-alpha-4-linuxx86-64static.zip",
        sha256 = "07e33f8d305b7668889baeb549445b66f2d92800330a7f25eb94dd07c8d18834",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-4/halsim_ws_client-2027.0.0-alpha-4-osxuniversalstatic.zip",
        sha256 = "ff7b6853320f49164ed2c78960692848dfd3dfc6366bd9f59ccb3949b1f1505b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-4/halsim_ws_client-2027.0.0-alpha-4-windowsx86-64static.zip",
        sha256 = "8b57245fb6fa707fb0ccc44ea7d6f67b56bf8d6e47d7925e281a1598e62d6fe2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-4/halsim_ws_client-2027.0.0-alpha-4-windowsarm64static.zip",
        sha256 = "1c44208011e6a3f8345b2160f1685bd8ebe1bbf844d316cbeb6e21961b1dca6a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-4/halsim_ws_client-2027.0.0-alpha-4-linuxarm64debug.zip",
        sha256 = "39c3a718e2fedec6a3f07fd6d73af780402c58d4150777e0678b56909c8192db",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-4/halsim_ws_client-2027.0.0-alpha-4-linuxx86-64debug.zip",
        sha256 = "e44d43933255b253cbbdee114a8e2ada9c9e151c06cedcfe898ee84062f26303",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-4/halsim_ws_client-2027.0.0-alpha-4-osxuniversaldebug.zip",
        sha256 = "7f93f44fadcc51f8b0cec1dd8b6adfc3ff5877d2e32fda2aa2506e7e8e2f2ff8",
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
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-4/halsim_ws_client-2027.0.0-alpha-4-windowsx86-64debug.zip",
        sha256 = "b35423220c6fbbad44076e4b58dbe50fcca9030cfd9d7a9f7b5027267152faee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-4/halsim_ws_client-2027.0.0-alpha-4-windowsarm64debug.zip",
        sha256 = "e3fe0f62394bd1ef13ca13a2a2514ae6bd09541039fae585cbfcfd71221e86d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-4/halsim_ws_client-2027.0.0-alpha-4-linuxarm64staticdebug.zip",
        sha256 = "8be8597af76e68aa95b575786391c78520bc12c0d22fc86b6946b93076fe44be",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-4/halsim_ws_client-2027.0.0-alpha-4-linuxx86-64staticdebug.zip",
        sha256 = "5e3c2f245943a4efbc1d206d02def359f1cb8f03deeca484d9083237c143d45f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-4/halsim_ws_client-2027.0.0-alpha-4-osxuniversalstaticdebug.zip",
        sha256 = "c3e53bac42ef8fefad90b3ac76ebd43a7634677f69e950e50deee18b2cdbb696",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-4/halsim_ws_client-2027.0.0-alpha-4-windowsx86-64staticdebug.zip",
        sha256 = "fb4a7707ffd776cf72848f4faf6400c83e422f2b64ede3eda8074d35470f05cd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-4/halsim_ws_client-2027.0.0-alpha-4-windowsarm64staticdebug.zip",
        sha256 = "8e7e48f83dcf47eff8c0ed3fdba3a9043be92af2bd2840d67bdef4c44192c099",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-4/halsim_ws_server-2027.0.0-alpha-4-headers.zip",
        sha256 = "94b1838eb5cc698bf728dae81536deb02c32ec9ff54bdfc5375b0eb1536ec16a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-4/halsim_ws_server-2027.0.0-alpha-4-sources.zip",
        sha256 = "91cfbd2634f684ef4ca0bfef3bf0122e8608760c62b46755f0d45a545a789cc1",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-4/halsim_ws_server-2027.0.0-alpha-4-linuxarm64.zip",
        sha256 = "40eba4aa9a54c90d78a2b97a387d8f5a4a2d251cb22b4da12e9fb771ce92e0c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-4/halsim_ws_server-2027.0.0-alpha-4-linuxx86-64.zip",
        sha256 = "2ad003978eb052c7b05e3ec049c7c434d068f31cf085fc1875caf96510763850",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-4/halsim_ws_server-2027.0.0-alpha-4-osxuniversal.zip",
        sha256 = "39f1d21666b786ac286f35f15745b77ff677e89c360c2a743b1aacb564443a26",
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
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-4/halsim_ws_server-2027.0.0-alpha-4-windowsx86-64.zip",
        sha256 = "9ad0402ab5fe79a7b73f63a38878579920eeb9d05f27dad90672a56aa7243fdf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-4/halsim_ws_server-2027.0.0-alpha-4-windowsarm64.zip",
        sha256 = "b77d39e7825025b5ba1e90763dc3fdd81f3bb6a2adf74dbcbbb459dcd06b9d26",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-4/halsim_ws_server-2027.0.0-alpha-4-linuxarm64static.zip",
        sha256 = "b43a404191c62500831379add3f7165420da3459b23e2fac0e3b946522847287",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-4/halsim_ws_server-2027.0.0-alpha-4-linuxx86-64static.zip",
        sha256 = "e1deaa1f722904651276bcad0382d358dc7c16bf3ad64ed08c7154e661e33dde",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-4/halsim_ws_server-2027.0.0-alpha-4-osxuniversalstatic.zip",
        sha256 = "b1d629f292b171284f9638106c9b7bc8e50a39010874470fd936200dbeb07bba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-4/halsim_ws_server-2027.0.0-alpha-4-windowsx86-64static.zip",
        sha256 = "b3156f28b42ff2a99193b1b625326560f7d459a745fdde3a5bc24856d1e26386",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-4/halsim_ws_server-2027.0.0-alpha-4-windowsarm64static.zip",
        sha256 = "d0657dc98ac82a35791e6d4a3e985de02ce80275dfd9189679a5dfcfb3aece79",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-4/halsim_ws_server-2027.0.0-alpha-4-linuxarm64debug.zip",
        sha256 = "8a18e204ef9d37d72e10880ef3127d847773be9b77fbaaf141241c3c1d8b047f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-4/halsim_ws_server-2027.0.0-alpha-4-linuxx86-64debug.zip",
        sha256 = "2d177d9f5fc0b34a5078b0c52ee5662e4a6a0feff5b9acc3905359d15ea7d95b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-4/halsim_ws_server-2027.0.0-alpha-4-osxuniversaldebug.zip",
        sha256 = "7393eab61302b69316e7a6d260dee6fecfb77522b9338702ed6a8a587c4147d9",
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
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-4/halsim_ws_server-2027.0.0-alpha-4-windowsx86-64debug.zip",
        sha256 = "3f6b5b6170fe14893daef7c18d1dcb976d89cf36bdfd4441c5256035489915a3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-4/halsim_ws_server-2027.0.0-alpha-4-windowsarm64debug.zip",
        sha256 = "c0621d7de9567ab8939048c5572c3c885c9e166c41af7469e5e1b0ab0e877de0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-4/halsim_ws_server-2027.0.0-alpha-4-linuxarm64staticdebug.zip",
        sha256 = "51b7f2b15ab57e505fe93c1ac277c818e6b0b9a097f8ca389b137b0d71175a52",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-4/halsim_ws_server-2027.0.0-alpha-4-linuxx86-64staticdebug.zip",
        sha256 = "d28bc147b1002f2e984fd1449c8bcf9ef7412488bd9bfa20e123d512f95d4c73",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-4/halsim_ws_server-2027.0.0-alpha-4-osxuniversalstaticdebug.zip",
        sha256 = "1b193c3c09ce952da68945a1522375a98fd3d44dcd0194334cd0c011dc5f93f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-4/halsim_ws_server-2027.0.0-alpha-4-windowsx86-64staticdebug.zip",
        sha256 = "c81c91bbf711736c8577c2285fd8f1db6ae77e167d7e04c050563e5868225b6d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-4/halsim_ws_server-2027.0.0-alpha-4-windowsarm64staticdebug.zip",
        sha256 = "7adbc0cb65b9eca3db33b02f1a6ccd3410357a7d6ae912f467f55cb1b8f40bc3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/Glass/2027.0.0-alpha-4/Glass-2027.0.0-alpha-4-linuxarm64.zip",
        sha256 = "c885efdc1cdf07acfd340ed74e631cd236e914cb11ef8ceac9f2498f049ccb91",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/Glass/2027.0.0-alpha-4/Glass-2027.0.0-alpha-4-linuxx86-64.zip",
        sha256 = "29095ce95b852e9ccefc7963eefe37d1dfba3485262f529e103eaa4c64dc8cba",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/Glass/2027.0.0-alpha-4/Glass-2027.0.0-alpha-4-osxuniversal.zip",
        sha256 = "6f72008e66dd4b7c7965171320e8918f6c4539302361e06f5b803dc7ddb5a0e1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/Glass/2027.0.0-alpha-4/Glass-2027.0.0-alpha-4-windowsx86-64.zip",
        sha256 = "027817e927b7eead34fb28cba221854fe68a735e12492af9a07387e118677988",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/Glass/2027.0.0-alpha-4/Glass-2027.0.0-alpha-4-windowsarm64.zip",
        sha256 = "683b09470720f0d91910217f661f2bdefaa2a7ee88c0ade737a52149dc3861b6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/OutlineViewer/2027.0.0-alpha-4/OutlineViewer-2027.0.0-alpha-4-linuxarm64.zip",
        sha256 = "945a148db836add8e43b2764d9bb8ee7ff624ee42657932de9050fc85e8d818e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/OutlineViewer/2027.0.0-alpha-4/OutlineViewer-2027.0.0-alpha-4-linuxx86-64.zip",
        sha256 = "9b626e0e5c5087c436a08b4ae389be8e12f7d88493f7e970b0b563a97ebe0464",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/OutlineViewer/2027.0.0-alpha-4/OutlineViewer-2027.0.0-alpha-4-osxuniversal.zip",
        sha256 = "ddf97672110d6a95ca60fd866b908fa0fa3996a6b3e06713101c309831c54424",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/OutlineViewer/2027.0.0-alpha-4/OutlineViewer-2027.0.0-alpha-4-windowsx86-64.zip",
        sha256 = "1403ce2bdf0674502db864b650f88b3e5b03a72bfa425c52460862b34494c07f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/OutlineViewer/2027.0.0-alpha-4/OutlineViewer-2027.0.0-alpha-4-windowsarm64.zip",
        sha256 = "273d49f28e62b56f838b84dbb4523c95606e268522488ce3f66d9045d5b5101b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/DataLogTool/2027.0.0-alpha-4/DataLogTool-2027.0.0-alpha-4-linuxarm64.zip",
        sha256 = "c368f009c80d003108f915543ef4168b48cf5d8bd6a7db98843e9845df6496af",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/DataLogTool/2027.0.0-alpha-4/DataLogTool-2027.0.0-alpha-4-linuxx86-64.zip",
        sha256 = "f2bb393deb97d8b465598f017f0876c7f89a91cd382e0e925ebd8b894a3411d2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/DataLogTool/2027.0.0-alpha-4/DataLogTool-2027.0.0-alpha-4-osxuniversal.zip",
        sha256 = "619869329c0484a912e48719bdb92810295f85bcc2bd09e8221717397883eef1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/DataLogTool/2027.0.0-alpha-4/DataLogTool-2027.0.0-alpha-4-windowsx86-64.zip",
        sha256 = "5d3317af4894e66f2a8613ac5d60a523dcbe8a74e42b70076aa589a6771ce0c7",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/DataLogTool/2027.0.0-alpha-4/DataLogTool-2027.0.0-alpha-4-windowsarm64.zip",
        sha256 = "0b21eb85b4627f44ee86667f4082ffff45c78508745541e01b33a5ec2bc7f81f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/SysId/2027.0.0-alpha-4/SysId-2027.0.0-alpha-4-linuxx86-64.zip",
        sha256 = "599b9728ae6866bdd8252a2ade16c30b6a99587885f1b9b40cc7082c520cdec3",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/SysId/2027.0.0-alpha-4/SysId-2027.0.0-alpha-4-osxuniversal.zip",
        sha256 = "636559dddaeae4e845a4da1ea1721316002be53ae4bda19f1ee9c1d5f8244892",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/SysId/2027.0.0-alpha-4/SysId-2027.0.0-alpha-4-windowsx86-64.zip",
        sha256 = "fe3b491e58d021e564506214a0e7e24d97a3091802a4b1119ba36abdf4defb0b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/SysId/2027.0.0-alpha-4/SysId-2027.0.0-alpha-4-windowsarm64.zip",
        sha256 = "6ed6db68bfc41d8222901e805c3531f89b06e74a8a2f2224a8bcb20a4db36538",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
