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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-headers.zip",
        sha256 = "25ec13e1109839a559668d92fa9fa7067b5706ebdb107600c29c71cfbf77fa5c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-sources.zip",
        sha256 = "56d3020045e8ec4a97e7ef4dc6da77921d1fb419454af9442e9d4f4defcd18e0",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "b60922f0f73c4e485ca70af48a73cc41aa56b28c897ce89bfe9b66b304130e9f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "0ebd3e727be4289e7325ae34e694ab69ca09c03c03af3cf274968592125b45f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "6397ee04d8e25b50ee9d1399799387a579ebc355214539754bb4b5b99dccf63e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "7b8070093e653ab81bb1c22017ef3938af1373735aee920c1eaafdcaa9f57497",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "bbab37aa11690a5c05cdb10dc0dd4720ee7bbfa20c88ed224126e52bf9acac67",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "d34c860a6244ed2f01576d5a30e9c5dbb5955812dfc968660e98d3f1031cb9ab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "4d5fa6fedf1cbf99514177359a147bb083ad8d818a32756938a4ad76ed071022",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "d2d14139bfd888bb8b58afeb2637d1b946ba0a8fb39bd2a8c7fe8f9c350a46e9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "7037f140e348fa45ea55435270c03b42264233bd42d9a91d22992de51758b1f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "490d33e94fc44e92eb92984148f82f438eb21fcdd6e5f345ee4606c2599ac591",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "a276aa0202ae43cd776637552cd6d894f414419a4b7f0457732fdba73564a101",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "f8aaca17ecdea91865e511a171753f82f017732fef9db65c4f5e5fb52294bf6a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "dee51dfd6cea27b18b4621116f67548556dd6de0b5a204bd4384337fbf148240",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "d01bdb51f2b21d2f98e91374bc3ace2208dca6b8b2133f1337e2f4aef666ce44",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "130cfed3bdaeede2ae1368b091453f6da8b6bf2906da5b886cc47df587aa7853",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "898d316e0723c2e2cc682621c7671971bc89eb4a2cd93a980ece584c647ab2f3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "de38bfb288f28ff762a7938dc85059aba2bd5b25c1d8a79b121079e2988d138d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "0e10669133227393d31ae870fb630f5b2b645c4a02fbab5fd004e59d558fb775",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "131619ccec4229e3b17e73c879fe1647ee876d6f4261045663815fdc6ed1fbde",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "f6641539a4a25ba5ccfad0021bd0296a1fe95df9568d7c44dc817db448b252b7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "68a41f75168cd7b508d994f4e305669e27a0315dd2d5201da330065a7c797e22",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "c0a51109346a43ed88a768c6b9deacbed294938a4df31e0d923d40527e4c7953",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "53199f5a1912a1308cd7379a7b4b079243b66124dc52644e2b9c9258735cefcf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "627de9d43c1c4daebbd0af390d0be7645d98889b3c03aeb03c153bb6d8b62190",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxathena.zip",
        sha256 = "d626e9090bad82dd12207d27f63d5c09a5e35bcd3c4e6d8f2ec990a873ee7af2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "f4b3a81ab3ba444ef78e01b45c57c726456642abe81ad9b18b181be76cb0b35a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "ddead6bf08c9beb339fc723ebc3091e5d9912f907faa69e1f35a24c4da8c1753",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "5a4a77d2a44bb9ddbad3574256ec0ffabfc3773a8bfb368f507a6b2fce454a0f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-headers.zip",
        sha256 = "2b4a884960efe19c3e0b9b37cc27a69899fb349f528574bad4fedbf7a94174c0",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-sources.zip",
        sha256 = "4a4ef341827c35b5e14d44f5d12e55b5e71c082e2c8df657459749308d1e996f",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "8a13d3afae67a9bb4fd26a90558d3b8eec75b9560f1ea2aa517f6dd0c5ee0a7e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "d5c3fc89f417762a74bc4b4456490ebd50d0631f97f74b5b15c2c92516a3abba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "e4d72fbca170af80f3f44234af9cfc48a1247a9ceaa5a1812570868d2a4cdfed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "e9e3c9b5d84028d6aac4c0650921c464e92ee1f66f0ad1956ef897271df5f175",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "ab473d13b972cfe0fac3c51a1ca2a2ee9e635a7be237603204d312bb3586c1fc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "9c193976ba8679cf14d38dee5d1050880176a8488bd68394bc2ec7c02c2541f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "fe38fa5b8a2a2fc83be140fc01327e411e2888691db933d9699cf7c1ed53907d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "9a8697ac6caf5d32ae9662fbd46fe48347440bd8248f3b40acbd78ace1d97060",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "57a5f64eacf7853f271f558cece32a3a87d1ee635126f4814454b220c22a3549",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "fc3d015fd9ab00c48a962462eaa8565d5772def9f162fe25386a6f43a2adf482",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "8ab080d9a76fa2291a0e31e18608f996f9dccfec5ea759aa15382a70ba533a8c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "b285f2a9adc30bafeeb414a310d7cacc79d215cbeccb8ce51ffe127f8ff0cbdb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "78d0af0b3b20f89c10a38e5a87694fe1e38afe1d0feb05cb7ba4a009d288c95b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "de7b1ffd47d42b340e6d4748fc4510fe7e2c140388aef509fe1959aee699fffb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "1f2261b7a542975fd795e6a7c6388db227f7372f6c49292a3311588e55b85012",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "f2624c78c17207ac0fda5c302089d6975e48b3766ecbee6dcc0146eb5687069f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "35c3af06754cd8a79f86ebe9e6fa3dfd9e69fa8621c7c7a7729845c094b29cee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "41b9e515e847205ecd708f2a52a71364e7994e45481f80c747e08f66cc7d9e13",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "89a92a1de88d359372ad66992fb60b2c4486b8c22eac476875ae20a9fe7e154a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "c0626935367ba121e10d9051facc8df8964d9f1c58153c33b24ab9e413c07806",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "b9f656b03902ebde5c4ea551f77973ccb1e307b1b2eee65049d341b79ec05b02",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "d85ababd8b37a535db50d25616b66b55b8db96a2a8f4d6432e4b09850505b2ad",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "12cecb053231221251f06f78968499209e903a1eaf9619e00e7c45447b547d9b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "f9c78192ca306bba01bc43584c7dedc74e79911e7ae1169aebd66486ed31746f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxathena.zip",
        sha256 = "eea0f70aad9327832a0e1a9a8bbee45e4f046aa571c24d54bbc8d19fa2b89c34",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "140d9a735b23c6fc59b169e3fb590cd6db61368341a7924243ca3be85521b7a5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "66a51fc671e5f4fc0672eab092cff6db5a146d966ca9282de765d30c2e488ab1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "e04e0375165b67f8c354235bd87689cb755ed1e703431acc1fd575a714cd8923",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-headers.zip",
        sha256 = "ffa806d7573a15de30b5d8ccb23bbf7a19efefbe5b283af453ab4f864fd43be6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-sources.zip",
        sha256 = "fbb761afd3778af4b271825182541db2843c62c8e14180a45e99d3dffc1cb844",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "0ca47d0970842b9cd11ed8060c77598428bffa50b2e95c165f3780b2ec516796",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "9d9fc9bc12e5870608d5530d950541f1aa7af9e70e7781dc96bc7906cc8aae2d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "f776c80c65e42e05881b2f5662fb65b276932139c5eb2814a23b34a28f339b25",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "2fd7aca6d929a9fd8430a58d1f582d901ddcd891542e8cbd5bb63c03e5289ae0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "7ff5bbf506fa85298b3826075a74addcd125cf4e9973602fb4c8ff01e2d272fe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "1eda1515cf4dcaac23852fe42d789e1993c61ab722a838c4bdd63e83e19972ec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "c225e9797f492511ea069ffcb7f03e123faad16acae82fc2abc6826411ce05ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "2d87c835a7054c1d5d40917703ede28782ee8550f48f1d1c2e12e5e0de1fc1de",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "9bdc82c4f4407ddde3cb7862059f8339aea7a1deba693615b6cacd66d6aee5b3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "19f3045bc455fa217c0cf0c7c6ed09f59d257c16b7fe98547b94a6efcde3546d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "43ece87126ab56b112baf5eedf17153520611aca65fa65943dc5054fdeaf4cdf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "7820e57c7a3573d45c25a132ca899e8f094c9625fa324050dd5a65f51301d8cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "6e76e20176e7c3a60a3ec679f1f464dee9110d20ff6f6fbc4654b88dece0681a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "1319854a3d034a625a251e1739b5f54dcd7c6a18d9b9785662c8ed670a7c2074",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "d0076113f6810851166afb68ec5cb3d73c9425b95055f36d5397d8f362713fc0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "ff451c7b51949190e613b0dc9a42ae25b9574af9e1b8f861c4d8b4d46f9812c7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "c9de30e26fa8093f5a93cb7a54e55a7712318341b6567ffee255fe3578aa6df2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "8e7130ae52ddf409331bf25923149ed8a53ee9c8b65c759b918a1de11640561e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "c9227b30906b9ae41cb36cb26f5728df0077ce302e1d617cd44647f73739f6b5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "1048c6122f9ea239ec2b111462ee8faf38e83d95cc0c802dc3d41e048fa379f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "475004bbdb6df4db3ac22fea17b0864b63ce79319508d7dbc39ef65279a84b94",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "87ea99db4ef48fe808d9e4d1faa889266c1c7fda363202bcd9dd8cf52a9dece0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "835735bbdcd0bae03742e048b97566567bbc09ef0ffb75daba2ac1dee5008243",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "82c755c6a336ad1fadae765cbbf00dca93efb03636ebf6fb01de84c24d639487",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxathena.zip",
        sha256 = "56747add2a21a9765a318628ee154f93aaf96337e6d9d00c78b6fa7e21cb60b6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "4d139ac0c712c2385cfc2170770774062904270b4062717d4da0d69cbe9a9684",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "4c57799cb35e139a2ed286e282cd33531460bb13f045a36b572866da86750941",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "a0d9614392d3009a4c23e487514133ed606fc7faed6695ae97ac97b2a931783e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-headers.zip",
        sha256 = "79075e1d312ded3b94a7aad6806802bce9b05f2d6002c50cd833610611e3f554",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-sources.zip",
        sha256 = "de76a5d0b4e1de8c73441cf6320cb2590913ba46038072af60605515446417ac",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "04113e7922cdfed06c25ceedde0c7d8ad7af265b9aaffad948828c0609c8f25a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "3c69ea514fa993b895ed43c5f54af00e94e54d8fc2fd1329af07e18a3e611636",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "69329d86dbbec86ee3f66f7c5101bc5e43b249b88fa1e3ec1a1a52bd1611398b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "53788f37d81a1b18ef5630d9fbcda3b1a271564413d331f4eb1155fd36dd013f",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "354301198f221e8035bb976f46c5359ebf2bc1123d4c91c44eaf8ba043c6e1b1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "efc4025334ed8d21b61f63db970bbcfd0d9d0339219807dc873495dedcf7df50",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "3dd42ec9ef5ac2d6a0f2eb0e7a3e5d1ff772cb1bd889aa79456e5ff2ba552173",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "0ea6f9faddddb733f00223fe8025bdcb7aece3d63afa2242438026ef5cdbc9bc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "f29907faf70d2871d320711d8ec1dada3534f09e91c05a3aaf69b99be9854064",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "2b5cbd7f3d3ac49670eb36e9b36b1f8d9927989a48b146120cd9696f8e1613e2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "1c327789aa88ee285ede3354d7f2972b04f75b3ac123b3da41a4bd9cc4b53c1c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "8aa60c46e2001538e4e0aed7ff5b3dfc3982aa56c4db936f7969989160dc8339",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "37a1af600f346d394d345f4cd8a289bd8aba9f437c6f8445bbaf8023c83501bb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "fd0ec8398b0ee15c2a7b63162821764b4613aed30ac41bb10ec2f8ba8383cecf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "72690740d4466733e5250420628e7846012f63530c8ad7c2363d47de1a2b5e8a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "45891fcbf565cf3112f113a0cab1b9e3602eb7ea500746aad72aed3a7daf205c",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "407ca05df6bda395f680386087bbf6540851b09b9d1547ecb8e69ac293c4d89a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "fd5a6f64fbd4365e6332840781ca5aa7207f3585cafa8a4ef4b14ad6fb7125a9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "e785181e2fc2b0e1acce49455953aa8749577163a90c184c14ef4ec290e9814c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "2eb56f89de243388aba51043cdc76fe525f8b4c609f85765c3d7d5391d34609f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "767e60604a1b3ba394c220b61bbaf547a2d3452e8dc6b08f443710acbf93763c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "842b8976ea83318b4286b1394bcf4920478580d916446cd86e3b3f231450c906",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "2cb8da17c21d1376779a1dde4ba04764f8fbae5dffa5d27d11ec200b63a30a3d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "9711d4994479850963986fde791b495b2243c8390b7ff203cfb537b6d6f944a0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxathena.zip",
        sha256 = "3dd09ed416b9c4113686df68f43f038dbc27d91035f10ea2e67157f63ef7051a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "cb43a4be375a3b1a69f938da0efac552d0a2c61d820737c039e7e845a6e36db2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "4e2639e771177abd5bb4e09813f9529e7de7291cd58030d001eb505ac32315c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "4cbe6d07d2c0ba5ab4cb642889f97c8ab771ae0c5d218595b3ae8b4c9a4f8d77",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-headers.zip",
        sha256 = "be5d1d4d6b2c4c2f4a9ef2fccc258813383a49ca41c8ee75d1f79ba5471b8c08",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-sources.zip",
        sha256 = "db1ef53cffdfb092578ccab93f492206adca4a74db5d32189f08971afc643a16",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "789a6b1de95efe672fb69d847b6c48c5031e19c1d1cd8110e5a939c55e0469da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "74516dfbdfbac444d59597b19667e2ed354c98e221dfe399607ea812b143900b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "9f4f0ece41aed7f33e3399561f04e83fa2f64cd3f77d5df6bedfb4c16c54d46e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "784622e43a6959e62b91d0765b23d0c898de960a86c0f53a2950082e18a74c20",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "8869b1a9737179cbb687360344b448143011fe5596a8f0da64b76341f6ce42f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "d832e1ffeca6cf6f093f8fa4fa622814cdc4464ba9ee2b4dc11e6d64cc5df30d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "64c6f8ba32a39a438373d0046dbce7f82f4bcd9d719c5e4c0d6e1fc401b961c9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "320896d3775700bcf4c2f0450b573f54c3f872e1ab56ea5142530983a3201e73",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "5900289617efb705719970a7e5f73419b22e716abbcf7dcbd5f9ff2c1bedf141",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "e6a17f03ceb0431025a90900bf771c62ce03bef2f35661c3faf1197f711d98e0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "a5f2b0cc475443be39186d3b4ca04e312e2706c5fc8312f267468aac16201317",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "e5744c2476cdfb6fec33494edca7c5d294b2f18ca084a90b83ea5e622b90b0f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "58eef4ad89fc9d8dd3c91286340fcfe7e548443ffd46c7486f413eb3001b16ec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "e2b271086c5cbaef0ae5c282e78fb604afba86f46e279b4eaf68a55e7e2bcead",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "5cefdf3204929d2c4de8917899413e64eb3915779e8ddbf22ab48bd345284783",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "c2c4122ff6dd56e86d6236d25fdd9322ff36a5ae7c62ff28c9124dd5cffec636",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "0de3ffd6ffddd75a9f1a37440fab0657078ffabc96d5b6681e3d62234d61cef6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "37aab0d07b5ef54cee9999c3bb272b2fbf875d5c50956e6382c7a44777081071",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "abac2574f9eb43d4b30a2dc9b757c7538e6c039b2177090a78fa47fdf0a059e7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "786b60500c83c4c221fced395899d40f5e1edc08529330097be5ff04a7c637c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "5926ab0c2b8f2f879bbbe52da4bc4051703f87e7b22a14d898f0af1118cb3299",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "433f5cd80a164cca35ec24dfc2b686005bdcf9e396c0eeee6c56d60707f98576",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "7f1a3e408f1a13153f4fae0f4ba86bbbbf0eb8864bb7433fc56dfb00928948e1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "ae70d9ccc1c0794b68403961b63c891928750d6ee71ba39586f428e87540fcca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxathena.zip",
        sha256 = "3c7cc8182c35e047d43f57af029e6b5fbc1b70d1ee93938ec9d1ac7f772401ec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "bca33eb940ba901a07e4db7d7c45f3b999b28c8f5c0ff1accd61f7175006a534",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "02ea84993591ed3c3eca1331a83bb6134d0df86efb3aa5ed4874fbd2fbbfdbc2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "491856b00243ca1d342dba5da7b727b197e1572872c602d5aacca295d92c11a3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-headers.zip",
        sha256 = "b5d833200a7fe4eba0e263b4f4c96245054ad2db8a0e146f7b70c8640b4c98ac",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-sources.zip",
        sha256 = "04b091fddf680b7b1e5dc16b37d5bfc58847774d5d56abb0f793b6682c7295ab",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "df9be9aec8083db30bc0170189e4379aa97d8c95870871387e777e0c2ae63064",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "4dcea136cf2f8240b15752f54f2892b583c4c752d3a754d99e8f90c0297e66a9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "49ab39f65f3d7639b5153bd2efe9a39ecae75ae5314d41e46eadcbfc7627378b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "8b4d761514e163d93d4dba45038036d31139ca6ddcb15b8db3ad3ea97f4906ca",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "4d7651d84bfedfb37e4b0665c35e55da0a609c9cc825720be1ca739d6133932e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "1cbbe8185453c46d8008d29293887aa9edf9a49b4ee7b398dbddfe6e78dce40e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "5f878de05b3871f5aa402d3b20712c1f2bc69c5eec685e6966beb5842112b918",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "3067f9f52a088ff8826da39b3335c9dfe8d6865192d3258ecb97a2f2fc45bbcf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "5b24d9135bb5b957a4ca99ea41b11594b299ceb6d7b2c6ccdd988ec4d7f23822",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "511c45495694ab6aed1cb87a6d1ee71f66b30496391ea449de5c8001a4ec9fa1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "d548a8a480badfe47c0d4b2349fdcea051dedce2f413d200e5d805f7f8b83bcc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "3f2dd1329f9012af88c95c9868ac5e72aecd31f41b78c33135651cb3f5325a16",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "13b4598828d9f7c64cfb5acf476edc18329563a282a374b9e83687c836d4cd92",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "f3c9c5ed7527a1f490009b3219d4fc658268be6b1a35a5436a9edee08cf6bb0e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "a5505a2660932cee3515e352d744f1b591175a695058fca10e38909e3c0930c2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "31fdb0bae75decccb115513e6dfbaacdce2e07a1988807e0306ad5403b82a210",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "c6fc7aa72d3b8bface08d550b0d94a6e0d6f4df2e9eb3da608947f0e9def157d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "49986c2ec7cb3133ef321508c3799f44c7982f8b5009a44add4efc549667f7fe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "bd6566a06ec299f11182a80bd0050c0ce6809c1fd6592b8b97cffcc34c6c438e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "2d64877ef0e2a621df5fe0e1778def347bf201a007b9aaa0fcdc99e2c3c98f7a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "f19e85aa1e61530e1d1b859be2b4e8a34493ef43598390566b4067e2b39bda6d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "ba959deed7a01d2d497c64dc0d78e16f1e3373924cb942b39ae1dee2e9734538",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "c4a99d5534c47da7fd4eb0c86eccde3415920a6c78132cebb10afaa319bd3991",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "9c26dac56f9386c1fb066ab048f9e268346c09a10ad32da857dd520c20ad6a39",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxathena.zip",
        sha256 = "37a1372d0040fea7b999f53394f19274e2dc30acc9dd401291df4c58fbfdf698",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "942b2d6d5508f883b528d67329edb1c4d6d92a1344fc443741ea5ed46070ddac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "3f740549db23d2babcc37c56f5177eaf5f7369a2ff60e7ee449dd8c38a96cdf6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "fb57237e2aeeab989f72460e641ac97a4611e08070cdb95c0c6f1379acaaaaef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-headers.zip",
        sha256 = "3438cdebecffe150c3fc8297a8541593fc4f68fa845884ebea248de0107f8450",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-sources.zip",
        sha256 = "b32b82c2f8801fc14bd8795e223847b234d248f2d2367914174f041c8a9a735b",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "9f2e4998f8e7bec6ebba98bec0db56bebe31ef405ee7ed7fb7e5c66767011bb2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "be46ac3a898df7db39dbafdd554fc7faf3eb83ab639bcde227c30f96de60febc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "f50491efb6df1d6ab025b2ef2de8bcd4d5b764ca39515d53044fb17e06354a40",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "4d2315b4028ab14f5470b5b8e2b842b75651bd0d73ef770ecc918b0620767f9b",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "29c05e4ed8e4244db6927b101694543fc44e94ad76c559f93669c2bd963e3abe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "4a0a79fc1c3592d42ea0a048f15128af2cf130ac66e4f924931f3238655fbe47",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "3980153651ea0a9faade16bc2f6518ef539f486c4cef7c6e55206d9a916d8922",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "d835c9d9bffe0019ba8210ab0ec6189a294bead2c6b34e4e7b7d91be9f933889",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "f74d4a4470e5cb512d243b3719102c63cbe1540df9e4a4e66fa2e615cf6522c9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "796f30d26fa13b4e4acc226b638457c0976f79707f5d05a508e413bca7418805",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "b4d5f9a687730a67f24771a235930b405c8a41eb357e7a3f64ea7a0c18f35d51",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "8d4907dd54cec893d1dc4d7aac456271b329ae1c0a2f7714dedc8ff87433251d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "c720f5b6a0159a85d90632cc1111573b1cdc3015113d5e1d88e4b4f2ef4af060",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "c1271fee7e36c28deac4bed45f139b534cfe4f6c4f9de78dae0d6d10c02f9a50",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "a1dcc4984cd10be7f2bb9513b1a2e14cbd4f16976bb0542c5ad33fef6c8604bd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "ec6f54afa76e0043ef863ce89feda7c0f9d4d59d0131bc2b70c036a311c419f7",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "d20af7231aaeac715bfa93258916b09e97f50cc91783ac85be9a03d9562c5168",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "cca3b925b792971c4a29ca4f1bbccac532eed8327eb550c33a446d5148c12e5e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "bd7977a911066e2e56ba67cdaa694f3607c79d1a6fa9fa024968db4a596daaa6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "c7457371d9df21d3468f9dc6c413b24d0010b876d9dd246aa89f69afa84d18ba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "ab1caead3b90443f2b143904ae5e14a470ca3f7edb502c1a5c81984416eefe70",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "fe92d0f844be732c9a0f529de866ff3dbe74168995159224f05287bce1970ed1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "2693225ed853cbd2cb77cf6d0208f5d597ff472f30ddc82855666244800d6dd6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "78fdc0678f48c685970fa95efb26425c26f41a7bfccbdac36057a06db4fbec83",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxathena.zip",
        sha256 = "ab2a38538de5cbd362fd95122fef4f3e038774b3e8fc5fca84e59cb2c8f14870",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "2a1f46a79250ab78e0d2e2d68b2f9d6cf1ba444903a50198d447410b89b46ba2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "790b7628722ba3aa3b4639a064a9e52a1e31acea1dae69eef536c7de04b03511",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "11149d2376e42448668d33221393e7c1813e80d268ddf85332f0eb3d3c6c2fe1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-headers.zip",
        sha256 = "821223e6a112b17edf4eedb35714c1e0b2495138a6f35b745d826d7f60047014",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-sources.zip",
        sha256 = "777b6cb083f0bb6128ab88c6dca9b19bfae968c6c547e825571721f86f026f3c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "6e8fe1d3a9037aab2be939d5286f6d44c58daccc82bd97c24717fe302e4c91d2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "3df96cc0433e908bd871eaa6d17569487954d315e3c52cf7ff7df3ac9146f0c7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "c1946f27c21cd2062ccb529ac52fa331c0cb5795b6359ec3424f1f6d71a17bf3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "267aecdeec449c9f4157bea51a6959931680a53610a3ce5e2288a0897b1ac480",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "a815f233243b9114c9c4b7d2a1761b97b1507d255e098a9318de9075a8af271f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "aeee412a91ae90953461b665b2976471040b00cafca32d226f003af2c591bafd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "9093ed2647ae7d5d03e998d1a89c4a56ae37ddc3e5712f5c8868329438420017",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "3042be461c86c43222f610ba4da079ec654cbc8c19aa64bb3c66a82e9e0de769",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "811ffc9662b2eca361c38e0a3922541a0fcd52d223efd6fefdaa8a23f41ae32f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "d593b2e8fbb8b7979fe3b96b0d4eddd8870b844afbb72fccae6d11e7b4f5224c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "cc32c3be0473b7a37f00bbedfedc634aba57c297c8db4fa7a0477952e5791af9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "69f153686c02066d5c815edbd18785c3c7ec35c9fde9c95e29f3d780fe108069",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "4c1c781b3486ac39da192ba348bdaa55d4115b187e630bf6f35f688ca8ed353f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "a3af10f09e5e6759aea40ea47b7b6509b1b60682a1fad56cf88576a859cf700a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "ea8a0f6ad15869d3990b85923801f3c211624bf9846e80f5664bbd848544e2cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "4fbe261e08b2d705465ed315473ae95516839cb6d676f0e0fe95f465f5ced4c4",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "1a4676b56407eb55c13fb41b569c7966bf461e2731403f0e2b6686b07450900a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "ca563cc3be8ce2df5a55249c7b259b22e444fde1d2c8557b7b47b84b45fe28f4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "9b8d8fe90412736e25e249f3c3a05503c10a9e8185a331497ee89f2117ffb35d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "ad46e8fbe22737c5cf7ec8e4b0226ebcb2f3af0cf98e903e318ad593db9cad19",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "d07135edce9dd23a0da640f6dd721f41f4a6501d576aa6b4dbbf8e671d62cee7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "6205da8541bd6e8e0f151f5eca6a894a80393e5ab417c813a2fd2b0587e6792d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "d6968d056da5fd645dd05ffc6b56cd73f02a85bd70be0229514ba582cf1a3dce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "6acc9dc440728ed2da057a18405c43ebe33751bd46cc1657e6c9ab376f590eb0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxathena.zip",
        sha256 = "2c3f76aa85c5b4d270f4c5ebb8c405a183e5f8a69f95842da5a144874133981a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "b993a5636602ae6edd34ef8f77692d6650ccc559fb012689ed022ce7bd57da05",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "b8fb2e6d5d784a95f9e29f37bc00d34061a1532e08d821052870a364ec2836bf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "456150211fa3c172e97a2aea288d8a6393dfa3a23d3fa7e72cadfd8067e968e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-headers.zip",
        sha256 = "230e225900641651d15c6988d9798d150280054fa23950e7e14b0dcff7055bf8",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-sources.zip",
        sha256 = "96a2d14c08bef5d063845db1ffcc6346d1cf900208ab61c4c19f011e734a59ba",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "68dfabe88b18024ca28cac87387df7314aeef5a251bc4cf79a7df83e08f33201",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "1e0843523d7d4a7b2071ea247284fd7594d7b5e7850ebff969123ca1e95f0118",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "1c34df87cbb5336c8d46dd08b6da508c6477beda90b419f6c5c96eebf05402e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "95a7bd4ba538d3aa3f6e9da2c4f62580161e6ab79bb4f6047ee1f0772b2fcfe0",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "a53ff557640c458bf37e5ac6cfb44c44ec4056d21939c5913a8500a466a93832",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "9ea86b56301a8236cd2ff4aba8a65c5fbb96b9e280f8c0351da04c333a3e712d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "28b826ed937d37f4884f0894f170c3081e2bc4e8a5f4c745d83822d3cad81820",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "1b6d29ab2e3244b3c0c71a0807142b7b5700927b72846a4328abd945d471640f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "d93a3a29a1ce588f1ffc70216abd5f9daf0722853b93e42061030e37a17465a4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "acdb3f288eea428f4e26bfd3c546aeacfc13060cc8ad8ec74be0f50d789f277a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "ce1be02610874feb2fcc14fef4d7c5c5dcf1f4b77d4544f0d56dd474e5171525",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "400a5a4b41f90638dd3f85319fce4d5c7d01d31026df1ff387f13f420615b342",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "f31d768a10d27e07250e25c20b0d2d282f37393519de1a813b5e5012d153e848",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "909c33da6feb88afe7f844191d812f8db6a1a5b03479aca2c4b462ccea6c77e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "2809670bd1ed340b6d8130474af825dace34dab0696d55f8f89b4bbb69013fd2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "bd30573cf73f61e94e1a76b2fa1e3c0b6b82653ef9fdedba48ed1eb4b5815678",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "f49f9633ef1f890ee392a5164b70fb61340cca67212548d86d427624d24a4d09",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "1e7a0998d78f3a4ed7f017688bc3bf7ed80b53f01665f8b6c0e79542f15b0173",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "2846cd0cb25e08d797f22f170e5133e37e7112f1be49d93af350ad2e164cef38",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "a4ba024dc3769fad68e7cc8dff4888dc60cd8a64b1027b65907ecdcde5e3dd7f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "99814e533f3691f244fef4fe2b43079638485f16707a90802a357edf278a3738",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "157c49f32ed4b6ddbbbea899cf4b2d28442ffbe0c7ce7aa9c942c37b856b58b0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "0e42cfdcdc0bdfaf29ea59cdf0c9007f9e3bd06ffb97a760ca7754cccc2d0ded",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "b37b19b3c06ed55dfd588b1ee68bc9b787dfd37a2845bf4dd173f0a553c60afc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxathena.zip",
        sha256 = "735287c41e0708164ab00084415a509b46fe760b919261db5de8167cf3c621eb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "ef9ea38f0dc6fb0cb1cdbb805123cd7305218670604dae88ee68a62bf501f456",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "061ba19362055f3cc8e8cac610e2aac75a45715a5c0b7b6b012eb90f05c0d386",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "46b03ab2da0b0f4c1f875cfd229db43a6fc3314d06e84e4e0c151f055577b670",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-headers.zip",
        sha256 = "e93652eff37da105e06e2ed0d854b0b3658969ecfa711f30ed6e1ac392565df7",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-sources.zip",
        sha256 = "890388e540450fa12e325b26d7aff2d8b2bd20535c9eca0427d3ed1f0bb57440",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "a91653f7c459648f66bb6deaab1ccc7f3485e4331ba051059d36473c2f275e28",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "085c8cdf4db5779712a3642549b8bf9b91a568665c6b259cc7c7c5443f68ff53",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "96c3a0fc07c6db8b028203323b87722235b51ad0b0ea7dce30230205c23eafc4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "995200632708ff2af14a8a8d65f635031b9f1ad46f7680f86a2d9e246493bbdd",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "77b9862c9d6c01ca20164146f4cea3dde3966c0a2b47c4fd84f659a3f313e2dd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "e019e51d86018717e015c87ab3d02adc434bac21862b376035bee95348870e3a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "215d34df505f3fead0dacc75db7bd6947b8b31ea895c26278ecc8a6e7771dfab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "31cb32e1d76737931e624a156f2a019139c3ca8909322f5cd5c4158461b9e125",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "e148485cba357e9ff85719277c29d34474857b4aa187ebc905eb2604cb4ae586",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "b8a3a91b099edc56fac02be0ee712a706a87119f57bf02caa7b484cd4c9cd6f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "1b77b9172cb4c72f8f9d6035ac4bc890700a1a17ab5971fdb77341f7ffcad694",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "10eddc5da2b32fbe0f40e1a7c14e331fff375f6019899811a71625fe024b9979",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "18f51508b1548be8e30dc322cee033de07f6c88005a0b17315424151c73f2603",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "01beac011e8d5e50eef1f77b53ffcdd30d35801fecaf027632306231cbef8045",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "d6e92fd1dc32549160abb2adf9c81809f825fc8a05248b606f778f1b7e2acff5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "4daf4215bf146ea1e569477819f81586aed063d90e135492b4e60989232575f7",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "eaced076588c71fa03dbe87fd46177dc79f9b9a6c0c4304608edcb31b1a4b60e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "c26eab4d7a8c121c7d492945e5f93cf23b01eb6454a080b78d9cc95dc5aa221a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "80e0206be7d4fe9fc3bd3f5055fb468b0894f62bf7ae3198c0d09553e8330fbd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "4ca55553e26fb98a0e528689af828a2189cd2950f4b3f23667d98762abebd9fb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "4418efdd639b0660b46752691a02dd424a70c42989f26aad2fc5d8df6a25ff1f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "b7d241dc2b10552b20e8248ed33d49f515a4d15b173c537b37a65b75a7cede1b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "5776d88c7c9278764a92e900f1b51b52c6b9fe48b0dc0492cbb697691c107fde",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "c184facfc6a3a5419107b4ad27a6a7d41a0b2e7a53741c8550b4880ed13b8ba0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxathena.zip",
        sha256 = "f7b13c26de38c8c99c8eb9c0d3dc1f48793a0d071d452c7472f03aa4daeb3e9d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "e6b85cae9d74c764ff2402be1b7b4859ba1c2d6aa0d4af79b2cba6c957c98798",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "164d69261ebc3dafc0ed70236d8f34182809a9aff8fbe4acdff5570c02fa2355",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "1350d63e9531a8bf1317529139cdc20920e4d9e57977abc4fd10a113438fecfe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-sources.zip",
        sha256 = "7afcbe616cdda4df4a7627f8a02c8f3886fd7a5b5cd7ddd86381af8e5ddcb73b",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "c59be3550d287e0100adb7fe74ea69997d8991942aae72349ca67ff9af5a1486",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "d5d9bf13c7c83bf519cd5132c098ac053fecef706276a0a1060abc9260e9a30e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "6a7df2e82804ceee9b153a15be83658b47ebcbd83e0c9801e781200f61a5e63a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "c9a8b5f2a4f49ee669f25af275994aad30235d999ab4c26189ea4666205ec550",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "2cc4851529b37076ee33502cd9e84826757c4ece3d7aa79ca2a9f3b34a6a80e1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "e11628d21b3b3207ba93661b687a7605eedd3533e7ed7f5ca14b5787a2879184",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "f3c31eeaf61a7169dc0b5ee2cdc4d0dfbd28f6acb457c9d9f730041c2ba2823c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "e8fb542a3092c1192a4edc6858293afb19c8a0eedeb41ed4de62c4e1e82e0f8d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "51188228ed524f2657e0d15b2e42f08908191e8ec5b3edb330f95fd16963d86e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "13af5e511b5730fa47c3d07dd2652f5b2d7ed391d69bcb8c8ce6c79ec70bc0b5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "92826781e025c708ab299de2861d7d8561baed3026e304e00b780e36277c1181",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "3ef6f20c6c6f839eef53b717c1081eceb725bcae26815cf2cc902895967a1e7b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "184fae552ac9aa85a70b3ef4c8d18c0313bdd68ae9d1ba0247b969f33541bab7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "ef459415979bf4324b58883b613badc58ab90b509e143d346f808b7ecfdc7881",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "50eab375b514569c85425deb8bb8c77c7bfdfe1dd6aad1ae1de15d49f212fcc8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "564931e01b6cb715f1b9a9d6a7cb71ecdcf594f4e2ab0197be8050dc257e5238",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "39105db46d5b868712853f692e0a7985005b814f571ad2654254154ebd0a91c7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "56ee7240897f99ed5b3a8f0a8afa34db2aab0a0f31794bfce9551cbbdae2c4e6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "7e90d56d9c95153109ef6650907dece937a53737a0df68d56a9814614862121d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "a51e048226b49975ea5b3acf7e98a074e416da263226d91f59a34f1c3ab854ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "c6599aa114a563582371760fd3f4016e883f16f9fff133d09388c42846d45b6f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "b863a3fa600ad5e0def6c32387fb113abfdd81399cf288de5a752855754cfaba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "9ba8020686ad223179ee954016488bdc775639ace23114396b16dc07957e1b2c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "1d2d806a9f17f8e4b1ee508cc54777ec1a9891f7f5f6053a37f540ddef5862b1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-sources.zip",
        sha256 = "2f516e4479572d32279668c75981a0b4ade1cd99e79be751d891a04d0431dba5",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "87ff4d9d2003daab61e6834cfd91fea1cff5d2c7b1664bd4985b06fbff5a084c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "1688ac458902577a3b2ab74bdb8bec6484c52cb1ddf2eed8f2b73377ac156b17",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "a9ea342ad9416fec70bee48d4ad42125f4f9bd7fb335912e84f86f637ec09c06",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "9a56fe4ce96ee639e76997fae273bfe3189db161150e72cca98f54f62e692a20",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "6e47795c3800222e22a9d8b5d39478fb637f964e7e3f8afe9790023d02b9add6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "ab6bf062e677eb52dcfa4b2794b7306b7288e0016c9313f5715572925ea9846d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "d8f67538bd614b5e301f547c9ea8738f1db8ab6e1890046206d583b189938a3b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "0925954be9f9305ccaa3a82436a49b299f4231dde5b8753ef83f22d89539f56a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "d1dcdd4025eb98fdc5545a5079e3279def755365087a5df2cb6db20786a40160",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "3e6102607e3f2543a91797a1a9e986e81acb943a1928421e8551dde9fa64a2b3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "a9c641ceb7827890ce102d3b56d04acc7b310aff45d252772be40b36810da18f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "4240f8b58440e266e6cb934596945673314431045cc001cecc5d86e51a169dfa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "2a9c55461f6683464689e4f3fe0a8abc32cfa005d075267e8aa3067e0b241700",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "d96e24285c84d9eb7342bf34e60a8d731dfc1bcd4dd6ed62d987c29f4eb71ab3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "d05caa3ff7d7c48b045b4175e7f31f8b76b6b7ee31056223db38536f0160228a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "705bf717e6705670f22f74ef8a03339448831ba38636c9d510851c3bd2466214",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "08e9569b5a5c63c942cab737062aabd1e7ece3c1f05a733a4928bfa8a580f477",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "dc480be78f2ba7bd746c7a1c7c2d6d7dda2a3b045a98d4247ede32e95e374c75",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "5f7b13e94254067371e39550ab7d80ad6447071b52faeb8f5090f396d8095da5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "9e02665c3e86def47f701a717d121c46bcecdac9f3059784ea5129c9fbd51aaa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "f97a03fe53573c5114a60382a0d8c7d28a9219d5f54ddd7c63e9d6715f20f10c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "52eda770388bdb3896d0adfd40c5171e9c7e62ff7baa0b7775b980fd6d3ad6d5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "a18b8c42e2e3051989aaced37bce0d4ea0d5becd9d7112e484f5d1346a88addb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "5c6c5c40bbd494af93fe13d9e57154b8c98ab34e8352371e3c72331a701f598b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-sources.zip",
        sha256 = "9849f110084fb0e2c1136dd5e8294fa0ff2e613888e76b2fc25ac6186df33dce",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "acd17a3008f46cd9c4c6b9ae1a5afca488b86c1e002ec4109d29679f9633a7a1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "67553d165e99a6de4a7ce15697042e905a2816bd6eac475bafd79cf2a1ed30c2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "c4c6da18f996673ca020f7a490d508fa03da43f01b5dc1de75768658e549f942",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "0091df095638be67e5da9403b995d8b0973afed475d98ded2364cf49ae41797b",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "ff00d786517c251ffc65ff208db62b7a81f78838d2abad98e7b6ecd6d10e4039",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "92d1fd359e5c6a8eca8a7536f090bc4c581692231ab24b224d6412f6dee85530",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "09016125a0763703453580650a8ea45349d51b8615c654829731dccac1d9dd7a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "1038a0bcfadb6674ca19fd3ffe79e8b7c352ac1993c749116db4827761928ccf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "f9f6e37891a0029249b7d4cb408dde901cb5b6f7d68a948ec9cb45b0a4d615ad",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "75dbc726c4320b7ee029ec5ee52c83da17d5b1b03fee9f161f24ae57f901e146",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "2924c06a0b8d0b854ca12b25fa077e8e3f58b9d157b8603355ebcc739b2d96e0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "4ab29c2b5491d41b3c1a8816498d4f97be8834b47632a45a11991b7292a10561",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "a867c7487d5fe2c62bf3f71de62572465fdb31554ba7b82ad5583533f90d6b72",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "c8d8145018160d10a65a0a2c6e45400befa1413a6ac96a5a309049a7cdf5596e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "d14fe65185b6c0b4d968812fbef8c4cd1936e04ef36a20436c239bfaaec841da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "288ac2342afdf8874ffdaff6baa56299c8905493a5fa1d20dd92fcb7caf6a221",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "4d4fbfb050d4b95e510ede76dfeeead1ee67fd5b2b1386ce2eb28ec466b199aa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "5f57471eec368b5e628bbd79e7012e094633d0ed660e00d2f17364a14b8a8244",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "94249fbc38f7c13ec22b14c39c222dbb5964eaffb42751a5f17210fc2547d5d0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "42b3b1e04a4f21dc4f6045a728b3d434b036c2111ca50b38f26f998cfc6f12c1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "26584558633169a4d356c177e508f681e8df8d4dd693d094e8fb1f10088256bf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "f907eae56958e4b4a03cd2ea2e35fcbe122d40a034468c7666d38bf3d7b4c63b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "d5937e8fcd7ba53421250707de949c294f4a111132adb8ce9674f7f0f1a0d2ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "2891bbf3d605fe14de9d75edb28e3fe06828902b3c234a2191cfe6b94280e22d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-sources.zip",
        sha256 = "d6b8aa59ac55dd8eafaee03046ae66a36e85324c007ba3c5c8895d82c7740b77",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "3807920ce959a63f6c0392771f1ccfff3eedb9d5d54089337f8375309b950023",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "131cdee593aa2c7a1a49305442333af8b14a789d49e1b5ef771eebf371a7d8ac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "c58eedf646672a64c365549c8dad49dbafeb425da2cf5b48a40c5aea9f1f2ef5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "f0072fa6318c182731ec1e44bf034249b7a5c83c8c0855da4e4a44ee5e851827",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "abb4c165af2332394ea7aff1f2ba56c547b547fb3da55e92cd2c2848598d1f35",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "cf169d0882770761abb3f0ee13058fe0553355c1014193dc8c07145cae282901",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "e9741f538e29486f3602bc487aaa2e81347125c25e8c8167fe2642fdac902dc8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "9d3c54fce16d9f44ed163afec7b52163b04e933ce85ee8873307390059ab24ea",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "3912140ffbf8b4f3826590cf930ce0a7c4c45c81df41be7640c1d20648f6b00b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "ebf5228eb062178216195e4c7bce80107888d5e6c6cb655ac6704acdb917b4b0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "5d77397543e3e7871e4d17c75ed960c9fea7a08ddcb19523fdc513734195e26a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "8fe1dffc9afd689b007c05b6fe1e98a590ce40e7fc96788e728db9a2ff4634de",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "c9332a7c8816f0b16966ea1f3c3cc2f2d859b499282a740a01d9cb684bf44fe2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "a2a2ab5fe055e3a1bd5bdd2df3761f7dc06293e3876a134cc8ece647eabcb462",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "f91cb8e18aec1c05f6b1bdcc96a1fdc59459eb3645c2d7b99b01645e95799c74",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "ce924cc1c3687eb86c39c99cf2666f7ec26827d9b05da38f397b9ce67115d06c",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "e58da247a464dc53b19a1950f4e282d661cffa22911f49f1acb985251fa8dbd5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "253bf7787e3d71ee3c2763d5922dc8e267498bc474abb53bcb90ce494e51554f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "f66891029e0ef7e10081f9c3f8d0308156e2ca9a5be715cfc8f6d4a688d7c2c5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "b287b339022fcb74c9474921745eb70a8543e12f7208a5f643fda7674b758d24",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "2df60c46a0430ec4cc4a92400a89f7a9d5fa3c90f4a5fee83a41f12d870281c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "71e87b5ba99211e4c2f74c2bb27e19e1675c01ea5633955e939daa3cc6cc5c38",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "4345a261d8aaaecc0181ac954c6f109ca33bc3c0259321ca8cbf92812c083135",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "593fd978e332dc4c0185ae7ff1cc619c259cf225c326ce5b31e59d1b101bf69b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2025.1.1-beta-1/SmartDashboard-2025.1.1-beta-1-linuxx64.jar",
        sha256 = "eb7a9ad7c7212f9473ca150422c6b45b2e864b5dd26148e9dfef784d4387b071",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2025.1.1-beta-1/SmartDashboard-2025.1.1-beta-1-macx64.jar",
        sha256 = "63b73b60ac20c7ea1e1fef7eced3e8eaedc0e39d5c75c64b8ce499f481ca78e8",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2025.1.1-beta-1/SmartDashboard-2025.1.1-beta-1-winx64.jar",
        sha256 = "6dba9aac73c24989a62865b76d1c71f00d3b7d32de1851c52eddbc3c4ba5d313",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1-beta-1/PathWeaver-2025.1.1-beta-1-linuxarm32.jar",
        sha256 = "b626889f59cec5b864e47a9184d4c73f7ff298363555e44a57785c6b0f4b3295",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1-beta-1/PathWeaver-2025.1.1-beta-1-linuxarm64.jar",
        sha256 = "e8396fac5cb476f38a84f957ec8436bb3b4f966b3f4759b780b68deabb02ec6a",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1-beta-1/PathWeaver-2025.1.1-beta-1-linuxx64.jar",
        sha256 = "bf22f5b4ab323f46d87f8191469712e1c962fe49bb53bc0fb34dba453bf0c5a1",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1-beta-1/PathWeaver-2025.1.1-beta-1-macx64.jar",
        sha256 = "2537d5644756f8785ef8f63fd9c8dc12aec6e8b48f4906e9b06cedf9e8969952",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1-beta-1/PathWeaver-2025.1.1-beta-1-winx64.jar",
        sha256 = "da9e0a2c94bd9bcc98993db2d18140907efeb763bf53aa04f4df10135bc702b2",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2025.1.1-beta-1/RobotBuilder-2025.1.1-beta-1.jar",
        sha256 = "47126f798124376623bde7ed7b2bba59ca81c84ec3e640f2776bdcb27bc57876",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1-beta-1/Shuffleboard-2025.1.1-beta-1-linuxarm32.jar",
        sha256 = "67f162eec4c31eb649fc6b5226d3d3841669d313afff7a5bb909375e78dab941",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1-beta-1/Shuffleboard-2025.1.1-beta-1-linuxarm64.jar",
        sha256 = "3d22df20b665ae9c1082d3b7b0481144dbd62ff6aa987469dd8d138e24c9bbb6",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1-beta-1/Shuffleboard-2025.1.1-beta-1-linuxx64.jar",
        sha256 = "c99d45c813e903174d53697e57bb56e2b0f9877ad4cb5dbc71735e382baee23c",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1-beta-1/Shuffleboard-2025.1.1-beta-1-macarm64.jar",
        sha256 = "39debbfbcbf189dcf0cccb92796176e38a89c65c1ae3c39b49fd2fc8692bd952",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1-beta-1/Shuffleboard-2025.1.1-beta-1-macx64.jar",
        sha256 = "47ca18cb2ac62fbb564d2da47482f9c3e468e4d48d8ffad2e7145645d25f5e54",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1-beta-1/Shuffleboard-2025.1.1-beta-1-winx64.jar",
        sha256 = "1ade8a93242ca213899e3188485c72c5215defd04276f554ee0eb260599a794d",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-1/Glass-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "43d1e7c81e7c12aaed050cea429baa3bc5db0cc490ab31bc4ccdb52ea2acf6e7",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-1/Glass-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "4cc032abbc5f1aa4d1c55915bb877b6a9577188af555ce9f57dcebcbffcf457a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-1/Glass-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "c1032fb0dcd48efbdbc5aa89e76d9c8983415772aa1bcd780b64c4363ea7c992",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-1/Glass-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "e7f2863aa01d616fea754cc76a000e880e7001de0f4e28062744cfbb6b5095d3",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-1/Glass-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "98eb25fbbc9b7d3b1e43684bfc712bce412559338c503db26e44649ef8fcda22",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-1/Glass-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "a687e55ec1662aa2d7bd30ba98bf1f5fc30e888094d87e6d1d92dc4e8d3ac9e2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-1/OutlineViewer-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "6b84bf8d700d0e953482b1279ef4437dfdcc55ea4ff55ea8778b9effd238ec2e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-1/OutlineViewer-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "087069c7c050de65b902adeb6ac90a99fa9b74b033429c95a9ebcee4fe733730",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-1/OutlineViewer-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "80ce64059804f533cc25c3e77289cce644a6399b8679b9eeb86956d35c5a6187",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-1/OutlineViewer-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "27811a44fdee2c95d7546c62406c137f5b7daaee44992aacec49595ffa7ded9a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-1/OutlineViewer-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "d7c523833f9e9525752a0e538291463ad4953629d5268a3fa514178b940b10db",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-1/OutlineViewer-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "7cd15b3dd9a17b08e74656329a292c07338c295fffcb9a62477eb4d8e66e1009",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-1/roboRIOTeamNumberSetter-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "a0661133cb26c8d54b158888d821f1108d4f2bef2b3e4df1ed33c27ac04941f0",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-1/roboRIOTeamNumberSetter-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "6e02911c54193e708637a8f8c7334ec76f01f9221f372c86ae2ebad007a8edf9",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-1/roboRIOTeamNumberSetter-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "71dc42d8ca99b8c5c302082995aa345df6459f8419f08b198208e7f352043935",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-1/roboRIOTeamNumberSetter-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "614ba7cac65bfeddb4b98d8ee468b1491c086788353133a89f7fdfc78543a24b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-1/roboRIOTeamNumberSetter-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "6f24f944b1a587da98916c2b97d3b9186f4f07148d3957155a745c8febc6359a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-1/roboRIOTeamNumberSetter-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "8ae5fb8f808c9503d3d01ea372ebe389dfa8cf27f93ebfd4771cb8a939ebd9dc",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-1/DataLogTool-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "643e13bd6ee117dd8f408ed940f6e6b81d07a09b5687c19800ca8043cfa8e607",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-1/DataLogTool-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "606c0b219d8697b089c07f794d4baa0a80eaebaae9530e10759cd0f1eb228bdb",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-1/DataLogTool-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "55bfe553c83b4ea77dad1b136848380f51cde31e7fe340e480154767da34b8bb",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-1/DataLogTool-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "c831f3bd9510db7584f581c9a767d291802b797c673bb06beb18fc6888bb36b5",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-1/DataLogTool-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "ad61d86d9819b6bd3934ab37b2596fac738a9de120168a6aed528ab6f354fb19",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-1/DataLogTool-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "dedd1e3c20b9601b87e028bcca8b7ef492a8270a0191178618929b0890744c4b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.1.1-beta-1/SysId-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "57adf01b5b4e3cdbcef8f27dae3416a8ec29df5d580afe5aaaa442be3997a770",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.1.1-beta-1/SysId-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "3fc8358ce5360aca49bbc103f7340ac2e67426dfb97d346b1b979d198c7f54b8",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.1.1-beta-1/SysId-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "e6a04677895f80242cf363f410aed5fabc3eaa3deb20102f45bb7149e2a5bf96",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.1.1-beta-1/SysId-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "d52843b8d1a8570b6515ac765c961ade4f49ae40ff9283eb8f6e5034b50d112c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
