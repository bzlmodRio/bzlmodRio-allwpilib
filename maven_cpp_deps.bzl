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
        sha256 = "80e63a3f8ec79b270d465039baf512b83f5b940a769c70d9f48768bfa84260cf",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-sources.zip",
        sha256 = "6a4cfdf93108fd5a133589d8585b8534d69a9849a88a0e749db23f5d76dd6e6b",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "c35ecc5350b7bf996f169723616e2fc90710636bda97267690ee96f2eac5142d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "3e77e5888628c60f4b2d53f8ecda2675399e04d9dce98da94e682202459399f8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "bb02dbb93da677a28cb3d249e02b8f636f4f4a31fafc2c540487132cf77102e6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "e6957e8628582ddbeaa6849126437f82b5d21a858547227d9ab94029e14b06e2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-windowsx86-64.zip",
        sha256 = "269aa928db9d701af371d1821522a243ac86ef3c180a0eef7c23e5843e672c23",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "485cbf8d0093c902362ce6a944f1ee858f7b016da6add9e9a7f114f0bb3de020",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "74b34c6415a4cc5de7a329d5653eea42e996febf2645fc50d73210d99cacbac6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "ef52e5a6336d9325201dd76e45d3c9b0b075493fe135e14b80d9ed950fdeecdb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "fd624ba5e940ddf15fdaf6de71c3e7d94c31329edbe7240e8ea30bb3d23c0240",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "f5a2b65ea736822855c65682abc14d78f0c65936d9b4c2008886c6d6c31032ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "d8fdfd17ffbe6d9e425923c271c40ef98b76930cea890df4aea68b5b3d51377a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "11ef87c0dc1d121d03ee63010e6f57d3c39315d6ace13f1b6038905fd9179f02",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "84b6d9285fb2338f555e374521504fee4707367b0e06b638e226404c2e486e8b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "ad0bdd3c20f98b10bf0549c2d09ef293f8d1025942c26a1af4fd7e6d54ad389f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "1343d024574ea3ed93ca618b9c991d50462881f64f5a73329ed340ca61b25925",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "885ef8ad0a766807ba5aa43b4488f135e08ab01218f844d687b63e9a6b7a8ed1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "7b966dd152ba33ab6d656e8058b1152ed311effc5c95c91a5f3ec2fcb99a4ee2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "e014035efbc8bbab883654b72f72db0bd43415fdc2e5e73b4cc9a5ce2d8c14b9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "20ca4a4ec205efe16c311816238fed161597a8cb9bea451d0a87107c810fb729",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "d3e113f9d727f1bf5f4e1a2e9dd32a8d92121c6aafc0068109bb084686c6a00d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "2860918205d2f8c2059055acea2c7547948aff989ac0956a21b18b94a4b37a83",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "a2ef945b4b7e5038072bf51bbb1a7c6b59e4dadc4d60f6dfa78df2ff27fcec80",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "0e229d37b23d5ce81b5d1881268327f75813c931531c7c6b350af82a568de505",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "3f055f3d0e59b44c9ac56bb2ad61411231912a0e2f6745e83ad9c97b152e22ba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxathena.zip",
        sha256 = "4b69d0e4178d515c6b6f669396ee5861cf4f87025a7abf343a117c9dd4326f06",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "7345f7103532be05fc0bc537771270369618d3b50f9e05b097bc5bf9f7a3996b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "8e573125c9482641865b5b0e1d6954bfdbbbc31b2f6fa9c1d692f49cb89e4303",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-2/wpiutil-cpp-2025.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "816be71bdbc32a79aca66ab2c6b55aeba9add4eca1cf00010deccbca6cbdbf95",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-headers.zip",
        sha256 = "9c505e2cd1e046918cb28ed37f04bec261f1b1c8a27e8d2a86a5bba9d4a15b28",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-sources.zip",
        sha256 = "7f3f3e6a2ba98298e8d6660d2e16fd5b55eb4fec4e5da68b371e2ca5429aaca0",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "535973f81b30a0294472b32f9e75e6a86d0b01a331d9c14de07567b7d6be330b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "9f243a17a5e6e93f67b3361a62be4152de50da8ba09b52d5d2a990b83c2e125d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "5edb30c71b62616e0a8a0c9f42c407e9b3de13aeb90d4bcf22aa09afd45848bf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "c9cae72f77a5c324bc9420369ae8c9210f60b433d8a8b4117a979941e9735e1f",
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
        sha256 = "2b833c39f6e26316bc56ecfe0ccfaaa982c490850c5a70878bb75b5936db3b66",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "efb288e15e26f8ba043bb9757cbd45b836d215f93c10f910e114ba534a3512e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "43f90f9165929f8982b2591b429efe69f4e49f394695752224cc647af92b7c97",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "ed3f3d70d602ea6b2bb69debb8d7913626c7619443a2f1aa84ee6db3c3acc619",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "8117d14958be7c5a7680d59f1996779a9ca54cb14fd669ea097b1690bb69bf09",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "6c255ba961a03d589c31588a22f949c063ac919519689092fecf3e402307a724",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "1552733d0e3db2beaff498dc192051ec7c13bce06f4b1e16e6790dfc041e36f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "270396f1558f24ef01dc8e9071d5642c1d80b42f2b7244e5e0f28308e05f2bea",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "8de2681b75e744aa5d8d2883eb1d9e24fdca11b6b2296a8db971c9577f306a23",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "1a0006318df98de32e3e0492f889200575554f661b7aae4b58cdf6b0489f31a3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "3b0965dfbbe47411ba20441994e8628f2e106494ab4fe085fa76803da1eab749",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "b2220b447ba9f02c5f2178a18793473920695345c68ed654282af0bc3fc06b6d",
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
        sha256 = "e8167d8ed908f814c7866d5ae76e8a8e715e5be62561b03e917b2230c072c343",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "74dfb404a4199d00a98d98d688235dc3e8b566229b1303faf5ead606e479a8dd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "d32fe8f1a3ad28e8cb1c1171b973d7c09924a80fa3601ae52ec94a05566d32ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "145fa17a5a8220bce3ba82eb57936cdf4f42042ccd603cd19e9331fcbbdcc598",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "b90096ff63902d7573b6ac7c809789592d724bec170579859b7b9285ff3f5cbb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "59bf18b73b29c9d7ab61c1464e4b2787cd9c7667ac391074236fe9eda9bd0169",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "dae273ccd8bd6ccbb7f949531bab36c4608be2ef3247f2e7567cd9bfb3fcdd28",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "865cff731894393fc0cdb26dd0fbca45d09a6ca6e248f5677b92f7fbca160b75",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxathena.zip",
        sha256 = "580fc615cb9ccf2332f7818948962136fbbec4d2b43723addea3a6d30c2c7b51",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "008282597e118bc9469c5a7768dfd79059f924f1dd1920394bde12ede72230f3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "1bc91f05017710f834ba36b6a1f84e36a54618ad941338eacf5892e2314978b5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-2/wpinet-cpp-2025.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "7a848195f1f8c1b00e42724387fc060f31346c30e0b3072149a268b258c62cc8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-headers.zip",
        sha256 = "120edf7942e42834d1afacc9b94dfbb96b29a80fb383a3e604281324d40c7ed5",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-sources.zip",
        sha256 = "c04da282b9daec52ca30d3dd2d5f29a01bc513138a16e89ef893b6e39ad52866",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "b36530adc6a8c1fc57cc975088327b7904cad7a8f2ca1c6620f3795e098fdcf5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "b19a451e0cc973238c1501da3acf4f78100511f420eead94f52b90e2f05594ab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "0ce422b44b5dc6b65eec642efbe2d7cd21f27c929af09c6256f2dde1b658eeb3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "0d957e7fa4339193d47ba1e1efbcac0157faeb0fa6c60e2b7821273ad584e143",
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
        sha256 = "2914c42f95b7dee50199ae113961e499bdb6d3963e6eb957b38f33ac99af68dd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "0f859427b539a033a91fac15d317b70ee25820fce59d81ae05cdc74d95ec0a6c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "d60aa5b5e28592f8474cde8d927f9fdf0feaf3dbfdc2da68acb85b7537d994dc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "596eed47f86d2dffc4f88fa0c67400ce991ae37719045aa027724dee8749840d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "84af754ce99934866d4573d2d1c0c5359499387da7ea517791b91197050b5f19",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "c8ed6a084bfeb7400c0be05091ca0c0576f35bf91117055719964f37750e7412",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "4cc7fb5045492501ed02ad57fb2762b1c311dd32b06982afe5514026da0afc8c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "adc57026fdec495a6ea886bb7a59e00f99b8c62762395868e4d1684b66df90a6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "277f0ed9f21e990233dbd742d797116090a42815d6bf6aa4f516eb6cf9e03ca7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "59de6f385c936fd86c322b7c33a6da3a25ddc74ce4147412ebcebd4d6e8d6f9e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "5f014cdbebc2030a4fc9866ebc90a277068771ee8d0479ed638a2cdd59df8332",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "b7c3bf7719e97eec09fd10397943376e640121c5005899027838b2cef89a46b1",
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
        sha256 = "fb2dfa345e0cdb569cf1a7ca19905b5b280edbeda43457f6a1780755179330f9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "ac92f4318a15d4ad06e68b855c641652e49b09966e7bcdc7a71e4b61c5983213",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "61c6727da134ce2c681071ab554635654bd53076a420c0ed96f82ef814feabb4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "fa9d5ebcc69fc1aa0ab183ae36078bb66f8d05bd42d1af27b4803ca477fcafac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "aa9c6904aab74d359f78683696d69b42e9df0a5066c1e8098c6940a8d993bf17",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "b4c1af8f8b649df167cb1044a08dc0c5c25fbcaf5b4cdbf5a955bf19e4c1ed25",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "740bac55479266144b5b863af808e61f2e61117da32ec867bb8dbab3a23f1fdc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "6290d49c28c5950f7f1a829d8987efa44d5ec0f23296af4621aa591978eea645",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxathena.zip",
        sha256 = "aeba43657ba93de9369d413a11f7ff14e5408ed2af0fe8caa84d8a44000d8418",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "71abc6f3a9b6837fe1dd2e9e1c7d458645e99d33c40ed9461045c8b679098249",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "149e05b6cf91dfb92bc7aac63af16c71f2f39fb6de35d9a1bbbbc211d0da279f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-2/wpimath-cpp-2025.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "5ff9682f55d161f7481e93049d7afaf4eeddaa6726edb3461130760fa984f042",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-headers.zip",
        sha256 = "668e8a91397f2af63476ef08eb349d445af9132f1982aa55eaa39353e0910522",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-sources.zip",
        sha256 = "3b5c00f6f3eb29959bffa0c2f9260a9b94b65c9b837c006ab92ab318dcca02bc",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "501177645405bb815fc7b88d0ff6f94278ada989e7f19ba695c3aec412bd8ac9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "429b59588e7e660814ba905f2db4d043da3c5b2b7ca2c3c5392ab3aa8926eb86",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "950162e10e4f95269cabc8c357773863872cdaca77cf1e0fd39fb84ea2da073a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "d42fd62a689123006ca7bc8aee1c13702f16b50829998ab9b258f8f4d6481c4c",
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
        sha256 = "1745747b049ee409b2f6e348bad7cc5863146da4a202c7f655baa4a520827f2d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "bab92f3374d2c2b5d16aeb9a4e5baf55b8641e821799338aea8a52247ec591fc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "b8f64547c1f049cfdaad1f2cb294edef47237babc2232470aba5507693fcb060",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "ffe9d2bf5224486101bd062879373bf9b631a4deb4c1d94939a6ff9b81d3ec1c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "87e80e6cf53c0127212ef72f8fdb898e50039f37915e9ae490c91a470df911e0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "da93e29e8434fde14328338e79bdeea7ccfb4f1cf665d81259df148277ed751a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "869f56595260924487b0b50da799706aad797e9da8bef029e53c00f38ac73020",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "e7311674d31c15b2c516700cc57df9df378224f8359ff7589f8555d37e5b9041",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "036d9c6266513be1e66a529369b7403a61a458237807591b75dfb1222b9042e1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "bbe35848095208914cd557ecb75f4286b59ecd7ade45313a8c3edd3716e36f8e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "036275dd6d98fb65c14296606433baf1c3956690db6a91947729a1c8e88e0708",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "5a5846003e825a0c67dcaf482ed43b25bfaa8f8fa31270396551455e4ad96471",
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
        sha256 = "af3a20adad47e1eef4e7fae299f2d1785434ed1e71b89244f27c9e21f1b424c0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "b0206aae8adf40c01fb482265ea98a23530f284c573ce971aab8ecb96720160e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "97df467389b9b9dcbf82b1ddd5a726e35646c2ee0617c88ce75e3352ec45feb9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "bdd6e2a3b59f66fea65024dfacafca6a075fcef38b2ac832e4860572d39af122",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "3ead31530195c133ca583161ce18c8456d891903816e1f90a90952d43fc3969c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "fc95a78d4878bf9a3b1dcf80cbb86519a78e459cc5e22f68831e85ef04afeabb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "401137f7bf53bee74fd496ad47bae7c448fa68ae4021021397bc4c9140ed5d1e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "8bfda0bb949e5f3a23b7e8b1cda66b60188f1f9bdb638ac9e2379d102dfda28f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxathena.zip",
        sha256 = "6c87b78c244f6b8599fc2bf9daa0ff35ba8a6279da9792cb1f2382d83f62965e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "a36270d8b505d7dc917393c926e0d511617a5998274ae2efb29816762b6b9224",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "27b795a048b70052f0309473915fe77beba27ed2a12edcca32d117a1b2caa84d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-2/apriltag-cpp-2025.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "79583f4553e19c0f7d4eeb5acae445ede660b14de42fceb595d5a7fd45fd5d46",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-headers.zip",
        sha256 = "79d115317ef2c5310baf96bdf4b6b64830b471e01d4377e9abbb27c17d639488",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-sources.zip",
        sha256 = "15b05cbedba7f77185acd37cc3ce6192a214720ff8953d5c87d7d61e3025d248",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "426e8d38336f538f3afa500655ed9d6ac8b5b3a058fdc78b7703ac17826e4607",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "d9217ed06cf7f0bbecadb9ebc3c61bf31a4d188acd0fda289bcff4a25ad7688d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "decc35831bc63e223bfd3a5ffc5a282e5442d6708e0701e35c68fa3c8346690d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "f222f0e91738eb80a95bb11901765ae0df070e121987f9f71c30ffbb14c268aa",
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
        sha256 = "d142ecc3b06dca3232e8ba740789250e6ff6cbb4b2b284c5809b83000bbf8ee4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "3e9d717a435eba05de89b10952e6d951260b6f9b26d17f2e78b300c8806d43ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "b65f22eddecd3e734e65398d1efa8d01388a0add63cfac63cb233c06d80a8c3c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "63e29c1be46e00549c692ac2a3ddecafed250e80452facaf4a003afeae3f2de4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "23033097bec736ae016d01b4318fbad6c9e27be182dfa289d5af741c80a97048",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "4d682e4357d9427e2ed998a051292bff2e2daf39b72bfd393247ed5917e38ff8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "4506290de459a0ee8071ec366cb29b246cc8b12811049f7fad8abe24d3d0b9c1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "51e2de65804dd265c76e98df5b33ca481b36a712e55521f09cddf636088d691d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "50a3aac6038f5ea9f9b3f11bede908b9a26aa96a3251a983b657590e0fc00dc3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "b121861b190a2acb0f1f030be2b11d56a91563dce9b327e3f262b62155ffaff0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "4a68ed74ba84531e27279e84d991540f6727196cddc744ec41d5637d29d379cd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "99678c89a1319c9bfaa898c809815586e77dec1bb85a7f67cf37ca6e81a8d0ac",
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
        sha256 = "5266ae8ec61b580b9369f5f8769490d2c86450cd74f8001ca3ae94772b0f5c45",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "5ae6fcc0530e1552317625e8a52038d9ec071a3dcf47af590b9c1e9a4c89bf29",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "4759adf416708cd2ac7b3acfed9e080f16412f646836fb87ef5623fe992a0015",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "1be404dc95aa4d4b4a2dd69394f63e9c53adcc889c225b02ac7f5998276eed4a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "0558c2debfc5b2f0ed6de1bae472dcc30bae8c86a6172339e065b8d2a3a0383b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "14b3ca2483c60d0589ce7d45e9cf37f654223d3f11cdd44dc7b7a82aff706532",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "e35ee27ff907a69fee5eab3c475fe56ba9cb87a85cef87c6fbccd6ab23edfc57",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "b512a4d11642298b41c7b7cfa31e96fd80ba2a8d4d579108ad3864d36f75b77b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxathena.zip",
        sha256 = "54b62071630179f4556ef21d79678a662477ca0aed42956af0179526b562a78b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "5a7ddd962860d5407c4c9e7ffcde293d01cc6a1a5493a6e95cb4aba7bc431194",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "7a46f4fa9d3758bc357d28b796e70117c4c5cf2c85a1603d3b58af3a9a1f78bb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-2/hal-cpp-2025.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "ce7c21eb1a8cc7756ecc9207bbb8ac8b57b3fa8fecbc36a9f62adc0140d71f1a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-headers.zip",
        sha256 = "0bbbefefd9d72314d3a8efdcd4a2c5861ba82aa52d6d10504bb4792e0135dcec",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-sources.zip",
        sha256 = "5fd3b32a2e9e62b2b5c265021295882644d02320c4067a693206bd66fe095e5f",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "6ad4eaa61f5ea1f13f699b954838c98f924ba4ccffea18b868fe6cae7da470e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "d0580d9d4554186d46f0df51ae751847484c3812040c35b91a7ff052b3909fe1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "c1dfa35ba606ec4ae89cd65033bbecbce884c2977f4f64836fb3fa90850b4452",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "2859e70e81ecd8a98d90d2ad14bba2a56b2830c137823f5d778aa74e2d6f6d7a",
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
        sha256 = "b748ac4200cb2c22ceef87bde7bf280706ab9d9b2070bbc5e4fc006723f3d57e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "7a665ab527839005afba8be03887fdeeb2996c6e4943d0d9a3cea80eedcfee05",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "28e9f969b2887018d41f275935be5c366cb9a79fbc7b0fa83e407e69351e6c13",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "bef13d9a6597642f1d9ee4f52511decbe9b3d5f76a95a1bb1a1f0ba0572aa18b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "9238b1da7061724a0aaa75a702c8228e21e2e1d198154b5600d655c5bdc34060",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "182c6e3f1355d6aca9ecd050f3f0763d14f4e4b514e8981219e6987d79264c09",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "cc5e3749c629ca83bd21984f08868815b3e0071981c92959f12f8593c83c8ea7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "8a2a1b1ccf878228899b37213e8c1c43e9664ecd6b006884ae3358f6bd19b67a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "53c13a72bccc1fb556c817d9a80317b61ae2e0349e3525d4a0afcfb1a9ec6330",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "65abcc0a93557285ebd0c2dfd211c2c14b9d8c352e312d4d1dbbf2dbbf7b9a40",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "00b61b99a34e8e21beae631a2ac01bd5198546189ee4507d99ca075b3a989228",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "ce6de5713b63a17e3857b1400a39dff67d3e725e3d88609aff8ac4d2ffb95a50",
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
        sha256 = "5b8fe4bd5c231206712dde759038516ad0a70521889b3a9bb42670c6db8fe5bf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "7ebbcc2536d51a3d912f512529c57f470c2737df70ca73239b6ed54baa1613a5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "f1615eb7d7cf4b8558861dbae02c403c7b15ea47aee4e54879910a90b3560a30",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "8c259a1f98a88076ef947683f2056c34cbf8450a288d3edd52942701c0b7757b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "eba1a380a9a2f4ded3f8e0242bc1c094acb3950947aaf58850c410d202de04f8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "a037c06a7c6e158877c1f351c42e4fad2741e9e0b3c12778a651a1e92a2091ba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "0f99de230a342dbbc746e68c0c1e86ef1b94bb10a3302102c661d335f29798d3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "7dcadf6f5f1150c8c4a0609e47f3b4936d3b9a62491c4c85aff43c16859061f2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxathena.zip",
        sha256 = "8b0ffffcaab5557380c06f1921a24697cbcdfcd744fc1f06ba112c3898d144c9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "0d6fa58faef92d11e375371827626161e2a4dedb663f1f797affc409712fbf5b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "396fd84deabdc7908b92b4686d340f16c52fa2f21a91467cf9d92ba0dbc01462",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-2/ntcore-cpp-2025.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "56ee6b5909b63e94e0fd8ec0a907cf66c814b158320d9b8e90479e30274ede59",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-headers.zip",
        sha256 = "b1000829c172de263d0496e30473a3b2d24062535c9be0c6d6e123f86101c2ef",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-sources.zip",
        sha256 = "22bf2369b47d7ec1b2b4f0aa795130d879e97c0be93c4c521d155bb59ac91fb9",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "6a0d47bd6cd556f834e5662594ba43574f0c0aff0329b31d13184d30f604da27",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "c8d19904b43390a9865564b431c32cb4c246304b1a680905ab3496dc8f8c0d73",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "c524bc2a9a17396b116838254e55449de6d591ebb797632b7923b8ac89576fc4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "507092faad723383018b3ecbc2f95f37ed2ed94500f71d48dd0263b6eb7aacb3",
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
        sha256 = "da2a8e975a87ac3ed824643ba9492d21fe34255846c0aac9575f5286fa8e82f3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "9b03b5946580f78a655f8d927f8b58eaa22efe515a7159850745e9438030b67d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "da71451d5dcfc30f104a4a9cbe91c93b6d5956595fec3f65f6697e979a6e7d04",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "00e679def4430c2eacbc9f000e2f59400ef911cc981788208c83bfa49e777701",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "7a852b9fbfbaf7af1457209a6d36d121cebb1a7596245c7721022bd6ad25c56e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "86e18ed77868fc05911e9a811e81359e741d38352e99c983d13b605622c7b2d4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "070c5b187433913048857d6d63114a6e1eaa69519ffad98119a48a48ff9a9f15",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "f3570938a2b8cb4260116cda13dcc435200948a6ac7a4ef0828b99b94f0bc505",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "42cb20d44dbd67035e9b1c319b8164bf28c11214dfb265b02891943875c6587a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "7f86c541670490f20c177686b997d55f34ae3eb1eebbc30e517c8632ca5e2253",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "3beb739b356d4b6ece01bae55830d9b88ad77854cad05d5ccd163e98e71b5bcc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "228cf23641381db26ace11c100137c74d1042cedf50930c415829fa97fe48338",
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
        sha256 = "3a5bbe669d3875681c9b680f809805a2027f05fe70ceef1e101851b91339c3c7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "0d7eddf4916d699b4a9643a96f00ac5d26d61a60c710c07904bb1a4b611253ef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "2891100ce3491909aff882fb57d5697f4b1d555f8371e4ec8e1a7a86a9f872d6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "8954d02f6cee7de43d827f66255dca224429bde4c9ffc15b5bed72e4556813ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "27eb138373e2e85708ff4ccf2c9525baf7a5b0796b0e784abc9bd2d13da44e7b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "f2fd87b48f7540d1f8eb984d5a1da2627674372c1732436608711cd402020754",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "9bf18b091db9de6e5830b3e9390dd1ea95c9b12b82570c888f0d43e6dd2797bf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "99da51c0f159e0a683e29d78c05daddcf9850a0bde9ef3c7af7b091daf306bc3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxathena.zip",
        sha256 = "42e94a46b869d88f262d457ac2d5ccab018c93bf1bd8831b8ecdd14007810f5e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "e25c558ef5c1d34c070e59b8af6067220b747bd14178622be60055457432e54e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "db0d2d8c3754b0b0c2fa5ff9dddd9f4f0f905e633827bfeb47bbd7489eceb59d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-2/cscore-cpp-2025.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "52d370443e0da8010e6ee31f446e362bba80b255be389b3368c1b4ad9a9819e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-headers.zip",
        sha256 = "e2600655e18aa42cd656b6c7c71874097946c0fc3eea775e0b9fc0b5a328abdf",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-sources.zip",
        sha256 = "2d7d2df8c3485f83968e65ab4b83ca47cb068025040b5fff73e72e74671e42ed",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "0ca7c351c28e90820d970c6ab001817039789256b5732d46378d7932c0844bbd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "eb32117c62b4ab5bd1da46f66e5888bc6894021a52c9ea6d309ab6bf24ece545",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "56e38a67ce9910d23c091765aa0ea584ff7fbf6e3989e992248eb407d9caf70a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "da07f88b8ad788945e6d117990e8fe733cc3c5965a5aadcb253301d68099ac99",
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
        sha256 = "928feeaf1c189bb091d1ff407902a8bb1fc4c941dc18daba19a5f3d65236c665",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "f1d8252410b06b867672c6070d31bb21ee713967047502422848621854da5c2a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "912185f3575d7e7a61cdb6fadbaa89540ba43fdf3e1554bb489ba0e02b5fcb2f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "b9835c4e39578144a0fb81d6e2394da58ec3a9945348901ad2da8fa13ef67bd5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "77310db6fd950631531ad6940f86e21a6da5daac343bf96f7ac2d44af857c7f4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "b49f777607887c2d4c3f1c04ed9ca16ba6b007168bc48f4ae02484bf6b3b6eec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "5cce94c295f926457c97e3458b53900541ba35de1282121150c83a9648a326ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "bfc63386afb39fc09e1f08c2410f9b93a097a7b33621b0f033f492d54bed986f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "9a2895e28e328a71d898106d0f42f4c2064e0e52bbe94065f7e53244b9e63ac2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "3ff05cd9147498305094e3c8dd7b2146864f706aad3ca147b0b5523040cc936a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "04f48b29be95849f1f3e7d055dc46e824586c93f5a7cbae23e8dfdc0cb50e06d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "a9a1dae46f761f943b4df1463988203fc3794cb254b4dae70682523a6f3a15bf",
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
        sha256 = "67b2f4a3c3975e2a94511cfeafa5f1b56908877d2188d8993984269205fd60e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "69fe2aefef769271168b2a5a9cacc49e5730b6363d0d603606195bc2ed74e28a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "149baca3b6582497b68d5bbc872ad5988ff5776230c7e16e807e5218d0fe8813",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "c7050f0cbe1140976e00bcf987d242d363dc64568c19304fc2009d6890aa2f98",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "71aaa0178399234684bdaa91117076eb7f0141d4658e18270368748ad3ac344b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "3dfdc4d2e90e621a606bfbc822c692c3501e25de8e57178698651c7187098d14",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "425c9c954c7a13d6aac951a4695711f0b89ec13c9fbcce98b330548381236a3c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "0c734ffbea16b3cc38721462a3a0f337ab074522f6fee95821d4764f3ac4c602",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxathena.zip",
        sha256 = "4de328605a7e0ae29d14a2af04186b0cc52293090635f9ee7ba11cbcca5b3cff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "b1fee72108f120550408f668c30ec415c7be418fbadd442a2ada67950663a321",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "07e19d3c754599d69bc15e2b18373b8ae53682ea3b54ba8b69233bc4a07bb17f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-2/cameraserver-cpp-2025.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "71ea9bea5b627e71ebee3baba46c8f0050f1f41f1d4b57fad8b10a220ef1230d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-headers.zip",
        sha256 = "0543d4615a5e7c8e534fc441d76174c62dbc482c29937354c7b7752bbc94ba16",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-sources.zip",
        sha256 = "0b57739725a8db46ed2eabb5a9d94dd382cc0aee1050bcc763467bdf13ff1589",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "29b2e90011262358c4de243a0ad98e835e60e731d6413243bfb40c50333151f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "d78dd91582c650f270524711b88118e72a91f772a6cfbd9f48d995dca8945f49",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "efeaa92be3a3e639879233e6b720f202e7d3f9dd0c3d7832586d46f024a601cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "350277a56b13f9a488d3fc13f2d9e09b175695410f79815577b80a50422f75c1",
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
        sha256 = "7852e9847cb32fd692f87491e5eb245a28f8d204e82fd112a7ba02f1d39c468e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "6a6220669fe5a645e095a284125a9774cdf9bbf01ee2624f6358665e1cbebb3f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "0327edbb949be0294db046cdb76972168fe3217c3ad2eaf024b19a2ae87df88a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "e72317b2001b3ce46ba68a1f15582bbeb50463f42f6856027e666a8f7358f8c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "ab7c1c4a823769f9ab7ede6bb5a09481c8116275e3dc5971fcefcec7c16ce1e6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "61a94d6fdd552232aa3e1385cd8f7d60b0a39cd2240eb220ba46ff3550d2706e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "e26c6401ef6b58057e9fd4f6a1859ac0af49aff259c3c46975d1c6a2b43e0bfe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "99f2367c2f2fe9dd0502070c8dab64f51df16b6e995f843a5c26730feba3f520",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "025a1b7697a5631925b790dd8ab51683e46c30b5e9bd6cc2a159f41e9d7a489c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "23e8ff17c45468ee9f8a3b3f72e8be96ffc8d12959299bf5dba3d24ed956f65c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "f96fac75ba0424212f0980643dc0226c3971db0b72255504242116e40fd19e27",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "1bbcb967d5d22197c76178e07484f894e17bcbba48feeb7274652f36b703b99e",
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
        sha256 = "e3ded33075ab7b16b856435a65dd2db2f8dbf9f701540de621153e24f12288d4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "d372f7a57a9af34fe4e36916ec4078521dafcd44c29c07e5a419dd73ebcac0a0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "85cea350fa8ee27b71cb3e66736bd8388e81e3fcf46a488601d111ce28e3ee2f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "aabf1d1898cea33062b6890371d8dcb09ad507d4b32701aefda5641869fd8b23",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "06f98433db8dfa39eb8e5de2c0e45a1ed0bd2c51c5240127280cecfa481ca6d9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "3a6e94e8d42fb35618e99f3ff7313e41cafe3e3fbd7c3898d071783cbab4f105",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "6166910e90a1b67f1340b57b0426b88de7d5e9df3a8a0fc4d4dfdeb36e42e4e5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "ddcbd136dd0e09a48e653639c05d701dae5a24688f977136b134c920f64874ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxathena.zip",
        sha256 = "4ddb9900640f0254c6e78be95e8a2a7540118871ec195353d0662c6dd9bf9c1e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "d7e41f0379b757aec53d24662897573b3b74a7409dd45a49c4abacbb1985fd9f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "6b885e98f7d5b5a6a93509a7b5055c4792bb7a4d2d9c23c24d4dd6a41e5435ea",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-2/wpilibc-cpp-2025.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "e3d275b4681d6f67eaae22fce445ac80f89807e879284ad260720c841ace1e95",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-headers.zip",
        sha256 = "2593d93cae2296d4e43384578270c7273a078f70aa84ea7493e99548db242095",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-sources.zip",
        sha256 = "c7525cf1e180d99a7c19efda84683d012c0efe49e4a91f36e59f2af65c755e20",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "154b719a1fa14ce8da899d1b0bd4905585a9215a807c7eb2505e2ef6f1834be1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "d8ceb6bb9ac3c30a852ee1fe98b9b8e562a265a62469e522950604d368a22ae2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "e94a4a498b1fc47a40ea3fdd8a41090063f62cecdc6070a1dee2c10fdd9cce7b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "b6921f88cca948fa2ff04881b7289e4d737b798c34d491f36c0c065351e054a0",
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
        sha256 = "50ec356577bf1e9691144fa9161ef53f35667fe22c77c2d20c49d4bd7b6c8c35",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "5071d5c0892b89d6405218e695b71aa0ebc6ed0bd7d6236512126295536f4c64",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "804d6bbdd4b7f71490f78174b0e0c9dea6b9d9a724768635d08e93c398a0a66e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "bf37b3813ff200e14d824053a925f79955cd0c09637c95e589515124f011ced3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "61fe058d0dbdf119a0f730dc489a8332ca791189fbc50b42320fb77b1024a5e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "9ea3f92c7c0bd45ce54555353fb3b04222f919fa29578390dca3bc3d666a3994",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "7737d4382076638d193a4c07c1c02d2a8fb45a08669ecad332d0bacdff3066a5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "7b93bb933d7d9bc11f7aa43da43f7cdae1ef352c282a078ab298b4a423b0927a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "d5cd56e7b7461dfe7fdd76de779966078f6863106f658258ff0ecf9ab6e61694",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "5368cef0ed296b13139504aea5b57c3558e0a6309a48eece7b8c6257ef39191d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "a0111695baeb6e7fe97342feecae26248587762b474a690b243145666c4129e5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "92aa7cdd40de8593fa4a1fb3e385b622e792e93a052e8fa37bfba7e352a1be72",
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
        sha256 = "3ff755366cb8428952b922eda7d628e6f15791e96c379ac05ae07602d90de7a2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "d64c22f6eb8347c851be4dae9a29f5291977e5e6aaf31f8f80713c47da5e26ce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "072520a5664e75608f89f39512636e55dc0a34bd0d8b527d788c1fb29cfd6d67",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "eb5f8c39f94dd1dea668de9a36c88d9253d3f237e33468db8114173d9151e5b7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "95f277181200f516bac0e73e1d1aedf4e6d0080621c82f2882bfacddfa17b511",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "02614e379090f8b4dafe8c73895744814ce343d9014b175c2410cd7887021deb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "ff6e3ea61e9f66dc2af6c12f5eab86f303f2cae9a275336e8e331a64d5c86ded",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "33090d75b1b365ad3b4f4d8f925676a26712353c2454bb354af68d9956f51174",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxathena.zip",
        sha256 = "ab6fdd95c9c339f389d614acac33c308f39ee4e1dcee6911edb8fd68f284a717",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "79fda1b09f262c7db955c51f6baf9df38d385260399a891308c111bd871fd164",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "05342c2fb2cb8cca9d4895327ea4932179fb28b41bfdad084aa96df130ecbda5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-2/wpilibNewCommands-cpp-2025.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "0e73ab9fb6e40bca21904180d5d54b311d8aa79304ef42695d3ace2157f5317e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-sources.zip",
        sha256 = "2687c584654abbee45b74b214bda025d82bb1e016a17b722213d22cff070380e",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "08ebb43761a6731dffa2b5aed25a57022782ba203f7cb755284827c860392975",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "40ae8feb2af66d70f68697a91e0326a0e821c7e59caceb210441b66675ab4edf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "2ca7f730df37a05e380baad55e95e32b8b8b20d38f6821a6a15453242731bda3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "8d6c8e5d1db03ec72def522dd53df3760b0e5099de3709f5771c4021f49f760b",
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
        sha256 = "c47e631355990b68e307b536611d009142038684357906f5707ad4f691a56712",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "bf08392be194b725286a9594e66a17b30cb1f44220c7592c4eb79c6effcf0474",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "b16a15fadfea33794d5242b283787e984aabeb9d13b441f4f69044d08bfd1303",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "c3e22ea4914b38d87e4827f22e917e1a366a24aaf1bd489b50498c41bb1a559a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "fcc678d2bd8b1d655101051ab5da96fff7cc4c588f63a7615027e6f26f060dd4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "76831d828920a41e241ea94f1428f593c7994cfe3ddc792211196170cddfd973",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "c97a136c82d2f109d1edae179197a8d0b460b09135fef7e827d22b3a80f6d46b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "41966835c98e5c7011e561613b15671b00134b6fef0ee9781bac26dfa0a4587c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "88a198692f794d07abaeabdd153a0c98d9d9fdffb097be327f1c08ce508b56f4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "acafa9c6e853969c34cc64c4e6985088b4d4cc845f83d462572a99b80163d129",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "b874488ac03977de27106fe72a9235020761beaeeb1ffea47e09bbf3c599dc11",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "dfc0ff84fbae559ffad2760051a3938357814a5f728af1e07ce5297fda0ddca9",
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
        sha256 = "d688e071c6b77ad3579d742774f653eadbda5b9589672e941393a9faa9b19eae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "6b49d3d6dbb0b3d14f6a85861e7355d9d67c0f7df81ac910160f71b2ca6f2e45",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "14ccc633071c8d206b700fc8b3b7e652edc43e62c87b804967a8fed50646d16d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "f1fca6069f06220bf994fe214e5ca31d1ebd7cd5a460948f09bba20801e165b0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "8fafff81c26fb24115332687ad8d2675b9ba4b7f177d72bdd0816ac0375854bd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "ed35cc0984408ec488235ec32921be7c8e3c47c0db9ce3aa0f947a710ac85c36",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "333d6db533362f9e7a175031db2b14321e397cf65a0de31fde68d349a8fd9da2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-2/halsim_ds_socket-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "032ca965f532e98fed0bad5bcf778f980888119dc5fe792b61067a9fa8bb9dfa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-sources.zip",
        sha256 = "76341d118ae71ddf368e2e1fe68eacad30857e0f73c8546bf98ea77f8153d775",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "55204b2c18e7a07a407d5b37255e6d0ce1b3b83179ba3cdd7ed50e4c4503119e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "2e10fdb18cd12a6d5cdf07e30343049b79032604047633e3a1349871c1602abb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "9bcb2bda29026e3c68cef0584ea2ca4fd5cfb786c003509894239f3fd2a4b19a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "974a846855fd88971625dc0a69d64758affcdd88dadd4aacea9ce0a201ac84be",
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
        sha256 = "9af4ab1099e10db070d176b71db6297c4643fe0102e15d09f50637f4e6e0d83e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "12a7b10fbfd9bba8b45be18d8e135baf46f950260b483898731cc0fe1299e549",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "8be65972655f3a3a794f3521a6fbd2e7ccb3cbadc3d6a6ba875511b0d1fb6d8c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "34d3262ff52bac2010502f35b885550f8d6a37aaf162f381ee28b76a8ba9dba3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "c88d4201349c8d6060472d03b58ebd71920d31ec5f7fec8ee0fd8557fb737ca0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "7c8d920306404d504568a1fb629e9f84dc3c551180a28cc8a2779fe15da3c065",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "fa9e2895126c37b964398ddd02ab41556c60543acf8f43f738ed389439afa011",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "109b7fa3a98554b14c56a15e1218544860e9a8275e22162ffc8bbb0235447809",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "2cb9004c1aea07d674dd0e8a2a6f7788fa95a45e0eda4cc29e3998cd7da0e3c2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "9cda709acfe17b89084b3a2c2e6138377b77f493adeb675824df423575150814",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "0c57dbff76eb2b21b39125b79f4a0df064e687f2197dd4894288621704517d40",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "88a5234c3b1943fe9e283f8140573d7fba7749583f3e1fcbcf361581f2640cd3",
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
        sha256 = "843d8b6598368a9f4982d1287f1c29f5ab9f3ea6c5c4bff3333d2256d7267d71",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "3483228537d24bd8a8cc2ac18e85d0d61f30ab30c0efce1836b28a98c2567d76",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "379cd4f2ae49e57f66e4db25dfd1225f04cb32ce15d736eebd1a02abe0d0c715",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "752edcde45d28a54207435111b6f6253093677a06c9e16661b116eb4fc136a39",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "c7ab606a6d836605e1c03c76d0c600a474117a7ffe15923303f889255238ab82",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "88f891a414046917f2a2c9d68fb0de748972dfdbda8342cedc39effd294a5486",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "d30115db6204b14504a75386527c1117df4cf7e8fc9eaa43a6898d38ce6e5750",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-2/halsim_gui-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "a26d5433b420f870318d41e58a1f6164c7d234ece1afb12372cbc242fa46d939",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-sources.zip",
        sha256 = "a436de791190c230084436d457e7b85ffd5973324c77702e0c17b87f245f161c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "eb5905617eefee907beaae6af528b8226c6e56d2d72956a39ef32c01893c862d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "48faf23d1568e5dac32185795c70e6cf04110c0649549933e2df3b6473880b50",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "0ea1c788fe6921d3fe6485550d1742e87a3dd9415ab7d0394386425bb46286ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "259391b5c6c2b0e4210fd5abc980c1575d224ee0f58f73b72aca501b26dade42",
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
        sha256 = "e3ea7b2563ff46b2029d7ee6abab2e78412927bed2ecb1154d8d88c43ada8290",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "49e09b82d9d6daa2f679c48d54582406f4058e7a531ab1d5e936639ac29e6b5f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "4bc034cfa1073cac264c705eb820304e9893c9b48cd9e18dce47e1010fe1bdff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "7c732f2407cf161005a2280e51043d1aabccea00ecf82f232b03c15a89fdb8c1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "16ae64d21f19a73e5fe393d9a6c10ad46751eecb1539f1a8f8ce8e7543cff6f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "869e3cbb521e2e98fb0e1f1f466425d9d7b2433838a4193cbb730988d4a8d40d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "1154c6ac8aee2a2f2597c168085ab4eb0d67c3aa954ffec496437c30083b1753",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "95c92401c4e6dbe4998080cd1621d67a0107740207102fd1a41865a9508193a3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "5188d2e2ba2ef09356e7f7d609f775c2758ca6a11f788477eaa37352ebc2ec1f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "9e6420fdc06e50e59cf4ed0a24cd94afcfcff186d1f9f8ad147ff286185a0e7d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "019c38e016fcc05cb3b4ed98bf1f27caed25c1600d95d6a70df48f4402ec49a0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "8f9703749ffb80fd3c5b8c0adc615693703364bb7100e186ead038adf30677ec",
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
        sha256 = "15e0bea803dca94ad5bb969fc805802bcb7de09003c6c6d700b5072e87ea5d39",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "4332b6f695c9cff06cc4f7e434a01b88ad57045b058709a35e2fcfc8e364e89d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "5cf37a056a5d451331061a1a56bdf0e9305e9510626c9efb617c800480ac5553",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "0d570914da9fe3aaa7a92033b189d3fb1b814bc0554749c1bddf9d9523c560d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "9cebe54396e203035a65395fc244bdbcd495dfdda1cb4558e63614b459e19168",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "3e18c9bec5a022b596c7192c47a7f004ff4c015c361e7efd2d63449f2a40076b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "72199904e104d398e457bea6b1718bacf7a562e5a40128e6a9d6ca09ba912c85",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-2/halsim_ws_client-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "c7e33ae1b37b8b16e9de74a7ddaa8722a6b203779c8e18b3a71a692dfa257a3f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-sources.zip",
        sha256 = "c4617bfcdc8fb8a7ab3abf49761ae84b83f43ca38c6350bae3362cba6d5d10b0",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "157951367ffaaebf88c48e5ecf4b2ec816eedc01e5c118711658c0f90c1c6943",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "4f64319c7813bbaf2d7c00f74fabb876d9be8fef4f88711d402070d29d59ee39",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "baa08b2fbae3d4c6294d6a760d4950a227737c27b1a45e4cb3ff2599056d63a2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "6ebc12eda9c706eb2499e862908e8ce2eaec53e3e9393c80977527033873ef24",
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
        sha256 = "4ec6d6584f8946abe09fa778c5bc413e9a09aff0d1f8ce99326f86ea5bc9fba4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "4b5c8ef4dd49e2ca3e569957071ed45869178adb01f49799c215d28f94c4e1e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-linuxarm32static.zip",
        sha256 = "95d7330bc2997d1b1aa2a5386bc2a1e196875263d7fc1c7a77a389c467e63d30",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-linuxarm64static.zip",
        sha256 = "173d37781a98e8b18cbfa6bfeeafeb4073c608b18dc8a22fab4bf98481230945",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "8380c932f9be5dd440f3076c70d4d190d16b013c76e09d54d4c3bd6d010f0847",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "22c57430407f83008b97ffd3bb6e879b71490752eb6d238a9b8a9fa2e28fa44f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "dddaab0883008e28f8a02d7fb7737dd9b0aef4d47f72c2a3f8e40f3d24af6b64",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-windowsarm64static.zip",
        sha256 = "e3ea9fb5bd61762b96567da2a71108f6843ff80748786443528f94c0909c5121",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "a01989fa716ee72b9098cf2075aa3e73a898c1bed5e4a42119a59b6c921e6357",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "1e2b246919fd0c2dca6f78e16612dd61bfdc3b0af416f64be76d6d6cb0188d85",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "2ff23d1587ef8787ff564d90f68d06c7dc70914163fcb095b4aaa309b9ab4445",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "040e58a236f23a35f66655aaf0d3c709db1bd20917a9cbba9727948d5c6d782e",
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
        sha256 = "94c9b9699ff1fb453d73efc5486dc7be62e5bbde59d14b2fd81e25b8350e30dc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "5e6b3bd256b8e0c7b3b45ce075e7db9dc4e7547716f45be11e5f501e57acd6f6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "a672843101789dc8198523d2a3c335fafd80470ee6d0690a0b46013b959ac7e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "b8975067c7638e443829c8792b0d2b13b60a1578f994cc510a99a584c5552d5f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "aaa86c66a2ce7b6befef496821786022423200518fcbee280dfd82e1919abff3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "eb17cc9b942785b95f75ab0f5010a94caab7dddb131adfd3a314f08e00ad303e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "4b4616c7727fc6cc59b3dfafcaa359bdb685feb19029c8c71c986266689b58f8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-2/halsim_ws_server-2025.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "bae40c6267a7dcc99b324755772b60a79206dcba9ea4aedce68795cdf17d4088",
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
        sha256 = "3545bb6884d71b21170dcb7f0e52c5512433bc222281f58c0570ea2460c8fc94",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1-beta-2/PathWeaver-2025.1.1-beta-2-linuxarm64.jar",
        sha256 = "ca4e40f7cde08beef6c5fa5954aa937814055e4e30d9b776f9efe79b3830363b",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1-beta-2/PathWeaver-2025.1.1-beta-2-linuxx64.jar",
        sha256 = "f43e5894b8d985be7559221bcab7b0cbaec69306fef09d3acf8975c240fa276a",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1-beta-2/PathWeaver-2025.1.1-beta-2-macx64.jar",
        sha256 = "b9e067178ba3003b13c4979050c8f3bf5d59c104037f2010238bb8fb0467aaa8",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1-beta-2/PathWeaver-2025.1.1-beta-2-winx64.jar",
        sha256 = "141e42d1f1fb5b5d7e7fdf3b664662cef103ce9fb734ac3c71a5fabcaea54d7e",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2025.1.1-beta-2/RobotBuilder-2025.1.1-beta-2.jar",
        sha256 = "ce5ee504bd42b2a9714ca6f728cb11e283b5c0612c679d6636cadd082c55f0f4",
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
        sha256 = "6eabefe831e2f9d7c331cec989c525df714ed86308aff8cd069ecfe74a14f745",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-2/Glass-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "9c49bdd9434469bcc29d22185a83147720558a5bbaaf02f8956d657b656b9195",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-2/Glass-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "77d20e47f394389f4e15316bd7e9b041c8471ab765ce8ab34b1a05af359ce967",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-2/Glass-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "02f35a6b2b221ec4acbc4f34624acd402be9bd35a9b1f888f010be94f5bab281",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-2/Glass-2025.1.1-beta-2-windowsx86-64.zip",
        sha256 = "7cbe9bd04ae65cdc857aff97e96a9dceaf057f2a96626cbf4a54996f94ebc10b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-2/Glass-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "33aa8907316fb98ca98e4d8c1ffb9db3678f3a6aebc908e0a19e503516fb95f4",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-2/OutlineViewer-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "ed5bd1a590efecda81ba021138d439506cc1c4700fc9e2dccdf8a2199502ea1f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-2/OutlineViewer-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "47d9dca7c1235cb550dc37db840a08e723a48e0d0342ca4848fdaa7ee10f0b33",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-2/OutlineViewer-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "fdd9b22328e34221f916d5f1b00c0991bbf32b767fe644c5fafede1092452f9f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-2/OutlineViewer-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "0df336b83c26f227c71e5ab621c8a19125306339a929488987ab5025361c0a0e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-2/OutlineViewer-2025.1.1-beta-2-windowsx86-64.zip",
        sha256 = "bc4a3942711c6dcaa18289a99da382eccdfe380d1b99006f4c26e91e080ecfbf",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-2/OutlineViewer-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "69117297d71409fdd5beb4b3ebf3d12f7b459316bd502a7166a77802fc57c954",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-2/roboRIOTeamNumberSetter-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "7371bf0e023568d792ea5168a377bffe451e7f72f8d977e14ba0749a065620a0",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-2/roboRIOTeamNumberSetter-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "2210edd2009134de23d1fa56b877f4e461f012e115601a60afebf71071abe138",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-2/roboRIOTeamNumberSetter-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "96d13b1ff91377fdf72d5cf3ba691eb1fbfab2f22afd86c61a61b5ea5e034141",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-2/roboRIOTeamNumberSetter-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "1d8fad7e283279edbb390146c6eb6027864895bc03d6c69901ec8af1793d3c2f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-2/roboRIOTeamNumberSetter-2025.1.1-beta-2-windowsx86-64.zip",
        sha256 = "a511555e94713b84508ea0c50cbde12353f1dae4ee423ef2a5b8a8573c21bf31",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-2/roboRIOTeamNumberSetter-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "80506c29b7e4ee669e0714d76b011d5372687ff24430a995fcbe152a04c48c86",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-2/DataLogTool-2025.1.1-beta-2-linuxarm32.zip",
        sha256 = "711eb3e97bc82cfb1c1c396bda0c1ac51d06b5a87f94371c353d6b64d70659e5",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-2/DataLogTool-2025.1.1-beta-2-linuxarm64.zip",
        sha256 = "304f297830db982929112bfd0583d6ac9ee1c6a8dd4190b32103a658cc0f111e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-2/DataLogTool-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "80308131bc09659f5ef1132185ed5610a4c863151a5888bff56ce00d759293dc",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-2/DataLogTool-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "d3ca6324b4fc59521a1dce8bce817fb47ea2c97b1c82e417c84eb125665e1571",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-2/DataLogTool-2025.1.1-beta-2-windowsx86-64.zip",
        sha256 = "76b8deb5cdf15e75a2c3d85cbb79ea048c65247bd9dda0bd01b0d03c49d957b5",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-2/DataLogTool-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "de9025a1984380108cf08479c2e55e9d255ecf75fb026084b3835fb9a85ca0ab",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.1.1-beta-2/SysId-2025.1.1-beta-2-linuxx86-64.zip",
        sha256 = "e582356245f9bd65d3cd0f3d49a588cea98f2a2082442670c8a3efbeb215a50c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.1.1-beta-2/SysId-2025.1.1-beta-2-osxuniversal.zip",
        sha256 = "121e5c49a6dd746adbf4480e227e7c41db27052e511ee0833ef242f5a3bc4a63",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.1.1-beta-2/SysId-2025.1.1-beta-2-windowsx86-64.zip",
        sha256 = "32064363596e0af7d49aa03290ad43d4fbefa695bbab596288cb28078b682103",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.1.1-beta-2/SysId-2025.1.1-beta-2-windowsarm64.zip",
        sha256 = "cc5971555d8b38d77be9ef474e10c80a91260258ac95e4f183537d44d725fdba",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
