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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-headers.zip",
        sha256 = "ccaeba80c6e1341ce12a4a6dcf1cc3acb756b2c50e78c46a4ccb90c82ef5b6bd",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-sources.zip",
        sha256 = "e908395504bacd78bc99248c246839df3055b198718ab53b2c95a4e4268d70e8",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "9b3605db65fdcf70d206f53ec8bea4c03d0c656519e2b3bcfd4571b0b7250bb3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "a8cc4da9b47009e3782a99fcdcc6a24a6b0da69da7b173559fb24ffab8da05c5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "a7c0d76cbd99f4c4ebd3662816ccbce88c3c8a1adbd2d0ef2cb177836f9813c2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "644048e2c662116abf933051e0de724d7343de426362cbf7f215ba12aef6930c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "3ae1f8305ae1a25282d0b5101cc15a490e7b7e1aa7ee16f9a6bf10340922ea13",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "0792f49a7e26b8e90211fdb098fe08a67065ca530bc5a64079154ef43649979c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "aefee3d739894ccc0bd3147e2ee17d386e4f18852b250e2150f373203017e8c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "7896131ec82f5c9549cc71614adc9f657f5e55d19144de53851803b9c87979c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "e2271b745b1f4dab61d626d54a9cb2bfab12dfdcaaffeb2b0dbab70521c470b8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "f9115328337949b9f73cba6fba380f1f73ec7819aa9f429570c4f7dfdc5a648b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "86ddc2e87da4da78acc85ace50fff5c21d99d23d5105e760d99bd855750313f6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "5aed6952eb3d2b4e21af5e1fb00c88a4e0565361d9ebbe28931e9c5a3eed79e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "cdce802de4b603cdf65f25a311c0422b5586ec28e319f18827f71930189b21a0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "7599affda13d0ae216d3309ab5f821b1bf5d242b3b78dace32907f9b9fa58ee2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "bb09acb690f983ab8a9d3be482eed9a80d74cd19f69bd59ce90206a9d3441080",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "e94a3b7f47defa57286f36ad721c639496d25b0a3f68a4fe2cbeadde0702d8d4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "39f8ea665955e0d00cffdae6380c94ff80999bc2ba17c973b3b06e93fb697d22",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "073f15db80634c88dd1f234232bbf0f821467ef3fef00147d37bae908c6b23da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "7f71a3385c49f8aaa141ba34a56bdd02553f4a947739d5a4c3083075866f8580",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "ab7e485f139cb7c9a0eb9acf6c5538f62ccbf4bffb62db895a252e550406c78e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "b43b0c3d2a4382796aaa98a0529a5655af6e8588b82107108d4a245f49812675",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "aa66cd065adc8a13af971dd7009f7be68046ab7a662a968d1fa7a6bd696191c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "bf924892f2113c3611b6f3bd8c63794184179ab0f9cc9c90b3af639f8bb961ca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "0c1f4090563cc04bb1038ab0ab14820d84850cc669e66a8b957fa65990b70d05",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxathena.zip",
        sha256 = "7a9439e522804b85c307744c97ba21030cccc5b8818eb455dea13fb0e183e42c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxathenastatic.zip",
        sha256 = "235ca1f418cbeb621267ea92668a064a95ebb476402796db1369a037a6bc4d27",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxathenadebug.zip",
        sha256 = "54ae27403f149d97b7455bf23853a9d6cec6c61e088e52972f5e8373174778cc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxathenastaticdebug.zip",
        sha256 = "ac55ff8fe93b97c105fa8e5e7cc94a9c3ff3a47186761901bfec1d3b476978d3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-headers.zip",
        sha256 = "566655b0629f203a5e41311b18b5b4d97e8df8b255e52e6b76f91abe6193b015",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-sources.zip",
        sha256 = "8f6d04f9be51832a8a3ac9fe9a1929a12cc07d40da2e552db7cea1aca4dfee8c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "50b19bef5a2a0851b3ed92d8b47d2d7dab3721b0c56cda80c7febef722c7f95d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "3d1bd929575639a9b3e42bb0387ad014664b27c7cb628419558769e3648ad09c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "ebbe6a4fecc218cfe215c83c934ec96a0a203ade68db965862f994aae7e80005",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "9934a9209fb38ed443e48b1a104f9cffb46ebb7d75027b445ae0e0db100c467a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "d4865a918ffb3241a5bfd8a98944f75d97f23143db313d1704bd916c11cf995d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "5bfb7a75bb737ee1c8618be73b36c47e9af654a6ca58922c35677d44c7462e77",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "ab579d76169d684ac12b32b071c443f21e04d03f02957db27dedabd3879c4d35",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "356b51c2f5555b04748c46222c9ced21be2bb054cbafadc7bbb3774cffca70eb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "ecc93af660775b3cea70c3cb7ae249bb327ec9b080597151c7d8bd6362349861",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "392c7720e8113efe9db4e4f04cb33c39162a12db56a04b0e5be9c773d6ea5f2c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "2561ebb8d70b43c1d364ab0cbbb1917cca3144d2db7dcb9dd753c8f751177dac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "4fb52353d764810d800e74b16d58d875059b3d79efc86e491239e2bda97629fc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "b9eec747af3030b7e63d4c51872cbe2bdde0304881c578110bb52f557b07024a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "c86cb04236fc4f20c40fd04d611660cad0d78d75d8ad9e16fc2ded108da844b7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "11279092476f81e8390167752ebec5cbb1df0e5a1736945c81e19ba66d239593",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "032793ff715da78d382caf145a23f002022b9df50608a9f68a863400e526b889",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "3308bb8d364d2fdf5dad945d4deba205160acfa713b9b5d7a9e5b4d3f5106efd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "5cc4531c648e728132f86b96e89b9934740e4459af01eee4f04ef9dda9e202f0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "95a5f89009c252a4bdfbb991ca1a760e96d3dea725d40e051dd2f0606c4a1f72",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "fc4ecf34b41ad618b27d2aae2c1112b37d151d9523dc75ee469e7ba847cf2e81",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "de9cb366f222cb2a12f5f1b2a63a4f9c5323753fd050a8129094c0613c388ff6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "0fa6a00e0e8366bca2e88aa4a389c462ba66fd574420984919eda836e6be483a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "682549e84ef16ef8634b6250698ee3307c7f46e2d6985e64b8a893d176f703fa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "511b225ea7596c09e5f23d09165bb45ed9a177fe311d7550b488830e596b8d9f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxathena.zip",
        sha256 = "def8d2da5a50ab2939b68479f6cff339166bb1892dc768eb76469918647f8337",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxathenastatic.zip",
        sha256 = "91ace2eace9c11acfa77735e1e3278a555b9f9adc4a17487a1a85db995452306",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxathenadebug.zip",
        sha256 = "78963d5060d49a0123e6eb216f92acf61a8143c81ecc6802432f8ef13a3b7a4c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxathenastaticdebug.zip",
        sha256 = "fbe784729d7209707b7f322dbbfc5ab7e1800eff5d7a4034970111488a4975cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-headers.zip",
        sha256 = "a483d59fba01134fc8f0594b92dd586e232bb1f0922365a57bbdaee3fcb44756",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-sources.zip",
        sha256 = "b1ca5d20a0655f4f090db9302c8db2fb6f9162528cdfb796448999365d929bef",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "aac5aa9c376474ac7d17e3bc612568341e65baa9bd6f07549e6ea5dd7a79f473",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "32ba17a2d61db8626211ea0b3b63f36f2ba68fb92a808b0acbcc32c398efe400",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "0201b8808c8dd0b3b69a9af7f70975eefd91d3fa2e2836e42ca8695a63d55f53",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "6fa48bdfb528266264d3c28f15c1c9ffec07c002bc175542186c2005fcaa7e27",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "cde818055e8d3b546e86b328c947ea572843d9e6d9605175e02e99a0a2991047",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "947dafa901acd266f25f8ff3478da810a6c4dea91f090dc3caa8ff50cc5384ae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "6422958095850d0690da12427c3b9812a39519337f5ef719c63063b754cc2323",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "fac35e0148e0beac1e39d34eaaf3fd349f909ff0b6458d5768062a9e8d7fa7da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "1a382599ece9fb1cbfd92daf72fc0da1e96a972a5fbb93c1d3be2002b49a55cf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "d0139136fdd0b2f66c58c9ac2ad951c9787dee9a93a0d4179eb9c034186e6ee4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "be28d2b6fa46beae88e459b8e8094e54f8547b7fe006d58b4ac133aaf940d8ca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "964df541b2f97d7e98507f1e8ce822870683772d73702cee512ba243f8c66dd7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "8344db99df52bfab7029c7ad6d51397b4ae8573b2a35de5f2b0bca401fa31aed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "17f1e2386e886fc0c31fb2a0e0cfa6316d4a6de47d1d73668fa2ffa261d2b220",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "7849d2ec18c58ae94b38c988cdfb24113968ddf51cd6372224d0ac5e27c2d836",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "99048230a31929c93dc63223a4241d1e91e22ac297e971111a25cca2dadb2417",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "7d81421c7f89d3a4d3d88288ef34047b232055d3ce527d61300b16c38f67e854",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "cd446f2dd98df4403ca56987962e926b0ef2e4aa2bc8a20ce5717ecd267687f8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "638933e20b6c91fa47a75fb18fb7710aa4f55d153f445cd13a0899bbc904fb32",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "88935d84c6a10062bfaf6a5028f8def339b86981bf995596b0ced3513698bc08",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "0c686900725c2bdf970dd48e3424911d16da379e3b8da7e47d245e4889144ad9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "b82373eb5fa235b67ed88308fbe273e7e7e9803abed696d0e241f0ad1ca15c53",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "92781a6ecb28c446763e97011f2a9e06fa07c7f56ef2610dfa8d627939783ef9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "018bdb6a6fd02ca0e72ac540edab9d2c547eca94ae5a73bdf1bcb30d899c430f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxathena.zip",
        sha256 = "92069d9faa7c96b7b6683ef7e8773fc4939c26ad4194293c345ea4c900228bcb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxathenastatic.zip",
        sha256 = "b836aeef7a93a08b11b1035c5309095992f6b7e5eda3b1ecff0407abf43e03da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxathenadebug.zip",
        sha256 = "b9d881a177a2c8a12e2f52e844de1f8556663688365a9129a939fb6663c832d5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxathenastaticdebug.zip",
        sha256 = "b42bee31032cd8709a36692bc8dbaaa4a77357bfccd52fc2b11b968a5e062f77",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-headers.zip",
        sha256 = "431a23f6c7e61eb3b031e9f6366644a8bfae60d659e3b76e49161337201f7dde",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-sources.zip",
        sha256 = "802aa2fab002891c7d57725786c4e54d58b2bae03c7e9ec7047d424ade58fc0c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "9d1f6bfbcce321d183772b4c5f18d029aaa6817b07e42a7f1a917841c7503fc3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "1e9ec11c2ccd4daf87c4f9c6fc09a11785670060829d107a4360aeeb3b54d7e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "c5bfcc86097ce689e21fe5648a32bf52cb9b63dff5e997562ca7e1b6249e465a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "f25c0a05d60e51553a47100c4f90c76a6fae27c9fc2f90bcea8ad392215f8d6c",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "422443c151387ff07b70ab5dda703c89c2f54ccad76bc40549ac28b0c8bb2a91",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "348abb341ad0593b67e719715ba77ecdaa6beacb34df849713ca9a246e085e18",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "5a70130a3a31ecff2f7125e60c79d637445b7e8bff3f5a2f49749d05ca33ae4a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "52c7ef75b732e9763072ca0fc875dc9165fbdd564d5b4a0965c13b790c1289bc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "911ed0bed48a89493f3dfdbb5430951fb110e83810c3c929dc5c0409e8204082",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "d6fb878f28a753d28a42a7e22273de317618024ff9aeb19546f77824d78fa0c1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "6b3fcd0698c660874d4fc7c0e4a2084d01d7df1305a9eebbc64c9932a387c94b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "cb3c18290ce8d18ffe9e1d8f2fbf9b424298eac0ff449b3b4f3130e99c72e4af",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "55d0cc86ea7684f245ae98094ce8a049b94da3cd443b0469cdd1510c66a4c3ac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "3b693e79e9040707c8f5f2c5ee326e018ececb28b3591e9030bfa605334d51c9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "8634c6feaacc6319eb99e68b4469b4d8eff69efeb2eaf97a7cb537275addaf2d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "3ab7402b3f646ddb207c94180ecadd1999bbf7170cabcde96ffdf4435e3f64fb",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "2e7ec90853296e257f85b7329095e60a1b48cb3be43070a87ad83840bdf82bd2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "007a345712552cbaa33a505a9c803499d8bb21cc68e65670eacd1f332e6fc775",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "d8ae4cb0f7b929b43c55e2f1bc96d5950e37027b59c9015fef464b196a3b417e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "397c6001575bb98f5d605477ff7c7084e53d16e112081f5fcb334526bcad2269",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "cacab2666da0e2a6724b4b4b114782bd7d1551fecb4fba651a1697e3b5ac95f3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "60cae52fc0e6e6c8491abb61923d50e311e1647ccffac1a10340da34646ecd9b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "2cec78aed45d2a77888beb6fa2f840dae8a3fb2a20be141d2bc86fc9a2ee7b5a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "7d51be6afc8ef195a3997675741caed379acc39d3728b87bdd8bf3ecd012ede8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxathena.zip",
        sha256 = "57075e5bf97cac473cf9a9d1e3495770d710f5db3e749330a86c357742b9ff5f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxathenastatic.zip",
        sha256 = "4f17a546e3d1ade7e525faba9627fd2e6ce18644a363c1311568600d0db97549",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxathenadebug.zip",
        sha256 = "d6b8a296ac4dc9f213c8382b62941e1ceb110a5f21f72e2c6a98930223a15cab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxathenastaticdebug.zip",
        sha256 = "0e9e49f6af3f1a98d69cdab01c1e820b6e5230288778cd9756e23ad399ed3af8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-headers.zip",
        sha256 = "5acaa6e4816ee985385858f45afc2e07adf7a6eb46130d573ff0c93e9b60578c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-sources.zip",
        sha256 = "acf82dc503b4c8b2f50b7efdccb22f85becb626d09fb62937521d186ac7aea0c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "4baf598b6807ffd4d92ac0f01384afe85d5b7020aeb424a70c5180b84bb43178",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "149f6e71e4f17f9580ed056651790dee358ea1e4c17647ba3d7690973b2ead33",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "3bfa847652ee5ef94d202b0388bc4576d9c712e925be0d247b37fc3fa7457bc9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "55d6c17aacd59bbfd4866379229114a9d6404d3ab6f56e775eaf97361376c4a3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "0ab73ba04eccc6993d150afc6308d8babc076226a35afb8fc0bb03ec7da697ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "1420b49a154fdac88f6a8b3e261b4a72a97edf4b8b1444a3c416d7bb1d17f2b7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "41ca8337751d32efd6f71d99d7226945e591d32fbf9d55b4cb33b7d14372a337",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "62372d27532fea5f87b6227947b8467d0447e21d5f28506244d8ee13267a0050",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "de8f341a64fcc1d92af6a846a79cd8317a7fb37cd3649f06a743500111df91c9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "9da5b63cf4162bcf84afde2393dba714a8ad1d7082544b26cfe7117b255b1973",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "3461be4e3fc2103d5c295b7a1983626e7f845468db9bc2d20b6e1f8041544e57",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "7129bcfa1a34574eb8664b712058761262d41895eb7ae1c380ba53ffd8c0965d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "da0de84891143683c5702401302eac17bc8066bf091c69eb0073596d99ae0780",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "9dde260ec97f7f85dc24db3887e628df4488b75f7fbcc59be97cf175ec0d29e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "c570577003c13010b19c5c34c02329bc587342e714d75815da7988bd1ade2402",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "05f9e16e4d6598001eed3cdaa499a958bf4fb420c5cb4a7b9e4ed20bd4d60ffa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "8bcff792522ffed1ecd8cffde15d07c4c0c09cbbbc183c5091dfe69d4ea851de",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "7e600824a56aaf45e5227a9d9dd232dd79ef2315e3169f4bd9b995b7105b11a7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "1053dbe1cac929c954eab5d47c319c493bce12f99b94e94d206558b6033fbc93",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "e3a41ddee96052e38009728e48e0997ec683b5a8dea6f7d7a1019e9c2d9a1ab2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "1af7194336cf15540ebc7a059f51b1dec41b42f71f217992b54477e006371ee4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "bd876f0db5e4dba786b10b650b5427e0fda94377aae9e96a59539518580de601",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "d01e91fef8d2842208a89f77d5dd6b5570c513960e2e353c60e2c0879b6ab453",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "190ee4758be99bcc371d635441b126e7d34aa5482ff0e967dbfa863d1e04857f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxathena.zip",
        sha256 = "1dfee74834524dbe34249e9cd9e0f6c98945247e71a56fe798006b453fedd654",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxathenastatic.zip",
        sha256 = "f8b82bbba43e09cbbb76614ba54d97a5d9019662754d574098a94fcd31ae96f9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxathenadebug.zip",
        sha256 = "b65c78842a25df5aa57d590e05df812da1e6f8e8587c59bba69644087d56da79",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxathenastaticdebug.zip",
        sha256 = "4815dff944c03ad4e1054771088cf6f129712db97d74e7c7b09fde825ff7ebc8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-headers.zip",
        sha256 = "bfeaab3afba92c2a1d6f9ec0a5ad0c3bf323830d68cb44d78e4e328f4ff09f8f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-sources.zip",
        sha256 = "512b6970fce8db9a62c7bd0e4b459cb81c503a47ed894bb9925e9cacd2a802a9",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "f9960cd74c38137534b8ca26383f3b1d61ec5f0c473f47b5e3e9250608667563",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "f8df8a6e42047fb9c7fd9bb2ba323b465870efd93a95ef6e3cd0529e8f1f1419",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "5f5f8b41838574e12b72deeb6168f991bcc4d17b48bfa7364ecf5bfe20ff9c25",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "462da9b90fc4b9343034f8f4e16e9708a36bf62be5ead41562c21ff751cdc8d0",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "c0fdf6075da1db758f2ebf99348d4c03fd11d5ffeffe7b826878827392340456",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "cd20a8edf957b24fee74e4eb37515dc3ca802795f430bce864ec09e42bad67e0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "ba336316967c7b407dfb58a952567552e8adf6a63e4bff48ad179b2420a6a48a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "0653bed6ba947435eb2eaf3ccc09241a343582b1bbc2c197c905bfef12049842",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "1633c77687bf0e22c9f98640ba669de35aac5001d0834dba936fb834dea3c6d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "1d7c67bebddb4f0169a24b14f2d7d204223222ae25c7f87329062c8136602d54",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "e7cfbe2181da5cb7c3d61c954b00bc6d10f772db2d7fb051e89c81eaed61cd55",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "66822d9d41ce647c3ad9dca1d9e84ec99aca011802965f5eac1ca25591fc97c2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "586b597abf9d4c31f80e397123d99116784444957e177eb64948a15eadf3ab3c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "acf90d317c6f1ff68fcbd7f71affcb188545333b84a7822992c0099d706ab2ab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "cb91cb4eb59217fdcf446a34f6795ca57c6f4cb95914433c437508f0bd4addf4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "85fde6b4154f68e177153a55bb149f40f347eb182202e6edc8511b185ef1d3ea",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "b2f5c7c007c5e66796c459c284ac4275f2baf9420045ca865868e0730f28654e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "ac7c8b90dc6365d64f7c13a9a3c0879cadcd6ac6ece6c133eb9e06d155eff34c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "38a4ba3a2ad300d60a909cd8c19b977c993c9c384b2a7e5bc1aefeec9d477c56",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "b5c7e02052d8cae5c383d7dbbfb8b12bf09060241c07a5f1520f1ca5f2553cf6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "cb0cd2668b5aebefa58055ff6268d7d02c2d9969d369178d038aafef819e8b38",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "31cf0194c15019bad60e994f48ddfbba4f833afbd0a57a77fdabf7e1da085734",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "76ea7576eee29bed43d9d09a7d10aec3b0f267770487d65b4a71e37105271b4f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "120ec255d3bd3074573dc4180ecf1a41a1239eba6ea97d5624441c4605bb3617",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxathena.zip",
        sha256 = "9c990834eb25342293c6ff9781b00cc4651f71bc749258501567f455e78392c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxathenastatic.zip",
        sha256 = "b0ae340804d0f777068461e9a87fa5ecc357376ab6fea49ed8591f17c6df0901",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxathenadebug.zip",
        sha256 = "100d0f899f53d7afc5657b2c79c434b781519d50a57474a3416af1871aec5cf6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxathenastaticdebug.zip",
        sha256 = "92bdec93fe63892de515f6a285b0e1aebcf836a1d3aa1b2cd955c53167db5d5a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-headers.zip",
        sha256 = "6816f979126815cf69b04062f2dd8504f7c897401b9df5ac14b985522ac8637d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-sources.zip",
        sha256 = "40259c04aa6b83e31ae4c05c8321f187ca538dbea3cfb8a25fa4b8f9beff337f",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "d06df942a199f5dc81d7f170258757f21f3239c56e52ba2fb06a661970bccca0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "3c87c0ce3c358f11ba8e2ef2ec47b7215a578c531d1bd3952b49d40019da8941",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "c52b38273df61f772b67e7caacb3e1452660117817109f8bc7efcae08e04502e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "1b7040f95119b36d73dd08b90a8d7526cca01f3f6185f90ad7feeabdf532dd7d",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "88bda07c8c1eb4113f8dbd174228cf4b76b1f9d7fc4d88d278008ae1d4e58a0e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "09e50650c743ba67b8750a943f98d243151647f2abf54fc59aa06e7b39d20143",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "2eb20b17044ed9d358fb8c2fe9647072b0cd63f56d9dc9c3d3c1954f037cad88",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "fea0c15df008656a8737a1f31b9898a2981c696957571c459790fd3d6503c156",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "be88a2caa7b8e5b73cc4a5cc2b68340cbb55113c0221f04e677dc582d2b41c6e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "42346dc9ae45f03770dc33807854d280bb8c8dedb4d1ebadeb0dc7f26fc7150e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "ff92add8cd0c67a0f10792e372392bb80c1b6c2bcd9bf8d32ef9f55271a7ad9e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "e108973da3eb4569bc7900db73e08ce571b161d61ce548e3582919bd897314b4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "b256fb19d585081acfb689a20b513df7e4abc135ad0b2b4cb9b54e63b4acb9fd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "b94bbfca0e4e4f760c390a1fb536f6607de4622e92dc6ff6d360786a83b895f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "d6a693e9745c9162d2d58a104efb1e04df25aa81290346942c2782d944c33b5a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "34a730352eb11e9a80e57688460ce2320ae2504de80a7f99cd70d61487765d4b",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "eb9069c693830bb803e7ca819f12af67d3bb01e890683e11e732bf209763ceb7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "3fbdf639c85191404b9a8cfadd208af5c0e19e9be23813de94e50d79f0573d45",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "a460b1f9992862a14dd82893951089c9b2068f8590d87ac8839c9b9cf4091975",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "11932fc818d70e4ab4d03990931879a20b9068f1604587feb2270eae63445225",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "cd23e026bc697bfbddd628fc2fc1500ef79480296b28e8470ce05b752e3b8876",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "af76c6c8efa81caf6b5a7f6492e2955f069545a1c283e40555a25b3030704560",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "b0cc9f8a4c51644fe900038daaf39f15c2bc9ce7444134df71cc076b94f07942",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "1493f2bcbc61a733327df111233ccd1f8fc91aaaf4000c2ff7f70087ebcf76b7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxathena.zip",
        sha256 = "e1491345751ac911d23f275f631459a00716f64a007b865f2c610b8af3044ff2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxathenastatic.zip",
        sha256 = "9059c1a503daea02b280300e12923e0418fb1caff5ae37fed718bd2426d7d6aa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxathenadebug.zip",
        sha256 = "a46af5ee1116875a51e9fd0de0c18f8f46e4d265a603ed21a66ad4f045030c49",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxathenastaticdebug.zip",
        sha256 = "e542fbf7af57e9ac98f0fdc624a75861965b11bce5256e79e405ff1eaa7453f0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-headers.zip",
        sha256 = "63f38f33fe4b48ac4cec23a21be4a1f3ba561f040b9d5138581d7c895164756e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-sources.zip",
        sha256 = "2428de6349f100e308d330627520c15c73f73c2e2c00b55248b1bedb93eb0d4d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "8fda0f408ff6f26b27c0a5e73a9b61e498c9326d36d1043d7e704abe38c6d575",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "ee000dd697776a981f5d5bd55a1899490f6645756651df7e35d6f1ff572d8451",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "50635dbedcf9a368917cac5977906f00df5b36e9cbc0deddc6da89762ab5d1eb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "d62e0d8281b91734de853c9ffcbe2a6d4714bc588f52946a2bd71aa29408abbf",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "3a15fe2e3eac9f91b186c1b2643d412f08b5f915bf6fad6f27516acce704c53e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "b1a3fb6ee81f5516ae1d82524b43aa9adf0f2a77eb140f5c8a7fa3bca21cb532",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "a76cf7ce5cd19a08ac640ce2c94148454c48a1dd5f6afba67c4449eb37ff378b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "db67ab0b9db3c4ca5fafcfc5e6655c5d05e493ccff11237266d399fdd79a2d1f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "b9beb0a5744ba562d55fcd30beef7f4805b6c00fa3553836317fe0cf4058b131",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "de3e2707bd2e6d56d09b34a880411d003dc6a7569f73847b87676d4d4df7dc58",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "27f7650feb0b075e52c64960497aed19de06acdca067792386ca2fbe2f555e77",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "1950df739e93dde939052b6d374a87246b451e39368e8da3615829f825f3e89b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "33a4097dc96e8a96169764f391b49461d2fcdaaa298d93eb5efb1ff2dd24e6a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "21f0d87ecaa2fda77d0f270b6f9671cde428d0671cc0b8824fb2ae46a9d0cf08",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "9078af9f5e7e07511df82511e97193c30ba034f5fa4aede3ea40185ef70f8beb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "c898d49491fc8703c0325520a2a6926c9ed556cbe174ac238b98c7da4df85c11",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "babb0750794971e18e812b2fdebb3e24a14f8709f2b764e9661f3e0fd99cc6b3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "863d409a74b5a53a3adcbef6068ed92bc070cbad8a795f691a02b9be649d35e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "a5cbaae58761d46eb9dddfb4f4149be885e29c98608ea0142e3527d701b57d1d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "5645bc50bdbdb29a2c51ac404e1f218eeb73341efef1afd17fcb2875bbf9fc80",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "03136f593d849c816668fda0361cc9c4fc4a4bbfcd82958cda916a322119dfb5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "0d712ae328504c8e5a1b10325fe6f5654612f561eb56447aafb823c2330e4a53",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "302e2cd41fd9f20cd17860725142230cdf696da49fb86705bb2f348cb98578db",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "400cbed34fe5b36ee080891b36f10fce927877a854466ca86633770680f22d94",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxathena.zip",
        sha256 = "6b742239f28dc68172eda5b7a70026fa2cf84c84610760d5d3e4e03c886caf0e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxathenastatic.zip",
        sha256 = "5ffc604502771cf526a3949ef94e9f137fa4375417721b01be98184e35c2b490",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxathenadebug.zip",
        sha256 = "11c013474c94a55ccbc8eda68c4642da66cdf883191428992caa83ea55c6ad03",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxathenastaticdebug.zip",
        sha256 = "3f7dcc90d0e5c12da2ea08a4fa31fb5d3b4f7fe839b318a6d42ca3bf5901de0e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-headers.zip",
        sha256 = "f94a0d4be589f849c2422080fb552d8512eb52d28a9ac05b545a17825b97d536",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-sources.zip",
        sha256 = "9578c3e1b346cb22df1507e6c6455e6e695c9147f37918e013c5f7a83a9e8804",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "97671cd1190a2d2ef752c7d525e113b1c0857f6f0912485875468cc9045c9c22",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "ff1a8199a79572e711b1602772b08eb5d7175af2ddfb53c3464ecfc37f1c777c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "b9b3cc45fc4e4d1b3dd738d184f8f3bfb7fcafac5b1ecd51cdca2c0ca89130c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "f079d559cfb9ca14a5c30ec8b4b4802ca4b1c289f30dce9a28070791fee03dce",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "4436bd98defb2d1d7175f0eb3a12472fe2eafd1c80f0fc20b21a504cf2165efe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "2a31d2baf4d55c80b00a04caca959e7e9b6d9dcdba619777e30fe1f4cab084bd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "1f868f597e7c4bc8aba7b1b1b637df98ddd504d4c07c0c1f15a64eddaa5f93ae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "047c5aba3dd4d2f646e3009b302436d666ce53fc68c836cee365979d09a3e2d9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "1e4b2124fc75699f5e969ce949dfcb8c31fef0d7e6776abad7b0e1d87a834e87",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "b52714bdd65bf5ddeafe0fe9e245ce8be752df358bc45582dc3c8201dc50a611",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "3f16b18a5929aa56fca56cbbfc32b07bb30656a92745907ab3b7b1144a236d0a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "661c44bc70e93aa8d652cfebb15257207cb287a2c919e997bfe068329d0433d5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "e7dea3c403120006b3c62232384133784c04f3286bb6a23e40d3ed98e16bb191",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "d7798948dc300f00092366727c2958e6e5cad55ed41dd313c985a8836e681826",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "a9c674dea1f692df9f6396d4195fecd231ba9ca8d90b6fc0ab1b64a7c4c2558f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "177b1ba3d4e649fb9fa633891fab1b8b2244569697876acf419c981747ee54c7",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "da6b8f8d75b1cde2b4db3df5efef76eadfa2d8f3243b59e48f328a9800b280c2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "87a0bc316577979db17db71b225290b1aec8d015e4db39147e33f6b0cedee9b7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "ecbfc6e60ec8bf2b8307f6d56f39263c1129edf6d3a1446e3393446b0ffc4e16",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "48399eedf51aef8b21cb1f0f4cc68900589f92853cd21f69f13d5bb402b61389",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "59186566d06868189b519c4f10949912845461ce4f126e348b95999155f7db5f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "632f1845626168c0d6ac0c8aa6d501257812000bce5c56795a7eff48019a817e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "abef81d059d61df74cc6a48839e266c21bdd2af60dbdc8fcf9ed029108e5ab35",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "32aa8f0b589707363a90acfcb2c3696f502ce58682dad287713b570dd1dbae3a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxathena.zip",
        sha256 = "632f8575b5662a54452a085bcf598b1954e29d99ace726d40399587a582ef860",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxathenastatic.zip",
        sha256 = "d4173a44159d907c0304243b2f94d152f4d8b9351df4c21c9bd7e79692c19db1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxathenadebug.zip",
        sha256 = "ee61ee38313afc303386020ccfc71749bea2601f10c690149ff4861f0747054e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxathenastaticdebug.zip",
        sha256 = "97f8119a3b6e85345636f5086e72991951eb5e93b1663764336653519e2d32f4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-headers.zip",
        sha256 = "37bb6dcdc952d9eeca215fd816bcae6b0426fc8a558436b60d343bae29187582",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-sources.zip",
        sha256 = "024e3a779f60b418bc29e9b56a04aa7c9e63d9099554301180bb370cf1d0fa03",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "05ff24d6f4bd4936cebed405bc238fbe2d9813c6b849541c355b0091d7a4c9c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "96ff1c44a7820ddfca3c29c2e87e0882c749e38ffa7d395c73b48cd36aa20c27",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "d563380701f4e952bbbacb28a85f2b6317286992c5cc27a28701a6c68724acd9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "b6dbfe56fc17f78c3bd86d59d9273614f35e0c637b527d1f821d5cf9d937cc10",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "50dcd4ad8e7c7524d70e0cc1873d28618ddaab7d5383240e8fbcf58a2b6297f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "2a313a67037c3a75bd6813aa733f29aacd3e061b0c3e4d0d3052b4b6f4928f4c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "2d912e6b62475feda8b1c5d5c1e0112d8d6bea563b729d91cfddaf14df66cc4c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "b56972b0f44aa23c32a58a524ecda993d23510fa8c7adeda32717faca2d348af",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "ae5e1f245cd6e05acf301501194961271bb8fef5dd2299a5f51683bc3c023e3e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "224f17b3ecb3e4bf6b48ffeff38237074148078d5ad0850d1bfd441bc4f7469c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "2a1b92bc83cbc7bca0c65109e7abb633350c2b1c8e971a650969b58c8a4332ba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "fc7f97bac55817ab1a9f07a47f8dcc106465d7dc9cfac5ac0f431c4e32b252d9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "8bf07fe2e19c20349ac00ac7a41f57a41e9c523c31ef4891d573ff86d974ca5b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "d84f9aad8952e9534e750a0dd3783880a6b7948c247f1259a2c2a23f16b1a142",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "236e501c2fd2f953c6decba9a9b60ce2a90923d41690e16cc8d292410e542ac8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "a5fc6c0ebabca3335a2ccff50de40bfdb5294520772899802daf9a52cc04c0e0",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "ad309fc415fdf1429b5d6f8d6caeae4f7a9e27373313e0b58127637a232af4ea",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "35e8159ee52ea23f2536a1e0e3727800c26fff29e65881d24b9f073d983bac6c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "0c9c341ba474a7ae105708c4ae01027953a1139cb1ec3a371f48e917cace3e40",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "ef497933c4da1664a2fafb8518984adc59343e6f85afe3d7e1aab374005d7905",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "64c3f794fd59b305b5d19d02d6dcfeeb84ab831cd15db4848ee729863256148b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "99c254044ed5edca7d4428795755bf77b853806c0cbd49b7941baae471de8e39",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "bf9fd7d9f641f356547fabef245991fd52349ca3c941b8464ef991956f5359e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "7b22a09690cdcc3d5f6dbdbb3b31d8f5bf88332d3941823d3b49aa2b5563813a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxathena.zip",
        sha256 = "a715a2d90758c7a14138fe24c058a3291f79455f0e73b4d8d5e1a48403d16824",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxathenastatic.zip",
        sha256 = "b3944d86707af9a1583cbc30815d882fedb5c8a988ce261128464dd7012ce96d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxathenadebug.zip",
        sha256 = "6a7e2e8db7abc52e3fe03c632636be49cb62ef6b6bebd49e0467a2fe2aa2f66c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxathenastaticdebug.zip",
        sha256 = "7527ca37ced38128b03baca2f584171865cab513ae09e97f8d5058ab230c880b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-sources.zip",
        sha256 = "a729285f8f3d11cbec504b7856062e28892ec8468af31def6cd501cd61a6312f",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "97645bf71d84cbc14e1b1df0a5cef01efe924ae554132c87cfdf1c9a99102a04",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "cc76aa81a0c5a3b8e47043e2ae981a3807b9a6b7fa57c272efd96ff545efd976",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "a441931d1f37b4134ee23c7085384546f63326406ee088df0593c8fad2a8f9c9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "8ea6ab550023a7e1e24d6913ff28db8c83c535e2f0d9c0fd45e9e3728a2763eb",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "b2d366f21f791699a5ea8120b0d508fcc78ce8ff6fdb7b2e444e0a22a2192f24",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "7f89f4d47a946ff7598d2e9b71adf6c390c22969edf04a4bf432265b2e656e91",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "5b53203ff6a1f5fa27d7e4cc5474b60cdd06dd6e6c1f0a6d86dad0b81712d9b9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "1a3d95925a4461fd7839a283ce54db36e91a30ada819b4be227c8d4eabf4d32b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "f8b41248a8e8bb03f7400a783905389056f8d40ff101489b4b0ae2af001a1dde",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "1e2c501c1a0f6451766cbf50f46d15b802963d4c59e38004da99efd9a0a70b35",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "6ebca678db806c10520f4d1358b906a42d9637d9f0724cf25083054d776581f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "63292679c1839550ba5d4a9790915f65bae7d7d88ee0ceedeb3e3f0ae138ed20",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "6350f22a40a4c2452cee1fc03b8f372ec89cb2628fb373433114758feb6a6a0d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "e870e8ba2a6af1e6061b53d81d2f27af1f05a8503396a55019c1a7e23d6af9cd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "c69d4d68c18e529f207754f8e73b52e88ea9d0f876173f9adf09524f5383634f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "630a9deaea33b9e5bb8a449c4b7e8e6881f756aca91dfc3956e8eb7814844c22",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "3040493d70313a702bc5301f369647c9691c03a4cb53c1986b8daf2aaa344334",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "622d0007b8d621d678695a762f9f4acb97bcb5162541cc0c5212da23e75a7890",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "7cb59bc1082a63f60d2fa1652da03320f3eed8c4f8bc620f46b6826560472b1d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "133525848ba671d7e3a5bc4501686ca3fd7a1f3eb368545276f5ef3ca0d58332",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "21a2d7cf68b02625cf8081f838dd4403bb5435acecb20d8fb25db75eb81836ac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "c896c7d67040e8615b33fd6ffc3c346df76c90b3bff70e281faab497e75fd384",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "fb901318d23700cb724cabbed0b83df0cbc82658f57b0b01615b4f3949b15807",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "35119faf32ad9163cf1c3456551d7b7fa3ee65602385c55dbf83e50e853fc204",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-sources.zip",
        sha256 = "8c4e5a9e11dff4e11b5c8e6c34bd2ade800cbf6e2b53c8107334741d790184ca",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "c8baa276083b0acc9391db3d6f61b2cc5c125a15ae903b8f49fdcd1de5c3f8f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "a2ae41fb9fa8cb158b03d4617017ea1b1b76492aff3da400c381b187cd382601",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "b29e96a3f0079efb6c0599e0bfda4e6da77d1e23e92860290e7043a5d5829d76",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "2370438686ee1a54195c872fb72904da0c79c92be44277c376bc562edf4851a9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_gui.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_gui.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "ef73069fdb2549f4e08b5095a00be9998330f1515d7aa1236daf6ad16331a46b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "ecfa4efb3a3e718e9bb43a48b672511a2b8a5a2552accd878322a7b494b09264",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "c858a29b18ac537a1b53a22a469832fe8e3dacfa37d91921f492d9290aa39246",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "87cbe62aa1aa96900974ce971b890c1a7ddbc1fc2749061478bb546d80616fb5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "9e8b199cd7720d5ba9ff29a8467d5255ccb3d5bd272be86295382f320dc59e9a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "98cb9f6cbb5f5f1d41555c3177155a9fc8dfbdf852c5f08da786b38089b8f6d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "d504a5568322e2faffa7c7e28f9a5d0dd5a1d1a713448a3dd39fe532b6be4e9b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "fbd9b6006a364583cec49481095cca5e7138f89d110180e9d10c4676d1c05771",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "7078ebbea23d80dd28f59196e6e3df65bce434adf79ecf8cf42c583937c73582",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "9e81d077ed10b3d6322b65ed698997872f2806861cff30d8466fdc0666b58ba6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "28b71a4bd3af01d076f60dd1e2df89b318b19b2989f38ac9cbf3493518bfa959",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "ecb9000fdb961eb6ea0af09a605f995aa4776dd7c64bca90bc80ec3ee77bcb3a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_gui.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_gui.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "f995191b8c909a3c520acd0e9f37aaf2b6968485cbe188ec4a66ce38ae14ef0b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "ba8fafbf6e6659c4f5a990ad82aabf698f97757616cf7863004cd5a6333135de",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "785f6389deb1d7ce29867d9dafc6f8f3871eaac8c5a066fa5e3851acf553c40e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "ff7a48bc92c8208a30341671f1af8c1dabad975d141f3619f3e547d3a2495bd9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "ebee4c42122cd7d6fa86781c2925ccc3167ca4d896baec1cc6e181e40dc4c91f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "904fb358e24127473f55b8b183342d86842bbbb3f9cccc7fdaedc1cfbb843a3a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "75f8f5a9257f0aee3ad9c9e49c4c973b9f828043efd47992113dad1f1c98fc39",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "62eb389308f6e50a5588ede0e023406216a1c083da184f1c5b94e822fdadd65a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-sources.zip",
        sha256 = "1ee2aab37ddc17746571af3511c69b57b84ed5d8ff8898f8569241736fd29021",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "e634bb16b7ba878dc3844fecd15e7ffee0e8dddbd221ba3b4ff742390a25a586",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "9f235acb92857a044a4c239d765dcc314fd2306236eac3388173b5463c86973d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "70a783a2365d506c0a316f68f8074121cf1b0972d42b8feedaf11822bc9e4710",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "882d7d16be364721052b9173ffb123e01dcbe6a3563a987da297a6c9e9ddac64",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "aca14cbdd77c5581d9f12d2cd847041e7c44f428ee84716dee48cd4a8444514a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "5a4c9f69fab9ff750596e429eae298d29200dc580512d3187289888292416300",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "4e18931b06c223b648945c35534bcea325879a2c19780fb8feeaa3b985eaa7b1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "f2251d97b9b743491748fd789d0e58a1496313722f594468cb8bffc3234dacc8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "954da1b9d7ee9515e599ba3394407d2e0eeca424f3f6b19f0585044ed1f56fdb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "6aff95df3ca6318093b20561e3914eb2399ff5566eb46b02547cc2e7572b447a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "68907ed392a1a108c6bdf4fdf3e98481901787810dbfb3a9ef2ad690994da99f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "827a98dafd4400973c7f5c7dbaa7179b63cb2163a8fec44a1af1260f4942e641",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "e66fadb4b38d55700225437b26323480b897ec5b0eb299dce965f49cf00867c5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "70ae416844f0f51d087837f1009d91e4cf8fdd83d24aeb5fe38f03bd5cd80472",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "4248a3a97f6e61e9a6d27d593301c8121c857161729b16e2ca145f809d1dfdca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "ba804762ea66a8a27338bd79fc84a91a73f7d294d26f9f8283f60b8d99df44aa",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "35a8ac1f333e7d24cb531c26662c5164c5742e6b39349293d50ef8302de22ed5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "f0b3a6dcdca94d82f20f23f0a867e0a60deb9547821d04c132c0a44c6e846e07",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "febbe574911826126da3ac1be567415428fcd8df000dae2c91a74460a88726db",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "58b2eddef7ef1c3a947931ab1a43f9906e73a4649a27884364b7b853fa6d1f50",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "85aa05fae83f91e8dbce97de92a9267b27870b57c777ac388e26ec1cfb2025fc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "f4100a4ae8d7e2620457d83c327849a154f15bd293371d4faa1e768a933adb0b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "8f42a14d864785c86fa7a9402701491a6d39e318d4ff5aa2a94a9da47e795a9a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "63b9961ef4809c53add7fcc60ccdd9b22bdf5563848fd9331d95b3413c1ef8c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-sources.zip",
        sha256 = "03d2c6419583bd735b977ed197a151b790e821eaf26057066a5a2aa87091316a",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "16b64c80ddc48c705059ffe78304f9b11b6728dbb87138a2d4d21ce0abcb82b2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "6eff1e27f2b63e914305c06d444e5f27de22556df131e5b6d4ca045d1e77005a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "f45d2d2f96362c6e1497c6a5c1c122a23ee7f0bf65159fd02e21a3afd3012e8f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "029db10bd31f68c14da4d49ad992525f48577b0ade50bf3fdcd7a67557768d26",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "88561a59f5d9b868474d1e3318bfaa8178fc890d046cb3f70957ef0db47cc503",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "c0a476650d1d14d1dadd1d00afab81a869484a40a8baccc864c953c2d37f4873",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "0a20374d260991ae0a6b294fb83e725fa8ad4a6155c1e4b9e0320b87d33bf90a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "1ab6dcfc92adb597b1b386578c7f3983b9353e6cbee65759d817119a2cdb792d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "669fc8d267d1feb7ef5dcdf45289568175fa8d590f9642cd6cd7ccce41fa075f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "bf9fe62a5f9a88b78896c5d2ea584eabdf50babe77fb598184da22a0b502e617",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "c86185e8119cef02d15f8a7d24851ab8ac2ee50e901b70b0a3862cc4c86be4ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "39bc2244b9f264dffa52e7d3725588d9f2957be60422092ea9fad1fd413e8c70",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "f18246e788db31ff77a084b255ac9d1f65547079316c621b6fb019225b2d8732",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "d94f74eb8d37b9afa2386aff34c2eaf3d4eb80786af7dc7ae4a5dd0da2bdb8a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "8db90a9bb2fc6ec01e079ef99acad9499859766c6ff670076d60661b3dad0bde",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "28463bf6b4df7f1408288e93cf74f821241d6f9f400c8c58fcf0d59a01875e14",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "49381bed0d7c9926b9937421a8c726f9f6edf1498007d97f81cb888b6c4595f9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "a7725334177718587f5c6c9030d4da73a49ff239a65923176f785944a0852987",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "090603e8e7affeb9fffc759c949a902fc119f66df101fa664020121f6dd83c20",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "2eaa776847322692f15b00963dbbcba546f2713988db2cfecd7b837989bbd648",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "532c3f6b1630d68ee96bbb9efc11bc7e63575f9b130ac7f596b8bd5ac18f4a30",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "f01d9a20df4f49e9332fc2d7c18e13fbae2c1957c0921468fd62fb8ef8fb5767",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "4437d5979b5e03a98d958158c1a7f859825880ccaadc5a7825fcba8e11fd5021",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "f399e5a3d7a846e16c082063c3d7547f3c5999b7e12771cc34a2741121aa5b3f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.3.2/SmartDashboard-2024.3.2-linuxx64.jar",
        sha256 = "91b7905d3312f19d062a21fb6c3edb8fc16c5f84a6ec5c6889b176dab84ee61b",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.3.2/SmartDashboard-2024.3.2-macx64.jar",
        sha256 = "05e7c4e6d064bf4a4ddabbfe81c5c0cf8c0836bc8ae1f008d76bcd501292ae60",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.3.2/SmartDashboard-2024.3.2-winx64.jar",
        sha256 = "66e1fc74b03ffa9c74cfa03d5948495480c9ab0fd2ab3fda241791b894c83468",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.0.0-alpha-2/PathWeaver-2025.0.0-alpha-2-linuxarm32.jar",
        sha256 = "ded2ddfce12bddaae621a41dd3e86203a58b1b77757a4751d57cb88816a7a3ad",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.0.0-alpha-2/PathWeaver-2025.0.0-alpha-2-linuxarm64.jar",
        sha256 = "3427f66719a287d16096e3506c185101022fd507aeadc9b1ce2e17aa9f651bca",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.0.0-alpha-2/PathWeaver-2025.0.0-alpha-2-linuxx64.jar",
        sha256 = "02f1cbbd612e94c9d2a35513fe09e4896cf30cda243052288015c9686c2eed72",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.0.0-alpha-2/PathWeaver-2025.0.0-alpha-2-macx64.jar",
        sha256 = "11970ac47ad5abc0d975b9587b09ad1291575c963790d42c737a5891b8b0431d",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.0.0-alpha-2/PathWeaver-2025.0.0-alpha-2-winx64.jar",
        sha256 = "e714ca5d6cd1e4b23a1f4a02ab643a469b1dfdaad699ee714f19940ad9c1bc10",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2025.0.0-alpha-2/RobotBuilder-2025.0.0-alpha-2.jar",
        sha256 = "202866330769f15cf4dd91ed094e76dbf45a15e38bbb7186812416cff16be40d",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.0.0-alpha-2/Shuffleboard-2025.0.0-alpha-2-linuxarm32.jar",
        sha256 = "0f6e183808402b07d013164f013e98b0575a535f9cf963c72325ca303c04c657",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.0.0-alpha-2/Shuffleboard-2025.0.0-alpha-2-linuxarm64.jar",
        sha256 = "b4212c98a80ef0d8de68e46e94ddbe7524e9056d23eb33ce388b9e94af254e64",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.0.0-alpha-2/Shuffleboard-2025.0.0-alpha-2-linuxx64.jar",
        sha256 = "f37e0cdddf93345be15c52b3c93680f33507525a28b8508034758ad0214609b3",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.0.0-alpha-2/Shuffleboard-2025.0.0-alpha-2-macarm64.jar",
        sha256 = "7471696c563a53c2c2eba0a2477a227feec7ef1a8ac02035c2ef41db9592ef5d",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.0.0-alpha-2/Shuffleboard-2025.0.0-alpha-2-macx64.jar",
        sha256 = "b4bf4e420b9ed049179ef41a49be54bbc49905390582b3401474110441bf3f6b",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.0.0-alpha-2/Shuffleboard-2025.0.0-alpha-2-winx64.jar",
        sha256 = "1d21fcbe4c042d2fdd762ca3b49615e633b65e661ea245d43c6146ab01bcf6cd",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.0.0-alpha-2/Glass-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "835465029b58cce8449ac38fa33baa7a74d98a0a90093f49e18a82c1b920c4a7",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.0.0-alpha-2/Glass-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "eaab73cc8dac9bfe98c6e8d0ddcaaa94967e252d6e324a52c70b04408d26025c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.0.0-alpha-2/Glass-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "207a21fd055ac4bc9e702e906d9922b2e92fe259addc4c395a4570e5158ea79e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.0.0-alpha-2/Glass-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "1714497b562b516e02c87db3efe4cbe029210a53cdf4d4f5fee97f84a4d10692",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.0.0-alpha-2/Glass-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "dc9b860754825702574432b360a894defee881209fa176bd095ac74d3b9cb008",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.0.0-alpha-2/Glass-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "008f6e2db11251522ad22ed0f5085fc855dbec404dd7acf0095db096662115ed",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.0.0-alpha-2/OutlineViewer-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "98271db5af1d20da5ba2dfa39f1a24b38d07fa14bffdbba45e875b6a2842347c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.0.0-alpha-2/OutlineViewer-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "42f21893f5144f9fef14a6774111e98464603c67c3600a013e52d7863b15eb83",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.0.0-alpha-2/OutlineViewer-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "eef8817b49f82882d18f852a9b9c6867e1e7645efdf9e3ac3f90720d9d2ce8ee",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.0.0-alpha-2/OutlineViewer-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "d92ca776f7b5487e697e7c841174b873290f7e0777175792a9df5159528d6070",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.0.0-alpha-2/OutlineViewer-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "1d40b178720d84fe901a6e4e1c62e6ece0e22db1d2dac17ab4c8de82e8b541fd",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.0.0-alpha-2/OutlineViewer-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "b8e71213e3848a639c2774ac651954c4c8307149e1ea515f428c89db57af50a8",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.0.0-alpha-2/roboRIOTeamNumberSetter-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "7a93522b54c0bee266cb2838e6fcd6db85aad40e09462a8fa06dfe36926b3f25",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.0.0-alpha-2/roboRIOTeamNumberSetter-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "10e34a8f4f10695be768275cb810d12343fd2d64a16215b2b8745c9a84f86ef1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.0.0-alpha-2/roboRIOTeamNumberSetter-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "80fc6e42d8be8c2f17aea3c7538c8698011138aaa20d24b7bc883ef07be8763c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.0.0-alpha-2/roboRIOTeamNumberSetter-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "271d03451c4b1c9dac8c880c7eaf2c147e58743875592cde1b918fa1882fcf88",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.0.0-alpha-2/roboRIOTeamNumberSetter-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "1c22690b2ac9f05e6fbfe5b4ad80158c2aeb09468c71bbdf61f9fa53c2f36e1b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.0.0-alpha-2/roboRIOTeamNumberSetter-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "fa21dd6706a6d3564d469dde426f21a904ae9ef09358a400db0d84b91239410c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.0.0-alpha-2/DataLogTool-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "d479290444eb28402a9d2a6f8c09ea56d6cdbaf237deac5ba5eef13c77516bc2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.0.0-alpha-2/DataLogTool-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "3023ec5e431a4b864dfa440ce3bb6883f5fdc518ebecff537d4a9da10db4351f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.0.0-alpha-2/DataLogTool-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "4805c47b2bce1e24e3e2333f76a59d7e3f92ba29f7009155b6b64c1586d78e6e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.0.0-alpha-2/DataLogTool-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "6b6ac7fa7a0600821d91eda2bab1b80f401a77493f9f9321764951ce17c40047",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.0.0-alpha-2/DataLogTool-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "e1bb920eebc52cbce9bc44f1d92aede0400ac45feaee6a55d3cc277adfd28ff7",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.0.0-alpha-2/DataLogTool-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "16e4af0daff74f98994f4a0fdd9d0d8c2b884e7076428af3a6f8e3ac46b05762",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.0.0-alpha-2/SysId-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "5a6f6014449ef10b2ee6d0ff0f64e117264abedc70010b7e3e8e077ff721e17d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.0.0-alpha-2/SysId-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "be1f784995aac1b497e9eb799bbea2040189cf4fb7f983a3f5bc61ad312bf3d2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.0.0-alpha-2/SysId-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "c87bfa183a3623888a121e8cc42edd51f9f53939f07ef91961ab13267d5d28ec",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.0.0-alpha-2/SysId-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "7381dc0cc84a813fdbfcb69cee358a940461474e469fbd205f37238f02262c1b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
