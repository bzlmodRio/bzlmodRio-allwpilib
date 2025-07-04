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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-headers.zip",
        sha256 = "23169f3d64e460b6aee1dc8dd6cc83c7be60b24228d2b769d40514052a9f9ab2",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-sources.zip",
        sha256 = "f0ce9f7cf01a8d64e72567d8395f0d61d457dbd0d1827e709a92f2c8a55d743d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-linuxarm32.zip",
        sha256 = "f110d897d92f7a3107c12e3a6d5dcffae83698d2e03dde2ba4a2fcfcb47c4a55",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-linuxarm64.zip",
        sha256 = "5f808444af92dfd95833f2e9d4d5f336350bc4a59bda8b636b3ba3ee00f96f55",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-linuxx86-64.zip",
        sha256 = "55edd0aff98fdb1a9736bea2683c687a9a47756f539aa7ffea6b5617f51c0e97",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-osxuniversal.zip",
        sha256 = "0ee15caa488a4f0ea90eb9c2af8d41faae929ced331c411c703717623bf1e504",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-windowsx86-64.zip",
        sha256 = "0a988a4bf9ba6e045b1d0b11fa6d6c82fdd73dca4bdd06dc7bd01c870672c3c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-windowsarm64.zip",
        sha256 = "9e5305cb8f57e8bc7938c4a710104caa88bd49ab17b673d3eb4204c8e8fc8b13",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-linuxarm32static.zip",
        sha256 = "e5cfa551692d67e1e2c92a433236534730d1abcef1f22c4cdff85af492033e59",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-linuxarm64static.zip",
        sha256 = "f71960fb4080eae7575761d04778208fe483e32a85d698733a461e9c58822dce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-linuxx86-64static.zip",
        sha256 = "e42f475baaf829e16a6a8a410cc889f761cbde2257f2d4874e55a17d19755337",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-osxuniversalstatic.zip",
        sha256 = "5ac9d403d58db0c9147d56dbe7b60bcb174d0ef206a90c50e0f51b78602a75d6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-windowsx86-64static.zip",
        sha256 = "2b96aa0a8f10d6370ba33a57b72e5c5f623eae08707c9f68d8450eae7a38664a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-windowsarm64static.zip",
        sha256 = "1cffc9de9ae6d50df1c203f8839949fe0b209cd0645d5a306d83ff4bf4f24287",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-linuxarm32debug.zip",
        sha256 = "66b2b80e5f58301ac789b6883b9f64d8916fc9644b50b38f8d56d4894fd388fb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-linuxarm64debug.zip",
        sha256 = "164831d632cfa9e1b0d78e353508cba9b1d95cb3621de5d55f3a3aa8aa117958",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-linuxx86-64debug.zip",
        sha256 = "e2138b80ba4eaeabcdc12629e152a171d84e56ecaba2e93b8281a9406cd3a90f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-osxuniversaldebug.zip",
        sha256 = "67248c3a7642dac594531841ea0fb95c0e8a30fe7ff5e228ce022c3dce4cd82a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-windowsx86-64debug.zip",
        sha256 = "f9bed4fd7bd44125c4e6fcc63866d8804d57a3b3af0ce43a7f04c729bfb861fb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-windowsarm64debug.zip",
        sha256 = "3195af6ec581907cb1b750e18bc1235978d37410ee2c61a829b8d83b8ee84ba0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-linuxarm32staticdebug.zip",
        sha256 = "397f68d336d42f092dc828588267118c8f445b460941d4b89b571ad1c0bdb660",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-linuxarm64staticdebug.zip",
        sha256 = "ea3ccf9ed892e4991a8d1af7cdca2a2224725716384ccc80158beaeb43a8dd06",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-linuxx86-64staticdebug.zip",
        sha256 = "e70c7eba6c949094f6781ff02c64b104e8bc8ac83a19b39c9f06141174b70b26",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-osxuniversalstaticdebug.zip",
        sha256 = "69752539f100b1fdec3a3f8a658055fe1bf84a94540d591821ddd4aa16bc2fa5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-windowsx86-64staticdebug.zip",
        sha256 = "1e77610d114a7d5e8ba9d1c0bc72df660749af871e420683d84d1bb1da17127d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-windowsarm64staticdebug.zip",
        sha256 = "5058572c0c65c04cdd2ef1a9ce6493a1470a96cc9f813f09f57bb4339e36237b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-linuxathena.zip",
        sha256 = "b76fb0766636611df36ce4677034aa67a9fe8b9eb7a01d774ae65ad583d85ee3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-linuxathenastatic.zip",
        sha256 = "1db331bfbc63bd98e319ad1d0f4a40bdc7b6c7880b2df1c24f469ac0e016b5e9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-linuxathenadebug.zip",
        sha256 = "eb72f00fd9ccdd3c7b75ca4019fe8411a999ac916ec5d6535b818aad32c15ce9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2/wpiutil-cpp-2025.3.2-linuxathenastaticdebug.zip",
        sha256 = "f86dc9aeaa7e0ba2ec7bce33737d3ffe9241185724942050ec11812ccc726ca7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-headers.zip",
        sha256 = "50cb396b38779a1bf21526b77b3046f3fceae967878965e7ce251ca08886a215",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-sources.zip",
        sha256 = "436170aefc5c0df214171519784fe3ddd1c88cdaccd12c47e85cc2201a7b69ac",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-linuxarm32.zip",
        sha256 = "76a34187ffe707cb42f2b6f3c5b522df2a681465ffc1d5a6e7c3b8d10cd144a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-linuxarm64.zip",
        sha256 = "65a32d70426e5260a68d18582433f93756cbb30ec58299f0cf99568af7df02b1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-linuxx86-64.zip",
        sha256 = "4488bbfe6d952b88ade295fb02d3522f397baa3a033ccc01302f84725a29355a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-osxuniversal.zip",
        sha256 = "988d5a36cd676fd2ab2c833dc1bcfcc24a00da58d7d3cbcc7a3c78c995e7c388",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-windowsx86-64.zip",
        sha256 = "f77b2c31871583a0370dd0ac45af27964c54f618f877e54f02a878853db83448",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-windowsarm64.zip",
        sha256 = "f6e5d43d7ca825dfb73066dea2527e7133348948e6f6906eeb5af3419a8139f4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-linuxarm32static.zip",
        sha256 = "aaee155f7b8b67f9f27abd34e37faab0d4d1b32e29926b16193745e2db3d6e8a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-linuxarm64static.zip",
        sha256 = "224bed8e3a32637cacf82e26eeb8ad20102ae4cb579a3e6792b4c23f63fd0183",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-linuxx86-64static.zip",
        sha256 = "8468584ee74a87d7391b88fade1d6f8ef4e48357c83c5c6bb2532279b157c7f0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-osxuniversalstatic.zip",
        sha256 = "111c7e466d291e9ded6b07036893c770aeec4c9704ee3ffcda2428bdcaa0f2d7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-windowsx86-64static.zip",
        sha256 = "0f8082ad32af8ea224e6129792ee641de436c42c64ecf61c2dc55984f785e14f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-windowsarm64static.zip",
        sha256 = "714053b5139ac72ce24aebef1b9110a1f2ff18f138d2c9df9b9900cfce0881ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-linuxarm32debug.zip",
        sha256 = "3b64076447a57c3d7d7b9e866714c97d3a3a65ef2a7ce20e51919192f473b817",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-linuxarm64debug.zip",
        sha256 = "4fb6c397b51ba28b55745ac473a32e08755cb7073c26f4933ad1146ea4cffa97",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-linuxx86-64debug.zip",
        sha256 = "6593c6f06673431381d5292eb8483abc192e5a2917337a1504898b1262533eb5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-osxuniversaldebug.zip",
        sha256 = "ebb6ed6ff4ba2d4dcf25bd90ce82dc76a8cca7da4a51088d3e04bb950183b442",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-windowsx86-64debug.zip",
        sha256 = "6c0192473e3c29e60de1cb5d2abf9122b2ae9164d5a02ddeedf1f834d47dfd7b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-windowsarm64debug.zip",
        sha256 = "a3e618dbe18707619372c149239049b91287d641973c594db8f2e4f6fe5835a3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-linuxarm32staticdebug.zip",
        sha256 = "1677fd8e818fb9a1abab8e9d434512396dbf95b88af62ef979054323f5b2ee88",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-linuxarm64staticdebug.zip",
        sha256 = "c2b2546108e7d7f55c4a7fdae419a2f8a958e8525bd093f83c4d75d9836c008a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-linuxx86-64staticdebug.zip",
        sha256 = "8ebc74889b4a20c8684fd455500f8bcb832cede19efcb2163d32aa9e7ae4dfcb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-osxuniversalstaticdebug.zip",
        sha256 = "837f2479c209a738220d9e197edaa065bb85cf7b40b1834255d2498b452b2dc9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-windowsx86-64staticdebug.zip",
        sha256 = "9c2d42322c3923e89f601a61afd46b36dee8d03770b575f1a6bc539f96738eff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-windowsarm64staticdebug.zip",
        sha256 = "5c5db5ce174f106ccdb7e7e8de641327c5df136d75018532a6652f1474ac1adc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-linuxathena.zip",
        sha256 = "6a1753deb9079f1054734bbb94a687c0ac0dfc908205a79bcb88d77047bb405b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-linuxathenastatic.zip",
        sha256 = "1b3a58142ae264e43c2c10ca67646a6887951d11173406aeea413b8266711daf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-linuxathenadebug.zip",
        sha256 = "a027d92c9eb8bab9fa5f71f80c7cc7f58453ca87d5065a74578b8e6ea8e447ab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2/wpinet-cpp-2025.3.2-linuxathenastaticdebug.zip",
        sha256 = "a5a8b2032ca28fa2b4a735521a4a25d020766e8ef20f7e790f51122c75d27fd1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-headers.zip",
        sha256 = "e2677a712433c67070586c9f2784d06861d7ccd32d75139352fe4bf704786c6c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-sources.zip",
        sha256 = "447bda6e637c2ace32b937123212c8a93525e0824221408b0135e114c77c00e7",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-linuxarm32.zip",
        sha256 = "98da1c70365106a7247c21a1057893d5994e078c9f60b542b074174ca0fa2e11",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-linuxarm64.zip",
        sha256 = "7da8279f848e84814871ffd4fbd8f6165332bdfcb082695b03efd7c6e683302e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-linuxx86-64.zip",
        sha256 = "eda27cd124892825f70b219121cad7fab79fb15a5c3f2ae458d091c617121dc4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-osxuniversal.zip",
        sha256 = "c45bedc7273382bded222268d879b0730bf20c5261dabea1feeda5c12855dbac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-windowsx86-64.zip",
        sha256 = "55ca3ca4e9d4675a8e365146dfc2f6603cb854a132bd625412ff5ed2540b0c7b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-windowsarm64.zip",
        sha256 = "286771b62112959cb81b957e4ed8433cbe046cc1f2149397419f08458ffb1b6f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-linuxarm32static.zip",
        sha256 = "32533c84732a72808020f6301491da390100ef0c350cd75f0bd946f3e7c44b06",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-linuxarm64static.zip",
        sha256 = "7e1818651a0be98b25255901663bd86206be9bf4c03c08c8e276c19fdf28eb86",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-linuxx86-64static.zip",
        sha256 = "72d2d1a7992b307deebc50e6d66b2f22611f7ec64db587364ac8bd5257ab32ef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-osxuniversalstatic.zip",
        sha256 = "43f27a4a946f5fde0f4753eeec89671465c5ac86c9b5bad8cec5e1f7ef937535",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-windowsx86-64static.zip",
        sha256 = "d4b1df6ef813669f4ee0d45178d33f6aac1ea45f2644bd4cf7498e3d807e9bd2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-windowsarm64static.zip",
        sha256 = "d65e5420a37d1c3e72daddb599601e607f5ae6bfe7b6a51ec11a786b097f2248",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-linuxarm32debug.zip",
        sha256 = "c58927a7abc6a103fb53bcefa9d55e2c70eb29c783ea7125fd1bd663a3163bdc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-linuxarm64debug.zip",
        sha256 = "e8458607aba9755f354b28d71f8c636c3e8b4842558a894229306b5713204773",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-linuxx86-64debug.zip",
        sha256 = "36ef15beb51b42e49299e376d96ea3a7cc04df2e8c27e809342ba769662bd6ac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-osxuniversaldebug.zip",
        sha256 = "a8cdff41fb3b5f886e5a7c9d9019dc3d8167aee649f087fa1ad374e1712af060",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-windowsx86-64debug.zip",
        sha256 = "a2db5b7ee053d49208d9f735f7971e104577a8a52ae749865f3b6b1996a51e1a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-windowsarm64debug.zip",
        sha256 = "53348559a31738b175c9188a094369d33b8e7c51d07022b037ca5c9f120f972c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-linuxarm32staticdebug.zip",
        sha256 = "082128f8fa48c9bb132e9c2f3e9e28ae0b825451944db57d8d53356bf74318c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-linuxarm64staticdebug.zip",
        sha256 = "3e3be63b306b1cb6cc43f888c07cb224163f9eeb5eaa8d14df157a143c18469b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-linuxx86-64staticdebug.zip",
        sha256 = "b3ef893977c0bbb3abafd046066d332619a60363e07f0ea6ff6ed3510c1b9d57",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-osxuniversalstaticdebug.zip",
        sha256 = "4e892cef30bd804bf2ac4955647f81ee2e941f11e1f7e49496b42522055ef934",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-windowsx86-64staticdebug.zip",
        sha256 = "6f1b9c6db8cc776e384bf9d56dea53841ded367da9432be2a7fa691f01cf7671",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-windowsarm64staticdebug.zip",
        sha256 = "fd8f92047ff48da4c448824096479965205707104cd084e6fb7bbd9547be7bb0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-linuxathena.zip",
        sha256 = "f8f640c665f4e0c5bda71787d46b97ce235b0e8ad5496dd7b9fbe0bd005560fd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-linuxathenastatic.zip",
        sha256 = "6dd7750eb547db3beffaecae5aaba0dcd0b618c07b76fa7376c00df0a3ecb8a3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-linuxathenadebug.zip",
        sha256 = "126e37df18cee235f44f30eae089837bf65304c5b1b492c1ba5cdc6650af15b9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2/wpimath-cpp-2025.3.2-linuxathenastaticdebug.zip",
        sha256 = "c527fe59896d08aa7ed47f044a17fd6f035134f443a1630e68ec302fb4a82eed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-headers.zip",
        sha256 = "376f9785a4f244f1d0e8ba5ca982f10ac7a47d3c3acf7a2a59716882003649e9",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-sources.zip",
        sha256 = "8576d23628dc1c4941db4a87a65db6057b201c181a9d60d5232527ba1e7c5d3d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-linuxarm32.zip",
        sha256 = "75c03f5c4dcf72cda2812e6591e10d6fdf12e9c896b691e155881100e914c8fd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-linuxarm64.zip",
        sha256 = "dc80260a3b753f36e6547e4a2cea9887694f00fdf18f26c4a0aa34d04c8537b7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-linuxx86-64.zip",
        sha256 = "4d0626f7cf3a0e7c454b88aef64b75da9a3d6aaf98f479681068989af8576d20",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-osxuniversal.zip",
        sha256 = "821b6844c9578857bcc52e2ba87a926f025939b78cea28a631de75a53f8b69c1",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-windowsx86-64.zip",
        sha256 = "a602598f7d85ab43ecff7542a267be1626558f1629db0236416c7499604447ce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-windowsarm64.zip",
        sha256 = "7deb8b21e62adf598deb0a073a1a744d8855d6b02db101b3932213285b39c2e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-linuxarm32static.zip",
        sha256 = "f8d3dd30c6b5d88050fa4424a52891812fa093754cc57468321e6809cfec95b5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-linuxarm64static.zip",
        sha256 = "dcac3b1d12db4400b12aa18b0ffc7f206c02ea173247e940eef09a11506d4add",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-linuxx86-64static.zip",
        sha256 = "efc41c8949a335dd242098539e8a5dded6edbd8a741968e2f1d19e3371c0df8e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-osxuniversalstatic.zip",
        sha256 = "5f01a16207c5af46653ec77511a52cbc7fba83b22a1e673dd04abc452a9f8563",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-windowsx86-64static.zip",
        sha256 = "5fd2cf6e8963c961dc21b3e94ef13b1697bc41dc86493113f7deda668e883589",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-windowsarm64static.zip",
        sha256 = "fcf667a8f3c6c31297d9627a67775b4b449758fc45bf0d11e3fcb3b7e55224c7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-linuxarm32debug.zip",
        sha256 = "d1885eda0fd558e57297afb8887e37078c54ab19ce2a8995b95928881ac8dfd9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-linuxarm64debug.zip",
        sha256 = "c2089c3d7099996706c67747761e48c6faba9ed6a4fb90ab9adb5b5aee2c6511",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-linuxx86-64debug.zip",
        sha256 = "bb74897284a3d10fa54f2e7b0dccc7ab5c358bd7d54b3bfaa7e7655dbce7f769",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-osxuniversaldebug.zip",
        sha256 = "5227f87a3fb177de6de931b66b4c7cc252863a2f642900408f0a214b31a84e06",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-windowsx86-64debug.zip",
        sha256 = "e72042f1ac2a3cbbd4fc0fb18395ec06c34b1490decdc173c25cb38ff20fc7f4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-windowsarm64debug.zip",
        sha256 = "dd6d8f4e037cffdacb28523544cf062dbb9c36d590002aff8c9a0ab068b88087",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-linuxarm32staticdebug.zip",
        sha256 = "dae987fb1252f04d1ce6ba5cd80b636fb430a6aa62c5a2b3da65035f49597c93",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-linuxarm64staticdebug.zip",
        sha256 = "cf43f5b6cc1d9ced7ddeab79807d7b039e6b70e3778f05fe2a8c4c5e9264831a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-linuxx86-64staticdebug.zip",
        sha256 = "f74ef8b7055fe018405094b2577cc8cfa3627022edc6f2584211568c5814f0c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-osxuniversalstaticdebug.zip",
        sha256 = "da8ab1e512da76c66f00d4960e3003636e71806a075284156f85b71957d2dd84",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-windowsx86-64staticdebug.zip",
        sha256 = "0281988ea5ea8dc838d007ae402468fdda9a287ef37b6b5a86f576b4928d79cc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-windowsarm64staticdebug.zip",
        sha256 = "345424d7b56657faa340f3420a17d31e3ff1c9f04941854fc501a94d33629d8c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-linuxathena.zip",
        sha256 = "d61ec9bd80a918c3dde41f84ff0621113f648ec7ebbbd9172d3f77b8e0f71069",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-linuxathenastatic.zip",
        sha256 = "987bcdf8e457ef9c5b7fef44dd1d6bec3d16d3b1aa029a538e866e2e948995dc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-linuxathenadebug.zip",
        sha256 = "0b0b8b3317ad8c353fdc82376e0b1438b158f3eadb360a1d3fd8e6cdc0e1363b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2/apriltag-cpp-2025.3.2-linuxathenastaticdebug.zip",
        sha256 = "e67e3179d6945aa0990a00807b4e90a316ad1160d0d9e8a1a21f3ca35226327d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-headers.zip",
        sha256 = "cff29ece145015d1f8e4097deda371ea923c5b4b0c7eaf6e9d8490c2ec096e2d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-sources.zip",
        sha256 = "4866807db0043d928b1432b1db951e5bc0d90d53cf255377aa6a3391209d76d0",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-linuxarm32.zip",
        sha256 = "c8c8293d474164f0209fbbef1652192861dc809cf5fd2b25bbd908ca3805ac28",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-linuxarm64.zip",
        sha256 = "ca8250cf91a4ca6a2d5e73eca11f9c85f367fbd9f064a1a29a82079a0df48b6f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-linuxx86-64.zip",
        sha256 = "6474f7418f5a1b0ebff2420722e9e487a2b776005feedc05f7221161f8a1f3f8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-osxuniversal.zip",
        sha256 = "d90d1aa032f20fd44485fedcbe27e13476fde6d23772016261369321e8de268c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-windowsx86-64.zip",
        sha256 = "75f6f7cb5d2599b091eb9605a2701262b4943ee2446edea4e843525a277c6956",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-windowsarm64.zip",
        sha256 = "ca0de5049f0d3ef3cbcce32921759c47f7dcb6b4eeb04901239f8edcd5304e12",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-linuxarm32static.zip",
        sha256 = "85307175cf4390d4c3c0133895f5ef6b773879416714fa20980175e009a8e64c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-linuxarm64static.zip",
        sha256 = "496b8517a7cf57ce69814cc684c896da06e758ec311ffe2da88a1d5e8e3a2317",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-linuxx86-64static.zip",
        sha256 = "08e860dd5eff1fffe9d8008e3bedd94d465f5b574a0978786e10a8b4fbed87c2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-osxuniversalstatic.zip",
        sha256 = "167675c13bdb82c028d0106cd7794626c6c7c68b0378a00ae6f2ff6a00cc0e1c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-windowsx86-64static.zip",
        sha256 = "c716de80215f9df8bd3ada78b816754e310e22d060db7618527f4dcd16498e2f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-windowsarm64static.zip",
        sha256 = "0d6ebd1f52f7f0c3277f7ca37a933db8c7b2981916d4b51cde0966a3962bf6d7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-linuxarm32debug.zip",
        sha256 = "2e92963ea3d017d886f9dace488e3fafa3ae6d230743b7e49788e8be1963537e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-linuxarm64debug.zip",
        sha256 = "c925fbac4b456125adaf8fea7474dedd84d6258e77631838c3c530acd56602fc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-linuxx86-64debug.zip",
        sha256 = "5c302edc78f3df2e27f62c44442534a8b16ef7e9429dac076b4b5d11521eca6d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-osxuniversaldebug.zip",
        sha256 = "97c8cbd88aabb97cf9d182fd41ce4f3500b7813fb76f8ce91b2726acee6dd529",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-windowsx86-64debug.zip",
        sha256 = "26c5d74dee6264c7c69aefb7e73c9af08ca48f06cfbe40517bbf4932adb1542a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-windowsarm64debug.zip",
        sha256 = "03b836de031174ac48ce32b82d119b0ac5720c2e9b3bb383c50b46416aeb724a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-linuxarm32staticdebug.zip",
        sha256 = "c3ec29d5d4d237cb2ab6f2802bacc14a2141823082f5ee810ed975d5b08d0a0c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-linuxarm64staticdebug.zip",
        sha256 = "4f3ada66e226ef941512c165bce936c7dbffb1fcaaaf3f4d296ea8ffa5a65796",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-linuxx86-64staticdebug.zip",
        sha256 = "52707eef5cdc3b86bcfc82c31a29fdcf9ac8041705032bae49778e4edbf86d80",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-osxuniversalstaticdebug.zip",
        sha256 = "23ce47a6815db1d89078c7c07b82bb0edf6c910a486fb38f77bd523706f604fe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-windowsx86-64staticdebug.zip",
        sha256 = "7becdbe19fd999212093dd51f62ba232ed94d145ade0aeb071bac0ce795e0b4d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-windowsarm64staticdebug.zip",
        sha256 = "dc1639f751576840c6cbe9b2b39179a91c842869c4820e0aca504580ce210488",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-linuxathena.zip",
        sha256 = "e9511bf50329470da3a32474257c74bc4d1acb2c77055059b237f62ef9f33b64",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-linuxathenastatic.zip",
        sha256 = "5f67814b66de6835a90c1351aa677aee687b038e0f0d950f0d663b2c702a632c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-linuxathenadebug.zip",
        sha256 = "4c858be919bcfb21af9225b31f721f25061d4ccbe3df678850415bd178f6f27f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.3.2/hal-cpp-2025.3.2-linuxathenastaticdebug.zip",
        sha256 = "8d10bb91581f551dc784a33be0917415128e874ca055ea479901117d27c47d55",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-headers.zip",
        sha256 = "032496448e62dc21d6fc71b57f43862a7df448219f281f48203aadf698de3a59",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-sources.zip",
        sha256 = "dd9447f046caee4107d2cdfb153271a32d81e0a8dfd054b0ad04fbb590b42c44",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-linuxarm32.zip",
        sha256 = "70aad46c1c394db1b8244c878f1a94c17b1566a0f24a03a9eacf64ddfa1e0ed4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-linuxarm64.zip",
        sha256 = "4c77c7e77d6c9a0ca60c1af1da3d5a823d58dd73602b4d9bfaf0250190f5ba2c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-linuxx86-64.zip",
        sha256 = "8eab499dda5c73835ea3bea1c58c2c338690c07f397bb0c46f2ef888d5399172",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-osxuniversal.zip",
        sha256 = "1fe3e5f75e4e1a0dc64b159b621d848ed8b614c949890f40ffe6931c3a55e09a",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-windowsx86-64.zip",
        sha256 = "4b4bafec65477bd7cfe9f9eff56a9483e52da55fbef8a25adfb19317aea44604",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-windowsarm64.zip",
        sha256 = "da014ded555ff432ed1d8c82508010f75898371e74018d04c5bdbc3e93c9345f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-linuxarm32static.zip",
        sha256 = "2667cdbb928f2b72241185d60b80fa0f9d8cc1e367d3419597c8eb017c5e5589",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-linuxarm64static.zip",
        sha256 = "6efec9808039ae4d1cc5c0f7c1d963b7353e5676c9a95bca702484c0ca2d9d49",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-linuxx86-64static.zip",
        sha256 = "4c6bf0c2d5fbff2fba7aefc24b09e0c58f98f2487df04407eaf59d5c6dda1779",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-osxuniversalstatic.zip",
        sha256 = "d58864d789bcd6e7c4e3c33e6d49b9c631c45bf44c7664aa1735e4530a57a733",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-windowsx86-64static.zip",
        sha256 = "5e56ffd12b5c89a27463108a188dbd784ebc57f5f6135689f02306139c62c6a0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-windowsarm64static.zip",
        sha256 = "88615413c82e84517d0c6af59318d05e90698a06fa1955bd145357998beac2ac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-linuxarm32debug.zip",
        sha256 = "b1aab024814bd184cb6f277c78a8ec840bdd0ac961d07b3289fa0ffb5d057a28",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-linuxarm64debug.zip",
        sha256 = "d6d71422fbf43d25cd54860fb9d164681c35f2ae2f3fdc94d8e83a686a57382f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-linuxx86-64debug.zip",
        sha256 = "58cc1b753b100dd70ba5e1d6ee6f02fd5e21b23779eacd641113e1dc7ea02f8a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-osxuniversaldebug.zip",
        sha256 = "fcae8067e36f5d52e053ff9e13950f0f8038d2af4fb8847f2bd8c0d49301f221",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-windowsx86-64debug.zip",
        sha256 = "8b39634db4d260e59b3619757975a2f49813579ce9b457ce2cceceae6a5ba9d0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-windowsarm64debug.zip",
        sha256 = "9b0e9a6f23015078787d086c79dd5bffb132b79a4148c58ac3cb343dad9973c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-linuxarm32staticdebug.zip",
        sha256 = "7d3181b17921fb8defd4d74ea28af2157e708937a75993ca39e62eae0fd59c78",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-linuxarm64staticdebug.zip",
        sha256 = "73b268d2cd229bfea8dcfbfc7be12b9e03d26043f28723c42dd24ce1ad41ffed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-linuxx86-64staticdebug.zip",
        sha256 = "6f6d56746c992f1ab589fda80f8b529fa2b652b5b3cc75a9ddf7b1f6d6e541c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-osxuniversalstaticdebug.zip",
        sha256 = "d87bceda756f64c0da4243a53eb7f709ab0072a8dcf0a28e3ff6428b2961dcd6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-windowsx86-64staticdebug.zip",
        sha256 = "514c2fe75cede13417893e387460734de5754476e5dd6299d208011bddbb993d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-windowsarm64staticdebug.zip",
        sha256 = "b9a5ba3bf0289a527161c4f03873db6b56605424ce2f04cc05e8c1048968fef4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-linuxathena.zip",
        sha256 = "f8512c810230264ad523c5039bdcf16913a6dc32b7d8b9b82c0aed0cec29bebd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-linuxathenastatic.zip",
        sha256 = "09ef3f4dd49e53de111bc5e38e181f4ef7294352b7556d2034b7d9d52816cbe7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-linuxathenadebug.zip",
        sha256 = "0a5a8dd1e920773983da6c176623cfc40cf08d282a6f3221b6368a13c20953a3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2/ntcore-cpp-2025.3.2-linuxathenastaticdebug.zip",
        sha256 = "753c8092f1e3ee12d1bdd184ac2e5f458ab1c1a66b55637a840788f01fd8f283",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-headers.zip",
        sha256 = "bd95555c2f2bcecf271c9373f2270abf21018d46c62ed0a7938e0e43e048aad7",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-sources.zip",
        sha256 = "de9cdec4386e4722df9962c312cbaf791080e664ddd9b10877fd52645d29583d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-linuxarm32.zip",
        sha256 = "f3744654e518456bb1518002d1b12b29af93091d5ccc827c2222c3d56c1d49d4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-linuxarm64.zip",
        sha256 = "a29d90ece6157fd52358bc4ba504af260917066060eaf394a9f5b5683a9c4221",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-linuxx86-64.zip",
        sha256 = "8b751868351b49c24b802235c5fcbba8f479a93c9c8349c7c0182062076c4dc7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-osxuniversal.zip",
        sha256 = "3f253bfef384c9475759c66ed5a41dfbced310ca68915b1519ec4ae59dc36240",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-windowsx86-64.zip",
        sha256 = "c509b95a8db6ee962c10807181da1016e2d4cedb33fa5dc3b9adf34c6e99399f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-windowsarm64.zip",
        sha256 = "92df1bf2f74d9c3e48a64377d551c479527097d46d299d417f218d13e5f51be4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-linuxarm32static.zip",
        sha256 = "a2088021fd03ebb6089eaa160f6d0c7a82c107b1c11e219efa481cc480bf82aa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-linuxarm64static.zip",
        sha256 = "64c56c051f86d5c5c3314660ed0cab3c5e82c6f39a51ff201fd38458316f70d7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-linuxx86-64static.zip",
        sha256 = "548ab027468ff8f544153c70d7163ae172c81779638a0b4d02fafaaa1ff610ae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-osxuniversalstatic.zip",
        sha256 = "655073e62c45bed8580548c946b0a7fa5f711f9d2cb13acdd63517885cad8c6d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-windowsx86-64static.zip",
        sha256 = "f0a75c8eaae7576abf033c456779c1a927e21694d6f42f0f62cd738148cae038",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-windowsarm64static.zip",
        sha256 = "97e3de67d933450aacac1d6d6b26dece3a88e83b1edb9d9b0e1f8dff0dc921c4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-linuxarm32debug.zip",
        sha256 = "56318cb4b9b842d9c7bb7fee2ce2e4f2baaec17435dce477ed777e6f4cc9d1da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-linuxarm64debug.zip",
        sha256 = "fcf8d77b3c2ef6b2a0ade8e9f04575d3b0c84c7d2a4758211fece66dd6c53b9b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-linuxx86-64debug.zip",
        sha256 = "bb13f359b46acef2991995d7cc7e115106a50ad15988082d623e64a13ccf29e9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-osxuniversaldebug.zip",
        sha256 = "f9242a4ed303fc297625723cf289a4ed657628c9b18b8bd1c367d60cc11f375c",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-windowsx86-64debug.zip",
        sha256 = "838c45f3722a8e4c5d4a10984d1e1d9fafaa1f69989a47c35fec8353b3105345",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-windowsarm64debug.zip",
        sha256 = "a1a33c7909ebd77bd76f47407dbaf34b9398db8de8711ce1209a937e849ee762",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-linuxarm32staticdebug.zip",
        sha256 = "caf608ef20006f938cc711b3703402d79e1b474c6657adf16c9f0b0f2e6b143a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-linuxarm64staticdebug.zip",
        sha256 = "f9cfabeaf2be00c7f8622b9d4dd5833d5648bf3d43677f926185b885f150ebd4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-linuxx86-64staticdebug.zip",
        sha256 = "0f0eeadd656e0ce04826b11f25c24b4169b2baab8a03ce54a56c1640e28ab84d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-osxuniversalstaticdebug.zip",
        sha256 = "1fd3966508117405f7e3b484f421109bc1a7da4339c38177e914f1409d95840a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-windowsx86-64staticdebug.zip",
        sha256 = "2611dd28a4ee406bf3bfac17a09c9c60bec419c8de39f07599331063881916ec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-windowsarm64staticdebug.zip",
        sha256 = "3dbb21ac713130957ebc1325b0a95fb42ef2168f538e824e647acb26f30ef12e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-linuxathena.zip",
        sha256 = "25946ba4bb6a43b64bfdc1078bc6ae4da3a464b843965780eb400d61e2f590f6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-linuxathenastatic.zip",
        sha256 = "45ee792b8f1f1ae4bff8a773bda54c58abf0bdb6a2a09732fab5cc93d87eba98",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-linuxathenadebug.zip",
        sha256 = "2b5d0d4231269e40e7b29f24f623c27a8569bd86d72d214b9b2626d368dfba2c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.3.2/cscore-cpp-2025.3.2-linuxathenastaticdebug.zip",
        sha256 = "4df6b95b08508330da25902c771af45f7c0084db12410f0f0c8ed5dc014138e0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-headers.zip",
        sha256 = "79df447f14675e44c93bb51d148a9d81c78082e92d2abd5112798fd2a1b4de54",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-sources.zip",
        sha256 = "573010f12d65aca4c6503cd72743d2c8abbfba6efb55e2a2694b6b51adac77c1",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-linuxarm32.zip",
        sha256 = "16a4bdd348918318bb9949270741680ba947ac6199950ed77c45c2c00147160d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-linuxarm64.zip",
        sha256 = "ecc10d9c144bdfc63a0006da2ef5221cbab2741d66a4a346448bd4bee90fa45e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-linuxx86-64.zip",
        sha256 = "ffff73ab71bbd225902c6e88bde32bede1d25f4463fbef0eb59e56be4a8a472d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-osxuniversal.zip",
        sha256 = "cb1da0e8bc15ec51aa68aecdaf8917ff0e4c619a77770b00970d93354c1c2816",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-windowsx86-64.zip",
        sha256 = "ab633f42d68b5307be5e941563d71b6a18b7d164146c8c644c78aee27d55ca8d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-windowsarm64.zip",
        sha256 = "c8b2267426f95da7dc4a2991735cd67a16d0b393fc2fba00ff698ea0c85d8939",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-linuxarm32static.zip",
        sha256 = "700a455797bfd89f5a57df36e5c99d30694304bb506d812bd9edf3537e97ec7b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-linuxarm64static.zip",
        sha256 = "66ec0643c515257285a14d0799f07916eb1d19af0ab00d8f04fdb6069a08ab15",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-linuxx86-64static.zip",
        sha256 = "b242fc2aaa9941a4bdc4e90b1468b012349df78ea4f9246fe7ee6076211a98ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-osxuniversalstatic.zip",
        sha256 = "3ff51424b96dd85652fd67c1a300e93623214ead75742c9af2c5eabe824422f2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-windowsx86-64static.zip",
        sha256 = "a2a59dc89f5b7fe5ef73b5ce75b06f91cf330e17a28d344961eb8a2bdc6a080b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-windowsarm64static.zip",
        sha256 = "bd52f7888d8873cd6005c526e584729de3e37d64733f964885522e236ef27bdb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-linuxarm32debug.zip",
        sha256 = "f0af667e3045698d9645d304bad539799c38942f70c548f56aef90e2b7cab722",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-linuxarm64debug.zip",
        sha256 = "8f5fb09af8ab2f57483b65513dbc2c4cd956f17515579420f507f08cad9bcd4c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-linuxx86-64debug.zip",
        sha256 = "0ee776a88b679b6f06e65c945cd3edfaff68a9f19bc5388cec2a1aedecc260db",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-osxuniversaldebug.zip",
        sha256 = "9f3dced3a1822dae7e4f8ff72f8598c3e6b020d032b8d8281b4cb29cb503dba7",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-windowsx86-64debug.zip",
        sha256 = "8870f6e6e4694eee4ef691ba9231fae7dcc08dfb9814190b9eeeaf1c382d9520",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-windowsarm64debug.zip",
        sha256 = "e715774bfa8463211126d632131592fb9ec56c578c8d47cb5cec8676cbb6f877",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-linuxarm32staticdebug.zip",
        sha256 = "cad369f21a50b1bd82390d74085adb6877e732d95a319833dffe5a9397b452a7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-linuxarm64staticdebug.zip",
        sha256 = "b67a52470b36d2d5b09a36a803bcb2dca563b036788ac3425bea01e08b000296",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-linuxx86-64staticdebug.zip",
        sha256 = "26117130ed1b2eaeb74a2b86affa84315841e8f82ffeb4d20e6cf0bfcc4e4fc6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-osxuniversalstaticdebug.zip",
        sha256 = "e96f66e8ae5dbccc14bc5f16c018a29ad9e7052e0ec9401b01b63f2377b99f4f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-windowsx86-64staticdebug.zip",
        sha256 = "3119b16e2344f2bd8c7c555c1efffa5b3f4b2ea4366a50fc9026f267441fc2bd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-windowsarm64staticdebug.zip",
        sha256 = "37b7cce1a024dcb080dec5297d0a6496ba9c872795f6be912f40367fb49b8db1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-linuxathena.zip",
        sha256 = "f3b01f26f42f5203657d62239c966addb60e4640c9fe164b89bdf0d4005c0156",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-linuxathenastatic.zip",
        sha256 = "db1eb9c79286c818b1431c6bc1e0a6f301e02c51c9d0340453af31d3c6ada703",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-linuxathenadebug.zip",
        sha256 = "471e763152647f7d2b6087b8c159b9bc2d277262026085aa8bb5d383e97dd3a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2/cameraserver-cpp-2025.3.2-linuxathenastaticdebug.zip",
        sha256 = "d65550788dec01935a43b69bc6f3fcd814a3353a1a05a35ebf9cc09b75044f97",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-headers.zip",
        sha256 = "d052f0d8b0de971ae37b59f3e932fc06a8429bc4aefb422932c259b093f30caf",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-sources.zip",
        sha256 = "79ff36c32ab03d1cf41b30e234bc58a36d628c361421a52aff9135db9cba465e",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-linuxarm32.zip",
        sha256 = "b3772a4e223c313adcf3576004620a123dd1afdb64470b680a7c55a8f6e60f45",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-linuxarm64.zip",
        sha256 = "80c5e701af9a3c884bc54c6a0675fa626d3a27cb10acc778a82c052b44c1a5cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-linuxx86-64.zip",
        sha256 = "ebd82c25437cf3bae145a548dcb7494bf8303f4904aae6b386a1c57b4deec9fe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-osxuniversal.zip",
        sha256 = "7c53ea7b81512a0ebc151df2630b3c12ac19445215ebb2ce44863c0915e9332c",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-windowsx86-64.zip",
        sha256 = "1bc12c54b01911bb7c45c295df2f67282795bed9bcd4725520cfc480252fff26",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-windowsarm64.zip",
        sha256 = "2d55355a1868413761ac0fa89028d8f4dd68fdc2119bdf586c1c92e4de160838",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-linuxarm32static.zip",
        sha256 = "e5ce11c401fc7ff407f4f5eb5e3d1baa197af0c878aab2b72dbdba560e929c3b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-linuxarm64static.zip",
        sha256 = "fccda95248bd2b781c33a479ed8c417551a3c615014fefbb674493b5559d7238",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-linuxx86-64static.zip",
        sha256 = "28b8ec92830baa1a78e4654521d99ffe02dd80158a89c0cb90b886d3db15592a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-osxuniversalstatic.zip",
        sha256 = "f1b3dcd7aa708104407f04d75879d91e8bb3ece35545862a021605b1dd05b331",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-windowsx86-64static.zip",
        sha256 = "db32cfb309a5f3c0b27f5d23a990bc20790b09c529b3c7009175c2b1114852f6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-windowsarm64static.zip",
        sha256 = "896a1048822fa06de07b79b20613095e2c818726de1a8702982df7c93819f44d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-linuxarm32debug.zip",
        sha256 = "1251c3cba9ed1a41a116823dc1f557e2051b0182336ade7bdc2db8f760a1e92d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-linuxarm64debug.zip",
        sha256 = "3a4bb671222390ec5c723ac3c1e473c969e897382c218a51cf552a6209ebbfd3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-linuxx86-64debug.zip",
        sha256 = "09ca824d32b6dde86c3705fde5f9991d9e17f5771a13513e37527e844fbe5bce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-osxuniversaldebug.zip",
        sha256 = "235bc96f9b621af66ae64d26837f8d43f3455fb946af3bec5a5c883af3e7be04",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-windowsx86-64debug.zip",
        sha256 = "901f1639a5cf9cca6e8cffccfdf85c7d6f1b30c1e25ea99d9f87524c55f2da93",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-windowsarm64debug.zip",
        sha256 = "a611405a19204857aa7db255e87c1b9ac21384b4bcc2bbfab6e0038a00a82926",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-linuxarm32staticdebug.zip",
        sha256 = "80558d1554546188d1ca6f94c5e501ad8396a0fe445f39dfac4145baeec590e6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-linuxarm64staticdebug.zip",
        sha256 = "9f270bd609c40650ac10004a1c172fce9d211f6954470d70cb320d3347626265",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-linuxx86-64staticdebug.zip",
        sha256 = "81db0c17988b079e1ac457961bd5764cb3b29fb3f4ab1b6aa0d6d9f167470b6f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-osxuniversalstaticdebug.zip",
        sha256 = "14f6b885b881416bb7fc6b11c3acfe94a97c6948665322d54d4e07f824c5b6ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-windowsx86-64staticdebug.zip",
        sha256 = "d68e3b4e0200a26d3347e9fd070680e3c1453aa333b37dbaf155a662d71691c4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-windowsarm64staticdebug.zip",
        sha256 = "e1c1c0af5bdafee8536f0469bfdab39f2ebd93f542d419a297bfea19b408015d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-linuxathena.zip",
        sha256 = "1be29b3ec8e9db340ee4570510300b82f95b62fd2fb41efcac93f10dc7a0374a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-linuxathenastatic.zip",
        sha256 = "4ef54025933c0f1e4e9c1eb522457271603cc7cb7227ea30f1037f059fec99a6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-linuxathenadebug.zip",
        sha256 = "b6942aa8915ff2575ab8cf791d5a41c983de6978b50a41377b3edccd296c3e04",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2/wpilibc-cpp-2025.3.2-linuxathenastaticdebug.zip",
        sha256 = "89801184fd5fb3cd9a3eabd1ef76303a7a37001cb6605c895cf9999f339cc357",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-headers.zip",
        sha256 = "6a75482a117accae72946f9275304a3f9129b6b2cfbe3970f875033712bf8dba",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-sources.zip",
        sha256 = "6eb31be315cc636bad4db3feb457e1e46e5d43d1b35088fe800dac6e88dacd6c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-linuxarm32.zip",
        sha256 = "c307db9d20d3064b811d5188078ecc2d4bb17cafe07132acb377cc2fdc19db69",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-linuxarm64.zip",
        sha256 = "45ad9408b534abb3b8ca2c90afdf45b8d9db38b856ea6228974caac6d807cacc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-linuxx86-64.zip",
        sha256 = "f03a35f7ebdf8c885a52610ebd27e031a13c7a871ec5fed8e4dbab5fcba3da98",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-osxuniversal.zip",
        sha256 = "d82705addcf7ef86be13efaee8d10b885e10d6428faec27dfdf9d4c788bcc875",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-windowsx86-64.zip",
        sha256 = "b0191419d73ffeb9849500a253826b7b256c369ba19845b164e849b1acf9fa2a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-windowsarm64.zip",
        sha256 = "982d567246eb16298981fad1d06ab8f3220205edacdad756a13f5036790813a3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-linuxarm32static.zip",
        sha256 = "8e0a16f167d0507eefbf50b3babaf66dad28f7b5603728e4c02b80656eff4757",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-linuxarm64static.zip",
        sha256 = "143944fcde892cb8971d098ce033c4a31f546d252d7eae18b3afed1a197ce546",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-linuxx86-64static.zip",
        sha256 = "90184242a6cbb0323d410043c12367f4a7d22154eb980a6872482e0bf6f594a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-osxuniversalstatic.zip",
        sha256 = "265ee8ff487054644570ddb4dd62de0c0bf1ca7701b69c276ae8641aec79ab8d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-windowsx86-64static.zip",
        sha256 = "3ffbe73f8bfb1b29b567d98280fa74fed261194cd6faaa631ce8c44eafc7334c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-windowsarm64static.zip",
        sha256 = "3d8786aaa5e4681990e921fc95c1e85cab4f426883982960491ce7d58e1ea19e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-linuxarm32debug.zip",
        sha256 = "f7a899f9c2d4fc1da3026bc64dcc7d8b6831ead42c884fdd2bf6f3f7cacad306",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-linuxarm64debug.zip",
        sha256 = "6a3793238f36e9d7a41fb83ce34c33a2121168ee1ef450d1059867928b0e6a09",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-linuxx86-64debug.zip",
        sha256 = "e629eb4c20840cbc88a1823d958b08f73cceb99acfa92da70ce48882e00bb4ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-osxuniversaldebug.zip",
        sha256 = "46ae22583ef3e62c6b0e5b923147868d5e616fd17a84eeb5acf08f289952bbc6",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-windowsx86-64debug.zip",
        sha256 = "797918aa05c93401b1530ebc09437be118f847f14c8b66e3df7186bfd123af1c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-windowsarm64debug.zip",
        sha256 = "82fb91f3f1c7147d35057908fe6b5ad3127d9df5118168fe7cb0069192b83232",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-linuxarm32staticdebug.zip",
        sha256 = "837d38f31b406cd0826afc352284dd665a2e315424b138e3e789fda7bbe9fbab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-linuxarm64staticdebug.zip",
        sha256 = "d30bc0abe3d84f10429274926132450dd839a0c156fe83366c4de6f81300be3a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-linuxx86-64staticdebug.zip",
        sha256 = "82c661144e0f5ca89014f5d2c9a7d4ba4749d02b01a662e70d5733c0cd056bd3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-osxuniversalstaticdebug.zip",
        sha256 = "84601414191666980973c0215a4406678878bdff1dbd0680ea1809f3483e7e2b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-windowsx86-64staticdebug.zip",
        sha256 = "9620a8749a214e4418d98da48fa825c8bf08f3439602ae4e17d2a057b3fe0d86",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-windowsarm64staticdebug.zip",
        sha256 = "d2fe0d8f3748550781f075733c39542b2cde3a7f6c771b8ad7cc86f66d8be8c1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-linuxathena.zip",
        sha256 = "efb0a571a87541c876113188ef2fa53d4e69414dacfdce14b83e77a12f5a6e05",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-linuxathenastatic.zip",
        sha256 = "e6f5d7b38329d805457dee46b574b9a5e3b4ddca3aae314a8d3bc08acf6f8c23",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-linuxathenadebug.zip",
        sha256 = "095dcd549912c1cdeff9ffa1226ddbeb8215b22f7572d74864d95dcc90400c0d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2/wpilibNewCommands-cpp-2025.3.2-linuxathenastaticdebug.zip",
        sha256 = "7d42b536b8ce088ddbe0b2fe3011b3174ba6f93c642fa115c4f1253247cd703e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-headers.zip",
        sha256 = "59d836204c587f3b2b16798fd6eb36bb50a4cc72a934fa9b2c18927573fb64f8",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-sources.zip",
        sha256 = "598ee8874c16a339bdc57147bb536e1ce93785928e95707b27e07d6e20568416",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-linuxarm32.zip",
        sha256 = "6f3da32ca4e3787f3dde78c9098cafb9e0735385825471169bbedd67a971a177",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-linuxarm64.zip",
        sha256 = "1db902bd8cc294ef41bab5f827d32cbb365c4839950952a0bec61883421568d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-linuxx86-64.zip",
        sha256 = "68f03608d31568cc3450708ceaa58b73189497927621940e9cfb7ca17198c186",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-osxuniversal.zip",
        sha256 = "986395311ddcdc470d38e9a895dc6328f234c91592bffac504b63ac8ae39dc3e",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-windowsx86-64.zip",
        sha256 = "f744ac36271eec427ca4c44135fc74e8fbafd53adda85123380ccc311d878e73",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-windowsarm64.zip",
        sha256 = "eaec890354f525977dca3622cf03d1f84e936785ccf43c6428f2fa3f92ba7cea",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-linuxarm32static.zip",
        sha256 = "d8f8e7ce1a43a003fd4f4c12ebacb3e634ecb4bbcd5e0d2fa2ab8116a0fb8ad2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-linuxarm64static.zip",
        sha256 = "57d31df48596673ae08d93e8b88a715adff023ec3623b2e1318768473be756d0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-linuxx86-64static.zip",
        sha256 = "8ef5ce858a56527b531d89e6b10755d1cd0a83b3b2c8e793147113122e966a27",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-osxuniversalstatic.zip",
        sha256 = "082c7e5e516f68b29ea1699e012a58e3ac8de6447d73bf35bbf1df14909ba699",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-windowsx86-64static.zip",
        sha256 = "5420b8edeb41f27019f17c0f202dd2a3fa62f98e1b713c7e11475ae596220e20",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-windowsarm64static.zip",
        sha256 = "95541209dd20426e83f535ae57cc194d593c24c058b3e791d49e7ec0f1bf7613",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-linuxarm32debug.zip",
        sha256 = "5f9008ae518d9f64a0aeff469c359f883e25bb7cbb1634c8f8c21495263d5a4b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-linuxarm64debug.zip",
        sha256 = "519b01030a1bb455f74ed81e84ad1b691933f7efe9e84d6427131f522d276b3f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-linuxx86-64debug.zip",
        sha256 = "d1f80fdba22f0cbb91c844dc291e0ba3ee8ec0cbdd6a1280a646ce434764c9fe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-osxuniversaldebug.zip",
        sha256 = "62bd16bafc296603d5d13873e65bdd23e27e00c77b5c708fa6c9eb986e4aeafd",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-windowsx86-64debug.zip",
        sha256 = "961b3d72cf6a9cf139125bf9824777e71339d799ba677616bcc66b738ee18c1d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-windowsarm64debug.zip",
        sha256 = "3e4dbae1c01fb13b0c71360b0cb67b93ce5fcf32b4ef10bf3d0abd08b6817cc0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-linuxarm32staticdebug.zip",
        sha256 = "dd3b994254aede976ba3d2f5e3b50750c7320c2e4b9ac2e4edd8dfb8c3ea40be",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-linuxarm64staticdebug.zip",
        sha256 = "44119e0653112526a84f9f151e2b5a44176139a48fd90564ca4117f08c20345c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-linuxx86-64staticdebug.zip",
        sha256 = "ee763ec5af8d5359c0a583fc0839ced3ae8b828f172b6316dba49e848afd8a02",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-osxuniversalstaticdebug.zip",
        sha256 = "ea33c7e8c8cfc2d4ad97d62f7ade69f0f8f0cc78d4eec9017f198b1dd2a4fc0a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-windowsx86-64staticdebug.zip",
        sha256 = "342b93009b7432d04542a3da9ca7071bd4639d63abd0ceddd8fde56437af00b9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-windowsarm64staticdebug.zip",
        sha256 = "e305a0e355be826343238a1078742cca49ea2a1d6683ea766816c01355cb0bdd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-linuxathena.zip",
        sha256 = "05efd7650f0e9f4fa1f0b26ee8eecca88322456840e115b2b6556e410f26b376",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-linuxathenastatic.zip",
        sha256 = "274dbef853b728f6ae74b2dcbfa30f85443a9accd20bee4ac03f3cef51e8df0b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-linuxathenadebug.zip",
        sha256 = "ec61a1ba4972e35a5059cdb523f6a9e95e6445520982e5861de5b00642db2d14",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2/romiVendordep-cpp-2025.3.2-linuxathenastaticdebug.zip",
        sha256 = "6b7599c5eb32045313dcf8e9c58891ffbb6f081a7f761e13a6d7855d11a36a19",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-headers.zip",
        sha256 = "4a4721d72b44c954c97ea86b55240583c55ede23a8c2e25c36dea78d41a260fe",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-sources.zip",
        sha256 = "5585cb1c63d6a0c0a95cc4a900d7e505ef0fc289b09ba704ae9b3b265348b578",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-linuxarm32.zip",
        sha256 = "11034bdaebee11d9589b9bfd6939f5880300390d39caf88495ac3c43960bdc8f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-linuxarm64.zip",
        sha256 = "8bff77233d162d6188380c6b0a0db7d7e27bbaf5938d84bad7a180118546a8b7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-linuxx86-64.zip",
        sha256 = "03addbc8c900fb876f3508f708278499fdf9cb90f76df1c85dd3a16c6e990478",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-osxuniversal.zip",
        sha256 = "5109237826c71e2790e8a118e693e028a836e0c1d3ff82a64d8d59ed922d52f5",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-windowsx86-64.zip",
        sha256 = "0a387158b5f5c02d71a5d977990fff344fc8e2cd49ea865827e9e0775f927b93",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-windowsarm64.zip",
        sha256 = "6180eb8feed17f35e9efac903f13f84ce792922d5cdcd255b9642aaa65c9f5bb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-linuxarm32static.zip",
        sha256 = "ab722c513de01410d2a5eef3e0d2d7386db203fa8aaec32a05313abbf0c972cd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-linuxarm64static.zip",
        sha256 = "342cf09a6a3bb317d94cc281e9a69c792824483aa6f6b7f34fe8c3a085f1dc27",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-linuxx86-64static.zip",
        sha256 = "c9289479019f3f3ddd35955fc70d97905f9a33c793cabe2071aa3be3e7f4875a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-osxuniversalstatic.zip",
        sha256 = "c0d5e10c9f249af79740d599858ec9ef46822a998992ef9bab137cd574063cb5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-windowsx86-64static.zip",
        sha256 = "d23a4d48117c21f2d19c0c6a314480b6ff2a71d449b211e108eb86c32bfe08d2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-windowsarm64static.zip",
        sha256 = "d9dca0b1e1cc7816ad56a255ef37bad879c884ae7a5d85f4ec28f68cac609c7e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-linuxarm32debug.zip",
        sha256 = "0ea2e4fd934e838b3c4e6af65a23c419939158667a66fa30314432efb084a990",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-linuxarm64debug.zip",
        sha256 = "e3bda59171a584a34078611bab505c9bdc896246d3515e10451df22cf0e0d93d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-linuxx86-64debug.zip",
        sha256 = "ec0c90f3d02969f0094174b2100c03ec9aa17ddaeb6660613b3fb09028c8ff4a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-osxuniversaldebug.zip",
        sha256 = "92f451806b7a55c30af5f67a7c06ed4deffcf131818be4a5bf33bc2e9858b7fe",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-windowsx86-64debug.zip",
        sha256 = "272b7054f7ffbbe82f55cbc0e48a9c675b8976fc2a8ea3606916b065d000d9e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-windowsarm64debug.zip",
        sha256 = "25dd5fecfc4cefbc6b48b8d36914b736d6d0ae9f56f971efaf9fa71007384831",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-linuxarm32staticdebug.zip",
        sha256 = "c5e6fbe01abd1649346f9f71f0845e5b5847cd01ae82f0bcb4b318cd8f59c21d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-linuxarm64staticdebug.zip",
        sha256 = "eef1fe63577d39ca6c4b47247519722e622b0878f4d5ee332f237d0d9dc5d83a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-linuxx86-64staticdebug.zip",
        sha256 = "628513d681e4933603a39f4c0c6ba648d1082a705f183be64abea08d4f257def",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-osxuniversalstaticdebug.zip",
        sha256 = "7dd4eb1dfda3c1300855cdcbd02508a10e6981832cc45825000120086f96cd93",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-windowsx86-64staticdebug.zip",
        sha256 = "a5fb7a742ceb9c30fe462a1bfbc9b98f9718e87301357c96dadd32b863459ae4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-windowsarm64staticdebug.zip",
        sha256 = "fcccb4c89f14717bf67ef80f2af84e1bab8b28ef1e204ee8b9e10ec65018d2b2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-linuxathena.zip",
        sha256 = "cbcadf4babaaf19af4bdca8e554b6f91441930ccb9b5de57dbc9d1a17ecd54d2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-linuxathenastatic.zip",
        sha256 = "bbb6ab33a81bb7846121d746d4fe4ad5ea9526148fc93719f1cf8b01757a85ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-linuxathenadebug.zip",
        sha256 = "1e1922be84d116be24264657726132d2575d83dac21809634b51bbc9fa6667fc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2/xrpVendordep-cpp-2025.3.2-linuxathenastaticdebug.zip",
        sha256 = "5f6069c5954f3d70312398ccf422e888962a789e19cafff1c50a96bf69615698",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2/halsim_ds_socket-2025.3.2-headers.zip",
        sha256 = "b800ec7cdba7e284d4855aa9dcfcfa97a1cada823d1afd91da768789e8b50c25",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2/halsim_ds_socket-2025.3.2-sources.zip",
        sha256 = "3b50b3a19e2e5c974ac0ba2bfe639fb9fb136b17e04dfd94ea8b75614a50fdf0",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2/halsim_ds_socket-2025.3.2-linuxarm32.zip",
        sha256 = "0b56eab1ca4c2e30143365d85e8a68e7a058d67ced38b25948ad4b9b562dd518",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2/halsim_ds_socket-2025.3.2-linuxarm64.zip",
        sha256 = "602cc85b78aabbd907040abdb2ed5824f48570c9e3bdbb9b19ed495f9580e5a1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2/halsim_ds_socket-2025.3.2-linuxx86-64.zip",
        sha256 = "3780ff2b492a1433f73fdfda7ef6a2252086045133b56dac9ce55279d13dc589",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2/halsim_ds_socket-2025.3.2-osxuniversal.zip",
        sha256 = "5c243fa08d8cbdf14b8184906ec51fc0bc3ea6b0a090cecb7b3c0c5d06191c71",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2/halsim_ds_socket-2025.3.2-windowsx86-64.zip",
        sha256 = "abdbfc6c86765fe2591bdc59517ece9f11dd38a664440317ec5d9d12e1fd04f9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2/halsim_ds_socket-2025.3.2-windowsarm64.zip",
        sha256 = "7d5a7b042a503e64004ee5197230421564615ff004e198641408ab0956b681e2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2/halsim_ds_socket-2025.3.2-linuxarm32static.zip",
        sha256 = "1afa859d3cf1aafdd3722ab02797767b129ad893ff951d16346612d72a4f318b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2/halsim_ds_socket-2025.3.2-linuxarm64static.zip",
        sha256 = "6b59de2b466eab20f0a6d10095b2e61b2b6f7c0848ec12b0e8c18702630d453d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2/halsim_ds_socket-2025.3.2-linuxx86-64static.zip",
        sha256 = "1c805a5025fe6c9957e6d32419475b7f532654e75c6c97fce7baa445ad347e94",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2/halsim_ds_socket-2025.3.2-osxuniversalstatic.zip",
        sha256 = "5311690c909fe0a9ef71d7a73ae9fa03241bed08b528ba24493053c8adcad6ce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2/halsim_ds_socket-2025.3.2-windowsx86-64static.zip",
        sha256 = "226dc0017f1a2048bab833f2f14bf44b59b8356984567921a316c018d614d478",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2/halsim_ds_socket-2025.3.2-windowsarm64static.zip",
        sha256 = "ec48010ca4f66bb57992e9bfa26d057703346d36dd87b0e88d597489e627220b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2/halsim_ds_socket-2025.3.2-linuxarm32debug.zip",
        sha256 = "04734b9b1b3842e51e1fe5032520a42e7c9328dd37c21b3940926d36e92ca976",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2/halsim_ds_socket-2025.3.2-linuxarm64debug.zip",
        sha256 = "da3733f8040624d23b1752149fbf386e49efa2cf6b18f167c0fd71376b611fa4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2/halsim_ds_socket-2025.3.2-linuxx86-64debug.zip",
        sha256 = "86efa927e8e3317d7d1f02f844fa9f993d0ee106582892b3f3b814809a8a9585",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2/halsim_ds_socket-2025.3.2-osxuniversaldebug.zip",
        sha256 = "caf5b15863618dd8ba8aa386891f08aee3635ed5806282f2ba9468a0fe6065fe",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2/halsim_ds_socket-2025.3.2-windowsx86-64debug.zip",
        sha256 = "e433f078cc75bc6f9850694268571b99714e6c62cf1fd935b127339ee280a961",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2/halsim_ds_socket-2025.3.2-windowsarm64debug.zip",
        sha256 = "ef3c107496da8770a765ca006f8bc8fcdb6ec0e6c3dc83139d4ee188549b386f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2/halsim_ds_socket-2025.3.2-linuxarm32staticdebug.zip",
        sha256 = "9e9d0d4365078fa98ac3c53e6b559a5a84bd5f106b318c41a401b460882fd709",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2/halsim_ds_socket-2025.3.2-linuxarm64staticdebug.zip",
        sha256 = "2b434f661843d872959a654adca9664766baa982ef5fe3a358aff9ba11bf4373",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2/halsim_ds_socket-2025.3.2-linuxx86-64staticdebug.zip",
        sha256 = "a550390522a236124a7ebbf18b33ec2b0f7750be336f482426ffd7c8234da551",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2/halsim_ds_socket-2025.3.2-osxuniversalstaticdebug.zip",
        sha256 = "7ee1149a691ef18bfb122679dbf664f82a2bae645ed5db8abf2eabd5aaedb75d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2/halsim_ds_socket-2025.3.2-windowsx86-64staticdebug.zip",
        sha256 = "976fa7d8200f00e45743376bfea1a9f232495e96e64dd4e1969b1e7643ca407a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2/halsim_ds_socket-2025.3.2-windowsarm64staticdebug.zip",
        sha256 = "abf8074a18ecc3e9b8fd597d4d1d4e11fe25642060d27d07092ae8a0fdc43b12",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.2/halsim_gui-2025.3.2-headers.zip",
        sha256 = "c530cad20f0479ec7ef91ec9d8d0afbba6a26a6e261cfb16afdd7eeeb49edfc1",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.2/halsim_gui-2025.3.2-sources.zip",
        sha256 = "35363c33b2b95045583485f3a2035705b4db34907bc67729dcaa9041c9af2e32",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.2/halsim_gui-2025.3.2-linuxarm32.zip",
        sha256 = "a8713b17da8632dc0020e08542563f618fe60789a38e92b8bf278ddb8607ffe3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.2/halsim_gui-2025.3.2-linuxarm64.zip",
        sha256 = "dfc6a4f6281a08c226eb467436bdd569133ecceb7eada3eaa3ef3328dcab628f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.2/halsim_gui-2025.3.2-linuxx86-64.zip",
        sha256 = "c5ba79b5c6737b9a610ff41e7315a91b96ba5237e28ace7fdb6a23d544c5b178",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.2/halsim_gui-2025.3.2-osxuniversal.zip",
        sha256 = "820162b00cf1aa296db0978b62e440b4e433716b32b0d04df2628950553401c6",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.2/halsim_gui-2025.3.2-windowsx86-64.zip",
        sha256 = "dd170749a7c7316db770a7855cbbbb2873ded95f4eb3a181c83e29424b65b1a0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.2/halsim_gui-2025.3.2-windowsarm64.zip",
        sha256 = "12f3cf64a3f507ba3472e82826fafbadc37d09edb5d34e5b83294db08a89087f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.2/halsim_gui-2025.3.2-linuxarm32static.zip",
        sha256 = "4e11cdd436dc0426ee819327cc3dd0a3678cabb06eb75144cedbcd1836df3518",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.2/halsim_gui-2025.3.2-linuxarm64static.zip",
        sha256 = "76063784067cfc80b84779156be632b8680d46670880e43b568f58d865ce5593",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.2/halsim_gui-2025.3.2-linuxx86-64static.zip",
        sha256 = "5973631c145cdb9e1a1d2fa3823d8bb61aa007b8b8a4af6f8741dcc8c75cd7b5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.2/halsim_gui-2025.3.2-osxuniversalstatic.zip",
        sha256 = "d053ce43e38f5384e7f163331f1d0af860b9702b135640bfe69c2f9cdc41d1ba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.2/halsim_gui-2025.3.2-windowsx86-64static.zip",
        sha256 = "74bb22b57cb7f15523c736e13c61ff3e23228842d4ed6f7e72e2f73f93143296",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.2/halsim_gui-2025.3.2-windowsarm64static.zip",
        sha256 = "58efe487ef467c010575ace6124199a1dec573105e41f4861d786fdbacebcb40",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.2/halsim_gui-2025.3.2-linuxarm32debug.zip",
        sha256 = "92dddd8648387a33a7acb5eeb8d62f84c67ee5a49961eff38c818d190722b3ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.2/halsim_gui-2025.3.2-linuxarm64debug.zip",
        sha256 = "df24a5948c9d89818a90b9ad24d5a78515a55e8f800432c9a09faac962a07285",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.2/halsim_gui-2025.3.2-linuxx86-64debug.zip",
        sha256 = "d30d14efb09e564e1084ea6cfe16ae59a80086ab2d851f002702a1050dddee8f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.2/halsim_gui-2025.3.2-osxuniversaldebug.zip",
        sha256 = "ab52b3ea1711afc3ff9dd518fb23450adb3b2b2d35ea985a1ac268541f0f21f1",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.2/halsim_gui-2025.3.2-windowsx86-64debug.zip",
        sha256 = "32eb0351969825e4111ec96eb269293fed0c1898ce7a57f7a02c6365b97cff84",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.2/halsim_gui-2025.3.2-windowsarm64debug.zip",
        sha256 = "57f59de56b3790e0cd2e1f786f653973694b62f022acc29cce3cf4f0a5574d0b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.2/halsim_gui-2025.3.2-linuxarm32staticdebug.zip",
        sha256 = "9610828fcc80e4408d2f272dbd9356162c910839f29b4f187ba547760f48b866",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.2/halsim_gui-2025.3.2-linuxarm64staticdebug.zip",
        sha256 = "184d4905690778e4764aca86630a092ab2e1f25f9958131aab85ee8f16d7b5dc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.2/halsim_gui-2025.3.2-linuxx86-64staticdebug.zip",
        sha256 = "ce13476313dc258816bde4485e9ebb72ac4eee4319ed6134f725cc155229f67d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.2/halsim_gui-2025.3.2-osxuniversalstaticdebug.zip",
        sha256 = "cf834ad354bdb90a45321c03782d0bf55f88fb1e189cc8b2bed79377d090ba96",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.2/halsim_gui-2025.3.2-windowsx86-64staticdebug.zip",
        sha256 = "b797ee97ec876036fab6923923efef268b194f4cad46fa0cc409bc7438f3fbff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.3.2/halsim_gui-2025.3.2-windowsarm64staticdebug.zip",
        sha256 = "c845325ccad88e8dd68a0fa28706c5cbc289c8b8d7991255a8338f6abe2fdf1e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.2/halsim_ws_client-2025.3.2-headers.zip",
        sha256 = "449f09c6acaff8ec5e369c16ef17152f662d5f8708ea83e20e6fa1603259cefd",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.2/halsim_ws_client-2025.3.2-sources.zip",
        sha256 = "1f69a9c4ad20a5c46e1db700a121c49b0b2e66eed40e14e7a5e148c121163470",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.2/halsim_ws_client-2025.3.2-linuxarm32.zip",
        sha256 = "982c87c91e978d232a7df628a55eed24261508fbc19cb3540e38fadd40d8a4ac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.2/halsim_ws_client-2025.3.2-linuxarm64.zip",
        sha256 = "43eb795148291a96ecbc88411e159760e14dddd8486eee396fc3a5546953b19a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.2/halsim_ws_client-2025.3.2-linuxx86-64.zip",
        sha256 = "9d057b35d28735b32f3ea5cdd93656ad87cebfa74fa8176d4966da973334a927",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.2/halsim_ws_client-2025.3.2-osxuniversal.zip",
        sha256 = "95f546c32a7977cead0e5432ebc7bb882deb7d19c966c2e7293269e3fdda33df",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.2/halsim_ws_client-2025.3.2-windowsx86-64.zip",
        sha256 = "87b87ef5a71fec5b7c9660bd47a21bf8254992f523660ce4f14197594a16d8d7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.2/halsim_ws_client-2025.3.2-windowsarm64.zip",
        sha256 = "f0a8f2e609a9770d797fac69be3ff17c24cf66e55318e89a794c0f88e2b76668",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.2/halsim_ws_client-2025.3.2-linuxarm32static.zip",
        sha256 = "84312454dc1da045bface87b9dd28fa6e7a6f8748a50b6394f7be7005a5d15e7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.2/halsim_ws_client-2025.3.2-linuxarm64static.zip",
        sha256 = "4e1a20bc913871e2e0f9514c70eb53a33d06c74f5e5f0783a5ef37b69685da56",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.2/halsim_ws_client-2025.3.2-linuxx86-64static.zip",
        sha256 = "e1b43ea7c7e3e6759fa657b4c2b9569e4704207b3aba7ece2bae2842e742a4b7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.2/halsim_ws_client-2025.3.2-osxuniversalstatic.zip",
        sha256 = "68a301474d51bce72219f7122a5db5d5cc9e7aa06afbca3f6e1e2f3e9aba519e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.2/halsim_ws_client-2025.3.2-windowsx86-64static.zip",
        sha256 = "329c36ef13fefb55821bd109e9c23085858e8f41ba43d3bed3f7b1de1df7e302",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.2/halsim_ws_client-2025.3.2-windowsarm64static.zip",
        sha256 = "d6853f6bc8f3e4925443ec981fbf68ffa6e2b0085c38d6316fb2187f18b5cf3e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.2/halsim_ws_client-2025.3.2-linuxarm32debug.zip",
        sha256 = "e32fb7f08169b5233945ac819d9fd1b9fb7ffc94de9afa1ec1497a5a9ee4795a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.2/halsim_ws_client-2025.3.2-linuxarm64debug.zip",
        sha256 = "34801801046e08a6e1bd899ef569a5c68d7ee59d3500dde63ae4500f456b9d71",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.2/halsim_ws_client-2025.3.2-linuxx86-64debug.zip",
        sha256 = "aa9a97a1f1eb869b89331f88c7a6e9730cd6863b48987e982f3ecea0b76e3e0a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.2/halsim_ws_client-2025.3.2-osxuniversaldebug.zip",
        sha256 = "247f84d24ed661e88db887502c8d15c224da3604cba5bd302b4925fe061fd6a3",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.2/halsim_ws_client-2025.3.2-windowsx86-64debug.zip",
        sha256 = "63c72fa04d89ecdb52978212d048f88490cc5110c2136d753d21180a6c753677",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.2/halsim_ws_client-2025.3.2-windowsarm64debug.zip",
        sha256 = "eed58cf0b6df8dc40ac939dd2aeb3ef9cbd948d46097a3eed1e1c67ab1e267f4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.2/halsim_ws_client-2025.3.2-linuxarm32staticdebug.zip",
        sha256 = "6de675aea176bf51200879c22503d1e9bab3a48bb374e3d37a22a7cc7d3ce73f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.2/halsim_ws_client-2025.3.2-linuxarm64staticdebug.zip",
        sha256 = "347ee53c052c3d33bbeb897cea63b644adcbd902599a8c3179871478fa61ddb8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.2/halsim_ws_client-2025.3.2-linuxx86-64staticdebug.zip",
        sha256 = "dfb826fe949450b5fb01108a4ef8d36b57a5a8062aa6276569b20d2a48b30d84",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.2/halsim_ws_client-2025.3.2-osxuniversalstaticdebug.zip",
        sha256 = "d69809cd50f2585e86de21dd3b24ec5e3ac7e87092479e24a05f42aaeb501f25",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.2/halsim_ws_client-2025.3.2-windowsx86-64staticdebug.zip",
        sha256 = "25bcb3db531df573d74033633a789e1f4917dee4d5799219851ff88f41e4ef35",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.3.2/halsim_ws_client-2025.3.2-windowsarm64staticdebug.zip",
        sha256 = "d1f2d1ab7a8c19296a0b51c450b78e8e7f95d6c65d1d8ab8523dbdd3cf560609",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.2/halsim_ws_server-2025.3.2-headers.zip",
        sha256 = "b2ec40cc9319496b4f64b78b1053f84831fe6f7ace01bbf3f5f72f64fa628166",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.2/halsim_ws_server-2025.3.2-sources.zip",
        sha256 = "7dee10337d3af44a889abce95cee66ff9305f278d15765d09ac834c2542fabb9",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.2/halsim_ws_server-2025.3.2-linuxarm32.zip",
        sha256 = "e3cda8fda654bb9422b857e910b1d3924d6eeca49f4f8fe1b30c4d5f33a84d91",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.2/halsim_ws_server-2025.3.2-linuxarm64.zip",
        sha256 = "0197dc73debc79899b0b13edfef4c265538ced813bc9bd3595e738c4a36731b6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.2/halsim_ws_server-2025.3.2-linuxx86-64.zip",
        sha256 = "fc8e33ef629cde67ed43be745e3f945feaa362aff970adccd6e97282131c0b8c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.2/halsim_ws_server-2025.3.2-osxuniversal.zip",
        sha256 = "109afc28c026fa94e66a9722b6497a8d6012c288a91d95f0bb7e907b0e11ef68",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.2/halsim_ws_server-2025.3.2-windowsx86-64.zip",
        sha256 = "ad6dc89bd84ae0b900d330d7bf9d1e031e8bd1659a7804eb699489a2b40f8cd2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.2/halsim_ws_server-2025.3.2-windowsarm64.zip",
        sha256 = "516ad15bcb8f3fa2d61db16497065ebb21b860c95ebb2633b77b988239f8f462",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.2/halsim_ws_server-2025.3.2-linuxarm32static.zip",
        sha256 = "8195b33f17a27ec3f4c98d004eaa2ea2ddf62fc05e43f5359c5ec783321902ba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.2/halsim_ws_server-2025.3.2-linuxarm64static.zip",
        sha256 = "123d337eb1ac72eb446a41370d3cc9abf4f123572ad11254889858d6e487b7c9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.2/halsim_ws_server-2025.3.2-linuxx86-64static.zip",
        sha256 = "680058362faf14b167d6f48030f8e86903d3d4ae11fe415a58b381838b452f09",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.2/halsim_ws_server-2025.3.2-osxuniversalstatic.zip",
        sha256 = "00a1b58e9045dd98bbd0d171b9d72dd22d1af2c5e27a112d943bc5ee68d7dd70",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.2/halsim_ws_server-2025.3.2-windowsx86-64static.zip",
        sha256 = "ebbda721abba984e5741b6f4b21fb5c167955f92601dbc1da77235c01084756e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.2/halsim_ws_server-2025.3.2-windowsarm64static.zip",
        sha256 = "2a7dd706fc23cdec7db6e2ff9baca849bc237972367240f82f1d81e9cf8eb0ba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.2/halsim_ws_server-2025.3.2-linuxarm32debug.zip",
        sha256 = "a40b00adb948cf0b42bf5c9f0bb515f6db03b3bdb5a3ef4947156414c2092b9f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.2/halsim_ws_server-2025.3.2-linuxarm64debug.zip",
        sha256 = "85c00391210cc530de77af8db96534031c4a376a959da045637953e62e0a8239",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.2/halsim_ws_server-2025.3.2-linuxx86-64debug.zip",
        sha256 = "faeab784e4d12c2ac95fc74eb4f6cf6d09851ccc58b767a2dd9abae1750205c4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.2/halsim_ws_server-2025.3.2-osxuniversaldebug.zip",
        sha256 = "c7fcf2c224c179dfc1fce1a2593d952df473409265eb7b4199e29fe874b868db",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.2/halsim_ws_server-2025.3.2-windowsx86-64debug.zip",
        sha256 = "551d41ef551860d9eede89af647837f4138a00cd1ebd85ec35a012ad558cf5df",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.2/halsim_ws_server-2025.3.2-windowsarm64debug.zip",
        sha256 = "0ee5fb93a561aa5f89952b1acf9e0d767db091dfdcdba3bff8f45ffd8d49b1ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.2/halsim_ws_server-2025.3.2-linuxarm32staticdebug.zip",
        sha256 = "df632e7317ed867f37768a2b7be87f862f3d5b176f72cf8000c3bbf8f681f892",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.2/halsim_ws_server-2025.3.2-linuxarm64staticdebug.zip",
        sha256 = "51d6d4d72c5f9b92656f63894d812658d0d1537e94bf99df14758377549f5144",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.2/halsim_ws_server-2025.3.2-linuxx86-64staticdebug.zip",
        sha256 = "4bddcf5b1c001105834f7fc64450fae3b634728f403bbc6383d6ba1288ce7a06",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.2/halsim_ws_server-2025.3.2-osxuniversalstaticdebug.zip",
        sha256 = "49c8585527039c2cba3b30e25e7dce381e67d14c34becad86a734ac6c2ee87e7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.2/halsim_ws_server-2025.3.2-windowsx86-64staticdebug.zip",
        sha256 = "fffc7b8cf698a556c92b55c493d5dff2bcedf2741e0f3f273de599900ef18f2a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.3.2/halsim_ws_server-2025.3.2-windowsarm64staticdebug.zip",
        sha256 = "20eb575a668e3f77ba7bd095c17945748e273de55eb5de70a0b02c91517b556a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2025.3.2/SmartDashboard-2025.3.2-linuxx64.jar",
        sha256 = "c1a674ecf093e8b542a8418d193465743e961d7cf26c39134ac380b63d6a186c",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2025.3.2/SmartDashboard-2025.3.2-macx64.jar",
        sha256 = "22605057f6942934e0bc3b326c7e05826ac362b08aeca41a1d08870266f2220c",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2025.3.2/SmartDashboard-2025.3.2-winx64.jar",
        sha256 = "959db22749f2f25f850c5a99c752de779514e2b64de5fad26b835de7bfbdb1a2",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.3.2/PathWeaver-2025.3.2-linuxarm32.jar",
        sha256 = "28e3aa71fab57800719220d0eeed6b08ae7bf0bfb6c3fb356b8f47dfb5d25a65",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.3.2/PathWeaver-2025.3.2-linuxarm64.jar",
        sha256 = "1ccc4552e59acadc6ed990dd3e69a73400eec051d2ff930018f6ade48da2095f",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.3.2/PathWeaver-2025.3.2-linuxx64.jar",
        sha256 = "45dcf7c15c45a5f730fbb069f91cd3e979e1c3976f46bcf2fa6619ac315dfa16",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.3.2/PathWeaver-2025.3.2-macx64.jar",
        sha256 = "0209debd3b560841be853a6659ee0fa8322cae162b8ba07596616974f6acd954",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.3.2/PathWeaver-2025.3.2-winx64.jar",
        sha256 = "87c15543ac509cba491d547fb3731254b5ee9ece5e3eb5d2992e27f6054815de",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2025.3.2/RobotBuilder-2025.3.2.jar",
        sha256 = "5ab4eb14c70d500aeb9d02cbdaa5cacea85cf309f45a6ffcb300ae611700e585",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.3.2/Shuffleboard-2025.3.2-linuxarm32.jar",
        sha256 = "9080ae6ea0b492ceece340ffbee7fb6ea5e61c199136b99a8a80b0487b0c1e14",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.3.2/Shuffleboard-2025.3.2-linuxarm64.jar",
        sha256 = "e77ef43410b62f1e415c7e98f168e679123e51fa4a86ed669f497a109a7cc610",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.3.2/Shuffleboard-2025.3.2-linuxx64.jar",
        sha256 = "58ef231827a68c31eb45ac3ece17d233fa78b8412c35da9bf912c19a014c7698",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.3.2/Shuffleboard-2025.3.2-macarm64.jar",
        sha256 = "6a0b12118ef8029640fe56da081516ac34aab7f95b97532872016219764f709c",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.3.2/Shuffleboard-2025.3.2-macx64.jar",
        sha256 = "b3f23c33eeb250330dbdcd1995ab493f5c827a276c74cf862b4823c42abcba6c",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.3.2/Shuffleboard-2025.3.2-winx64.jar",
        sha256 = "5e59e1ef4512efe4c2b864e11970f690ee416407822222ea96692903380a8298",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.3.2/Glass-2025.3.2-linuxarm32.zip",
        sha256 = "58c6fa8fc9db998b616e786c2f03f77414f81969c652a02072a4660e697616b8",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.3.2/Glass-2025.3.2-linuxarm64.zip",
        sha256 = "42669d08932330d7c047f3a557a268acff4b33ed6439d546859adc8ba1e00973",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.3.2/Glass-2025.3.2-linuxx86-64.zip",
        sha256 = "51ec0c5df2ecb9fdecf829dc0ba1023025fd248d1d63a1046ba5b9cffa77c6ce",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.3.2/Glass-2025.3.2-osxuniversal.zip",
        sha256 = "4186ed866ac271e4778610e833aed20f9fcd0461f29ae3097fe751f6718658f8",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.3.2/Glass-2025.3.2-windowsx86-64.zip",
        sha256 = "381952e98cdcb666508cbdaf1f644e8caededdb095090ebd87beeb3e1d564169",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.3.2/Glass-2025.3.2-windowsarm64.zip",
        sha256 = "d05c52cd08ecc246cbb027a78b5f03a88045ba2fd15d03ad4088689fb9875d7f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.3.2/OutlineViewer-2025.3.2-linuxarm32.zip",
        sha256 = "9c45e60c8001e72761339f27c8638db97a923f7dd95532c6b711231e5e5094ae",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.3.2/OutlineViewer-2025.3.2-linuxarm64.zip",
        sha256 = "224f87daf089d833285faab38e27977f567ab68c55b413a68b14c86710f0207e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.3.2/OutlineViewer-2025.3.2-linuxx86-64.zip",
        sha256 = "18e51b94cd4696b36eb31469b6776f7738c8a33f64c04f63363bcc70e73e00e3",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.3.2/OutlineViewer-2025.3.2-osxuniversal.zip",
        sha256 = "14413ff1f6b6b6ce5f4cc85847f19423f70e1e79f14a2ffc3f558015a61a791e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.3.2/OutlineViewer-2025.3.2-windowsx86-64.zip",
        sha256 = "739c69a42910c2cac2ac7252b44960e41905f88a21590b68d8eee9483484a909",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.3.2/OutlineViewer-2025.3.2-windowsarm64.zip",
        sha256 = "d646f6657b0d284b009c388393f742985ae1a568d83ec5f2f742318dbf988ad4",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.3.2/roboRIOTeamNumberSetter-2025.3.2-linuxarm32.zip",
        sha256 = "1f9eb11fa8812d12d85aa3ab3de47abafa267c358d70700f4cdf708e126a1c19",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.3.2/roboRIOTeamNumberSetter-2025.3.2-linuxarm64.zip",
        sha256 = "ef462964f54b5566bec694164d7ee79d5e1eea08ddcdcc477e980eb30f29cba7",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.3.2/roboRIOTeamNumberSetter-2025.3.2-linuxx86-64.zip",
        sha256 = "6efe72c81dc28191c58cd3b8e6ee820dcf936adcaf5f5b6fe33700f3d590c868",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.3.2/roboRIOTeamNumberSetter-2025.3.2-osxuniversal.zip",
        sha256 = "9c8313f8c67f4729315d92e780dfd381549ef9deae90cacc3fd2f58855e7d418",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.3.2/roboRIOTeamNumberSetter-2025.3.2-windowsx86-64.zip",
        sha256 = "9b2b87d8e2d1d723d3cd6f2660bf818af779599c138e2a5d2ed6a0aad7fa2848",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.3.2/roboRIOTeamNumberSetter-2025.3.2-windowsarm64.zip",
        sha256 = "a06e213c338f41ad24a66cd88020a67bac519772415fbcdb4b662c900034cb9a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.3.2/DataLogTool-2025.3.2-linuxarm32.zip",
        sha256 = "b1ed95f7e7771c888a22885b8fcb3b8a52b5fa4147de442f69a10fdfbda1f1bd",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.3.2/DataLogTool-2025.3.2-linuxarm64.zip",
        sha256 = "82660f98569f4b62844e9c73e145ac5fe879d3a754e1d9246ad613fcead0e599",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.3.2/DataLogTool-2025.3.2-linuxx86-64.zip",
        sha256 = "d1d8a6e3c090ee2618b9a340e1e7ca24e1f5543960168c9e79f0c8d93c4d319e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.3.2/DataLogTool-2025.3.2-osxuniversal.zip",
        sha256 = "64882ee1b74b06a421b6ee11d4619557c056f5358f576a36174fffe45de4a7b0",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.3.2/DataLogTool-2025.3.2-windowsx86-64.zip",
        sha256 = "68981e567a8fa0badb3913149fda23e712cd31fb68d25c07034ec6822393785e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.3.2/DataLogTool-2025.3.2-windowsarm64.zip",
        sha256 = "ae6dc5e4adfc38890c98a65755fcd73d404d16c39c4d4571c852087e4465f926",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.3.2/SysId-2025.3.2-linuxx86-64.zip",
        sha256 = "8aa842e47ae673818c0a37ef68c35afa03ce4abdd87fcd6c8a23050774831dca",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.3.2/SysId-2025.3.2-osxuniversal.zip",
        sha256 = "3f4608f946187ad277f33549c401fd0c208eb28ae94f1cbf5c507a2cea2f6e98",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.3.2/SysId-2025.3.2-windowsx86-64.zip",
        sha256 = "638c216b19cd7475fd68348bb3d74fc5da2d6943398a994a0a62099d4ec3d449",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.3.2/SysId-2025.3.2-windowsarm64.zip",
        sha256 = "2e76419341f4edb568651ce8fbf5c92048d56db0cf787f317724f2b4bae9bbc6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
