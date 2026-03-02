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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-headers.zip",
        sha256 = "2abf48fdc23b5db29b6a0a9ef0e13595385461f7b597a46510491c759a23c5a7",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-sources.zip",
        sha256 = "c4bb82f6a068614ee66579112b15bf8c350b81829ed2fad94efa43c44a7e899c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-linuxarm32.zip",
        sha256 = "546f6fe0435882883f3b5d504fbee3d80dfd5ac0027b91b18970a9509103d6bc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-linuxarm64.zip",
        sha256 = "b96f97315586476128bf6420158f102bf58278ea30393c2d7f21cc2413069b58",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-linuxx86-64.zip",
        sha256 = "b417aafd2e8da1a8da78c45055831cf63d324c537d14497f9875c393129817e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-osxuniversal.zip",
        sha256 = "867fc67b09c3e4565716caf1165d8d489c784ac3e32419a8518a357e5e0d6a21",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-windowsx86-64.zip",
        sha256 = "80e05f7b87634bb850da83f47428352c894c533a2a6b6f3979ca4dabcf176554",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-windowsarm64.zip",
        sha256 = "6c4e0a9bb4e274ef0f20240b5c11120c1a28abc72212c7529f55d865ac2c9940",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-linuxarm32static.zip",
        sha256 = "c94cec63a473762f6d37788002a35949d2030c0272fe2f8e5dcb49d7dfabaa51",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-linuxarm64static.zip",
        sha256 = "dca3307d4b2edec176a2602d64a4ca88886fea6954f1bd8f4cc2e9a2b4f40c91",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-linuxx86-64static.zip",
        sha256 = "562a6b6e55f107edbc6c0460b719032333287de73f2f68fce219d45b71777283",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-osxuniversalstatic.zip",
        sha256 = "8e2f56f1523c5c534b6a6756a085edd6d8704b444e08a82a2c387250e73a9528",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-windowsx86-64static.zip",
        sha256 = "60963b998176a7367523254f23e25152b7c119d30dfbec0d7efef04caaafefd8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-windowsarm64static.zip",
        sha256 = "e0f239641381e08a0f855652394c8ac20336e30f4d830c078c866c4fe8fc8464",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-linuxarm32debug.zip",
        sha256 = "aef338e7ee0aa9c039d1cb2b4310b40340de0a50f17b1c2d3edbb04c9e08038e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-linuxarm64debug.zip",
        sha256 = "e97cba8adcb0bddcd9605841a7a4d947762bbd20ead534692006021cf791836b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-linuxx86-64debug.zip",
        sha256 = "88dd4d932a2ecbddb289060aa7eeb0f236b934df9b38f00c4a8f77740911ef97",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-osxuniversaldebug.zip",
        sha256 = "42f790d6314fc67d73c0bebb284d70d74934b5cd324636793152fc976b496b5b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-windowsx86-64debug.zip",
        sha256 = "2ef7d990cd10716f9b9493f36beb705662968aee5a7ccf9f84269a6e0c98797a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-windowsarm64debug.zip",
        sha256 = "2818189e4ee1403950e8741ac4e3f97745cab7cbe1cac865c72696c892e61a0d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-linuxarm32staticdebug.zip",
        sha256 = "307d1eaa17765cb3bb0a65a737480f22c288abeba58b09d894fd1ec4de0b322d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-linuxarm64staticdebug.zip",
        sha256 = "5cea6d5c7ef53eeb1110b40d4c4e5dfe929c56404983a5b09ec115642ece5060",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-linuxx86-64staticdebug.zip",
        sha256 = "ccb91de09c5c6f2dd5eb71c5a88e79c21c96a405223137e4a099a9f96c346532",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-osxuniversalstaticdebug.zip",
        sha256 = "6ca3dc2cdbb2c23a2c17971efdbde08a875b00924560ead97842a23340b99115",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-windowsx86-64staticdebug.zip",
        sha256 = "4f590304382a334a43b47fbf24659bd5c8a45f9abd122c659313ce739e60acf4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-windowsarm64staticdebug.zip",
        sha256 = "d3c749a08569d9a3034f5e358fb17cd4114e36cc6d56c03efb46091f98b73ae0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-linuxathena.zip",
        sha256 = "565b0a0ab6ff164e78351d12805c26949e0ffd09d8fbf6e827c5c6641765a616",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-linuxathenastatic.zip",
        sha256 = "9e6548a7e814bbc3a3e002539a7990dcf036fb97401b1b7fedb074891aa5afc9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-linuxathenadebug.zip",
        sha256 = "069bf506d02d70662700a04299fe3e2ed8b972af4cb782089ebf0df18993f831",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.2/wpiutil-cpp-2026.2.2-linuxathenastaticdebug.zip",
        sha256 = "86c36ee60721e9294c818f118abfeed03c547ddd0e78b92282702505eb50362b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-headers.zip",
        sha256 = "3997b1ad6536e0b6d877b98683ee0f9f9fdfc04af6a1a14799aa6524c485a67e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-sources.zip",
        sha256 = "88feb4cf3ceef56c5165134303d32e2d020997a6511401ad4a097bafc8a0d1a1",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-linuxarm32.zip",
        sha256 = "9f5ae8a9d7190e1eff41d558d82150a176f52765d625dcf163e3584e1eff1ab7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-linuxarm64.zip",
        sha256 = "177b8092b8efac60543f6235eb007b72c2769d292b1736b03a6fa10e275c72db",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-linuxx86-64.zip",
        sha256 = "e300c608d1cd5f7ab3292ddfec691155e3d2be3930b4657f3bf83f3dfe87625c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-osxuniversal.zip",
        sha256 = "526fb149ecf90e0edc1e1bf932c4d8010909d3dff54bc6719f1081a0972f4ec5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-windowsx86-64.zip",
        sha256 = "f5761a7d642c5a21a566dc7eddb76f05774a90aa40fd846c9a630f61e33bf9e1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-windowsarm64.zip",
        sha256 = "b31b98ad37de8ef7442db443d94e509ed44449e8ee2977ae54a68ce70596f025",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-linuxarm32static.zip",
        sha256 = "92ae64f1bd9166cae426d8add9230f85291246a6112667ad80afb89ad47d240e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-linuxarm64static.zip",
        sha256 = "95c1b4514a2c24edf60d0fb39b663a93c76a2f3665ae6c94792c44c146ba2f77",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-linuxx86-64static.zip",
        sha256 = "70de4b0bc3f674394d69f9ae83468760d0227750378c8c6ceddea5e7f183f837",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-osxuniversalstatic.zip",
        sha256 = "41aa65b927bffd9fc5f6037891aed38f9bce44591c6cead01db83ab669a48d0f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-windowsx86-64static.zip",
        sha256 = "cfda96780c8b2ccdbc51343b5b85a0e7ab657a524289514352055257a03e2491",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-windowsarm64static.zip",
        sha256 = "44dbd9f8cfe1a9bee3b681db8d834a1283d961d3c46cf54a887453da3467038a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-linuxarm32debug.zip",
        sha256 = "d01f15290806cb7e3788ed6ff88cae6925320988b2ea53f52fa67676fdaa94f8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-linuxarm64debug.zip",
        sha256 = "10536d6f5cebd12de484d0ef438c337b40e6eb4868ac29536e4ce76ea0ca1586",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-linuxx86-64debug.zip",
        sha256 = "e2c480f7d2dc22277675a537523e663f0b6891ee1916282841e94c66c364d840",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-osxuniversaldebug.zip",
        sha256 = "317f3d07b3c2a0b27816ea8f5e20a1587cd1be3818ec9f8a3d6496b708945edc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-windowsx86-64debug.zip",
        sha256 = "3331cca4caab33c82c2d2e3af673ed565fb3e69a1062790935ced47fad1a8ff2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-windowsarm64debug.zip",
        sha256 = "b7a0c52e106faa91dc2c6dc6c128782d60e64142ce5e366346913d49929fe160",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-linuxarm32staticdebug.zip",
        sha256 = "6a3911480d5285ac0514e3f18885aa4202109df69694a06d0028e5953f7f049d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-linuxarm64staticdebug.zip",
        sha256 = "6e93b64b867d8f8e2a1b87b37618bc835d264558ed64521817b61d9f7884fe91",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-linuxx86-64staticdebug.zip",
        sha256 = "1df51e7be0bf4c5df2bc7eb2bc552bbb93af46fcfd714576072b0b8f9e80ec95",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-osxuniversalstaticdebug.zip",
        sha256 = "ced8485d5ecf857a682a19d47a314c19b75467f9cb5028ec37b41b63ff5e063e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-windowsx86-64staticdebug.zip",
        sha256 = "41ecabe53c0a3807fe292bcdbbe1b3d643fab76e26bfbd803e3fc06bec8836ac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-windowsarm64staticdebug.zip",
        sha256 = "39f1c85ee9bcf4ffc01ac2751656e5b58af88cf399327ac4d72be46d7ec1fc3d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-linuxathena.zip",
        sha256 = "b6c69865bb420763dd242ae424efd6b4b7279c75d741b026d3d7aecbc68a945f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-linuxathenastatic.zip",
        sha256 = "8a5dda68dd21a340a61688239b9bcb8b0013851e8635061f8991e00720713b0c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-linuxathenadebug.zip",
        sha256 = "5e1281c044d0c65282392471a1f428589fb9ab7810c513522c9e8b5dc93789fe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.2/wpinet-cpp-2026.2.2-linuxathenastaticdebug.zip",
        sha256 = "ceaee044c8ef5041d5f9a1688de13bd4fb992904da13ca3d962de3597a1809e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-headers.zip",
        sha256 = "c5f4e724b55249349396222cc1b733d310705d89b5eeceaac4461f0d715d6793",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-sources.zip",
        sha256 = "25c59aa0b0812f9a6932cba3ec04f4f3c169cf079d7fb602ac7cf6ad5d07a318",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-linuxarm32.zip",
        sha256 = "d7b4d799d9564b30912182ac0cccd40051bbd5e71720a8fdaf5fd0bc1a5fb554",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-linuxarm64.zip",
        sha256 = "af74375c917d99a79508a4e85a360ea0374f379e9414d6565f76a3a7222ea94c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-linuxx86-64.zip",
        sha256 = "bd5d1af6f772f28740d4647e6b8160db27da3d3fff2f5aa916919764c56b8e28",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-osxuniversal.zip",
        sha256 = "bf633d98188a1b6a46895438aa2c5ea550bb3dc06a1337c5069adff18640249b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-windowsx86-64.zip",
        sha256 = "6d03864a1027694eac9d666d1e4746a5052250b57bc029dd0f177bd35ad439cd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-windowsarm64.zip",
        sha256 = "eba1b95b4f0f18cf624c5620fdf56ff7b076ae471982da78ed08650e120603ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-linuxarm32static.zip",
        sha256 = "0363f9b090ee9dd11ec02a112a8d5f0e3675e6e8bea5b69a7f0b8bdb4f3f187a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-linuxarm64static.zip",
        sha256 = "de59dbd6aa38a7757029c0fb2bd4a656df7d831115f92d68aacaaf1c80bb3359",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-linuxx86-64static.zip",
        sha256 = "2a430c28ded2237d0c5057b2cb2ce51b90cabc323476054c5a85b557c26efa9e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-osxuniversalstatic.zip",
        sha256 = "30830f18e0adfb77e8e92346a1c13a5028dded80c9067bee0d9feac40608feb3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-windowsx86-64static.zip",
        sha256 = "887264d4018bb762323d3d9626c1007d57e5091bae3ac5512036a61f198afcce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-windowsarm64static.zip",
        sha256 = "d992805b837556fc4d96c18e4ef6980991db9f4a662ee9276a9ec64c15a95685",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-linuxarm32debug.zip",
        sha256 = "ab5535c16fd6ae75d1a58ad01b2f942ac4d56f0c9d8ea3702247ec7fcb5c82e1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-linuxarm64debug.zip",
        sha256 = "106fde6c45dda7b91a6f3bcefee31c50e658340a0b292590700d6d8e8dacc069",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-linuxx86-64debug.zip",
        sha256 = "1004f92bceb5443697dcf74ac4c5e6832c6241ab06e6c7bad020898c4cd9b213",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-osxuniversaldebug.zip",
        sha256 = "8687ce58b005c1c18cec735f2dfb611ed6ea90a8730bc7d3e0962c03e7e838ba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-windowsx86-64debug.zip",
        sha256 = "46dcb66f5a4378f5c80d0933aa66ec4ec82f2cb693b98c35cd070e60c1021cf2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-windowsarm64debug.zip",
        sha256 = "d6bbb5cde98a55ced9905c00fc87fb22e38d02f37da45bfc73233821ee4bf3d4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-linuxarm32staticdebug.zip",
        sha256 = "daf7ab0a7c28010945b9f0236ff21c81d156de393b12b59fa2eb9f67da2ebd38",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-linuxarm64staticdebug.zip",
        sha256 = "4c8a6367f93075e1f65f814294c477c9acfa54ab12fde1bf094635e69fcba51a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-linuxx86-64staticdebug.zip",
        sha256 = "c085fd20127390db5d2324c7a178bf8144f6f65d91cb02b27c549750b1049309",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-osxuniversalstaticdebug.zip",
        sha256 = "4d1c724503982ecec2bcff7dfd1e022417b58a4a21f64763f7404298d83c5ee4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-windowsx86-64staticdebug.zip",
        sha256 = "f57ea2f1c9a2e611d0474b6a618e9a5cc6bdcb389c371fa7b88353c75ef70963",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-windowsarm64staticdebug.zip",
        sha256 = "9da7c2fdae0fef445b0f4d8d1207bbfe1b2ae4b665bd987901c5f8bf0e114743",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-linuxathena.zip",
        sha256 = "de05d9ab4b9768210f81a570def69ebacb3474de5138d1a59fe92327ca09cc09",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-linuxathenastatic.zip",
        sha256 = "9e5642638f6eda94ec02a151e8c9cf83536d0da2f490c23ef91e1e3bcc51de90",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-linuxathenadebug.zip",
        sha256 = "9eaab03ebc207b36e1d4a91904c47664c2d9ef5fd623ceb39f0fcbdf74da346b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.2/wpimath-cpp-2026.2.2-linuxathenastaticdebug.zip",
        sha256 = "9d52208aefdb897c454f50400b5202012faa454f1a6102a8889856d13b8662b4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-headers.zip",
        sha256 = "190e80b20ee46b30c7d1d737f220952d09548cca60bb48bc7f1fb0c7fdec3453",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-sources.zip",
        sha256 = "b118a288eab2eaaeaa195be2083e5365b57dfce23c37262212b3c9e02b1256e9",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-linuxarm32.zip",
        sha256 = "db39f6d8435470bd905876e32d0c0bc4def7da520eb695264d49818491fdeee2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-linuxarm64.zip",
        sha256 = "d51162ca09960145563f185fdec8516b822052ba6fb0a800cb84faddb1cb2500",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-linuxx86-64.zip",
        sha256 = "3792243c61f8e9c83861e3a94973352ef2ca264f2a954c67624f98022b11ace6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-osxuniversal.zip",
        sha256 = "6454243a9db1df5e8b2ced99fbf704205db677eaaef0db2b350e4a42ef6df916",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-windowsx86-64.zip",
        sha256 = "a5aefcde9a716abd95e49685e1ad022c5e830d5d2a5baa0cd24f102969599c23",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-windowsarm64.zip",
        sha256 = "fa4d2c4289ac864171f9db82484a1336d322e74045b5b961a2cb2fb73f13730c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-linuxarm32static.zip",
        sha256 = "16c0ddb3103665a247a28ccb6a3a4b87727383b25dc1005d03d8a44716780ecf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-linuxarm64static.zip",
        sha256 = "8e0c29bed25d6bcdf9a3ae76563b14f5592840c8bf32ef170499723b202f20b1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-linuxx86-64static.zip",
        sha256 = "ae5287c53efcece0ec03937cef022124688c27a114f5248e71b6af3109fbd8cc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-osxuniversalstatic.zip",
        sha256 = "9b5e24f75ae966b328274d2ca2d07beacbb83120cd462715b99d2e39729deda6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-windowsx86-64static.zip",
        sha256 = "53afe97dd1a9a489754b5c85a0f45eca2fd7f519a2457419c13e714f4e5949a1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-windowsarm64static.zip",
        sha256 = "f17b20f33cb4ec01c4974dd4d2c4756db65ea8519543baa3e69fe071abc19db8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-linuxarm32debug.zip",
        sha256 = "706e9a545087927c9496296091ea4ad0b2e7ab0b7486d8d811ca80431f73c519",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-linuxarm64debug.zip",
        sha256 = "ee13c2227260580127aba46f10101867bfdd99896bed1539fbdd424354fd44f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-linuxx86-64debug.zip",
        sha256 = "9345c7ddc279a71296e24fc07b2d7b80f32a3f530a86da9a4806070d626ab369",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-osxuniversaldebug.zip",
        sha256 = "9d138170f009c1ea638142de009a144d4d3631b5c8bd9cadd7a9c4b1e4d9bb4e",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-windowsx86-64debug.zip",
        sha256 = "ca7761a3d057ec623caba6ff6f7195d9e5e432388617f4e3bb6fc93462ad743d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-windowsarm64debug.zip",
        sha256 = "d279a56d57357d1cf3335d441c0969eb19786caeb231f9256f78332212132ffe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-linuxarm32staticdebug.zip",
        sha256 = "d0602b98b8a64605c70267568ee77a0931123a581a487a6ac796c78ab62055f9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-linuxarm64staticdebug.zip",
        sha256 = "56ac368bfbf5bc13277a956e184af19fcaa2cac2cafdbf4239dfc50aefe4a8bb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-linuxx86-64staticdebug.zip",
        sha256 = "81409dd8685fdcfd175fadfb783849732c803a7f51eb8a7998553871a9792040",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-osxuniversalstaticdebug.zip",
        sha256 = "57dbc65f4ede8b86ef4bf63cca8b2a7f680ab1733c4f308caf727dd6ba4592ec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-windowsx86-64staticdebug.zip",
        sha256 = "28e421dc5ea2c5e67e1c5acb4924c47950f310ac149dd0ecd4238a8fd9a60df0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-windowsarm64staticdebug.zip",
        sha256 = "c0ccbf406e207a0bd04c139f90c4e4a756c25dddb7e1bc4efe9236ce29614958",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-linuxathena.zip",
        sha256 = "babe72db946d961596b9705e276dddb1075b28ff4bb4bee528694ff1b44eda68",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-linuxathenastatic.zip",
        sha256 = "15d3dbcd0d3b7cfb2272684cc33db98bde36e4cc9548f63bac7a7d0e16cdd78e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-linuxathenadebug.zip",
        sha256 = "dbec5671ab9944fe017b00c1355cd56f60b7ed76c12308d51c082a58b4261433",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.2/apriltag-cpp-2026.2.2-linuxathenastaticdebug.zip",
        sha256 = "cf836691b7d0a28201b4c8d2d3778ba0604cafa839f1c1f26aaa905007847170",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-headers.zip",
        sha256 = "41799bcd07cb2d426ff3630bdf6e6e8e781b98c8329ca4ce19291f69ae6f4a9f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-sources.zip",
        sha256 = "0390707bce46c8c18d72b8def6d2c2224275cabbc53b53a9c7e8da2f0027a7c8",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-linuxarm32.zip",
        sha256 = "8343198908ab7a6c8f3ecf4619b2762d377ec3515194cbeca80408f7e188e9da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-linuxarm64.zip",
        sha256 = "d296c4e8bdc483f1b3ea139c7924a97187812a0fce38bc0b2b708cb3fe3d08b9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-linuxx86-64.zip",
        sha256 = "facccba12d3a58cc845afa914510f744a73f2318a2eddea8af3f5c1350b6bfef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-osxuniversal.zip",
        sha256 = "c1b0be3f6167cc3acf8a3fcb45a6f67483674aa4d5bcf40130a448a150f7f767",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-windowsx86-64.zip",
        sha256 = "2a52ff9f1bc4e7ad4c6e271b293eb7359f70730dbebc03fd7f7696e42692dbf5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-windowsarm64.zip",
        sha256 = "6a60865744a30cb3799a861fda1463a618541b8e790d12c49f5c3a952aff4724",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-linuxarm32static.zip",
        sha256 = "63740843cd5c64bc8162c85ec6ecd3a1ab658d7b9a62f1ffe3c80bf1b28e0d5f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-linuxarm64static.zip",
        sha256 = "f61038c6fae77a20ccbbb16eb634cd1e33e82b3ea545f0da96dd8de2573c2790",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-linuxx86-64static.zip",
        sha256 = "3ddf5224d65ac4875f013214c968028863006713ccec68ff6319ddb8464f0cad",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-osxuniversalstatic.zip",
        sha256 = "5f316be568cdac437b024dd965b7c18a1ba6feff00cd8dccb1f28374faa56ada",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-windowsx86-64static.zip",
        sha256 = "d05c491f2f31b99025acc34c5fa9a41143da112345c33ffe04c693ddf8d813d3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-windowsarm64static.zip",
        sha256 = "585e24e098f05b693750b147e0e6e265c2e9d4ab811cbc00df019522e0c83ea7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-linuxarm32debug.zip",
        sha256 = "fc03db0694ea4f8c105569be100b56278953db08efc5b68e90affe7b9f256c2a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-linuxarm64debug.zip",
        sha256 = "e2040b26bd0289fe6800099c5696fb70b743898cfe41c4c469267105f81987d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-linuxx86-64debug.zip",
        sha256 = "1463cff0edff239601d3d402e5e44c67f1d7c32797f01227234ad18fa4979443",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-osxuniversaldebug.zip",
        sha256 = "8ff3b72828cfc8336428980ba5fe411f07b2ecbfef3b045c6a436aa6d4ba35bd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-windowsx86-64debug.zip",
        sha256 = "90e1a07ceaceba0feff42e2b82a0d96aef5843f245a21e2c93824dc55a176d8e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-windowsarm64debug.zip",
        sha256 = "7e1a5685c7713b83d523fc3ce9d4600edccc0ad8cf64ee03b33da2b129f7b881",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-linuxarm32staticdebug.zip",
        sha256 = "a57076ee5826bd958b3e5bcc72928e9cb0e7e058c247e0c49b5790ca21baea49",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-linuxarm64staticdebug.zip",
        sha256 = "bbc70565543fcd8dec7de04cd5390225e76f8fc0b333a5ba9fd37862a3347862",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-linuxx86-64staticdebug.zip",
        sha256 = "a2c768858ce145b072bc7d802587dd6d246c32edb3cdc4b1a891d966f32920ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-osxuniversalstaticdebug.zip",
        sha256 = "79c757561b1586ff8965c65f47e047f52774046b63f3471d472c5cda7bb9a3ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-windowsx86-64staticdebug.zip",
        sha256 = "ae5b43dd5d1373cd1f8a815f4d14b765a8891851f2afe7055bd0aab72746a915",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-windowsarm64staticdebug.zip",
        sha256 = "de5d52744a49ce2869880ce7cfd81d357edfe6a54247eef85b0be06c82d5ffa1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-linuxathena.zip",
        sha256 = "bdf5b4b1f90b5fec650e4a1c54fbe733b5992ac21767a7ebed9f77d84d58f134",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-linuxathenastatic.zip",
        sha256 = "47ec245c9e0cd8bf3a269f324681f1f1cc5b7322be8ba9d3a7f693a0d319ece7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-linuxathenadebug.zip",
        sha256 = "f9c5f9a664ba9c9d92d6b6a68334cab0d1def0771b9e416b69d270f08448b515",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.2/hal-cpp-2026.2.2-linuxathenastaticdebug.zip",
        sha256 = "5b751c1483a66fdc98cba89e1c780d26b201a54cabb8f5c4d4a57c619e8edda8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-headers.zip",
        sha256 = "dd84eebfe0c0b66fa972bb375f15ba9b46b5986c2f6ce8f34d77171928a220b7",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-sources.zip",
        sha256 = "b04d0b18fca04acaeab027713195f81046114090d9657736c0a6df885e70a137",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-linuxarm32.zip",
        sha256 = "1400bf27c0eac91197487551c3580e39bb6a989b09e1fe0dd2bae54fc5b5bee8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-linuxarm64.zip",
        sha256 = "b7ac50cc430395697f0aaffd356319cd63163ee3978d5a7cdfddfb9831e06119",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-linuxx86-64.zip",
        sha256 = "2cf4d446b56a69ccf1961f4f302d41a6c50258d13c8d9dc28bc10a3365517e3f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-osxuniversal.zip",
        sha256 = "135ca27e362486bc78ae8d85bf0a2f2c7c8c25c968a0be7951a232888bbb65fe",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-windowsx86-64.zip",
        sha256 = "6c4418f0b4663d079f11c4841801e7d99d30023730e68d1a1f2f6f66dceeec4b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-windowsarm64.zip",
        sha256 = "ab4bf22f2b07fc407eecb291604e884bbed398044229e5dc3c7f172a3c9677f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-linuxarm32static.zip",
        sha256 = "e3d70e5523516923aa79265d54dbeb0089caad2d0bce5c4c1de6b342a206209c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-linuxarm64static.zip",
        sha256 = "46588423efa43b34e984e930ad46429636fca1ec6dad937202514284cd0a5d5e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-linuxx86-64static.zip",
        sha256 = "22f8e15464497e1dcb02c6e93450d918859ca730dabd66ed3905a032cc806808",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-osxuniversalstatic.zip",
        sha256 = "c400b00da8221eacb74e96aec50b7d7c77a3700e68923f2b54a290646b3703bc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-windowsx86-64static.zip",
        sha256 = "8b5f1222b246659f2e5cb1c14587ca58836748d64aeb3fa6df8ea05b28b030c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-windowsarm64static.zip",
        sha256 = "8028ff89873beb3b636ecc358eb5bfaded9135f28829db74fce9fe233674f485",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-linuxarm32debug.zip",
        sha256 = "5aceca887bb0859df49798b4e63fa05c7e5ed63de7374380913f33b29abe218e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-linuxarm64debug.zip",
        sha256 = "dbcad08e59d0d91f303735f1f38d0c70489ca355d515e428ea1e4d527aff02c9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-linuxx86-64debug.zip",
        sha256 = "9f11a1e4903cccd05c7f28c717eb4b83e5e84c290355873135402a2f30bb4a08",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-osxuniversaldebug.zip",
        sha256 = "f577d647b7aee449860256c968df697d3e0112ae59be70526f2a2cee1e16862a",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-windowsx86-64debug.zip",
        sha256 = "f75502cc82030c8ad2f6402cf001c559a2986599d16f48a9b085c8225f0eb41a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-windowsarm64debug.zip",
        sha256 = "1f25321451e26bf849a6797fe01db02497fe3b02e14a7c1f71865c8a6f9a50b3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-linuxarm32staticdebug.zip",
        sha256 = "f8e585172bc51bcaa10cdbd9d9266649ded850eddb83de4e4116d94de1af2b2a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-linuxarm64staticdebug.zip",
        sha256 = "b7ee874e7339ff2f56cdad5c7a07eefc009645fe7dc40c320b868e33e3e2b51f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-linuxx86-64staticdebug.zip",
        sha256 = "a3f2d9590d00bba58879e2591e573fc78de448ff8094b24ad855199ee825fb17",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-osxuniversalstaticdebug.zip",
        sha256 = "bc36f0e633005b358a783b73473fc869950cf4eff6c2930d6c40efbb38e5644f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-windowsx86-64staticdebug.zip",
        sha256 = "7c7993c681829f5d2ea8b4a5478d5f4a0d7e6916536cafdd00093c8ea8e2cc49",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-windowsarm64staticdebug.zip",
        sha256 = "695fc7497a5da459e01ccfe6319974869d9f7576544d588c4c778c04895dc0b6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-linuxathena.zip",
        sha256 = "4a170e6e6220b24b3511a79a3e1efae1e61d82ddea0afc4ff81128725ba26b9d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-linuxathenastatic.zip",
        sha256 = "e17efbcbe1ea1d491095b285985b43dbacdc5bebd546721c0dde541e84bfe015",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-linuxathenadebug.zip",
        sha256 = "4468474b40ca60dac0f27faade1bbd70488ff0e465d93ed27238dcffd376e6c5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.2/ntcore-cpp-2026.2.2-linuxathenastaticdebug.zip",
        sha256 = "3cf10aaa93952e4e52f8236b0df24c089d5c68d98fbff402be75c4acf9e7a5d8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-headers.zip",
        sha256 = "056e9ce436010d5aecb45c0df9d59eda13d3b6268aa4b8292fcc206bd0b5185a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-sources.zip",
        sha256 = "7cee113fccc2d076086edb8a99dd02663f189081b003e73b1bcab46bd775c5ba",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-linuxarm32.zip",
        sha256 = "b378c8937beb3d31bfb2d6f3f92b63889df93b932a43fe39815b7978aa255af9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-linuxarm64.zip",
        sha256 = "c5d62a1531c05153260c0cb7ff11126517c1d40470299b180527528f78378e68",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-linuxx86-64.zip",
        sha256 = "efb8584a992187d3c6465693a67b2918eb133ed93ca77837a95e7f1a921896a2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-osxuniversal.zip",
        sha256 = "ec95cbcc5c787bdd7c81ea91373ae1c056f9477de4e154e3122ee59af491a7ad",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-windowsx86-64.zip",
        sha256 = "1d0fcd28f478afc6127102c526efedb9895b2933745bdeaacb23e74e33b120b6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-windowsarm64.zip",
        sha256 = "f12b79a6fa7909ca64d2fbded6a56dc64e1fa28eadf16ce460f38371f6770d4f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-linuxarm32static.zip",
        sha256 = "e0b119aa4f2a39fdb746a493119447aa0f9f10ed75a41b2965ea8c5ba5f3729b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-linuxarm64static.zip",
        sha256 = "7efd5946b21ae830e15ee2ae99524990f934b6c4014d727f484ca25449285695",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-linuxx86-64static.zip",
        sha256 = "4196a832b62485cb9d2ea3cc89ccf222852f3586cca15cd123d42754b93ee60f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-osxuniversalstatic.zip",
        sha256 = "0536f4aec6cd4944831396b979db363b13b02b83ec86d58a1f556ccde0e5215b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-windowsx86-64static.zip",
        sha256 = "e6cd5ed28d24565bc37fee1e6cdd5c5f31a97a99ff7ba3c9cfda1a71d1b6327f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-windowsarm64static.zip",
        sha256 = "77e00b9b56cecca4c0f614d2453d5862ed9138a420e3e5cfaff49342d34f9f1b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-linuxarm32debug.zip",
        sha256 = "436712d9acc80475b856b2515d28ac6a60232e5cee3354974c7383ee4ab2b48c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-linuxarm64debug.zip",
        sha256 = "78984ee0a0b2aec823117265c496742cd0b4765bb572595e63ea6cf06e293cb1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-linuxx86-64debug.zip",
        sha256 = "fd6c2f5f1953d9f46d423cba88fbdbc81023b4d96b7ad16cc758cd97d9e57ad1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-osxuniversaldebug.zip",
        sha256 = "98c75c8f68ae58942dfed0a17eb94f0aa080049c35f5fc2652574a73ade86f55",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-windowsx86-64debug.zip",
        sha256 = "658ff31f1e909cdacf9a8b8bf46645760df8d99aa848307a16a6927b7d6ffe42",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-windowsarm64debug.zip",
        sha256 = "0b6e87bf9a22913ffa32c828535970f5477459bb990322f440b01aea8ab2f771",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-linuxarm32staticdebug.zip",
        sha256 = "bb352001e65675358b37f4bbf0ad30b7f6cff60967194a63585461a624d206a5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-linuxarm64staticdebug.zip",
        sha256 = "b282450bfbf8a49d07f0a2433128abe95f1f1907193f40815daa0de23b28cc7d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-linuxx86-64staticdebug.zip",
        sha256 = "495992d664bd90d8f4f60617bd9ff9bdd7aa2d3619404948320f1a927f0f3396",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-osxuniversalstaticdebug.zip",
        sha256 = "d7cdee484cbd9d74e3ef226d9dd4d46dc48f5f1af8c07dfec49762bf67a9669d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-windowsx86-64staticdebug.zip",
        sha256 = "ef5ea3462723b73c85d0004e4cc0eb113ff6f2563a856d7631173faefeed841b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-windowsarm64staticdebug.zip",
        sha256 = "9ddd89b1a6bf40c71c5ba38268b71af97c2b0a5749ed27b64d2b8f2297888c47",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-linuxathena.zip",
        sha256 = "4bb18ff311f2e685d674f37b10b060fe2e3b401f8d44548e6d2f8732ac28990f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-linuxathenastatic.zip",
        sha256 = "9dd89162c27b951262f20e7d8214a0c86ba0ed06d7fe0b54f98a8f1a8fba4679",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-linuxathenadebug.zip",
        sha256 = "3e5ccd586aed3925945edc8c30946120be8c55a752ca5a7e3b0262a2f92330b0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.2/cscore-cpp-2026.2.2-linuxathenastaticdebug.zip",
        sha256 = "73e3c0f009dc66ade74495d32d692ece79d2a0d678540ee7117bd084e9b74885",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-headers.zip",
        sha256 = "7d965c86e1f8c1089ca735268e390bf6776f5e224e947e0a48f13de9130082da",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-sources.zip",
        sha256 = "31bcb917be452b972430f91968239a5a24d259ac860eca43522dc4a707cd6fbf",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-linuxarm32.zip",
        sha256 = "458bd30c7ff281b1198bd424374b9033071518730da1afa4b6075012d4c0f590",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-linuxarm64.zip",
        sha256 = "8c5fab20ce8f427e0cf332e78823bf5190c48d821401b32052267e5b55569af9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-linuxx86-64.zip",
        sha256 = "e379ed208f8ecc5b47aff0cd0470fd12d13b69ec5554fcc4c6683e6475c31b21",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-osxuniversal.zip",
        sha256 = "4c6a946c1e89747505cb0736964b1a6ecb672c268de3888e1de6f9ee380c3ad0",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-windowsx86-64.zip",
        sha256 = "5d25b13216b72e84eba12e60dddf2eacb0f568e748c1599af60d5710e0f7c749",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-windowsarm64.zip",
        sha256 = "7515567bde2f6a0a83ea07e9c2a4af0c1c322e9f3dbee14761a1fc9eb6a161cd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-linuxarm32static.zip",
        sha256 = "5190cf22f01453b0fed10e3b6281401dd4837dde3fbd9efaa75027c9943689b2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-linuxarm64static.zip",
        sha256 = "f721109b1ff75ce5fecc3029174c36c8b254d984ca5ed16f0a5343bf2b026c85",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-linuxx86-64static.zip",
        sha256 = "375d3dc1d25f3dcad5382271c9d8c0d3a528257f946a39297c79a5c283ffb688",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-osxuniversalstatic.zip",
        sha256 = "8bb88afbcd069acac403775c6ed9877ab996c346d3f1e315de5419f872fd5d8a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-windowsx86-64static.zip",
        sha256 = "a1c22cfed4d7c7b8899b9a6309fa11ceadc3bf6e91a5850d0e07adcc9d58687a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-windowsarm64static.zip",
        sha256 = "3c6b516d11add07e7dcd1f8a75b683a59ed4c800121d79a9ee96c346dfcf106f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-linuxarm32debug.zip",
        sha256 = "17e7ff08943084e7f30cda6e5750347aca6c6d4a6b4df10da7452a78375f955b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-linuxarm64debug.zip",
        sha256 = "1ad588d66cba3db2deba34d9a9654229b61bcc6531c50e85fdee7b26e4d36c86",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-linuxx86-64debug.zip",
        sha256 = "a312415608ae4abf4b1a8d4b588adc848c551570df90d8ff1f985c401d083267",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-osxuniversaldebug.zip",
        sha256 = "eeaf63fb3fc5237478e8c7f98026964aaee244d77cdac4730a590054ed17ea8c",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-windowsx86-64debug.zip",
        sha256 = "86ca2a55d8048c91af985129e50737ae3f69e75995624da30a92e5533639494b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-windowsarm64debug.zip",
        sha256 = "d646327f10ac8643e804f378c724b30142a5921a771903ffccdd0378c362128e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-linuxarm32staticdebug.zip",
        sha256 = "9e2ac965311b71be9c5d9f4c2053843760fd99ee560bd068be64a841943847d6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-linuxarm64staticdebug.zip",
        sha256 = "af701af33121f81bdb22681c88db4fea06770dbb1903e55bfb5c6cd438e564fe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-linuxx86-64staticdebug.zip",
        sha256 = "18027c50fd1097965b164e38f59a1d8fe665207e7468d910a93bdfcea9b7b9ac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-osxuniversalstaticdebug.zip",
        sha256 = "f8251ac698c03948de3182e2a4df3c2faa60e2e516a42c157e57cf2377f144c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-windowsx86-64staticdebug.zip",
        sha256 = "3714f24053208533cd76d53c9659939765cff8874c4b8d74fee10b7fed4e33e0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-windowsarm64staticdebug.zip",
        sha256 = "d2401deb2f2a4703cb7491a1f63b5f33ba22d5531581e80a24e332ab8e3c7614",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-linuxathena.zip",
        sha256 = "871731b9a7b8b266d2ef91f6e989cde926f1be53bd94cd0d9e260ce65e0c1890",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-linuxathenastatic.zip",
        sha256 = "3218bfedbc4cfde62a0abca469d4eac72475f113dafeb20b80c276cecd9e6182",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-linuxathenadebug.zip",
        sha256 = "3555bf6eb2d87a8aa3bfaab4b080737382e07fe0d787a291909137b485154050",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.2/cameraserver-cpp-2026.2.2-linuxathenastaticdebug.zip",
        sha256 = "4a78bca0c5300f9502d9eabbcfd48b838ad5aabcf3406f723154e70136ff1c66",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-headers.zip",
        sha256 = "e4a1dd9c6240be7f0574d32cf836e4d6e3f1e5ad35de26f3f9eee423d04a92ba",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-sources.zip",
        sha256 = "601edccc917093eb1976d936cb8b533fc058eb13599c6837b7e04d54af469ceb",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-linuxarm32.zip",
        sha256 = "93ce32fa5263919da25f1b1f6b9ae9b4b488bb92d8960e8dc16d0546fd21c3ae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-linuxarm64.zip",
        sha256 = "4ad77c191eb162d9c5d4df562e6b746c4bdd86a89c01f0ea16ce2d0d7e990223",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-linuxx86-64.zip",
        sha256 = "d67f572ae2c73c95f61a2fb8166b96b911b2d5e118a11c7e245c6a0b8ee6ec71",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-osxuniversal.zip",
        sha256 = "8a71a84311fcaa320105a8c1f5879637027987c4571016acdccde0a6ff620eec",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-windowsx86-64.zip",
        sha256 = "74975dd0e099aacc7961149ba3f939ddd4cc3a1acc9c4e078d105a8ac4972ed3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-windowsarm64.zip",
        sha256 = "5a283c365d9cf568818a241f7be30693f65e97f9fb2ff355ea317cddedc5eb09",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-linuxarm32static.zip",
        sha256 = "8c3461a35ec1ebc84cae1af48d47fe4dceba1c24c195cb58b545261403208a69",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-linuxarm64static.zip",
        sha256 = "405be3516960b5c2934d36e275a30e2bfe1b169897efdc8aa028d63fa632ea1e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-linuxx86-64static.zip",
        sha256 = "7fd1fac24fa8e32ca3f192b2fa452a61ab18bf750663413ca81d5a9e259f8c2b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-osxuniversalstatic.zip",
        sha256 = "6a597fe229926bdd4482093f47e7913fc59dee50551d0acb82ad95855a1d3f16",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-windowsx86-64static.zip",
        sha256 = "a1f74df680dce4c04dec52098787228afbdbb0aebb08bc4a0ba167a30dbb6c01",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-windowsarm64static.zip",
        sha256 = "4fc3a9e99e3a33625dad4dce97eaca3bf1b5049fcab11aee5b1af42e3819defd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-linuxarm32debug.zip",
        sha256 = "0d106acdbc25dcf89b2df168ba44a9f679e16f36dc54d3454ef64cb4fcdc8944",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-linuxarm64debug.zip",
        sha256 = "1049b50d3a515ffc02c1c7e8365b01adc067e750d3cc1372e3d006ffd508e96d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-linuxx86-64debug.zip",
        sha256 = "8b9652980b783f648df2edcb59c362ca093c27ffef5467a6511f36aa4115e2de",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-osxuniversaldebug.zip",
        sha256 = "16117e62a89aab72567888ce085d33eb2240c878252dd639f0c9e3104c4fa8cc",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-windowsx86-64debug.zip",
        sha256 = "b746d5924dab8125596b565ddfcd191009a00b3cf0942fae6e6020f663446b6c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-windowsarm64debug.zip",
        sha256 = "d961257a6bf0d34e472a0215695d38c8572d38c2e00a077969c21d18b2e36a47",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-linuxarm32staticdebug.zip",
        sha256 = "e69956d206a1fe4d98b0721392d8376b6f1edaf80eec559c931defea049cec38",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-linuxarm64staticdebug.zip",
        sha256 = "c2ee596756882b6649b94ecc7b37b0a1f514969d8bdfb1c84d9c6cb48a08cd48",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-linuxx86-64staticdebug.zip",
        sha256 = "df301e9f23acfdc3a3a892b8692f0c0fd48ca22e3610d2dad2c2e52edb225045",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-osxuniversalstaticdebug.zip",
        sha256 = "7818cc71c214ff92928b672dbb664ba628adb4801f145d1506fbb25ce2c8e103",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-windowsx86-64staticdebug.zip",
        sha256 = "f438b5d1f0aa150b2d2dc56fd0fe70b82f31755020ff2bdf04b5f13a5844bd04",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-windowsarm64staticdebug.zip",
        sha256 = "d6b9ea3cfb9ba75a267add4122653670c468c1f829ce20eb099db75652f01d34",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-linuxathena.zip",
        sha256 = "d67df39a98ea66572e984f99fc91eb30ee4241b5e804ab9714faee20a5340ebd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-linuxathenastatic.zip",
        sha256 = "054ae054d935ba3b30b7cdd37caab323872f0e12d482f0bee059e6ce8a54df0e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-linuxathenadebug.zip",
        sha256 = "a5206518cdeb15c0310c78d9e8b0e07c9e6e7eb6ea9d5a964586f948558eee55",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.2/wpilibc-cpp-2026.2.2-linuxathenastaticdebug.zip",
        sha256 = "842b4e3e54c8fd58a5d940c71a7601fe8e4beddf66516df00a802ad9f4128a16",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-headers.zip",
        sha256 = "b71c94e6b9a559cf4faa300ecf5dd2687921eb04e8d5ca5777d86e5944c92d5b",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-sources.zip",
        sha256 = "1201445fc0bb59243fb12b8aebed898812d6512211124dbe6d8abd66bf6b7133",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-linuxarm32.zip",
        sha256 = "63785d34b0f8c0c67dd091b6a082d5e27ada9f35562dd84105e4cceb32d831a7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-linuxarm64.zip",
        sha256 = "a5bfb05e8e5ff247c9d7686acd1c3388d59c701ac9b6551d2661a9fb9e528227",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-linuxx86-64.zip",
        sha256 = "1dd3bab69542ccf199ce330b4d841af8d90c98793e10c87902d1e0e527f1a0ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-osxuniversal.zip",
        sha256 = "9ad119246ad4ad2d9207ceb5b501cb47f1b36a7c15bcb6f0a853e991883181c5",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-windowsx86-64.zip",
        sha256 = "957d274d52c82afc4ff16dae178b641ca55c377dac7fd58f4a2a16ee6753748c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-windowsarm64.zip",
        sha256 = "7f89c8ab574c0b11dbed284676a8b9af2cc432d4c6474bec23da07f5074c9609",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-linuxarm32static.zip",
        sha256 = "e3e5e7d4dcf7444a263967c53b32e8a13b72ad16e051b4b97bdcd41802e36648",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-linuxarm64static.zip",
        sha256 = "6b794ff7b68c0b8b2b94cb6dc6e705f5c3c622dadaeab75b832ce0eacef9900c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-linuxx86-64static.zip",
        sha256 = "eeb868ebe6822e5a9735f44020c316da64f5c6ce8dd2fb3359adc78928c10e0b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-osxuniversalstatic.zip",
        sha256 = "497b480e41865a3e0648020f84eb02c97a2c8815bc576d5a172b828a0f25d467",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-windowsx86-64static.zip",
        sha256 = "1c59e87f08c1bf3cca2facd67ea61fc226d921bac5820c1ea848e8fc622d1c6e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-windowsarm64static.zip",
        sha256 = "197f698b31b2e353f01b8604354c76c47fd9745646c3720f1f0709aed3488baf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-linuxarm32debug.zip",
        sha256 = "e8ae2dd3a0522598037533b4abe8945009eeb25cdf1480356eaa2e2d5f9aabc6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-linuxarm64debug.zip",
        sha256 = "c00b5def64936d3aace566302cd156034fca673fefd47d625f06fc5fa2825bcc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-linuxx86-64debug.zip",
        sha256 = "c9a5d470a578326128eaba398943a0e833963f7097bfffba8882fb953fccc967",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-osxuniversaldebug.zip",
        sha256 = "9b8dd5abd16e5a6085b58c9ba25bdfe855c0757a3326c670a526098f1ce16d91",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-windowsx86-64debug.zip",
        sha256 = "12b509d11ab32c8769851982f9b58d3720fc0b73e3cf4cac0f070af8c7b9b3d3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-windowsarm64debug.zip",
        sha256 = "7be83918acacc9973da37b16fbcd98bd0c4e6f3dcc1798c7c7a2dde4194434f8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-linuxarm32staticdebug.zip",
        sha256 = "5455609009127909cdd0b651df71e93218004529cebe1692278158556085d4bc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-linuxarm64staticdebug.zip",
        sha256 = "6b408a6dd466a23ddff0fc83707aa48081ee6f2a8052234b6eb4a130135b2ea3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-linuxx86-64staticdebug.zip",
        sha256 = "8e0ff9c7ae8b6a22ca723dec68c2a9b3ff18c5b1630dd858d2bff5e54a3f7dda",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-osxuniversalstaticdebug.zip",
        sha256 = "ad68ff23a081d579878947402741f5a8cbcc23c9c2bb220c4f350f1fa3954286",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-windowsx86-64staticdebug.zip",
        sha256 = "0e9820e7ed8028e22f77de8ad4e4629044976920943fca44ef62b3398e77c6ad",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-windowsarm64staticdebug.zip",
        sha256 = "b9b7e47a0c18f403434bac5585d4f61ef3e5310f577b537d01cfd87d5c58c4e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-linuxathena.zip",
        sha256 = "d373358f22535cdf40dc607ffa0f356bfcae7aaba1b4d396f4e07147fad29ec0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-linuxathenastatic.zip",
        sha256 = "cc85e049117f4102082abbadb60dfabcf12ee31e6657c4153126fcb9f910248e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-linuxathenadebug.zip",
        sha256 = "05090a7cc6b2f3f0d019a5c6e6951964a8b1b6a5c32085d1858e078c21c62ee7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.2/wpilibNewCommands-cpp-2026.2.2-linuxathenastaticdebug.zip",
        sha256 = "836c6ca45adc9d42c394d754a4b7833873a879a7a6095d1defb9683b0bd7ab30",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-headers.zip",
        sha256 = "992c6523d67ad5b403e5272aeae20e3a5950d1e64bb2087e6d39859af328bcc6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-sources.zip",
        sha256 = "2ca2a1d88836c7f88222b4655f0842f3584d3095faef2b5e47b98031c4e3e190",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-linuxarm32.zip",
        sha256 = "a4603988d49cf147f9a92ba8d19ddbd80c3b11ba4ac6a84eb578ee3c85d8a705",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-linuxarm64.zip",
        sha256 = "44e21b83ddaf975522170f2aef8cd1dd8fe1c1db6c1b2c52b037b89a3d07777d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-linuxx86-64.zip",
        sha256 = "f5d00472ef08e2bf10f995e56b209ddfeaa0b7aaa4afd0bee1b875fc51d3b5a5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-osxuniversal.zip",
        sha256 = "4b15fe32339d1e0cf5bf42b05dd98f46ac9a904db5e69f0c46e3b6d7f360b222",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-windowsx86-64.zip",
        sha256 = "2b9682f26d7b93d0f3ca568072243c53ad6433df78c00ee2308efb6273e9f2c5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-windowsarm64.zip",
        sha256 = "ea8fea8b3452e3f78989a9d56973d7f773bd39c012faaec86d9306543d201f32",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-linuxarm32static.zip",
        sha256 = "1390468aac06a5bd2df781190550a7e2994eddc4cabb30fd31230db5a26abc33",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-linuxarm64static.zip",
        sha256 = "3e709c3db9c0b39c0f346beb8f7712c7bf9965c65cd688e956eaf4734d24dc2b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-linuxx86-64static.zip",
        sha256 = "11a68e179619f520eb5e8ccf6a35f7337627bc5c1dd78e670ef24983009c0beb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-osxuniversalstatic.zip",
        sha256 = "9ceeb49ec56ef220e73c979e0841e114799c72c8d8ce9ec26f1ceaaa73ea33db",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-windowsx86-64static.zip",
        sha256 = "cd887cddadf04c4c38c865528167f521319ffb64c656a67c913956ae0dc2bbb4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-windowsarm64static.zip",
        sha256 = "3fbc2c8db595f04992b64fa733bcbbaa6857eea483da084fead0c9cd8c96fb39",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-linuxarm32debug.zip",
        sha256 = "d5f2a2156cebff824b4a528ad33f0eb5af57f9365868b959d1af4b82847f5298",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-linuxarm64debug.zip",
        sha256 = "d33b579293ac04671b9747877d16b6fa2e9588f978193eef0bbe99ec009dc3b1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-linuxx86-64debug.zip",
        sha256 = "a854108aa61244b4a84c780b9312d23a09ad4b426c8c1eb0f2d8a2e55f7c23f0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-osxuniversaldebug.zip",
        sha256 = "85a6936d0cc3258406bea896098c410b32c697b5d83dd594e407119e385d144b",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-windowsx86-64debug.zip",
        sha256 = "09baf9c9dbc17af61a0c0944f1f74fab4b5696e1894cd027d755bfb2ac720e94",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-windowsarm64debug.zip",
        sha256 = "0486013aa72ddd0162f40c08c37708e6643de3077e6314c51d318bbe0df429a2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-linuxarm32staticdebug.zip",
        sha256 = "6d233c5855d3c85855779d053e39f97832779e86a91420599db3f3de6acfc55e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-linuxarm64staticdebug.zip",
        sha256 = "f18f99797342f6b28e701c69b07954e77e2d061fa0bf69c3483a43ca418ab299",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-linuxx86-64staticdebug.zip",
        sha256 = "017f336b79c9991c4d42fc52c161cebf38f1d2cbe78bc2cf6a56fe3d917b2b55",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-osxuniversalstaticdebug.zip",
        sha256 = "957899f09862c8e601e14695c49a1221aaac3e8811fd13947d92cb07ba3983ea",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-windowsx86-64staticdebug.zip",
        sha256 = "8511d3aedefb8df61a16a56cf0872ee559fef52066ed45edc4155c3539b1d749",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-windowsarm64staticdebug.zip",
        sha256 = "609e994710484f40a7c7bac709a3194c9885e5cabc7a92026e846c3ff98f4bf5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-linuxathena.zip",
        sha256 = "41cbf6f97f3bdd0f15fd1565317fcf1e850709db2a48a7c781030ea1814eb2a7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-linuxathenastatic.zip",
        sha256 = "ba43a8ca4a38b91e1ed07e0861b88324aeaaafbd477957a531c0a31fae8e2f3e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-linuxathenadebug.zip",
        sha256 = "207f4a7c67b49b098e52ea564a25495ee43ce258c58e27355c08dea30a9b571d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.2/romiVendordep-cpp-2026.2.2-linuxathenastaticdebug.zip",
        sha256 = "480bcc40bbdb519bf702bfba5babe18cd4b3507c94c11d89823d63c1cddb9df3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-headers.zip",
        sha256 = "9eeecc832ab52053aed949fe1755d426d8cb6a8afdab41e7b95fe90a6e9462c4",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-sources.zip",
        sha256 = "e886b69beb586829a6a8dbc3a935f33bf1fe4b5f6fb0743dd803531060fda54e",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-linuxarm32.zip",
        sha256 = "628015f4c6c8a254f05d4e8246e331d0201529b54c025bcd542a3acec0e85c7e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-linuxarm64.zip",
        sha256 = "f82cecaeb89e4ec0aa465531b7099244265da9ec166cf6b0572d0f9ff8dd3eec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-linuxx86-64.zip",
        sha256 = "1f397af0bc9bc0ec02e1b57a0f96772cde3ef61b381e7f1841587caa6c77fd4a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-osxuniversal.zip",
        sha256 = "fb1c29e563f1d30cce2146a1c230747c50f9d1e40df9f2cc89a8b2530f5cae8b",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-windowsx86-64.zip",
        sha256 = "3dde8958af1c69745989c367601e990d910413877cc0c69c5e02ddbd867268ea",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-windowsarm64.zip",
        sha256 = "7d52828cac1b5853b247a69fb07cd14b5f0001f25364002fee6cd4abc615b92c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-linuxarm32static.zip",
        sha256 = "2d03b3352499305fb051fd69b5ecad53968c833d0d744470d3ae4e82a429ac82",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-linuxarm64static.zip",
        sha256 = "993b528f9be34e47d37bb09537f85f6e580530132ee3981291ce4fc23b69f773",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-linuxx86-64static.zip",
        sha256 = "7af565d48e83adc3b337a8b0b188264b8e894bfd05bd53190f4eb11b0b7021e9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-osxuniversalstatic.zip",
        sha256 = "f47aa6abb6f3a3f971c3c5172b4ffcd3350e19cac35e67e4d4788623a74f37b5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-windowsx86-64static.zip",
        sha256 = "832ee9c44aac39de6e568e7f4847793d4ec4ac6effcd621382db196988bc0ffd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-windowsarm64static.zip",
        sha256 = "590cc5c53ad8ef0d3e5efc05d4f72b3e04a9d5a8a7bade0e9b4d3b98e1323bd3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-linuxarm32debug.zip",
        sha256 = "45cdc84fc8224dee988b38dab5c40d3baaa8bb937c49f08c0f64f235326c7104",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-linuxarm64debug.zip",
        sha256 = "b383b5c79ef02414e8d44f95c8fc492137fa67318533ff2e6a2ae408b7afc03d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-linuxx86-64debug.zip",
        sha256 = "f258986648a57e890634ea6c09125329ef9b3b9a8a5274645ccc653265326e6b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-osxuniversaldebug.zip",
        sha256 = "903a8515fd35649d9c339a5ae61c39713f14174e4c7a4c50e6c50e08f80d367e",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-windowsx86-64debug.zip",
        sha256 = "618b723339186d1fd17a6cb331ebbacb4e51cbce8ddcd4a1ab83eb767a77586c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-windowsarm64debug.zip",
        sha256 = "45bb31d8cc3dcbdf169642add76d77372241efd264f36d3d3d4eb6ebc9492f17",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-linuxarm32staticdebug.zip",
        sha256 = "1d4c54b7ffe6c08e938ea5feeb4d82021363ad331f934efc712b54e8ec1af664",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-linuxarm64staticdebug.zip",
        sha256 = "603110dc7fe712f1f8f237127ed20c13cc3cc596c451575df6ff80be9d0623f3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-linuxx86-64staticdebug.zip",
        sha256 = "7e1bffc53c20f04ea03a393ab80b8503d45e639ce4c3be68bc6c95d447a142d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-osxuniversalstaticdebug.zip",
        sha256 = "f7d26793e59de3f5600a5887b1226226906faa78323884dfa2cf0cd128bb822c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-windowsx86-64staticdebug.zip",
        sha256 = "b04b35420f87083c04419b8143ce5484c7e673201d810b906927cf0b7ba54b11",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-windowsarm64staticdebug.zip",
        sha256 = "64cc916890af37244c2e5a0c8b647616db5e0079c6f61e66f35fb913a695f57d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-linuxathena.zip",
        sha256 = "b273fdc83d85c88bc80950d74a9a30b560ca2a69c67aa4cb9cfd37dac776fc18",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-linuxathenastatic.zip",
        sha256 = "8e0e186423255e3218909328737830eeb5b7e481cee92195ee7dbc5b5e73538f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-linuxathenadebug.zip",
        sha256 = "6614a2be172df082b748a1f4696d43e7c6766a224f2c7e480e54792d837dffb5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.2/xrpVendordep-cpp-2026.2.2-linuxathenastaticdebug.zip",
        sha256 = "33d5706fe20001fd84067b31a6404bd9d7f59345abac5cdb37c86364f2185297",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.2/halsim_ds_socket-2026.2.2-headers.zip",
        sha256 = "020f568d719f0402e98c68d2868e129e68b5c94b5aab34444422986d470d6e1f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.2/halsim_ds_socket-2026.2.2-sources.zip",
        sha256 = "f6f3427b4b0451f53c73a0667666db40bfd6f4494e528b0ec9bfa6d3d1bea164",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.2/halsim_ds_socket-2026.2.2-linuxarm32.zip",
        sha256 = "c3b6fce0cab268eba761b9a4d09dfefc4212aa15006fba001ae99d898d76ece0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.2/halsim_ds_socket-2026.2.2-linuxarm64.zip",
        sha256 = "2ae321b6c3c4f5355f2e5846e4e7af38727f839378f73d5af321329fbd425a9f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.2/halsim_ds_socket-2026.2.2-linuxx86-64.zip",
        sha256 = "d0a357c09e12cf3665cc767d5023247936fc82e994648ccd9df80a0619de5af3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.2/halsim_ds_socket-2026.2.2-osxuniversal.zip",
        sha256 = "edf79d9f7b26b6cfbfd48a17d95a90f49f0f7a386052333829cb404761c31554",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.2/halsim_ds_socket-2026.2.2-windowsx86-64.zip",
        sha256 = "571789ee76dbed9d038df1abcea7d1d85373c5ed34119897860158c03bad679e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.2/halsim_ds_socket-2026.2.2-windowsarm64.zip",
        sha256 = "f4b0eb57aa623ed6c605945a47a056fdf53f28ac4db3ff5d6fc252bf84fd07ad",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.2/halsim_ds_socket-2026.2.2-linuxarm32static.zip",
        sha256 = "e50f442178d2ac5d6bb44203447e0ce8d0348221b8595cc1f1b2da6fceabd497",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.2/halsim_ds_socket-2026.2.2-linuxarm64static.zip",
        sha256 = "2185a4265cf421961c7c525ce559247129b4a12214c698b0f81cee362421ba7f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.2/halsim_ds_socket-2026.2.2-linuxx86-64static.zip",
        sha256 = "14665806187bea0104dc4bb95116995e3bfc2e09ba5d5b57ed3765fae0935922",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.2/halsim_ds_socket-2026.2.2-osxuniversalstatic.zip",
        sha256 = "aa5595b60e36733110e622da236a93bbd8390225dd6b0c1f5ba9ce6c74337a0a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.2/halsim_ds_socket-2026.2.2-windowsx86-64static.zip",
        sha256 = "eca6d248c4a746ac2c23963f191698c4abbfa0deaa45ba24d96ba56e281d165d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.2/halsim_ds_socket-2026.2.2-windowsarm64static.zip",
        sha256 = "d687a38955037a7b65914b621cfc9958b2f09ef604dfaf73d6f931b36d380063",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.2/halsim_ds_socket-2026.2.2-linuxarm32debug.zip",
        sha256 = "50995ced371698f5634c2858fc8c8d26f6db26af61470198076ac61e6bf62d4f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.2/halsim_ds_socket-2026.2.2-linuxarm64debug.zip",
        sha256 = "f42b03da1adb962b1788dac8115c076389eac6f2b53560df74a75b530f1de6ae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.2/halsim_ds_socket-2026.2.2-linuxx86-64debug.zip",
        sha256 = "96029ed4156566700fa8a4840a08bcf0c43d0e83f878f9c981b01c955d75bb9c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.2/halsim_ds_socket-2026.2.2-osxuniversaldebug.zip",
        sha256 = "f42b1e0270f04c24248afca0fbb693c8604278ba65541597045b20eaf7a7e803",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.2/halsim_ds_socket-2026.2.2-windowsx86-64debug.zip",
        sha256 = "ff73d15db21e154b905148669b1b44b36da84d9d64a755e8c1f5fc98c8f06fda",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.2/halsim_ds_socket-2026.2.2-windowsarm64debug.zip",
        sha256 = "09000ccb0a364b0e3cef94c15a12fe9c0508c45f92b37fdde296f0d21c8edfca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.2/halsim_ds_socket-2026.2.2-linuxarm32staticdebug.zip",
        sha256 = "4e9f46bf263ed38dcea44abe3d626092ff0061fc6299f5064efea9b5e575878d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.2/halsim_ds_socket-2026.2.2-linuxarm64staticdebug.zip",
        sha256 = "f71abe43b2e4b05b5508cba5709fb372c3980e2ae55e361681e7ee0a93ddb4b5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.2/halsim_ds_socket-2026.2.2-linuxx86-64staticdebug.zip",
        sha256 = "d7b56618e7e348bdc1109bf83b39089f6eba7f09f3d237a66dcbd79bcdccf95a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.2/halsim_ds_socket-2026.2.2-osxuniversalstaticdebug.zip",
        sha256 = "a62a2bcb54b4f5e7bd0b76898e791a7a61b8a5683a4771e7ac4d484308e6b6d9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.2/halsim_ds_socket-2026.2.2-windowsx86-64staticdebug.zip",
        sha256 = "f36a100f781764d1f7bd4a211b0736ab9d1063e340b276f45019fb1801d0d2dc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.2/halsim_ds_socket-2026.2.2-windowsarm64staticdebug.zip",
        sha256 = "e5231c8f05f6c2a0d068006362ae64fa868ac9bb52cfe73ea6bac323bec0de9d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.2/halsim_gui-2026.2.2-headers.zip",
        sha256 = "fd1319be5411c48a7377058c0a8d839ac90ae871ec8e164c712d75c7710f43f9",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.2/halsim_gui-2026.2.2-sources.zip",
        sha256 = "cd1b68d7a1a51031ef59e4c5c63fdfadae8f0dedb5e2d0df8edfc97da204dce4",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.2/halsim_gui-2026.2.2-linuxarm32.zip",
        sha256 = "b16d4c70d9be7545df0be3524e7aad0b2cac9ad304b36a00a4d5e0b117ee1207",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.2/halsim_gui-2026.2.2-linuxarm64.zip",
        sha256 = "989bed8c966177c7fba5c1dda65ac1b131d5a4b6daa7bf1fdf86bf513d131cf3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.2/halsim_gui-2026.2.2-linuxx86-64.zip",
        sha256 = "84703f4111ac643cc2f9d8aecbe360c479c2eed416dcd5ac1cdc8421c3a87760",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.2/halsim_gui-2026.2.2-osxuniversal.zip",
        sha256 = "a8ad8dcbdf2d3400d571995972df012a72f9b58143ff1ca88b3ec202992b9daf",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.2/halsim_gui-2026.2.2-windowsx86-64.zip",
        sha256 = "8e03b5445a36b09a9defbf1d4aec5e06f941b6dd88fc136036dd0b68a150c81f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.2/halsim_gui-2026.2.2-windowsarm64.zip",
        sha256 = "57e142b4f65c246b9ff1fe187dc1cece1658c34ddda131c606b8715729390366",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.2/halsim_gui-2026.2.2-linuxarm32static.zip",
        sha256 = "0267271ce4bcd02e656f09296283f85fad54cadcd9934e1cab19fe3beef3da94",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.2/halsim_gui-2026.2.2-linuxarm64static.zip",
        sha256 = "21d584db7cbbd871329b66716c69fcd53d1d48ad02305c8029c9350ea819b22b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.2/halsim_gui-2026.2.2-linuxx86-64static.zip",
        sha256 = "a9ee7b1070e7ac66b9aa5f20b0f5aea305855fc22638bfcb7ea4c772b12cd272",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.2/halsim_gui-2026.2.2-osxuniversalstatic.zip",
        sha256 = "49cec79f32f661fd5ed650713db77646f5a4fa576141ad9d70a276f4054143b5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.2/halsim_gui-2026.2.2-windowsx86-64static.zip",
        sha256 = "6b1792d42bee146fd7ecc33d4c16c2ffe1d6004b31da430b45a42bb1d40b7d19",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.2/halsim_gui-2026.2.2-windowsarm64static.zip",
        sha256 = "272e91fdd835c751f4f137629e2a8b31353c43baa425c2e80f9a88ef787a68c9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.2/halsim_gui-2026.2.2-linuxarm32debug.zip",
        sha256 = "ef9206939b6d5aaaf415b323be9dc9c770e45e07a164e00a008292fdb0fbd0f6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.2/halsim_gui-2026.2.2-linuxarm64debug.zip",
        sha256 = "992269affe5dae9c29b207656647f7a593b6c2e5cfd7db7e9693ed3861dc1337",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.2/halsim_gui-2026.2.2-linuxx86-64debug.zip",
        sha256 = "eefddf102d7c715a990390a2131d545760f4fbe8ff0c05c24c0584a858159a05",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.2/halsim_gui-2026.2.2-osxuniversaldebug.zip",
        sha256 = "de15beb8cfb8ae9401b1309558034debe90ebebfc383cd01b8d8e6e72edbf62f",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.2/halsim_gui-2026.2.2-windowsx86-64debug.zip",
        sha256 = "713585e2e952ea5dae70b549aba3c6019b1d3b8f5f7f6b6d6efb850322eaf786",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.2/halsim_gui-2026.2.2-windowsarm64debug.zip",
        sha256 = "f4c23b9daf3e7f0d1d208c0ccfc1d5b27e076992d7151d3930c0291386e673ef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.2/halsim_gui-2026.2.2-linuxarm32staticdebug.zip",
        sha256 = "5b0db179e42414f2c9579f8f2fe5e0277f124d7ec6ea66acfd20ec5ffda5a593",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.2/halsim_gui-2026.2.2-linuxarm64staticdebug.zip",
        sha256 = "93e5e26e6f1ae086c4cb320cf01b871a8ce7dd0d696727a03a36d422f448f894",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.2/halsim_gui-2026.2.2-linuxx86-64staticdebug.zip",
        sha256 = "b5d2ee09cb34bf8cf52267d09fc15900683fb731b0452a515d878739f0c8c747",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.2/halsim_gui-2026.2.2-osxuniversalstaticdebug.zip",
        sha256 = "f2db87cf0350053e2ce1cab664bb596f72837c7bb0da06e84c09afc7a3cf1468",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.2/halsim_gui-2026.2.2-windowsx86-64staticdebug.zip",
        sha256 = "3fe695ec8fed9e308cec9e02d84ab0117ef39bd1e5c643f4a583918c0a7e13b5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.2/halsim_gui-2026.2.2-windowsarm64staticdebug.zip",
        sha256 = "a27a451d0c848c2d9a1792671e633895bb42abb1a38a076a1123139c6f38987c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.2/halsim_ws_client-2026.2.2-headers.zip",
        sha256 = "c7f072d5b1163bad07c6aea817c939eefd5caf697699790932ed456ffd2f3a88",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.2/halsim_ws_client-2026.2.2-sources.zip",
        sha256 = "e8fd32aedc3239e9a858af3e86d705a4632800b2956d52b126b531f78a97ffa4",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.2/halsim_ws_client-2026.2.2-linuxarm32.zip",
        sha256 = "7a0d657b005a930ed5db291e45a83bfdb18da64afe6372528a70657bd1933b0a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.2/halsim_ws_client-2026.2.2-linuxarm64.zip",
        sha256 = "b76f26d0e65a6eeb483132f8f8f81cab92d4b8b1e12e95b034e169f3a5abe0e2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.2/halsim_ws_client-2026.2.2-linuxx86-64.zip",
        sha256 = "a1db2e7fbd1aacfb16e399b3f0a06db314eac74c142a84379ad48fa6386a20b1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.2/halsim_ws_client-2026.2.2-osxuniversal.zip",
        sha256 = "2bc7bab3a5ebf9cd598ebac47e53c0b6eccda26ff89cda205be3e2fb54b5268e",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.2/halsim_ws_client-2026.2.2-windowsx86-64.zip",
        sha256 = "c0424ccce1a95aaf6c4e79eae1d65a47a21a5441baef1aa2b25c0f9f02d522ce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.2/halsim_ws_client-2026.2.2-windowsarm64.zip",
        sha256 = "befc095ad21890234fa17924163bcb5f6d5263dbda2fce9bf91a03bef2d455f6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.2/halsim_ws_client-2026.2.2-linuxarm32static.zip",
        sha256 = "83c48cdf3fb3b48510072a249187bbd26b060f67e88c4e0bd64561a8b001133a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.2/halsim_ws_client-2026.2.2-linuxarm64static.zip",
        sha256 = "70660a2382fc125284a597eacf858f6379e283c231e4e3e6b173cad0321a6bf6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.2/halsim_ws_client-2026.2.2-linuxx86-64static.zip",
        sha256 = "b004b616ac8da692f36b508d37608965208e57ad1375bce29d4088804e8ebfbc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.2/halsim_ws_client-2026.2.2-osxuniversalstatic.zip",
        sha256 = "efc7af7be6b0358a04d8aea8f353008432be326265a98e6e51e7dab269c466a2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.2/halsim_ws_client-2026.2.2-windowsx86-64static.zip",
        sha256 = "fe56110162717f4d8238ed918da8e5de208426a30c1d7c3ab03e55f986951afa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.2/halsim_ws_client-2026.2.2-windowsarm64static.zip",
        sha256 = "5d6fb38c51317729ba15d9ce874f3264815c23717a94431adc86624e4e9a6973",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.2/halsim_ws_client-2026.2.2-linuxarm32debug.zip",
        sha256 = "ceb43dc063dacceea13c1b8d988d012340facac40b8abaa0c03ec7ddde76c5df",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.2/halsim_ws_client-2026.2.2-linuxarm64debug.zip",
        sha256 = "d521b57f269692742ee52c0b1842eaf5448e8ae49e82029d788209a53e493875",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.2/halsim_ws_client-2026.2.2-linuxx86-64debug.zip",
        sha256 = "5df7a20499fa7f04e5af76acf54acfaf63d55833e5909487cb06fe7fe618475c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.2/halsim_ws_client-2026.2.2-osxuniversaldebug.zip",
        sha256 = "adf0fd8167456a41dc30c4a379d3073dbd8946e2e2d9b75016876f00f1983113",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.2/halsim_ws_client-2026.2.2-windowsx86-64debug.zip",
        sha256 = "9dba3435374f635b791ac598b0d7b1b40f8511c795c7ec668aa8721616686fb8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.2/halsim_ws_client-2026.2.2-windowsarm64debug.zip",
        sha256 = "5d63f31e97bea1beaac723842fdf4b0c9cba1a126f7dfe37fafeacb79064c670",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.2/halsim_ws_client-2026.2.2-linuxarm32staticdebug.zip",
        sha256 = "8807c84a35397de191b71344b054352b184ec5cbb1a8ae1b336d90c857fcd00f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.2/halsim_ws_client-2026.2.2-linuxarm64staticdebug.zip",
        sha256 = "acefd43f2d2c950418e0bd66fdb7d7eaa1a17bc12416ea107481875299a646f9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.2/halsim_ws_client-2026.2.2-linuxx86-64staticdebug.zip",
        sha256 = "a0a3897b40b403a1a7eec58e2b31d9bc55eefc9263e03f01829c4d8753baae36",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.2/halsim_ws_client-2026.2.2-osxuniversalstaticdebug.zip",
        sha256 = "55a3ce3c8531234cef38c1b4b633723a7acaeef016f2b16e4349267ffc598450",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.2/halsim_ws_client-2026.2.2-windowsx86-64staticdebug.zip",
        sha256 = "5f863a02b87f2211a8b43c1fbcac67e0c74ecb20caae8e9769fb604338589eeb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.2/halsim_ws_client-2026.2.2-windowsarm64staticdebug.zip",
        sha256 = "2a9e550d4c4a554456f64e6b4130b5a41e0fa343230b764ab716e3d533b9a605",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.2/halsim_ws_server-2026.2.2-headers.zip",
        sha256 = "d8d169debaa4c850c2d6b7854984a72de4568721a99ed08ef7f160729dd51ce1",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.2/halsim_ws_server-2026.2.2-sources.zip",
        sha256 = "65109ed6f949d42b646817a2b60923c0246a7d4e98371905c4c684d86149bd95",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.2/halsim_ws_server-2026.2.2-linuxarm32.zip",
        sha256 = "d9a64f2a1ac77932f8cd739602454aac5c84d95f6bf9fb6697ea75816b6de643",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.2/halsim_ws_server-2026.2.2-linuxarm64.zip",
        sha256 = "b91f9ed927f206a4b3225db5e2b8257327505ba19bf178275242c331743fc458",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.2/halsim_ws_server-2026.2.2-linuxx86-64.zip",
        sha256 = "e7848e8ea3c00e1f272279675d75b66316d7e7da6af7f6ff526f149831e886ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.2/halsim_ws_server-2026.2.2-osxuniversal.zip",
        sha256 = "c808edcb6bdc285407b7aa6b16a8e8bcad81fc15cb0daa35559085582f14a7f5",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.2/halsim_ws_server-2026.2.2-windowsx86-64.zip",
        sha256 = "0e0fd8968f0f84eadbb4158e561c4e937a0582085055aab21c3c58e6e7764be2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.2/halsim_ws_server-2026.2.2-windowsarm64.zip",
        sha256 = "08f937bc542cba150d2ac3fb709197601faeb6b9b13798d30f31d6ad29419c90",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.2/halsim_ws_server-2026.2.2-linuxarm32static.zip",
        sha256 = "f4ba25086565786399eb6138c0c35fec9b20bf655b81d69bbffe7011a916f66d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.2/halsim_ws_server-2026.2.2-linuxarm64static.zip",
        sha256 = "7704e044693381e62f101eccb0dfb2a511c5d752fbe173dd74ce7134623a82e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.2/halsim_ws_server-2026.2.2-linuxx86-64static.zip",
        sha256 = "6be15abfcef7ad8cf59f6b20917d3fae5e9dbccc3e4cad3b43e884d828b0f4ab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.2/halsim_ws_server-2026.2.2-osxuniversalstatic.zip",
        sha256 = "ef8dc77eeab70a5f368c283b5f3ae6f2cc24b191bf9e163785bacb5b3b4743f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.2/halsim_ws_server-2026.2.2-windowsx86-64static.zip",
        sha256 = "8709e024e0db23c86a14dbbc33dfeb21756095df4adea58b5e853076fd171dd3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.2/halsim_ws_server-2026.2.2-windowsarm64static.zip",
        sha256 = "1905ab512cf606444ef94132957c92f2deeeebf162365d85dc36bcb65052f683",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.2/halsim_ws_server-2026.2.2-linuxarm32debug.zip",
        sha256 = "5b94e457bdd49c5a1e46a81040c9c582183a1216e8c0550a27d64f1d1af4c740",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.2/halsim_ws_server-2026.2.2-linuxarm64debug.zip",
        sha256 = "df9964149ec1c88820c332aea6e6ebe9bd5fc439131a47cafc29ec6102f99177",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.2/halsim_ws_server-2026.2.2-linuxx86-64debug.zip",
        sha256 = "7ded2b15fa2dc81d7c0cf6a59726bed77f3caa8085a72c0eddda9221b5677231",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.2/halsim_ws_server-2026.2.2-osxuniversaldebug.zip",
        sha256 = "4c99adc69e20caae7badb6b6e6e40603bf575d0fae22ec90da3862b95c19f473",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.2/halsim_ws_server-2026.2.2-windowsx86-64debug.zip",
        sha256 = "e9d04538030c7f515296d7110c75707e85c9d5f515a750a1031d2b4fb852a857",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.2/halsim_ws_server-2026.2.2-windowsarm64debug.zip",
        sha256 = "2a7de365442fbe6c89b7ec8f43c20247597784d7c275f11ffb72ea4d508e7f72",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.2/halsim_ws_server-2026.2.2-linuxarm32staticdebug.zip",
        sha256 = "7c79ba155cc12090b792daa48cc899659448ef63abb4cd9b5f4ff7ee521e840b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.2/halsim_ws_server-2026.2.2-linuxarm64staticdebug.zip",
        sha256 = "04b67f79e61cc6cb526702412dcf2c44e7b2a2308f409933be3a4271b91a37e2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.2/halsim_ws_server-2026.2.2-linuxx86-64staticdebug.zip",
        sha256 = "5c77e36a51f6be521bce156d192d96ad2bf58f283b068497b9f5fa2b4fe5e7cf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.2/halsim_ws_server-2026.2.2-osxuniversalstaticdebug.zip",
        sha256 = "473e075c8ebe21cf307cd79e6d9addd5aebb41772afade50da8072511214f6d6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.2/halsim_ws_server-2026.2.2-windowsx86-64staticdebug.zip",
        sha256 = "bce426424a64029b3f8e689aedb9fea0cd3f397dcd1537587c1dc54005e0b81b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.2/halsim_ws_server-2026.2.2-windowsarm64staticdebug.zip",
        sha256 = "f2b34129101b4e2bd57c9de926070f2b6b97d510876b8a5bbd752dcff3ee4483",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2026.2.2/SmartDashboard-2026.2.2-linuxx64.jar",
        sha256 = "3e082d1fb0b88a3a371d7ef088d8a438e57e266dec891df048686abcc2ad1603",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2026.2.2/SmartDashboard-2026.2.2-macx64.jar",
        sha256 = "383e1079d09f62da4cdd5b12e84eaa0f7a9c926a88d6875b2ad49879c666cb7f",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2026.2.2/SmartDashboard-2026.2.2-winx64.jar",
        sha256 = "7180cfb23ab6a304cfecf7cee2cb0b6af62f86a0f365e66a74d04bfdfbdf6362",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2026.2.2/PathWeaver-2026.2.2-linuxarm32.jar",
        sha256 = "33f4d1c8856576d5696c3bf2094653fab3a14867d2f6eaa8feb4709ed44015c4",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2026.2.2/PathWeaver-2026.2.2-linuxarm64.jar",
        sha256 = "7e1bb5575fea04092c2b2ea98ec239343766027b1e80a1b26b4ce589f924b7a0",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2026.2.2/PathWeaver-2026.2.2-linuxx64.jar",
        sha256 = "9614b8eed9fa790718da8ca0550ca12ef1063a059732ac650e9cad8b1509e870",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2026.2.2/PathWeaver-2026.2.2-macx64.jar",
        sha256 = "ce0496d73ccc4922f673a26d40f00e6c401efd4411cb282daabbffa82bc94fb9",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2026.2.2/PathWeaver-2026.2.2-winx64.jar",
        sha256 = "d0ba1d4775b4276d2c4e4404d7220b2b5695ccca3aa0e06603601cd051541f70",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2026.2.2/RobotBuilder-2026.2.2.jar",
        sha256 = "2136fb095008dcb88926bbb4a990666ebdbf53b6610cd5f075d97bfcff649407",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.2.2/Shuffleboard-2026.2.2-linuxarm32.jar",
        sha256 = "aeefa095e38b4c2f308b5073a4331c21210c0cbfc5c221e4c971915b7e6da104",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.2.2/Shuffleboard-2026.2.2-linuxarm64.jar",
        sha256 = "d40c65a3fcccc7a0eab7bbb6a089ad0afc697d9dd6f57bfa652afd3662b5b599",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.2.2/Shuffleboard-2026.2.2-linuxx64.jar",
        sha256 = "77e23036bca0da16480093f66fa73130dc85905910585b2954d62c74d88a3a64",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.2.2/Shuffleboard-2026.2.2-macarm64.jar",
        sha256 = "7a6792371542f4d1acaa85e271031c64405466db5f96abf918178151ce23324f",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.2.2/Shuffleboard-2026.2.2-macx64.jar",
        sha256 = "fee4b0ae66ef69fbeac27777555f51541c6565623a4633b4fea005d3fc68891a",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.2.2/Shuffleboard-2026.2.2-winx64.jar",
        sha256 = "76c5a936dea71aa5afca16d618903a4e63c36c0e079bed700ae516401e901814",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.2.2/Glass-2026.2.2-linuxarm32.zip",
        sha256 = "c68da7f2ad7390dd5a3cbb475da0c89accb16849d689e7c621e52d56e0c3c8a4",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.2.2/Glass-2026.2.2-linuxarm64.zip",
        sha256 = "838a3f5f295c8c7c129df857aa4f3edcf00493a74e3cebd619aa88aa80047715",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.2.2/Glass-2026.2.2-linuxx86-64.zip",
        sha256 = "a20ea2daa921e4261b2906fb8624c8a02e74d8840442081fb8dc795242f92d2c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.2.2/Glass-2026.2.2-osxuniversal.zip",
        sha256 = "0baa99018a2bb0c1694a1df3c8839033e0544812f28922c3378ea3db557d4d8c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.2.2/Glass-2026.2.2-windowsx86-64.zip",
        sha256 = "cb05bfbd0465d35e5481ac16965b3d1a76674479b9472fc6f9b85ade78fe84c7",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.2.2/Glass-2026.2.2-windowsarm64.zip",
        sha256 = "6b2924dfb54cca3512f9ae08582c9b88b3835db891397753ade2df3fda6bce6d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.2.2/OutlineViewer-2026.2.2-linuxarm32.zip",
        sha256 = "46ca2f6d093d391218903a2169183c92ded42b9832d919e099871127ac808f44",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.2.2/OutlineViewer-2026.2.2-linuxarm64.zip",
        sha256 = "b80052727820d0f5102014f9d765bccd2e156f09c7254502cf4ac212a5c4ac6a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.2.2/OutlineViewer-2026.2.2-linuxx86-64.zip",
        sha256 = "1a54a2e2f449712acffce1ec0e4c2ea96965910d18d32bbcbc0e1d080094cb42",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.2.2/OutlineViewer-2026.2.2-osxuniversal.zip",
        sha256 = "bfbdc911e1cc736fdcb67a74fbddd243aa5a1da170391d602ad13ad8f40475db",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.2.2/OutlineViewer-2026.2.2-windowsx86-64.zip",
        sha256 = "0ee8d3f2d5b6a8f7b4553f44fdb2f0fe7ac37b408b44e43f8b11dea959653eef",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.2.2/OutlineViewer-2026.2.2-windowsarm64.zip",
        sha256 = "ebd3e5fbbc241208c661fc118ad1a08b1b416a7a7f5dcac0b28eeb79170edf41",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.2.2/roboRIOTeamNumberSetter-2026.2.2-linuxarm32.zip",
        sha256 = "de3a66be9a3952d831d1e67d0322117cdd813d2aeca5c295763a5f80467ebbc0",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.2.2/roboRIOTeamNumberSetter-2026.2.2-linuxarm64.zip",
        sha256 = "231ab36a505df32690a8509ee85b1cfbbf235ac9c68a210c2e036e68df97a5ae",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.2.2/roboRIOTeamNumberSetter-2026.2.2-linuxx86-64.zip",
        sha256 = "af4c09578c0e57aac9cbcac6023acf1b2e309d920413a56ce077cc29298d71b8",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.2.2/roboRIOTeamNumberSetter-2026.2.2-osxuniversal.zip",
        sha256 = "041a96cc4a21d1ed15d220b5107b4b22051c1641245395b3c5faf4966f6c9825",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.2.2/roboRIOTeamNumberSetter-2026.2.2-windowsx86-64.zip",
        sha256 = "0e1f16d77842768f124032ed7069328b57a96c03084c92e4e994abceed093e34",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.2.2/roboRIOTeamNumberSetter-2026.2.2-windowsarm64.zip",
        sha256 = "f599f37b2709e3f53657001f826f13491d7ea6697c823a43e7fc9ebc33d42f2b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.2.2/DataLogTool-2026.2.2-linuxarm32.zip",
        sha256 = "fc9fcf2d4ead64762115ccdcee3b33802654afa5311fa690ddbb216ecb3cfd17",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.2.2/DataLogTool-2026.2.2-linuxarm64.zip",
        sha256 = "4ec5104d1f5ca88df695837ae361977367a400d759df4f77c2c64da549d508f8",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.2.2/DataLogTool-2026.2.2-linuxx86-64.zip",
        sha256 = "207632e5df702924a6686fde1db2c39b318f8ab0298907808602dff5c1a41965",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.2.2/DataLogTool-2026.2.2-osxuniversal.zip",
        sha256 = "a44daabe3adf88fb71bd29a367534721e0d742d416496033a8384dd2b5189d3a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.2.2/DataLogTool-2026.2.2-windowsx86-64.zip",
        sha256 = "1e2d30df739bf8ac8029721d3488f83421951111e28180665d2761d6fe511eb9",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.2.2/DataLogTool-2026.2.2-windowsarm64.zip",
        sha256 = "02bb476b7d8a3e403e363a70fd895005fe94be0d13be5001a153f2e005871036",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2026.2.2/SysId-2026.2.2-linuxx86-64.zip",
        sha256 = "074b4afa1e27645feb8cc0b28677b5af96a4ce7026850fcae441cda86b0893a3",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2026.2.2/SysId-2026.2.2-osxuniversal.zip",
        sha256 = "f0855a09e11107f164a6a41267151cf917aa315ef97ee7c8c8f27e1b6b49f42e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2026.2.2/SysId-2026.2.2-windowsx86-64.zip",
        sha256 = "40403c684f072974170f0e8c305809a51372b7860ffe76a2be5f1b2a6dc91706",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2026.2.2/SysId-2026.2.2-windowsarm64.zip",
        sha256 = "d1c1b6bfc0e0d2394d618a2f819ffa7e9fd161b05e6fab8971f702a877ef966e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
