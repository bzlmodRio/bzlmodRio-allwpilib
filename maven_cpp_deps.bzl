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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-headers.zip",
        sha256 = "f9b5b7f6ac537b7fafeafd2668039f0a83f6a639202a6753e55838867a6b85ab",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-sources.zip",
        sha256 = "27c114192263660d3d0697752416e16b97cc9f542be6c5298868734793546424",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "e170c41e2bfa48c49062c6b36d58978a4a563f9d3f1c9723070497406c58f4bc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "6afa209ace10c0b7a24111ed07b270b0d16cfbb9f1ac2f37e311d3729563f2a1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "aae60e14d8cea3d459c37c7ad358b6e2dde12eeb653d13f18a278779a3e7f60a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "e33ff0851ad0d553eb4c29c210eb073533a0b18789c139a9c8944c524c540218",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-windowsx86-64.zip",
        sha256 = "44685190160a1839f099fda4afc576e7dbea31ad85e0a6b47f68807c3c21fc37",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "07227d246a4036135f9b4f226bc9a8eddeb847d058700f145ba679b7d3f66929",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "c7283268938d1e93750996445f18edabe12fc911ac1efabbde9e7ac5d72d9138",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "258d6aea34fcb285e999bde5527aa4f5b908645782f92d3b734b999c8c446b36",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "6a7ff3192e11a4e87dac409f0508a4cbb6cb72580fb8648b1fb91f0232516c09",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "4d06183d7def6414133804e2efc6583d4701a12b74cfa2e73d6861f63209fbe2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "947d55214da8ed2badad1d00fc6b25dbe9413ee6759a6a525dccd17fcbe9f289",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "597ef9d98374fad020593945926c96c7975a5eed98bf4d19817a500f9ec69622",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "0743feefdbeb57f50e75e1bdef4a44a8f8ebdec8d73c8672ccd902234e8c3a3c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "107c4f95b11b39107559e39ff5ca27be59f616600b4130a9510e0da760c57be1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "f16db7435712a2e3862ca0caefc6ee6a13783b17d5cdc9519a485c473e74b5aa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "905a57f246f23eeb73a9b80f6a7a6960b9fddb7ce5d3d96dee419e6b5a2c3b06",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "bb76ad68a538eb5fbc144dcdbffcc2f747f2b192159c4f5e6ac10ee92223ff08",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "e00dbe0ffa3e20f634e8e5183581bf5668e3c14180574e101896f0c4a99438cf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "840cbfd9af152d0c39418d4eb45e1609b1388a82ced3b72308d1460937f0e7ba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "68b370e9aa7e52a51bc9ec1b71f841cfeed45e9920f9b63319f6212573c1c403",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "8a2ed481ec2b93d461c64bedb151312eba1e08b1d5a1becfc6d7c9cae67b616d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "f2c98ed5bf60d19546625ba0be97bb4a0f278d90ceb8714785de97a7488103df",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "738d284060988f451a970a085cc1fcd36764467ac43d569eac3bd32b01156d52",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "585bb57c1470a049af4bbcbece2f3ad50fe7bd449d4da4368662ff29349ff203",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxathena.zip",
        sha256 = "b21719279d6472e16052ca3ee3d1bdebdf37795364ce7408ec39442ce51224e0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "f456a4a22b04da101c2c00c2ef3487907a1fee4a14993a4515a936ed21f1539a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "05ec424925eedca6b39543acd703e63e581a6034591057432751959e37f723d3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "a106b542daaa9329d6eed5cda6bb0e010758ffe415ce624c54a96841a6af4897",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-headers.zip",
        sha256 = "5c69c7a52432c948d749f5521751ca0010f554a28f5d4f54d020c5e63cf60fd5",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-sources.zip",
        sha256 = "f5ae54e48d6538139bce63e3b1d502f886a00bfeb8b668b64607c173fac5e1e1",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "29afc2772d2d541562e8c6c2f1ea9921c9ae5f38297e9897db4032a6c4068521",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "651e67022ec87a2fc683252b7f404d2d2be1e0edb69050f6e4147cfdbd917bb0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "afe5206737c2a72421c10d61d78b3f14a5fea0b7202cdb81c08e3a3186ed2e48",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "ae3ef5034cc83e75205bcfa2ef07a0337cf9a8d0207f54232c6e4dfb3ed7c4e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-windowsx86-64.zip",
        sha256 = "e37d29cfdd492948c47241bdb96f0ae6748ef9322e6b9079ae73885e7d94813d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "a8c418d23cc6156e005ac9ee35f0c27292138c773026552e5fc089018bb9d37d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "1ce5466beb38d0b9645e820af0fff2d2f1c0c709726115217bf761f624673a00",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "384aec101252cb670d869d305df438309d63b0d48cccee96d5914f9c5f97094a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "1a3ed63a77a7b62028cb1d33a545fb59cf1d09e856e4bf645fec34e0a79afdb3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "3e8a5de5aa9090e8e187c7f2b3b07134e5a80ca939b93b4ee7a9174f6aa05b67",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "e102e32c38fb3183aecd95191d72c6327ddce619840a3c5d05d48a54f729fbf5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "c5bfda0718b785c68a510c3bc017143b71883f36539778359f01754c66c14b31",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "8377bb80bc6793940891dd820b8b68f68d87a12f915580ce9e0a8da8c0ecfcc3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "08f82e97baa3dc457bf852c7fb71aee77f623d1fc2c88b795efb85c699f488f8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "b65e1aac81a5969a1615f925e5a44bfaaaaa5fd400cc7a60ddacd74736022c71",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "7ea9b1779aec018d3c585ba6f46cf0f53573decfd4fac098eca7f2ddc4489cc8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "c81a1d1868723ae74cadd31dc5ba38de130acdd2021ec3bb73d9910a757dd921",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "1129f732fb0b1c1e0873e73f1d487b04bc02ff4ce628b567e101568d52a14782",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "787d795c2426cdcabf309ba2aca401cae19857df8236f33a0cf7079ca166fd6a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "c4649da049835f08e428ace0eb2d2967b2a22d859e9007c037d12c905ad38ac1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "612c437fb22ae04738dd587b80339b00a7d6b191a1427ce7a21b9ab9714d105c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "20bf8c1bdabbe20a4cb319b186060f483f9319a2e18678ad168141d0a8f5c671",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "b872e217dc780ef639810d8f2add1a6941853ff7e3c19910c26c15ada5806d32",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "8ba94c3903e515ae72656d97ea071d2366c1a14e8fa6d0106158b87fdbfbee36",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxathena.zip",
        sha256 = "362b19f49840e4be74dfb4612fc7cdb967d8466450a3eefdb1531b86ee3fade0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "2d046623d6aa4c680157f997b3bc873ed932a6bda0fb01e41b4c7873c717e8ab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "7838e05edda1fb7e09c96b24d68540210f581f1f3a43f7a7010c544d6f327fbe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "b1780b05fb7fc04ff6c3cf9f12adab268ac616a47b3ed325a892577f4e54d4c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-headers.zip",
        sha256 = "8a6180b138c9c8e7f4543bfe86ee9d2eb12f6df0165f429ebb02a0bd474a0153",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-sources.zip",
        sha256 = "1ab8c377ef4bd2b9292e0116a47d115e820710c44538017868c9d62c2ff8e505",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "21ef5449a386785e8731b2913f856d185a564fc7aa97350acaf2bb3ac1cb988d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "d9c6c0d959c042d62106723b09387907bd4960f7f22387fa5b34f566885fb564",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "7f33918b2643c50ed20a96458ff63caf25192f6324c70de0d33bf3991515e590",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "f226574eda6ff6c5e9cde10fdaf63bede00339956c838964a706cd8b99145c43",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-windowsx86-64.zip",
        sha256 = "a914b15f0cf52f19b3e48dee28a8f1b0473a1a732e60c810f21c537865188ddc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "3f74d4165f4671c199834df9ce431dbe21c6e069252a546044b4b9d661f522fa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "81dd8a564752e2416ddc7c3da7db3d03059dc4f26418bc563b47def81967b9ce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "bd9a596c050a8db024bd6fd81e6050e410899c68631dd593ddb14eea8c01b120",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "48543827bb6d0b3dc903f9943157628bf340bc98be5e9a46624d26ed7fa060cd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "3f4f13e005ef9d55e8ec08ff786f50043bdc058676d859d1402bc4774f5b077b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "3497bdfc9ca29c4bc44a4992a330d439f5ded22c1c70d0ed3c537a530b543464",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "ca4546b163731376d49c3de5111b266ea03981c36d6338803d95b4b6ea75fa0c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "b3d2517f5a7c42c09af9d12cc348f881b632f6feeeb4c74a949cc05a47a8fb81",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "22b28bfc1489778a02a1202de2e31dd0a3d7b7d929315c3726847d5b587c1967",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "e2874ccd01a1ddd7391dea6f9f23ffa0afb30cde613497e5eb44652eceb1f02b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "a4b90ce991f4d96c7fedc39000f3d1600a182577f5011d1f0eb23220e9b9eee4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "21bd867fdd179223eb717636ac896a4a2b253a0555143626d70b2282fedf1f83",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "6192ba6ad7d885515c9bca85cb3012922e1a40d0b0b35f6bac5311349cea36ef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "3a9ab1f4afa27a54e314fe909730dbc6d6b6d775c0ae62d82dd8c117d597f09f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "79e95f9023b19dd902cf8f575d2145c4ab887cdcdb661053901498d6488eb01a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "cb45ea744538e2d01985809ec5bd1d18a5e294a51fb76861300e2a6b14a32f35",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "b300bf78786396f77b941a131a38385139de68735707fd5aaf7d632dcbedab0e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "ca3710ff92900da2bb04c3169b04b6457d2225427947c105dee4a7c8fd2aac70",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "eebab6926b926ad88313c175d755e320a98f8d518b1c80978560762613aa749c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxathena.zip",
        sha256 = "4ba8f7f7fac30bb7cc1a8890383a76a7bdb3b1d01e47e489909c504429cfc9ac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "2d8a377fecd1a140d8c4a522978e76dbbb14db1203808992be926797caded297",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "9c65e2cd5eb5937638f6a2732b854bf5d9278ff6e87a80ddae3d8747385d5893",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "ae70e7d20bff7ff00bef420fdacb52097755f3990d74fe26f3453c2dd44cfa63",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-headers.zip",
        sha256 = "758eb38977132bdd991f8e768780f5faa7148210b61648c5eda0d6b90ec4e60d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-sources.zip",
        sha256 = "b3ec1f4e7b35837276499a89a5d51aa1d4958cd7c6882639a90b3c62a7b993d9",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "9371e27d2ca133a2a0d96cc1b2bdfcb8d0d200150dc616615c67fa6416bb9912",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "ce32897d9b0df2f93d948839324c9c3d4c7f8cacf707f79033f8e158a027e6ec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "1bcd193c5920f180fdc43bd9f6a6da91732eded691447245e0e59699001886a9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "3f9a36db65b6c416f6a83c2a3283fc2c27e0d83f68f260d72d5f8aab359c77b3",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-windowsx86-64.zip",
        sha256 = "118eea0ef85cb618de6414eeba934420d8c0f06c33a0ba2280bb885726163f7e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "08c3ddac666437cd06a45a03389e86eefcbc572ed0c31c067c07435af450cbf4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "0fcdc301dffe953a228545fc41c67bbbcbad497d939b0490ea38042ceed7769e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "84f71d5f0f6e82098b45563f55ada9cf6f84f06648783276fe14ffd647c57320",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "29d066cb46c2c2ee1bb890ff411bc97cdb108477f312da11e0899cdb8ceddc70",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "dbca22babc4dac6b3f17c0baf8146ec87d954dd4af19bfe99533c23a37b2e326",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "0bdfc6b133eb47b18460322e4f82821f261c770a75129e2ce0b62331cd9725a2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "9104792bd36f853ad4635be23c0b67ab35eed81c30fac1a448b9c2ecd61b9f31",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "27de44905696cdeda724e6c1f8066d72c1a2c2b3d171e165c35713b27783b89d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "9eb785e457f95981b4165a1e47933022e694c8d119ae5109c16d307f33ae27a0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "b90201a6a0896c7ec87cd5e4991f4d04c06b8d35f1f66a12f122809eec55f05b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "28e9907e7d1fc79cde70d937726c622d14dcd62f1be015d467184e5025a28c62",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "715d1d7cea5442b832cb046490b9f6aa3cc3b730e7396fd793997c9c7794f6c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "1db75b98cf954917d932020f63e7bed02b04dce6320ac205a60e1dd945f4429c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "3cde1e15786b5e8872784cb0177188e94262753eb1de68667a22470a7dd29892",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "a04032e52cf8ffddd9cae55d4f0a6e2cd7a3db6caaeacb41b21c105392290dbc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "3da70f43acf1b7b8a35a6a07cf2daf7305150c91914e77a1e5819e24a088c5cf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "ea0862cfbceb3af0b5d941049e730f737230f156c70b28452198a2560e0c9890",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "cccc7a5659ca52c84eb2325d43070e9789fc6335f730499474fa82a1d0d73413",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "ff2bfd3ee722c4a83b45432d1e5f2b52bb5dcefa2d47fbb509b76915c58ad3fd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxathena.zip",
        sha256 = "7d9f7dba39a3ae9f219de48c83d093e27b13fa2dc3d351b3c1f0f5deea5c4eff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "d43419c34d09be1cfc2d9058588a0c70970d43a14c1b0f073d58e580a9ce2909",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "1d4f789117b3ec6c4f911f3bc2bed97f65491f622b5f44303944a80b2a7225bf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "302b9b2803afd1b74584c4c71146c48d1e74202107e0e69b3d9ffd15a7718d5c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-headers.zip",
        sha256 = "6529f8be544801c4ebae0e70ee1a7ee680f5befd4f121d4344d8cf84b06e3052",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-sources.zip",
        sha256 = "401de62822eebb65ac52e3253a6a4a96f3ae43dcc9a8bb1a121fe9f154193fe1",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "c90b75e9ab508ce8c4ee16327d80f93da3bd3d07598dfbba966a28886ed3a964",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "051ecbdd635a29cdb4c92a23d192c9e3145e0191a80949f364aecf2502c6d1c9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "4ef9faebf9f0d6209bc45d7adf0a41c8a09950be205bfe99fe3686ea8d908e93",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "fe6df9a5ff5605d32086ec97176bab14eb6d17a494a616035e3209944e099b9e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-windowsx86-64.zip",
        sha256 = "cb06c3030e9b48d97c9d86be271d914de8fcbb1637734ca27397ee3e273d8ab5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "46816777834c76fb3c46bd982d9a0f0c9db335d3e378c9c7cba9830b767fe6eb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "dcbf687e60f7668abd0e03e8b2b211207919670aa1b5318dc0f50b1f07928ac9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "6d7572577f073a6caa3c439b2acfa412f163a832bc19eebd02450b144195b351",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "043c3261359af868be6135e4724b5cda3ae4829d23e1610450537057dc704268",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "584ec48bb3578c677a8c48d175a9f388db0fb80dc15a805e8fe5b10a5a69be1f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "db63f8bd5cab24405fb26dd6f634d3caffcdb8e3322c5a7dbacea2f94c4f15a1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "dbd19075adbd5ae2eda3c05e0ac512b966ddd5291ae650566f94f8d6a53a35cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "0f9bd988df610e10c2ea754ed346860bf503c0f2be5f1ef7f407d1b6b174f689",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "e87c9c605ed59a738bed9e48eea93545eb2bbd2fbbfd46768c74ec1cba7c3389",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "1892086605193f1341ea7f4d6a4987c7d16cf4864333d69d782760f83babb10e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "df1d1115658c46060062cd4aa27976806bdb9b59383b3464a903e792e450032d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "301f468349c39c3fe39dab9a52c1f03a9cf4139ba67ae20c5e3891e87ae0053f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "8933632e12b034069111a240260eed51773cc70dd10f36b96fd48fa13c975d89",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "a01f0257929b51f9966f71561776b21ee1913452673e8259a2613611592dd769",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "d8eed3400ff52fbf91f27a650ce2351e4ab2b71c0b487582760cb14915eea9e2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "5720af7ede0d0d545f6a510c93f983106da2830be9f2ffc0c45452cece454487",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "b74b297e3ce03b6b8d8ff31a389ace20686787e78a8c2f2b7f62da77539dc293",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "ffdfeb41765d911f1c15c955a550bb8a4c2c2b5eb9b72a7c1640d3c34181129d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "dd5ca302b10d3edd65d6505f51961d9dd644576dc04f0a6fe55e09ead7682bac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxathena.zip",
        sha256 = "aa377210a62722e34b991b33c432c49596d8ee99b5420408d2b2391dca73dc50",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "365c549022160acadc76f37af2cd83a4da0d571828cc4c3863738a2a83b3bcf4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "c4333c206a1fe1a3e33ceb96fe168579b34d9705565b287ad7bbab807e60bcf1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "dd6d7bd49047b8ada6ee375365a1e4d9a5aad683338605cff03a8900024e2846",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-headers.zip",
        sha256 = "6ac413432052a9d6e709723cd1a024303e304d6c862cdfa5999cdfeac629bdfa",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-sources.zip",
        sha256 = "f3ae24d731d6a42d1b3261d0b5cfba31f61d394b7e354db4334fe9bf2aaae285",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "088812882efdd8ae8c98f49c018bc3d4bf02dcbc2df3d1215efc4b7134ab66b7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "e69d430620cad050bb9263c8068e952bd845b54dbaac769602b744836caa5e64",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "285c75d252cd76f004270c4d0455be30c979837cc65ee790bc6cde5a2df393c1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "b260b33350e29f967607db84bcaf13e02594138c3306e546b419bd59ab5d94f4",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-windowsx86-64.zip",
        sha256 = "ae333cbd06a5dff56b03e6ba59df4c6b0b0242998d76395cb5487d63306ed4ca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "1f7430db5789a8f54dca91e60a01a043deb243e7621e07418e77c71c6e233197",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "69059bdbcb03e1841b7d64dbb43ba06f593f1765eef7df4b99172378c7d278f8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "9c8ecea717ed1f7645b8815c4bf6f080345b3f3359933227eac34206d6ece148",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "829b927e0673a8d2d2a2da40c100253ebad9ffc29f6e140b1c18db27a6914aba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "08da3f9d3f7ff96ef5bde84449319c31633e523ecb054e9c319038a2f8e6856b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "4d629eb2c73d5a32a45c0798945167ffd548495c3a655feacc99442470c8d8da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "594b724a125745396e1ba6e844ba9a6b12f177e2530d1b61da30cd8b2906f22f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "36bcf7a7825e48664d40133623e5e3b5cd6059931d1515c147e1b14696d310f0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "6f3b520c39d1077298f033ac34bcd4ecc960a6f7d43ea244a836779fcf3cf9ce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "dd2597da5eb94fcbfe70a7af14eaae64e80c7c033679c86c3a4a847313d58ae7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "ebc307133128b158e6281455ee56681231a331c35a64799283f7b1c3fe16bc16",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "d5ef44b21f3b30c9581ea6cc7126813e93a979a86a4b042b5fd99908d25b0546",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "143b62275a9db1c6d57eb56da800ff2065557126215e6f9f20737037cd5d5dd8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "f4b11b4b3635b7e87153f2905914c3145495d9c325aaf3ddf2e410d272880334",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "c6644e7467ac34f6b651798f6fb4b109b86fdfc389eef942a53a5d43aca3b048",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "85234d39dda93ecb0ddbbd4205f3f5e8759072dcecdd70af17eb97e81d4ea2f0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "2b3358959c446383906bd6f62454ad134a4ac96a4b937064d0ed164802d269d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "3ad6a481913fffc30fd7b2778e6f6ff24a539270f766563c0c5839f0f4c0912b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "1f9f3878de03c394a0afe220bf27f279bf62f517073218fa36dd42c0449c922a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxathena.zip",
        sha256 = "1abd02c80914d0419b1852a72ad396f08422902f2ffeb53ac81a4d7417536d5b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "d89b2ba0f1941f3b52ed0bdc7c31aeabc160f2779dabf2b6e2a9069095fd8a38",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "cca51c95d5604e462587e92eb96a14b9681fc8cf311d9edf2c96dc19b3b30bab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "fd6806bbc54b724dec8a5d9b17038ed53c66f0cd312113fea50d80d7d4c3cb51",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-headers.zip",
        sha256 = "2a8113bcf270d2512601137dfe4a052bbbc099c5e7e8b54448d035ad62dd48e8",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-sources.zip",
        sha256 = "05d235f262e7d7c6976393adf1c76a4aad16e9d74233eb8dcff0de1ff2548c1e",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "6ab116929b55f1530e9c5ae7d139744e2d8ff7d107a91bbad0ad96a2eb3e4357",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "1bae1022f2f005549aec947a9b4ff464bf2f9c451a6f9df1a94bbf6119ae80d6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "dc0d0f48b1d37aa22b2d6f95f7b38d16d10b79bcc82051cbb13089dc03d0cd85",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "a3bbf74c08a61aad2f332e976f9b624e7ebeba753eed5d10c3d37026d282d1a9",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-windowsx86-64.zip",
        sha256 = "5567fc2e9a528fa58e7b4541aed5ef8b7182360e7425620cf85653141bbdddd0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "2f92ea3bdbec32fb3b3aeaae869cf4fcb00dd99d94620f5611766506a2435b1a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "8a84ba32f1370c246fe93dcdf0d8f15b9e7f10d976dd2267889e02fc9081ed14",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "8a651f305af62dea85146e34693544bfc6fa9ebb3833d6f990abbf487e650bc7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "1a5f67a0c3c412337f4596835821629d682b923d7861a9689c3d5f958582a80c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "ba5f161a8360a56f202ee3397727c2361c63a706a3654802fe8ee483af0313d6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "1e14550e6edeb09f98b5f51e1b805bf043f6bac7ba1b23a746e0e498df3f5181",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "4c4c80e94d1fa2966645c411fe8adadd68de8dd173c7723fc693905bf739cf6a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "e717438fc024a030960430fd642fdcaac54c136ea8f704f23ee57eb63384f51d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "cea16a0685a29f8ab1e424d57183ab593a6487d50e2ce8364a2012815ed70594",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "3c6b10f28237ebdd2f48722b3364ba19228d53c519cfdce6d87d8a4f2cc1b664",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "71135fe4709eea0af0d2760abcfedeef932dc6c0d582279ebe1ed29da9751036",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "b374c34706e9440dc7989c87e29add0b63dfa45d71f952e7af1dd3ecaf7a1b06",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "8aa6d5a8d50e419d033e668da9f1b607bb3a391169c84e75458b0ae23f85f97a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "9c4a4f6388d9c588ba8dcba9564912fceb58de45c9a85c4103af53a470f08f77",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "c155c05292dac1a11d341f28ad6a360fdfdcf9328514abd9c461be0185413e95",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "21a8c7f35d8c130a7eb820212c40c945d2edefa11a7fcc9c539b9d5e936c86e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "d8cdf6b8f67c7485022a0650bf690beedfd2733efa9e9eeb8c2369e9c3888ae1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "c0180930e477263b9b9390bc51a3b2ca2cf3d5a0e2b492b94a2891eafed54508",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "c2c857ec18fc288aa24e55f6a7ec8c1910ec23ceca1bea5ccad0eaf5576a29e7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxathena.zip",
        sha256 = "c1dbf62e3ba659f3829d63c4c0e677b1fe32efcc068a38aa9cf0507c0552f044",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "384c904dbc4249756116846bdfbee2647ea13f6f3bad4b2718bc91a018cb2ae2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "d50c086842855b2a11858064666a30328943698cb71604cac9456fbf0f66fc3b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "24c3a18a564e47452172457c2986331e0cc50f9cf50df6d7f0878f27bef481e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-headers.zip",
        sha256 = "2253a7b785532ece81e75dace1ab69bb6d82bced7ad815c29ddf82fcb87d5640",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-sources.zip",
        sha256 = "85825816b63170eabd0f6085c003258aecb37b5a5be3e2b8da5e032c95ad4a89",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "3df3ebf767d4d1e1b833e5603deb66268a60d64d0d49ef2e37fe1be0ddba08a0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "381207d2e2ae4890660c9d493cd72ef7e9639f08ee59a9ace10388c2fe7b9076",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "045849ae395f17715304697fb1533874c134b15531e87799a013958455bc42be",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "482a184b77ee97aae141c82cd1a7b4af9644a4152ec14a45a3bf72eb875b3a90",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-windowsx86-64.zip",
        sha256 = "e52a1b220f464777b0e6c86f02f23852779735e0d85d5c146dc803db2c4d9c85",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "94680337c03a510d3bc10dd39db6dfe80365cc4c1e18e71c49e8e15d465802bf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "5f8cfbb34e771ba8c257c340524d3e1fbd92b01299180c604e3298c2546f19d6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "0f125422a8cb71debfd6bc491c5d8f253b92656ca85a355828856c8e5b26b6b5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "89b4119f4a9bfe8103ba172c573f874f40c89476aed56aed8044e42dd59ce49e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "76b97390d5c3f8d61ad5df14e1b58c25e787bc2bce717d4ac234ec09858a4fba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "a021d524224f351a8a1d0fae549f94327f7463e0668729692f80029c47ad3450",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "0b891f994ec4cb82d5c50bd00708538aadd514218702848014373f8daa1f3f4c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "8442ca5647aab3ff7cefce60c06d810745a1a5abaa9f4b892c914603083de15c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "20082a86dcf40b2421f17d18f756f7692fbee82dc7f79580b9f455c29bb5652d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "32f8c3b158deff9f303488100eb6f19b06837bece0e2d712b7109ce3cd911e6a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "22440aab709f3b58af6bf5508fd0bf83566bf130d0f827e118e936fe7719da37",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "96cafe61f8126755e97f5b58c508be6d2102431a579f8ab7be1c9ad324630779",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "7798d81f3a1a0061447d35e71e4a917893c58a88f5a6db6efeb7b3816104495b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "1ae2e2d10cbb87cc4949763209b5414f26ad3384914e947c6aea8a6e90055b88",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "e353ed893aa101439611440e37eac493d2bfa67c29411d932124399da797e5b8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "0d3eeee334cbcac41147980c8114335cc7a5e241d02b7fe3d0704a906ed3c105",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "ffdecc1e522686e649cc17eb87de534abc7f9c48ac2bf85500655360a8a2ee7e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "3e516b37b24ca9d42dcb7305d3602fa2515eaee8e7cda2c9d1e0c29b5a9aee01",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "2ab8b06f2f8b90ea464627182fb2a09d8a121b92703ff512f0b6654da21bb78a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxathena.zip",
        sha256 = "ecc70f2d14638a51eaa1730a3fe82c0df0d9e05f88b965329cd2a43c6e3f1c7b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "9807b2216bf02188ba216651ca7247461c99bb96c776ff0a8fe43320507b9f19",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "fc97b83cb7209de6284ec995cc0e3779999fa5babe7b5e3b57b56f37f3c4585e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "2aaa4bc70ba91563670cccaefc19be082a354bc4053a7e8d376d0984f818366e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-headers.zip",
        sha256 = "598ef9661644db86ca6e1b7641ed8ff9bd33cac37cf17b520a12373898bd3992",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-sources.zip",
        sha256 = "e5c528c5aed9505c41e7c5b18d56e2c5503e56c41e2a738366cc5126000cf822",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "2fe271bfea2f091707590d5d25212b1ca8f13faef0a58df4c4d02b5e0314ebbb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "0a02f21d2a109afb8ef5f5feafb25837d3e616f4c5eb3f076c59d0505e444c5c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "fde613488c9614a3472a43284f161a25c48bb55141314f0b699e368d926bbc3a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "dcceb6ea8ecf5ff6b6f87c392b81a35ddd0295a26116dd479c363fb6864e43b4",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-windowsx86-64.zip",
        sha256 = "246cb34273bfc4434fc04f68dfe25263645f8a2c14a001ebf2bd9638150876ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "004fa65909341259cdddf1e98d6bd8c44c6c09b022eda6990ebc5b606cfba5da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "e1d4a031a341ccfb8a8cb462f844dae2594cd9e89d04f1d432895f02d9768f0e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "195d7540310277beb6b13a85b669f9cd232cb4ffd37d7ea890b859856c7b7716",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "940f0da4f0781c429943d0a448b087d2191e511f68feb1ddaa0fec9f16eae782",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "00add1ed609cd1e4fe52f0cfdafb49fa9bb74f6feca5da292aa6d3ad413a4675",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "b6d38b824541f3dfb03f31fc94d0eb7eb410027e6c97acdaab27a30822d08e42",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "f53c2ad583060770d0c258eeb2976a6a57e1540a4d2f1165d70c2ecc4c13299d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "ac4e5129b00e88fc03fc5d35df45907750667d04cf1a199f02beb92a3c10c1fd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "79a85b47e52d8ae43282a4df343f06dc6497085877819587e68db6df9bca9504",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "935b8d08384c4fe664bd16f12c1707e1735120d38b6c03cbc177ba9284c491a2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "ca8bb31670a1a49db6ab40d3a8c281df241cc318d5961e80bdb1fefb0e077679",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "c8e9be23e9fee22b89e6e427af7af303073bac6640ddd8b5b8524ae1b3b93eba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "51d88708f808e6b43f3086310425f2d22275452cfdc00910acfcb1162b186af1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "50f8f9e8bc738b80006e4e2c316bd461ecb8adf3c7d27ea58aafd69799168f41",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "a05accab5866934d9715501530dbf9a896c4fbf72d6af4b90c03560fe5bea941",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "3c10185df8931d87678d1c21fb3f536a99e9298ff8488fafeed75d7ec2b43412",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "a8ba7316d52f71b805c6a1bd857fa7dd54dc4e29cae44d09415f994817321e32",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "6ecf8eece464f66a6dd60f06a32c3f7c5743e3f18e1f8daa172f4d58404c590b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "a02af3ff1b97d510feb4b48c5d160d6f41cd7f40342f4cdde5b5692a6dfc90dc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxathena.zip",
        sha256 = "7a07e0683327063a4d11d2c1fc5df99f3138a77e17ecd2dd20b5ec70d4213e66",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "e607a11ebdc4399c4dbd712ad97fc029bb3369a68e1c845f850f00356ec9b841",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "db531d79678158cb71585a2a0ea67f4613c6221a9c3b7b1c04d0eacc8e2eb661",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "716ac21e1a0d265ecea3856b46a321af6aa6e0dcf7614bdf0be624ac0b5fe67b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-headers.zip",
        sha256 = "a026dce81a4742fa8f9f47eb008688ef2630b25e605ce322d546479eeec537d5",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-sources.zip",
        sha256 = "eeb8c411ec8b18127edb307af8711a60ee13648e27c5d70585abb37eef6957e0",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "38cc184b7cbf54a47ed14e068df317d8a9d591b13829f4eb0d950da4863d7855",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "f62c7bdf64d640fe622bc50c54aab7bd68de41fe470c327ecdef5c607c4120f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "67a9e2a92311b16a5a3009c652b67fbfdd326364a3e3cdc4b055fc13e51255ef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "4b8c7a44d273678373c1a62e324757c7eac4372467f89bed806274c3bfea4b3b",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-windowsx86-64.zip",
        sha256 = "a557bfbc16b55a625604b4062dbbc9f87b6def2d6a0a517fdc1a7649ca310570",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "5c7900e798e9fda28f31faa87a341e4116eb0403714c9280d2fbaabe66126b0d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "d2b1b181f2bade4f37b977ee55cf314e3bcce6c395fbc386b7d1837fa458bf74",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "5ea2515369797095bf1e6ee0985303949510ba377b143897d65a8fbb61f4f215",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "c7c73a51d4c556c361d09727e2f64938d4b4aa890ccdc0ed19d53084dfdcecef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "4fd7be3afdff92531eb2d9e02c7502b3a3845315746e08403d6461193617ea92",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "632cb0f7c66cee25a81b58d869c16fcce10340fed0fb5fa1dd9d84c2ffddb161",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "3ad34fa0fb8f90a2149821edabd9bfebb7ef8617063ad11abba338d0e302c840",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "47213a0114c76cc2dcbcb6cf3d6378a6c621d85ce9b64e8e6039faa39b2c0417",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "c40c87d65a0f169ab9f74561432fa5a8303be7ad2071329890d584f68b8b0228",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "fb8c1fdb3b1442df90fdbf27ae73dede3fc9972925211a5730e511ecfdee64a7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "216f71553ccec637e2c5ac29526b524a9f1069b882c58499776b5f7075896597",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "a3e5c049dc295efbef57d3e02a6831dd467169c5ce22e0bc60a6a90bfbea3300",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "1b3f1c807f9cb8f385ad79fc6239d4a7c7915c8c0da1683134829dd4d84b5614",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "c09cb8edec788b2c4e272a4d97c16625b53ea4b209fff89f19477b5002f54212",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "0c59685dcdc31af31c7072cc08a278fdf15609f74b56723edbb52fafc08602da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "b011e2948976bf04596e3c2c5a0f7b8cbd584dc46b660c46807f4b5889b5f3a1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "d3fe30196ebb8a184e25bfec33ccd4e0821a70cf1740a6785c4098a026d80fa6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "ba1e9c681b97687b815ec148d4ced4b4cafb4b4138d73255e7ce16a0adbd213b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "a96fed8f84ae98bef6b483517f0a530051ff5f208cf3a9032ceb5bf504c07f46",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxathena.zip",
        sha256 = "8fe658109e51fe4ff89f4f4e83576771e144ed6acd707222c1520e61d374d2a0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "54607896163d8f998dc31db11fad371775f4fd42b4d7fc5a01c8bf0ea04d58be",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "831f4990360cd9d14dcf728e727433913594088adc46194012caec412955bb96",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "68894d461b802907248d832ecf33ba555347c2ccad02393aecd9c7d0ea0ad05b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-sources.zip",
        sha256 = "e144861dc167904e9ddb38aaef5f556a7ebab48dc2b4e6b41cd59fa569d7fb20",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "34999305b2c65ec0ee82c4a4e52e5956f53ecf8607a4b007cf0c4ce92ebdb8ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "9d1812992b21a8ddf596af2eb47b22e7421fb1a25209a06c1bc1db6f8b0abbb8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "2c9e54343d2ce1e58e9e361d9078f48016e1dc4d545204055f4f95c2c5bd6614",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "10aa939e48119f8cd4c9af485ddbc69405a9bcb09e5e0c84a2f8ed27ea0916ab",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-windowsx86-64.zip",
        sha256 = "e14019f03545b8b38d7f8e27f53d22c597439f4771c528a54986a5d74491c911",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "9387c9005b6d469a770f5bd94da218db1f12d2e2638c3267f1a7735f2ea05634",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "cd88b26d3128b339c86ce10f3f46db65227498aa065ff78631b0a47a32dab13d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "d4614de7393dc80c21121b80e66e4bbbc0e1f0ab0a51ba0a6aef2bc8f81ba91f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "02fdc458728fa562c8cf6db87275290d0e9e14267f7996e453f54226825b3358",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "38f9c8acef0e12c23ba2020f2edc9be38368fad7cc740ce80d9fc1dd25252392",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "ea988f59d59499884c1cf9cb651240bdeb3c9c1f7bc00b34122f7dfb6531bdf2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "906298c018cb42dfc94f846c8c01f294c51ed3014dc2859c6f38ad761350b030",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "657588ac0674436649e9ee6f7c6c915be7ecc8edcc364c0d6df5f1fda12e6cce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "ffde3a099b922bd8de597cd2907f64449f6c1d95e89c52d652a72fb17f18fb03",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "f474ebea70f78e851ddc73161328e934f5cae3de2a95d5e88c07f6a08967d6a3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "a5b3079d1a163c94da86591571d79933ba6be9cba75d594b2c79034117057162",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "bba155dc9868c10383df68fa644a21ba6b7ae608291a5a43417bbc266e8c2153",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "e07f5f049fcf9c6dbf6d9f96d112d3da08bb5bfd33218891567af0b6986c5804",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "a40af71eb8346a7a9975686ee735305fb010bf819e7decb912c22fb65d677916",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "8338b034f45650f7e16dc9d6ae4a23035e188db300f19d37612530ba17fe4a4b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "91b8ea544b56eff80f984aa5ee707a782bd30f1b848042d7613ccb98b3237117",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "649b82ce4ff434a14ccd85be259be14b1e50757fbfcfb7f6372a700977da45b8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "c439813b4dc8f3c56ec9ca83e69c8a2342fc4aff701c6fc7cfc923a77c8a1598",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "f64a393a8ce1027d5afbfdac9ec385e9c0b90a627dfa5b991470a62b6e6a4b4a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-sources.zip",
        sha256 = "268e87076b39ee2ec1308f28f9fe5c36da544198bdadaa636774cf4a6805a6fe",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "7f00ce4a82f191207a506730f2d4248c4dc94574bc2f040ac880be7b7b280182",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "8a1b75b9ea399f70c19fccfccd044cc6759c6801132a35c3cebf8e1452ac6ff8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "ea9484cba2cb16e56a77643dea05a8fd8cdc2234e8300c1fa2a48aa7599e60c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "a756c1ad9c750571a8d5a07fe37fb64f4fe7f5871ca7834655e45570530939c8",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-windowsx86-64.zip",
        sha256 = "8cf4ac5200649013670f0188127053238957ff377755b52fbc639754a35e0ecf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "e7c38214f7f3ef53e954e5ed342bddd2bdec37c22097305a1403f71e2bfba1e2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "c3d6a568af137c030ea27cf29aa6fb76e408bc300705e8a0da9db9d3f0dd1bfa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "13c6bf6de3e6098b9c977394c35d2d74b97699b89b8dcd08a06064c7b34ae6d4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "4ad7122e3a0248a489e22b56c0e0573dcfba689cad5e01b1e4df15bc10e493f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "d583dafb5bdd32817a0c973ecb5b83c5515fd8048ab6a6a6d34b2c243948f7a1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "5319ac1e96868ef15ca8238e772d6b75610893c54f91985468faa3d811cfde01",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "b7a6cc730ae32d38b7bb6e43be5eb38c9fb4ac9279ecc1b8c659c4c3126abebb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "95df909efbde7027169b593a6e5c0aabbbc5dbfc4ea3bdcfb41238518d83e2c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "8487ddebf9e4eb871686d7d301d1f0f9c9fd011061ed25dd2d1f96d56c65293c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "acef73c8b9250fae760f0499c52db99f09a28f92be3ca82c367c547e0da95f6b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "66ff5d2ed9945f0b74e4c9749e2d5113f773c405545232e0fb3eb2d319c19a7d",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "342038577e67f30bd1e0117c3ab411c135391a2d7f1fc48b68ffd76c518a839f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "5aaf6650383818f9386e0eeb38d4e83fdadf5825b77ea1f2baf7b6955765f19d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "32506118f781dbe662a33c7e10abbac4d1cbb88d6fd42f831e6a5c4cf90e0d85",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "fc812026084dac7bae7e11bad28b63f689441fbcdb8eee259986c0e0125b4213",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "3574f440126d8685a1422cd5b4017abc9d6b936ac21d67fb9beaa26a5d68f6ad",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "b690c916becaae21f12e0cd7f500df07f37d62b1d686855b4406f913e3361376",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "a4dab4b50b125a39f55e6d3ccf0ec7e6f40e3c1815dedd8b196e6729f952a003",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "6025c8572b39c6a0b3c6e377d897234d0bc5e6a70209b6f3215e174b134988d4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-sources.zip",
        sha256 = "009ae7e30912497dba453ffc86340d91b4c5ac8faf4d5a3b7637cbbcb1e439fd",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "046fa922bfb7e9870d9fed9bb02f3464d18b6a0ff04e5456caa220398c6960ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "ce187ff00505d3b0cc94853b26a333406a60cc288d02b2d92d29e653fcba8c18",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "3a5c5922c4994c952240537aac9ea658ffc3fee174250a9449e13f0da3d861a5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "fff6934742875adcbbf2e8fe83fae9d9220a907ae56837861c6901f279bbf9b8",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-windowsx86-64.zip",
        sha256 = "a49a915b42d057df17164a35bc7ada7da4a0b749c52107992ce6880bd78f0e87",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "f521b8e07358bb25f4c0b62a46d227280eeec97c1e553bc796223851fa803e05",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "56860eadb6adec0fe23b8c48c110df728e824322cc3644c7b94ce9dff7110600",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "c42a646f632f8187ea660a790ce55f0da35bd64c7f00ff11a7a66e0a596da751",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "be052344fb3ea1d6df8cf603f5056473a93d2b9e191ee81f20472e41f276d0d0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "7b929a8324fd8e52d1cf7616c1bc9cf9fffca353c3d0d68463e73ce36e2263ca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "48cb6a3878df99a2decd222dd3a31ecd24062a9991281606bb5cd1a83684f6d2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "0bbdeaf5297e0672478d175e7b46b332627bf758660b0a3d57e46aca896bd648",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "a70781422828a296a655e8317c49c678e35d8a1271068bd6b20e69af94722e09",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "c0999120b7cc0f85ee1d82adb256eaa5ebfdfe4e296f9d1683eddcdd07ebda4d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "8be00111c0b7261ef3b3282021961f63feebc8889b6c080d638c12f3a5229918",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "c9e4e63a1b9ea895c330beabf6689e3d539751b9ea09cd4540e013e1bcb40a3d",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "0feb533f70eb2f4d71a61a3f01d05b5958071cc2edc5d754d01d8e747ada7770",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "273c91cb2774009d0a7a13cc6f2ee2619a74f91e4b5fb4a17914f46eca101bda",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "35f28b1a0e12490bc5b0136dc833e24c745410bac64592c3024cf8a57c292737",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "c0245c0ab346077fda90997302364eebeb45cdfe0ec9439f1313feb01874e16b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "a7a072aa59be6b6a2f0a5d39bb19f5ef057ea062920b7e5042213f0138af2a83",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "c362487efd0c916f1cde6cfe90db218ff24346ac0a5d070954c82f7e6ddf8f2e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "c11daaa2b6d962b3e0bbab98dd0a281e6760279344b73c6affb1b85378f5a5a3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "b84bb6ea33cc82929bdf16c53f1b1f2f60130fbe3a3a774ca2c440cabedc140a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-sources.zip",
        sha256 = "21da34f1ddbaadadaae1edb34d9c593586f15bb80d9140c8b238d624491ff570",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "d770a9f43a71876b9e67433ed71ff26e266fa77b489e02c8440578119e860ea0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "3c72e6bcb5250e2508940d09373bfcde885b6ce824a0a41e31ecc766771f6598",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "25f74cee900dbfa065a64ec90d2422fa18d5f80f23c0b39eb196f8b0d5f0c9ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "518b1372304f0b76f07aa56a83e545e0eb46aadab1e1a12b5b237deae894135e",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-windowsx86-64.zip",
        sha256 = "936a1111cdafa64c6093dc80b94a6aac3d01b414675cffce0893cc29b9fb7d2a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "097178d4ac943c287e779967124e7995f082ec0a08cd32a40341b062a108184a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "6cc02f09441afdef7fa236f3f5b1e3f656d5b4275e5cadda3542865e88ceb2ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "ac3344f833634867eae88bb643101b354134fb9867fb74ba9ddb9ecba1866cd7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "48acb13242fc6e27e4f40803d17b086c095daf2f9cbf26b4a78107e496db2e47",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "53be5f8521acf9197f21a386627eee50c21c33d3571b91e039db9628d1b9dab3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "b9dfb7399710f486fb4b298ba3977c2c7eb08a122944efffa3d7bc42f1fb2d45",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "d1fda5d1dc14b91192e056ce950220c1746550c41b3f49f5a29e40a086ee9945",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "aa2785564c0521d4b3bc542e5a576ea178c2b2371395ce7f0a38503e17307ce2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "77ca565c2e09f954fcd84280a02773223dc679d5c98c834792192ef293588e09",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "5cde3cba4ffb0c300565b93db8d8c3cb1bcba25987bbc8b2d6ff499a5664dee6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "b953cbcde48656f001ccdda774177db8146311b63d22c2f7a84e63e9057f254c",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "3a184d9567d5658c77905f3bcc3f4c8ee050eca42fbdfef9ab13b3576170eb8c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "9a0f402ec54d500c1ad25baf7218d98dac9fc999dfbaf39b534dded1eea5a90d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "cc6fe2ceb04cb59457fed47f3e7e7b85cf9a26889636be3e70666723353afef6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "b42a822032332a2c1329ab0fbbc47a55f400336f93df1ddf954c027aea1ddc5c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "9fae3e502323e6fbc6b0f3c76100b4d1e409de2d4f2b0c3445f346a1b8f83c09",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "b562e7e078f955ebfa53d2400707f261f74e30f7ca9a7365fdad0b352c2207da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "8f4e3520ff03d39ba595299b6f972c308a8d398920816b0373eb443c937c34ac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "88246d2a42987a1b65907756795ae0e9dcd6bf0b133ad29a11137f888467319d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2025.1.1-beta-2/SmartDashboard-2025.1.1-beta-2-linuxx64.jar",
        sha256 = "37d82389d23bf3e6cb5a026078a7afb63c55e1a1c8e421018500de33c36c3af7",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2025.1.1-beta-2/SmartDashboard-2025.1.1-beta-2-macx64.jar",
        sha256 = "1ba1323055d0203e70195273997e9f42e1ec173792e3eec70803bd2040901dcc",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2025.1.1-beta-2/SmartDashboard-2025.1.1-beta-2-winx64.jar",
        sha256 = "083ba244b3a57120010f1c75f22d8c9549f7cde9d43b471cb43b6ccc88604e25",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1-beta-2/PathWeaver-2025.1.1-beta-2-linuxarm32.jar",
        sha256 = "15faf22b65c3e1a82b067059e55b7c6bf9278bcf4c789135cd8b1ee181cdec6a",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1-beta-2/PathWeaver-2025.1.1-beta-2-linuxarm64.jar",
        sha256 = "ed7d7c208b7042dfc776440a8526b478a28b1c232107a4fd69615459aa577e6d",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1-beta-2/PathWeaver-2025.1.1-beta-2-linuxx64.jar",
        sha256 = "d78e9b2f0b7bacf015821be9452ef39cc648345f39065dfe978a3acc3bb3a33f",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1-beta-2/PathWeaver-2025.1.1-beta-2-macx64.jar",
        sha256 = "2abb4bec60d2a5b897d7249da3454d276641bc31747c60ad3808e452f767e70a",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1-beta-2/PathWeaver-2025.1.1-beta-2-winx64.jar",
        sha256 = "e21260fb15f2055cb4e082b6d9057db0f2853bfab5cb6838a2bf2d03565ad19c",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2025.1.1-beta-2/RobotBuilder-2025.1.1-beta-2.jar",
        sha256 = "2b9515fe1ead332d73abf2c8290b22dc9f0d690dce5249ab029ac98869473afb",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1-beta-2/Shuffleboard-2025.1.1-beta-2-linuxarm32.jar",
        sha256 = "6a5b72e7ad5bdc4f062f916caa7bdbe4d704d9f56818f037d275f0455fb5e293",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1-beta-2/Shuffleboard-2025.1.1-beta-2-linuxarm64.jar",
        sha256 = "6dd6b75650809738ce40cd0957d494d08f2929cb5a62c557777fd6b4cfc53d93",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1-beta-2/Shuffleboard-2025.1.1-beta-2-linuxx64.jar",
        sha256 = "5a4fb4f0752805155296b13d0dab17d60be8457d5c62373393e3fea2a5275919",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1-beta-2/Shuffleboard-2025.1.1-beta-2-macarm64.jar",
        sha256 = "29188bfde3f17d8aeb7394b021bf1fa33e1bd86309dac4372a0a84f8426c328a",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1-beta-2/Shuffleboard-2025.1.1-beta-2-macx64.jar",
        sha256 = "b7973d2ffd36084d677ef80d93f7c912ccd461f9029e014df172a87605138a81",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1-beta-2/Shuffleboard-2025.1.1-beta-2-winx64.jar",
        sha256 = "e832f0c1053d422a7aa53b9cf808b4580aba6fc8f0bd4d206badd3f96111513f",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-2/Glass-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "2756ee81ef888bd0ab727a3cd4a292c3dcecd16d4b3c63e67c3a9951aa83ac0f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-2/Glass-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "264d28f2481daed5f5a0420298edb014528eb6d39800125c8dcfc695d684e120",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-2/Glass-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "3dde8860d2d0826647216ac1dc75495a853a2c632622332171e6734c4aa3c4f1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-2/Glass-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "afcb38852a61814497ddba1deb50d49dcbf1aee5d1b7f78e624f850dfd79d0c3",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-2/Glass-2025.1.1-beta-2-windowsx86-64.zip",
        sha256 = "5755332655f82500e63c14922deb6d7a25979932e4e0b88fed056aef891ba242",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-2/Glass-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "9e2fddec869eee1ffe3d3eb80e6885e159fdfdbf6b14c5e35603d94b74edfd07",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-2/OutlineViewer-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "0b84cf6cd567a678a202296d7b02004678395e7b94a1e2da2ba1cee749418f2b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-2/OutlineViewer-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "d0a06c4ac5d896b8b5c42c1c87ae0d6523ec18185d7170f4593787888622afaa",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-2/OutlineViewer-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "cc860b504feef216d0562d4c76c19b6e2ad987d09a3ab6fb19adc6ff70143a5c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-2/OutlineViewer-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "7881fcdcbd7d842d2744ba074ab7fa2a61abf4ee30fe9542b1d64e395780c381",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-2/OutlineViewer-2025.1.1-beta-2-windowsx86-64.zip",
        sha256 = "00e5608410709de57245d4eb9b01941a3151da29b757a4df55b85427de41be5a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-2/OutlineViewer-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "e53afd1a22e0995a8d6191ad88c9ab6e8be62b69d085ba64c3075b81505df177",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-2/roboRIOTeamNumberSetter-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "b1becb70249f1465a49926ce1b7aa6b79c57f0c882c489ff00b8c02c11667379",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-2/roboRIOTeamNumberSetter-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "b21aaaf4bc4e29d01b3f4ed9a7f9fc330dc7ecf7d7ce72b43fe9c4e6b85f0887",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-2/roboRIOTeamNumberSetter-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "0e3ae57a76f4acd0211cd36c97ab2d869953724c4e87c4afaf23ab1b0458acd6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-2/roboRIOTeamNumberSetter-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "e98d9e6ddee1fd4112056559d7deca60570e294cc3333d67da96504a139b8150",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-2/roboRIOTeamNumberSetter-2025.1.1-beta-2-windowsx86-64.zip",
        sha256 = "36a2b32d95ec3813ecf24c1d9bed4ccf033c6df7914181f8bf1fcf5c5a690541",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-2/roboRIOTeamNumberSetter-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "660b296307957d948ce30c2d0c777faf7a879fe442888981183b0d48678fa593",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-2/DataLogTool-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "a954f88cd14d1ebf21a362c245f5f940f632114c2f85a86eedbaee18d786610a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-2/DataLogTool-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "c617760b46a4baa06d5537c19b3d8b3c423c0802a16f7e454a1b530951987770",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-2/DataLogTool-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "0ad77f18498cfed534b98a68f64f2c2ea888944302924667690dbb7e961ae8c6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-2/DataLogTool-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "5280cb81be3d2404e52a5f9ab88b21a35add2e08db3088592d316b991ad57882",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-2/DataLogTool-2025.1.1-beta-2-windowsx86-64.zip",
        sha256 = "9ceabb237553470ad56b37998a3ffb1db530b637415c3dd125a06ba5b5316043",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-2/DataLogTool-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "cda6441e8b67c62ad189dba1c5e6e08be6df0ff1a6516a8231008ff7cc95d1f4",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.1.1-beta-2/SysId-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "019591f5c77b4717b06d2c7f2c3b8a993432ea71acaada3ef17f4c369ad5b4f2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.1.1-beta-2/SysId-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "c66e9900c69447be64b330a6fdc1624d6856ee99c32ef24b87fa39c07570591d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.1.1-beta-2/SysId-2025.1.1-beta-2-windowsx86-64.zip",
        sha256 = "1363f297405786033540c8196c028513556b7eea5748c6b74446bc592e860c8e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.1.1-beta-2/SysId-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "bf0d2064ae91be81db0054f67feaecdfc1d058df133a6ee8e1346f59db570541",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
