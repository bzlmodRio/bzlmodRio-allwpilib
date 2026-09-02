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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-7/wpiutil-cpp-2027.0.0-alpha-7-headers.zip",
        sha256 = "d2a90dc91b34f15af97921e058ab52540dd0876400969650ae33783ff314f7b7",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-7/wpiutil-cpp-2027.0.0-alpha-7-sources.zip",
        sha256 = "b1613e74f1e197788687ae02ee63722cb22409eca0eecb4dc1d1d8dc51f23007",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-7/wpiutil-cpp-2027.0.0-alpha-7-linuxarm64.zip",
        sha256 = "0316d6c3d6d89c8a0ccd6953e0ddce7342f0cfda23bbe6cb43a81d7d0b5ec9e7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-7/wpiutil-cpp-2027.0.0-alpha-7-linuxx86-64.zip",
        sha256 = "706d08f22bd2ddcdae3c5d9b44292707e71753d2639a6f5336a992475a361b52",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-7/wpiutil-cpp-2027.0.0-alpha-7-osxuniversal.zip",
        sha256 = "6f786cf70b005389a8c5f171b6c499ec693f19cc6aababc8150c2312fcc9e715",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-7/wpiutil-cpp-2027.0.0-alpha-7-windowsx86-64.zip",
        sha256 = "5ffc1037d7615d0d83ed44d2cbea67ba527b9d1642eb14b07f53a2a25e6554cd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-7/wpiutil-cpp-2027.0.0-alpha-7-windowsarm64.zip",
        sha256 = "7cd7e2d2636864c49aae772dd862159c99e4618035132dd6790c5dda8ce8d695",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-7/wpiutil-cpp-2027.0.0-alpha-7-linuxarm64static.zip",
        sha256 = "420163eeb641adbff8848be323fd9305f556eef6f873e51fd5117b773ebc31ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-7/wpiutil-cpp-2027.0.0-alpha-7-linuxx86-64static.zip",
        sha256 = "7dd84aa6c50707429feeda116b1a019e0198192e0c63e0941547172c2eaab186",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-7/wpiutil-cpp-2027.0.0-alpha-7-osxuniversalstatic.zip",
        sha256 = "3e429ef934d7a1d241ef7efcded41c1caee14d06def4d20c58d9085d53282ebd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-7/wpiutil-cpp-2027.0.0-alpha-7-windowsx86-64static.zip",
        sha256 = "1893455a4aa4e0f34d104602fa4a366aeb2b1824698a8e41bcfdbb7717af05a7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-7/wpiutil-cpp-2027.0.0-alpha-7-windowsarm64static.zip",
        sha256 = "2fe43c06a38554d1b387797481e037f1f66644d4978061fc3119e0bc5def4c95",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-7/wpiutil-cpp-2027.0.0-alpha-7-linuxarm64debug.zip",
        sha256 = "468bcf00f74c46af3220f2ddcad6d0a8b9c044e91f76a39b3fd8707d492bdcb0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-7/wpiutil-cpp-2027.0.0-alpha-7-linuxx86-64debug.zip",
        sha256 = "6179a7fc2ec3f59ed1aa33a82a36ea9622189c9d8d5d21eff2d13f8a57c785a0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-7/wpiutil-cpp-2027.0.0-alpha-7-osxuniversaldebug.zip",
        sha256 = "91a83969737f35f7e8313d96c6ce053ce1c5b78cd0f9d5df4b9e0400c1f4de55",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-7/wpiutil-cpp-2027.0.0-alpha-7-windowsx86-64debug.zip",
        sha256 = "b7244824c3fad00c0f4dcd65107dc4b6ec042029b7688d5ebdfb3f1fbb4f7260",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-7/wpiutil-cpp-2027.0.0-alpha-7-windowsarm64debug.zip",
        sha256 = "63ee09e3c1a68833a16a481a4e93f671d5b930d3a55f6294edf15956cea174b0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-7/wpiutil-cpp-2027.0.0-alpha-7-linuxarm64staticdebug.zip",
        sha256 = "85a78062b39d31b23e4a6701e2c14d754000a13c707c2e0ac174e4365e4e12bc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-7/wpiutil-cpp-2027.0.0-alpha-7-linuxx86-64staticdebug.zip",
        sha256 = "f6938215476699795cee8024c10a8747695d87432320f5cf5982c294a4d038bf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-7/wpiutil-cpp-2027.0.0-alpha-7-osxuniversalstaticdebug.zip",
        sha256 = "548a1fe897e07bd97e7b0953586aa531c43c815f520fd05c18353a00377acc1f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-7/wpiutil-cpp-2027.0.0-alpha-7-windowsx86-64staticdebug.zip",
        sha256 = "d596ed492652053104f5ff50ead89952fc75968fedebb330accc24a085c13195",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-7/wpiutil-cpp-2027.0.0-alpha-7-windowsarm64staticdebug.zip",
        sha256 = "a1c3a0f3a832119564582b8ec584f82486fd9430d5a5a34bbac9bcb621a6fee2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-7/wpiutil-cpp-2027.0.0-alpha-7-linuxsystemcore.zip",
        sha256 = "a345c502006513b1121b6a951dac6205341615a1c6abad1420b8ef8dbaa10c85",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-7/wpiutil-cpp-2027.0.0-alpha-7-linuxsystemcorestatic.zip",
        sha256 = "89a46cac40e1c6015ebcdc30bd509952d160f8b1d5504413648ed040ecd0ba03",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-7/wpiutil-cpp-2027.0.0-alpha-7-linuxsystemcoredebug.zip",
        sha256 = "c39a2a00d7a1e799c22cf6dfa692c248551fd275f292b3c033cc2fec044d2fd8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-7/wpiutil-cpp-2027.0.0-alpha-7-linuxsystemcorestaticdebug.zip",
        sha256 = "c5e361db2c9e887f66fc3230a923362356947f882ada826d15601c7f93d010fc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-7/datalog-cpp-2027.0.0-alpha-7-headers.zip",
        sha256 = "1854eb2ce6e371247b077205f043a7443d32b53b34c1f51a77a51b821e867933",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-7/datalog-cpp-2027.0.0-alpha-7-sources.zip",
        sha256 = "9dda4e2eff79c1d608fee804ae1225c26a3edbbf5ff8bffb3c25fccf479703ca",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-7/datalog-cpp-2027.0.0-alpha-7-linuxarm64.zip",
        sha256 = "8596f398572c8e9d699a5018dfd7acb9efeb17322edb8a965c8e565eaedfd144",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-7/datalog-cpp-2027.0.0-alpha-7-linuxx86-64.zip",
        sha256 = "6c9dcbd1dded637281f7492d9041a5de13de72b5a7a689e17c014692b1accfee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-7/datalog-cpp-2027.0.0-alpha-7-osxuniversal.zip",
        sha256 = "281c70de2f9b75263eb51afb97f96ce1e64240332a9d72190b85cbbfdc51a5f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libdatalog.dylib osx/universal/shared/libdatalog.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libdatalog.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-7/datalog-cpp-2027.0.0-alpha-7-windowsx86-64.zip",
        sha256 = "e29dc225ad1bc146ce702a106d61c73ff0b480db581126d6b03275320fd0476c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-7/datalog-cpp-2027.0.0-alpha-7-windowsarm64.zip",
        sha256 = "8cb222c4da05da8da46d7febc47ed09810ac5c3e57609b7ecfd650d19d4d095f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-7/datalog-cpp-2027.0.0-alpha-7-linuxarm64static.zip",
        sha256 = "a58f63ede2339d3c6fd57a3b53b9df92982ca2d59a66134d48d36c4b344793f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-7/datalog-cpp-2027.0.0-alpha-7-linuxx86-64static.zip",
        sha256 = "b561d7ab849eed96dc64ae812515a8ee5829a8b32017d9b0e576ae999c042b6a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-7/datalog-cpp-2027.0.0-alpha-7-osxuniversalstatic.zip",
        sha256 = "3bfb12431cbd7d870840ce4c59c4194de9490d894274346db196364ac9976948",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-7/datalog-cpp-2027.0.0-alpha-7-windowsx86-64static.zip",
        sha256 = "056c73a8a5a4ef512e77cf60e21725abc614f48d49cf2312a5d8516451c9acc6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-7/datalog-cpp-2027.0.0-alpha-7-windowsarm64static.zip",
        sha256 = "2d0c92470f497a76f8de7c6f12e7f12e719ed1c668745a9bca85ee4e1e1777f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-7/datalog-cpp-2027.0.0-alpha-7-linuxarm64debug.zip",
        sha256 = "517d35044d276819ac22c35bcb87c84ff6d1a5cb481b5de67878a6a2ab2baec2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-7/datalog-cpp-2027.0.0-alpha-7-linuxx86-64debug.zip",
        sha256 = "53fc191831cd46715ab3312d9b0854d3ac0f76103884e5a51329f0f2b38e40dc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-7/datalog-cpp-2027.0.0-alpha-7-osxuniversaldebug.zip",
        sha256 = "b822255867efc47dff426fbda3ee205eec2ef9ebee71f486a16162cb3f4714b2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libdatalog.dylib osx/universal/shared/libdatalog.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libdatalog.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-7/datalog-cpp-2027.0.0-alpha-7-windowsx86-64debug.zip",
        sha256 = "17483dbab375b5e9b851449376e32e00d5fffa79a0d2759b7218d2f2ac90e20b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-7/datalog-cpp-2027.0.0-alpha-7-windowsarm64debug.zip",
        sha256 = "b3346b0f38bbeb2ad6127e29689f011b765e8e7d296007d51396f7bf07ab7b15",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-7/datalog-cpp-2027.0.0-alpha-7-linuxarm64staticdebug.zip",
        sha256 = "9b67cf18d0ef6985e52ee7cffb274e0149212118ced1efbbef74a0f45d1257e6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-7/datalog-cpp-2027.0.0-alpha-7-linuxx86-64staticdebug.zip",
        sha256 = "3fd353f7d0bebfddbf74d32adb29dda1e1dc8815dfe4e37cf1646b50088f3175",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-7/datalog-cpp-2027.0.0-alpha-7-osxuniversalstaticdebug.zip",
        sha256 = "b9e4a53857265ffe69a1b7cb8a9fe8c417d2b4545a078d8ca01ba907d7fc3474",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-7/datalog-cpp-2027.0.0-alpha-7-windowsx86-64staticdebug.zip",
        sha256 = "74e9bce166761e7c9a789b860aed468213601b08060656bae8b6146e46bdade0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-7/datalog-cpp-2027.0.0-alpha-7-windowsarm64staticdebug.zip",
        sha256 = "914536c34585495d52e08806bd553f8faabfe665dbb22b88e9d910b7c856644c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-7/datalog-cpp-2027.0.0-alpha-7-linuxsystemcore.zip",
        sha256 = "11e9a7f82a72be57f90ca28519451335cc448ac67883f03ae27575c6badaebd2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-7/datalog-cpp-2027.0.0-alpha-7-linuxsystemcorestatic.zip",
        sha256 = "a6682a1f09e09376b5f325fd7adab4d70aa8f316ee4c301ca57d3551030e467e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-7/datalog-cpp-2027.0.0-alpha-7-linuxsystemcoredebug.zip",
        sha256 = "d1eeff5af2bcc84078fca11223669742b4966428778b26e9ba843d1aa10a034d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-7/datalog-cpp-2027.0.0-alpha-7-linuxsystemcorestaticdebug.zip",
        sha256 = "1225542273bbb710d6d0c41a2c8987704c73b81808432e96a168fab7fb94a683",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-7/telemetry-cpp-2027.0.0-alpha-7-headers.zip",
        sha256 = "f846fea8cd9c1ed2ace6b6505dcfc6b9268f072dab68f53f6f0d564f0321fd9d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-7/telemetry-cpp-2027.0.0-alpha-7-sources.zip",
        sha256 = "09cdb5219652c96a182632c4dc3ee5bd0404b155c8244a4bd2ef4f26ac6f9c0d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-7/telemetry-cpp-2027.0.0-alpha-7-linuxarm64.zip",
        sha256 = "697776c8d5f52b3d0ab8dda85da2f2056e668782011f7909984b6736dc1e035e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-7/telemetry-cpp-2027.0.0-alpha-7-linuxx86-64.zip",
        sha256 = "3e54c4fae7f70d1ce124d56b8a7e2318be14035d5c0bcc2f039f80ac7c90ed76",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-7/telemetry-cpp-2027.0.0-alpha-7-osxuniversal.zip",
        sha256 = "5691fb08ab859ddc74aa9dd0d8246a00d93267bf13b9fc3b60fe0bfb223b03b2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libtelemetry.dylib osx/universal/shared/libtelemetry.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libtelemetry.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-7/telemetry-cpp-2027.0.0-alpha-7-windowsx86-64.zip",
        sha256 = "c21108601c633dd4f03adf5169e6fbf008de841c69297e3f89f7266b486db923",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-7/telemetry-cpp-2027.0.0-alpha-7-windowsarm64.zip",
        sha256 = "b71ade1ed6a60497dac08c49140dd3f06fe07de4536ddaa63b70466900d40ee6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-7/telemetry-cpp-2027.0.0-alpha-7-linuxarm64static.zip",
        sha256 = "93c21dd8b9824b57fd9055e2af3fb8059d65ddab031489fd10afa97e88be7679",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-7/telemetry-cpp-2027.0.0-alpha-7-linuxx86-64static.zip",
        sha256 = "ffcd4abaf7ab49aa35bdd5bcd57538db373711d4a93a6ee3f4e536aee01b9161",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-7/telemetry-cpp-2027.0.0-alpha-7-osxuniversalstatic.zip",
        sha256 = "ba6a72dc541173ed3b79df5a2a0e61a392b9d7261e3181ad50b6ba1e247c90eb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-7/telemetry-cpp-2027.0.0-alpha-7-windowsx86-64static.zip",
        sha256 = "161c8e9d2a376df48570edac3f286522a918901585bf8f6e679d1acfbdd23ea0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-7/telemetry-cpp-2027.0.0-alpha-7-windowsarm64static.zip",
        sha256 = "8c567e12640e49d1b746e79b6345168d1bcb4abae058fce959e013df0d368aaa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-7/telemetry-cpp-2027.0.0-alpha-7-linuxarm64debug.zip",
        sha256 = "1d7e72f8947395096cfea9158a9fb81b222d492a818ee4d6c1e3ca10fbf6ddc6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-7/telemetry-cpp-2027.0.0-alpha-7-linuxx86-64debug.zip",
        sha256 = "01caaa58e0ebc786d53280fe67e27a9d2b6120f6622cb6dc7aab791b21ce02bc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-7/telemetry-cpp-2027.0.0-alpha-7-osxuniversaldebug.zip",
        sha256 = "5cfd672795aafebdaf8d14442657decb9092c977e5db415276b84d24695a6643",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libtelemetry.dylib osx/universal/shared/libtelemetry.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libtelemetry.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-7/telemetry-cpp-2027.0.0-alpha-7-windowsx86-64debug.zip",
        sha256 = "4e7f6c7f4e540cdeb64db4d65fcd7c70602f7238905260b42a743501403b45b9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-7/telemetry-cpp-2027.0.0-alpha-7-windowsarm64debug.zip",
        sha256 = "b6548bf0283a4ec4e9987f9f6eb725b4109dfd282cb7c550dec34135844ce7af",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-7/telemetry-cpp-2027.0.0-alpha-7-linuxarm64staticdebug.zip",
        sha256 = "ad22f0b74ae118e63aaefd229370db443c7bf77b4248c83a2589a5bc743ba739",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-7/telemetry-cpp-2027.0.0-alpha-7-linuxx86-64staticdebug.zip",
        sha256 = "e8dd4a115dd9944c2481869715c76dfed0145535d0708b8449a7d26e12185e97",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-7/telemetry-cpp-2027.0.0-alpha-7-osxuniversalstaticdebug.zip",
        sha256 = "34dc7025897ce34a3c7b3c50d953a4c2569d7bd46d1337f3aa5c3b6ca3ed2a08",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-7/telemetry-cpp-2027.0.0-alpha-7-windowsx86-64staticdebug.zip",
        sha256 = "2e488cec5be4f68a3edb24ab73eaf751145605370e1ad758568579d0dbbef1fe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-7/telemetry-cpp-2027.0.0-alpha-7-windowsarm64staticdebug.zip",
        sha256 = "7b9adc6630281304e919c4bd238056b54685ef4e6e3bf0a6a08d1c45e99fd38e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-7/telemetry-cpp-2027.0.0-alpha-7-linuxsystemcore.zip",
        sha256 = "d2e8351a1ce65ffc43e2d635ec8c0e8896897c6f81b83ea5b19c8095e1196fb7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-7/telemetry-cpp-2027.0.0-alpha-7-linuxsystemcorestatic.zip",
        sha256 = "36824ec71abbc1cc90f02d8144420b078ad9a2198a075eda574c071ac3c822d3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-7/telemetry-cpp-2027.0.0-alpha-7-linuxsystemcoredebug.zip",
        sha256 = "6ae5e4e31995a73469aba6c079b7a50fd824f8e606b245cdfa6765ac8103cb47",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_telemetry_telemetry-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/telemetry/telemetry-cpp/2027.0.0-alpha-7/telemetry-cpp-2027.0.0-alpha-7-linuxsystemcorestaticdebug.zip",
        sha256 = "a1c6ac8bbe52c2e4f3d286cac952abee3e3b978b3b6ef69317096b7d39f29e42",
        build_file = "@bzlmodrio-allwpilib//private/cpp/telemetry:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-7/tunables-cpp-2027.0.0-alpha-7-headers.zip",
        sha256 = "ec4b9af4b17da7797dbc083fd810b8b54d962b2af0f40e7aa5fdc73b6687da1a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-7/tunables-cpp-2027.0.0-alpha-7-sources.zip",
        sha256 = "509e16f45ad63761502c1b0fc226fd673409ed0798c5dc9ef374df22e68a0d68",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-7/tunables-cpp-2027.0.0-alpha-7-linuxarm64.zip",
        sha256 = "e5c87d30fab2e13f91a3930c657eb3737b82b36cbcf8db3cdac716d9268e404c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-7/tunables-cpp-2027.0.0-alpha-7-linuxx86-64.zip",
        sha256 = "4d0b6d6465a83320fc8ee5a77353feb4d3460df2413e48104b175e8594cfdeb3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-7/tunables-cpp-2027.0.0-alpha-7-osxuniversal.zip",
        sha256 = "ee848e81781701d8897aba4f8d2c2ba35a8ec99a691c4ca4572729e2352049b2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libtunables.dylib osx/universal/shared/libtunables.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libtunables.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-7/tunables-cpp-2027.0.0-alpha-7-windowsx86-64.zip",
        sha256 = "d929686aacf96918ed1564d1272aae1039e3caaa93d4ca57f8f02ecb88ef92d2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-7/tunables-cpp-2027.0.0-alpha-7-windowsarm64.zip",
        sha256 = "22dcf27d059d7fcb30aa3e15e69a768a4f979276d30b19d4c7acc6ad2e638297",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-7/tunables-cpp-2027.0.0-alpha-7-linuxarm64static.zip",
        sha256 = "3f88a45593ae36e5ff9ab1ec23813793bc848888a07a92513cac301df6919003",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-7/tunables-cpp-2027.0.0-alpha-7-linuxx86-64static.zip",
        sha256 = "07ad3a2d7682c1e6fe42db7630ddf88a07ee23811736bfdf07e852411ae0da46",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-7/tunables-cpp-2027.0.0-alpha-7-osxuniversalstatic.zip",
        sha256 = "a0351aad15ec9277df070697f51a2d97effbe6eb1107b2450f35df4b14654d69",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-7/tunables-cpp-2027.0.0-alpha-7-windowsx86-64static.zip",
        sha256 = "4c0b8dd98706a6f94210405a13bee5ca22f25f8c2807841e8dbba48a60a722c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-7/tunables-cpp-2027.0.0-alpha-7-windowsarm64static.zip",
        sha256 = "b4104490e5d86980dbdeb2ce7d493051bd0d200fed88fbf04640e69bd60111ef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-7/tunables-cpp-2027.0.0-alpha-7-linuxarm64debug.zip",
        sha256 = "db5140b76ef9c5ce6c30ac802ebbc855663ccf58ecdda594891b205ccfdda879",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-7/tunables-cpp-2027.0.0-alpha-7-linuxx86-64debug.zip",
        sha256 = "e104bf5eb7f66b0f67ce0b82197445da805cda4eb8e9d17b2b1a8fd0408a2d5e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-7/tunables-cpp-2027.0.0-alpha-7-osxuniversaldebug.zip",
        sha256 = "93e3ccea6443c8a51d6a375754df7d1a595f2e691d1c7aaf1b1dc7c8cec9de2a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libtunables.dylib osx/universal/shared/libtunables.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libtunables.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-7/tunables-cpp-2027.0.0-alpha-7-windowsx86-64debug.zip",
        sha256 = "4de45cbb556bf5c7ed79fa317863f43db60aae673af97cb151ba4a84c5758db4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-7/tunables-cpp-2027.0.0-alpha-7-windowsarm64debug.zip",
        sha256 = "6f7b81e74bb0d8f4658d3e1b50d568b42889660c0065bebde4edd5539acda4d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-7/tunables-cpp-2027.0.0-alpha-7-linuxarm64staticdebug.zip",
        sha256 = "e6aa71159b470721acbee97fbd5e506e2bdf43901b6ca63c10187a47afff3b95",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-7/tunables-cpp-2027.0.0-alpha-7-linuxx86-64staticdebug.zip",
        sha256 = "445465635b1da1bb08bcfe1b8a9d93849b500f194e4025898de23acb3a0579bc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-7/tunables-cpp-2027.0.0-alpha-7-osxuniversalstaticdebug.zip",
        sha256 = "3b03b8b4509f15a4267c2f346534331b4ff8df26b6aa7afeee68d8b3e82ce122",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-7/tunables-cpp-2027.0.0-alpha-7-windowsx86-64staticdebug.zip",
        sha256 = "49155983c9b4401c8b044c976622ea857f410a085b8b0aa9062455cfbe3a076b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-7/tunables-cpp-2027.0.0-alpha-7-windowsarm64staticdebug.zip",
        sha256 = "9513a0c78b24a7bc7922114f7f906f99246b521da37a974520cce95dd8155dfd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-7/tunables-cpp-2027.0.0-alpha-7-linuxsystemcore.zip",
        sha256 = "5b7cff339b435c18fd53b7cd6ab0481f5b4d50b177650ed62993dbf830c269dc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-7/tunables-cpp-2027.0.0-alpha-7-linuxsystemcorestatic.zip",
        sha256 = "c6ca5a8758313f01b3bd060f256a6f79c37356ca7b59447cc829ae90fe0dc856",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-7/tunables-cpp-2027.0.0-alpha-7-linuxsystemcoredebug.zip",
        sha256 = "5d635b5449d3c42d932bfd94a6955ed1072614b4921361be4075dd2d547b57a1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_tunables_tunables-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tunables/tunables-cpp/2027.0.0-alpha-7/tunables-cpp-2027.0.0-alpha-7-linuxsystemcorestaticdebug.zip",
        sha256 = "6501a446da4765840fb1efdb8ce56c281cabeab54fad3ca69ac81cca0f83a7cc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/tunables:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-7/wpinet-cpp-2027.0.0-alpha-7-headers.zip",
        sha256 = "f2eff5f6e2e2e0aa6a175aeed7e4a7e3e914e895b159f3c1291c08ad3d63aaf2",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-7/wpinet-cpp-2027.0.0-alpha-7-sources.zip",
        sha256 = "81ce1d4a82dc0f6a72ff262cd450d398516504f9167477d9a58db1e5bdfc6a9d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-7/wpinet-cpp-2027.0.0-alpha-7-linuxarm64.zip",
        sha256 = "489e233b6c22480657dca6d1549119524d21b64db9c351b4de18d43c8f9491ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-7/wpinet-cpp-2027.0.0-alpha-7-linuxx86-64.zip",
        sha256 = "8ce54dcd522b1ea06366333c1e7a4397977a8923ef1b6e0c97f4a05b64604dbe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-7/wpinet-cpp-2027.0.0-alpha-7-osxuniversal.zip",
        sha256 = "136ba202fd348b24c091412b56ba39045d676755482c743c0b0c10308819b11b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-7/wpinet-cpp-2027.0.0-alpha-7-windowsx86-64.zip",
        sha256 = "a4d5baea29b08e3b5b63bd7b8386fea40ffe029b22d27297af45fc06d7804ae0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-7/wpinet-cpp-2027.0.0-alpha-7-windowsarm64.zip",
        sha256 = "2183f917010981fc2a72a0e4512cb3cbc2cc205c396a62c29a17c5defbb84f66",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-7/wpinet-cpp-2027.0.0-alpha-7-linuxarm64static.zip",
        sha256 = "ac5ea66c50a042672174784bc737121023c1a441449d88d69b70c2f9d397692b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-7/wpinet-cpp-2027.0.0-alpha-7-linuxx86-64static.zip",
        sha256 = "db7e4fb37ea353921eee8be3e444c18c0eca35482575f28aed753e27e5ba526e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-7/wpinet-cpp-2027.0.0-alpha-7-osxuniversalstatic.zip",
        sha256 = "5e68d095b4daa9d063373ac4df902f45042d4c855c1dc692b4ee98344c436fd9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-7/wpinet-cpp-2027.0.0-alpha-7-windowsx86-64static.zip",
        sha256 = "4684d4e5e65de6937bb8504da7e810b58af02d3b1b4ee64e9fe9357b1a21239d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-7/wpinet-cpp-2027.0.0-alpha-7-windowsarm64static.zip",
        sha256 = "f1d99cf5d65db1d6d71f38e6ae766cc3b32085622820a3a855f9064a60fb1981",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-7/wpinet-cpp-2027.0.0-alpha-7-linuxarm64debug.zip",
        sha256 = "c38d22c53d0bc57f7c1687b434d77d35ff9216e83697f7261b18e5f6a69fc00a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-7/wpinet-cpp-2027.0.0-alpha-7-linuxx86-64debug.zip",
        sha256 = "24e6377537fceec9b88be912b0cf5a5b17c14e38e3112a60f8a96146a4d4a785",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-7/wpinet-cpp-2027.0.0-alpha-7-osxuniversaldebug.zip",
        sha256 = "67e8fa4b2c9e9a2ace201bdf70ce2a2f29b5df9969b63a91452c77583b26ff41",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-7/wpinet-cpp-2027.0.0-alpha-7-windowsx86-64debug.zip",
        sha256 = "79454bcd9b88e8c51840445fede1f8c8549dd9fd35fac0f767981b7447d7576a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-7/wpinet-cpp-2027.0.0-alpha-7-windowsarm64debug.zip",
        sha256 = "80186ddba4dd78dc11270746e8d421e6643b4c1ecb8bf14d6a797225008047e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-7/wpinet-cpp-2027.0.0-alpha-7-linuxarm64staticdebug.zip",
        sha256 = "ea9a194720d722a74c5e7fbe28871c3101575b3b07217ec584367820bd1dc16e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-7/wpinet-cpp-2027.0.0-alpha-7-linuxx86-64staticdebug.zip",
        sha256 = "edbcdbd8b99ee2fe6b22ab315bebc63aa0666d91960122be1e77a1aae57097cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-7/wpinet-cpp-2027.0.0-alpha-7-osxuniversalstaticdebug.zip",
        sha256 = "9383a75fa8a95538e95631c1f2ae6d1c484c7e9531c0c54ee2e5a9734c00261a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-7/wpinet-cpp-2027.0.0-alpha-7-windowsx86-64staticdebug.zip",
        sha256 = "c6b5349b3214e6a62a8e9b37a076bc5442ac50c0e1b7db08816e401750d8f975",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-7/wpinet-cpp-2027.0.0-alpha-7-windowsarm64staticdebug.zip",
        sha256 = "40fc1b86f4b5efb784d22989584450ee8ab316230528b913888229f2e7e15bfc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-7/wpinet-cpp-2027.0.0-alpha-7-linuxsystemcore.zip",
        sha256 = "72d37159cce08f2ea28c82391b105ce537adf15557656ddbd89e6911ff58cae9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-7/wpinet-cpp-2027.0.0-alpha-7-linuxsystemcorestatic.zip",
        sha256 = "44d698c20d6b4ad2dff92daab56966faf7863d9fe74d9c99bebb3be7f64855c0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-7/wpinet-cpp-2027.0.0-alpha-7-linuxsystemcoredebug.zip",
        sha256 = "3968c7a6df95c099d92a550956edbea70ba85cd3806bd6b8add96a384d67f457",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-7/wpinet-cpp-2027.0.0-alpha-7-linuxsystemcorestaticdebug.zip",
        sha256 = "16291e1eb960b4983a17cccd43a5f223b3eaddac24e9cfbc00879ddc93ba2eda",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-7/wpimath-cpp-2027.0.0-alpha-7-headers.zip",
        sha256 = "3d7ff6a561655238e6b5ff9d0ab26c202922f6e7f4ea3189d23e67dfea8a6dc6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-7/wpimath-cpp-2027.0.0-alpha-7-sources.zip",
        sha256 = "ade445c7be2039e4a704063211299565fa3ee92ba58b2b76860d2062b892d2a5",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-7/wpimath-cpp-2027.0.0-alpha-7-linuxarm64.zip",
        sha256 = "8699cd492adb99009a1747dd90415e522309a8e70b29285903eb13928bb42a00",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-7/wpimath-cpp-2027.0.0-alpha-7-linuxx86-64.zip",
        sha256 = "f7d6b170429be5251e9c144526e5829bcac17ad8d60513c6b85fcc1e5b174dd6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-7/wpimath-cpp-2027.0.0-alpha-7-osxuniversal.zip",
        sha256 = "e0c5ea0da6ba4899ad1ef5a0472cacab046e826d245eac10b442f76a6669d1d5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-7/wpimath-cpp-2027.0.0-alpha-7-windowsx86-64.zip",
        sha256 = "5b7637826cd1d393b2e1b8c6dd68e561a6d33541ae82185f0487402a8664200b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-7/wpimath-cpp-2027.0.0-alpha-7-windowsarm64.zip",
        sha256 = "76f5919187e537494c3a152f18da49b5a8a87fd9fb9665297f333b6577217218",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-7/wpimath-cpp-2027.0.0-alpha-7-linuxarm64static.zip",
        sha256 = "c35de8711dddeefd127b43927d8cca5e8ab5ab34dbb0ec6d438789f80d8dcaae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-7/wpimath-cpp-2027.0.0-alpha-7-linuxx86-64static.zip",
        sha256 = "bd2d0b0ff1bcec3a922b3a16acf1b9842550af15f523d7d55b32f7a484d2a8f9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-7/wpimath-cpp-2027.0.0-alpha-7-osxuniversalstatic.zip",
        sha256 = "db27ae365a7e1b25de26984d01613cf7b2b3386a9b2f87b67cda63724197f2e9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-7/wpimath-cpp-2027.0.0-alpha-7-windowsx86-64static.zip",
        sha256 = "60586eff8d72ffdbc895328e1fc3b3fd68377d1c695aa640aa09f2f37be8c146",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-7/wpimath-cpp-2027.0.0-alpha-7-windowsarm64static.zip",
        sha256 = "fea83fec37230930c2da9bea6f4b67b48e9e4cf7e7078f09f4914afa60e98f1c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-7/wpimath-cpp-2027.0.0-alpha-7-linuxarm64debug.zip",
        sha256 = "1e1ab7e629cb97b6fd1f2acf40387b8a8a13174ed05ce1c64517832ad608210f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-7/wpimath-cpp-2027.0.0-alpha-7-linuxx86-64debug.zip",
        sha256 = "631df1514aa99f537f08d4688ad9be9a4392923b86409779505cbe09dc2968b2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-7/wpimath-cpp-2027.0.0-alpha-7-osxuniversaldebug.zip",
        sha256 = "adbf06aaedc21544c918c346ec62273d20bdb7d3dea123ed0a11ae7294840238",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-7/wpimath-cpp-2027.0.0-alpha-7-windowsx86-64debug.zip",
        sha256 = "cb8a0a45a6497b00b90f95fdd27cbc211ef2319cba15ae6796e9c748b53fcf62",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-7/wpimath-cpp-2027.0.0-alpha-7-windowsarm64debug.zip",
        sha256 = "39431a00839e5395fdf97c842d0b155698cb23f6182092435c96273e1cbdd736",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-7/wpimath-cpp-2027.0.0-alpha-7-linuxarm64staticdebug.zip",
        sha256 = "3bb7b823de1a2edcf698c9df38bdc9d2d65e9e2902757b014e8e1289a01605f2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-7/wpimath-cpp-2027.0.0-alpha-7-linuxx86-64staticdebug.zip",
        sha256 = "b99ac34277773db07ea59ab273b9ae391134e3b8d5e7caf7ee6a654188dcd56c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-7/wpimath-cpp-2027.0.0-alpha-7-osxuniversalstaticdebug.zip",
        sha256 = "de960297e005bc55934c2e5d519629ee16e65658417f25f151fc006e0c3a2fdd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-7/wpimath-cpp-2027.0.0-alpha-7-windowsx86-64staticdebug.zip",
        sha256 = "e51d331124e0c7544ee35bbce6edc3700d23ad7fb93be2096935d365f3ff33c4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-7/wpimath-cpp-2027.0.0-alpha-7-windowsarm64staticdebug.zip",
        sha256 = "1a022e580875ee0d69a4b0c3535d1c9ca9b7364147f12a07fc1d83e4fd46a690",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-7/wpimath-cpp-2027.0.0-alpha-7-linuxsystemcore.zip",
        sha256 = "33cad6b4b57fcb5564a8b5a07f11c1fc445758ad08dd380d11b47fb0ffaec5a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-7/wpimath-cpp-2027.0.0-alpha-7-linuxsystemcorestatic.zip",
        sha256 = "e06a2b323f093ff128bd196c832f382363b49d869295926395000444bc20936b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-7/wpimath-cpp-2027.0.0-alpha-7-linuxsystemcoredebug.zip",
        sha256 = "d412c033a6f37d1d6935023f82341f7d6fb368bef22334213755b68ec0228dce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-7/wpimath-cpp-2027.0.0-alpha-7-linuxsystemcorestaticdebug.zip",
        sha256 = "3999d3c98bb0d45b6ae353b4b2647779aa13d90357195e5344a8c34257ea7a21",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-7/apriltag-cpp-2027.0.0-alpha-7-headers.zip",
        sha256 = "26209fceae96c5cb8e431717faee9269fc28e982cfd071535c6d839ffd9fb53e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-7/apriltag-cpp-2027.0.0-alpha-7-sources.zip",
        sha256 = "7af95fe31c885263521eb81a181d977c5f6d731d71b2fae1b542742c212fe1ec",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-7/apriltag-cpp-2027.0.0-alpha-7-linuxarm64.zip",
        sha256 = "fda3cfb159d97b33c1e5056c6f2479e3d8b60cdc88ff601acb9df0759b58d71e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-7/apriltag-cpp-2027.0.0-alpha-7-linuxx86-64.zip",
        sha256 = "dc477a04a32545f2af78d22541b4c1aea4a2f6fe6394701360d97b40b0d64608",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-7/apriltag-cpp-2027.0.0-alpha-7-osxuniversal.zip",
        sha256 = "2c443d2a0c9d12b504c5308c3f97250fbd3f12a80724ce01f67f6addf03674dd",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-7/apriltag-cpp-2027.0.0-alpha-7-windowsx86-64.zip",
        sha256 = "85c9f44467efec5ddb3dc007fbe129b37ace714faf9ffe676894a75727c4007d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-7/apriltag-cpp-2027.0.0-alpha-7-windowsarm64.zip",
        sha256 = "7b4c259baf1f4d986e6e6171c68d1ba7e17723af14e643e494c4aa7161247a82",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-7/apriltag-cpp-2027.0.0-alpha-7-linuxarm64static.zip",
        sha256 = "abe84cb34ede9f00dd52b1352435262d48cc51dc03b9d51d1736c4dd085e8bf2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-7/apriltag-cpp-2027.0.0-alpha-7-linuxx86-64static.zip",
        sha256 = "1e689a0f7028c743759c400fb38b23678e382867918330d207e722b4c383a1fd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-7/apriltag-cpp-2027.0.0-alpha-7-osxuniversalstatic.zip",
        sha256 = "c73cd26eea27bc067a2d377e2079f9546e60870f27e7e2183e3ca80158843521",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-7/apriltag-cpp-2027.0.0-alpha-7-windowsx86-64static.zip",
        sha256 = "7a6b1c692fb530b806bd4fb72bd8e55da144e56ab0307a320a966b98967bfc92",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-7/apriltag-cpp-2027.0.0-alpha-7-windowsarm64static.zip",
        sha256 = "4636e6e3f7c37e0d6900cea3986138a0a1ecfc1bba2ffc3ed23f64c1e5243917",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-7/apriltag-cpp-2027.0.0-alpha-7-linuxarm64debug.zip",
        sha256 = "05687e990d7c760af52c14d43e0332fa281ce2f54a6d54a065e723e86711c1af",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-7/apriltag-cpp-2027.0.0-alpha-7-linuxx86-64debug.zip",
        sha256 = "d0ed67c2a8134654ac4657af2e73586f3844d919f90c4faed187c8a67b329dcc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-7/apriltag-cpp-2027.0.0-alpha-7-osxuniversaldebug.zip",
        sha256 = "60224706e2100122d7fefa412e7a528ed07d302e9fc16cb5603629574cd1a01c",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-7/apriltag-cpp-2027.0.0-alpha-7-windowsx86-64debug.zip",
        sha256 = "40a2d8f36d18207ce52d94d4ed14bd1e780924674ddd9f232a7f0fec8b9f68de",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-7/apriltag-cpp-2027.0.0-alpha-7-windowsarm64debug.zip",
        sha256 = "c1a9a20982365392a0a6578b33c72901e50588950db7f7a5ea4ab5710ad723fd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-7/apriltag-cpp-2027.0.0-alpha-7-linuxarm64staticdebug.zip",
        sha256 = "a5af8664f284fe89d0bc8e92374ec78c1a69bbb25345e53fab4df5063f0d57b7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-7/apriltag-cpp-2027.0.0-alpha-7-linuxx86-64staticdebug.zip",
        sha256 = "0bc784cb357c9c99040db50d9f5d7efa66365360ad55c64a8d9139f25902cb40",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-7/apriltag-cpp-2027.0.0-alpha-7-osxuniversalstaticdebug.zip",
        sha256 = "8f2108f6afedae80e5fe35165bed8daae1710cde0b2081f8de408e861227c245",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-7/apriltag-cpp-2027.0.0-alpha-7-windowsx86-64staticdebug.zip",
        sha256 = "3e891af1058b3576f91fa5dd7ebe31bd50f17cfd4964f436c5c9a89faa539dab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-7/apriltag-cpp-2027.0.0-alpha-7-windowsarm64staticdebug.zip",
        sha256 = "7afc1de3fb401472a79d2ae360e454fbe80d051b51d534b1f9a44230803d2228",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-7/apriltag-cpp-2027.0.0-alpha-7-linuxsystemcore.zip",
        sha256 = "d16cd0a48b816504e870e55a178e760aad53268f45e471a6ca92aa65ecca114c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-7/apriltag-cpp-2027.0.0-alpha-7-linuxsystemcorestatic.zip",
        sha256 = "9699cf73316766436d8fad7667705c0b7a7e1e1aaf9836fb63cc98465c2d6306",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-7/apriltag-cpp-2027.0.0-alpha-7-linuxsystemcoredebug.zip",
        sha256 = "eed3dc0f818e4026c56881628e02750ad3de60d70ba8a1410d1ac8da81c4b40e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-7/apriltag-cpp-2027.0.0-alpha-7-linuxsystemcorestaticdebug.zip",
        sha256 = "4b9dce1c46628e73f25082cb016d1e15b822bfa6b4a9ed7df79327cb0afcaa03",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-7/ntcore-cpp-2027.0.0-alpha-7-headers.zip",
        sha256 = "d5f869563a5b8e8ba396923ad5f6878a3bd83fef27fa201b49fe7efdc5d92114",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-7/ntcore-cpp-2027.0.0-alpha-7-sources.zip",
        sha256 = "b469b76d88a08b329206238b639dbe80a2d89f35542a9534682f434f86ad8a1c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-7/ntcore-cpp-2027.0.0-alpha-7-linuxarm64.zip",
        sha256 = "0266ca3ef07672f5ff0a590ca8f13cc3354534859a8d3e558e73e91c41276588",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-7/ntcore-cpp-2027.0.0-alpha-7-linuxx86-64.zip",
        sha256 = "684b6f0507d439f88f4daf318b928b7900624c57a0ab819cb97b1a791c9222cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-7/ntcore-cpp-2027.0.0-alpha-7-osxuniversal.zip",
        sha256 = "49c307870055518bf337fc3518c1905bac9f95bff05b7918a2616f7797f820e5",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-7/ntcore-cpp-2027.0.0-alpha-7-windowsx86-64.zip",
        sha256 = "3281c65553e9dafa85b7e1e590acfa01b44a1e11513f9550f43494a1ebde8117",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-7/ntcore-cpp-2027.0.0-alpha-7-windowsarm64.zip",
        sha256 = "bf451bd547544fe1a378729dca93f10e6a64ead74651e862ea2ebd24b11ee754",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-7/ntcore-cpp-2027.0.0-alpha-7-linuxarm64static.zip",
        sha256 = "b36cd53b2d608d54b1b4e307e908d32a72f26e21eac019cbbc7fdb97577b9fa3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-7/ntcore-cpp-2027.0.0-alpha-7-linuxx86-64static.zip",
        sha256 = "09a1f9fd41937cea3e7e6e2bdffb29b504d02fdb5703646ef9750e953081fff9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-7/ntcore-cpp-2027.0.0-alpha-7-osxuniversalstatic.zip",
        sha256 = "cca26646f661f8462ee77a51e19ef84ac2087adc387c515732270206757d6736",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-7/ntcore-cpp-2027.0.0-alpha-7-windowsx86-64static.zip",
        sha256 = "0dc778ab01c573602bb26a4797686e26a0ce962bbe0a5f6bbb946d88b628904c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-7/ntcore-cpp-2027.0.0-alpha-7-windowsarm64static.zip",
        sha256 = "4365156d9d8aa6737074fd197015167c9734b5bdc847289a745387f4480d31ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-7/ntcore-cpp-2027.0.0-alpha-7-linuxarm64debug.zip",
        sha256 = "07d426b4a7bc115a1b4115a556a121cb8ff7902f6aa97e33401c30fa7dc8f706",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-7/ntcore-cpp-2027.0.0-alpha-7-linuxx86-64debug.zip",
        sha256 = "dd376fd94d6cee988f07fcc8291bec4aac736fc98dca48797d8b8070bb57e704",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-7/ntcore-cpp-2027.0.0-alpha-7-osxuniversaldebug.zip",
        sha256 = "83ed94cc2369b13eaf83977c19480f43341dac8cf599d4c33d3679ab365afb25",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-7/ntcore-cpp-2027.0.0-alpha-7-windowsx86-64debug.zip",
        sha256 = "115fcd53921c795f718f4378ef1130bb96097bd0ed5a6d16cf8549f94c642a20",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-7/ntcore-cpp-2027.0.0-alpha-7-windowsarm64debug.zip",
        sha256 = "03663b1950ac405ce80f8b19e0852b366c3b695b4a33038c46614b78c6d89d0b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-7/ntcore-cpp-2027.0.0-alpha-7-linuxarm64staticdebug.zip",
        sha256 = "9229285f38d6a1c284794ff636ff1bb74a5470b31391b56799a0919ca25fbb02",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-7/ntcore-cpp-2027.0.0-alpha-7-linuxx86-64staticdebug.zip",
        sha256 = "c4e9a3292d84918198467d655a0db9ec4163349a5dcdd5f0b3f2c5e2752e7f14",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-7/ntcore-cpp-2027.0.0-alpha-7-osxuniversalstaticdebug.zip",
        sha256 = "59ef9e1e2b6cef0d143e37b9d7d6fc0d865d28edcd0e74a462fe4c52079e32a3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-7/ntcore-cpp-2027.0.0-alpha-7-windowsx86-64staticdebug.zip",
        sha256 = "ac656eef016e2a9024efc2bab177a9f67c03734f31bc115f4bfd3605fadaef13",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-7/ntcore-cpp-2027.0.0-alpha-7-windowsarm64staticdebug.zip",
        sha256 = "31a5de188e6bdcbbf7e04aa7355a7b658d56cf07cf6b32afd0123e463997b572",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-7/ntcore-cpp-2027.0.0-alpha-7-linuxsystemcore.zip",
        sha256 = "842416022fb7680788218e9f4f6cbd1723a238f8654d6b9631fedeb84bc1d582",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-7/ntcore-cpp-2027.0.0-alpha-7-linuxsystemcorestatic.zip",
        sha256 = "ae78678e491afa184b590338de5d385849e3dbd15b4d98645af31a12bb593a31",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-7/ntcore-cpp-2027.0.0-alpha-7-linuxsystemcoredebug.zip",
        sha256 = "21611b2f95388ea7bfc865fa8b0932a0b4d138adfa2ac340c0dc706d00ad1305",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-7/ntcore-cpp-2027.0.0-alpha-7-linuxsystemcorestaticdebug.zip",
        sha256 = "24eb69235548cb27d12aa0ca12a89e8fbe38395c036ab29f1835ef8cf94a5710",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-7/hal-cpp-2027.0.0-alpha-7-headers.zip",
        sha256 = "63c1d6332962ef8d922787707513f4f47cee5fe3b30dd90cb5d741237c7f7d11",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-7/hal-cpp-2027.0.0-alpha-7-sources.zip",
        sha256 = "d96c83828ea2c3678d8d8b26058b66d9ad392e47c639777314906491c99cd001",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-7/hal-cpp-2027.0.0-alpha-7-linuxarm64.zip",
        sha256 = "391fe6e26ffe2f76c0accfa6d3f67edff1cfb7de7dd654287029185b55265bc1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-7/hal-cpp-2027.0.0-alpha-7-linuxx86-64.zip",
        sha256 = "bd46c0e2d359d62e4d39111d64c55a9926db2ae7f675f41eaeba6d11d7f54cef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-7/hal-cpp-2027.0.0-alpha-7-osxuniversal.zip",
        sha256 = "9c93acf4da47d1af3fc6d689668d1805849af149dc43c683621dfba55eb40240",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-7/hal-cpp-2027.0.0-alpha-7-windowsx86-64.zip",
        sha256 = "bfe2f47361ae60ed48f81942539d9450c8ea7390b750f2b64b44950823317a59",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-7/hal-cpp-2027.0.0-alpha-7-windowsarm64.zip",
        sha256 = "6c06ca828d58491313035c70fe5cab88f613e62884de4c37e84eb22d4a9f051d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-7/hal-cpp-2027.0.0-alpha-7-linuxarm64static.zip",
        sha256 = "19899b95144d14f63124423764e28eee46a9991403a7602e88ae63d6456464fe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-7/hal-cpp-2027.0.0-alpha-7-linuxx86-64static.zip",
        sha256 = "bc55c1bbc95bfb1eabae2a962b293de37d2a1cb2ac795fd9d139c85504f6ba56",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-7/hal-cpp-2027.0.0-alpha-7-osxuniversalstatic.zip",
        sha256 = "06f092316c3cdc370f28f4dcda34364b41a93d5076df36bf72299db8f429925e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-7/hal-cpp-2027.0.0-alpha-7-windowsx86-64static.zip",
        sha256 = "37fd6668ba2171b8a5c7d4a66b95103a7c8684e52ae0585dd19368fefd1f8a4a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-7/hal-cpp-2027.0.0-alpha-7-windowsarm64static.zip",
        sha256 = "a24432cf8a52bf40c495dd6d211ecde960063ce049488d292aa52c8ac37da7fd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-7/hal-cpp-2027.0.0-alpha-7-linuxarm64debug.zip",
        sha256 = "d43a40eaf2decd2cd850ba0e785135a1d190f363bb29baf362c74eeebe8834bb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-7/hal-cpp-2027.0.0-alpha-7-linuxx86-64debug.zip",
        sha256 = "71e27cb2610b89c7e6467137307bd305251bd71737d9149459e7c1aacf91e470",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-7/hal-cpp-2027.0.0-alpha-7-osxuniversaldebug.zip",
        sha256 = "f78218c1d120b339b907a94d6149c2897d1d6c08d61e1f905ae4dcdbf7980661",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-7/hal-cpp-2027.0.0-alpha-7-windowsx86-64debug.zip",
        sha256 = "673fa3ea79191572cff14d19d25f582273ae9530939a9f417bc15c2f4606c771",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-7/hal-cpp-2027.0.0-alpha-7-windowsarm64debug.zip",
        sha256 = "ce34edd80a8da0a15a6a79fdd148dba19ba82c866fec074320561c462aa1b7cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-7/hal-cpp-2027.0.0-alpha-7-linuxarm64staticdebug.zip",
        sha256 = "64bbf3fdb8c3659ccc992b3f890bd07d0f17e8c651c29e24a7dbfb09ce18c17d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-7/hal-cpp-2027.0.0-alpha-7-linuxx86-64staticdebug.zip",
        sha256 = "2284c5384e88e41ab7c324f059981ead3d2377a41cbb31392dbdc78d76cee15a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-7/hal-cpp-2027.0.0-alpha-7-osxuniversalstaticdebug.zip",
        sha256 = "8fbc69cf86950593c6c31d966680a943a94933d88c6868e3b3c4e6b5b69b76a6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-7/hal-cpp-2027.0.0-alpha-7-windowsx86-64staticdebug.zip",
        sha256 = "fd86886f58e88667ab931285ac82d50df3e3464e12a1dbb9b40ba0b7c279eaf6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-7/hal-cpp-2027.0.0-alpha-7-windowsarm64staticdebug.zip",
        sha256 = "7f964ca216148d4b25a8635a40382887c3b3dd259fafef195e887f6dc84e7294",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-7/hal-cpp-2027.0.0-alpha-7-linuxsystemcore.zip",
        sha256 = "a012d67cbc9d1590f965d93d0c17a19ae71edb698a285baa932fcf4267aac540",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-7/hal-cpp-2027.0.0-alpha-7-linuxsystemcorestatic.zip",
        sha256 = "a64d47b1aa1bdc30fee365f351a27271a3bb077332960a25c1fd5f201a5b7718",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-7/hal-cpp-2027.0.0-alpha-7-linuxsystemcoredebug.zip",
        sha256 = "d0b61d82c2f28ec67fef8aef91947e6ac51f9c0c7ae226cd6600415318e5f310",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/hal/hal-cpp/2027.0.0-alpha-7/hal-cpp-2027.0.0-alpha-7-linuxsystemcorestaticdebug.zip",
        sha256 = "53126622b26b5c0156d05e89d0e295c422aa0f89e3ed145dbe63f6672c5b6be9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-7/cscore-cpp-2027.0.0-alpha-7-headers.zip",
        sha256 = "e7950cf84d3352d172482522f2be50c029ba3985f722e699c099636f4682e0dd",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-7/cscore-cpp-2027.0.0-alpha-7-sources.zip",
        sha256 = "95690314c4564e7496a90e83fb28df515cfcefad8a94f55713f5b6a2088734fd",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-7/cscore-cpp-2027.0.0-alpha-7-linuxarm64.zip",
        sha256 = "f0d31251586ebe565f9fc1bce4a7781783b9e505635fce7ec125986431722d0c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-7/cscore-cpp-2027.0.0-alpha-7-linuxx86-64.zip",
        sha256 = "194c28b08420cc9cf552293fb99aa9979ae1a574902ec794fceb9b29cd307483",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-7/cscore-cpp-2027.0.0-alpha-7-osxuniversal.zip",
        sha256 = "020f63c0e499e2a4a477127bbef268b29acecb626df1bc85835bf9d2e2f49f8e",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-7/cscore-cpp-2027.0.0-alpha-7-windowsx86-64.zip",
        sha256 = "f76ee5144dc706978c4813f7e6d07c32667a6ab61778960d91498f00e04d8860",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-7/cscore-cpp-2027.0.0-alpha-7-windowsarm64.zip",
        sha256 = "34e6e8945bb4280e59ad5134217bd515b8a17680c1e67850873ef69dee1043d3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-7/cscore-cpp-2027.0.0-alpha-7-linuxarm64static.zip",
        sha256 = "a6e39d405947590a015f02f093a3c3132c5fd79bdd218f3acbc607d8e3256190",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-7/cscore-cpp-2027.0.0-alpha-7-linuxx86-64static.zip",
        sha256 = "b9c24a94fc99b8015a745d61b1caa5b64bfebaf97cd6a71bf3750add89ac5799",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-7/cscore-cpp-2027.0.0-alpha-7-osxuniversalstatic.zip",
        sha256 = "6db66b8cc1948f58b1a41628302b7f9eef0ac57a2c1b92ae170511fc72214c46",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-7/cscore-cpp-2027.0.0-alpha-7-windowsx86-64static.zip",
        sha256 = "41ada031c412ff40145231a28d120c031aa9786a79d9b58654b05aaf38dd3210",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-7/cscore-cpp-2027.0.0-alpha-7-windowsarm64static.zip",
        sha256 = "f2346c4a365f6d61c7318a5f01e8ff30bb6b0b9512478626f22acdb748f656c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-7/cscore-cpp-2027.0.0-alpha-7-linuxarm64debug.zip",
        sha256 = "d24f89306b29b667ef76e0f1a400f82dd075ec9e2928c4044691e90046489451",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-7/cscore-cpp-2027.0.0-alpha-7-linuxx86-64debug.zip",
        sha256 = "670929f4f9d4be6c0796847ff53e9d48c6427ca969c0f97b80ceb9ae98d8cca6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-7/cscore-cpp-2027.0.0-alpha-7-osxuniversaldebug.zip",
        sha256 = "519afbcff69c9af52bebc53ff474a0bc3bdb8720907085bce668aaf44caa94f6",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-7/cscore-cpp-2027.0.0-alpha-7-windowsx86-64debug.zip",
        sha256 = "b24037f2808d1f72b08697352b553e380ab922ff87207549b8a9f0ec97064821",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-7/cscore-cpp-2027.0.0-alpha-7-windowsarm64debug.zip",
        sha256 = "15d3f298cad4ae51bc476bc6fa2983c1643d6bda17ea5426f2d163b3c1bb34e2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-7/cscore-cpp-2027.0.0-alpha-7-linuxarm64staticdebug.zip",
        sha256 = "e55db8fe5b39f8ef149828e77c3b9a4b1fb55def727a903a392146845b63ddeb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-7/cscore-cpp-2027.0.0-alpha-7-linuxx86-64staticdebug.zip",
        sha256 = "3832f17d7e5aa6deb98fd0b6c4af50275f26af2da65cb54f78cd43defade7761",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-7/cscore-cpp-2027.0.0-alpha-7-osxuniversalstaticdebug.zip",
        sha256 = "4bbd7baeed1fc219dee04cde0e97fa4baff6ee0719c00c64bfcc73f3a307fe29",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-7/cscore-cpp-2027.0.0-alpha-7-windowsx86-64staticdebug.zip",
        sha256 = "d45c005388de2aa96045629973c2003396f338ea633f1eb4c5d7a5a82c135b52",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-7/cscore-cpp-2027.0.0-alpha-7-windowsarm64staticdebug.zip",
        sha256 = "8441d09661b6a54173522d491242519a79dd9ebe43ac5eff9f7677eb5919c577",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-7/cscore-cpp-2027.0.0-alpha-7-linuxsystemcore.zip",
        sha256 = "2802b71cdf2ec430b2eee89938d08b4985ed8fb197490d60337cc55aaaf44810",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-7/cscore-cpp-2027.0.0-alpha-7-linuxsystemcorestatic.zip",
        sha256 = "9c2f8e16e667fa5ea5e43baf7d511e73d54f75a6f51b797c5729a11656d356bf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-7/cscore-cpp-2027.0.0-alpha-7-linuxsystemcoredebug.zip",
        sha256 = "797d8d61752467abec11f1b7c2ef69efdd5bac2b7cd8e23e8127433702f56870",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-7/cscore-cpp-2027.0.0-alpha-7-linuxsystemcorestaticdebug.zip",
        sha256 = "11ebaaa2b01c4a930fbf7ee75fef603685d358358ce5a6da990d5e55d80e190b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-7/cameraserver-cpp-2027.0.0-alpha-7-headers.zip",
        sha256 = "4423aa87f5ec8f0de1c5379d75ab98f9906d3eaef573ccc00fe658941dd989e9",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-7/cameraserver-cpp-2027.0.0-alpha-7-sources.zip",
        sha256 = "6a51609a77c7972716ff10b02e2b1c28ac4b94551bb1f4442585f48f1d3d339e",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-7/cameraserver-cpp-2027.0.0-alpha-7-linuxarm64.zip",
        sha256 = "31361c567f0f6ddfd5f9a8f29e8c93f54d7f4210730439f5da4274e0f8e0825e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-7/cameraserver-cpp-2027.0.0-alpha-7-linuxx86-64.zip",
        sha256 = "1d2d38e5449e699054b4a4e17a75b74b217a22958feecc237b18f923105fabf2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-7/cameraserver-cpp-2027.0.0-alpha-7-osxuniversal.zip",
        sha256 = "61ae70d3b4050bee04ec8b869363e5a0a0fa608e435381872d76b3a76b9e5344",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-7/cameraserver-cpp-2027.0.0-alpha-7-windowsx86-64.zip",
        sha256 = "ab614a607cba16673ca16d927d32f598bb1e496e339357f7a2af6d46ecaa60f0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-7/cameraserver-cpp-2027.0.0-alpha-7-windowsarm64.zip",
        sha256 = "f63ec5f655752484ed08e5f656c22a1356821f375e6a438cd0820d94dc312895",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-7/cameraserver-cpp-2027.0.0-alpha-7-linuxarm64static.zip",
        sha256 = "e192ddb6af42e778a9432d79c1bc1807ba90d01b68171234d4de2fb7cc0f153e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-7/cameraserver-cpp-2027.0.0-alpha-7-linuxx86-64static.zip",
        sha256 = "831b045177c556e11ae2d5a7bf44739454c6c39944e5bcd25ffdf0b918e36e7f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-7/cameraserver-cpp-2027.0.0-alpha-7-osxuniversalstatic.zip",
        sha256 = "cbf40bfb023bb027cf418210e4ecf75d53039cffd3f647103c267d7899a55170",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-7/cameraserver-cpp-2027.0.0-alpha-7-windowsx86-64static.zip",
        sha256 = "559718a667795af34a7624dba79020adb863ddf2caf2cc88488a653185f90274",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-7/cameraserver-cpp-2027.0.0-alpha-7-windowsarm64static.zip",
        sha256 = "7df17a482053e96f29eeab79951a2c3ff13b8065831d342fd095ce5638b5cb74",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-7/cameraserver-cpp-2027.0.0-alpha-7-linuxarm64debug.zip",
        sha256 = "ba8c456f1cd4cf2ea8ca9a0904195275012c8098f0008a8b794b46bc2648dc05",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-7/cameraserver-cpp-2027.0.0-alpha-7-linuxx86-64debug.zip",
        sha256 = "bc544da6fb207e471d919c30fc85caa3a3464823c4d9ad4d444e4a3496cb8d84",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-7/cameraserver-cpp-2027.0.0-alpha-7-osxuniversaldebug.zip",
        sha256 = "a0d159159ba257db54cbb81a73d776870ca615d8157612c099b93186d6a72cd6",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-7/cameraserver-cpp-2027.0.0-alpha-7-windowsx86-64debug.zip",
        sha256 = "0c4acc62bb922229f634e4c84e95a47a730fb80d5dcf38366d19252ab5c80f54",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-7/cameraserver-cpp-2027.0.0-alpha-7-windowsarm64debug.zip",
        sha256 = "df71c600a8528eb1cb38d8bfc9da9d0bb674532510dd3b25dad6ab44fa863493",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-7/cameraserver-cpp-2027.0.0-alpha-7-linuxarm64staticdebug.zip",
        sha256 = "d95489e110b70cf13d4efb5ddf0e5b5dd96f5782683405e974eb916ed5ee17dc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-7/cameraserver-cpp-2027.0.0-alpha-7-linuxx86-64staticdebug.zip",
        sha256 = "1e4616f8b6e90b10f1b813edfe9fce9cbb76263f1f3dd331a8f1546b0983ed3e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-7/cameraserver-cpp-2027.0.0-alpha-7-osxuniversalstaticdebug.zip",
        sha256 = "fd8004a345d0635f388eeefa2d7b085163942e047ca7890d3f97b1332d43edec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-7/cameraserver-cpp-2027.0.0-alpha-7-windowsx86-64staticdebug.zip",
        sha256 = "b1a227634d0fc8bc3e6753e3237d75dc11d90e0dfe0ad1bf3b4f5d2e0d6349b7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-7/cameraserver-cpp-2027.0.0-alpha-7-windowsarm64staticdebug.zip",
        sha256 = "a260a358afa8d64e59485b6d396cc20dabaf9fd69e292fe5b70dd1e5122c48d0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-7/cameraserver-cpp-2027.0.0-alpha-7-linuxsystemcore.zip",
        sha256 = "4c5cadf4a6021a9f1acf87c44666e79a205fa771d890d9cb60ca6dc7ff9bf28e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-7/cameraserver-cpp-2027.0.0-alpha-7-linuxsystemcorestatic.zip",
        sha256 = "a93a40b5b72ce08b4efab1de949b1fff4ae6978b61b9d796244fe4b97c6e06d9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-7/cameraserver-cpp-2027.0.0-alpha-7-linuxsystemcoredebug.zip",
        sha256 = "6d64ccfd899ccbdbb041321cf23c9e97097f273a3210d5bb3b1d14326c68e3f3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-7/cameraserver-cpp-2027.0.0-alpha-7-linuxsystemcorestaticdebug.zip",
        sha256 = "d2b3752387d6ae76ef467b1e95a287389a09fc874a365bf3c3a6ba395fd5f32c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-7/wpilibc-cpp-2027.0.0-alpha-7-headers.zip",
        sha256 = "53a3a6601cdf74b8e57096f822f2649174691a255a7892556d6b3a1ef37444ab",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-7/wpilibc-cpp-2027.0.0-alpha-7-sources.zip",
        sha256 = "6ddbdb66896d5571f1a3ba170d55f1f3090db0f28ea6a460c001553916fbd2a2",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-7/wpilibc-cpp-2027.0.0-alpha-7-linuxarm64.zip",
        sha256 = "3f41732d654ea92d1e916adb4dbf4c3e78c485534418ca13d6b7334c7b9e42bb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-7/wpilibc-cpp-2027.0.0-alpha-7-linuxx86-64.zip",
        sha256 = "51eab6d6e4ebeadeae63eda33632b838c2118f78105e25462b1d7269fa9b99c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-7/wpilibc-cpp-2027.0.0-alpha-7-osxuniversal.zip",
        sha256 = "8df106fa8ced07e2dc785710923dec7e32504194a152fadac3f9a6036826cd29",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-7/wpilibc-cpp-2027.0.0-alpha-7-windowsx86-64.zip",
        sha256 = "6658a8dff284cb90a55d956ddfa2f3059a5e2265336fd0e9cd76e183924f21fa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-7/wpilibc-cpp-2027.0.0-alpha-7-windowsarm64.zip",
        sha256 = "a2575053552d8d2a53144179c08e038711816b5cea19aa8927f04dd2479bdfd0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-7/wpilibc-cpp-2027.0.0-alpha-7-linuxarm64static.zip",
        sha256 = "30aa9bd4992f7e25dbac7bae8c0f4fe6368ab4bf69cba26d35b9a002d1411355",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-7/wpilibc-cpp-2027.0.0-alpha-7-linuxx86-64static.zip",
        sha256 = "46e9b5b362e3e7cd25c01b50ddab4e22e17b8799eb330ea0c5842a6d4a4cef3b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-7/wpilibc-cpp-2027.0.0-alpha-7-osxuniversalstatic.zip",
        sha256 = "7e0e731f8292cb7188118bea0249b1bdea206166b54eb8e7d2bf89257dda322b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-7/wpilibc-cpp-2027.0.0-alpha-7-windowsx86-64static.zip",
        sha256 = "98476205866e1e6fdfb8dbc937ffeca6531bb2a0c264c343e515054304e3be06",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-7/wpilibc-cpp-2027.0.0-alpha-7-windowsarm64static.zip",
        sha256 = "4a57c5d0cc7b296694724c06bab41143f38324840de0f5be5f9bab933ab0056f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-7/wpilibc-cpp-2027.0.0-alpha-7-linuxarm64debug.zip",
        sha256 = "819a4fe8387c58e6a51ace82e4c4527da5f58ecaefee919e73bd9506e88d3963",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-7/wpilibc-cpp-2027.0.0-alpha-7-linuxx86-64debug.zip",
        sha256 = "96ee481afb68e54ed3d9e24062f520f05b9dc1d113580e578440eefe808577ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-7/wpilibc-cpp-2027.0.0-alpha-7-osxuniversaldebug.zip",
        sha256 = "2f193f5d77160f6a09bc888297ffa05ac787b28d24360f04e9aa29ba59d83285",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-7/wpilibc-cpp-2027.0.0-alpha-7-windowsx86-64debug.zip",
        sha256 = "cf82ebbf97107a46030df6607b88076eeb9caf9769327e49089c0a28f867aadc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-7/wpilibc-cpp-2027.0.0-alpha-7-windowsarm64debug.zip",
        sha256 = "477e28a9c75cbdd2c4687bd6805301ad6abe4614374b6f9f3d3eb50cc5a0ee82",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-7/wpilibc-cpp-2027.0.0-alpha-7-linuxarm64staticdebug.zip",
        sha256 = "38115201c116e91400c3e044c7e784d072e83724d48d07dbecf8ec8cb80734f4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-7/wpilibc-cpp-2027.0.0-alpha-7-linuxx86-64staticdebug.zip",
        sha256 = "791bbab0e9dee00e7fe0af5117ca06866871cd460509f49c3443cf05c35766e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-7/wpilibc-cpp-2027.0.0-alpha-7-osxuniversalstaticdebug.zip",
        sha256 = "41ab768bcf90cb64500ddaacefb0a8ffa80a6cf36379729964a0ad537024ddd5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-7/wpilibc-cpp-2027.0.0-alpha-7-windowsx86-64staticdebug.zip",
        sha256 = "6684e5d36216e35484575a76119a65a430f9d539a59264dc1dc77bad7382253d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-7/wpilibc-cpp-2027.0.0-alpha-7-windowsarm64staticdebug.zip",
        sha256 = "941d829ddbb4e8b1d0ee97e0810299f0a86b62dbb00e81446d37fb5e63f00775",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-7/wpilibc-cpp-2027.0.0-alpha-7-linuxsystemcore.zip",
        sha256 = "b54bdc4e34dc902a8696bdf013de2b478a9d34a3e1b1d07467d8723795a7f539",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-7/wpilibc-cpp-2027.0.0-alpha-7-linuxsystemcorestatic.zip",
        sha256 = "e1c6088732f83642510bfdcd28afe1ac19315afcb16d126d6b4ddb8900499df3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-7/wpilibc-cpp-2027.0.0-alpha-7-linuxsystemcoredebug.zip",
        sha256 = "a32993376be979dccbabd8ed2a33137451e0c08966250b7b22a202d1792bb96e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-7/wpilibc-cpp-2027.0.0-alpha-7-linuxsystemcorestaticdebug.zip",
        sha256 = "46828d213c283b3b98e96b56afb475deba87bb109f0d504ae6cdf1a69d0d8c69",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-7/drivers-cpp-2027.0.0-alpha-7-headers.zip",
        sha256 = "c0e70a88a0932bdf1c72b3c7f791895d09570a1674ed932d4c39fc56e5182420",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-7/drivers-cpp-2027.0.0-alpha-7-sources.zip",
        sha256 = "98331773a47767636991d64babdce64584adb88e367a0709eab2cb0a31f0a928",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-7/drivers-cpp-2027.0.0-alpha-7-linuxarm64.zip",
        sha256 = "35f025f2d86cf8468ed71cb7ba1231a337b68df36abae222ba02e7de0b02e5b4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-7/drivers-cpp-2027.0.0-alpha-7-linuxx86-64.zip",
        sha256 = "a5ba2534962ed368f868602cd80221e629c5f20d2de3e72a2c5a1142f1b327eb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-7/drivers-cpp-2027.0.0-alpha-7-osxuniversal.zip",
        sha256 = "5830a35ffea354c2f8e0ee718886e45e96554955399db52faee32c486121a92b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libdrivers.dylib osx/universal/shared/libdrivers.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libdrivers.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libdrivers.dylib",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-7/drivers-cpp-2027.0.0-alpha-7-windowsx86-64.zip",
        sha256 = "ed038d2864ed038c9c4bda1a9ff0bdad0211d178dcf404099373fbbd85dd8267",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-7/drivers-cpp-2027.0.0-alpha-7-windowsarm64.zip",
        sha256 = "52dae908c08b6b695ed62103621590b470faeac491b506e7f31671b782b0b791",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-7/drivers-cpp-2027.0.0-alpha-7-linuxarm64static.zip",
        sha256 = "c3cba4816cdc25ee0d035a0d5351b7625c5d204c1179345c71ada88ec832d928",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-7/drivers-cpp-2027.0.0-alpha-7-linuxx86-64static.zip",
        sha256 = "155c81742831ab661a35f39c83daa23885c7c345af6c441385f2c3414cf56cb8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-7/drivers-cpp-2027.0.0-alpha-7-osxuniversalstatic.zip",
        sha256 = "bd9ea238e2edb5399ef6d6d50a793d3b010251591b6293fe56b7cd7fc6458041",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-7/drivers-cpp-2027.0.0-alpha-7-windowsx86-64static.zip",
        sha256 = "9797c504ea77c8f7ecc7c9af5e44b00391be6c6e5f26ad32da2c1dafd81b8a37",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-7/drivers-cpp-2027.0.0-alpha-7-windowsarm64static.zip",
        sha256 = "ab2fbf758576ad7278190b25cc425075360d208fb77873062fd264da83a9ac7d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-7/drivers-cpp-2027.0.0-alpha-7-linuxarm64debug.zip",
        sha256 = "860e48da1fa689f1076f66769fccd7d771f4ce9d30778d666b7c9186833ee751",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-7/drivers-cpp-2027.0.0-alpha-7-linuxx86-64debug.zip",
        sha256 = "00a886f376c8e0ef2c033f35232036dbe0bef4d578a037981f4182d879f39747",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-7/drivers-cpp-2027.0.0-alpha-7-osxuniversaldebug.zip",
        sha256 = "c51c6d400b4a44382479d371f590f9be3dcf98c8bf39458674e6be75b84adff0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libdrivers.dylib osx/universal/shared/libdrivers.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libdrivers.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libdrivers.dylib",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-7/drivers-cpp-2027.0.0-alpha-7-windowsx86-64debug.zip",
        sha256 = "ee9febc95a8dd4d36ba965714efda2da241218c7b477b13353dd41a80a18c3cc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-7/drivers-cpp-2027.0.0-alpha-7-windowsarm64debug.zip",
        sha256 = "6d29bc2d399c0b08485a35f4501361b6832628e2316deb68053d943488ddac30",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-7/drivers-cpp-2027.0.0-alpha-7-linuxarm64staticdebug.zip",
        sha256 = "5dd7d17ed1d53a41c7e979f338fce373fd71243b029909abd93b683d585b86f9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-7/drivers-cpp-2027.0.0-alpha-7-linuxx86-64staticdebug.zip",
        sha256 = "32c2e7822171df16d6f0817502eb89d73ef18ea18a076098df5c56417c5a7e0c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-7/drivers-cpp-2027.0.0-alpha-7-osxuniversalstaticdebug.zip",
        sha256 = "02dc1b0659d66bed405f322931be7014b44a718b7bde6bf3d156affa077c4af4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-7/drivers-cpp-2027.0.0-alpha-7-windowsx86-64staticdebug.zip",
        sha256 = "6466557bd9cca05354c98fcee33ac5d43603c02561facb95e3535f8578e5d253",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-7/drivers-cpp-2027.0.0-alpha-7-windowsarm64staticdebug.zip",
        sha256 = "da80cfb4a1916cea43f29d9c679ec226eb898d108742474edfca0089b666ab24",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-7/drivers-cpp-2027.0.0-alpha-7-linuxsystemcore.zip",
        sha256 = "d8bf0e8b9ce44f6edcfc330792b8a83766c1e843d1305f7683e091495d061779",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-7/drivers-cpp-2027.0.0-alpha-7-linuxsystemcorestatic.zip",
        sha256 = "ce9516ea998751a10a004ce4eab8cf8a620e2643ada64c153b562fc89bde6485",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-7/drivers-cpp-2027.0.0-alpha-7-linuxsystemcoredebug.zip",
        sha256 = "2eae45049800063d11e88227ea5ccbfbb1ee00501d39894bb23770d120faecb8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_drivers_drivers-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/drivers/drivers-cpp/2027.0.0-alpha-7/drivers-cpp-2027.0.0-alpha-7-linuxsystemcorestaticdebug.zip",
        sha256 = "94edccf0653b74f9cb456fb6b569f807b45445b03d570215e77d3bd9d596a196",
        build_file = "@bzlmodrio-allwpilib//private/cpp/drivers:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-7/commandsv2-cpp-2027.0.0-alpha-7-headers.zip",
        sha256 = "d9c2a7bc439a7226c3f0815ce519e07c4902b1c6c9210de2b747e9d97c9d0a9a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-7/commandsv2-cpp-2027.0.0-alpha-7-sources.zip",
        sha256 = "023993cb0b5186c18962e7ad0a41e723e902fde738feed7a4e44d8325c15c9f1",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-7/commandsv2-cpp-2027.0.0-alpha-7-linuxarm64.zip",
        sha256 = "ed3b23519b29b12a8d497b4257cc6eb748efebe251461ab83ebd6aa1514715df",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-7/commandsv2-cpp-2027.0.0-alpha-7-linuxx86-64.zip",
        sha256 = "39d2b7fd8912770ef2242782721450fcef3b8302dee6bae0f38a7bd00140db27",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-7/commandsv2-cpp-2027.0.0-alpha-7-osxuniversal.zip",
        sha256 = "7935838ca414c38ac04276b105b5b7b6b5af976643100c3b4f727ff272498f2c",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-7/commandsv2-cpp-2027.0.0-alpha-7-windowsx86-64.zip",
        sha256 = "4275b2dfdeb07b97b950f84c96b67f4b54b1455476f9e4bda41acff4c97594d2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-7/commandsv2-cpp-2027.0.0-alpha-7-windowsarm64.zip",
        sha256 = "6ae22037e5f7f03dc5ab4bd786a18f3202e2ddeaa3414cd6a4eda01bc2067c07",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-7/commandsv2-cpp-2027.0.0-alpha-7-linuxarm64static.zip",
        sha256 = "28ae9349081d8ef824fe6c257d7180b694b1cd8ae78bc5d7e531b2a8f743e761",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-7/commandsv2-cpp-2027.0.0-alpha-7-linuxx86-64static.zip",
        sha256 = "e23cbfed459c6728e34037736eb971b3989baa1df75dc8ecd0bad849b44083c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-7/commandsv2-cpp-2027.0.0-alpha-7-osxuniversalstatic.zip",
        sha256 = "c0ab121f23d50d7401b967235ebc41256c094cf318f124ab18da90bf5426d343",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-7/commandsv2-cpp-2027.0.0-alpha-7-windowsx86-64static.zip",
        sha256 = "fee195506fa3e06e78359669b7637365fd7ee7db1914a5798173da5c772b20ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-7/commandsv2-cpp-2027.0.0-alpha-7-windowsarm64static.zip",
        sha256 = "bde9d4a78fb149deb2e3fe5a0dc6d4fa1c89cc70835d44100bb59fd6eb1caa6c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-7/commandsv2-cpp-2027.0.0-alpha-7-linuxarm64debug.zip",
        sha256 = "a1a1ef3f6746dc8ac48c1201c2c6a2bc41f275996241a67ddbca7bc8d5a90bda",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-7/commandsv2-cpp-2027.0.0-alpha-7-linuxx86-64debug.zip",
        sha256 = "9a962b6e34681ece2f99a45270d53d195b6e335a28e1b50821aa88125b626e49",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-7/commandsv2-cpp-2027.0.0-alpha-7-osxuniversaldebug.zip",
        sha256 = "3e9f7394a109f85119c227dec17d2464c04d7c7a7f8ea9c59271ff26f3a92943",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-7/commandsv2-cpp-2027.0.0-alpha-7-windowsx86-64debug.zip",
        sha256 = "4f631ae6699ff7e9a4c568ca20d36217cd33917f23b1ba9daa5dd28bdffd6a1c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-7/commandsv2-cpp-2027.0.0-alpha-7-windowsarm64debug.zip",
        sha256 = "fcc24aa06dd8f336419f4ab466c832e4fa01a609f42de30d5dab53a26de4f1aa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-7/commandsv2-cpp-2027.0.0-alpha-7-linuxarm64staticdebug.zip",
        sha256 = "40afbb31e67ad372e7c97d70b5c07024befc8b52e57fbf9db476e3145ea2a941",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-7/commandsv2-cpp-2027.0.0-alpha-7-linuxx86-64staticdebug.zip",
        sha256 = "aaf552b5e5d30804f97db68d0363a92f5c950963a9fbb67778af9ebc5856f233",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-7/commandsv2-cpp-2027.0.0-alpha-7-osxuniversalstaticdebug.zip",
        sha256 = "c20fb4540dbd2e87c3a76749ac60ed45074edc9c19c8919840beefa5409b35ea",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-7/commandsv2-cpp-2027.0.0-alpha-7-windowsx86-64staticdebug.zip",
        sha256 = "8f1a09fef9d0a5438b07832e6a9df253a3b6c496b47818216b8c308c647bb3f3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-7/commandsv2-cpp-2027.0.0-alpha-7-windowsarm64staticdebug.zip",
        sha256 = "0891706fc5c118c2ed81c6811d26c0ba5cebf19b8466e2d855ec13577e2dad3d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-7/commandsv2-cpp-2027.0.0-alpha-7-linuxsystemcore.zip",
        sha256 = "2aa69482f1a2ad374e2a9a39ea5383fd54ed9e7677309a678c0115dd36b35df2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-7/commandsv2-cpp-2027.0.0-alpha-7-linuxsystemcorestatic.zip",
        sha256 = "b519cc509b67b5fb91c7447205749abb57eb49807c587f1e2d06a090b593e4d8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-7/commandsv2-cpp-2027.0.0-alpha-7-linuxsystemcoredebug.zip",
        sha256 = "97f4ef47c700b3234dfa92948dc0eeec5540026cf84dffaf87b5f7725e6cedc5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-7/commandsv2-cpp-2027.0.0-alpha-7-linuxsystemcorestaticdebug.zip",
        sha256 = "8d342c2b4c3659f7c028e9de673669c50619c4f607655e6b8cb7bc06af2cd62f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-7/romiVendordep-cpp-2027.0.0-alpha-7-headers.zip",
        sha256 = "fc9784bf98ec845b6975b5aae219a6adc53ea76b98222cf1567bab6250fb357b",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-7/romiVendordep-cpp-2027.0.0-alpha-7-sources.zip",
        sha256 = "ada3146b01a9a86fadfec85e926c1fbe6b2f2e0acc0d59e34d42ccfafcde7f35",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-7/romiVendordep-cpp-2027.0.0-alpha-7-linuxarm64.zip",
        sha256 = "fb908be0bc98ca9448e0583759e82c1a890a5c8313988f210edef3da778fbe52",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-7/romiVendordep-cpp-2027.0.0-alpha-7-linuxx86-64.zip",
        sha256 = "890992a23fd867a5edbe1bb00cc3cbbe993666115f41527417ba831770fddaf7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-7/romiVendordep-cpp-2027.0.0-alpha-7-osxuniversal.zip",
        sha256 = "a388d36eec539edf3a32ef2154881fd3b2e21d54334f61d1467995d0ef47887b",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-7/romiVendordep-cpp-2027.0.0-alpha-7-windowsx86-64.zip",
        sha256 = "faab14b1cc8666cc9f7080e5f27b04579af54b804db3bdf0ce268bf77d7ec45d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-7/romiVendordep-cpp-2027.0.0-alpha-7-windowsarm64.zip",
        sha256 = "5b9d70c4e3047075692ec155dbefbc47582b54d19c4173de69a3b86a4d9e9f68",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-7/romiVendordep-cpp-2027.0.0-alpha-7-linuxarm64static.zip",
        sha256 = "9561fe82525a6a09190f67c50b166d4a1219d04e0cbc5f8a66ce6dce1161109a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-7/romiVendordep-cpp-2027.0.0-alpha-7-linuxx86-64static.zip",
        sha256 = "43de81dcfb4fc5f08d39e9ba502e5b50b3ea6966fed901e68a6c6a4e8233e599",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-7/romiVendordep-cpp-2027.0.0-alpha-7-osxuniversalstatic.zip",
        sha256 = "dc513e983ff2c750d7536465d4187758834579afc69ee86bbf3de362c0e6da04",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-7/romiVendordep-cpp-2027.0.0-alpha-7-windowsx86-64static.zip",
        sha256 = "603bbaaa5420757a1a98bf1d2f51292be2a9aeff7ae168996f6366ff0000b871",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-7/romiVendordep-cpp-2027.0.0-alpha-7-windowsarm64static.zip",
        sha256 = "ca777e8b777ce5e868e61fd1f6012a0fc5bcbb8c5b2424ad725e6b1be7795fe0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-7/romiVendordep-cpp-2027.0.0-alpha-7-linuxarm64debug.zip",
        sha256 = "7d1a52f6051cd346fb6b98548ced004799c9ccf7d6ad6e9c8dd35b2924d1c6ef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-7/romiVendordep-cpp-2027.0.0-alpha-7-linuxx86-64debug.zip",
        sha256 = "f32879d7fbd972c5487cbd4ed817d85ef413854ece28d3d5752212d675a443ef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-7/romiVendordep-cpp-2027.0.0-alpha-7-osxuniversaldebug.zip",
        sha256 = "ec1ea41e5640f2f0245c5f45b924751ed29c9559e53febef55f5f3c972fbc2f1",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-7/romiVendordep-cpp-2027.0.0-alpha-7-windowsx86-64debug.zip",
        sha256 = "4cde428b7ed3c98aab42ccd36f4fa01ca7153a9cc26880fea8f245a08bc5fa44",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-7/romiVendordep-cpp-2027.0.0-alpha-7-windowsarm64debug.zip",
        sha256 = "18657922b0b59dc8320b697da3bf606ef26904b4a4baf824a3f8a282b9d9c629",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-7/romiVendordep-cpp-2027.0.0-alpha-7-linuxarm64staticdebug.zip",
        sha256 = "e30ad49c31b1defa180edcb8017f823d3c2ec2ee62b7d6ee8c0cb147c98cc035",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-7/romiVendordep-cpp-2027.0.0-alpha-7-linuxx86-64staticdebug.zip",
        sha256 = "ce00d101f5aa132cec0748e03a2580bbd5f6e89ad4e01ef6e7fb97bea0d6ad9c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-7/romiVendordep-cpp-2027.0.0-alpha-7-osxuniversalstaticdebug.zip",
        sha256 = "b049faa9706d978984426e320ea2cb69af46b42007725f213004bcf5ee5d7c5d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-7/romiVendordep-cpp-2027.0.0-alpha-7-windowsx86-64staticdebug.zip",
        sha256 = "d03465551792a3882ee559897cd2cf67d949769453e180b4dd0ae8eba29a0738",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-7/romiVendordep-cpp-2027.0.0-alpha-7-windowsarm64staticdebug.zip",
        sha256 = "50572c344f9e640197027dc8ff22888abdbd950472bca154d2cd2c1eac782a1d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-7/romiVendordep-cpp-2027.0.0-alpha-7-linuxsystemcore.zip",
        sha256 = "c69bd60528db683685ab19d1394f7d845ad8756a159f8316f77e41983b37e4c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-7/romiVendordep-cpp-2027.0.0-alpha-7-linuxsystemcorestatic.zip",
        sha256 = "60874bbcc3e25d3a9cd187a2edd2e6ed1967902eddbe2c0ec22d958a5b5c4755",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-7/romiVendordep-cpp-2027.0.0-alpha-7-linuxsystemcoredebug.zip",
        sha256 = "e266131f852bbbf7ca900fe4332afba5852e22e8c705f54de22248d3458153da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-7/romiVendordep-cpp-2027.0.0-alpha-7-linuxsystemcorestaticdebug.zip",
        sha256 = "519584649196182bafa0f0d6a717613959094d546ab12134c826ac0840700415",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-7/xrpVendordep-cpp-2027.0.0-alpha-7-headers.zip",
        sha256 = "4001427c405184531bd7eb7148ced9669ec9248cf88fe4044ec8f2ddf2810c47",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-7/xrpVendordep-cpp-2027.0.0-alpha-7-sources.zip",
        sha256 = "f0e183228c3f528ac230dd32d6b2baf9fdb4459b18a27c1fcaa8f087ac68f86b",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-7/xrpVendordep-cpp-2027.0.0-alpha-7-linuxarm64.zip",
        sha256 = "a010473cfe974ae30f51926109e350aba072f07d07d2b1bcacefbf3111a6991d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-7/xrpVendordep-cpp-2027.0.0-alpha-7-linuxx86-64.zip",
        sha256 = "dc9fe7f2f9d40a9ac50d0f38ee22346d25b160d5d5f2c21768fc722b76882026",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-7/xrpVendordep-cpp-2027.0.0-alpha-7-osxuniversal.zip",
        sha256 = "fce76c33df4b546a1be230ac448e8483ba0255565f78c6570654e60bb747ec99",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-7/xrpVendordep-cpp-2027.0.0-alpha-7-windowsx86-64.zip",
        sha256 = "f1621b55ee5ea8d8b852f4288d8ea9a19134dc5f7ebfe2d76e3cdccb632683be",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-7/xrpVendordep-cpp-2027.0.0-alpha-7-windowsarm64.zip",
        sha256 = "c494aaad1d2301f6c5db2c862e2c974a005040c31c3c64d003ee8353a17bf52a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-7/xrpVendordep-cpp-2027.0.0-alpha-7-linuxarm64static.zip",
        sha256 = "241be654d6721356a11d6fbf304332483b2707a291734207a927f017ce220815",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-7/xrpVendordep-cpp-2027.0.0-alpha-7-linuxx86-64static.zip",
        sha256 = "794215041b60c40c272d8cd951a935c2151edc543e1478bbe02a62c2de1a1c4f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-7/xrpVendordep-cpp-2027.0.0-alpha-7-osxuniversalstatic.zip",
        sha256 = "38c976921e369260946c06070988abf93860eefabdf9709bb63820d601d150d6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-7/xrpVendordep-cpp-2027.0.0-alpha-7-windowsx86-64static.zip",
        sha256 = "f75962cae70591341f9a1dc7ca05b146614fe7d520eb3a477b3c8e9fe629f032",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-7/xrpVendordep-cpp-2027.0.0-alpha-7-windowsarm64static.zip",
        sha256 = "fe2f1252b8e5e726c1e2ed0632faf3e0fd19d35e1e88e7de62f406161aa89e14",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-7/xrpVendordep-cpp-2027.0.0-alpha-7-linuxarm64debug.zip",
        sha256 = "419d4d9d9a1021906df13612cec1e07e9e304c434f9bf867ad3956b5ecd4fa20",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-7/xrpVendordep-cpp-2027.0.0-alpha-7-linuxx86-64debug.zip",
        sha256 = "7a8d87061374eee4e7ce201bd154f130fc4fcb9c01ed93b497effed18fd78de6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-7/xrpVendordep-cpp-2027.0.0-alpha-7-osxuniversaldebug.zip",
        sha256 = "1ec9ae8b4ac4e3d045566e2412dd12b3bd10988367b4aca7455429e22b5475bf",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-7/xrpVendordep-cpp-2027.0.0-alpha-7-windowsx86-64debug.zip",
        sha256 = "7aabcd633abc377713ffbb1a03711689ce05064e7d6a73a0e2ac8870f40b972b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-7/xrpVendordep-cpp-2027.0.0-alpha-7-windowsarm64debug.zip",
        sha256 = "5e68f1689359f64825f1d102fb165d6f8092c4c980a86caa4b93ea86d90933bd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-7/xrpVendordep-cpp-2027.0.0-alpha-7-linuxarm64staticdebug.zip",
        sha256 = "9de0511b7ec15728addbe212c890bb20badaa748483615f1ccebad0d1d6b2c7c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-7/xrpVendordep-cpp-2027.0.0-alpha-7-linuxx86-64staticdebug.zip",
        sha256 = "fad62978fa4011922be593de1676e0bf54344942927925afaf111549abf2b05f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-7/xrpVendordep-cpp-2027.0.0-alpha-7-osxuniversalstaticdebug.zip",
        sha256 = "d82e80ea10135249c2f665366589f3515f267f87c04497c5fc2b420f68cd09d3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-7/xrpVendordep-cpp-2027.0.0-alpha-7-windowsx86-64staticdebug.zip",
        sha256 = "9c04fbbb65379f35d56b1be7333817cc7871593b339bdabc30c12fe61e200b34",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-7/xrpVendordep-cpp-2027.0.0-alpha-7-windowsarm64staticdebug.zip",
        sha256 = "1e982f7d55f031c98aaf73f1c5535b360b48cea93451efa4408f2fde59d3e1c2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-7/xrpVendordep-cpp-2027.0.0-alpha-7-linuxsystemcore.zip",
        sha256 = "17646aa8a54f43eb13eb1762a1319dc48b2bdb184c526044b01707ec2ca2ca7d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-7/xrpVendordep-cpp-2027.0.0-alpha-7-linuxsystemcorestatic.zip",
        sha256 = "764fd9d76bb5c627c521ff67705a90c9a73dde9a1da59ec6fb6d6bee644d9910",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-7/xrpVendordep-cpp-2027.0.0-alpha-7-linuxsystemcoredebug.zip",
        sha256 = "cdf284e7e718ed0b1c754b47887b6a1cb4635c31d085fed58593c3ce545ff927",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-7/xrpVendordep-cpp-2027.0.0-alpha-7-linuxsystemcorestaticdebug.zip",
        sha256 = "ce7de08248a52971eb1f671626d638802607baa22b55ab542ff37f7a4d9ba367",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-7/halsim_ds_socket-2027.0.0-alpha-7-headers.zip",
        sha256 = "bbe8988b5bb01ff054557288f5b98b4fc5c8c44e4e731f9b287f3d7d08620e82",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-7/halsim_ds_socket-2027.0.0-alpha-7-sources.zip",
        sha256 = "d11e20bcf41d4542d504a02888009259c14181a6c438672ced90a48a6794362d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-7/halsim_ds_socket-2027.0.0-alpha-7-linuxarm64.zip",
        sha256 = "262d37e65fe60d324d7ea2857923d48d0a8cfe98c4cb87a53d82bceab9f45312",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-7/halsim_ds_socket-2027.0.0-alpha-7-linuxx86-64.zip",
        sha256 = "d4113e1cd2720aa4586112fe873a3f9cd34c9ef13d101e5327ad102df557dd97",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-7/halsim_ds_socket-2027.0.0-alpha-7-osxuniversal.zip",
        sha256 = "db5c068b01d8dab49a5118e028031090fe9c9ff6fb218030d2890937ddd500da",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-7/halsim_ds_socket-2027.0.0-alpha-7-windowsx86-64.zip",
        sha256 = "1baa94c3bd190e9867b5b6e5fce0fa55148d44f909be7dba3b02e73ce9eabca0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-7/halsim_ds_socket-2027.0.0-alpha-7-windowsarm64.zip",
        sha256 = "ff5ebdc28feb89b2f12f5af5f885b686606c36d0075b7ff4cdc888bf165e996b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-7/halsim_ds_socket-2027.0.0-alpha-7-linuxarm64static.zip",
        sha256 = "2458a7ed349a848b17563b63b7ea99a3a0c84b1dce082baeb14edfc8c951580f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-7/halsim_ds_socket-2027.0.0-alpha-7-linuxx86-64static.zip",
        sha256 = "85f74f7fd59972791d855e2c5c9477438a98c4fba7909479effb19da68b9926e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-7/halsim_ds_socket-2027.0.0-alpha-7-osxuniversalstatic.zip",
        sha256 = "53e4a29203b1b222b39f7665a3ca5599a64a3d85128a742e078d080f08d38d04",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-7/halsim_ds_socket-2027.0.0-alpha-7-windowsx86-64static.zip",
        sha256 = "a896ef4d629e197855d44d8ccfc49067eba79f8678146012ab8e0824594338ea",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-7/halsim_ds_socket-2027.0.0-alpha-7-windowsarm64static.zip",
        sha256 = "b0ea8572c0d948d58fe63fbfb2eb68f56023f3a3df876f3954aea52b5c8faa8e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-7/halsim_ds_socket-2027.0.0-alpha-7-linuxarm64debug.zip",
        sha256 = "f0743bcad9e3c8d5cdb813a56e1af2432ec1eb62f7c0de801f30cf404bfb2ae5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-7/halsim_ds_socket-2027.0.0-alpha-7-linuxx86-64debug.zip",
        sha256 = "b543770d736a154cae4c9fba1000c54b54034fe6215f0618890c8651fefa5419",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-7/halsim_ds_socket-2027.0.0-alpha-7-osxuniversaldebug.zip",
        sha256 = "ff57d18e47b6db0a07d64431b37beef0c4fbf6d4f42d9bac1ce9be599f9c093a",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-7/halsim_ds_socket-2027.0.0-alpha-7-windowsx86-64debug.zip",
        sha256 = "08be4234407caac5633b2651bbf69e651a815b44eec9d490c775dd0097b077ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-7/halsim_ds_socket-2027.0.0-alpha-7-windowsarm64debug.zip",
        sha256 = "cbd1ac2aee1ab5825a95dbe07197fb42dc5f8dd654f985b3c90b0505fa276499",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-7/halsim_ds_socket-2027.0.0-alpha-7-linuxarm64staticdebug.zip",
        sha256 = "e7a3153d6eb47d726089589ffc1c3bb7eb098ead268aeb7bd2aa93ba35bedf8b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-7/halsim_ds_socket-2027.0.0-alpha-7-linuxx86-64staticdebug.zip",
        sha256 = "534f23db9d27df666dca23b658003e6e22131442e4d011374b9c588033b99114",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-7/halsim_ds_socket-2027.0.0-alpha-7-osxuniversalstaticdebug.zip",
        sha256 = "03b62d3b2831eed1b9f076ecfd5bcdd356d408d726f66a9023c41a910bfbd01b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-7/halsim_ds_socket-2027.0.0-alpha-7-windowsx86-64staticdebug.zip",
        sha256 = "5670c34f3b3367fd7f1eeeba6cd871c9d4e22db13ec44af0fd097df23af8e991",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-7/halsim_ds_socket-2027.0.0-alpha-7-windowsarm64staticdebug.zip",
        sha256 = "a6872ddce420c23f6b9098403906221a9493c0bf272fa900d88b3cea50bd0345",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-7/halsim_gui-2027.0.0-alpha-7-headers.zip",
        sha256 = "4a455521b896bbc6881d1e0f25472ce9ca9c80b3a9419abfe09a8d2ea7ffe45e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-7/halsim_gui-2027.0.0-alpha-7-sources.zip",
        sha256 = "37fa026d043685997c3ba01ccbff1002aa30d074b80929d1555657feeca27021",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-7/halsim_gui-2027.0.0-alpha-7-linuxarm64.zip",
        sha256 = "746e3d0f246f560e4106f04602e32ce099be5924e5545aa9082561e2a274fc65",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-7/halsim_gui-2027.0.0-alpha-7-linuxx86-64.zip",
        sha256 = "9ff54af228fbfd1a90af3ddb306413b5193782d8f8f1d541cee86121f34bbec9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-7/halsim_gui-2027.0.0-alpha-7-osxuniversal.zip",
        sha256 = "40986d8f4a343c6da7d3c34c329536f9a8d57b7c5c45ceafb819c4e608d75847",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-7/halsim_gui-2027.0.0-alpha-7-windowsx86-64.zip",
        sha256 = "0d67464355f499f2054c3d0759c6410b7652db1be55f098d3801ddfed66cb789",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-7/halsim_gui-2027.0.0-alpha-7-windowsarm64.zip",
        sha256 = "b3926ce4d5add8740e3f638c3332daa4767ba2392bed2c21920a796cd1ccd98b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-7/halsim_gui-2027.0.0-alpha-7-linuxarm64static.zip",
        sha256 = "b02516e56e1a2062aac994b804bd211963ca41c7f16ee2942924bf283032bfe6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-7/halsim_gui-2027.0.0-alpha-7-linuxx86-64static.zip",
        sha256 = "4f74b9c3f035e7abe308aa16f6f0756533e2d034d9889315727c2cf5f9f9cf3e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-7/halsim_gui-2027.0.0-alpha-7-osxuniversalstatic.zip",
        sha256 = "a2563b36ab36735487e985571cd153f3757aec6f8b59344ea24f1500615eb672",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-7/halsim_gui-2027.0.0-alpha-7-windowsx86-64static.zip",
        sha256 = "4b8fb0e29e8da10f39e31e1d3acc84500370a62f643148dd60bff06d75e969e5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-7/halsim_gui-2027.0.0-alpha-7-windowsarm64static.zip",
        sha256 = "d40c236c1fc8f05652e689a791df577fd748ed731d2b4b4e2922b1560532eef8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-7/halsim_gui-2027.0.0-alpha-7-linuxarm64debug.zip",
        sha256 = "96c369fe9ef4b36aabd2562ce7bc13bcd83bd17f1d072db5198230da45a4b3c0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-7/halsim_gui-2027.0.0-alpha-7-linuxx86-64debug.zip",
        sha256 = "17c35707e72b427bc79a749dfe2b45a2292cc13d63ad442de43ecd21b7581618",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-7/halsim_gui-2027.0.0-alpha-7-osxuniversaldebug.zip",
        sha256 = "b9a60ef25d4f02af249deaf2a8b8fc55e4f4b44c9d38ef625c79b57c2024a9f4",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-7/halsim_gui-2027.0.0-alpha-7-windowsx86-64debug.zip",
        sha256 = "3d61f93982ab9e35f775ac94ab441cfd85744903e21854dc90c9221c501ba508",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-7/halsim_gui-2027.0.0-alpha-7-windowsarm64debug.zip",
        sha256 = "82bd2c428198b78d294b9627e6e66d8991cc5ae8163a73c52b70c44c2d6a4bee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-7/halsim_gui-2027.0.0-alpha-7-linuxarm64staticdebug.zip",
        sha256 = "c2ae7fb6888f3379b8af0469d18916c6ecea5e1f055705c145c5e542677c2955",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-7/halsim_gui-2027.0.0-alpha-7-linuxx86-64staticdebug.zip",
        sha256 = "ea2775c2c5e5b886641a23213111d30f142640b059f8d9985cece4844687598c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-7/halsim_gui-2027.0.0-alpha-7-osxuniversalstaticdebug.zip",
        sha256 = "1af87630d7f76af05a8175271bb0df32bad8ac6168ce707529b151b884c59874",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-7/halsim_gui-2027.0.0-alpha-7-windowsx86-64staticdebug.zip",
        sha256 = "cd1712c7f044f9f3e4a8045a32efa80a5f65e0301ea6dc8b89a501ac6fb17071",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-7/halsim_gui-2027.0.0-alpha-7-windowsarm64staticdebug.zip",
        sha256 = "2604dc2ca893488c744da80f32fb578dfc419c63f9658fb6b536b96ff9685881",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-7/halsim_ws_client-2027.0.0-alpha-7-headers.zip",
        sha256 = "b6023364ca78cbb2716233d3318a0d74fa31a1fd9844235951e4b8e48ebf3c7e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-7/halsim_ws_client-2027.0.0-alpha-7-sources.zip",
        sha256 = "9a300453a4ea0cd8665c435a667d2f8291fa530510ee0b69c589fad49dc36a4c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-7/halsim_ws_client-2027.0.0-alpha-7-linuxarm64.zip",
        sha256 = "91af3d5c7f8cbb8291910f311880cde050aa6c64aa38286afe2bb4933d1ff667",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-7/halsim_ws_client-2027.0.0-alpha-7-linuxx86-64.zip",
        sha256 = "c221c16d1696c5e3d69e0bc283963849e60372ff9d8b55a96f2eba1ccbf96afc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-7/halsim_ws_client-2027.0.0-alpha-7-osxuniversal.zip",
        sha256 = "80ab0163b3ad05d0bb0df14666ae92a9be70789a4ff7477222dd8e5cc4cbcc6d",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-7/halsim_ws_client-2027.0.0-alpha-7-windowsx86-64.zip",
        sha256 = "859870545bce795078c7c090f9127eacb31aeb8d6f335b49b3d1387362692c3c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-7/halsim_ws_client-2027.0.0-alpha-7-windowsarm64.zip",
        sha256 = "b17f29d99c6a832c9f2e76281f580bc89520e93c6ac1ee695484716b404c086d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-7/halsim_ws_client-2027.0.0-alpha-7-linuxarm64static.zip",
        sha256 = "2847a982724a277f56cd5a1aca0a0150e924b70ee2894284e0c2a39df29b3cce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-7/halsim_ws_client-2027.0.0-alpha-7-linuxx86-64static.zip",
        sha256 = "52e610b1825579051b6146f429d9f9edeefac79382e7f114c6c3b2f23cc4d8fc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-7/halsim_ws_client-2027.0.0-alpha-7-osxuniversalstatic.zip",
        sha256 = "8155c0aa84a6009788cf34bfd6960c8a61a451035d7021810d0e3e7a1ba4c25c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-7/halsim_ws_client-2027.0.0-alpha-7-windowsx86-64static.zip",
        sha256 = "dfa7f295be2c8a67e33588842c4c1842e140feca8f9fff775a86422236505742",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-7/halsim_ws_client-2027.0.0-alpha-7-windowsarm64static.zip",
        sha256 = "d279711ef8ec0254eb649122fda3622931456e4fdd3664d386d22d06312356f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-7/halsim_ws_client-2027.0.0-alpha-7-linuxarm64debug.zip",
        sha256 = "666919d0a361f4cbfc7657450cef6a722bf76e5484afe76de101dd398879e369",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-7/halsim_ws_client-2027.0.0-alpha-7-linuxx86-64debug.zip",
        sha256 = "b3a9ef0acf84fb8dfe0373d0375670f5d7b2431c762363dbb07411ab7131f923",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-7/halsim_ws_client-2027.0.0-alpha-7-osxuniversaldebug.zip",
        sha256 = "cb6d0be8e0daa0244fcbc3e29193c9c056113e07c476f682ab4b12eac2eba040",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-7/halsim_ws_client-2027.0.0-alpha-7-windowsx86-64debug.zip",
        sha256 = "a9ed6efbd78b1a15c287aa3e66ff204db051e9d8d094eff1c8c42c7f56c412db",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-7/halsim_ws_client-2027.0.0-alpha-7-windowsarm64debug.zip",
        sha256 = "bbc60bb76fd62bc0a8879c8e049281f35824c7f8205ec258701aedcc3ba30614",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-7/halsim_ws_client-2027.0.0-alpha-7-linuxarm64staticdebug.zip",
        sha256 = "153c62fcf2fd944497011d5e89954c84076679a6e4e6ed0926965f75b09f4319",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-7/halsim_ws_client-2027.0.0-alpha-7-linuxx86-64staticdebug.zip",
        sha256 = "4ae929a988f198a619f456a1ee55edd5d7e4026256f2b2247e9bf0a7759ca92c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-7/halsim_ws_client-2027.0.0-alpha-7-osxuniversalstaticdebug.zip",
        sha256 = "a2ddee04eb998704d9e255948c231986d5c09a023a7bb2933648bd4eec5973fc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-7/halsim_ws_client-2027.0.0-alpha-7-windowsx86-64staticdebug.zip",
        sha256 = "6e52a6f96107937d403677c25eb104412cc55a06cea3bf7a76a7039ba7ee5f5d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-7/halsim_ws_client-2027.0.0-alpha-7-windowsarm64staticdebug.zip",
        sha256 = "26d7e3c4db02bdfbf018dfe44da1651af6af60c14a7a6c5550fe7376a87ba936",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-7/halsim_ws_server-2027.0.0-alpha-7-headers.zip",
        sha256 = "b1a70f1886d53485c7df1626fcb0879c35d4941cfd0ea2a68745f4f438a62363",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-7/halsim_ws_server-2027.0.0-alpha-7-sources.zip",
        sha256 = "7a15734166717daf4fb19cb7b5e201b798927b444a1b6ce81eddd0011020cc4f",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-7/halsim_ws_server-2027.0.0-alpha-7-linuxarm64.zip",
        sha256 = "cb041fdbed523d60e43b7e26caa876b7a060b7a4555077d07c3cb799d6699b36",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-7/halsim_ws_server-2027.0.0-alpha-7-linuxx86-64.zip",
        sha256 = "cc753e4a50318f941f05000895eb8c00672c4058476423af305983f382db6dfc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-7/halsim_ws_server-2027.0.0-alpha-7-osxuniversal.zip",
        sha256 = "fc4b78dbaef5b65fd06658ad37742d0a962832b4c553cff96e2fca69b07c80de",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-7/halsim_ws_server-2027.0.0-alpha-7-windowsx86-64.zip",
        sha256 = "920d60a6bdb250be186e2a897ba691433a865e3f4a7ff5b37848c05e51884a3c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-7/halsim_ws_server-2027.0.0-alpha-7-windowsarm64.zip",
        sha256 = "0d867b3f7a288f31450caf32b7990b1eced7dffa7d9303bdc3b897da0a09d5c7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-7/halsim_ws_server-2027.0.0-alpha-7-linuxarm64static.zip",
        sha256 = "a5b02bcacaede706db91638fa329d39091de473259f20de7177263b96002f561",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-7/halsim_ws_server-2027.0.0-alpha-7-linuxx86-64static.zip",
        sha256 = "98c11625b81c6bd6e90ac659e35be5c3e759e387487522b2f175c262245e8c2c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-7/halsim_ws_server-2027.0.0-alpha-7-osxuniversalstatic.zip",
        sha256 = "4d57750f3d99a30ba25a4bf09a4105c5866f896d7887d731fb94a18a98a0f963",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-7/halsim_ws_server-2027.0.0-alpha-7-windowsx86-64static.zip",
        sha256 = "2103a1338d0dc0a6066ea62a180d53eb7b4947a9ba5ad3f7740d6cb32e8d509c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-7/halsim_ws_server-2027.0.0-alpha-7-windowsarm64static.zip",
        sha256 = "fb30cf4f68ff30df1373cd09ae9072214c7874b6e1dc6a74596dfdc17c7157c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-7/halsim_ws_server-2027.0.0-alpha-7-linuxarm64debug.zip",
        sha256 = "86a9f392aa23d5717bec7e3a50377476ab2b60698ee260f1a5ee3a9c3dcaea63",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-7/halsim_ws_server-2027.0.0-alpha-7-linuxx86-64debug.zip",
        sha256 = "de735afeb882654db6c0542828e109e6da47fda2fee1496a166687176f0d07c4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-7/halsim_ws_server-2027.0.0-alpha-7-osxuniversaldebug.zip",
        sha256 = "950a51e3d7ffed75f7e31bcd34530aa3156f762e4135dbbcda660c7defa11444",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-7/halsim_ws_server-2027.0.0-alpha-7-windowsx86-64debug.zip",
        sha256 = "d947816423081c9e093ce2a02b62c050f7f82ec53daaa1cc48119140e59fae49",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-7/halsim_ws_server-2027.0.0-alpha-7-windowsarm64debug.zip",
        sha256 = "b28c016f44707b60581a42ab90668f8dd0d815adaaef1df9a63a8a1d72b087b5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-7/halsim_ws_server-2027.0.0-alpha-7-linuxarm64staticdebug.zip",
        sha256 = "51cbccdc98e9872c4fa2eefe2501769cbe3c5e169d939fc485a34151c60ecd75",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-7/halsim_ws_server-2027.0.0-alpha-7-linuxx86-64staticdebug.zip",
        sha256 = "840403678b87dd2ba3096f542b20e57bb0e99a93d3cc46c6b8e3e1fb027cabfc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-7/halsim_ws_server-2027.0.0-alpha-7-osxuniversalstaticdebug.zip",
        sha256 = "b758984b5aba27b994822f6a926507204715962d65e790e1c16da3de3aca4a41",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-7/halsim_ws_server-2027.0.0-alpha-7-windowsx86-64staticdebug.zip",
        sha256 = "2d86a18e3a3c05b83271153ccfe3639ad015a2bc2d77c11519176c5f27c2170b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-7/halsim_ws_server-2027.0.0-alpha-7-windowsarm64staticdebug.zip",
        sha256 = "47b40a9cd5c0aa7f01f13b6976f9f7a50c88a93266dff54f762a8686beb3c708",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-7/halsim_xrp-2027.0.0-alpha-7-headers.zip",
        sha256 = "d91d1f184918d14b60ead89a30d73e57efcf7a424dcbf964c2834188132b1629",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-7/halsim_xrp-2027.0.0-alpha-7-sources.zip",
        sha256 = "62b71391d37633c1882d57f2bc8640f2677f0dd2f8cf5cbfda2fbd3768b734ce",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-7/halsim_xrp-2027.0.0-alpha-7-linuxarm64.zip",
        sha256 = "d8a0093ee32419da6afeaa6bef2043f847c8116185af21591f852895f6c40b0f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-7/halsim_xrp-2027.0.0-alpha-7-linuxx86-64.zip",
        sha256 = "4b23fa40b3f0250b5a2b5f556c11445c8b97e8737fd698b6eb8983e558ec880a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-7/halsim_xrp-2027.0.0-alpha-7-osxuniversal.zip",
        sha256 = "b120750ddc5753cc840b1e89819d6a75dd8c8ab1c673a743bb60fce48611abf0",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-7/halsim_xrp-2027.0.0-alpha-7-windowsx86-64.zip",
        sha256 = "965549e2c85d29a9ef21f2f51d912990f89b3f8fa46f2901c2fa55e5b01f6b46",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-7/halsim_xrp-2027.0.0-alpha-7-windowsarm64.zip",
        sha256 = "eca59f3accbc27dc61ab372afe23317a112f9e04f374fc357b93c65d060e1fd7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-7/halsim_xrp-2027.0.0-alpha-7-linuxarm64static.zip",
        sha256 = "09d1f983aba12fde7e7505c0a4deb7996f51e5063cf09455ebd069354b148a1c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-7/halsim_xrp-2027.0.0-alpha-7-linuxx86-64static.zip",
        sha256 = "c9cdc38d0b410ff5c05d3a953913798555cdbc723cbd52a3b1a898ce666d3efb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-7/halsim_xrp-2027.0.0-alpha-7-osxuniversalstatic.zip",
        sha256 = "c0996ab4fed000fc243a23fb6740e7212018aca8a91d9d42e0a4832825b5eb00",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-7/halsim_xrp-2027.0.0-alpha-7-windowsx86-64static.zip",
        sha256 = "5089c12e574a3879205fc1cf24d13073dcbb1bddfeb6ac5c82de07bcea837cfd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-7/halsim_xrp-2027.0.0-alpha-7-windowsarm64static.zip",
        sha256 = "5d7ff6ca787931a0f24b3f3ffe8cd94995f753e1fb6c9d0c6c22c387a330ba39",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-7/halsim_xrp-2027.0.0-alpha-7-linuxarm64debug.zip",
        sha256 = "6ec180848eed4338401f7cbb3d52c68d92b98792832be0f30c78f26c2b055811",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-7/halsim_xrp-2027.0.0-alpha-7-linuxx86-64debug.zip",
        sha256 = "e98426cd00ee4ec5f44c5f6513fa56a87182e159a81802670b0d56aff13593a2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-7/halsim_xrp-2027.0.0-alpha-7-osxuniversaldebug.zip",
        sha256 = "45a4ecbf5c4590e4beeafe0c00d7f75292d04daa7d4617c22909d730e244a7df",
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
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-7/halsim_xrp-2027.0.0-alpha-7-windowsx86-64debug.zip",
        sha256 = "f3ec868b7c043c71e0493ba3dbecc78910d8fa278522e81dc302bb8dcc7b2e23",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-7/halsim_xrp-2027.0.0-alpha-7-windowsarm64debug.zip",
        sha256 = "c133054a5649bb31413d27b0c9f23854809cb6054a1fdbc858913fff4272977a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-7/halsim_xrp-2027.0.0-alpha-7-linuxarm64staticdebug.zip",
        sha256 = "17469b6943cffe0e3a350287bdffec381a194ee02a7ab301e500f2a04ead57be",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-7/halsim_xrp-2027.0.0-alpha-7-linuxx86-64staticdebug.zip",
        sha256 = "64b48be6f5d7061e295a8e0d64f4d86c679ac0d5fa294c0f1b8bd576a167c124",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-7/halsim_xrp-2027.0.0-alpha-7-osxuniversalstaticdebug.zip",
        sha256 = "f30402d5f6a5c430fd850f707bd028eb03acffad98c68a228bbdd79f220e79eb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-7/halsim_xrp-2027.0.0-alpha-7-windowsx86-64staticdebug.zip",
        sha256 = "4d1d74245358b94c1dc01a75600f5a144ab9e88507959417814fe42575701ff9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_xrp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/halsim/halsim_xrp/2027.0.0-alpha-7/halsim_xrp-2027.0.0-alpha-7-windowsarm64staticdebug.zip",
        sha256 = "29b16be9b986d63c38d94455bef24e68417aef0dd3ca893b9dda2e6bdc5b68fe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_xrp:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/DataLogTool/2027.0.0-alpha-7/DataLogTool-2027.0.0-alpha-7-linuxarm64.zip",
        sha256 = "0cda12afff31f82f3ee22ad0fa4ecd5886ccaa2cf8ad181c654f9ff66df8b70b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/DataLogTool/2027.0.0-alpha-7/DataLogTool-2027.0.0-alpha-7-linuxx86-64.zip",
        sha256 = "110085be228c9b7c93f8bdf5a30537a0c33e30f5caedeaa9c6ad0f03fa2b8401",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/DataLogTool/2027.0.0-alpha-7/DataLogTool-2027.0.0-alpha-7-osxuniversal.zip",
        sha256 = "2ace36cbb1cc1532f796a04ae0e851b4e181bc452976b7b931c7107741fedd34",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/DataLogTool/2027.0.0-alpha-7/DataLogTool-2027.0.0-alpha-7-windowsx86-64.zip",
        sha256 = "212e527df04e8697253dcd98a3c7e050ce4a80acdd6fb2504b1d1e7362045e88",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/DataLogTool/2027.0.0-alpha-7/DataLogTool-2027.0.0-alpha-7-windowsarm64.zip",
        sha256 = "49c66a4c198b748d8eab118a6e96016a9e2d1f4e56d1ff64d7dec99310af5047",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/Glass/2027.0.0-alpha-7/Glass-2027.0.0-alpha-7-linuxarm64.zip",
        sha256 = "bdf005a2efdcf3cf42e241c20f0ed7fae9dfb5fa5fea0504f5c6e939f20ab432",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/Glass/2027.0.0-alpha-7/Glass-2027.0.0-alpha-7-linuxx86-64.zip",
        sha256 = "e81bb2de9bd30716eb7caf0dd599b7ddf3c030bd2bb556ed582de644818d90c8",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/Glass/2027.0.0-alpha-7/Glass-2027.0.0-alpha-7-osxuniversal.zip",
        sha256 = "aba5381c41ab64b9da465e01b725946a32cdaef1363dc2b824eff5f86c59b090",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/Glass/2027.0.0-alpha-7/Glass-2027.0.0-alpha-7-windowsx86-64.zip",
        sha256 = "adf9a788e5f671fc18e478ce2e108e4fa626237499b3a42d67b9a5c4801d0ad4",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/Glass/2027.0.0-alpha-7/Glass-2027.0.0-alpha-7-windowsarm64.zip",
        sha256 = "40b30323d796694cacb7c521dc9688d58b09f5a02d6417ef649dceab4e86b2eb",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/OutlineViewer/2027.0.0-alpha-7/OutlineViewer-2027.0.0-alpha-7-linuxarm64.zip",
        sha256 = "faa0d1e0169748c95006a94d0cbb888009db9dc69284b19307c44c161405599b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/OutlineViewer/2027.0.0-alpha-7/OutlineViewer-2027.0.0-alpha-7-linuxx86-64.zip",
        sha256 = "858f0265532e44a934cb3aaf563becc848c8fe02a287638c8276d2653a9012bf",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/OutlineViewer/2027.0.0-alpha-7/OutlineViewer-2027.0.0-alpha-7-osxuniversal.zip",
        sha256 = "5e14ed7b570a7280d83708a1bbf89f31db82e56737f4fbdff9b6759727ecd185",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/OutlineViewer/2027.0.0-alpha-7/OutlineViewer-2027.0.0-alpha-7-windowsx86-64.zip",
        sha256 = "776c34bd128ffd13d9a5d8da1dfdd3036696b71f9225b6207b5395b9d7d585c2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/OutlineViewer/2027.0.0-alpha-7/OutlineViewer-2027.0.0-alpha-7-windowsarm64.zip",
        sha256 = "ce210f58bf129646b3f2e35eea3760a821a62b12f03efbb50603b73eca2452ef",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_processstarter_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/processstarter/2027.0.0-alpha-7/processstarter-2027.0.0-alpha-7-linuxarm64.zip",
        sha256 = "2861da3ffe3644dcc9f423d606702f414dbb7f39c2b4ab72bae95a4a2bc8de88",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_processstarter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/processstarter/2027.0.0-alpha-7/processstarter-2027.0.0-alpha-7-linuxx86-64.zip",
        sha256 = "4db2bcc025c61787c21896a3687006d4e8ef3234fe6368f3d90974cb7d4ff04b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_processstarter_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/processstarter/2027.0.0-alpha-7/processstarter-2027.0.0-alpha-7-osxuniversal.zip",
        sha256 = "71a69643802f11fec6db9749c093a23bb8061427f2950f0a1f6a3b1ccb3c4163",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_processstarter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/processstarter/2027.0.0-alpha-7/processstarter-2027.0.0-alpha-7-windowsx86-64.zip",
        sha256 = "c70d0f51368ace7068718efb058f90bf6fd42a059c18ef338286416ab641a1fc",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_processstarter_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/processstarter/2027.0.0-alpha-7/processstarter-2027.0.0-alpha-7-windowsarm64.zip",
        sha256 = "c8d060189f59f0d596c9c4ad84a777581a2f9ae49e3be8d5f2c5fab52a953871",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/SysId/2027.0.0-alpha-7/SysId-2027.0.0-alpha-7-linuxx86-64.zip",
        sha256 = "92b8795b75b5338b2af80bd29300b209bf0177605a931309ae699e0ebc9834eb",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/SysId/2027.0.0-alpha-7/SysId-2027.0.0-alpha-7-osxuniversal.zip",
        sha256 = "00e91ee533dd6ee6f3e1693ab61cc089fa83499cd9d03963993986c72c4a1202",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/SysId/2027.0.0-alpha-7/SysId-2027.0.0-alpha-7-windowsx86-64.zip",
        sha256 = "43457ed68b21323ae6188e7ca8deb4baf9810c240b9b7d8b62d54cf4a22073e1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/SysId/2027.0.0-alpha-7/SysId-2027.0.0-alpha-7-windowsarm64.zip",
        sha256 = "0272519bcee7027eeac722e364bc6f62e8c29a5d49db58d702213b32ec823d7b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_wpical_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/wpical/2027.0.0-alpha-7/wpical-2027.0.0-alpha-7-linuxarm64.zip",
        sha256 = "4db6963ef9e101687d73970eed83e3215ef4d2f89e51ff372a9095d3892afe77",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_wpical_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/wpical/2027.0.0-alpha-7/wpical-2027.0.0-alpha-7-linuxx86-64.zip",
        sha256 = "5bcd1690feed088a8c8125fcfb285ac37b1d27251f87f0898bd756417a92683e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_wpical_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/wpical/2027.0.0-alpha-7/wpical-2027.0.0-alpha-7-osxuniversal.zip",
        sha256 = "57e59a5e5c88b660dc9b05dc92811cb1ac4367848160c6ec84c4c5e5787c2901",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_wpical_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/wpical/2027.0.0-alpha-7/wpical-2027.0.0-alpha-7-windowsx86-64.zip",
        sha256 = "263ad3e7aa80f416f05ceeab01049166bf5b2bd443427c879dd44d1bd54ecba1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_wpical_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release/org/wpilib/tools/wpical/2027.0.0-alpha-7/wpical-2027.0.0-alpha-7-windowsarm64.zip",
        sha256 = "39df809be4394b6879073aa1e5b551d42647150a9a8ace9fc5cc4f0fb6cdd924",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

deps = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
