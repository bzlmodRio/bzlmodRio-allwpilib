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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-headers.zip",
        sha256 = "075659b9d2222755babe9d37ed042273d866828a21caf1855fa5c5f2a9ce298a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-sources.zip",
        sha256 = "27e99799837ed22b2e108b1aeff2011e15443362e6cef59338f1e3aebd39a41a",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-linuxarm32.zip",
        sha256 = "8750f0b5a12aedac3f2c81b2ab41fbde929a8566b059a3a2d0b34ce6dc5908bd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-linuxarm64.zip",
        sha256 = "6f46d2d964bef4bd28fc88091461520a07376d771a97612c0a00bee89f69b0fa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-linuxx86-64.zip",
        sha256 = "9249b62329cbb0391993e5b73eec5b66b9c0fd4e5beb30bbd1aee93b7b5ea0eb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-osxuniversal.zip",
        sha256 = "36b0fb76cc8946b1570dd87cbf8862aae1b42a97dd5322deebd8914ccfbd5455",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-windowsx86-64.zip",
        sha256 = "df698392a8856fcd1bdeb745038b133185ce2c7f28da8d3158aeac562929955c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-windowsarm64.zip",
        sha256 = "46cbf339158c5ea143a79536309c2e5f9b9dcdec2362dd492733485fc0ce434e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-linuxarm32static.zip",
        sha256 = "5985e6f166840933c48543f3016989bc3c2c8256ead7c53371f49366b6119fa8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-linuxarm64static.zip",
        sha256 = "ac5c1daa463bedec5a1083ec47f297593151049f87a4b2cd5f71478abd60f719",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-linuxx86-64static.zip",
        sha256 = "d5a63854f7f8f1d408810f9ffcbd586ffd755a8d94d160bab91da6189a90c3ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-osxuniversalstatic.zip",
        sha256 = "b082760d1a28f98ce64796867d905926e52b51abb593be0835b8afcf8af3748f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-windowsx86-64static.zip",
        sha256 = "6a68ab061e198eef0951da604dfbe3f72b4c7de1b7f2562c1c71092755669083",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-windowsarm64static.zip",
        sha256 = "b92151fbb9f5f7207d0db28c467a3db098f15083a26594458a4f3fc6140b48a3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-linuxarm32debug.zip",
        sha256 = "f00d79dd172d219f3528d34b1db34af3d1ccddcc3cc7a2d4b6b15248593a455e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-linuxarm64debug.zip",
        sha256 = "7c7bda5c04418cb5997cc4dededb0af3b172d1c7255a4d9186e85c5960d3a5a7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-linuxx86-64debug.zip",
        sha256 = "c51151319fffd9dd1e3dfb5a41c02905052dcc879fc602f018978abbe2e9e789",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-osxuniversaldebug.zip",
        sha256 = "9f101c695143deb1c50e36c0113b802a173d21efca87a20b5e75bb715cb5b102",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-windowsx86-64debug.zip",
        sha256 = "2681c6e788e9b24da980dff01cf22339e9f93c674458394b3d4f7042f55c2bbb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-windowsarm64debug.zip",
        sha256 = "fa3768a7d7a041eeb9609992747291ab5b7bebb7648015e6e08676838b8d11c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-linuxarm32staticdebug.zip",
        sha256 = "12c1df9782f9cb00da7c12ff9a23d13f8dc28ba3f2c733c0700c51e1a82adb30",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-linuxarm64staticdebug.zip",
        sha256 = "b2df1c2710c44105d2d5b61168fe918589d045142df6d7a985afefbfb8f9fa12",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-linuxx86-64staticdebug.zip",
        sha256 = "3a3c134481d68cbdda44a594f080019323f96b5fa135eeec10fd818898276961",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-osxuniversalstaticdebug.zip",
        sha256 = "d7e5318fa103b692496466b4b88cc380faeba618732a72605a1f4d296c99b02a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-windowsx86-64staticdebug.zip",
        sha256 = "109067b4f984f18916113c9990165e2568bfda1284706bc898120c5d116abd97",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-windowsarm64staticdebug.zip",
        sha256 = "6e36be3ceeee18bcbb3e0b4576d5359d7e3babd22c1a157724f5752c8b89876f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-linuxathena.zip",
        sha256 = "7a6bd7aeea4bd45c44b20100da95441f01ce36f80ac5b67d8b594d7c9793a9f9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-linuxathenastatic.zip",
        sha256 = "2d0810a42c2b063f9a3d78060c44f6ad32bf2b50b79e8881dde17469da3d25b5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-linuxathenadebug.zip",
        sha256 = "cb0b1b93a225a85539a0f03befc22a8583ff0c4c58c1593ccdf0a66350904e9f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1/wpiutil-cpp-2025.1.1-linuxathenastaticdebug.zip",
        sha256 = "36dda5f2d5c695fe81c3e183b1c99228a48798cf0017734daa7f99dedff106cc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-headers.zip",
        sha256 = "882d405f0f54fec96fd1e47963183335fb6414c3fb208115c795a8c333490742",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-sources.zip",
        sha256 = "6df9c0fa18141d86306f6b7a3a890cffbace8063669ac90898290be90a68ab4d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-linuxarm32.zip",
        sha256 = "e2c7f765433cd764cd25097dbed4c7712ef94b12698af942f7746379482fc539",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-linuxarm64.zip",
        sha256 = "426344e171b9b83eb3a011806f90a9361c2aefe6a8a3707d92ea4e3d3cd66e63",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-linuxx86-64.zip",
        sha256 = "17dfa5a8fa799257ed2eeeb7c20e0a9b227c9b5a4ac9bb90e4981c429af01174",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-osxuniversal.zip",
        sha256 = "daf547512fef384c1dca8510a75d493b39c3d8cca87f01bac2b9b2b645b523cf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-windowsx86-64.zip",
        sha256 = "dfdac815afa0497d2a69c56b4f0061e20e879362e8514eb8d4ac70bf4b9a83ac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-windowsarm64.zip",
        sha256 = "6f492487c6ccdc75f6146d852943b8aed1bc5de57fc0b1ea527fd44552793940",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-linuxarm32static.zip",
        sha256 = "8e4bd3368601ec56c9ba8a7fb2740abc64d624df9f2d8c879087c9d5af977f48",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-linuxarm64static.zip",
        sha256 = "d1fc134c3303a1aa8642d1cf1e30a41198ac3179a5d932fa88bb45d457a13259",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-linuxx86-64static.zip",
        sha256 = "fcbca99f49fe2af54f10643b733127f497f508f6577b00b3b90e646c8a4d5298",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-osxuniversalstatic.zip",
        sha256 = "8bec26d1c79aea5bdda246134bb9371f865388c7d1756cce615b8919187a2127",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-windowsx86-64static.zip",
        sha256 = "7d6c6ac0baa38e1cc6a98e4d103d8dad3d7825c7a7ad26dd5922dbc14bfec153",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-windowsarm64static.zip",
        sha256 = "82e067d30cc9543aa96411aa71102ae8d4a2492e03a39806ac6936646efe8806",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-linuxarm32debug.zip",
        sha256 = "f574ac16509fb229dcbd5572af6075b47b63a7f1e3168197c3d9ba9d6a995638",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-linuxarm64debug.zip",
        sha256 = "3da95fc546fb4532388434932c5f6df5b5e146b65516c1ed81288df082a0ea9e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-linuxx86-64debug.zip",
        sha256 = "ba0378729eda3034f61fbc1f9bc45b2ddfefccb3f1c73a6156446065b494d8a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-osxuniversaldebug.zip",
        sha256 = "088a22d9db94e222f251dc441fab6591d8c17a902bd3076368b5b46ef8218512",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-windowsx86-64debug.zip",
        sha256 = "86bad171060e356663fc20940e2090a9c3c1d108557eee609f4317cb2c335c3a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-windowsarm64debug.zip",
        sha256 = "c73ea457b0de7041c399f94ab24ce62d3cae8eb9660c9f3e0693a208a9459e37",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-linuxarm32staticdebug.zip",
        sha256 = "78169ed93f6cf3cc7eabe1ccf0aac3d59dabbf461f1e543b73487ef624adcee5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-linuxarm64staticdebug.zip",
        sha256 = "272e4e2beabeda14df59e84c2be854b1765019532a3c7d1db1cb1e6147ef882d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-linuxx86-64staticdebug.zip",
        sha256 = "7e7019e856b0a411ce6473098d322b12c4ad85ef19671216032b4c2b60f2e59e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-osxuniversalstaticdebug.zip",
        sha256 = "c08b35f591778a2597099ed311da37b464a22ee54d8317df018560644d270e61",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-windowsx86-64staticdebug.zip",
        sha256 = "db9bcd9599c28d4f97848a8191039ec8cc748732a943667e3a4ad440e231106c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-windowsarm64staticdebug.zip",
        sha256 = "7f45ee77cf02d29c606919ffdcade25c66975f6078ad2751d0f79186f8d0b025",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-linuxathena.zip",
        sha256 = "3c4b7314a13d2bf67d7a170378970a4d10e596cc0f8afbc4b9bdea373bb8a78e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-linuxathenastatic.zip",
        sha256 = "e2fc91d25da4244df4e6b27e2f233c4dd8add39c6ff379284755cf27d888173c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-linuxathenadebug.zip",
        sha256 = "ae6afcba01d02a7c559cea4e26e6f96a3c5dbed5406689eb10854adb978e693d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1/wpinet-cpp-2025.1.1-linuxathenastaticdebug.zip",
        sha256 = "07e3eeb495bdc016297a8553fd140ac05cc1b1df83fe427e377e55032e9485ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-headers.zip",
        sha256 = "47364e6e2253c3408b22355d85a7979dfd0a70376f963ef561d7ca346d01a068",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-sources.zip",
        sha256 = "8aa343a85bee85eb6997e7193c407f302803b3513fe1612b110dd004d254ef4b",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-linuxarm32.zip",
        sha256 = "e63137e6d9d4098446cf7579bec62fa8f7901d2d8b4495310b7bd5aed467620a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-linuxarm64.zip",
        sha256 = "d5995c0772839cf1cab4b7dbd3eeeb3e4f1b9c12139922de05a5082b425d5155",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-linuxx86-64.zip",
        sha256 = "9922482772e0bf8c7aedbaa4e69b1c73c67566aa75d002b237ecf7a0c44e58d8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-osxuniversal.zip",
        sha256 = "02b464f80ba7a5ada85e650d50b7433582e81d1e34f6c82de69ba00ced662a87",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-windowsx86-64.zip",
        sha256 = "e30db8aaaf3d211696693f51b6ce3e5acf21abcf8f3204c544735c2a13742ecc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-windowsarm64.zip",
        sha256 = "ce8f3335af317f40f109a751d8ad155b1f4fac7d6ce47aa5079810d71d5ef579",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-linuxarm32static.zip",
        sha256 = "db7f7f05a6728ef025fd9367138d9aabdfbbeab7998c307f62d5235afef936f8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-linuxarm64static.zip",
        sha256 = "7dd0ec84c58050790a335fadaef43b996a7b0531ba3b0b98326f2899adb04d0c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-linuxx86-64static.zip",
        sha256 = "e04f2e02ba9adad91404be87f20ff4fa389fc479c2809ff228de180efbe59642",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-osxuniversalstatic.zip",
        sha256 = "3c08ccc14dd705f3a17fafb5cf34cfbbad4d36979158dbf34721ee9afb14f2da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-windowsx86-64static.zip",
        sha256 = "3de1dce963323f9ec5ddfae1ebcc9d73bd600f643e198504cd68167aa26323cd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-windowsarm64static.zip",
        sha256 = "fb2d79ccbc2ed3778c849b983857f1c7432ec8949efc6bcdea1bdd838617b9b9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-linuxarm32debug.zip",
        sha256 = "a1719835c6f4abb991d972efa37a60f4d185abe1870be82c13e860b150068509",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-linuxarm64debug.zip",
        sha256 = "091aca3ab2c8bd0d8055890c4b4d6bf412544d400d4148c21eea004a225a4801",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-linuxx86-64debug.zip",
        sha256 = "349ed2a162e90b01cf08e33a7cfb97442b49e1a00ed0335ae7d0ad7ee9053056",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-osxuniversaldebug.zip",
        sha256 = "659a2cedbcb205bfb018136900ab74f40fe9720adcbe47e0cdfd8b736bcfb579",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-windowsx86-64debug.zip",
        sha256 = "e46c92e08b992a6ab68773a0458a6d274606778d9789f63ac28fba5fa3079b43",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-windowsarm64debug.zip",
        sha256 = "0db00f463f80e7ec362f3b9378bf36167ea54555285b0cb39310d374c95f941e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-linuxarm32staticdebug.zip",
        sha256 = "d001805d9738079b1eb2436632aa3b269f4bdf2371dc98bc045e3c0a70f0298f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-linuxarm64staticdebug.zip",
        sha256 = "5fc19bd6661fc9935e54e5c1f389ed0f2c30359d322ea83913eed13f5a3c85b1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-linuxx86-64staticdebug.zip",
        sha256 = "d04457d330d43c29a9d1ff49b560b7e151c1a87587603558d6ce057c6b7a75cc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-osxuniversalstaticdebug.zip",
        sha256 = "56cd5ac814131f8ee963f246aaaa4d8cc5b7606b8ef567c280108a84a145ad49",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-windowsx86-64staticdebug.zip",
        sha256 = "b64751bfea5f3415f945463c23f2e5def827d48e7c20446ed15e197a1e338555",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-windowsarm64staticdebug.zip",
        sha256 = "484bee15c4e8df9c9079f6ed2bc4c425afd31f43b142038e14af17f4b08da675",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-linuxathena.zip",
        sha256 = "a51bcedb0e8f4ef9f719a8d8a7797964d4fae832ae6a983076081636500af495",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-linuxathenastatic.zip",
        sha256 = "6702e948e13f93d426746d31b8f03d1139a053e9128d646b3854ce5da90dcea6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-linuxathenadebug.zip",
        sha256 = "3563c4d8723bdd0f4bf5340203da6332893cc59e407c2879d773aaf3fb72353a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1/wpimath-cpp-2025.1.1-linuxathenastaticdebug.zip",
        sha256 = "d60c6ac0470f780fb205d4dec37204c7e18b2a3985fdce5be993c6be57d05f8d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-headers.zip",
        sha256 = "1d21659c0d3a45fa62f3a45e2617b533a8735c9b28a85b6836f38e015f8d8c61",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-sources.zip",
        sha256 = "0b24c8785982e5817be59acf8443785b9543ea26994d971ada46e4976c1dda29",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-linuxarm32.zip",
        sha256 = "a804c72fa1da286b1e3db0fd06fdcb822b694c038985ba5a1f6a896fdeb85df4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-linuxarm64.zip",
        sha256 = "489c72d1672d781bcf3eee4385c35a48fb2003352267c6a876fbc1a30876b665",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-linuxx86-64.zip",
        sha256 = "a9b7b950a82a552141290cb5fbdd28ae6b14164a574984cace776b1522643645",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-osxuniversal.zip",
        sha256 = "371a7f1ff9a0ca3e869ed129347656a561e0824f1f739a3e66b28aa31d5a24b3",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-windowsx86-64.zip",
        sha256 = "a6af4a647f522ed4fbd609185e76f1df6d74b9edbce38d533336843e0914acaa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-windowsarm64.zip",
        sha256 = "81d78fcec564576fa467789d0e0da19634f02433cbaa85ff3a5acbf92331eb2d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-linuxarm32static.zip",
        sha256 = "fbee1386350f6cb076afafe68832d40441dff76392f1a31df5149ad2baee4d3f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-linuxarm64static.zip",
        sha256 = "44d7477d1aadf30bcea4008d92525c583001f94832b6e6cbd089e1ff1423aaf0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-linuxx86-64static.zip",
        sha256 = "4169b058c28ebc64ce26856bf8de408079440736f27abf1f30d79a849c6135ca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-osxuniversalstatic.zip",
        sha256 = "478994d5d1441d6bd90d1168a6669919230f3597a985997b95357d8d36765b05",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-windowsx86-64static.zip",
        sha256 = "ddf474e554bda77aabf3c28ea72d4e330b3a1f6b42bf0b5ea4b83a599e5f3779",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-windowsarm64static.zip",
        sha256 = "f3070c5d0bfd29e7be92d896922fc70565e310de8b600f5f9f303c5e08f56197",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-linuxarm32debug.zip",
        sha256 = "01fcf9fd12d779b36d5931e5c3ab6f40b50dfa06e2686f33c08c319bdb7f302f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-linuxarm64debug.zip",
        sha256 = "1cd91cc39c7800d23c10adbeaa254edfd7ba6f1ef29f1c9e2a1a42655583c54c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-linuxx86-64debug.zip",
        sha256 = "ae9df44dfeb9401e65240eb71f731cc09cf39b54b8711971b5e1faeda3761482",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-osxuniversaldebug.zip",
        sha256 = "5124f51c39e0bede4e7e683d9ca08d79d995f1d1c832b5d2dcf48dd9a1ced7e5",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-windowsx86-64debug.zip",
        sha256 = "fae1bf9e5b7dfee30316f24b35fdc841eeec13c22eac1e3c0af013eb1690622b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-windowsarm64debug.zip",
        sha256 = "94f3cc29050d11a2861db4ef56ebe0197d1141076c9aa93f8e3dd52f1ccd2cf9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-linuxarm32staticdebug.zip",
        sha256 = "8724e2a076eb1e20dc70b23a342b8e30f6b4c837d2ef33f9062b46639c5da649",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-linuxarm64staticdebug.zip",
        sha256 = "47e5bdfdc6bccf90a1a138bf5220f5a99b0426a1045ab4a28e7c76ba12f1734b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-linuxx86-64staticdebug.zip",
        sha256 = "43d99463349058b9070186d46c859f42f30ab8e394005bd9ffb121b34e7e0a14",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-osxuniversalstaticdebug.zip",
        sha256 = "1bdc90bb60c9193f879620464ce4d43502e8c7beafaa85c61b7875c734059735",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-windowsx86-64staticdebug.zip",
        sha256 = "dad3912e4d022b3ddc137a98660e9be06c7b3f1e59eede76b5b771fdaa9250c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-windowsarm64staticdebug.zip",
        sha256 = "029b081b882e0b2b95cd4b60214ae664dbde06a269b1596cb963c107f272920e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-linuxathena.zip",
        sha256 = "c92a6811224957bd49e71f7bf99a5f6a0c861c311dd05a44e16a3a4277206954",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-linuxathenastatic.zip",
        sha256 = "59e7bd632322ba26c6931f098def4f97a1e572606c742af330f0b105681e7a25",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-linuxathenadebug.zip",
        sha256 = "aafc5a793bcffa01470143d05698f5ef8526560cf2c74569d54e7f6479b946c9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1/apriltag-cpp-2025.1.1-linuxathenastaticdebug.zip",
        sha256 = "70d21bcaa42986e3a4ececb14940e7e2bd4d24849bc1affca5d318c29a66a3be",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-headers.zip",
        sha256 = "6a43a5e4d952a66ecbb4ab07da2630ee081dc4a6b674de5d1b1c6ee59e7868ca",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-sources.zip",
        sha256 = "e1ac04b74525c3ced7cee911771e82cc6bf682e0d7ea525cc14acd564fe8c037",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-linuxarm32.zip",
        sha256 = "688e903eb15fa8297e4dd88a8fbb4324049899e6b14fd59d1ad5cffa00b58e69",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-linuxarm64.zip",
        sha256 = "5e66daf8b3a73df7bb27b85d97fbab5a587ff3537e7b3470f5448528929b9007",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-linuxx86-64.zip",
        sha256 = "5f603537af07c82f966e17d9846f283a73edaa6d0d51bee151253c426c893f80",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-osxuniversal.zip",
        sha256 = "7fd1ab56181672985bab54968a33117c5759f72b235d10710af3986d99ee35d9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-windowsx86-64.zip",
        sha256 = "916084ef06119cfc7d53dfb0870f90fb7b0505d2e134a430f748b1788dd52bd5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-windowsarm64.zip",
        sha256 = "7864cb31a91a731278eec187ce5e1c64fb792155b81339b6b74416fa2cae8dd6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-linuxarm32static.zip",
        sha256 = "72523ac9216f0e5571e49dca14758c1e382657d068a495e653f6dfbf39e5f806",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-linuxarm64static.zip",
        sha256 = "04de35c00c13f278883a1c3fcd20be5b93b2b5fbccd201883cb154db9e6aa005",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-linuxx86-64static.zip",
        sha256 = "e6debbd9a431a497af623015bcf1099ea4200788278ddc07d6317a32f32fb20f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-osxuniversalstatic.zip",
        sha256 = "db50b317915e19e1c1d60019c800c0f5d31c1f8f418b15aaef6a9279eaf1f06a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-windowsx86-64static.zip",
        sha256 = "26827196f80098efad6f2d13d6de2468bb1466ce58cd8cc69a65b62a2a1ce949",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-windowsarm64static.zip",
        sha256 = "44070a92cbb6c31929a4251769f80732cfb6bf5d45037aa5c72d83d914dafd78",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-linuxarm32debug.zip",
        sha256 = "5afede92d1fba06a2342034f77f7227968abd31d573d524239992e137b349ac4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-linuxarm64debug.zip",
        sha256 = "9aacbc91b392fb6548ccd277ba3bb3eda1108e875cb16ee0b3b493f567acbb9d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-linuxx86-64debug.zip",
        sha256 = "d2360875e9562c7470d19be41ca901753ac46a0a7ef2b8b0799419af9856cb78",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-osxuniversaldebug.zip",
        sha256 = "29075e3b322863154af4799b8d4ffd0516233360bc6a993c9a1360133d7e6935",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-windowsx86-64debug.zip",
        sha256 = "09850fd83accb823c54615caede4729d2c3e627ded13865d47b8e786b57a2fa8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-windowsarm64debug.zip",
        sha256 = "0b800134d19dd56f1bf73346beb2c54c537776017dc9323d00934f60875c722d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-linuxarm32staticdebug.zip",
        sha256 = "721e7f5e42aa80b7819951e839e91aed25d73a03ae2aad248b1517093023a7c0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-linuxarm64staticdebug.zip",
        sha256 = "15a673d54ca5f0b3e73640173b60a16fb433b1b9482b64c901cd23910ebed8bd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-linuxx86-64staticdebug.zip",
        sha256 = "69aebe2b34923f517e4605b6ef4fa2bd613d28429e969f1cf0c272a42f82aa6e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-osxuniversalstaticdebug.zip",
        sha256 = "a1ea6beb36ab4a0a6297d624a36567376b3673d3d9310a083b9ce48c624cef09",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-windowsx86-64staticdebug.zip",
        sha256 = "c0724c4444255f3d79dc6b61faad3ed78ba3c8d257f8728f4d37d25db081e914",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-windowsarm64staticdebug.zip",
        sha256 = "51ab6597e3a26adf442ef9e56edc57238fea7390bd154ff04ad142e19b6f4f53",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-linuxathena.zip",
        sha256 = "57defeec6b75f75001c7cdf711b57a5bb7fa68aea093741ad19e5196ef175ec7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-linuxathenastatic.zip",
        sha256 = "0e804eb2bc48c5a93e734dbe040d54ddc079f8d72027e857486dff7b6e3a358b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-linuxathenadebug.zip",
        sha256 = "de44fcf5800edbd81a517c4f8a531c44bd49c176dcb07e22a668ce080545316a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1/hal-cpp-2025.1.1-linuxathenastaticdebug.zip",
        sha256 = "ea77a2480c01a08b5f55f59d2d937b74571e0d2b65540cb7de9799bf9a7a0835",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-headers.zip",
        sha256 = "a495110b703f28bf28d686cedb0c7a9b65c19a3f4a735ffaa946fd7dc91cccf6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-sources.zip",
        sha256 = "aff36b27f0b124918287bd6ee651f001cbf2b8d6e11a760f38a139e243ae0a15",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-linuxarm32.zip",
        sha256 = "07d47ae85fc3d0b4cac39151080d3b76a49adb2faca6e11c8748435fc24cdecb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-linuxarm64.zip",
        sha256 = "307ec34373c83482f496b78030a4bbdb2fa278ee46cfdf4c73a465da0856c472",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-linuxx86-64.zip",
        sha256 = "ab2addc05defdda0e3c6648bd97e3aa2fcf8b39a0859337b6dbe2af5c5f57606",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-osxuniversal.zip",
        sha256 = "bc2123a8f22fcdf68311517cabb8b7e8fe0a85410703ebad7237d2114805f26f",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-windowsx86-64.zip",
        sha256 = "0ed8eca8dd284a20fca4467454c2e78f20aa3104aba8c840086a1af23606624a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-windowsarm64.zip",
        sha256 = "2185e1028d65f1881ffe63218195f2b59d5a1472c3b2e11b01cf8acc586c3c00",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-linuxarm32static.zip",
        sha256 = "fae9633366b1828b469986fc5fac24dc7de31c92d03ebcad3c74585bef478ad4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-linuxarm64static.zip",
        sha256 = "d5acfb2fc32c63b8bf5cf171b3773114033ab01cd2f2082f79998cccc31109c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-linuxx86-64static.zip",
        sha256 = "e02c7374f4d16bfb068c8ca49cc360bc65f9a6f522c149143f12611b8231c8de",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-osxuniversalstatic.zip",
        sha256 = "53382679158712ce9392ef98c035d15a6bdc82f91501750e574fcc55b1ebc64a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-windowsx86-64static.zip",
        sha256 = "49616f814c0d039626f561d2f22a7be6c64f45c803a2ce07e470392999a1651d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-windowsarm64static.zip",
        sha256 = "c045ab9df800e7da0f69f931d3179112a69ce5c0bb62f161a41c59b9df97d653",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-linuxarm32debug.zip",
        sha256 = "0dd8033fdf2b777940cf0c2f265f43e7399e07d24eedf4d10ff049e8c15a7daf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-linuxarm64debug.zip",
        sha256 = "036bfc10efd7ea682d77a2a0333937261e37d0f5b8e19fc3f62b7125742f8a03",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-linuxx86-64debug.zip",
        sha256 = "2f51c9d011fd64dea92a848da26bc7b68278de0d66ca1179d25f1b664cfb46d5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-osxuniversaldebug.zip",
        sha256 = "703b1ba0e8dd2e7cf5fdd9f1cf38da130a35e6dac0585d75359bc1eaaf6dc697",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-windowsx86-64debug.zip",
        sha256 = "e717715e9ab859b3f2a89b030fcb129b98cc2a116045374026dcff04d553fa4f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-windowsarm64debug.zip",
        sha256 = "f2d1a814ea2680b904816f751ada705426f45c3d825d39895ab047cb545117f4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-linuxarm32staticdebug.zip",
        sha256 = "911b81eb20882dc09cef6a31be62d696f1b4eb6f080f4992c835952f73c73bc0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-linuxarm64staticdebug.zip",
        sha256 = "d4f4f20e5b6118b51cc200f70ee98f0084a6705c692cc37c17f5b072c51488ac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-linuxx86-64staticdebug.zip",
        sha256 = "d74dcd8591be2dc51235cd70e903650f7e123e882f2edbbc22b5879101894f97",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-osxuniversalstaticdebug.zip",
        sha256 = "93450bb5c9d9583d1997486e0b6dc54d7ac50d9898a5303e9e52a4b7c544e5bf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-windowsx86-64staticdebug.zip",
        sha256 = "cd0b7e59517f6d23ae549a371b853f35950d3655c7af5f82296f38604fb6e889",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-windowsarm64staticdebug.zip",
        sha256 = "a37ce9883dbbc87c4d930af408e1416060d98ebe9434b79f7715a86c886679f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-linuxathena.zip",
        sha256 = "cb8ab788819f109d3fb88bfe489dba3491f730618c30a45dcfc6e1bfea6bb3ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-linuxathenastatic.zip",
        sha256 = "9b7b31127bf82d2e4c7e5430a587c74d53831b974b8fbb511b8651a1eb6a1bca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-linuxathenadebug.zip",
        sha256 = "1af6d8b74980fb8d254a966d61439718c4d332494b3ab423b73625bbe7c5a55d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1/ntcore-cpp-2025.1.1-linuxathenastaticdebug.zip",
        sha256 = "85c148ae1f335a58c386ebc1eb375827582d42fdac42e7b9deaad3d4b14d136f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-headers.zip",
        sha256 = "92355911ab618974d7cfcf5567e121a68ae376c5c7ce44953a6ac76a12539db6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-sources.zip",
        sha256 = "26bf79c18d2d567c6a3117cb030de1bd0e320b3043bb492d19a1b68464dfaf07",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-linuxarm32.zip",
        sha256 = "e93193f317b9f3e2a88e932c0be9913ac7fd9a197d516b49712a700dec270e4c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-linuxarm64.zip",
        sha256 = "911556b823055f40abea2f81fe3461d6a937d2c762e4ad7821af8dca3425c761",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-linuxx86-64.zip",
        sha256 = "7bc3515b9c8a15f840c388bd48d696c68834d0a7f2e351833fda5a79f6061ec6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-osxuniversal.zip",
        sha256 = "23820c6ef4e3dd0213105ce73842dba1bd55936aea1258c8b49a6e672d87e353",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-windowsx86-64.zip",
        sha256 = "ae4858436c6ea400ff33630673fa484ffca90b2457211d356a3faefd64bf7222",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-windowsarm64.zip",
        sha256 = "20effc59aadd4d060a1b4877d3037c91ba8ea3447fa84a637123b575d91bf6ac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-linuxarm32static.zip",
        sha256 = "db296036301fde2124f65e1cc88134e69465bc120b12c3bfe58da1bd6912f4e6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-linuxarm64static.zip",
        sha256 = "5d9022b79211b79621631eaed85a5f4a9887f9bb5b45c8a753d3ccb0faec6d6c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-linuxx86-64static.zip",
        sha256 = "1ec9819e193d1aedf8711f71eb19d8e03220326146200398011b3a8c7cb3fd3a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-osxuniversalstatic.zip",
        sha256 = "e0fbc30d9d90e099e4b0f089d7ee3f159d4b09690ab4c63740a35d247bdf00e9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-windowsx86-64static.zip",
        sha256 = "3f2fd79a618fed1707d27a711e492bde7b060dc74f8e4fc17ed5bb6b90833e3c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-windowsarm64static.zip",
        sha256 = "b2f9e00927d11054d0617c4d85dc7e6f17995426de463b308e32c25e6010f341",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-linuxarm32debug.zip",
        sha256 = "129af64a56bbaf90cfc6a2c17885b16fbc21fd1d297aea3242b939268da5b9c7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-linuxarm64debug.zip",
        sha256 = "8f926c199cd8f734b673699fa27ad79721b36c247ce50f9e2162ce906f120f78",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-linuxx86-64debug.zip",
        sha256 = "a5d6e8df88c2ebdfdffb2e99fe5a680157c2513685bce33f67673b6342562e71",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-osxuniversaldebug.zip",
        sha256 = "2b9eec081473f9f5c49da0dd679dea0b748c141cdfb209fd5159cf01effbd079",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-windowsx86-64debug.zip",
        sha256 = "9bd7950b8aba269e9d1120e348aefb2e301e8310b5c7921dc61de3d66501fa6b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-windowsarm64debug.zip",
        sha256 = "6553065137a9a0ea89d255e1b5463474f16c3a19fefd09a4cf1fd95472e552a0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-linuxarm32staticdebug.zip",
        sha256 = "cf0ecfa4ca1e3e1a94aa7cf942067ea9eb169139e3488e06e5aa2b2d471c1186",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-linuxarm64staticdebug.zip",
        sha256 = "90be73b6cae529bce96409c172a3b3fd604b66c8e8fab2bdfe23a978fe23b97b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-linuxx86-64staticdebug.zip",
        sha256 = "5a3c1cd73ca015aad4ee8642d533b1b3ed095a36ea4cfa6f91111a438c77c1eb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-osxuniversalstaticdebug.zip",
        sha256 = "588b3dfd92540fa7122cb177470b7d8032f40c33f6c032fcc3142198eee4ac08",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-windowsx86-64staticdebug.zip",
        sha256 = "ff4d38240d5f3cd00e6389defbcb6c32c008caeec0933b95abc49e56858035d7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-windowsarm64staticdebug.zip",
        sha256 = "4bd578d02c4dd1e237e6a7554c2766c6c4e37ac90cd4aaa5cf79098440cf6ff2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-linuxathena.zip",
        sha256 = "652d1219c869c4b637cc235f193acce67aaf1bcc2d8bede4c5f13d665cb164fa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-linuxathenastatic.zip",
        sha256 = "7855251c2281f76337579f2b21db0938b2be87b2741d1c8d86041366316dd99d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-linuxathenadebug.zip",
        sha256 = "1e51d00e7c049faecc00ee10f39832ab6c0d40a52ccba5d034e40ed7fc2ee1ef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1/cscore-cpp-2025.1.1-linuxathenastaticdebug.zip",
        sha256 = "331c9323c1c5ddc476f13be50c436ed02682becf5d7c369dd2ff0261b5dec050",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-headers.zip",
        sha256 = "bd318d49c0d1b1595eef0a17e2db0984a62668e835ce574f2393a0226259fb46",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-sources.zip",
        sha256 = "70f026565e8a498658202cc0cf8b8949759f73c649b8db2b01814ece837b1cab",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-linuxarm32.zip",
        sha256 = "ec12ff7bb64677d62e6bc24521f7997c283c0a3eb0d16bb65ad0737dc1a2cf3c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-linuxarm64.zip",
        sha256 = "f25efff0a202794ccea05c4222f877a36a71f200c9d1180498dd4ed00d944a10",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-linuxx86-64.zip",
        sha256 = "0bf3e401bb44ff942edafc6e7cb1f840927487f25836716bc13c3e24cb5aa989",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-osxuniversal.zip",
        sha256 = "3335808a8d4d6f5391f5110e8e2667a48b3a2a96bc5242ffe87fc4763180c53b",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-windowsx86-64.zip",
        sha256 = "4cf27f94d8f1ae8e0baf3bfd8c959d74e01d9019a75667a496e76e775b4a6b3b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-windowsarm64.zip",
        sha256 = "fa175e3680a572d70dc1a513a87f9e7a6977d09863f719cdfaaed08ef9378f8a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-linuxarm32static.zip",
        sha256 = "55fab8ffd5b5a9a1f1e4cd9a4fc8de946eedfe448734c184ce35513944ccacd5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-linuxarm64static.zip",
        sha256 = "008451e9251870e5cb30ab02ebfe18781f64414fa11868564115d42f9cc3cd4c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-linuxx86-64static.zip",
        sha256 = "7b85f2bfd937621da284f19550be074f816ec442e01474145a3f6b81ca0c40ce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-osxuniversalstatic.zip",
        sha256 = "6262f702835d65130121f56058b2e07c833d74527796127d7974f89a3bfe01d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-windowsx86-64static.zip",
        sha256 = "2e6006f66c4d57c93ac4b0638eb820c5cb9fb37d8e7fbade0199b267a670a464",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-windowsarm64static.zip",
        sha256 = "5b0b5798a7baf3283ad7bf3bda9c1c0b696ddb6d8f744200c7a1925e0924aee5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-linuxarm32debug.zip",
        sha256 = "6db4cd10a7fd1e042ec0e0dca3121f9fe03717e5507e9d7a9f55e182fbed486a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-linuxarm64debug.zip",
        sha256 = "9771d8d218c39602a11b65ccf0ef0311e91827d167871288fda57d66a0911bda",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-linuxx86-64debug.zip",
        sha256 = "600b8d51039b58e53ab0c50f837ea51c3955a4c1829432d89023f34d7fd509ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-osxuniversaldebug.zip",
        sha256 = "0b15945724e692e3229ee850d99d9d2b201482539c5269b2419ccbe56ac4dff6",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-windowsx86-64debug.zip",
        sha256 = "937a3e0d49207b3d84ae5f9038284d74b42afa9fa3e3fd8cba020d312bbe7e43",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-windowsarm64debug.zip",
        sha256 = "fe49c30be7cc46d5ac561418868cfa151806af6fbc4613da4a3999f8af1036b1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-linuxarm32staticdebug.zip",
        sha256 = "8ca09ac59bde5114fdfcc16861a54168c2141f52fb1541fc19058b29678aafd3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-linuxarm64staticdebug.zip",
        sha256 = "6cd217c0e092fe7a77e3de51a774da2bcaed212e092c2507a2dfd1eee5266e5c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-linuxx86-64staticdebug.zip",
        sha256 = "6faa2ca20bbaa8468e5ab8b3079cc86b8ceab26a66383f948c3be516cf353ad5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-osxuniversalstaticdebug.zip",
        sha256 = "313fef19e9205020b74972971a8fe83a792b5fee3e59022664c5e8e67387ef59",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-windowsx86-64staticdebug.zip",
        sha256 = "12e81e7187695f2a32cadad9a5c0a414c20db6c373fb743b4951e6a5d4c26cee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-windowsarm64staticdebug.zip",
        sha256 = "9eb16de8bf83a8dd6eb946aa65c0f4de598ea70f4ee85148e0aa92026f366d4f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-linuxathena.zip",
        sha256 = "b035f492ddd2d0211f9942f25ead37c85f1929c9903f5945e51abd9b3b78419f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-linuxathenastatic.zip",
        sha256 = "8dac17a7bcda68949fceed33aaf2dc273ce03438076e324ee6d7529552ed521f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-linuxathenadebug.zip",
        sha256 = "b51fc9ff203a3f8db4bb2b56aedceee473cee4692d3721aa6d08d667cce578e2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1/cameraserver-cpp-2025.1.1-linuxathenastaticdebug.zip",
        sha256 = "8a9611ba5accf57333c6aab69b01ec5778713517f06d76460d12cd3b7e09dfea",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-headers.zip",
        sha256 = "545f061052a919c9712d8412d736da923bd9aa4f1442120a449724c4a530cc21",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-sources.zip",
        sha256 = "a55abcffdeb162a0486fd320fa3cb8e7261d8529f3f0ea485dd43714c565c224",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-linuxarm32.zip",
        sha256 = "f369d99926639f95706997733ba02903e646dad07d940a13163225117f001915",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-linuxarm64.zip",
        sha256 = "aacc342dbf6843d6c83ddc38f9d2adb6a4a5091e20308185e7e3c7b10af6fd5e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-linuxx86-64.zip",
        sha256 = "300801141edfa749364bd2b9e1a963a2656acac769a5b5b35770e8b16883531a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-osxuniversal.zip",
        sha256 = "4800b365bf0d303af687e76632f4e5dd293bf20896d0912be299f51bfb204420",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-windowsx86-64.zip",
        sha256 = "cc3e1ea227f98c93fc87cd13e3758e90be38845095101ab7577ba62b58628e32",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-windowsarm64.zip",
        sha256 = "024796ffd7104ca20e4db3fb39df269e41fc2b1f6f01a3b70ca82cb30ae8cc40",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-linuxarm32static.zip",
        sha256 = "6e6ffdedb4f9a31f5c33f692963975440a60b53a1124bf4bd23aca68a6c94b46",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-linuxarm64static.zip",
        sha256 = "940b11009fb438011432ab201cd8b3cf80ff0ea71adc90c723df88325238598a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-linuxx86-64static.zip",
        sha256 = "2dfc4dabf0a64e240193c125aba69d81a77caec82883d47940591fa40106285e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-osxuniversalstatic.zip",
        sha256 = "2fbff15a806c40e467dfa51adab4c87daad473a1683a2647300aa6a155d511dd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-windowsx86-64static.zip",
        sha256 = "1238a45b3ada4c80e78f44db1b53faabfe9e5a007a890de06ac0610dff03c294",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-windowsarm64static.zip",
        sha256 = "d55f06035cf6cbe204d715588315895a55b1012dc61234b2c3962259a596784a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-linuxarm32debug.zip",
        sha256 = "a4bdb6f8c9fb54c25c1d71c5148703147c33f61819543f8af86359592dc65098",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-linuxarm64debug.zip",
        sha256 = "77e7734c91e2b723a07d28ef5c05a8464847566604c553add1c4618d907a92e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-linuxx86-64debug.zip",
        sha256 = "5cdea059ceff847acd4540a4e24c5c9d4ec511966f1fac1afc08b8f531b92ffe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-osxuniversaldebug.zip",
        sha256 = "b4e4f5670a762117b9685be1da0ee76275d36866e1f03b1db72f6b62ff9e71d5",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-windowsx86-64debug.zip",
        sha256 = "09d7642fa0c734909cab8ae1b2ec05546831b6caa0d1c2e1036657028abc9a15",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-windowsarm64debug.zip",
        sha256 = "7a43321ec705e29a30e884cd2dc4b9b4cb95bf7ff1ff9cd106ee62d37befad96",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-linuxarm32staticdebug.zip",
        sha256 = "84868bd21b39f175b14a1af1cd6fb23568a90396cdeffb60204281f3f01df0fa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-linuxarm64staticdebug.zip",
        sha256 = "f3dbfa944044131443282b12afc046984ed38d03f03e25c66d4c1dc3fb957eb6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-linuxx86-64staticdebug.zip",
        sha256 = "251d495afbfdcd940770077cf78fdd92d772d9e70e25a7ac12595b318cd7b039",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-osxuniversalstaticdebug.zip",
        sha256 = "08cdc1dd9473abefef8e711c967999283997e32d8cfd16f33f7f0d098160563a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-windowsx86-64staticdebug.zip",
        sha256 = "4b683a5b1a3a7e4e5d80c289bca2e66a5010c64e6382e5cbeaf1cfe6999c303e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-windowsarm64staticdebug.zip",
        sha256 = "9b85e9bbc96aa7173f0dfaf9a9dbe187274b4b55b803386a5646f9fe65e09ccc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-linuxathena.zip",
        sha256 = "08e2c37793e06115faadb60667e7386c21d127292ea9ddb3aad6741018418f66",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-linuxathenastatic.zip",
        sha256 = "669fe394e3e9e53a9f863444658b15827c9647c557cce9c797da48e85b77ce4d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-linuxathenadebug.zip",
        sha256 = "49a21931ace498f88317b63089946ab31ba4a48fb36d711a5f8c84341d7837ab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1/wpilibc-cpp-2025.1.1-linuxathenastaticdebug.zip",
        sha256 = "58c38382fb1581081b54c931570f684e9f9200d3927a210f2c37af9b5ee1ac5c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-headers.zip",
        sha256 = "1224f0e03e7ebb1fd0fcfdaa2e4a7954aaeb3a03a7d6bdce8ffe0443a933959b",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-sources.zip",
        sha256 = "2e3673af43e09bbf383d6ab2fc9a74026046e5f9e999323c4a12c8fe6bb47bb6",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-linuxarm32.zip",
        sha256 = "242159fa7696710c1bd0bbba3ac315d4ff1c378a83e383195383e8382e53e7e7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-linuxarm64.zip",
        sha256 = "359e64ccf580eb9d13961023c600fe91035686cb00e55701d879f777d7484517",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-linuxx86-64.zip",
        sha256 = "ec2f2f4b1d50ade909653f5eff7625f84a166a32571bca4e358db141a1bb6d05",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-osxuniversal.zip",
        sha256 = "c8f46a3a7ebfa633c1acde403baccc94ca3a1ae9ec1d4ddb3c056112aa9fdaed",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-windowsx86-64.zip",
        sha256 = "e9dcb203d8d24d864001999bc1905c2b77db82c426bba9356752ce90360e0aed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-windowsarm64.zip",
        sha256 = "d8166ba230f9559ea9484640485485f9bff771c24a8345ee24a2c49bc844b720",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-linuxarm32static.zip",
        sha256 = "604ef54359be7386439818d2aace9c1db3eff5ebd19a0352e2cebfc2f2d1a3b0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-linuxarm64static.zip",
        sha256 = "8144c0b21cd77f21d05ef9ba2a0ea7ee2d6b24834aeb8a1965bd16aa54493b88",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-linuxx86-64static.zip",
        sha256 = "8fc3609edf8e8413544c04f3a435c2c01bfa38999e90ec563a0e7d3e23c4057c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-osxuniversalstatic.zip",
        sha256 = "1231ef2379fb444dca4485f1c8fc31864bb646b5e5bc1359fe005fe60720fcfd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-windowsx86-64static.zip",
        sha256 = "e181ccf90714bd36c8047504022c394e5358cddf2e8022b4d2b8f634687e72a4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-windowsarm64static.zip",
        sha256 = "01267be515748e11366453927980029b8047f2db2204246319eef4bc3801218c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-linuxarm32debug.zip",
        sha256 = "4e115af3c3ef1e4bff1f5887404f16e34715bf289eb6f2de80b7e5b4151f75db",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-linuxarm64debug.zip",
        sha256 = "5564200c9dacb601856c535968b053f561dc2c2f27d397c35051bb2e64d23c83",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-linuxx86-64debug.zip",
        sha256 = "a398c3af4dbfe0129de58383401bed4a40031cab933637b934550550e0bd78e2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-osxuniversaldebug.zip",
        sha256 = "0750a61e1c2b8909fce8ad8c828bf5bd768dc6aaf1b3c79131a67780b2875372",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-windowsx86-64debug.zip",
        sha256 = "4fee0d4f8f9f8ad52511c5b0cf0564a592621d5e65bdd8082ecb9d169c6bae8c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-windowsarm64debug.zip",
        sha256 = "5941911e1ccbf11b477c07cf5bb27a3fec983f34206d70b255445d8b13e02cba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-linuxarm32staticdebug.zip",
        sha256 = "ce4927c8fc0b431c7594981d65b46b80fdc78eabbe3eabd4a645146f3f90fc74",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-linuxarm64staticdebug.zip",
        sha256 = "6f66aeb2863e505a02ef77c96cb6af1c83a6ad429ef7cb6a88e470a8e6213fcf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-linuxx86-64staticdebug.zip",
        sha256 = "b77802ed1dbe5a9c265ebb5b15b281eb323083f917430ef1facb354c7218f735",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-osxuniversalstaticdebug.zip",
        sha256 = "a20dcd2a2a00cb3ea8b22766bcd8fc31938510a3ec52258caa7cd91acde4a410",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-windowsx86-64staticdebug.zip",
        sha256 = "617dd0cbd52a7c1b0d4dcb6622b1725acbcfc9574d53a7c69e0008887ddaa52f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-windowsarm64staticdebug.zip",
        sha256 = "1f2b15b7617dcff91f58d802363e107eeb89f522cae47c573fed52b274bf1659",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-linuxathena.zip",
        sha256 = "19ee0fee0e3e0d30701dbb600de4178cb71f9949186b7af9013bf67247483ede",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-linuxathenastatic.zip",
        sha256 = "929ced0f320e471e63a9e7a4f30b7d9246df3aee281abc3f3aef216fd5e46ca1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-linuxathenadebug.zip",
        sha256 = "f6fdf421de079523df0db1314c60bdb2b99c60a8c5f3033bfe5da039c324284d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1/wpilibNewCommands-cpp-2025.1.1-linuxathenastaticdebug.zip",
        sha256 = "0be6054d3086f2642c8aecdb0391f067a59848202da1676fbb019f8021769ecd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1/halsim_ds_socket-2025.1.1-sources.zip",
        sha256 = "501d133646ac0d35b33679a7afb5fd0a21ee0aec042ac4bde2025acc506847b2",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1/halsim_ds_socket-2025.1.1-linuxarm32.zip",
        sha256 = "7ad69d6c5d3cc56a3fe4022eeda420253bb54471d760f881af701db31003a2b8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1/halsim_ds_socket-2025.1.1-linuxarm64.zip",
        sha256 = "990c1be6cb9f1b188ab8516129b55c1fabb2b9d5a44f48ea8a04985034640efc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1/halsim_ds_socket-2025.1.1-linuxx86-64.zip",
        sha256 = "cb825d86c7a2bfaae77d353463312d9c91cf6e667a2a11ef46fb0d355189cc84",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1/halsim_ds_socket-2025.1.1-osxuniversal.zip",
        sha256 = "0f933b04c05db43bb2fe9ffae18ed9b605c82019e2a4ccf62eb62b974e8660c7",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1/halsim_ds_socket-2025.1.1-windowsx86-64.zip",
        sha256 = "9f4a4a60d67fc2dbd62c395801de0d3e111021a305707b541c48af5aeb9b0bf6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1/halsim_ds_socket-2025.1.1-windowsarm64.zip",
        sha256 = "5abf404ebe88df0b3045d82dea5b4b2beeb6b249f88e42436166e652d13034c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1/halsim_ds_socket-2025.1.1-linuxarm32static.zip",
        sha256 = "2bbf3880eba919630867646d1c3484cc8676ca2f17ad2a2c8b8747fe306928ab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1/halsim_ds_socket-2025.1.1-linuxarm64static.zip",
        sha256 = "13680c1bdd4d9600240800646f3433f4670332135567cf2895b12e207d53ac3c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1/halsim_ds_socket-2025.1.1-linuxx86-64static.zip",
        sha256 = "204fa49aa0ebab3f11fa0e43f48894adefa698ce49d8dc9851c693f11515ecc2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1/halsim_ds_socket-2025.1.1-osxuniversalstatic.zip",
        sha256 = "bf1e60589b90f9bb8e6911bc3982f7a47dcdc81f985396736090233fee62d503",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1/halsim_ds_socket-2025.1.1-windowsx86-64static.zip",
        sha256 = "f328df6055dea955d930c6c58b035957b9e0eaaea68658d4f676c518bcb1c45e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1/halsim_ds_socket-2025.1.1-windowsarm64static.zip",
        sha256 = "4cdfc97294d889b61eb515b3e03890f8f9ea6d8edce90d353e6ce972cb691fad",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1/halsim_ds_socket-2025.1.1-linuxarm32debug.zip",
        sha256 = "4455a4f04797bfd5f066a710e9c0b3ad875def6981298d267feb8946ee907547",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1/halsim_ds_socket-2025.1.1-linuxarm64debug.zip",
        sha256 = "c8b4de1bb26e3c56b8139b52de6883ec8cb9aa176c09167da659a92511d52332",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1/halsim_ds_socket-2025.1.1-linuxx86-64debug.zip",
        sha256 = "c00abcc9c4082f6bb82a043657b53d589fb0291ffecea17d9d2a6e8076b640e6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1/halsim_ds_socket-2025.1.1-osxuniversaldebug.zip",
        sha256 = "8bc59a6e95d40b0ff2a694a0e2a3661b8a1529c1b32433d854461326167e5b4d",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1/halsim_ds_socket-2025.1.1-windowsx86-64debug.zip",
        sha256 = "5cfcd019aea8f676721e72d2fa5b0c61da13b9ebffb017ac665c4f2f8580c33e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1/halsim_ds_socket-2025.1.1-windowsarm64debug.zip",
        sha256 = "a04b19a91c4e20514f5b84592f458d9c22f5c98fab839af23b862adb3120cf61",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1/halsim_ds_socket-2025.1.1-linuxarm32staticdebug.zip",
        sha256 = "c7ed2d2e4af96f34af816c3a8719d484ea8f801cfed057a9c64022ddb5726a01",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1/halsim_ds_socket-2025.1.1-linuxarm64staticdebug.zip",
        sha256 = "62ab25f3c60d16ed6e09bbdc06c81092db2f1b2177c95f0cf3117d1b7ce9cced",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1/halsim_ds_socket-2025.1.1-linuxx86-64staticdebug.zip",
        sha256 = "1bfc97b3894820400e28fddd306eee6eca4ceb5631e7376c5cd2580b581a0d59",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1/halsim_ds_socket-2025.1.1-osxuniversalstaticdebug.zip",
        sha256 = "64947372981ca2fa46f393a0df270954bcf3632b548335989e567f46d51360ef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1/halsim_ds_socket-2025.1.1-windowsx86-64staticdebug.zip",
        sha256 = "327ac3fdf10b9876042a23c9066376f163d71b20950314c40f5a5b5d380677a6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1/halsim_ds_socket-2025.1.1-windowsarm64staticdebug.zip",
        sha256 = "fbfced41e2cb748707e6ae4e6822842507f95ad150e7389ee6fb7315ddc3a8ca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1/halsim_gui-2025.1.1-sources.zip",
        sha256 = "26378d3a473f6dec47ff2b8fe18c21a21cb315ff992865f442d53f4056f765a4",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1/halsim_gui-2025.1.1-linuxarm32.zip",
        sha256 = "465a383eccc1a1241be9b4e4e9d2ff3827cebcc521d03a040a912a1b21a0aeee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1/halsim_gui-2025.1.1-linuxarm64.zip",
        sha256 = "b55fed7d5b25382757a80e91f2fbf1b6990211880b1b716dbdfdea70e6cb1f98",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1/halsim_gui-2025.1.1-linuxx86-64.zip",
        sha256 = "f137d78b5a6a8d05e919d07d6e5a218d5e205d1275b14fe18ebdc3fe38562781",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1/halsim_gui-2025.1.1-osxuniversal.zip",
        sha256 = "3b125fe8834dd236597094a206b70600f3604b4b7b6416d6ec504876690b3bd9",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1/halsim_gui-2025.1.1-windowsx86-64.zip",
        sha256 = "e30c6079703115e73ea5daf0bce2d54b711cedd744bf07ab14b6c84662f88e4e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1/halsim_gui-2025.1.1-windowsarm64.zip",
        sha256 = "6a81ddc6c371fa7d4bf679e166043375f6a420e70bb0d90f92c9e16b0cf039d3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1/halsim_gui-2025.1.1-linuxarm32static.zip",
        sha256 = "d307346979cb36ba3d8512b9f0b41c329e42759a72056a62d53ed002e6beec43",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1/halsim_gui-2025.1.1-linuxarm64static.zip",
        sha256 = "f9aff6c8bf4e8652c073035ba85b90c38a7e87e240c825227542c7cc362bcdb1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1/halsim_gui-2025.1.1-linuxx86-64static.zip",
        sha256 = "a2ef7c1eb4bd6717751c67e71ae7b6733f8efcb86cc236a0bc1021c4fb3ca038",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1/halsim_gui-2025.1.1-osxuniversalstatic.zip",
        sha256 = "515bfcc59142b5cdb4ee62c04995ac6b1b19bf7edb0243133a355d84f0e2d6e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1/halsim_gui-2025.1.1-windowsx86-64static.zip",
        sha256 = "3d72f5bf9eea6efe3f05390ef80df409c8a84991e0ce663293b86bb10e0e66f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1/halsim_gui-2025.1.1-windowsarm64static.zip",
        sha256 = "971a687ddb86cae5e8bf4dd95b64ebe06578b87a18b8c4ada7bc212068552f45",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1/halsim_gui-2025.1.1-linuxarm32debug.zip",
        sha256 = "2bf66ef6914ea4929441ca298931547ec82e80699c5f4c618684fdfccd6bf540",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1/halsim_gui-2025.1.1-linuxarm64debug.zip",
        sha256 = "e154e39fb7b0fd86a1d8f8e8bc7634e7ac73ff49f6bdfcdc4436534a267af5f4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1/halsim_gui-2025.1.1-linuxx86-64debug.zip",
        sha256 = "a712f3e1cbcb240679c459505ceebd177491dda44a3b2feaf8c0c184997a62c2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1/halsim_gui-2025.1.1-osxuniversaldebug.zip",
        sha256 = "200cf6d61cb7cccf528056ab4bbcd3d498901d8ab9edab0e3a2b4caeaade7024",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1/halsim_gui-2025.1.1-windowsx86-64debug.zip",
        sha256 = "07c7dc48c34d3cd1fc6a0bde18908059855f3f55d93bb26dd5722854422522fd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1/halsim_gui-2025.1.1-windowsarm64debug.zip",
        sha256 = "0ae38009574bbff0afc3e5f944a7e52d09f0fddd93f011bc4b68909dc0685a65",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1/halsim_gui-2025.1.1-linuxarm32staticdebug.zip",
        sha256 = "90e28a8b8ae4925ddc25b1d1952494cda8cc1a6086b81e65e5622365d8c29500",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1/halsim_gui-2025.1.1-linuxarm64staticdebug.zip",
        sha256 = "2bc9a3e9c7f05c23d67cd839086105b5ab0ea0eb631119569e782a3a36d96809",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1/halsim_gui-2025.1.1-linuxx86-64staticdebug.zip",
        sha256 = "c896c2ebde8bcf4c8feb07c1d81607c88107b231a09eeb4655901d0a917d9323",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1/halsim_gui-2025.1.1-osxuniversalstaticdebug.zip",
        sha256 = "739dacf75030b2856b2b4c72164367c6d3892d2179effd5387d258b3290b277e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1/halsim_gui-2025.1.1-windowsx86-64staticdebug.zip",
        sha256 = "9bf3e9f6cb439c890e139a6ae1f27f869d8fd2223b85f912b3bab05dfe98b910",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1/halsim_gui-2025.1.1-windowsarm64staticdebug.zip",
        sha256 = "0cd0b7aa3a1063d686f60c77ca297d673149817d71be83ddba8c0d999ed9e5c0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1/halsim_ws_client-2025.1.1-sources.zip",
        sha256 = "3f551bc1ab0809b612fa7ac35e9bac763de3bb1cbfbe77780c9bbc1ae8fa95f2",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1/halsim_ws_client-2025.1.1-linuxarm32.zip",
        sha256 = "4ae6b57607345775f9c1ce595f6a496a400a161f8703d0ad8188eccc3c4e81c0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1/halsim_ws_client-2025.1.1-linuxarm64.zip",
        sha256 = "de383d3ca8f496b74185fe08058ab035122b1cbb5346b1fdef6c6d7542052148",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1/halsim_ws_client-2025.1.1-linuxx86-64.zip",
        sha256 = "b16bfe33add789c49cd0fee139b9d3812a494f67306ee23c51beb7a72ab9e714",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1/halsim_ws_client-2025.1.1-osxuniversal.zip",
        sha256 = "4c4bf19bd058c15483a4b6d10a605dd3aef52ec54972fa398c430f264f0c97b8",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1/halsim_ws_client-2025.1.1-windowsx86-64.zip",
        sha256 = "4ed37b3539d6bfa5b2cc4f1d372974939c0c765928266dbeb106d6578b683fa0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1/halsim_ws_client-2025.1.1-windowsarm64.zip",
        sha256 = "e1cafb0d264b37aa734a7ffc00e00b703fbbee068a00973442e1db08540df2a1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1/halsim_ws_client-2025.1.1-linuxarm32static.zip",
        sha256 = "c0b2f2af2d5b9bfb95f037425d53bd55e7b412542558f3bf0af35e3066e68c99",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1/halsim_ws_client-2025.1.1-linuxarm64static.zip",
        sha256 = "d1e88dd45a5d3c7a225631ef1b4892083658c88454d19a67d8af084366aa4513",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1/halsim_ws_client-2025.1.1-linuxx86-64static.zip",
        sha256 = "ced3ea6143707db8773d779cbe8aafd3432917c246c1a59ad6384bf711e10e7a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1/halsim_ws_client-2025.1.1-osxuniversalstatic.zip",
        sha256 = "0f1fb45cc2308840d737b8b21112d73cba19728d51fbbb4881a8b70fb42897c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1/halsim_ws_client-2025.1.1-windowsx86-64static.zip",
        sha256 = "20feaaa18801cb866b2d525c4974005376cbeff35463f6fc2a1667b9878f2047",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1/halsim_ws_client-2025.1.1-windowsarm64static.zip",
        sha256 = "4c37596ebad568958e7e69a0a10d30002762af4b9ebbc205db99794b1970b8cd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1/halsim_ws_client-2025.1.1-linuxarm32debug.zip",
        sha256 = "a522fc62d61753dcb30b892eb212a981af92caeb7fd4747233e1e686c7424918",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1/halsim_ws_client-2025.1.1-linuxarm64debug.zip",
        sha256 = "702f74ccbbb89f789f136e4a04f7742be83376ea77d1adac2a7241492e1c8ee5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1/halsim_ws_client-2025.1.1-linuxx86-64debug.zip",
        sha256 = "75c8fb354c0001f75f02becf73f73f857ff5950ce6068662d7a7be0426f94f01",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1/halsim_ws_client-2025.1.1-osxuniversaldebug.zip",
        sha256 = "f926979e32aea4e3e4f136160cc88ee3013252e21ac1d7e56ffa58f67fcc3f91",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1/halsim_ws_client-2025.1.1-windowsx86-64debug.zip",
        sha256 = "99ec75666a9ef4313d3495919f77d823048e11853daf4cf6eff7e185b26cc49d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1/halsim_ws_client-2025.1.1-windowsarm64debug.zip",
        sha256 = "31ce2f285cc513a2487e29871ca63f929b88163e34fb592048e506c0a50140c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1/halsim_ws_client-2025.1.1-linuxarm32staticdebug.zip",
        sha256 = "7e01f3c477df6792354c65ddfeed0c068e6cb3eed8a5982ab86dffc1e6743b73",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1/halsim_ws_client-2025.1.1-linuxarm64staticdebug.zip",
        sha256 = "6305df4830b2408b3c958a2d49d8ce28b83783c6e6b26a87def674daa147cebd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1/halsim_ws_client-2025.1.1-linuxx86-64staticdebug.zip",
        sha256 = "6a4374314ad747b5bcd90d121f80cf2b4f7ad853ba1769a970aeeb89f348c5f0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1/halsim_ws_client-2025.1.1-osxuniversalstaticdebug.zip",
        sha256 = "4b96735c32b7750a67f13595629fdfb7b62c64cea944c5c3fa2754382e510665",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1/halsim_ws_client-2025.1.1-windowsx86-64staticdebug.zip",
        sha256 = "3e8c553cf72c7f4b4036f2415d601976267d41d1ea83668d38f7a8b60831003b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1/halsim_ws_client-2025.1.1-windowsarm64staticdebug.zip",
        sha256 = "028d459664c0873530495327a52741ef72d9a908b4bcd7668b068a9c42a0718c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1/halsim_ws_server-2025.1.1-sources.zip",
        sha256 = "bfd957c5e3e99a7621494a5541da607a49f16ff0c13a99c0f32e77b04cd14afa",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1/halsim_ws_server-2025.1.1-linuxarm32.zip",
        sha256 = "dfa7e72dbc33302e6cf2bcb447ca0257df95a3f135063a9b7559b3def24b4dbc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1/halsim_ws_server-2025.1.1-linuxarm64.zip",
        sha256 = "09740091e3799fbe267ed7822de3be076c2608b80010642713dcdbdb32bccc97",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1/halsim_ws_server-2025.1.1-linuxx86-64.zip",
        sha256 = "8ea3da33b5dbb2c263775d73263911d978e50dbcd88232ed91840c9310cf90f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1/halsim_ws_server-2025.1.1-osxuniversal.zip",
        sha256 = "db73741aae4678870199d3145b7b37d7a571440a110cbd7045859433fc3fb11a",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1/halsim_ws_server-2025.1.1-windowsx86-64.zip",
        sha256 = "d32a5c94ec24e1341a009497c37b5246e60a78b54e6d3314db8c3052b4da6c1f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1/halsim_ws_server-2025.1.1-windowsarm64.zip",
        sha256 = "8bd49824ff55882fac68aa5b7ca34748e3a80f0553f5636af20e1316e2f0fe7a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1/halsim_ws_server-2025.1.1-linuxarm32static.zip",
        sha256 = "04e3caae3ac4715beff42963ea0c009dd62115ef135cfaa2f8276c394b70aac9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1/halsim_ws_server-2025.1.1-linuxarm64static.zip",
        sha256 = "4fda386fe0137ee6823b8cdf6d075d3e0eb5ed9f3581bcc1b9bc3fac609f3fdc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1/halsim_ws_server-2025.1.1-linuxx86-64static.zip",
        sha256 = "dfe696193c5224f60d69ef589bf9f51be0f53198ddd84341685787e66b3e542d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1/halsim_ws_server-2025.1.1-osxuniversalstatic.zip",
        sha256 = "a19bb42c0410742a1837d7ce0da5066113ba62d84893a7278dd5a3a0abba5bee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1/halsim_ws_server-2025.1.1-windowsx86-64static.zip",
        sha256 = "ec0353d0171918a8837c1e0837420bed84b6d526a6879ec25cb78f35fa45bb22",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1/halsim_ws_server-2025.1.1-windowsarm64static.zip",
        sha256 = "cb492ae98756422a3e8aee0ab139cca48c489a9112f4f5126067966b92f9ba1c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1/halsim_ws_server-2025.1.1-linuxarm32debug.zip",
        sha256 = "73a91993c5e6c8781776d0d1d6fa1f24404bd9856fce598e71d50b01273e2ae4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1/halsim_ws_server-2025.1.1-linuxarm64debug.zip",
        sha256 = "70e595a331b2037bddd42bd5dab9c6424a03ff0d92c1816a89c68e2d2ce9d6c4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1/halsim_ws_server-2025.1.1-linuxx86-64debug.zip",
        sha256 = "21efe0b09546502051f7827bfafab659cbba8c9ecd9d2e05a246a33b7334f4c2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1/halsim_ws_server-2025.1.1-osxuniversaldebug.zip",
        sha256 = "449f6f862076e968f3fb342a141e8e931fe83d67ca69352978b5e0f66d3d620b",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1/halsim_ws_server-2025.1.1-windowsx86-64debug.zip",
        sha256 = "ce4f113c0897f11c2334b1102f89d6c5953c1fb50ee082d638363cdc6f12aef1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1/halsim_ws_server-2025.1.1-windowsarm64debug.zip",
        sha256 = "acec3d7f1ab8ea4a74103d3ea177bfad8637b44eb78154d34c000a2f3166dafe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1/halsim_ws_server-2025.1.1-linuxarm32staticdebug.zip",
        sha256 = "8fca25346596e5d5165df988dc7f6f8f274100159ff43128394f4754d8e5a9bf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1/halsim_ws_server-2025.1.1-linuxarm64staticdebug.zip",
        sha256 = "0964cf4e773fff911701b86ecc1c29f302148649869c93346d59b6bda41d73e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1/halsim_ws_server-2025.1.1-linuxx86-64staticdebug.zip",
        sha256 = "ee4315099cdf2a0108525755fe8e1cf1326e33040720184e45c2ef6a97bcb007",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1/halsim_ws_server-2025.1.1-osxuniversalstaticdebug.zip",
        sha256 = "80b56614fca2b555a22ffae16778ae89ea47c263831ecd570dfe37d4d56484d4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1/halsim_ws_server-2025.1.1-windowsx86-64staticdebug.zip",
        sha256 = "b5181b0e9c97eea91f43f0e249b6e4b609b5fd9ad0d3346437bfb75d4739cc19",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1/halsim_ws_server-2025.1.1-windowsarm64staticdebug.zip",
        sha256 = "db8613bd47af2e7cb9a589f5b34d85859110d17ceb9b661edbc6a05ae0e29425",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2025.1.1/SmartDashboard-2025.1.1-linuxx64.jar",
        sha256 = "f2b148b13b2f0c4fb7a5a2cdc1b144651f0dc61a5361dd37623bcaed926b4ca5",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2025.1.1/SmartDashboard-2025.1.1-macx64.jar",
        sha256 = "b9fb4be2d400759b31ff9b5c189a8712c7a5bc61dc6b96bed3a210950188486c",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2025.1.1/SmartDashboard-2025.1.1-winx64.jar",
        sha256 = "ae1ed1e7e41f3f26f7cc408db5ebc02be0d73969468eea0bb0b2e1c370186705",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1/PathWeaver-2025.1.1-linuxarm32.jar",
        sha256 = "f4fb6a02952f19745f03114a7e409e252b666777d4ca7ae96bf94f9ce132637f",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1/PathWeaver-2025.1.1-linuxarm64.jar",
        sha256 = "6893374da3b6a9e274a3ecb25d4753669ab84e36ec9c329a653c295e6b1e6fa8",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1/PathWeaver-2025.1.1-linuxx64.jar",
        sha256 = "39b44764d6771b6b9e2ebc5032069487e5e47945deaacefed76a6b50ccc49e6b",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1/PathWeaver-2025.1.1-macx64.jar",
        sha256 = "74757cc1b41f9f24a8dd19bbb7e3050f27281ed5e73c81bc8435fa07f933f87e",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1/PathWeaver-2025.1.1-winx64.jar",
        sha256 = "52417ce316f8e838a842d4e92c17af0ccbb7f9fae353a247ad89ad180e9eab5b",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2025.1.1/RobotBuilder-2025.1.1.jar",
        sha256 = "35c9b642f0e96b1a626e87daa1c1d3785518897bb76d0b013d4b59ac94054621",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1/Shuffleboard-2025.1.1-linuxarm32.jar",
        sha256 = "c877af0beecc0577aaccb3eb7512e45def141a3d2e77eecae4bab6d3736e461f",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1/Shuffleboard-2025.1.1-linuxarm64.jar",
        sha256 = "6926d11ffe63e2561d675e62c4d9fc3abae662c0c714ec77fd88cd5b497eac60",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1/Shuffleboard-2025.1.1-linuxx64.jar",
        sha256 = "6c1a0eb3fbb71d33dd7b4102e174209af3a5d1c0e3a8c92296ffc75513d58f02",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1/Shuffleboard-2025.1.1-macarm64.jar",
        sha256 = "174674ab826d19e63316505ec24fcb1844934cbad51064e9cdcec98fc670f418",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1/Shuffleboard-2025.1.1-macx64.jar",
        sha256 = "ad6089b28df329390e2b2241bfe86112100b644ab6f672600c32ae828d7bf133",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1/Shuffleboard-2025.1.1-winx64.jar",
        sha256 = "546ea7848fe79d17a16b16005262aa6b382c090ecd40de7d260fc661c615c1cf",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1/Glass-2025.1.1-linuxarm32.zip",
        sha256 = "f69d2d92d86abbb00b9ddad34e59cbdffed24ce7e6a809bb89bd78ba5471bcad",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1/Glass-2025.1.1-linuxarm64.zip",
        sha256 = "ed8fe25b34998a82f8a25387ad7aead6f55ce7294635c57f4aa960e6b341e4c1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1/Glass-2025.1.1-linuxx86-64.zip",
        sha256 = "7d0ea85ebe3e88ca290c4dfa916c5c1176a38e6d618fa3a2840c1e74aa88df78",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1/Glass-2025.1.1-osxuniversal.zip",
        sha256 = "a77cfd25fa26d5fe3f248d4d8850d3e79737c6708243e16b341165e77003e0a1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1/Glass-2025.1.1-windowsx86-64.zip",
        sha256 = "66d5ec56fdf7c296607b7e7baf505c11ba6f6f5a277a765b97d50d8dc8147a46",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1/Glass-2025.1.1-windowsarm64.zip",
        sha256 = "ff0df31de7a53580c4e6da422d1130b850443450dbe973c261bb88d9fdfb8e3d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1/OutlineViewer-2025.1.1-linuxarm32.zip",
        sha256 = "ddbc6ed48f8b95524beca9be7d97924dd99979431743398fdef605cdfcb690fc",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1/OutlineViewer-2025.1.1-linuxarm64.zip",
        sha256 = "c4384942c1002fe903207c5f28002d65da9687d6091f3525aa26f23bf5be687c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1/OutlineViewer-2025.1.1-linuxx86-64.zip",
        sha256 = "091f1ca4543b5817c4bba11b38d0fd6052c6431b6c4894dd99033314249da7c8",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1/OutlineViewer-2025.1.1-osxuniversal.zip",
        sha256 = "f9fc36d20b04b76fe881c0b0f08b8b45eb9c0918acbd07249780ed108f1e06ce",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1/OutlineViewer-2025.1.1-windowsx86-64.zip",
        sha256 = "6af8fc739eedfc0621dab1058cbd7708f40b1224f2836c4ecddb19c30fc6155c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1/OutlineViewer-2025.1.1-windowsarm64.zip",
        sha256 = "edb8d31ea53c9444fa9f120d8901bc5ad4c0034dc01cccc59abcaf56da1d566c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1/roboRIOTeamNumberSetter-2025.1.1-linuxarm32.zip",
        sha256 = "65b5ed42e51eecab7d04320625b4337d34e8b74ef1044b67ead855d351c172d5",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1/roboRIOTeamNumberSetter-2025.1.1-linuxarm64.zip",
        sha256 = "8b45a8bae3b632cc60584dd3c0143b3b59f53f3881cb246ef4b7c17e62615953",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1/roboRIOTeamNumberSetter-2025.1.1-linuxx86-64.zip",
        sha256 = "85cf8d550ab5e963a8d15c22f79fd5f52e2858377c63feb7813940e5182a77d7",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1/roboRIOTeamNumberSetter-2025.1.1-osxuniversal.zip",
        sha256 = "c1d230ac38d29543d8683a4e7abf3711f96637e9157b4e06a823af4d72ca74d8",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1/roboRIOTeamNumberSetter-2025.1.1-windowsx86-64.zip",
        sha256 = "cadd9591fb8da114091d029870d18c7d7ea190dc92b1961e453337b229bab774",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1/roboRIOTeamNumberSetter-2025.1.1-windowsarm64.zip",
        sha256 = "30ba061031f09212a7a6f720dbf7b8f41eea7aa67f795cdb48ca177f4aa6a553",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1/DataLogTool-2025.1.1-linuxarm32.zip",
        sha256 = "3bc442e4a1e491478facc24187af48f0b7771cf94998f1b47fed65c90ab61b84",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1/DataLogTool-2025.1.1-linuxarm64.zip",
        sha256 = "35b07d3894de3fe2b0e55cc39e64b8a0b0d8dc2014db61ae4c16eff2be8a9a5b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1/DataLogTool-2025.1.1-linuxx86-64.zip",
        sha256 = "363183fee69a938315dc42cdf06323ebbbe57464e516a7d70d12317312496580",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1/DataLogTool-2025.1.1-osxuniversal.zip",
        sha256 = "d4496932019d84c39e83b11d7b67d06b68860e6a7efe40364f9a6b4175888dd1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1/DataLogTool-2025.1.1-windowsx86-64.zip",
        sha256 = "bb2d9f7497d63025ba15ba5a5eef99b57395e07a7186633daa11327045b47d8e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1/DataLogTool-2025.1.1-windowsarm64.zip",
        sha256 = "f394e688bbad55d38bcc542fac6580eacb95eb6d5066241e6559e5c56e1fda54",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.1.1/SysId-2025.1.1-linuxx86-64.zip",
        sha256 = "7f3472770e1281283b5a83f46bce6daa90c69ce66d46447805175d30a4d0b45b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.1.1/SysId-2025.1.1-osxuniversal.zip",
        sha256 = "ac2840f68681465abcb43b4bc8590d62080336e23a989a292ea286796602cfc1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.1.1/SysId-2025.1.1-windowsx86-64.zip",
        sha256 = "e0201e14a54d05fdfd0ab9ef06801253525bd6ea3fcf729cb7767e9278109670",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.1.1/SysId-2025.1.1-windowsarm64.zip",
        sha256 = "9b26154a5cdef9f05aefe444b48456525ce1db75594dcf3634c9807984d7b76f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
