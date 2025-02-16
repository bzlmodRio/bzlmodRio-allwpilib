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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-headers.zip",
        sha256 = "be5d6a57205f781d2126a79b831e6200c7eaef60d431248181e1bf10bf91d3f3",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-sources.zip",
        sha256 = "14df5c3d6e3c2c006c8a58bc137887d3f406be531ce498a874efc5e18771db00",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-linuxarm32.zip",
        sha256 = "113dbc2cc86a390cfa798cfd8c6bdc01356ba7b88edf9d93d9732974296d8653",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-linuxarm64.zip",
        sha256 = "e12d9a82dbc21f8fa282eeb9d4dfec1481b4df86121402ac3659c134ca19ca1b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-linuxx86-64.zip",
        sha256 = "d09265c9e4da0af599c431bf92c3492543640f75ddc94f1b05a908bdf2abf3de",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-osxuniversal.zip",
        sha256 = "fbca8a5513eaf25b3e3e5b861cf3b6fcdaaff0d571416bfe2ea0f3a3d47a0549",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-windowsx86-64.zip",
        sha256 = "0a6e5dcfea33076580c0af0a282cdb7a0f9fd9f3fe57176cbbf6f9f09206c969",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-windowsarm64.zip",
        sha256 = "6550c0ccf8139e2a194a101f1a5e34ed611f14cdf174192b2cbc50b678db04cf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-linuxarm32static.zip",
        sha256 = "7384fbdac936148ef4237ff82c44c2b6bbf9e8f750583466e602083fcfb75924",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-linuxarm64static.zip",
        sha256 = "35eb030d59b247c915bab1c43076e985ddb54bc7bca5a74b3d698eb2ab34d38d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-linuxx86-64static.zip",
        sha256 = "1f59d51afb0a2e4983766bcade518d46921709789c14234834b3344c7ae7908b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-osxuniversalstatic.zip",
        sha256 = "400f0ec9e46f2ff9cf3f714973361eceef189c46664efba1422e7dc7125e2c16",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-windowsx86-64static.zip",
        sha256 = "177a2a38e90770c5e3cad9e4f276d97d8145aa3a242e65705b09be61ef43750f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-windowsarm64static.zip",
        sha256 = "94f61498e836cbf1369536cae81fa56ab3fdbc2e310073d1689196481a2d9d06",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-linuxarm32debug.zip",
        sha256 = "01b4d987895323ac5d2614a46e59155478517458ac511c21309fd62d0b14e389",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-linuxarm64debug.zip",
        sha256 = "04861324212b1f2d7d783b669f4289c9fce020ef8bc96b41c3ff2d083ffb9514",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-linuxx86-64debug.zip",
        sha256 = "0b4134a40e345b1bc34a9820edda7b2d9e9b38db2e28d8882e438c10db08a649",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-osxuniversaldebug.zip",
        sha256 = "fd2d2c1a959c56c2186431bab2c96ca3e4f3c1034ac54ac9b11126a2af4a9934",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-windowsx86-64debug.zip",
        sha256 = "7ff269398966958891443d8f9bdf8c8bd6f0b40913f8685c8e2a07710a28bffa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-windowsarm64debug.zip",
        sha256 = "26158e6f30b6ce81ba0ee9f270446fce56fc6afac6e3c27fb194ab6dbef8ff99",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-linuxarm32staticdebug.zip",
        sha256 = "fc0d85b7957c847976755310a2c31f4e29c1f10907dffcaff37718bcf610e962",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-linuxarm64staticdebug.zip",
        sha256 = "5c833135568b36e39d674be9500fbac08ef8be07fb85b1bb9e75f907bc8ca042",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-linuxx86-64staticdebug.zip",
        sha256 = "a56654dfa3dadbc122243d8bf392e1bde3fd903ed1989a7caa57253b7a9492d8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-osxuniversalstaticdebug.zip",
        sha256 = "0d8be0c8cbe7a376be1423206bdb367919eb2c042269b940b67dc047ffcba4f4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-windowsx86-64staticdebug.zip",
        sha256 = "af2a78b8f233ec8762b658ccf72e054742ffeb52a37b0223e2bb365e56694c23",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-windowsarm64staticdebug.zip",
        sha256 = "e785024684f6edcccf94320ac7b4fa41735849ce02cfa55546909fbb6f1cf02d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-linuxathena.zip",
        sha256 = "44201344d3f2482a6ab1f6a0dc1edce48500514c3e5daf32afba0b61f3e66445",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-linuxathenastatic.zip",
        sha256 = "0f857256b6a057c41747882da00c33c8cc7422462b3728ccd9accb5dc6726122",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-linuxathenadebug.zip",
        sha256 = "57d3abf14648593b4d6903e390fbcb3e6e8cc562631cdf24055d3ebec4013d0a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.1/wpiutil-cpp-2025.3.1-linuxathenastaticdebug.zip",
        sha256 = "5d3dcc2ed4df167ce5c0321918ef26d73526c400ed6256fb203e589354dea9ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-headers.zip",
        sha256 = "3cb7027288f276bc08f98614dadc86a5fe6e02233041219b5a9cba0b7809ee45",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-sources.zip",
        sha256 = "5e22c25e62ff3ef87250c80ea56f61dce33e86411a2aa379d931a7266231438a",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-linuxarm32.zip",
        sha256 = "cec35081ef3167d4afb5ac2c17ec4c399ae70d33a12ab9391011dac805004086",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-linuxarm64.zip",
        sha256 = "f3acd1db7e1288707c22ffac7d4eaea75380e56e92f0f4b9d272451246cf44ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-linuxx86-64.zip",
        sha256 = "dd14e5b2086212c59b864f7c9e531c8a78476da5850816803910f88c17c0daf2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-osxuniversal.zip",
        sha256 = "a6138982ad62cac8f1a4eeee4134a755fd4baba21ba27934993f4547a9af2bd6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-windowsx86-64.zip",
        sha256 = "b15731c44a02220919e9bf90b7d305064e217a94fcc3b7f8fae0b7e1b4d37c44",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-windowsarm64.zip",
        sha256 = "e8f8d8d77ac5ef5f645f1f1615b10a92e26f8e90270883c30675e5ee65fe6073",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-linuxarm32static.zip",
        sha256 = "c8c04fa34d915643dda0b30e6ded07c8d8e18578c9f10c87c74632344ded98b2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-linuxarm64static.zip",
        sha256 = "f4969f4c65306e6a83fe1857563ce713e9afc47c103239b9a24950f4ebef302f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-linuxx86-64static.zip",
        sha256 = "377f1fb56cf86e8fe47ab9eea03b2fc0688d11a949b9a1df13e4943be346b9b6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-osxuniversalstatic.zip",
        sha256 = "0986b81e7d80866f5ff7fb7a887a42d43f2ab398ef4ab7b46bf29cc87c5bce46",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-windowsx86-64static.zip",
        sha256 = "197da27d5a98638f78df9443c6acfda6d0d273718b4f5d7f0ff9527227071a71",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-windowsarm64static.zip",
        sha256 = "05c3324d976d87ad0ac72afb8ae9f200d11a04571037267492cc38b2da56c7b2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-linuxarm32debug.zip",
        sha256 = "f5a29b4a9035ca4d8738038b0b2857a3698e8051725491744d248e8019e3c9d5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-linuxarm64debug.zip",
        sha256 = "ad981a6ec08d2e5376d49bc37144819fe15032780b24331cb0d86be805e1d4c2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-linuxx86-64debug.zip",
        sha256 = "5a09427afea13ce4ae7f3b2e3dfec7df52a31edbdb350dfc15de7a1e71a6b102",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-osxuniversaldebug.zip",
        sha256 = "baf821517139f7f74aa7f3a8f9ff3a761bc7fdd78f62eca1302d7a04a4b8e2f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-windowsx86-64debug.zip",
        sha256 = "01c41e2bcf84bd5abe874eca148765a3b1e199f6b07e7c939df6828742da6c25",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-windowsarm64debug.zip",
        sha256 = "4185cd46fcb2eba6bf136008f3ee95046b012016c6d2c83502036622d6dcf8d3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-linuxarm32staticdebug.zip",
        sha256 = "911ac03f318b3740cab511c98e74ba9cceeefaf59feb6caea30f6946852e5cff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-linuxarm64staticdebug.zip",
        sha256 = "57d601cc82524ac48251119448eca251df58699cf87f56aa4e73498e8a9c73e6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-linuxx86-64staticdebug.zip",
        sha256 = "131921bf5d2c39a918cd462bdc8130aa36f6776dd644064c2d839217efdbdca6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-osxuniversalstaticdebug.zip",
        sha256 = "af0b18c880c81f2b9a5674aef14a4538fd26270c52caa0f96687bc2c98da89de",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-windowsx86-64staticdebug.zip",
        sha256 = "c08162dc0e30b94843a9c422b52820b991f07b43e3c038f53136bca4c3aac99d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-windowsarm64staticdebug.zip",
        sha256 = "52608929c4ca117089c1c846e1d253a9df1a6eee3992e66a55f8fb7b6f7a5050",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-linuxathena.zip",
        sha256 = "3d3845350b622ddab7b17333d9e7300bca5be8cfc3187abe1932e306b3393989",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-linuxathenastatic.zip",
        sha256 = "6f61db56eb3eee6eaf8a9fd9fc387a5722a3590707b80e0139d6542774c9ef58",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-linuxathenadebug.zip",
        sha256 = "3bb918047b70b42d700ece40987193d810f919199ace002c6a69dbdb4df594c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.1/wpinet-cpp-2025.3.1-linuxathenastaticdebug.zip",
        sha256 = "2f5c56d3a2d9aa827fc70e74e544bdf267d90d1933ea8cde3d49271c79ac1933",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-headers.zip",
        sha256 = "dabaa73a1560dbb53b601c8cfa23c57e2179a37668e72ff54d3d0c7c3d426a81",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-sources.zip",
        sha256 = "36f88b3c8b1ce3363f653d51136527cd270f779986a82cf4108021bb7ce85948",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-linuxarm32.zip",
        sha256 = "4970a2575dc6993c91c8ca207959661d52d66cc0b092cc82f47214e83346f045",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-linuxarm64.zip",
        sha256 = "6c0cd8814f2d558f15f903ed6928e3eb85e85aa2a5dda78105c4c4a47cb3ee21",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-linuxx86-64.zip",
        sha256 = "fc49e37788262a2667fae811cd40f1ab760b379de283ee7165ff7c8ce62b9078",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-osxuniversal.zip",
        sha256 = "305e05aa7ca2c7db2eb83ceb529b54959c645da0ac6ee12d7e7498d8008ee159",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-windowsx86-64.zip",
        sha256 = "26d3dfe8cacbc297426f3cd50cd4d1bd25e229e36ccdd07c0d3a8805809fbf7e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-windowsarm64.zip",
        sha256 = "a8b53c6d8d8edde8a66076cf3a178274f46800dcb059533fc76d57a034fd4cf2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-linuxarm32static.zip",
        sha256 = "f60cc1185830e3fc339732fcec3f825374fa5d85ec134c390512ac4bf1f16553",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-linuxarm64static.zip",
        sha256 = "9d4a0f5ebd8b83e1035aace0fd427238fb9a9a8a85f6dd3f43af68a19aebc652",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-linuxx86-64static.zip",
        sha256 = "c1b9cbe662349f39274c23406f99f6eb96f0898cef096bfe9913684f957abf38",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-osxuniversalstatic.zip",
        sha256 = "ca4e854001bdbdbca6bd30759301a83f4c3f96d548f77c262cc67e6cd664926a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-windowsx86-64static.zip",
        sha256 = "3b2d1762e3368c8783079069774338e7c239a6f361190965c145ae4f209fda1b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-windowsarm64static.zip",
        sha256 = "4f0e3d1997eaeac1ee48caa894d3274dc1766e25d0ed9b30067dd866f7926691",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-linuxarm32debug.zip",
        sha256 = "e7a14e5512755e3fe209a0d01cc4503be0aef134079fdd5f69ac3c02a1b67097",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-linuxarm64debug.zip",
        sha256 = "aa59da15665a9112195e0ad3018a2eacc6e928f620356f3353ebea2da604418d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-linuxx86-64debug.zip",
        sha256 = "09aaedac4d324c8ce79766b9fe2df7ce31e3d92397cc3f6fa99fd38247db7221",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-osxuniversaldebug.zip",
        sha256 = "2ab79b3ffcc121bf5fc2cd033837b684a4582ab8a6c60a190c32bd99589ed739",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-windowsx86-64debug.zip",
        sha256 = "7ecb75c804c709d9e5cf3519a7b12a3f32205d033c05a18788d8290ad3e84d5d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-windowsarm64debug.zip",
        sha256 = "1182e2de30d1c98d38c151e5262890b084bbcde7b5fc4c11291eef8dbfce2626",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-linuxarm32staticdebug.zip",
        sha256 = "23865b66e57f93cb56f4336a58cefd76e2fe896cf9761425fea1ca62dfaf9ea2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-linuxarm64staticdebug.zip",
        sha256 = "10c996d8bd4dabeb26c6173495e84a03cd2992a5d44e679c38765011e9e5b47f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-linuxx86-64staticdebug.zip",
        sha256 = "c4836c990fecc4afb62cd0e764405425724a4a1c8a71953d13206c01fdb9de52",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-osxuniversalstaticdebug.zip",
        sha256 = "70222eaedba6850814b38efa3187b5cf211838b566cd1d470446379b1a6b0e18",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-windowsx86-64staticdebug.zip",
        sha256 = "35579e3b315598fdc2f56f52a6cb58d3cd7b5f212428fd1a97c54110f0ff2c4e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-windowsarm64staticdebug.zip",
        sha256 = "00c904c63cd1082648650953f8016779eb0fc9e4e2288ae1229ad3e1c8cc8536",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-linuxathena.zip",
        sha256 = "87e4147229fb10129fec4d593a4962b9f499e727240dfc5a1a69c2457d2a81e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-linuxathenastatic.zip",
        sha256 = "18a8197f9d6bf539a0e6464297009b2c7d2443d01190f9e23411870f7fb53fb5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-linuxathenadebug.zip",
        sha256 = "dc31fecdbb0f7a792576e08d5ce35cd5a71b6cbfbcb75f2c0d066230a27f2de6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.1/wpimath-cpp-2025.3.1-linuxathenastaticdebug.zip",
        sha256 = "1dd41a0df65c39c8c5329989c7e0431356c47f4807613706d3f3cb40a92ccdb4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-headers.zip",
        sha256 = "1b2bcb01de82bc7830e49dbd533370b36ef9fbf21f2a43759672dbf30ae54563",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-sources.zip",
        sha256 = "b85e6347b48d1e36a2230b2557389e1370d54581f4b15c3aa5b0cc50a346d960",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-linuxarm32.zip",
        sha256 = "b0a1ca48fbd4babd8fae23709bce2edd4cb59c962cf7f0204417553749beba11",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-linuxarm64.zip",
        sha256 = "656554c18e605f98eab5d41f1ccf5162dc03cceba675a4da7eeab1b07bbb1794",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-linuxx86-64.zip",
        sha256 = "7982a78663c3c8de4a770f03eb8c8d79a10bd3dd23ba829791b4eba5d99e8a49",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-osxuniversal.zip",
        sha256 = "c227fe8f239af3e803189db42a944765f6d43794d4ce6563eb69c0e0133dec39",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-windowsx86-64.zip",
        sha256 = "f8aef7adf19c41dcec9ec36ef7aaa965daac8277b1cbc1fca169dda40a76f4cf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-windowsarm64.zip",
        sha256 = "810fbb5e2577c3012314d13ef62d7e09b3be93ff02c5e146d3271c787c13b72c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-linuxarm32static.zip",
        sha256 = "89ccc4ea561e5b924dac8716ce81762ad7eff13f61a04e7c4f8199d2dd178a4b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-linuxarm64static.zip",
        sha256 = "2536bd5934a3c03a60e90daeb7c8e387bf814fec2f1956dcd498ca8f3312d40d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-linuxx86-64static.zip",
        sha256 = "f1d0cc45a41e993e5f5a2b72648f229980df6e218951f2d041d8214708006691",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-osxuniversalstatic.zip",
        sha256 = "6284ee86be3ddae115a96e1554bd9ccad96a330904efaea8ba3f07fccd5e1bec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-windowsx86-64static.zip",
        sha256 = "29bb7b3e9ed0a74137bbbefe22691d0b276582a31a93eadca6d476d38dade483",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-windowsarm64static.zip",
        sha256 = "31e955e292132704024b514c67714d797a33ec3720806f3e132e2f43152d0091",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-linuxarm32debug.zip",
        sha256 = "7e0960dcc39eda8e38cbad776a7c18cb54b92ebe90c322b795a0544dd2018189",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-linuxarm64debug.zip",
        sha256 = "222cbed7008660b141514eb447efdfcf3edcbc78025f878b33e64521aa886214",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-linuxx86-64debug.zip",
        sha256 = "7e4025fa7b2884fa9a7a187607a6d7abf97bedb56b10239272c52e6eabf2eead",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-osxuniversaldebug.zip",
        sha256 = "4cc2aac49b6ac85ff6ca46253e55f9bcc637fb6526dda5812175e65b8c255093",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-windowsx86-64debug.zip",
        sha256 = "175cc06de15f1ce5aeae3be4217f77e08b46c3acd7696f1ed8f656c08edd6df0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-windowsarm64debug.zip",
        sha256 = "ece7e116a75a2835a37ddd58d02fd2635d9b2affbf638754e3127e7f6ffbc023",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-linuxarm32staticdebug.zip",
        sha256 = "097ce20c57491fb726c879d5ca17738e498efd04df894df2c46f965bafaf1a62",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-linuxarm64staticdebug.zip",
        sha256 = "2c057b79d316d6e093cd36c5bc65cc3205eff61bf17e6607af819deee4bd1ffc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-linuxx86-64staticdebug.zip",
        sha256 = "4f6076ef9594aab7f5b7e25469fa0dde225d6299714d2ab1e956e76a968920a5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-osxuniversalstaticdebug.zip",
        sha256 = "8a7157a700f909adb1c4320b2426a2b2bc423cf4f1ce84d49f17008fa6677566",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-windowsx86-64staticdebug.zip",
        sha256 = "01c34135cf4da80f0818aece14ae902e14fae610d1275bd1c890340e6f12e255",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-windowsarm64staticdebug.zip",
        sha256 = "b49f1d5091c543d4b9d3536926f3510db4d4c719b5bafd23f73c27195e9d7ba1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-linuxathena.zip",
        sha256 = "211457c3ce9453aebb795dba825b6a1958977ff2f9694bdc56cfc123fc0aa200",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-linuxathenastatic.zip",
        sha256 = "fe35a4151d500adbaaf6d5307d4cd73dfaac526af9809183a546447cbf80b186",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-linuxathenadebug.zip",
        sha256 = "1ff72ad6fc7068dd221f2d40025c5da268de01aea08f689f4c68adb6a5c74485",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.1/apriltag-cpp-2025.3.1-linuxathenastaticdebug.zip",
        sha256 = "a63193665b26b74501f8099ecd80f305956ff39f8e7e8820cef992bf3e479f9b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-headers.zip",
        sha256 = "cf3ace7ca9548e85a6f8e67df020f7ab71215e6771830e816a54772242cd2f5e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-sources.zip",
        sha256 = "9f457d902efaf1bea559fcbc8f2392f5b2d0f64678a34bb1d781bde328ba35ef",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-linuxarm32.zip",
        sha256 = "471f3f99021b116d684c4588c7de513bdef590f36907e899bc183338d0a8d067",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-linuxarm64.zip",
        sha256 = "2b2c86f218b9e6b9f60305064dbfccbb8c4cff1fd3026137db766600a5e10a9a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-linuxx86-64.zip",
        sha256 = "74b0c88fb2c23ff196f8399f3482879859dc7c378596de5738762732f2940643",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-osxuniversal.zip",
        sha256 = "4bc2521189e593e248e28e0c029f6bec13ff480b8c246280587849f9e49ade21",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-windowsx86-64.zip",
        sha256 = "4aa3a8d7109bf1b594901c53a60c92dae6711195b4fcad1490583b021ac9ce9e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-windowsarm64.zip",
        sha256 = "9cc86afe5ea748f1d1df216ab833fbc12c493775904f79fe8fb6eece0a28a4c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-linuxarm32static.zip",
        sha256 = "57e38772e21c527bf003b23eb1cade0b903dfa892b82565f3e0ee90538592f19",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-linuxarm64static.zip",
        sha256 = "a1952ea1bd9f066756a30e992b2962d44173bbb51827bc4335decc1f5d1b9d2c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-linuxx86-64static.zip",
        sha256 = "f915b1b6a3771a33dc2f11555826ae7364b43090b33eb36ab9545549b4c6153e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-osxuniversalstatic.zip",
        sha256 = "fe1c62e6f0e1f6f0358ec4e55d55153720b8ae2852e35fe1a966c334e42fb9d8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-windowsx86-64static.zip",
        sha256 = "ecfff3b7cb421941ea00f79ad9bb4d3dfabf2aff2c520b4add8b6060cfe37d81",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-windowsarm64static.zip",
        sha256 = "fd3e554c38d1b5c4b220623163484d7815bd9abd25189a6ec92a8cf172975f63",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-linuxarm32debug.zip",
        sha256 = "d574adb9f6d33133259b7075705e4416ff23ab839de1ab6de4002ccf2b350a0b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-linuxarm64debug.zip",
        sha256 = "991e6fe3867b47b8cab6a2c42b757a8a73dee210d988addc2b123934207b31bd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-linuxx86-64debug.zip",
        sha256 = "ef380574ce5ac4cb1405cd74d511d582b1ec5a5fc70c07d0faf146a54ca23087",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-osxuniversaldebug.zip",
        sha256 = "175e7f685bf7da451d3679b4fd2b39c27d2e84358561d9642d51e309649cd1b4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-windowsx86-64debug.zip",
        sha256 = "5af9068fd9640f31b30815175f4fe2667977f17bbd0f4c30e6e02cb412d4a250",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-windowsarm64debug.zip",
        sha256 = "82251017ec2e3e2bd0596c313bdfc8d2167f728b6a3952aa01193f57b9bac56b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-linuxarm32staticdebug.zip",
        sha256 = "86d85ac9abb9e2736b776290191fd0227a39aac3c7e59258eb06bc1125c0c9c0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-linuxarm64staticdebug.zip",
        sha256 = "e5fcfe88630c4cd8b3b171caf2e6a46838d7b504ae2eafa6cbbb447940db7757",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-linuxx86-64staticdebug.zip",
        sha256 = "5c79f5a508078e94c229291cb8a4891fd4e298a54d57eae2aac187481ab497da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-osxuniversalstaticdebug.zip",
        sha256 = "0788f22b73708162d5ebe86257269ea1ba58299f398198f5c921edc8b32b1506",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-windowsx86-64staticdebug.zip",
        sha256 = "eae9fdb033beea68d6ffbebed54049fcd56717ae855ed340adbc026bf7c815b6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-windowsarm64staticdebug.zip",
        sha256 = "d49bf43fc93ef160a90ed8a32ad608ddf16519150fb90817db01df7d8f03788b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-linuxathena.zip",
        sha256 = "d60a31d27540499a803140a25545b75a069309d1629bbb8fc7a4efae46232c3f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-linuxathenastatic.zip",
        sha256 = "3ab40b856fc2df118bb0dee4023f88750e557a3c215ebf08b319fe0951af5f73",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-linuxathenadebug.zip",
        sha256 = "c7504f3bc270e5705520e4f83173c00a4c90b775ea7a72996056f3810232d4be",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.1/hal-cpp-2025.3.1-linuxathenastaticdebug.zip",
        sha256 = "6a4de0de10b5da3ecc63d2fd90023cab0ba5a2afb6dddb614ba2a0587e601fa9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-headers.zip",
        sha256 = "0a67aa89ecd531718ae92e5b3d7f2043440fb341da479c78e52903db4f325df2",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-sources.zip",
        sha256 = "f7eb7da90c8fec9afb42c4755206612abe3fd9e74457d0a141b1601c1a2c2efe",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-linuxarm32.zip",
        sha256 = "c0c173e0510632c60204caa10fec3d71a286cbdd54637bb729b1988b3f528857",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-linuxarm64.zip",
        sha256 = "92635e3ff2461407dbfe8e97a171336962126543c1bb62400eece9f3ee5b0161",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-linuxx86-64.zip",
        sha256 = "cb55e1688aa6c086ec89044ffc26cfa0778ddd65b5b11b361df858413174155c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-osxuniversal.zip",
        sha256 = "5035f7b3ab85e3c35959549d833ed032f76659d14cbf9bf9dd206d53a97df662",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-windowsx86-64.zip",
        sha256 = "b737f2b690921e7726b5b1f720df4c1e919e5a10276f3f151ae55a85e72d2843",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-windowsarm64.zip",
        sha256 = "13daf4785807bad301f20b4a13eddf207e9e1f7adf8d6f407749ecd5c2a4c657",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-linuxarm32static.zip",
        sha256 = "4994d3f4c75222b07ad72ae76525faffffe7016ecfa4f7ac2ea08734e5f4e4df",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-linuxarm64static.zip",
        sha256 = "51c4cf3992c95f31f6322c32c0814883822efa3d6422563bcd5c7a42fb7b89d4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-linuxx86-64static.zip",
        sha256 = "5bf49840e0d0c2b1ccc3fdd9de80b381885ebffd1cd2377fd34022c8b769deb8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-osxuniversalstatic.zip",
        sha256 = "4539fb528083d104b92fffcc0db8085647ee79dfe19f90a125506d5195bd34c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-windowsx86-64static.zip",
        sha256 = "7d9dcbbd0828ea7a0479318c8ddd6d3ad872efe1c356a404f3160d85ca52531b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-windowsarm64static.zip",
        sha256 = "b6fd2bb7c83baba32fcd37e43006ff4b344830d1461200eb9bca2b70b900cc18",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-linuxarm32debug.zip",
        sha256 = "7b58df0fc4970c59374f7ee64939658c8fc63ed4cb88339e2846106adc78b188",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-linuxarm64debug.zip",
        sha256 = "8812986b7a073ecf0dd9fe23e3013aac01a782bc6d3f38dd3aca80053ad6f976",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-linuxx86-64debug.zip",
        sha256 = "a7bf8b86361c48f52877fcee9da65192ee5bbd54ae3f7aa61ed7941a3ed1ea37",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-osxuniversaldebug.zip",
        sha256 = "15c9e46b287d633c06a727ce2c536bebc8969c7d5e91a1afa421e29b367b948c",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-windowsx86-64debug.zip",
        sha256 = "4f16358400ba9eb3e4d0984a2764017e8b37513eba0d347863c79046595edc1b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-windowsarm64debug.zip",
        sha256 = "ffb8e1e772c3bc0d12659f9ccac7b1aac69628a0639ffb02d2f957dc14e81875",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-linuxarm32staticdebug.zip",
        sha256 = "aba276f90db5bf8e4b78a94c190ab28f1d91f855e14cf8b4c736742946efee1b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-linuxarm64staticdebug.zip",
        sha256 = "f1be5897c06e278f7d845c387776e044f0d0564e258145fc29cf2940ea70c9e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-linuxx86-64staticdebug.zip",
        sha256 = "4e2de698f21f885457d86271587967535e1318eafad508dcd4adea1cce0ef9ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-osxuniversalstaticdebug.zip",
        sha256 = "c51fce339aab21a51ac67b4b616980620ab597bde240cb876cf2da1857b24891",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-windowsx86-64staticdebug.zip",
        sha256 = "64c382912a6e437d8551d387fae79c812fd7b66cc74dea7959de5332736b951f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-windowsarm64staticdebug.zip",
        sha256 = "561ec88dfff1dc9b97d6139a41b82f86c4084c1d5d3f0f32093bec7cda59b1fe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-linuxathena.zip",
        sha256 = "c9626dd74700c135a694c5ba71a0b323967f557ac0de25c2bbcc252e02a1fc17",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-linuxathenastatic.zip",
        sha256 = "455c4676769b2118a652936020ead0631a70b26e3b4eee813782c69007f3e84b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-linuxathenadebug.zip",
        sha256 = "84309e97f5db29157433e706300a3034402c7c40f357210bf3c6a594688d3534",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.1/ntcore-cpp-2025.3.1-linuxathenastaticdebug.zip",
        sha256 = "cc3adaf485ffa49710a522bf91782efbc825691dc06a113cee71b632652354f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-headers.zip",
        sha256 = "ca27deaf301f4b56fd3a90ee42d92a5bd63a979f4feeb3464c60735abb764817",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-sources.zip",
        sha256 = "9f066b1272ad2d49f4373fb16c9fae589bd7cee332531426f5ea9d07426b0a9d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-linuxarm32.zip",
        sha256 = "48e4b5729796b255445074f2cdece5e9f179256b287f395ebaf5e2a50f357d1b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-linuxarm64.zip",
        sha256 = "85c80635fda09228c0b48149cf803ae083e5dc394a88b85d2ecdd97b038ee302",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-linuxx86-64.zip",
        sha256 = "25032c3221de453643ec8027958de856b42c7db99a25460b879cea40ba374961",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-osxuniversal.zip",
        sha256 = "cc5a03e3b351d5f3734843240f2813a48d734f8ce27eb9cc7a3ff7d9d059138c",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-windowsx86-64.zip",
        sha256 = "3fa2bd9d54f34b4edb32d55127fa0b11142ab6f28b35f358e0cc558fc4a6dda8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-windowsarm64.zip",
        sha256 = "a853925976d328e2f79c7239d47af8bfff4faad731499795df7008dfd8053c24",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-linuxarm32static.zip",
        sha256 = "ef80c2f04aa4fd0b8dd92b330e3cb2ff42031ec6195c395f34fb8dc21e0b99e6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-linuxarm64static.zip",
        sha256 = "7b0b76ae103e7734da11bc785c2ee14401c4c7937ab359feb1458f3f9f7cea0b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-linuxx86-64static.zip",
        sha256 = "832d831698a8b34da69f0ed294221cbb385e13eee4e178fa2340c7b2b566ed18",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-osxuniversalstatic.zip",
        sha256 = "9a57cb055b7eafdaf25a697da44eec3c84a4139b4f92d9d27cac7ac4c5eb7909",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-windowsx86-64static.zip",
        sha256 = "419aca495576a10392cdc4c95a1bc80b0191b16400fee5ae15977cfc064dadcf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-windowsarm64static.zip",
        sha256 = "cf5ac5c12c89e5feb97d4f0c23eec2d18cd5ffd577f086ed5bb391f4fed2dea6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-linuxarm32debug.zip",
        sha256 = "cbabddb422a807b3f8223403de5cad75cf857f060575894d0af95f2879d19a7c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-linuxarm64debug.zip",
        sha256 = "d228dff45ef80f277eac3823d60ac0b885e43e48dc8b94ba7cdefe4f6062512f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-linuxx86-64debug.zip",
        sha256 = "d4ea3d99b155ae1c68c2c267b46cb4969b500e2a15d114820669d488be9c5850",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-osxuniversaldebug.zip",
        sha256 = "3aee99905b0b6d0e8c59bcca3e7df4ad58adccb1850098eca934db34da7beb17",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-windowsx86-64debug.zip",
        sha256 = "2de444db00017525f6c163536d96af0f4e4614329729a3beea56f7a01f99ed74",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-windowsarm64debug.zip",
        sha256 = "3fee073e2e313a1d07813f3943ec33702db3c189dbcfd389f8d7b6f7db3bda2e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-linuxarm32staticdebug.zip",
        sha256 = "b479816b507cb12aa78331e2c7f5d939ed8f3192a3b3ff68dcd70d9684afde1b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-linuxarm64staticdebug.zip",
        sha256 = "4ab3344259f3446a476873482cf033bf5d2d36ba0123410a637dfa4b0bd142cd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-linuxx86-64staticdebug.zip",
        sha256 = "4ac9dd8d2c0f8b682478d9dab369e84a76cd152fdc558caadf188d80a981f4ef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-osxuniversalstaticdebug.zip",
        sha256 = "e11d55021462754d155c7e0632ea680c4ab346f76390603006e02b8a70abbdf1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-windowsx86-64staticdebug.zip",
        sha256 = "9e48ee7c13688e95bed46c738d263dc8ddddf3dfaef9d6b3cf372ab32a94f9bb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-windowsarm64staticdebug.zip",
        sha256 = "f5a28e7a4590e22531b6f7cf74cc05adfb510aa3f98fffdd4b898b9fe7bb4241",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-linuxathena.zip",
        sha256 = "1d864fd4d217ae722a3c827c8d2f8f28a4cb36d27d47ae779f74c069baeb124e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-linuxathenastatic.zip",
        sha256 = "bd07ce68e1301fcb5011d9b899739c791f82aa4cb774dcc1c65f5f9773663e6a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-linuxathenadebug.zip",
        sha256 = "c249826b782e896e695335a86efafe9f6dd94a778523e49456b4c2d40eaf8268",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.1/cscore-cpp-2025.3.1-linuxathenastaticdebug.zip",
        sha256 = "68e8b07f2a7b86487ec7644313278a393d98461f084dbef18012676980493923",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-headers.zip",
        sha256 = "b557561d7bca6c92913533da145060a679c61a217d61ec07b6fb69f7bde18c27",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-sources.zip",
        sha256 = "32f15445c00fce81f8c4fffcd165c5d8f59dd771910577d33d5e32434dc24419",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-linuxarm32.zip",
        sha256 = "a24ea96358ac92163638dc514437b3d9519bd621dd502d180d718952f6153219",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-linuxarm64.zip",
        sha256 = "2c027b1793258f768e960420d0c8b498f846b6346aa74993268da66d14414714",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-linuxx86-64.zip",
        sha256 = "fb33d024518e6af36ea4adde07383ade1749fa62f117f10bf15b0d6eca709046",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-osxuniversal.zip",
        sha256 = "809041eb615263d662850beece0e66434ce8e6885bb93bc2225f0dace0c0d3ce",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-windowsx86-64.zip",
        sha256 = "059b4079ec767a47575f24a1c10fefb74fc9998dc6d8ee24e811ca3310d6653b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-windowsarm64.zip",
        sha256 = "934c71b780bf9beecb9cce89c9d2b8a7894759492d738dcec8958d5576c7d39a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-linuxarm32static.zip",
        sha256 = "8a66ed80d4ebb817801d580babf6ed5cf905a114de6254e23fce2a390ca5dc12",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-linuxarm64static.zip",
        sha256 = "e5bb1f78552e6b0e137e99e4ca4330d6c88f69ed09866cc25e81ec1e06cbb3d4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-linuxx86-64static.zip",
        sha256 = "0a5b0721db3512463109d2cc86f4d4ed3c83269f7b012e1b650e197dda7115f0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-osxuniversalstatic.zip",
        sha256 = "970fa9bb037dee8f889b1925b81e08cd9733fa0c0594e29f60baf303e88db09f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-windowsx86-64static.zip",
        sha256 = "7572fd11b26295b9ffbdc5aded76b005fb4c36659f2ed2bb78afe5888f664887",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-windowsarm64static.zip",
        sha256 = "d219473106012072987b7b2a4b7146c4a2ea9727c835b7227a127cb64b5165f3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-linuxarm32debug.zip",
        sha256 = "35b80b45548e0473a96dae929e17946be15d86feef8dd16e14605b8250deb854",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-linuxarm64debug.zip",
        sha256 = "7d688a5436bcc968d310345f61687e7f411716008881c2302d504257d34142fd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-linuxx86-64debug.zip",
        sha256 = "b4939075f78a5586e4c54cc02dc5e8ee62eb5716e7dd721f5ee8c3330cadecc2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-osxuniversaldebug.zip",
        sha256 = "0c0e1ddc10b346696928964694cab17dc8f3e96986f842cfac89e2ea0cb469a4",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-windowsx86-64debug.zip",
        sha256 = "c9baa3d96e8af8d5888157a8e02006b202addfba00efcf0bc838a8a0f17181ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-windowsarm64debug.zip",
        sha256 = "25da52de6605438e19b02bb524401fd2103de8f5e00ffce24aba850715c22e26",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-linuxarm32staticdebug.zip",
        sha256 = "3bbb861693be2a74e75e0682bf4bf93f85c5cfd915fa720a284b7ed56b65d4e6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-linuxarm64staticdebug.zip",
        sha256 = "c449d1a74efe0cbce41886c48b136b04a5b4d36989f2345a5e2968c1c869edad",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-linuxx86-64staticdebug.zip",
        sha256 = "13f0ec72855df9ec12a976f31a75f0b3e1cd401c6574ace978e084ce99bf958b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-osxuniversalstaticdebug.zip",
        sha256 = "e4857e2ff8a1364fc50b7d2444b944d3a6c8fd9121324bf6dbd64db1f74bbfa9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-windowsx86-64staticdebug.zip",
        sha256 = "4196cb76e36bdea842c2eb05f892dfd4523eb5d03659d1a2b75efcaaf6c2abd1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-windowsarm64staticdebug.zip",
        sha256 = "327c143bc0a10a171e2f40427484aa60b85702a2464a413f497c11942ee04d68",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-linuxathena.zip",
        sha256 = "f8336cf4ee30f8582998a4e8246b7bfa474abcee864736e84ba29ff73dd0cb1a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-linuxathenastatic.zip",
        sha256 = "7624bbc0a6f21250607066b252607a1422cc1b05721717fa0974ff2201c373ba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-linuxathenadebug.zip",
        sha256 = "4c3513d3ac3869ee931c480aa0d02c061009c2311c29348a18c33ffb3f6f158b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.1/cameraserver-cpp-2025.3.1-linuxathenastaticdebug.zip",
        sha256 = "192f00beab2914bf005ac2e63a61df04fbf633cd9f53195b617132ca5b0124ce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-headers.zip",
        sha256 = "bcbe454350944ad5d2a133bae7cfa1b7458c9383520929dcc06a3a768bc04733",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-sources.zip",
        sha256 = "153de76f19bde25629bcc4a1d927254b69b582e461bbf605f9ff374ec5f3cee8",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-linuxarm32.zip",
        sha256 = "3d9f686f09b5469021795f51d5f7dcbc8aae332ce3862f624be698ed9c47fbca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-linuxarm64.zip",
        sha256 = "3bec326202ce9f16e2f0b17c752c489abb012c5e40ce19adcc6cd240677ce34d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-linuxx86-64.zip",
        sha256 = "b5446f44769530c580990de2c51b3546d77140fb3b29b8381ac76c1d47a427fa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-osxuniversal.zip",
        sha256 = "a45baae03d085ff38ce63fa16b513e6e57483b7c706b3c46cdd15d1f2e1e5503",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-windowsx86-64.zip",
        sha256 = "f944523d24dbdfb84361c7ba54e0aa201f8abc640d553a8070f8af9882e236ec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-windowsarm64.zip",
        sha256 = "74c2f1d5332ca1af7012e7ceb01a0dbb183268e625f0401519b63113e844f27d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-linuxarm32static.zip",
        sha256 = "72b126ae5b34f6e5c29d834573895d2a4efc1e3f2abc1b37c016a7af9f325d02",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-linuxarm64static.zip",
        sha256 = "30f0b0b879240486e7f283c1d755716501de6c787c9687bc74bd2941b9af80f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-linuxx86-64static.zip",
        sha256 = "7f5fe60410d6da49f59f14d985aa68ee4c175aacec72da7fa23d333f0ee79e73",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-osxuniversalstatic.zip",
        sha256 = "8ba397fd4b16508cc978f37d33cdd6b4254f3ea3005112da4306d8168b96f6a0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-windowsx86-64static.zip",
        sha256 = "cb0f7510beec6ef6ec2cc3e14de8b0dd00cd5840788103e7a667622959c59a90",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-windowsarm64static.zip",
        sha256 = "62bd040523ecab046f61cf39eeb9683d8e9842fdd86016e9fcb798be1413027f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-linuxarm32debug.zip",
        sha256 = "a9b83acd6ec8175e21719b3e282d3b4847d2e71cf741badf502b5f79309a3793",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-linuxarm64debug.zip",
        sha256 = "2db2bbdf2fb868a72193c350d8c0faf49af3164cca6cc6d4ce4b84f56068a422",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-linuxx86-64debug.zip",
        sha256 = "56516a863e4602d771b40b2c7170792eaafb0aadd07fdeca0d77822c0ddcdb04",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-osxuniversaldebug.zip",
        sha256 = "8db5a574ac204db65bcef9bf9d98e644121d67ce9431e88c9af0c968472dfebe",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-windowsx86-64debug.zip",
        sha256 = "69fbc87cb5df68a42b410bd52615fff56c5dbe4bdcf4895e095e0dc60805b74e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-windowsarm64debug.zip",
        sha256 = "e147adbc8cc0658a72b4946f04a689303d9e8130e6747c28ec500bfb2a095cfe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-linuxarm32staticdebug.zip",
        sha256 = "6096380489ce4371e1ee12c74c454c52309f7a95d1861b08b1f70cb8e1287db1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-linuxarm64staticdebug.zip",
        sha256 = "b906b81173556eab2ee88cc8d260e603551a7a2d738b9791a01ee16ebf68105c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-linuxx86-64staticdebug.zip",
        sha256 = "3758fba9ee05606f9ed0ff0888a9b0b32cf9e3a06fd4a1b0775f29a3c81d3297",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-osxuniversalstaticdebug.zip",
        sha256 = "c4feeb29c63142a4cb076964f35e60f1fb692164d1cda193834678aab98b5011",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-windowsx86-64staticdebug.zip",
        sha256 = "7b0c11dc5113698435453219e5c9da3b1eab5b0fff4fd36abfae64d7f63b127d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-windowsarm64staticdebug.zip",
        sha256 = "eb69c8453dc78111fb1881d66338b9bc697b0aa13b69ecb36e98494d3d3eba8c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-linuxathena.zip",
        sha256 = "41aa0ba1307feb088e7d1e072413865d9b4347d3ce04e4e595d30441054b277c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-linuxathenastatic.zip",
        sha256 = "58a0db75c1d377e44b15ba571b074f3c9349157b90357377a570cbe9a544053d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-linuxathenadebug.zip",
        sha256 = "d19fdd3f3f3aae5f8172d1c5e4096be5c70fc2fce9b396dca989dde6c8c06031",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.1/wpilibc-cpp-2025.3.1-linuxathenastaticdebug.zip",
        sha256 = "80c7fbff7fd6472a619ea6f33ba7cdaa9136fb49c8eda7e1b0d8d213c76ff246",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-headers.zip",
        sha256 = "ccf8fcc6ff01aa485105b55207a9a161178f0833cc053db33f405d424f0096ee",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-sources.zip",
        sha256 = "0bbfe35d4ddea4a8b62454ea9ebfc81871a1118c7f67353b514974cc3daf6278",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-linuxarm32.zip",
        sha256 = "85323bb97ad8784e4a0751e930f4bbb684d3fa2311dafb5d7ba679b9827ec46a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-linuxarm64.zip",
        sha256 = "c76226f927dbf686b12a072521c9f494db613d70abc2226aab9598a5d890f6e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-linuxx86-64.zip",
        sha256 = "fcb6e70677a0c59a14c2cb2532684eb9d4244f388691a3ec98bebe099d2c0494",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-osxuniversal.zip",
        sha256 = "3ed94ca478fb531820452a62a02901f1e788173b5b74a76594a042f9b4214ad8",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-windowsx86-64.zip",
        sha256 = "9a893d307d4451e8e7df172db334fee8eb47e6dfa4ef37d63049c1a4983db4cc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-windowsarm64.zip",
        sha256 = "cc583e16d478e5a6078c170299d3492deb4aee2068773977ff24e1f0631f1ab6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-linuxarm32static.zip",
        sha256 = "723f1a64ee152c28a7451cdcf9990d21ab135d97071c9bfb5e1e4d553cf0bf5e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-linuxarm64static.zip",
        sha256 = "060cf2c7824d78a8bbe82387f11f523b5d313e155c3c0a20e29902d8a51c74d2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-linuxx86-64static.zip",
        sha256 = "33fc15e73e4d21fcb13ea15072e2ce488212f03cc10d8196a3181faae23aea09",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-osxuniversalstatic.zip",
        sha256 = "d962547350e4292c5a9709deffaa16a32380d9e525f33d1f11138c6d83bfcf9c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-windowsx86-64static.zip",
        sha256 = "564a4b3d40db1c973ee03b08884a516941921fc5d9d445f6a1ca1278034fa117",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-windowsarm64static.zip",
        sha256 = "4d7608910107bbb8db207d6fa74233470609206409f005f5fa7548373f18a7b3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-linuxarm32debug.zip",
        sha256 = "3bec558380956ad1fa4e258485f853fa6e7feffed94fe5cc2b4c44337f54ad8e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-linuxarm64debug.zip",
        sha256 = "c4762c4430d543b82243dd0cb8c1563ce4b7d275a2c4cbc675f4193e15f5620e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-linuxx86-64debug.zip",
        sha256 = "03769a3510afc8a8ad2fc31b5404c12d10597c9425a1dc8e0167d38f50c86628",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-osxuniversaldebug.zip",
        sha256 = "179bac36324451167d89734f451ea80ad399bd60327512f6bc1312222391568e",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-windowsx86-64debug.zip",
        sha256 = "c4738cc8685253a6eab37e91e4138814b63dee1ad27d6c83d90c45d5888763d7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-windowsarm64debug.zip",
        sha256 = "4e532d8f01207fcf4e6d0ef3a5db6daff0e6cf135d052e4d841a1f5428840c57",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-linuxarm32staticdebug.zip",
        sha256 = "24e77c90b42e20a239ebbc1b3b58efdb55ad1044a23d72f15ccd9fd713e8974d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-linuxarm64staticdebug.zip",
        sha256 = "a27ac9835e5224b8ed05c24f82696518e1caa16b607de6efb37e7a8c2e07b82d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-linuxx86-64staticdebug.zip",
        sha256 = "9f2c3efcbdde12960cfd320ee96a229803fe135793010f5ea648b4f6e9a338e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-osxuniversalstaticdebug.zip",
        sha256 = "26847090dacfeaf421e7a98533bd5423506dc67e785aca9a245e735608cc107f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-windowsx86-64staticdebug.zip",
        sha256 = "00039eb2644eedb0aab3b0e28fa77b57f9e03ab4d6761d95f3430e75c07b8fc2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-windowsarm64staticdebug.zip",
        sha256 = "1adf7fbf372cb0b8293d1128f4ee4ce79663ca0fd1e76c1e36be3380d4a61b29",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-linuxathena.zip",
        sha256 = "05154f5fd349c890f3381aa7de09dca630bc276656a40e98f2e452c6da2601f9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-linuxathenastatic.zip",
        sha256 = "1a8b128288ce4861b3c46f1ad22f70996a9c7737add2d2d1bc9792181c9a1e42",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-linuxathenadebug.zip",
        sha256 = "93e84c3af87c2fac6c7b258ebd348de694aa084756997eea959fb09b325b0941",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.1/wpilibNewCommands-cpp-2025.3.1-linuxathenastaticdebug.zip",
        sha256 = "c53439a1b5782c0a6f3da9288f5fa154dacfc24746a8045d4dab239b2054a704",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.1/halsim_ds_socket-2025.3.1-sources.zip",
        sha256 = "9f55ee7f793e2b26ed0e8ca0ff3502d98db67e02afec8cfd93649b0ec8f009b9",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.1/halsim_ds_socket-2025.3.1-linuxarm32.zip",
        sha256 = "023b5922c2e7de9d893f4f555121c3ae98241bcdb7b3aa09badb8f0865f8ece8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.1/halsim_ds_socket-2025.3.1-linuxarm64.zip",
        sha256 = "8907b6f484d6a1c1ec30ff3cd6579251c77b0d334934dbc4430bb62e1c2f5a6c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.1/halsim_ds_socket-2025.3.1-linuxx86-64.zip",
        sha256 = "e594e25cd4a6f6cb403cc411516138b9d97ca2c8869805090afb9a8d3d8455f6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.1/halsim_ds_socket-2025.3.1-osxuniversal.zip",
        sha256 = "6d0b51e31173154a3c2bfca887a28ceb4c10d5b34c2432192d583da7f4fc402a",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.1/halsim_ds_socket-2025.3.1-windowsx86-64.zip",
        sha256 = "202156897804b63e515932ec0bd7fce120e23d61107f0ca56e586720d8542880",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.1/halsim_ds_socket-2025.3.1-windowsarm64.zip",
        sha256 = "0689aa2edfc86cc0ea50ac498aa7062e8948238f067531888a3b665272e5d6c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.1/halsim_ds_socket-2025.3.1-linuxarm32static.zip",
        sha256 = "4d091e0fa58277eda9e2eaea2d241e2bd866bf2feb641f8cef3c5320b60e5441",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.1/halsim_ds_socket-2025.3.1-linuxarm64static.zip",
        sha256 = "8d6fb250d17d84c1ae4760c717a995408c31656cfffd6aa29225d82f0c2a79f4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.1/halsim_ds_socket-2025.3.1-linuxx86-64static.zip",
        sha256 = "8898e24e0d3043853d6f54fd69be347eaae026cec51fd8ceae75d86b6813707a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.1/halsim_ds_socket-2025.3.1-osxuniversalstatic.zip",
        sha256 = "02ff57fe0379495654de92de908df92041f4eb1bee2eda6d2b86b3b9e0b8c1ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.1/halsim_ds_socket-2025.3.1-windowsx86-64static.zip",
        sha256 = "8ccd99e155a705388aef753dbd66b8f16409a97ce123c8d45ee0005aac4b14e5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.1/halsim_ds_socket-2025.3.1-windowsarm64static.zip",
        sha256 = "b33bc7e3c060c7bcef6a6b095a871995a9c5bcbcd08517670da9e2147c4962c9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.1/halsim_ds_socket-2025.3.1-linuxarm32debug.zip",
        sha256 = "01cdee4379ed0babebbf7c043fa2e34ad32a50de71eaad1a8493c0177dbbb3fe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.1/halsim_ds_socket-2025.3.1-linuxarm64debug.zip",
        sha256 = "16174c2be2a6755362447136c45297753f36d73a8173ddce270483a5171fc000",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.1/halsim_ds_socket-2025.3.1-linuxx86-64debug.zip",
        sha256 = "10b5c07ccd56301e86d188c85a14571b83190a8b5138476d5cb98e5ec42610f2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.1/halsim_ds_socket-2025.3.1-osxuniversaldebug.zip",
        sha256 = "c4fecdcf9b9cf7bbdf8ef40292a2c2be55fcb7a128873b972d9496e58babca13",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.1/halsim_ds_socket-2025.3.1-windowsx86-64debug.zip",
        sha256 = "eda1077537c346a768c8cccd3bac49e4474b00e19b051e10cd0dfa21a15bbfbf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.1/halsim_ds_socket-2025.3.1-windowsarm64debug.zip",
        sha256 = "3a2077e3e6ad1cf01e69eb80fe942c32fb268d6af878966c488107e0c288af84",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.1/halsim_ds_socket-2025.3.1-linuxarm32staticdebug.zip",
        sha256 = "086a3d95d3dddd2e49abf8a574fe1fa4f966119b8082d6603ac4ef4b9afadc0d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.1/halsim_ds_socket-2025.3.1-linuxarm64staticdebug.zip",
        sha256 = "42e05a37c94c36dd0f7dfac4b5e0ca4145607328087ded78c1d014654d06155a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.1/halsim_ds_socket-2025.3.1-linuxx86-64staticdebug.zip",
        sha256 = "f07a18b1ed137a2765c5789055defe6fb63dce9275122c8818ffbb9fb01d8126",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.1/halsim_ds_socket-2025.3.1-osxuniversalstaticdebug.zip",
        sha256 = "4df0e84ef95b75ba1a05a53d226ab65585a8c1756d97dc4a448a9a6ead18d0fc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.1/halsim_ds_socket-2025.3.1-windowsx86-64staticdebug.zip",
        sha256 = "4ea862ea777d91bb7f35a26fbcf35105ad9d74f8a580753717fc08a2f093b043",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.1/halsim_ds_socket-2025.3.1-windowsarm64staticdebug.zip",
        sha256 = "f359f7db4d3b7861d7be0629b51f6214416ff129d7f1b3a67294cdbd3efcfad4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.1/halsim_gui-2025.3.1-sources.zip",
        sha256 = "0b12285c00e57bcc822d95033dcf5fb9b31db7e945bd89e98fa0a5d27aef2f14",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.1/halsim_gui-2025.3.1-linuxarm32.zip",
        sha256 = "18803fff7d5ff4ee14fef1a018461fffc87699cf40a085be1de6023a2255f3a1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.1/halsim_gui-2025.3.1-linuxarm64.zip",
        sha256 = "0740beedbb20ed9378f9ca9c30d870e4ae04d3073c1c76691bb02b7df52388ca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.1/halsim_gui-2025.3.1-linuxx86-64.zip",
        sha256 = "c3a0cce30e7fc2f439d7fdcf1a4525fb098e4e3493ab54564f93d7d954efe4fb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.1/halsim_gui-2025.3.1-osxuniversal.zip",
        sha256 = "92f551382a6b88f0c84ebe10a397cc47c38564274957a399d9ed7119afdf8f35",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.1/halsim_gui-2025.3.1-windowsx86-64.zip",
        sha256 = "81e66533499c0b2a5a5d7893a8cabb7ab8f90cc306f755dc6308349fd9a90519",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.1/halsim_gui-2025.3.1-windowsarm64.zip",
        sha256 = "4d62ccc9c7e3f0a263d1497349d4c6cfa146bdf98cf885c67173244939cb48b4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.1/halsim_gui-2025.3.1-linuxarm32static.zip",
        sha256 = "513afb65055d1b8de28e85f3f8bf4c7ca3a05f5caf3b61684295b415fabaa805",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.1/halsim_gui-2025.3.1-linuxarm64static.zip",
        sha256 = "40eacf722455a750dc6669b42bb18dcd211e18f3d59745fc4387bdd0d1ead6b6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.1/halsim_gui-2025.3.1-linuxx86-64static.zip",
        sha256 = "895398eacef8f40ad5d0282d1df61505ba627abc1a7547ba3c86f6505f01bb92",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.1/halsim_gui-2025.3.1-osxuniversalstatic.zip",
        sha256 = "8f04c6b33d9cc5439a490dbb9a7a3786610dff52f45fb5a56ca962045b95def6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.1/halsim_gui-2025.3.1-windowsx86-64static.zip",
        sha256 = "cefc63ca8d2957bc390e496a48da4bf083631421717096fe04e2c3101a07e265",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.1/halsim_gui-2025.3.1-windowsarm64static.zip",
        sha256 = "b5cf08547eaaaaf383b552387dd7748fc2df7b84ca40881df1df427a78636288",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.1/halsim_gui-2025.3.1-linuxarm32debug.zip",
        sha256 = "bfe43994d8d3aa9ab6b0bf2362a805b3b6fcc35ff02f339a9196e6d0c5cf0b39",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.1/halsim_gui-2025.3.1-linuxarm64debug.zip",
        sha256 = "a71f06d1f01e836435947c9da64a7864690e4026a1f5bf459ae611f83c08c113",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.1/halsim_gui-2025.3.1-linuxx86-64debug.zip",
        sha256 = "d05dd4b3cc34882ee784bc4dd78bd356b6bd3c90bab9880c34d57753fcd091b1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.1/halsim_gui-2025.3.1-osxuniversaldebug.zip",
        sha256 = "2b7273e26643b6a99f150763244e7909a71618f0589ee0ed7c7c8d2e93cc9e55",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.1/halsim_gui-2025.3.1-windowsx86-64debug.zip",
        sha256 = "0e39847ef9a5af8cbd9d3ec3e9349d12a69eeb00966975fd576620172c4139ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.1/halsim_gui-2025.3.1-windowsarm64debug.zip",
        sha256 = "58c3b7bd1889b9eb7d07f6452d0443c8d72204584e27dbcecb5a78385a4f812d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.1/halsim_gui-2025.3.1-linuxarm32staticdebug.zip",
        sha256 = "6e8c89aeff405715763a077077b6671904aec11f577e78933ea2a469a4b75b55",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.1/halsim_gui-2025.3.1-linuxarm64staticdebug.zip",
        sha256 = "a79125d2554b540126c2d1bdeea05c52f7ec23a335f9592dd5c490a5e4ef45aa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.1/halsim_gui-2025.3.1-linuxx86-64staticdebug.zip",
        sha256 = "86dee468454f72ec432c8a650a9af4cc8563db11ba21f3a4aee1d0813400db71",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.1/halsim_gui-2025.3.1-osxuniversalstaticdebug.zip",
        sha256 = "1652ac3f9d65a1812a456cd52b73b89c0bdfd8cb50a91e15461d4b0405402746",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.1/halsim_gui-2025.3.1-windowsx86-64staticdebug.zip",
        sha256 = "8c5636e1b7e75cd13a12ee8ff00c79e433582af610a4c75c9f0804fb95602e8f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.1/halsim_gui-2025.3.1-windowsarm64staticdebug.zip",
        sha256 = "7668a11e76f81d62d3b881aea835e13c5ca127224fc6b69aeffa6735652f16d4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.1/halsim_ws_client-2025.3.1-sources.zip",
        sha256 = "3a56fc13ae71d5e85651dc9743f541b84e7719b9af0196558172db83673b7882",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.1/halsim_ws_client-2025.3.1-linuxarm32.zip",
        sha256 = "2c5069ea8feaede8fe658815c52e2719f0c6679e2f6a49b8de67179444f1e666",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.1/halsim_ws_client-2025.3.1-linuxarm64.zip",
        sha256 = "05e8eba7a547f9a4d4cd36b00b20cb9e3978a84078e104bba1c6730c459b8f1f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.1/halsim_ws_client-2025.3.1-linuxx86-64.zip",
        sha256 = "bf982b848ae7cd42a6f1a6f47b2c55a0b77457db6c9b7c3103da3e2f967bf675",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.1/halsim_ws_client-2025.3.1-osxuniversal.zip",
        sha256 = "b3f457f06b7bbf8bd2677ff304a83304ae4d899e76871c2baebe2a1af7e574b5",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.1/halsim_ws_client-2025.3.1-windowsx86-64.zip",
        sha256 = "e8c38000f6eb997d8fa5da101904bc1077c914922fa03226931213064412f441",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.1/halsim_ws_client-2025.3.1-windowsarm64.zip",
        sha256 = "7fd368f42e1e2baea2ee1bfe8c547be34bcc5b80b220d9727092462705806fa3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.1/halsim_ws_client-2025.3.1-linuxarm32static.zip",
        sha256 = "0035479754c5883f9408e165c7d0c8a095f6f527ab906a5d01853c8a846ea990",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.1/halsim_ws_client-2025.3.1-linuxarm64static.zip",
        sha256 = "09eaaf7a0e3aed6c16da8e0a0d50574efe8309ad592efd28fdc3da57e934dd9e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.1/halsim_ws_client-2025.3.1-linuxx86-64static.zip",
        sha256 = "93c7cf669310286cd495aebde8d88cbf9a00e2728022a2554a8857268f86135f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.1/halsim_ws_client-2025.3.1-osxuniversalstatic.zip",
        sha256 = "73b9e9fcd0576dc189f6bea9b8457c94b89b3531ab34d9ee9f9ef98f2e264cc9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.1/halsim_ws_client-2025.3.1-windowsx86-64static.zip",
        sha256 = "e7aa5123f454b079072873b66ddb0dde856d2317a3abd4be09e5d5ed88258567",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.1/halsim_ws_client-2025.3.1-windowsarm64static.zip",
        sha256 = "c39753d7048d1e4ef96717909f4a67d33589a0e61d567c5c484e1ae28f421183",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.1/halsim_ws_client-2025.3.1-linuxarm32debug.zip",
        sha256 = "dbce6cd8be6a347b6553ff5de600af3b979f012fb175faf83f20bf2b9c9553c1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.1/halsim_ws_client-2025.3.1-linuxarm64debug.zip",
        sha256 = "f3f90a7fd776dfc75fd7f2b1823976b413965047f8e6536f5b2b029fb60d4895",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.1/halsim_ws_client-2025.3.1-linuxx86-64debug.zip",
        sha256 = "3c9ecc7ffc6dc512a7429b6593ff68ea244f5d24c9d2a65da736111b05cbbc1e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.1/halsim_ws_client-2025.3.1-osxuniversaldebug.zip",
        sha256 = "fe2e7f569697423d9abaa5fff8672b7e19e686a12fa434df560f70ec6d806443",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.1/halsim_ws_client-2025.3.1-windowsx86-64debug.zip",
        sha256 = "e707ef703b3e3947cc35fec2045e0a33eb921b912183e320770ea5fd095601fa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.1/halsim_ws_client-2025.3.1-windowsarm64debug.zip",
        sha256 = "5f7b7c823b99d077d912eefd5f5d5b0ade0918e955fbf04b567d27134f33ec91",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.1/halsim_ws_client-2025.3.1-linuxarm32staticdebug.zip",
        sha256 = "7bdfefaa0535abf03d392dee1949438434b9b8c621aee267c783686e9320b2b5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.1/halsim_ws_client-2025.3.1-linuxarm64staticdebug.zip",
        sha256 = "dc682444aca1e98e0cae3f1db3646c94571d95fdce92f7ed48dfbd4825fc1f5d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.1/halsim_ws_client-2025.3.1-linuxx86-64staticdebug.zip",
        sha256 = "0f7df12795534076c37339bab98620a07c4a744fe2fd287759035ba2d1db7084",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.1/halsim_ws_client-2025.3.1-osxuniversalstaticdebug.zip",
        sha256 = "bfe43d112a00c5fc6d2480f6c63312c497d9cce1a0274619dde8fbd9c01c3768",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.1/halsim_ws_client-2025.3.1-windowsx86-64staticdebug.zip",
        sha256 = "1dce7e6236dbc5758409ed4d00330194b9edab12a77241ecaa774c33ed0d5991",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.1/halsim_ws_client-2025.3.1-windowsarm64staticdebug.zip",
        sha256 = "be44d8d96c7c1681fa22e43dde99791772ddd32ddb4d463eb457035bcb94fcf0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.1/halsim_ws_server-2025.3.1-sources.zip",
        sha256 = "0de49cdfc9c91105c43a616370d78a64bc0c928bbc23a9e58e19decfd17e7047",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.1/halsim_ws_server-2025.3.1-linuxarm32.zip",
        sha256 = "36c4927145b0e35066b8fe20bc9694b37f8530fe56ec514169c535b4fb13cab9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.1/halsim_ws_server-2025.3.1-linuxarm64.zip",
        sha256 = "9676fd8834196281bc5102ae3eb7ae6152719579810a6c4b228f2f90aecb2094",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.1/halsim_ws_server-2025.3.1-linuxx86-64.zip",
        sha256 = "4139f4c734c8702849d73687d0d5a5d2cd2fc3d80e576d587678b620c45c1084",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.1/halsim_ws_server-2025.3.1-osxuniversal.zip",
        sha256 = "d26ed8a3f90c0ef756e9467fe81d3e4d83137fc2ca7a9943bd87cd424c0ddbf7",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.1/halsim_ws_server-2025.3.1-windowsx86-64.zip",
        sha256 = "908ef167eb1a6b460b683b7659da7f1830e1769b022999c66fe42e5bb306670c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.1/halsim_ws_server-2025.3.1-windowsarm64.zip",
        sha256 = "c541145ccf5dcbe872a778e6dabebf361da2aa6c900b21516b75b572e573a58b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.1/halsim_ws_server-2025.3.1-linuxarm32static.zip",
        sha256 = "291e3aad5821246f6202410e503f15cc0ac53edc633f7f40148b914b3b6c6103",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.1/halsim_ws_server-2025.3.1-linuxarm64static.zip",
        sha256 = "4785230083b84711bd1a12495349af1690650cc1d999f33aded36fb9705d38c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.1/halsim_ws_server-2025.3.1-linuxx86-64static.zip",
        sha256 = "b0463b20920727107d3c1eade912b5bfebedba5abf2c7e5895e284dff86c71e9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.1/halsim_ws_server-2025.3.1-osxuniversalstatic.zip",
        sha256 = "0704e0cb6b069046a36b2ecd032f4ad08d90a2e5f3fd5d6e997eda1d358b2a46",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.1/halsim_ws_server-2025.3.1-windowsx86-64static.zip",
        sha256 = "b0a77ce2e211f2ae5e246c529ee50bee867ff0a13a128aeaf4231d482ab54c99",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.1/halsim_ws_server-2025.3.1-windowsarm64static.zip",
        sha256 = "5964d7e5c91d402c3472e06f2b7ef5687263213dd39fbc5bd7e26321bdefaf1e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.1/halsim_ws_server-2025.3.1-linuxarm32debug.zip",
        sha256 = "93941948fd6a754146a51c299df955164794cc2a1fb20e9872557e1a3169c342",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.1/halsim_ws_server-2025.3.1-linuxarm64debug.zip",
        sha256 = "a5a9c2c1d3c62163abbf5f25abba9ef877fa1f8ce3bb47bd111a3b007c36c3f4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.1/halsim_ws_server-2025.3.1-linuxx86-64debug.zip",
        sha256 = "bb57e2782a43becfa96fde1f0abbc08dbc9ce8c63352c45594b44c9d0a10b792",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.1/halsim_ws_server-2025.3.1-osxuniversaldebug.zip",
        sha256 = "9b50bef1ed514ce03cb1de2a811b935503e8e8654f3b99b857936cf91362a3cc",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.1/halsim_ws_server-2025.3.1-windowsx86-64debug.zip",
        sha256 = "e6e9a92665a97351696e81ec750f3c87b97e2b734839e6c352c1eb6d2e54d509",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.1/halsim_ws_server-2025.3.1-windowsarm64debug.zip",
        sha256 = "690829493c1dc3185abab804ba0e1fb0aa2fba555353f3526262d683de4c427b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.1/halsim_ws_server-2025.3.1-linuxarm32staticdebug.zip",
        sha256 = "b7c9f35585e3b8181eb77f8eecf23e7f0e760b2983fe8ba1bee4e2327791752e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.1/halsim_ws_server-2025.3.1-linuxarm64staticdebug.zip",
        sha256 = "be3df7c4f3f4e1b53d7c5ec0a16c58799daf8c2e361c6b9d473cdbb31991eee3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.1/halsim_ws_server-2025.3.1-linuxx86-64staticdebug.zip",
        sha256 = "b9a974b0d11592df5bffe91b87539ae1848fad5f16fd0b43be7f26a504aacaa7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.1/halsim_ws_server-2025.3.1-osxuniversalstaticdebug.zip",
        sha256 = "bd9dca5d9ebd72b0c7916072f1785a6c44816369e0d8f865bca546b7636dabcf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.1/halsim_ws_server-2025.3.1-windowsx86-64staticdebug.zip",
        sha256 = "a96c89eed27f1ab51a4c0f044244694244cbc755cc62fcd00fa4f01b1664ec0c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.1/halsim_ws_server-2025.3.1-windowsarm64staticdebug.zip",
        sha256 = "679275106e25657425766cc9f7f0d1abbb1816bb4a9aaf0539647316c4edcfac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2025.3.1/SmartDashboard-2025.3.1-linuxx64.jar",
        sha256 = "43662aa6901b4da652081629389a77b283e2cb0234a0a741e7e0c86183e83512",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2025.3.1/SmartDashboard-2025.3.1-macx64.jar",
        sha256 = "2ce2f6a440faccfdf078adf623c12ce9982925b6a33f971b70dc69a8946a852f",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2025.3.1/SmartDashboard-2025.3.1-winx64.jar",
        sha256 = "482987a8e50aa89a7ae0c9c6c1ea899aea3495dc03b055831f77f99aa0fcccc4",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.3.1/PathWeaver-2025.3.1-linuxarm32.jar",
        sha256 = "3a60b9f010726a8b8256de16f6114f8dc37f0d8e92ea5888cb4c12943b162dbb",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.3.1/PathWeaver-2025.3.1-linuxarm64.jar",
        sha256 = "3b840bbef5d8472b04defcfb2a5f6a9e42ad63bb1283705452a921d1e6c980b6",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.3.1/PathWeaver-2025.3.1-linuxx64.jar",
        sha256 = "0efe17b96d28044b084eecbeee4850fd864273f66eeeeb52e70214df6259f10c",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.3.1/PathWeaver-2025.3.1-macx64.jar",
        sha256 = "3bcbcab9968027f620c4cc59cbfb927e4c21c1fcfbe0b99ccfc22ed5494d84b8",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.3.1/PathWeaver-2025.3.1-winx64.jar",
        sha256 = "acc165beb3cf0b2f9561bf049cc0d7da9e5bbf00b282cfcb53de400866d7dc28",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2025.3.1/RobotBuilder-2025.3.1.jar",
        sha256 = "59f76e39916311fed2aa068811536518bcf293d284c88f5fd87bbe238f8116c5",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.3.1/Shuffleboard-2025.3.1-linuxarm32.jar",
        sha256 = "f63fe48f542736efd0e7a079fad02902947282eee84c9153746abbb3df2ee174",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.3.1/Shuffleboard-2025.3.1-linuxarm64.jar",
        sha256 = "52bbcbf116bd06511aa6a8c6ae14c183141d918f04e966a206a4dec54869e40c",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.3.1/Shuffleboard-2025.3.1-linuxx64.jar",
        sha256 = "6abe88a957aa71929bc2fd2a9bff1f7026a9c259a94034ab4fab93e679f89b2f",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.3.1/Shuffleboard-2025.3.1-macarm64.jar",
        sha256 = "34a0fa6324a0d19602643d8faafabbe81af0559f583fe2c885bd35d00a01c4b2",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.3.1/Shuffleboard-2025.3.1-macx64.jar",
        sha256 = "73c065359503bea171d63cde344feef1025b485a0ced32e570e8986e6093a95b",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.3.1/Shuffleboard-2025.3.1-winx64.jar",
        sha256 = "6752a3b8d1094e540a17dd00bdff37cd508062fc85ce4ce4f539c4b9e33f5bbe",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.3.1/Glass-2025.3.1-linuxarm32.zip",
        sha256 = "24b36e712c2202d2c257e21729c871f4f56460410c2e09cb325bc3f58a020ded",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.3.1/Glass-2025.3.1-linuxarm64.zip",
        sha256 = "4f73dce0d58aeeb4cde55d21a1b52aab6735971c4009a8b7bdc58b58c1d5fcc1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.3.1/Glass-2025.3.1-linuxx86-64.zip",
        sha256 = "59268209c4252a827ca6b34ba8d5250598483afa729d4cf057a09836d6a6789c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.3.1/Glass-2025.3.1-osxuniversal.zip",
        sha256 = "7173f8d2ba5f0ed40fb0316b76d041eddf587f1cb00a897a79cf5c70966092dd",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.3.1/Glass-2025.3.1-windowsx86-64.zip",
        sha256 = "a56c81fa75838dbc436bd4a77d6f174ede50e06749cc22d839af02bd210c63c3",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.3.1/Glass-2025.3.1-windowsarm64.zip",
        sha256 = "fb0d70cfdd89eadbdeb0ffca0a67354d637fd7a1d0d3433fdb4ff69594d533b6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.3.1/OutlineViewer-2025.3.1-linuxarm32.zip",
        sha256 = "3de29455770dee48465007eeddcb87621171e21467c89d88ca18f6705b60ce3c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.3.1/OutlineViewer-2025.3.1-linuxarm64.zip",
        sha256 = "9584c0495cca9b6307fea59235827b51a9c222e0fd09dc4c8faf5c91b50fec98",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.3.1/OutlineViewer-2025.3.1-linuxx86-64.zip",
        sha256 = "00b8c3caa1a11fa04f0b200b0201bd5b501a1226966e70353e65591e54d0ca71",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.3.1/OutlineViewer-2025.3.1-osxuniversal.zip",
        sha256 = "33dbad42ba552d5c5b50b6e5d04150afa5230e18cd6d07151efe194901312847",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.3.1/OutlineViewer-2025.3.1-windowsx86-64.zip",
        sha256 = "3842b127cddcc813244a669d334a64a08fa185665bcb30e113802f66c5924d06",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.3.1/OutlineViewer-2025.3.1-windowsarm64.zip",
        sha256 = "5c8ca611d5d4980268854812baeb733c33fd3cb71944758481cc193444b12b58",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.3.1/roboRIOTeamNumberSetter-2025.3.1-linuxarm32.zip",
        sha256 = "afb0057fd0515ea2f2f623677e351b005cca9c4bdf33c6d6bf6280057c5bd7e1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.3.1/roboRIOTeamNumberSetter-2025.3.1-linuxarm64.zip",
        sha256 = "b4a9c5c8ff1c667652c703e48fa7a44a54d801f0cf262256f429b4db898f86f4",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.3.1/roboRIOTeamNumberSetter-2025.3.1-linuxx86-64.zip",
        sha256 = "854c366cce621ccb64fe0feb18b0d4b4b531e01b9eb58774162123ca3e74447f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.3.1/roboRIOTeamNumberSetter-2025.3.1-osxuniversal.zip",
        sha256 = "6db9a862a4abe7e566cab92e7843e7610806144f44f9f2d4704e0f594666423a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.3.1/roboRIOTeamNumberSetter-2025.3.1-windowsx86-64.zip",
        sha256 = "573dd1d5728d6515f09037235504051137e6d66b64675012f2b3b74b36c24208",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.3.1/roboRIOTeamNumberSetter-2025.3.1-windowsarm64.zip",
        sha256 = "1fb7832cc69f8ae4c0b6072968b2d1c64de282e119a80f894045c016561777b2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.3.1/DataLogTool-2025.3.1-linuxarm32.zip",
        sha256 = "b343af4cf1f501c25d8c198f7e59f9a5f24e9a5340d16b6b74b923d334fb6b68",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.3.1/DataLogTool-2025.3.1-linuxarm64.zip",
        sha256 = "77328cac05e559ffd7568aabfe52aa97dee18d0ecfe9735bd6410ac1e2c65168",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.3.1/DataLogTool-2025.3.1-linuxx86-64.zip",
        sha256 = "66cab04286e93631add31d571c00f5d13ed9461c8c536c6faebfa42b0636207e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.3.1/DataLogTool-2025.3.1-osxuniversal.zip",
        sha256 = "c0ae400abc980c0346a8c1a0c1e436ca07e2ff766c7624c7d0f98d4e4ae40784",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.3.1/DataLogTool-2025.3.1-windowsx86-64.zip",
        sha256 = "d6b17a00284d9484f051920e6b53e3fafe1ebdc397f477b3416023535d4d0564",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.3.1/DataLogTool-2025.3.1-windowsarm64.zip",
        sha256 = "72e488ea91b636988f4dccbcf390e81ff4be1aad1f4a35229e3b519de86f9963",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.3.1/SysId-2025.3.1-linuxx86-64.zip",
        sha256 = "79a6861ad5a0a0bba93bbfd245e0412b9a21f625e38ad3168289ece866a2e368",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.3.1/SysId-2025.3.1-osxuniversal.zip",
        sha256 = "b0e532c726e7e11575f4ab94a94f25c12d1dc9b9dd2374999695cfff8ea969d6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.3.1/SysId-2025.3.1-windowsx86-64.zip",
        sha256 = "d4f070f4fa81afca04c8a9fbc2c95195b8288692c13e50db88b856eea106a13e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.3.1/SysId-2025.3.1-windowsarm64.zip",
        sha256 = "a174302e5a8c9491dc701a077cd6e33c3adeffeab69dd86ab84d874d2fa53d13",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
