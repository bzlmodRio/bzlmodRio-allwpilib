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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-headers.zip",
        sha256 = "ce69ff5c022012e0aea415a848831be9b84f76a54768ca03ae1414a97ccae447",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-sources.zip",
        sha256 = "2a8834127860ae7aa4d68e7638ea14d555503be80644f35120d56be1f3c73673",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxarm32.zip",
        sha256 = "4fccbf1b0d0a1e6b836e4fff5b3e303d319e399621fd60271fb8a1bce97bde43",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxarm64.zip",
        sha256 = "a9251e194b9a96662ff1a42fd8654383b6baf06d1c3d39e0d75e9cf2381db105",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxx86-64.zip",
        sha256 = "a32e2013f9d3561c77ee59968f722b1e69af38d7d33f5f8596c9f0267675ea7b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-osxuniversal.zip",
        sha256 = "3a028a64a3839f0c48a7b339de9c2afb2445e71adef535d291ab4bd5393c9996",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-windowsx86-64.zip",
        sha256 = "7147c2562c159a6e75db345f819c5eb2b467bebacaf8b2c2985837cb59adde09",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-windowsarm64.zip",
        sha256 = "e4e3829d274fda51323c602eed846e3db8411b9f5e4e902d34569ec01ba4615e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxarm32static.zip",
        sha256 = "23792862c53a0720e81767d4f944a18a56d0130de3f3b21a99d84b6b474da056",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxarm64static.zip",
        sha256 = "db76580e2f3f7c30c167cbcc035e3769a60264a992d14fb7c3026979bce2c50a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxx86-64static.zip",
        sha256 = "c577bd6d79501cf49d0d7c88fead2c679c31a3fb0e8369ca89a8abf708f5ff9b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-osxuniversalstatic.zip",
        sha256 = "377d12693496bb076957ea578e8246849ad95baa3085a491bf7ecf5fef2db665",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-windowsx86-64static.zip",
        sha256 = "e623e697c5bec67518416b311a006ae475269e281874d6865b04d8ce104a276e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-windowsarm64static.zip",
        sha256 = "baf6bd50dc4c67e381eb5ac713b9c9769764892a9cbc4c726735b102b85eeea8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxarm32debug.zip",
        sha256 = "231200f43727bd33478198e34970470390aff9b942502361a946bc11c498fb09",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxarm64debug.zip",
        sha256 = "fa87f8cf668a508bcfb788cc121cd955390fa387ce154878abc63bba6eb4cfdb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxx86-64debug.zip",
        sha256 = "de1fb71708e675af6648f9685826967462be9a8b1aacc23173501ae9d37b5be5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-osxuniversaldebug.zip",
        sha256 = "0272c40c1fa14d6fba6b60d53bce1d26361aff8e813dfa5bc35b0a033120f728",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-windowsx86-64debug.zip",
        sha256 = "77d338d1fde20b1cfd831518cdfd1df4d0acc56b494ab75e8873e6dfb2412ac4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-windowsarm64debug.zip",
        sha256 = "18ed5a2c396231c3f808128362a3fdb69a2d1f290f907bb3b29894480007f107",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "9f6d0671b6cee3f41eb432fd41dd0f254d215309b6fe81c1176224ebf24ecebc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "76197c5ea900ee92071e9976579fdaa35fd676523574f9c9ebf6b4bff3ef544e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "6d724faa98bda94848eaae623afca578d86af157ecdad80e384a0a4c4ba9b707",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "ff7384d637802f6a3447e47939fec04f1b3f79346518465d57a3b8642560b808",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "493afdd728820ed487c0f7b624d20f82f4fb2a396ad32bde28410190e7bec1c7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "166939e03edaa5eddb8f05386515168495ccaa9d24e81894d3624141a87af093",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxathena.zip",
        sha256 = "d28e0e76d1fa9dde2247b54c075a65fbb4efeb2e0c4f0da7dfd67fdd368679b3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxathenastatic.zip",
        sha256 = "1a582a9d31f8a1327a717873d05d1fae2cfe3f1318fb05d56a6ec07e5b4310fc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxathenadebug.zip",
        sha256 = "3b5893e5206ec0e59a4c743a51cf2cf8e6c41ac49ae8af498fd4568e2a8a0b80",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxathenastaticdebug.zip",
        sha256 = "f8e0208eeb7366e5fafe89cbf95ea14041fdc84be275904d34185c83d82abad0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-headers.zip",
        sha256 = "a73e564f95a0b3d926c60ccc0d068a1cdba2c8a8355b0b6ab17855db8bc53665",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-sources.zip",
        sha256 = "fbae10ac2ecc942e0fd2344807dfadfda05d07f857aac6db05e11b4727272242",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxarm32.zip",
        sha256 = "2a282e38eef8448cbb57236e10424c750a026686bf26c15ba25ec0049f654c44",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxarm64.zip",
        sha256 = "8c5287ac899c7a26c53b84ed27ec12d3cc566b579696e3ed1ca6d373cc9c637c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxx86-64.zip",
        sha256 = "a66a06939a46dbfcbf18cb815f9ce54a28a85dad7eba4bfad8fe7511aae26134",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-osxuniversal.zip",
        sha256 = "ff49e733930c18c61b57386ce7a76083b11538cda6bffacff5f69b4a1a0b7ea9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-windowsx86-64.zip",
        sha256 = "99334db45865608c6069a324dce66613f658fb837f07f798897c2de9e46c545a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-windowsarm64.zip",
        sha256 = "c7590a0fcd10b40d5c18f94e70488738663e98b038da34013517d3c475aecde5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxarm32static.zip",
        sha256 = "d34168feb468c01f899716da785ce0dadffd29143fdda5f85ea535fab8d8a941",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxarm64static.zip",
        sha256 = "75e3b0db90a0dd5ba01a0135ae64ff0263e3d90d44cb140e058731f2ef970b16",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxx86-64static.zip",
        sha256 = "04663a7a8d2811c1b10e8f92996d097a093e4eac587dacef608123f5018096c2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-osxuniversalstatic.zip",
        sha256 = "8cae62e1ff2bfd882c9507768137bcbc52b4bb0ed6621078dff0b41eebeac33b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-windowsx86-64static.zip",
        sha256 = "76f52693522ad03b64943abca0d0bcd19500f18396e41c2acc7699ab2de91c5d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-windowsarm64static.zip",
        sha256 = "5726d6da14107969c4e5f036871161ad378628ba4131012c10d9ca53fa46ac16",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxarm32debug.zip",
        sha256 = "4114c37e45ca0a7b66da22e7269c7ea08c08391df95f800b75472f9c2eaf04b0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxarm64debug.zip",
        sha256 = "a011adefcfeeb06b0a943ecf61139c5ad5c4c871140681e20f128347de0ccf6b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxx86-64debug.zip",
        sha256 = "580fc1738267a5e340399ff6796ee9ced235199ae4204ea13808a7531e7b9fb0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-osxuniversaldebug.zip",
        sha256 = "effd33324633d6c486fd28a60c5021c29c2aa0d52b849195ab854aab1d60aabd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-windowsx86-64debug.zip",
        sha256 = "9b9d2b2daf3053d3caa5f5d612d3bb83dd26c4601c81bca3cdd6daf1e395c98f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-windowsarm64debug.zip",
        sha256 = "2db1401853f1aa0e9977ca2cf5303e28642402390f17bb23bbd21d034fbf6d50",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "9517dd7bfb690a028d6a06775e17bbd433a39cb7408de6d966b1d24d2e9c9e82",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "9b03b834fa12eb45b555c8d2ff9472abab1485ae46851a42d7fc2a89bc422c20",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "10dcb820f7bf76eabc0d9bd23c837d4c1f22c77f9dcf443f3e0d669aee5bb627",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "08c76785e0d5a044fea8c55fa18b32706358d781855505081e84335c88b93463",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "e86f9c58bdad647f002c9513eb4a08aa6f314edf971219b0734cf6c2af5f2beb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "77be13e2195360e465f70b891f800e0434003e91824818c4c3f03095a88065a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxathena.zip",
        sha256 = "f3e44fa84f21f17e1ee28b0c149088a7ffce72f77e743b7936a9f2740c82edab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxathenastatic.zip",
        sha256 = "89d4669b507c6dcaac0990f9451e9efe7a7b1c3ffcce03876ceb38e6e2622ec7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxathenadebug.zip",
        sha256 = "ed59d5dc7aed08475dccfceb6ecab09fb4c237b9a5c6847c8e259a6a48b9e140",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxathenastaticdebug.zip",
        sha256 = "ad97daf9b89fe1e7d3eef10f6a6941f0b5d516b70bc26e936a40bd43d1022166",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-headers.zip",
        sha256 = "4361eb404c91c7e9a3761fa0498d8346446355a71978b9c2f22cf9cf70ccc9b5",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-sources.zip",
        sha256 = "8c9143e350e9573fe7f54ddbbd7d04e70fc022e71310ef2562448f251ee09b12",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxarm32.zip",
        sha256 = "c98b9d3a468a7294e4a7f640ef1df769a72997ae418d7eb98113036f7016c061",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxarm64.zip",
        sha256 = "26af07afac4d7d5f9fc81538d91f1f6c070a7d8fbdf0bcc7cc235181585fb9cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxx86-64.zip",
        sha256 = "9f8c53d3d5246506909a57ef52096b6cfe80f1118e38acaa56afc1546913a3e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-osxuniversal.zip",
        sha256 = "f6336ba6a56718b1dc2ddbada24bdca2c174f166f64af8c0380da8a75b492c9f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-windowsx86-64.zip",
        sha256 = "075df3da8ac68d05768b27b2d8f8ed891d1aefb19bb379fbaae9d2284646a745",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-windowsarm64.zip",
        sha256 = "38a7a9ac0ab846371b2939d9697c7953441b1e61a77e314547437cd2b86602b9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxarm32static.zip",
        sha256 = "277eb466ea8c02afa0b7e15c5e410a90956c47233ed409f105bddf7900d7c417",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxarm64static.zip",
        sha256 = "e4d2be0dd286396f191a06fcdeb3edf4f292309302acb0de51dd4226675dcc29",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxx86-64static.zip",
        sha256 = "ee02c65648e2151ee257d680b190c5963d472c1b4d5633487ed69b4ea6777976",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-osxuniversalstatic.zip",
        sha256 = "82e6bd29aed93c9713551075498206e537b74b777f1d3dfbfa2cfbc23aa57cad",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-windowsx86-64static.zip",
        sha256 = "91c941600dac6f6e0890ae41c506b6f008f97bc292e249f0b249c4f109dda333",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-windowsarm64static.zip",
        sha256 = "ca6374de900d3431fcbed0177bc822e21886a913b4a9479c0930a5f27de1ad83",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxarm32debug.zip",
        sha256 = "9a1c262a1717dbe1e2ba24f9c0a8a02e208e957e8267e4a5c4a26bc57ce3830a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxarm64debug.zip",
        sha256 = "c9f40669afa15bcf5c248aadb4485eb89a2e29d55a8f8d47214fd206ff2499ef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxx86-64debug.zip",
        sha256 = "ed8f2166dee01d3a3731dd6da77da42a5c0790d3befb4c32c08b3afc63a5e674",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-osxuniversaldebug.zip",
        sha256 = "dab1e9b6bebb6013c3bfed60c6dc7099c0ac1eb7310ff4e3f07af56a14cb2178",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-windowsx86-64debug.zip",
        sha256 = "bc5e548e98902ff9c97e7f4c0841f20e6f2e9c970a751f21802ebb79267560b1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-windowsarm64debug.zip",
        sha256 = "f4f687b737fd93a3f226702d951b2a2944b5da8f7559ff56e583416399ad4204",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "971fe228ddf43bf52c559bdeeae5788615fead5ad2c75eb80fff045764eb7756",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "6463b8471df82bd5f7eb4a57c0f3024f0abcc911db0e2d68a1bf5e5498554797",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "7166891884f9caa9b5644ad57283f4b8cd9be0ddc98947479c3619ce7808822b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "c61905e868b899f177ba49932ef889911cdfe35d040c747b70a718124096509b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "41cd1f9b44f1f1d88df3137ea17393444717f5e1904120069ff635fbac6eacef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "df16cbf5e8b973bc02679e54af878ac74fe370b9e13d0f9e89a761808d7fc7f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxathena.zip",
        sha256 = "6b6690af2997a805907e0c8626f9fe1bb532b91c9f52c0a1559349f5470a995d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxathenastatic.zip",
        sha256 = "2ccca2a0cb277f90f5900720b40b956d6f19cecb061918528657c8665ba2793a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxathenadebug.zip",
        sha256 = "e12238a3077046f273d8db3f17a9d9eeebdb1b8b53047cd6909fc9caf71da082",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxathenastaticdebug.zip",
        sha256 = "d7567c1489094d48cffb372bffaf0b05a12d4a3bd17d2f94a3685e6116ce3d07",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-headers.zip",
        sha256 = "ce0dfa53e2c27be12faf7a02e5656fb8d5d6792826ca1dfb6529a0d1cb372aef",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-sources.zip",
        sha256 = "f524a2761f03f14ea2825fd6f0e19398d76dc0a8c45ca9932589b58b14995cad",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxarm32.zip",
        sha256 = "371df824e9864da0576a0a24ed7d91466fdccfe4b50a80ae246fdec0b9397ffb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxarm64.zip",
        sha256 = "b893d4b3ad53f68d0cb82ef277b3206672868b2407e72243daa91d9fbc5192c4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxx86-64.zip",
        sha256 = "7cf53d0784fbbf88491a29d877c995fad097d6a1bdf91051d7cf4d3566bc7fcf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-osxuniversal.zip",
        sha256 = "158e9f75995b0563a4889ea0a272385829628167eb109b9f06daffc7d8e31567",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-windowsx86-64.zip",
        sha256 = "3775bf8b1e7862031ed6a7a17de22c4c89cbfd5f7986ecb58595cd647fffe17d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-windowsarm64.zip",
        sha256 = "af49c13e0d7d0e2054632924181fc7feabc35268933ff920eb85e68e0c0faccd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxarm32static.zip",
        sha256 = "2ccdcc296ad3ff0ddd79e5b65b80b2c951c2c93cc54542e0eada6b17c4157e36",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxarm64static.zip",
        sha256 = "893e2f52e64752493edc8c146eb6aa7d7424e08fb1a47aa25fe24cd1d5b9ac6b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxx86-64static.zip",
        sha256 = "cb3229fb1c1de0eb4689092cf0482bc71ae3109976d25c2fbb387c7126698cba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-osxuniversalstatic.zip",
        sha256 = "d76bfed431f3fbda13bccb523baf24d14b6380ba77e9214817160c15db1b50f9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-windowsx86-64static.zip",
        sha256 = "54dabd584e514a1de1b532e79c5bff8cdb838667d828db55c201b43832a32161",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-windowsarm64static.zip",
        sha256 = "aa4ced37831eda5227a28363900f9c074e8b2db1332e61df58687d970092e00d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxarm32debug.zip",
        sha256 = "98d61c0ea9c849e802c32ae547685a0cb2293156e018fd10520b8a192fc402a4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxarm64debug.zip",
        sha256 = "2568bb85282ca934d5d46b274aabdff19fdbd7775e7f4a5a78544fac50306174",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxx86-64debug.zip",
        sha256 = "5f28bc4899db947e5fe42afb5915ce5968c90ef5b7404a02b5c97a4c389bfde4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-osxuniversaldebug.zip",
        sha256 = "6871d242aaea37a901418f15ee0b7a961930fe7b9a16638a04d99ab00548acbd",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-windowsx86-64debug.zip",
        sha256 = "81919a41e065cb5dbb5364ca43210e3ff5a9017f72fc932003d22e5fc63f1e77",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-windowsarm64debug.zip",
        sha256 = "586bce895f6d2f3520ad5778d423900f93925793235a470b3a888b2e54627d3c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "a0d2ee93eda52e9f709bb3816f7e388a851f16c115ec4bda0103b93171a631f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "7ca498d6aedbd225f10965293de7b4278a5dbd2dd11e3593271b7878a3e19202",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "a0b9b5baa9fd2135c2c99004dbaec541a00bc25635e7673d60e68b0c24f2c7e5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "0fdd8d09f7d3b8afbb4b61f03df5aa63314e3c99ae0e1f7f8c3a19b07d27fde6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "10fbbd4a7c13169c77207b0ad2709cd2a912177681bd7b2785d96b47775d3acf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "fe4fe248c2e472b42ad8dfc9a0036d0871255c23e5e15a7b299a84b41baa7c29",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxathena.zip",
        sha256 = "c3f61fefdfaaa9313e78cc2332cafa041fd2486fe7a69c6e0aafb608bac80a83",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxathenastatic.zip",
        sha256 = "13fec5f4aa0d04be15ec1e3f7e202266e1562e5c027b445d522cfce34252ede4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxathenadebug.zip",
        sha256 = "de4f80d756f183f93ac969aad921b773075162a89fa06c7f5c6281527871214c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxathenastaticdebug.zip",
        sha256 = "c39ff1467bbbeb124e2360b1c8e8e15ee83525811e16a69621f389174a188453",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-headers.zip",
        sha256 = "e043a6565001c3a6bae39257638c0c9ff0e4a8541e2429709792732080102ca4",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-sources.zip",
        sha256 = "467f803f4bffdb50fbe83376db65de287e3e58bbb3fbba4718bc846f55837f20",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxarm32.zip",
        sha256 = "53725724561e1c540f16d2cc3937834ae22578500d0a51085fa5dec2731ccd34",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxarm64.zip",
        sha256 = "654135179c1b4e2b83dbd3e6cb01ab20cc00079ea3e8c488df248cf28bf87549",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxx86-64.zip",
        sha256 = "afb6d6a71e8b92993f9c1cd7c2a0d06a8db3d0683889ec23be8a2734f0d49cf1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-osxuniversal.zip",
        sha256 = "bfae83a51d71ad0167bfb65ccb4555b36012067019c57252c51ba22a6fd9c486",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-windowsx86-64.zip",
        sha256 = "0e7763022842488ce518899615ccff40c91cf38a9693f3800f38f2ddb4819490",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-windowsarm64.zip",
        sha256 = "4dd0ee34d8faadf38443e78e87eadbdf67cb9566c2e4d048a1957c06e9154ae0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxarm32static.zip",
        sha256 = "a71ab6479bceaf32a34832a7a4f3303a6019b95eea9ef261bfa98cc6ae391d83",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxarm64static.zip",
        sha256 = "af785585ee83574269a82b296de9e974186f3b9203e2754244b05176b126d5a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxx86-64static.zip",
        sha256 = "6b10c705602d8b9235cf6de05d1da588005c4b667d321450ee7bfa06133ba98f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-osxuniversalstatic.zip",
        sha256 = "edb651cc29db482c9c27e9546ebe6ef2147427baf8693c4cd858d708ea681bc2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-windowsx86-64static.zip",
        sha256 = "a41909b29d1b728b8d9a28c9066783ae2277416b9fe01c421e964007d2f5e0e2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-windowsarm64static.zip",
        sha256 = "ee225fc00b97934c52d9d38bc6f617b42f63f5af31548ba04da414101c9d3525",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxarm32debug.zip",
        sha256 = "f8102758d0bea1d6b6592646bc75d003a9ad724fdf7916c2ad82b04ecaa634b7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxarm64debug.zip",
        sha256 = "6a0c41b67e1b11d2dda6f306cb8b97d89430db894551be717f16a2d6e0af1638",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxx86-64debug.zip",
        sha256 = "c0419549548a6c5e46ec2199ffedad45586ac4d52c918d0330bdbfa30e95d96c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-osxuniversaldebug.zip",
        sha256 = "417963e2ad8f3c6c91620dde48b000ff6482071abf1efccc271fcce14fa0794d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-windowsx86-64debug.zip",
        sha256 = "56811e7b49236d06bac04179057542c21cfc2570fae701e7b8cf470991f0b4ef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-windowsarm64debug.zip",
        sha256 = "48e3a9370201dcaf5d37b7c7776634cd19f64a5e3de12d4e6ab1e62a635913c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "64810e192fd7a625439b38e96146278d0c458921a0ba46e51360ef457eafb8f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "181043e0392571f273e618aa87d5bf64c00681f2de0e65e6e315a53d23bf7db5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "e5434864c235042d59d537c8aefbcac25b63af38ff9b1f6a3a1124fae9e5bd9a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "9ccb4076925908ba2d6c9c0183510baf72d5137ad9a1d8f9b0b7ffaf0342c8f3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "0160ce5cec176cbd5e5fd37be5cd9dbc0c234d3285af264ae977e7b3c66f52f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "5f4dbb687d068dd95c04e63806098c42e1d1e69d59b1603f822d671cac625535",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxathena.zip",
        sha256 = "6a3404de374b621096c34c6aceadeb5a8c181399547285d23d0e3fcfbdd15f63",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxathenastatic.zip",
        sha256 = "27cbe1cb62270ccf6e0697a567a090dcb018112e824abeee9f4b029c3041391f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxathenadebug.zip",
        sha256 = "2406d1a656d5c36deddcb6bce2c03571a87ed919a8b9a00013c2f9270cc527d5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxathenastaticdebug.zip",
        sha256 = "fc8c6eafd4427e228f0c91235f7fa7455d6bc406b4dc526d9c28302235bc80a2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-headers.zip",
        sha256 = "8adc1bb0fa5268a6a833d4e2fb748a0c6a9bacecad5ca90802f8bf4d5dce170e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-sources.zip",
        sha256 = "db7240eb086e4515e841f8b55062c8c39e98da5b425831cbdc9501c9e4a44a16",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxarm32.zip",
        sha256 = "34716d45090c14e6ac1fd99be7d83a0e00140fff557cd81aa5719b9ba9da893e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxarm64.zip",
        sha256 = "eb81ab2c74c9236dbd4af631fd71405f23b413fcb6ac91ea0522b2b34e8e5a33",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxx86-64.zip",
        sha256 = "765d0b1123b9018d61c90da2c5e25815f3ae82207cd64fc8a126653a2cc3707d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-osxuniversal.zip",
        sha256 = "d18e81536b51349fba12579249d9337214298d2be6c3b3d7344e0c3386d9012d",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-windowsx86-64.zip",
        sha256 = "ceeefb3eacd34e33dbce23d335fc644113632e4fa685ab11e07075634bd83c51",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-windowsarm64.zip",
        sha256 = "f3fc85a7cf9e67b47b77dc79fc9d0f8d23aeebb5f70de2d438d57588426b17b8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxarm32static.zip",
        sha256 = "b611ce29bdbf1bec6c84049c212f135950c63410a6ccc51228cb0bb4af006e21",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxarm64static.zip",
        sha256 = "bc06b6a97a9df380aa59752623c87c55c0f2f5fa74ae40c0509245ce4509d197",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxx86-64static.zip",
        sha256 = "7621b6a11a4e26d75c6245a05e7afd13bcb432dbba7ff3f5474bbe994796065e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-osxuniversalstatic.zip",
        sha256 = "f3d751cb415c694870cb83bbbf4bee817662fddf2668b1b320051ee3d314b6f2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-windowsx86-64static.zip",
        sha256 = "fe231dab2219c8bf48bfa156e2dc82ad63732d7fcaac5964c2cc22dcd45f24c7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-windowsarm64static.zip",
        sha256 = "54fa73f7dcb67346720eee427bb6660acfa459063f53099ebf4dd693a22b1704",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxarm32debug.zip",
        sha256 = "5fc83f2b5cb40106c22a39f547d4c15a1a1854c8e632a5eb62b03ee7b7b8af75",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxarm64debug.zip",
        sha256 = "7c903728f9eeb22ec0e411ed5a50ba5682d75d7ad387247914a63b57ebf227c9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxx86-64debug.zip",
        sha256 = "0cdc9be036318a044a15d73322932700761748ab66c1dabb286ec698ca3f5774",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-osxuniversaldebug.zip",
        sha256 = "2958e3cdefa64023aa4dcc6d68b65bea4d4d50177e8f1227c351abe7392879f2",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-windowsx86-64debug.zip",
        sha256 = "78bbe52f78411e4a8e40d545ce95f77e3be7af2ec9199ad656b73ac6b27b7460",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-windowsarm64debug.zip",
        sha256 = "cb5635cff3594be037eba74461b052d06132a629cf3b8f5c337a9a7757554548",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "adfe5dafcdd84a0cf6d293d37d07db3b50da0d4b0284808f886fee139059d4ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "6ff2d9692ec0e1ee6a8416667d9bb73115a38b4462311d0fcf7633cfa944f8ea",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "e56dab6035f4cb431788936f127b11a62bf24a71276ec4434031c6d6594069f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "d2accd8fb6715e835d8b9eedbaaea9f319d8bf4d4adacde8f1503d552a9c9473",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "a2194e8cb6160b53786a87b53815cdbea5d3dee9e4814f2fd28efb9a03e46cc9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "5fe6a25eebdc92c62da717d2522cfd4324715938bb0a36f59563df4639cfbbc4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxathena.zip",
        sha256 = "048452d1e8c260d6efa361468cf0779f0a7838aca3e1b5efb4b9288c1620d468",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxathenastatic.zip",
        sha256 = "ae247696d1c93731c1b46534cf4bcbbaec13873978bc9fcc06f7ec9b3eb5f612",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxathenadebug.zip",
        sha256 = "194ff658bdc5013ea9467b3af6b869bca4a5f1d4aaaf84b7b836c0962e2fee21",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxathenastaticdebug.zip",
        sha256 = "c3768e4b695dad9d7c5cae3bdada23b6abd1c196a7fc11ac837b6e520df4c0c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-headers.zip",
        sha256 = "4bfe1bda2f81f0627d52096cec3ac6ea8a7ae41d9e321c01638a5d9128d34ab9",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-sources.zip",
        sha256 = "61d36b6b1132609a709df29e14535408173e01e12e68b809f93846705967c068",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxarm32.zip",
        sha256 = "b7ef6753f9bc2c1b4105ef1c48e20a8f78513b738f0c01cf817f4aea249b12b3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxarm64.zip",
        sha256 = "cc3eb0c55470146c3e76d1d8fa789ba23ce1b9df3a90a3f3a1e0b80be0646c84",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxx86-64.zip",
        sha256 = "c91fa7cc46c7a4bd33217ffe38d0597f76123955a5b5297514a08ad388f95944",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-osxuniversal.zip",
        sha256 = "2f1d9517c96fc2b4592b1ccda4c36b914858b1fb238fe0f404f14b781f4ff687",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-windowsx86-64.zip",
        sha256 = "7b89857cf67dd85c339a5e00526c634197b4206ce6265942c81b1786b0b4f2bd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-windowsarm64.zip",
        sha256 = "2304a1390952245b7337583b2a98bee642706fb7696ad5676bf43416fa8a94a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxarm32static.zip",
        sha256 = "2f00889adadef1aba7edb350dc0df8bb1a55e33810fd47189de04e569d50e353",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxarm64static.zip",
        sha256 = "012d4b2ac5d62d232617f37f522c1e06697754ddbab845d127208bd59e2159b8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxx86-64static.zip",
        sha256 = "c61f81d37c9121f682d6d91f6771f54f79ab36038a46a20a347e063f86c0dc15",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-osxuniversalstatic.zip",
        sha256 = "c31285100efbf3607c6dbffc4d45df087c6c8fdbd25689187434d82a579a3170",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-windowsx86-64static.zip",
        sha256 = "2000d4063ad262d8676f1cdcc2bb5aa37c6b62206d86873590ae53e5ba69bd6d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-windowsarm64static.zip",
        sha256 = "ef7f309c1e1418c188f62a1ce55c5febfb5189bb2537c92ccbcd4e3c0b3847db",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxarm32debug.zip",
        sha256 = "0b9f91418c87a78d38b4d1a4ea954584d638ccc4787b226793e01626dc0a1b81",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxarm64debug.zip",
        sha256 = "f6f2916f9be8c4c3ed21dd22a80c9020372865f654f8076e94d092f17c0fab6d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxx86-64debug.zip",
        sha256 = "01507dded7a969a648b804a5bf61c08bba169c052e73a2734f39627f9bd239e5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-osxuniversaldebug.zip",
        sha256 = "c82aabacb3b7743cd60f1b4736f928acf07bf0062bb95411565e8ad1ea3a1af3",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-windowsx86-64debug.zip",
        sha256 = "7e9736c327bf6fa8791f19e5a186543a50b0a42335d57b7c04e22036cf94a945",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-windowsarm64debug.zip",
        sha256 = "617e0c46504373989f19c55191f2a5056643415555f4b89de8a1d0c0ad0bc646",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "5911c693a1ef5c179d5cc31be06a56c364ef699863c7d86e5170bd41b1806e6c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "f1777bea09e2e54c582b73e6da6223ed26641b6c263678e0e7a4618f441f172d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "93300e65128538272ae36470343fd0eebfbe60105f7cefcfaeb442939251d76f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "8b701894853b7f5cabb44cb384a0e047b908b2895b1228d49965cadfc5748104",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "30bcc0fd6beb38cd088fb333f1212f491767d6c69d5330f675f234bc261524eb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "0152b6107eedd5dee6c851047fd22f5004ad70c8e630e0439a70d81917230088",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxathena.zip",
        sha256 = "2767689c695fff0a3e85f806b69fa3b262ac1aebb558febb91758eb8ba86c1a6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxathenastatic.zip",
        sha256 = "0534905fbc36a0abc135c553f8d800a48ec6e52b1a6146649a8ae9655afefeac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxathenadebug.zip",
        sha256 = "56733c29ad1b083b6a655d760d609a49daea7ed2daab55cb3dd061b1f0b1bd2f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxathenastaticdebug.zip",
        sha256 = "7dccbff29c3c85215e507549b10e4e24474d632f6e1af9eab89552055427c0ae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-headers.zip",
        sha256 = "74932ee335cb682e927b46a8d7ba70edd0b05586a9289f8dd89600bed77ee56e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-sources.zip",
        sha256 = "d1a8b675f590bf3d7f13e3d9059bf9681ca277034d601cd4960783ad217531a3",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxarm32.zip",
        sha256 = "77c73ddbb952204d6531e64d28b45126ff44f53e6f58f8326d93c6eec7e8dd5f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxarm64.zip",
        sha256 = "e69276bf2b6ec14b1e611de7031b1b80de68e0b914ecea0bd2a859a2bd0d427a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxx86-64.zip",
        sha256 = "2bd6b1c90d6f184d479ef4e5859b8abd8300d128586b525e013c83fed98121fa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-osxuniversal.zip",
        sha256 = "98d63dff2bc444095e4dfb5f9cef6449c3436474f29ffd1e8315dedca694179d",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-windowsx86-64.zip",
        sha256 = "9a1ab6bb8c95ea052d0b89b09f6236d8e21a0bf41347c323d040f763a067def4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-windowsarm64.zip",
        sha256 = "2c1748e3e698bb50e8ad0727fd7efd0e18271708eac190c048aef7c4f813dae0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxarm32static.zip",
        sha256 = "d6d7290d78d10fe103a7cbc044e8b2e646fa451ab7f5eec8c90b4420245b2dc9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxarm64static.zip",
        sha256 = "8ab0b20567a8e29a9ca50aaee056c1841df8afa9346710823fb55b4e0c3c9494",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxx86-64static.zip",
        sha256 = "81697e9df2ffcd46f099546b0297156afdb28b6b06a1b194d00d7f586334926a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-osxuniversalstatic.zip",
        sha256 = "6e2fc6c4c0dd1c3dfac83936b812e771b92acf3a9301ac94db38318a3436e968",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-windowsx86-64static.zip",
        sha256 = "d77334c7873b9aef1da4d90254d17ebfd5c4e2b9d331188dc2107ef1fb4136e5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-windowsarm64static.zip",
        sha256 = "fd2f461e0354b56e100c30de3698c3710a7719756d4c8c0443ac858fe00d9289",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxarm32debug.zip",
        sha256 = "1ffd1b87ae224ae31bebdab96374b73295ee739499eaf26452c5ef660f8cdf08",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxarm64debug.zip",
        sha256 = "c12aea0186bbaecf886a03147ee6de14e5bd90d7943441c9ede0ac9962f56f38",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxx86-64debug.zip",
        sha256 = "3c7bcdeca4a593aaf88e96e35a31ad67f69ad4ea0383821b0a9aeb39fa761a86",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-osxuniversaldebug.zip",
        sha256 = "9f8c1893ccc3ce88de98590043d118e24cd020c7c401fbfe94bbe3bf600a5611",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-windowsx86-64debug.zip",
        sha256 = "3e07bb58fd4a2cbe2f3eece539bf5b5b83a277cfb4482e4adddb5ca7a86205d8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-windowsarm64debug.zip",
        sha256 = "0d6f24f4e9f520ec85efe3560ab49d707b22066b81f5a32f7278d8706dbe9090",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "58478dfdb909d6446efd18b18be59c3a6b4ed0251f4facaf43a1313a1556ea86",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "e9781ce34d73020301f065c710cdfe36926999d6c30aaa48459d7ed14e265de0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "72c315db60968fb678c7463e97f6f040e829e685b04fedf74ddcaf452ffb1386",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "eacbfaf0e39a9b786e944b1c26f84b9464fe5855a2113328d6368e8d243b55f2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "8c289037a8e5b912a830f881814e15e6390460ca5a26894d6099173529ef2193",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "bf181b48b18cc3ea4ebf44a67c57f292cf21314333c93e677a3932cc72652a3e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxathena.zip",
        sha256 = "3acf766e4f86ae91d7264d93cc1d645f4c05268a32662db2958e124663978baf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxathenastatic.zip",
        sha256 = "da4b652af95719c4b3b0d350db1fdcc9b074cac58846fc09e6e98830e153f382",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxathenadebug.zip",
        sha256 = "75a8de6bbeaec50da4dbc13f780a36b697d93ddc62a3ca980b670e38a613b75f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxathenastaticdebug.zip",
        sha256 = "28a4bd4462c52cd4c331d7cfc924544a99e41c70a053cd8ba251cc4a078f10ca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-headers.zip",
        sha256 = "33d874c5fb0a05bfb0bbadccf59c46ed53084994549a1db142cfa8acd7b65385",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-sources.zip",
        sha256 = "9c5552c5ff6daf340b08c874f028ba6a1e68a74867cc46e18b02270e085eb130",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxarm32.zip",
        sha256 = "bce7c6a601a6c531ac6c0349b02e4f28141474eb0511488e24153fe31496038d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxarm64.zip",
        sha256 = "6d663593b33ebe2856a3a44f26be3efd686cdc97137669dcc535834a236f6afe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxx86-64.zip",
        sha256 = "d6939edd1d563f9896f47210661fca7e30e2bdb8c93ed36f7a075d1084c57252",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-osxuniversal.zip",
        sha256 = "b1bf14b53b9e8a7698e34d4a13112a75e30a2c5416f6f56d1d0b59fb0a6d2045",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-windowsx86-64.zip",
        sha256 = "113390a4a8244a414cfaaa0a202fd2eab2ed5c65c4953e6ccb548a9da94c18b0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-windowsarm64.zip",
        sha256 = "b5d6d4757bec716bc0ecc57a67157e55d2d352df0feb52b0726640fd59103445",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxarm32static.zip",
        sha256 = "085b7988916c6e5eca6c6752b5140aa709cec598ccb38b9e08b3b7803caf84ac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxarm64static.zip",
        sha256 = "10d74c29b19966e1658a9e6ad4b1738b2336b9a1d7d66beeda9550c99a5ad84a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxx86-64static.zip",
        sha256 = "e87c7423fc323a18de7011d293e25f18f3287e5ddd07e5328d159f025278e2f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-osxuniversalstatic.zip",
        sha256 = "bba2d3175c278594dae0958f6d7746b1b10bd54626dad62eba929f9f05fa3774",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-windowsx86-64static.zip",
        sha256 = "f5fe806e4a6f17a997d22d37fb0d9b4dff3f03e45f748f80e661a144ec6e7b05",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-windowsarm64static.zip",
        sha256 = "c91eeb2851f60874e4b3550d1388ec2488edbe007f3fd64c22ff31904de0066b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxarm32debug.zip",
        sha256 = "6da81d9820efb1133a97e191950fe006cefb1506256be59f78b22dd293135b50",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxarm64debug.zip",
        sha256 = "a32fe48c8bceae87b9d0936dd8e05f169237a9a602aca7c41c328550340e3f92",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxx86-64debug.zip",
        sha256 = "769b7e453f23b85ac1d5fa9123419725c88b2149de9e6b295af1650375b3b9c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-osxuniversaldebug.zip",
        sha256 = "77914bdfb3f575469ca8667ba75639d4c6935634d56ad0ad7ed0fc03856cfbe0",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-windowsx86-64debug.zip",
        sha256 = "d743c4b4c85e61f016c279fb15a9d7fb53ef71787acd01dd48849e8475741f96",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-windowsarm64debug.zip",
        sha256 = "78e623e9d2bdac682f66c1640f488fa94a058ed5d39037fea89b0d2bd2bc5d8c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "d29c6c7412d48a5a956ffbc47c675c5bf5e9a8caeb5762256a24bff17a9262a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "60160f1fbdefa2ead4bb3b088dc0c2a7a6b8522894c870e1039d2366cb509788",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "10fab7d17912d2dca922ca124d812e13d84f3e44e00a70e1997fd947eea624cf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "a9ac306d3d8a61f1d852893ddd011962dd83fb2b48f3cbe98ba2aba81487e8da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "afc6cc3842a2b53317a47bc718ff246ff49aa4b8ac06415c86e9d0f4e09f7670",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "6474807631c671181f25310bf8e26c846459b594687d792cbc332852af2181a9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxathena.zip",
        sha256 = "b9445d41a3182f562950888efffdcc593310f4b165ec3908aa6a6459e55533e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxathenastatic.zip",
        sha256 = "cee488ef4edd5979daee91d1f48018459f86b277e92d829cdf43014acf429b92",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxathenadebug.zip",
        sha256 = "7339fd08cddfac741f1813454f46511af96058f121d63dbdea57ca5e4eaad34f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxathenastaticdebug.zip",
        sha256 = "24428ff9c0f61c219b03af5b7d9add4f891b0bf2e3cc8e27a175f42686319c21",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-headers.zip",
        sha256 = "eb19a64679e01714764306d4446e8113560f8f3e688559cdfae9e3bdda8cbd7d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-sources.zip",
        sha256 = "b7f753119c54195d3c17cc6011e73ebd3ec67b0f24d68f5ae882494ba4551566",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxarm32.zip",
        sha256 = "7af0121b849a6d2585814954ca9310fa61f115ec8674f333ad13ccdd736fefb5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxarm64.zip",
        sha256 = "7bcb4ec720c08cdb56f1a1a976ac76300d5c6e679292becc4fe84065dce9948b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxx86-64.zip",
        sha256 = "f53bc4da59349e549cefc630a4f9aee1feccfd040256ff1a100ecdc6ede45692",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-osxuniversal.zip",
        sha256 = "2d69b7b3271ac684644c1f43593d8d354e302bc7fae2433a92b001a9e4ac0262",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-windowsx86-64.zip",
        sha256 = "d503887633189ecb0943635e5d8e9f32d18583f19c384a39c8ff7c9379b05af9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-windowsarm64.zip",
        sha256 = "e72767b3be0257df593eb714cc3a44e17a95646ea20e84b57288bd9d74705ce8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxarm32static.zip",
        sha256 = "0f7843b485ba54d62a31a5bec0e14f2c8959ed8405c2381a8143fd30f4ee6f23",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxarm64static.zip",
        sha256 = "bb0c9bae1509a64afd1944e1f6002ab8e3460967dd5c2c2be9b550983873b204",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxx86-64static.zip",
        sha256 = "977a8c46a5d0fbd3de544d0096a88a179c9816e5b95a68f8c69cb93a049511fe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-osxuniversalstatic.zip",
        sha256 = "35d68f36b4275e6570e04b4d45e859bd3e05c2ba1a2314670054862f2e73c8e6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-windowsx86-64static.zip",
        sha256 = "3cec9412a776638716c5506c8b379bfed4b00571260a1551d4a9446caace5d10",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-windowsarm64static.zip",
        sha256 = "76d4daa04376acc57a2aa7b699e59a8b88689e3e2a1c939ec50a1b4da30c93e5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxarm32debug.zip",
        sha256 = "b031d0af4e54900a78b7cf63d2d891be78d09051adc024b32a3cf66ae5404ce8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxarm64debug.zip",
        sha256 = "441e9576e31d54149b4b53a2fd3894df98a98e3d4ad272bf3fca17c3a20013b3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxx86-64debug.zip",
        sha256 = "6abe3ffbd92be5f6bdcd247351f995a9ca054acc5a21f10d3a8db990ac5435ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-osxuniversaldebug.zip",
        sha256 = "72e259ff2800a565d9a63ec670c7a02a22ce4e4e870c4ec82ecbd39e3c7366db",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-windowsx86-64debug.zip",
        sha256 = "88c1bbbf105d47995fa0ffc6845a3399e6ffe3d96c8d5d82b1395b3200fbb4fd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-windowsarm64debug.zip",
        sha256 = "761727cef0922006b7284015da05d4d61ad2e9aa5357eee682c0e521187c31ad",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "fb7d49a34f71a95ed9ac8fdc055bbd09927d8fea0e439659e278e64c50eccd6a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "632e2944ad58fcb535b6f668cfdc1694b4da42afae81b17ad6b836b07ed25439",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "26533b2f3e1a1c0651a9ae28e894fee099f7b75558c365ace4341571530f1e0d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "6efd91d8bc39183e180f35fea8304168b151f5b235f4e95ca327a9ea9ac3924b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "5116139575695ec598f57c242b301b5af4c8b4ec91bac80191e0744a23898628",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "2f3323bf1ab156bf6849f985b2e00e2e8de97369ce339f8df36311d3ca77711d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxathena.zip",
        sha256 = "241ab85a97ba56f6d8c648ecf9ba0ebcbd2ad8c4d24f1faebfff07c0dca96dfc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxathenastatic.zip",
        sha256 = "939a15e5d7bbb62670e2f5c818a9632ac51ad48d12b2a073b9927d4c50ad6e9b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxathenadebug.zip",
        sha256 = "ba35259122614f7d7e33b31f6f5ef2e93f1015d479f2b3106b0df38236be2de3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxathenastaticdebug.zip",
        sha256 = "9dac67ad546457ab2f3e5338af552372b8f23f47a06f94f2e516afbe8360ed3c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-headers.zip",
        sha256 = "6e7f421c5c5e055be09bfede958fc78fe0472062aa44eef69c0106a9434b63cd",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-sources.zip",
        sha256 = "ab2574409a4b03857706a7301b586b94ba730d8065f2137883c3f9d3aba72b05",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxarm32.zip",
        sha256 = "0c2a083da1f559fa4c5d9d92dbed3f7933eea46f6ec6acc74ec5468c8ed8def5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxarm64.zip",
        sha256 = "ff7eb0f8bfd414a56480e8a47273d625808f5a82ec601e8f3967e2b34907e80f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxx86-64.zip",
        sha256 = "752b0c13ba82dca4ce6477b08a67533d110083a7513f4ffeefbe974ace74892d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-osxuniversal.zip",
        sha256 = "12426d794cf72f4fa2b688073f419a59c260690d497434a7d3e61b85f7c073ce",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-windowsx86-64.zip",
        sha256 = "fe6133292ede0bd2eda393dcf23c6f1ac548a83baef39481b272c9edc5e303a0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-windowsarm64.zip",
        sha256 = "b2b653770c248c1b72624359800f83e06f97656069a4cb58399c34cb7d0ecb63",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxarm32static.zip",
        sha256 = "66cbb1fd9d155a03915f59bc0a34e76028c3436e509d18d38ce2914d021a887f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxarm64static.zip",
        sha256 = "db869704ed06a1a8ada6d0f6d9a51ad0340543372d9f985ef13262fc45e06e50",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxx86-64static.zip",
        sha256 = "5571dc485a9a4a2f1d78e212272d800023f25d217ec36c17aca28c96a6d23b11",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-osxuniversalstatic.zip",
        sha256 = "bc7d2792328060222b8b449a55caa461a0f9cf490d3a9e09a3de7fa40c2d785a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-windowsx86-64static.zip",
        sha256 = "59aa6b332637159d9fac780b333dbf4006d6e779c5f25a1b4b539b5f0631544c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-windowsarm64static.zip",
        sha256 = "cbc2df919a3c8f23d4ed31f3eeb19ae166d2dbb20ff224c7750cff1ded84ffaa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxarm32debug.zip",
        sha256 = "095bcf0d8cf5dac983094ebb2f5046fb4f7b90994987bdbce5278e9df635e2d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxarm64debug.zip",
        sha256 = "ea3fbbc7da24074e3da855c3379921e4f1de66965bd6c8c2eda8fb9da20d3f7a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxx86-64debug.zip",
        sha256 = "9e970722c456950bd2f294ed4b1951353d6fd796124aa19b9d36dfaf1c7099ca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-osxuniversaldebug.zip",
        sha256 = "5a51b96a02d338503f36f18c5ffe71a4ffd21698f38ea63bc43c376cbab1073c",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-windowsx86-64debug.zip",
        sha256 = "7279a70079c302614a0960eb34b3bf80443e033e36a1061cbce5792c2f0ba3af",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-windowsarm64debug.zip",
        sha256 = "1ee313b717f549a3a1400fabdd415491c40db340f88e07f58472cfd6453ad45a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "cee81d89522982a4662791511edfa6dea0d154d335598cc416ddc996950b9bab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "78c9a104868379bff97b9ee75cc608123878d69b67618dccb35f95e8e35b82b3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "79ddf44c53fb87471a15215ec16afd840f087982cd4b60a1fe7f5ad1a5361a60",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "2a8b1da2edcc1077ab3cd20ab74a69a7990e6007c7bd73b52a0a4623bcdc6483",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "940fdb937c2004fc2c5da7171ac351e2051bc1477b96bf84201ab29411dc4a50",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "11ba11e1816b04b36fae40b499410606c86dc92335b61a13ff33419a33df0def",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxathena.zip",
        sha256 = "19e4b25110b455ec29fd261f520de81b2d5871d47437489e52c0ceb3bf12ffb9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxathenastatic.zip",
        sha256 = "73966159d8888e088f8740a83dd9934a06260d4286b4e4db5105a53be5d69c89",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxathenadebug.zip",
        sha256 = "08f7fc0291f53169fa4694524b607c057aa10b661a280555509c9a9059318b27",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxathenastaticdebug.zip",
        sha256 = "23f24373592f76ac964c379eb4715adf06ca0bbd81ebca7d0d51d90b761588b9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-headers.zip",
        sha256 = "f59de954b85733bb8fcb95e936495df074a42df7086262ced0033063faa7a827",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-sources.zip",
        sha256 = "6118a687d6aaff8eb4cdae13d6b117295da1b53923fa490b8ae91a2ff1e7b46b",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxarm32.zip",
        sha256 = "87c619bb0a0ba527d513b62d181e1d96414c11dc45cef2d8b9ab7645400963b7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxarm64.zip",
        sha256 = "a734d49156f26c983757e06537475c75241e57402a32882b4367a07a5a20817d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxx86-64.zip",
        sha256 = "226c4f06b9db96e21a55de67da8798206e1a01700ff9bc11597869b5ea1e0b29",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-osxuniversal.zip",
        sha256 = "82bf6d156cf5a40256e42ab96d6898526d9238b8b567397fbaa2f6824b45958f",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-windowsx86-64.zip",
        sha256 = "acae8f416856e53cf90e24779ac79e2e486dd64f92d5e91ea1888a31ceccc8a3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-windowsarm64.zip",
        sha256 = "0fed2275a51d675d053a05700874d0b56b194c63966bd711e99df3317044d3a1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxarm32static.zip",
        sha256 = "0629347a0b6dcef6a613637500916997d7bef951f75b9c06b121c313133c50c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxarm64static.zip",
        sha256 = "7f12c327d6e4aba6a6eab0739c842c922829dc7aadf41bf62f41952f98b7d87b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxx86-64static.zip",
        sha256 = "d99dc702b64fb661e9e9f653f73480d9b12c4a6e784bce9e6ebd646807ae96bc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-osxuniversalstatic.zip",
        sha256 = "158ef1e65b5433da6b883d3bed1445dc15ac3f200d1c4044d3d8ee49e62dcbb1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-windowsx86-64static.zip",
        sha256 = "18a361133418986b147a983a8ca6e79ff45a737acfd16ba8e8307eb15bb5db64",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-windowsarm64static.zip",
        sha256 = "a9e8195b39664f178fddcdc8cdaafad40985d157b158bc0d5874226843368a60",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxarm32debug.zip",
        sha256 = "aa6b00ea6df40368d3d1cb6aa46ce7a9aa20278f2593d22346e3cc18d941e3c9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxarm64debug.zip",
        sha256 = "d7922918f8caf7713288618ca279a431a7410075ba83906073a8ea2fca418174",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxx86-64debug.zip",
        sha256 = "b15e35ddfb6548d3ee4f3f303483aebaa203602d1cd2f5c1218cd719e5494153",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-osxuniversaldebug.zip",
        sha256 = "b61e64301f7c41dcf4061974180e5721242d6ed89f1dbec733ca2ce520bc32f8",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-windowsx86-64debug.zip",
        sha256 = "6e37af01b888070d98ffb8ed69b18e130f6c3b78b661467f92348a29b138e649",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-windowsarm64debug.zip",
        sha256 = "524467e6225a4fc896f744b1fd14f2fd30c7ff374f159405ce803e61f1c37443",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "f98d1fe84b0f67a124d1b24070eacd3e27869323379d39ba20e71f505e417fde",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "8538bd247f6612722a1f4a6e0ede8951488777259c75bb72d963df241e13dddd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "bc4f7c77bd8b3661f7cecd4546c53875dc9d5dc70a3ea4034f207a0c55dde585",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "3235e3f0013f32904d1d582642f1c23ae0e549b879d8b83b84b01fb3b63567c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "ac1bc7fa642c177fd54451c110f8948750066c66525adc6c03016012522e78d7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "d6088296381f921e2bc848e4a5432dd2753ea31706495798798a6cc8e2837da5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxathena.zip",
        sha256 = "6660b8c39fec12d422ff4b40530c1f446c54bca1c41b5287298eec5b8cd8f2f0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxathenastatic.zip",
        sha256 = "5dbec255113dc035e586cafa129990592934d0938443244dc48ca6de26246377",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxathenadebug.zip",
        sha256 = "c780fe05c73b143ec3aa3d7694fb1d74b3738ca0bdbf580beb836a2a7831e992",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxathenastaticdebug.zip",
        sha256 = "ae5a08bdbef5e1fcac7c4a45e3b35ee89be718a65320b67f34507c7fa0530a0e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-headers.zip",
        sha256 = "8ca66035488541af84274f318dd1a6cba40ca518db91958d22296abcd6d08a1b",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-sources.zip",
        sha256 = "f5cb0baabbd28a71546ffc11539f78f3ac8553b65ad591cd63be1a9f0228d7a5",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-linuxarm32.zip",
        sha256 = "e555cba13b592bba99aee9f8a2212ff5eb24ac7468fdf74348a0093ecd0dfd69",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-linuxarm64.zip",
        sha256 = "3bdadc6bcce76d8f04b0794a6ab1942f48db7f15753929dcc845e8415315170d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-linuxx86-64.zip",
        sha256 = "9224ea324bab4f5ca5c5af505867d8c043b297ddab2ec237ad962e8eefc4e9e1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-osxuniversal.zip",
        sha256 = "957e34eda46815f2b9e440437679f3377c395a636b9ef05a8fd05eea735d91bf",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-windowsx86-64.zip",
        sha256 = "b76521c0d950d6416e09bd6283468e7d0d63ef5dbd6b2525d3eeabfc288bd25b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-windowsarm64.zip",
        sha256 = "7eb20babfd3c64b38a4a2004de4e1fb378830b1eaaf69e36b33012c1baff6b3f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-linuxarm32static.zip",
        sha256 = "714eec2cd7fcdee5cf6b90eb2c69035c5f7d756fdb3bcec39d7c93ea9e6628bb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-linuxarm64static.zip",
        sha256 = "338fb23b7f99af435f1e3346bebd575f715d05d1f09f2b29460a758a6f1ccbed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-linuxx86-64static.zip",
        sha256 = "fdd9789e479eb9a70d5e5567a6c8bbad6df0b1155e92ec248324892176228ff6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-osxuniversalstatic.zip",
        sha256 = "447f08f583cdc4da1bab7635a8f6ba6d3a9867f2d2aebc86d1711d8f1c63f9b1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-windowsx86-64static.zip",
        sha256 = "15e510cd9c3f5bed33d6b4bed3f8d80fd870213b33f58259be267a4eebc020ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-windowsarm64static.zip",
        sha256 = "3c322720d5feacf34612a37fa821b64b3ce1e024843fc627601501033b0a520d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-linuxarm32debug.zip",
        sha256 = "7873eac09fcc6c436fd7bddc5644632ea3f353a2127d90939cd04a73c4e99c19",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-linuxarm64debug.zip",
        sha256 = "e6d4188bd41259e6a73182a7fe4bca1a9a9a3bd87538a7bb739768b32c6a7e5b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-linuxx86-64debug.zip",
        sha256 = "ef78355c125743bdb2a45d69d4199a64e446cee4c70e35ad3ad34eea3371865d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-osxuniversaldebug.zip",
        sha256 = "720f9cd4843e89ebd068877e7684e68a2ac52620ed0dec3dda193111c8c86fef",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-windowsx86-64debug.zip",
        sha256 = "a7ea6d535d7c73cc835a4ed8abab3070c3d0c990f25b8012bb9652d89a3da7dd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-windowsarm64debug.zip",
        sha256 = "6bf54b6ced22eec82472649db9ba95cbeb810585aa3cd62ec5a56674507e1a40",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "fc784f05e8813a8b0876bb65f8be07b752df9bdf2db0019ce452cf59075dce00",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "e59cc35fb3b5351a2a731d793676b856e546d755bd94e9c83ef465e65135f406",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "797918df2a18c7a3343ac82a879426ed5debcf096f1ea0272951763c5d24007d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "201fa9766973213b432a88cccaa217f1431edc52605fffe41768a2d2d827cd35",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "e212be2ff5ef3bed5a994561a8bb61ecc67223dd74b035b89c29bb0e1be608b4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "a1bea379bc43e0d14be3e44c2f532b408e0eaf46ce8b2cc512e966c79fc5fc93",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-headers.zip",
        sha256 = "d0239df56558f0e331f53869a841dc21d26ee1adf105ca56351ff642ddc6899e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-sources.zip",
        sha256 = "d8a40c69c8972bbfdeb53b86007bf0f1a334a9d77a74eea2bf8dfc22c5d50554",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-linuxarm32.zip",
        sha256 = "d162f9b25f8f8b7250b0314e6bbf74ebfaa85f778c46f341c87a09ec9de77ba8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-linuxarm64.zip",
        sha256 = "4b27bb0eb08e2e898b08be9eca51e7a05ab0e46fe707d41fb229cd215d74923f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-linuxx86-64.zip",
        sha256 = "f67dcb42ec3a952b635a974721a6b9edd0f70336462a182f14444cb29b7f48f2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-osxuniversal.zip",
        sha256 = "79b4967122f85fcec1cad70c9e544b857b41ed2a5dfa601b7550e99a5f8860b5",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-windowsx86-64.zip",
        sha256 = "e9cd04bfc43a5d9dc8bb79b7177000a7ab290d63df4533400afc292af39ffb48",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-windowsarm64.zip",
        sha256 = "194743884e34d2723cef472786081033ea8660d97f5c75588827b0508653eb73",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-linuxarm32static.zip",
        sha256 = "9d665d6e5f5ea119c6845eccafddecdd483d58a63707ddf8f993b4a65101fc16",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-linuxarm64static.zip",
        sha256 = "b53423d4ae01aa0e7149ed38a9e0dbe0adbd7d010870acdb5849462d42d3603b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-linuxx86-64static.zip",
        sha256 = "7e4fad48d2d1e34c820d4035640ed2b8f37a44801a9914121be513184d227a3c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-osxuniversalstatic.zip",
        sha256 = "0a4edb18512dc8fccf449afed47bc2e29e3a4c3965164e72d18802f46cdf334a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-windowsx86-64static.zip",
        sha256 = "3d07591d96a7fffac85426243764db6e007cbc167ef32e0b4d6c01cec3fdf29a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-windowsarm64static.zip",
        sha256 = "eed0d89b47f570403a57c3df11c019bf7c172cb3b9ebff0f5d968a257eaf65a7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-linuxarm32debug.zip",
        sha256 = "bf1ed7433e1bd6140a58035b74ef0829da95e53f7a65b4ee2b5a82389166ba24",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-linuxarm64debug.zip",
        sha256 = "729dd7da13d33b270f2177a4c7d5d6d6082477e7627cc64dc0394e55eb2e0b28",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-linuxx86-64debug.zip",
        sha256 = "85f63172159bbeae4c559d167f919d0e8464496bf896482d3d5b53da519c0cb7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-osxuniversaldebug.zip",
        sha256 = "2bb4d5ff8bc66f3f59149dc3b4d028a61b1968e8186ae0616859088281819fe1",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-windowsx86-64debug.zip",
        sha256 = "51fc103946a0df51fdab217ad26c7d20f668b28f0428f8b0eddcfb7de191e5ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-windowsarm64debug.zip",
        sha256 = "0b3064dc5c8ccce824efcbceea9935ed269b0f942eabdde8e4d792b9401e61cf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "b7082b9db152515d65f4830b2a5100193aa72b0eefb45eee7e57b646c887485c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "2a09377ba2c4d3eaa1aa776b0a13f8ad85b403c8048c17dc474e5a0b2a6673cc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "59071473a10665c4a08bdb805b26fb0a38259e58cbed98317c685e7d988ba16f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "20334f0a0b2d0d3681819bf7ccf439c949042394ce80830a59633bfbc2a1b098",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "c8e73bc38b7002d18e746adb30c3ec9f57621ef03e4aa1d91a2f92c65cda6af4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "b77e1bda0871467e79aae64a93894c4306b8e11c0d2d14f58e63070f2a0da8b9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-headers.zip",
        sha256 = "b509d9a61fbd2256cb00b989b42923d98b68c74652eaf2873b22f5db725ec58a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-sources.zip",
        sha256 = "ac00672123d5b4e628c46656f0611b7732e7aa2f5913a11bf2ab1414ee394a95",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-linuxarm32.zip",
        sha256 = "0b9184bed6cc28ebc27e33d126ede036b01405c209c4a611e37e7f5f9f0a4334",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-linuxarm64.zip",
        sha256 = "c72579e4bf8a71157d203aa31222036e518dba742cbf52be61e4c166749be4a0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-linuxx86-64.zip",
        sha256 = "d1482369786b6900a26aa0ce19c5c9c058b8f6b4a9ce50f2631aec87b3a28a70",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-osxuniversal.zip",
        sha256 = "f67ed6599e5ad99e4575a88fc07089fcb9728bd551a6564f76e68cd98bdebe23",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-windowsx86-64.zip",
        sha256 = "42420f51d149a877e366e94794e2e92f0ef7787aaa7de8f3e998d5aba51f5585",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-windowsarm64.zip",
        sha256 = "68628f9d81e6e2c0441784e485e69455c6f57558b55476b96319757e2f223d6f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-linuxarm32static.zip",
        sha256 = "60cd01bdd45f21de71d40ee0e9ab9c286b1f2ab2e3d4bebfd913edf7d22b520d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-linuxarm64static.zip",
        sha256 = "6ec6baf1c4b599cc724c97b8d56096d87282c89b97d2f738c94e654f4fca0226",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-linuxx86-64static.zip",
        sha256 = "c89d50e1693a7a2b76a4f51cc6dad960c25be81abc79b10100385a9c547560b6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-osxuniversalstatic.zip",
        sha256 = "19d7dbb8ddff188a7fa70a6ae8952a14d40f32d703ff34ace2a0eb89b5072f9c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-windowsx86-64static.zip",
        sha256 = "86f06aeaf3c99d2c5497feaf0a92feed61ae970626e56ec2458ca6af0b9d0333",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-windowsarm64static.zip",
        sha256 = "5830dc49326828d3f911a6b916b71c3df24f02df68d5b60b00598566dbaf3d15",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-linuxarm32debug.zip",
        sha256 = "7e26b3ff358d79ea86f08cc0395d4c6a842942c8013a40c03c7c6cc2e3365ddc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-linuxarm64debug.zip",
        sha256 = "0508f897bb55b7de1b60a7b7bef90e57943432527eae038a0b2517e1401233e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-linuxx86-64debug.zip",
        sha256 = "02341b0166d38c4dbcad69f719ad64d9f1030608c8f414c733818a73a202a96a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-osxuniversaldebug.zip",
        sha256 = "8cd83a13040fd117f1aaf2672232838d177d2a7118c062e0ae00520ea608ccc7",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-windowsx86-64debug.zip",
        sha256 = "a2e75a13992b3be4b4e94bd0681398e97414b5600743d4a24f9134e2bae80f92",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-windowsarm64debug.zip",
        sha256 = "c4027ba0ba5f33e97ba6d9941246e1443b005f075a58412481b33458dc2b03e2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "ef5210baa13611a9a102b31457bfd7dba5cdee15194b568c5159d59209b74290",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "3d9a17859405ee7a840462e7b9d8cce3b2ed379f7efa949f9a485f393b215279",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "f55149968dd4b3add0e73e01125e10ae4397ee6e02d87e3e2ad97af09377a019",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "acfbf4274cc2629f83b189dab4b8671d95e970662edc1f671ff9cc032c896c83",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "a94c7fbd215461901da2db17075b328bb9250b66c015c48c8479fa78f3b3b3d2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "5d9c9a0c6987ffe0f4e96e1ff4107578b95b769b47cf22dc133260a8aa6868da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-headers.zip",
        sha256 = "746a48b8d5440f051aa20d707c4d9ca4612ce163ed6a92d6d1262e1bf4e17bb9",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-sources.zip",
        sha256 = "ac1bc994c6aa5f18c0bb3e049c6c7e82d2e1ffdff8f03c818cec8cd53dec818b",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-linuxarm32.zip",
        sha256 = "f5b46e2c11c49c2b9ef7107fa4da7fe4332388300ce8746813cd0867ee34ebce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-linuxarm64.zip",
        sha256 = "a2d3bd01d1127d1c2a46a7fdf7aad5ebc4188e19bc5c23fa4faa2ed97d0d76a5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-linuxx86-64.zip",
        sha256 = "b497b8fb007f17fe9682972b748848e77681648a9b5372c3ec5c7cf3e29906dc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-osxuniversal.zip",
        sha256 = "97110065c3539b27cea22c4b1b4e8a0e56d9baca23f025adfff407688a7169a9",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-windowsx86-64.zip",
        sha256 = "f0937a41c92903f5687cc66407c0ad20b681fb3375af2ee9318bd5bfb955e110",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-windowsarm64.zip",
        sha256 = "76c2d7571e8b39a560ec5faa9c67ad7d854f3cb389c1ef732db72cd59f287c02",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-linuxarm32static.zip",
        sha256 = "a8733aeb491af7cd7336452802d7ac36fbe3f3a8d6a6f47c668469954f97e92f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-linuxarm64static.zip",
        sha256 = "c6d3723a265c2e1e19be8280e66029282922fe8470451f2544de54156d5347b1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-linuxx86-64static.zip",
        sha256 = "5ad81718e6f8feadbf40638266537e6a8aa36c984b1cd920891991db2dcaf539",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-osxuniversalstatic.zip",
        sha256 = "4fa25e05a635b282b5fd6bc4b338d49574710cbbcf94dfdb439a47de232135ce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-windowsx86-64static.zip",
        sha256 = "261a34030053fcaaa5c3125f5ad017288edec6e04b4c657e82e1003debae264e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-windowsarm64static.zip",
        sha256 = "2f75fb3a234ffdee9a220af071b7312e691ef72a16ac2723cfe12604f3596196",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-linuxarm32debug.zip",
        sha256 = "1cfaca78dcd5d1d6f675e976b0059109376e0b5ab3dae9a09c0aeb13221d96e5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-linuxarm64debug.zip",
        sha256 = "4dabfd1864c2614c4e4ca9577a009cbd5cc0c32e4e2e96454a34b32cee9fd4da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-linuxx86-64debug.zip",
        sha256 = "8b933ec592e9a51ec4ce7d6268415be430fcbee1d671c0a30ca21f8bf252e333",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-osxuniversaldebug.zip",
        sha256 = "555208406dcd120c1a89788575bef0135529f7b740f3e9ca3b2858987a56287d",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-windowsx86-64debug.zip",
        sha256 = "188194b8b20c21962903a36c7deccd18e41207e299de557fbd9ce501a0976582",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-windowsarm64debug.zip",
        sha256 = "a8ebe45c7e01529bb645af5b48b8646707dd456b53d6b634a8e70fa5cf3f9ef3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "ce1abc5ff065324d6f7739b565d49b43bfc5ca280043221699b9c6d59015d18d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "ede74b21445e600829ebeaf279cf33261ce3e8abcd24298bc36570b94fe0e75a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "906fbca494b8604d878741e1cd491098be5417d3fe27f109c725c2538989d4ac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "285c19132b5343a3287f5e82b4018790d9918d120f22f540a9f8e0fbe929263d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "5a92f4cf3405b7ba74f7b54a2c2529b3eae0a9c1a82d1555d855503f4dfcd85b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "79ec9fda267fc2ac8d03d4fa74e99519128f33a5934e9017a127aae9f1760566",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2026.2.1/SmartDashboard-2026.2.1-linuxx64.jar",
        sha256 = "57a888009b64b995582bdc0380a0f9151a022b644e61bb2802ba1b3c02a5cd7b",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2026.2.1/SmartDashboard-2026.2.1-macx64.jar",
        sha256 = "39a6a6d9df57d246711d1fe8543246eb7924bbc35f201370605bdabbbd0ef3a2",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2026.2.1/SmartDashboard-2026.2.1-winx64.jar",
        sha256 = "01c2b764ad5cb39c3d3a4d38ee199533fc36e301593a86eb41cf606bdb1537ce",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2026.2.1/PathWeaver-2026.2.1-linuxarm32.jar",
        sha256 = "feeae6abb540d964fcef911d8e0a36228a5ffcfd9a033bf5603d7a24ef0620b6",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2026.2.1/PathWeaver-2026.2.1-linuxarm64.jar",
        sha256 = "0e74dcedb191989d2476ae74e12bc6e6dcfe8b457fe79f90286a5d4cb4cda2e6",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2026.2.1/PathWeaver-2026.2.1-linuxx64.jar",
        sha256 = "6c76f699ed809e9418552c0b53780c78e16d2b3d99bb81dce0ac5042c724aea0",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2026.2.1/PathWeaver-2026.2.1-macx64.jar",
        sha256 = "c15ed5df77072ca9330099678a89f08cb647498dbd2a1dc6a13064b616328ef9",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2026.2.1/PathWeaver-2026.2.1-winx64.jar",
        sha256 = "55c519104c7795814d6e1a3875f255a42281f77b2acaf4a92befff3579eb3123",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2026.2.1/RobotBuilder-2026.2.1.jar",
        sha256 = "f94594a76ccf248be314531f1e46965fd6bc824cece09be60f5561559a0a603f",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.2.1/Shuffleboard-2026.2.1-linuxarm32.jar",
        sha256 = "3645b045c9fd9fc39801dabc9f20e5eca619b057b72026faf6bc1daa421135dc",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.2.1/Shuffleboard-2026.2.1-linuxarm64.jar",
        sha256 = "ae471ebaa30ba3e9bda5027cdf9da93443fa24dc05c90d9d137428d104085aa4",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.2.1/Shuffleboard-2026.2.1-linuxx64.jar",
        sha256 = "810afa5283b50b930b5777529acd1d451004d207c18bba72cfc87a44dd33fdd0",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.2.1/Shuffleboard-2026.2.1-macarm64.jar",
        sha256 = "b64467590c562a0e19517972912d957977cf0c69c920e94ce053632988945026",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.2.1/Shuffleboard-2026.2.1-macx64.jar",
        sha256 = "cfded729932810ec1ae0e3f3ad13f754e39ec93113b46ad1f07015298cabfcf1",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.2.1/Shuffleboard-2026.2.1-winx64.jar",
        sha256 = "8948d05a89420420b65853d2b5d529f0342ca185be8595440d66837eadec5361",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.2.1/Glass-2026.2.1-linuxarm32.zip",
        sha256 = "770dfd314a5b0c435f9f3816239e0d45971bd883b492ab1c03b5c105961093ce",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.2.1/Glass-2026.2.1-linuxarm64.zip",
        sha256 = "41690cba05c21cf42abb759bedad5ec7f87a0436c147ccf54a091fa63f9351de",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.2.1/Glass-2026.2.1-linuxx86-64.zip",
        sha256 = "4be90a5995910735614e9d0648b056d6a0bc4140ebb08071c46c652ef99c00b4",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.2.1/Glass-2026.2.1-osxuniversal.zip",
        sha256 = "2a863218308d8c23f4ecb4ff49532d16739b21f24f218cae2d9412fbd816dd5e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.2.1/Glass-2026.2.1-windowsx86-64.zip",
        sha256 = "5becfe7b1f151a2ff09d835a00b333f8b3bbc5ca01d8f6bebfeeb2bc0ae56e88",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.2.1/Glass-2026.2.1-windowsarm64.zip",
        sha256 = "84b99389f2752a06e96f66abb3682b995048759c94ea205dba10a86420639b90",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.2.1/OutlineViewer-2026.2.1-linuxarm32.zip",
        sha256 = "9943b6c028ee61a7b8fdc637be846a80ba4b547ab5e01a030881587c0507754e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.2.1/OutlineViewer-2026.2.1-linuxarm64.zip",
        sha256 = "f16733ffd363e4cff7f387f238a913005ca239e20b738721b11492d1da1c89d9",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.2.1/OutlineViewer-2026.2.1-linuxx86-64.zip",
        sha256 = "dfe7da9dbf4424c3aee305f7e47fabbe43467bcf8a1ba07dfd8c9485ec4d7d8d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.2.1/OutlineViewer-2026.2.1-osxuniversal.zip",
        sha256 = "7b9975f25fe6ff87988c90ba49fe650706ed55a4838b645a58648098c32cb93e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.2.1/OutlineViewer-2026.2.1-windowsx86-64.zip",
        sha256 = "4e0e253ffac624c3dcf79c0da1e2c2311cb53540a7a4e3f83eb8bdd79075cb67",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.2.1/OutlineViewer-2026.2.1-windowsarm64.zip",
        sha256 = "3f2abaa7674b20dd8b6031e98fa552225b18703d12c6588818bc35f86977671f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.2.1/roboRIOTeamNumberSetter-2026.2.1-linuxarm32.zip",
        sha256 = "fe2dadd1b50916203980811cdd7935321d09337e11e8ea36be4fe8daf4e0c6d8",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.2.1/roboRIOTeamNumberSetter-2026.2.1-linuxarm64.zip",
        sha256 = "1067dc6272ef254a4931f90705949f28f08cb6b23b9d5346aecd140f05aa2c25",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.2.1/roboRIOTeamNumberSetter-2026.2.1-linuxx86-64.zip",
        sha256 = "78b4e41c00d065aa57d1897861215ded97a9774522bbcfd004cc8c69861de4cb",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.2.1/roboRIOTeamNumberSetter-2026.2.1-osxuniversal.zip",
        sha256 = "ce69239aad2780f30a9865f505129bc33b22d9cfd4035bc2024ddbad7ba3f164",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.2.1/roboRIOTeamNumberSetter-2026.2.1-windowsx86-64.zip",
        sha256 = "ae3ed5217a729132f3c85da2df2a42adc501e3a0cbcc79bb78647b1562452eab",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.2.1/roboRIOTeamNumberSetter-2026.2.1-windowsarm64.zip",
        sha256 = "4622011c9e42e24abe498173cf0c9acba58db24e6bd4ba9de60b56ba36211cab",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.2.1/DataLogTool-2026.2.1-linuxarm32.zip",
        sha256 = "3142dfae972a523e3a0b5a272af62e7c375e073e7871d3ab9feec8e7b65404bd",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.2.1/DataLogTool-2026.2.1-linuxarm64.zip",
        sha256 = "a0ab9c7421d086b092f52b5642ade47c254dada9b9859a9cfe248658e7201b2c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.2.1/DataLogTool-2026.2.1-linuxx86-64.zip",
        sha256 = "808504e303bac444bdb378bf9b1a08b30babc2d1ab0bb5f9ca4e43bf9c7484b4",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.2.1/DataLogTool-2026.2.1-osxuniversal.zip",
        sha256 = "322e188967bc3c43a788cebb8fdf487aec227d43467f8b531593b0bf162e6357",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.2.1/DataLogTool-2026.2.1-windowsx86-64.zip",
        sha256 = "038e0dc2598d33c3749b39d3ea9a042746d25cf4e4855cac1384e70624a29af8",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.2.1/DataLogTool-2026.2.1-windowsarm64.zip",
        sha256 = "524e4f8e1250812a12f607f112657ef1105cbcf75b8d8ad7ec51d11f7f90f446",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2026.2.1/SysId-2026.2.1-linuxx86-64.zip",
        sha256 = "c39ef4fa42462d9486cc2002452a80ac60cd5ed8643212fa87765b2f5aed4e3b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2026.2.1/SysId-2026.2.1-osxuniversal.zip",
        sha256 = "15181b7b633ba73ab3de06d6eb744a3b2418efba0d38bd075605d402c63b54f2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2026.2.1/SysId-2026.2.1-windowsx86-64.zip",
        sha256 = "b37e225ed144bf73e3804bcda402d246718359574ddf3a91dcd971f443137368",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2026.2.1/SysId-2026.2.1-windowsarm64.zip",
        sha256 = "6e27ffcdc54087bb842151e7f1045f707df7b20753d80cea0ba0cb929c433fe3",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
