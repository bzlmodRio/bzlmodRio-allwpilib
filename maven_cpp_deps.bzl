load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_jar")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

filegroup_all = """filegroup(
     name = "all",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

cc_library_headers = """cc_library(
    name = "headers",
    hdrs = glob(["**"]),
    includes = ["."],
    visibility = ["//visibility:public"],
)
"""

cc_library_sources = """filegroup(
     name = "sources",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

cc_library_static = """

cc_library(
    name = "static_libs",
    srcs = glob(["**/*.lib", "**/*.a"]),
    visibility = ["//visibility:public"],
)
"""

cc_library_shared = """
JNI_PATTERN=[
    "**/*jni.dll",
    "**/*jni.so*",
    "**/*jni.dylib",
    "**/*_java*.dll",
    "**/lib*_java*.dylib",
    "**/lib*_java*.so",
]

static_srcs = glob([
        "**/*.lib",
        "**/*.a"
    ],
    exclude=["**/*jni.lib"]
)
shared_srcs = glob([
        "**/*.dll",
        "**/*.so*",
        "**/*.dylib",
    ],
    exclude=JNI_PATTERN + ["**/*.so.debug"]
)
shared_jni_srcs = glob(JNI_PATTERN, exclude=["**/*.so.debug"])

filegroup(
    name = "static_libs",
    srcs = static_srcs,
    visibility = ["//visibility:public"],
)

filegroup(
    name = "shared_libs",
    srcs = shared_srcs,
    visibility = ["//visibility:public"],
)

filegroup(
    name = "shared_jni_libs",
    srcs = shared_jni_srcs,
    visibility = ["//visibility:public"],
)
"""

def __setup_bzlmodrio_allwpilib_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.2/wpiutil-cpp-2023.4.2-headers.zip",
        sha256 = "e90c4c5c6ec807a9087f1c1af4b457f482653acbb55da9792eaa5c765b046f19",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.2/wpiutil-cpp-2023.4.2-sources.zip",
        sha256 = "abf84795447ecef8b668609a05e59f14d88ec90d6e86c8a59338a33d1ec8ad0d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.2/wpiutil-cpp-2023.4.2-linuxarm32.zip",
        sha256 = "f39fcded3f03038fc78050d8e877901bc5de5695a9c2ac0e4a2f6b778cb8e99e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.2/wpiutil-cpp-2023.4.2-linuxarm64.zip",
        sha256 = "84a5818b2fbf6f72eba3b72e59267d70ed5a83c9e95b9a01172b825f72788e1f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.2/wpiutil-cpp-2023.4.2-linuxx86-64.zip",
        sha256 = "69a0c7a7d3ff938b411d62fdebf8de01ac6273abae2201ca6729a4c5fa441d03",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.2/wpiutil-cpp-2023.4.2-osxuniversal.zip",
        sha256 = "94631bac9728a5dcdf8f5effaa4f12799f97b697e166290ba65a9519569cd24d",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.2/wpiutil-cpp-2023.4.2-windowsx86-64.zip",
        sha256 = "237d9238561ef76e903d6410ad22bbb8f800611557b71889f3d8c473f1ed83e9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.2/wpiutil-cpp-2023.4.2-linuxarm32static.zip",
        sha256 = "6be16a979d48ee7dbad81f0e1cfbfd506c1aaf6ee69eb2e5f04922d23e702667",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.2/wpiutil-cpp-2023.4.2-linuxarm64static.zip",
        sha256 = "d67703485c508ad56560fdd851af9be7024852a451e8482166d3c03a38e872f0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.2/wpiutil-cpp-2023.4.2-linuxx86-64static.zip",
        sha256 = "ed7ce0a1f67b713b43b0643a771945a0fc3eff179354b23908732f7830094ff2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.2/wpiutil-cpp-2023.4.2-osxuniversalstatic.zip",
        sha256 = "35aed2c71e4d3ae14f27d4792e96cc28d05216def02a6e1eef0e0e348fc14769",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.2/wpiutil-cpp-2023.4.2-windowsx86-64static.zip",
        sha256 = "06626de10051acabc2488e57975512a31f0ad91ef0ea833234b043114ab682f9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.2/wpiutil-cpp-2023.4.2-linuxarm32debug.zip",
        sha256 = "6acde640482f16e981c354bfd2cdd06182608a8a4975e1bd4ced49b47b979dfe",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.2/wpiutil-cpp-2023.4.2-linuxarm64debug.zip",
        sha256 = "ca0896cca7e8789c0dab2ac1c253e5aefbae43c9c89344042064564387e83911",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.2/wpiutil-cpp-2023.4.2-linuxx86-64debug.zip",
        sha256 = "b2e4fccd62fefd61b41cd7c5ba9d2b93663e61d2b242fb081e7caf3eeba4e0d7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.2/wpiutil-cpp-2023.4.2-osxuniversaldebug.zip",
        sha256 = "eadb7c462441b35769cae40a821d116328b934105978a000468470f2ef7ce9b5",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.2/wpiutil-cpp-2023.4.2-windowsx86-64debug.zip",
        sha256 = "69419e8324274bba1146207e11c6fefaaf94d7d8d19f226047d2c5d6c6f99740",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.2/wpiutil-cpp-2023.4.2-linuxarm32staticdebug.zip",
        sha256 = "106b75cadd15892730737200da88471c634c336c4e90f4ad83947f01e211063f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.2/wpiutil-cpp-2023.4.2-linuxarm64staticdebug.zip",
        sha256 = "aeaf1bdda9e8c14c0409d4c300bf2c2810eadf518c0759a1b540bacd29202f4a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.2/wpiutil-cpp-2023.4.2-linuxx86-64staticdebug.zip",
        sha256 = "e7c1940192d2eca5d4f337b2435d37e8d7cea2a99f0d2720f41ae45e17bba757",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.2/wpiutil-cpp-2023.4.2-osxuniversalstaticdebug.zip",
        sha256 = "b086292404a401c84045e0fb7b0f465c8462db53ab153dfa12c6044100f53e1d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.2/wpiutil-cpp-2023.4.2-windowsx86-64staticdebug.zip",
        sha256 = "c29ef0350fde30097c03a9e2c89327830906f9dc62e3ca3ce67075b94fd91ea1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.2/wpiutil-cpp-2023.4.2-linuxathena.zip",
        sha256 = "faacba5b90e7b140f2834093bd888204f8bdbf83139ae736ac194c24d30a9824",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.2/wpiutil-cpp-2023.4.2-linuxathenastatic.zip",
        sha256 = "93eb678a091d6e079c93735fababa11bd35ca8358a2f5731eccb2c1a2d9671b3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.2/wpiutil-cpp-2023.4.2-linuxathenadebug.zip",
        sha256 = "7f4c44a93d218ccc168f78479d126fe806142565d401ec072fc2113e621e8c8a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.2/wpiutil-cpp-2023.4.2-linuxathenastaticdebug.zip",
        sha256 = "7e67bf5edb12adffd605bebbcb10a9478d33c1a7cda1812e2570f5ec454e198c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.2/wpinet-cpp-2023.4.2-headers.zip",
        sha256 = "e150a664cc96f88fdd643b2b45ef438cc090669f147287d1f69fb19a6cf0669e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.2/wpinet-cpp-2023.4.2-sources.zip",
        sha256 = "4cca36cd56215503d8286124a87cd282c0b5c4cd145ebec7a730bd7cf3c81e49",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.2/wpinet-cpp-2023.4.2-linuxarm32.zip",
        sha256 = "4dda067fde3bd187cc0ba0c9f526ae38bdb5403f9d3c78224b7a7fce1c674329",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.2/wpinet-cpp-2023.4.2-linuxarm64.zip",
        sha256 = "17dfdf11c9f667dbc7f79c07768c6f9a3bcd7ee00511ca9f998c4d270dbd1b79",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.2/wpinet-cpp-2023.4.2-linuxx86-64.zip",
        sha256 = "e58fb495d41b520a7524408641e3466c850e9d583e5d679379c931018f844c64",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.2/wpinet-cpp-2023.4.2-osxuniversal.zip",
        sha256 = "f2857e7e6e49bc4806edf9b08d877546b7a34e9270cc772e69484d12520650a9",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.2/wpinet-cpp-2023.4.2-windowsx86-64.zip",
        sha256 = "d040950f2ed7c00817cedcf2e2a9a9edcaff90320345e32a9865b6f52a3b735e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.2/wpinet-cpp-2023.4.2-linuxarm32static.zip",
        sha256 = "db64f1416d0c900a8d56bd2a89b62aa4b547ca7587fde663ca88762ca9c10e4d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.2/wpinet-cpp-2023.4.2-linuxarm64static.zip",
        sha256 = "0c2c89c00d076d74509ed9eaaa52acd96e19901b33c901105aa6181da6ca1e7b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.2/wpinet-cpp-2023.4.2-linuxx86-64static.zip",
        sha256 = "3e4ab94f6705b43e67cd1bb6d1be0ffeb69f0b401facbbd47dcd266346c6c9c6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.2/wpinet-cpp-2023.4.2-osxuniversalstatic.zip",
        sha256 = "7e1ae32901f537f3fc894f93757d5800befd66e0a616537e568a50e4aa84afdd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.2/wpinet-cpp-2023.4.2-windowsx86-64static.zip",
        sha256 = "e93feb58be9aa0cd41a8c41e326c315540eb6c80a40f7647fbe22c9d412626d9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.2/wpinet-cpp-2023.4.2-linuxarm32debug.zip",
        sha256 = "5c8eb0d465e1a76bef36c564a45a225020a827a53f54013a8abcb4d335beef41",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.2/wpinet-cpp-2023.4.2-linuxarm64debug.zip",
        sha256 = "2d99a75ad2d0b7b19c6cc9d16bc4cfd043bc30a304625df80c67f678e73b5fde",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.2/wpinet-cpp-2023.4.2-linuxx86-64debug.zip",
        sha256 = "5c373dd74f862da1e92c3a4836a46828922cc0850cf3697317d5b6e61f45dd93",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.2/wpinet-cpp-2023.4.2-osxuniversaldebug.zip",
        sha256 = "db26bfd79ec22d3a843873315fd2d4942f2e7585abfb835797681da69fcbe0f6",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.2/wpinet-cpp-2023.4.2-windowsx86-64debug.zip",
        sha256 = "f2cafd42aa6be871c52d6b07a1639fff95c11409473552e322d30c30a1d449e1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.2/wpinet-cpp-2023.4.2-linuxarm32staticdebug.zip",
        sha256 = "a2e4ac64d56730881aaed89c9b265b40863d0e46658e892ca941437a7ecdfe46",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.2/wpinet-cpp-2023.4.2-linuxarm64staticdebug.zip",
        sha256 = "a88b3e537f271ed5e4164debcaddc50e327329a72e4795836ba1a82cea261be1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.2/wpinet-cpp-2023.4.2-linuxx86-64staticdebug.zip",
        sha256 = "ced2708f74801dcae7d13b49a05ce38ddb960f724bab6df1da2a5cc08fc2d6cb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.2/wpinet-cpp-2023.4.2-osxuniversalstaticdebug.zip",
        sha256 = "ff63b6b62258fc4b31c2bd64546d6d50cf8715b8d06e7f778f73e9ebaf5bd82f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.2/wpinet-cpp-2023.4.2-windowsx86-64staticdebug.zip",
        sha256 = "3bcc230695bf3d2de4d2dec278c7a8a828786472c04365dfec4022cc153d4b67",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.2/wpinet-cpp-2023.4.2-linuxathena.zip",
        sha256 = "97beeb5bad688451a65d09efed22ee1be13cf41329a6a70b66e651b4be5cd1d4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.2/wpinet-cpp-2023.4.2-linuxathenastatic.zip",
        sha256 = "2e3afd04d81bf1771a6414db02f2fc0adea80f9a9fef530f1ede6f662ad1620b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.2/wpinet-cpp-2023.4.2-linuxathenadebug.zip",
        sha256 = "23febb51d72c94c9e9f0ad9494bd09d9cdf5c10e248cbd1c3136ecd4ad4d354a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.2/wpinet-cpp-2023.4.2-linuxathenastaticdebug.zip",
        sha256 = "0db4f14868352071e3f79ab721e835d5e0866a20a8c60aacc95c737926b8211c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.2/wpimath-cpp-2023.4.2-headers.zip",
        sha256 = "026ac04153e401cdc87f1828b5219df73056faf1980e2193e2ff52231a84906e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.2/wpimath-cpp-2023.4.2-sources.zip",
        sha256 = "f22837dbc4df43ac1fa33b6c5c60146344e957946dcaf5b71f6b20990c49c415",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.2/wpimath-cpp-2023.4.2-linuxarm32.zip",
        sha256 = "bbcccbfb32c4b57b71c11314dde96f41b131b22ac2aff57fa8bfbde3d10926d5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.2/wpimath-cpp-2023.4.2-linuxarm64.zip",
        sha256 = "4667c8648ed495f52455c7a2670533699789852a3294b6bf5b4c57fcc7a4f45d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.2/wpimath-cpp-2023.4.2-linuxx86-64.zip",
        sha256 = "39020c298b7bb76cc1b45455a81e489db6b416033e7b232cf7538f1aa42544ee",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.2/wpimath-cpp-2023.4.2-osxuniversal.zip",
        sha256 = "396c5c6b28e3c1fd83695255111e5d5584921c992c4d6030afe3c342b32d3690",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.2/wpimath-cpp-2023.4.2-windowsx86-64.zip",
        sha256 = "8e26c7d7ac105a31fcaa3d63a0a21cf274400d8b1f54cbf0baa6178de9bc6e45",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.2/wpimath-cpp-2023.4.2-linuxarm32static.zip",
        sha256 = "b6b68368087d859027699f70d1885879a0999e51a2624d42d085247850d07c9e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.2/wpimath-cpp-2023.4.2-linuxarm64static.zip",
        sha256 = "6807d4d5ce5f779b261a8952b52374f4dde28dac0e0ec93456818c179554cbe3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.2/wpimath-cpp-2023.4.2-linuxx86-64static.zip",
        sha256 = "a9445c1e1c586f0f46fa771d0ba3baa4c700ac59840119b853e1ef6ada2a0da0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.2/wpimath-cpp-2023.4.2-osxuniversalstatic.zip",
        sha256 = "13c0966077faba677bb5c8f2e51c4a3f8e9ced84c520f4677053899a670d9855",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.2/wpimath-cpp-2023.4.2-windowsx86-64static.zip",
        sha256 = "b0e3a13c11dc1115a6ac7d193071cd87c107c1d4d1d44b842c5cdc91c482975f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.2/wpimath-cpp-2023.4.2-linuxarm32debug.zip",
        sha256 = "5d93974ff60dd1be0562bb2fa29090b424b8f86bc72fb61828f9316db2368be3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.2/wpimath-cpp-2023.4.2-linuxarm64debug.zip",
        sha256 = "f10d50a7f57c46768f71fcfe25914372e03177ac03e2a8e49750969d3eb9aba5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.2/wpimath-cpp-2023.4.2-linuxx86-64debug.zip",
        sha256 = "187768c907ed1e09748b7bb0589c9b73d659160fe96f8d017978960ebfb5fa43",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.2/wpimath-cpp-2023.4.2-osxuniversaldebug.zip",
        sha256 = "2c1b0171ff2ceda29dde0670ef7c691037ea7dc43f1f3e095ab688a191a2d9fe",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.2/wpimath-cpp-2023.4.2-windowsx86-64debug.zip",
        sha256 = "df036bd72008796c873710c51104f4b6886a50b6dcf73d2d4a22f1b8d133d566",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.2/wpimath-cpp-2023.4.2-linuxarm32staticdebug.zip",
        sha256 = "7c55bf4a728cac45730b156196aeb8cc3f1fe87002e0a084d320ab6f02c35cd0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.2/wpimath-cpp-2023.4.2-linuxarm64staticdebug.zip",
        sha256 = "6f0dc5c779ca014e3de0f74f5f5ef2f43bf6c270e435c012177a19cb12cf8a90",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.2/wpimath-cpp-2023.4.2-linuxx86-64staticdebug.zip",
        sha256 = "9bffb24aeaf8e05b12808cf013883f39380ef8997b3e155a1a5dcb7a0da3fd07",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.2/wpimath-cpp-2023.4.2-osxuniversalstaticdebug.zip",
        sha256 = "1910b40fe1cbff756dd4c68d1e797b06a8d5db5f39e3f34990c869dec40d0d9b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.2/wpimath-cpp-2023.4.2-windowsx86-64staticdebug.zip",
        sha256 = "5344d6c3241ea14985e9e4464fd17ac60bd5bacb5d200b5da2b9ae6d04f40430",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.2/wpimath-cpp-2023.4.2-linuxathena.zip",
        sha256 = "5c680a71dd7c456f75717b00f2b04807cdaf693dcca0e03b07e046245b0ad2b4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.2/wpimath-cpp-2023.4.2-linuxathenastatic.zip",
        sha256 = "9cc653716aa8b9d1bb8f4122fad3cbf2ef17b3aed1048f81b7f2d3a3571aa3d5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.2/wpimath-cpp-2023.4.2-linuxathenadebug.zip",
        sha256 = "e8399f6fc1be461ed8af706585b3515e14c41bb69e31cea9318055ccb929e03c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.2/wpimath-cpp-2023.4.2-linuxathenastaticdebug.zip",
        sha256 = "98518f875c0aa7aa047885f598227f467d98e6d6df74db1a20cd5ed1ab22e74a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.2/apriltag-cpp-2023.4.2-headers.zip",
        sha256 = "46ffa2736ef00fbabf21b1444fd388d86dd72df7811ece4c676a0279b66238cf",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.2/apriltag-cpp-2023.4.2-sources.zip",
        sha256 = "5bc7c8d0000c6dd74811502b964e5b149c3b1f0deaaf8b6e3dc56ecaf7601ba3",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.2/apriltag-cpp-2023.4.2-linuxarm32.zip",
        sha256 = "15ecf27d58bac3ce89b8acd76daaede4c056ecef139a80892f366d848ad2e6d2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.2/apriltag-cpp-2023.4.2-linuxarm64.zip",
        sha256 = "e4c280ea67a54f3acd17f3b847a99b9a43d05ae366784035c1761794c6d3e3d2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.2/apriltag-cpp-2023.4.2-linuxx86-64.zip",
        sha256 = "ba6e1aa7936ec9584400f6e98399b43a8e2e75fd4d317979393d05b9a1c1bc06",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.2/apriltag-cpp-2023.4.2-osxuniversal.zip",
        sha256 = "8fc1083631b4bfb9321bbb603a0e25d3e7a56fee96f5718ad2e5f5ea2dd6860f",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libapriltag.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libapriltag.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.2/apriltag-cpp-2023.4.2-windowsx86-64.zip",
        sha256 = "e0826844bbe7999e2ee5fffabae870b4bdf2a555dd5c0459147e6141a8cbc417",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.2/apriltag-cpp-2023.4.2-linuxarm32static.zip",
        sha256 = "89a2fd27942e585ed1a0574604bc67e45f28a80e7bd544bf6f536b904094d364",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.2/apriltag-cpp-2023.4.2-linuxarm64static.zip",
        sha256 = "afe5e50e79d54a0c5535121e794c89d02ee28a92ee550df89367eb631ffe78c5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.2/apriltag-cpp-2023.4.2-linuxx86-64static.zip",
        sha256 = "fb0319b026a8e07ed1c0090e9ccf2abfa818056b4859e47eaed51cdb08b3ad16",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.2/apriltag-cpp-2023.4.2-osxuniversalstatic.zip",
        sha256 = "0805950dc2ab060d235e50cdeaeed8400c6c1716536935b9ec857138e4d7dc12",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.2/apriltag-cpp-2023.4.2-windowsx86-64static.zip",
        sha256 = "d6a3a71c0268ae0bcb41095a8f44d696ecea6de2171bf703a25594188b3ab3a5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.2/apriltag-cpp-2023.4.2-linuxarm32debug.zip",
        sha256 = "d2678a1904334eb18717d4676cb15ce7f8c1ae79630367436ebfd91d56c46227",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.2/apriltag-cpp-2023.4.2-linuxarm64debug.zip",
        sha256 = "9368b087f2a1d4c0b01c7c25058c82d8e35a7b19f6101080b6054cf1c6821cc0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.2/apriltag-cpp-2023.4.2-linuxx86-64debug.zip",
        sha256 = "84c734d1e478b8ef9393bc498f77ad2f4d3727cd923e7bb1eea06d87369c0923",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.2/apriltag-cpp-2023.4.2-osxuniversaldebug.zip",
        sha256 = "5bbf7c75226541f234cf5322a19c26d391d60a47904ac9c2e1ad8c18e413bece",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libapriltag.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libapriltag.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.2/apriltag-cpp-2023.4.2-windowsx86-64debug.zip",
        sha256 = "7949b3978e14cf576a6f93b3a9b7235ffa9f8f6af2aaa185d96c374a908d1104",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.2/apriltag-cpp-2023.4.2-linuxarm32staticdebug.zip",
        sha256 = "29b069367c35861d61684c29ed92f0512246111a3ac741140662208238e6e9a0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.2/apriltag-cpp-2023.4.2-linuxarm64staticdebug.zip",
        sha256 = "6ae83eb3de3a77ea89c271b77f4dcdcd39311444e4e06adb7e71df2b80636ca9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.2/apriltag-cpp-2023.4.2-linuxx86-64staticdebug.zip",
        sha256 = "b853dc045fcb65b82cc266860cec4275dad8d1f97bef3e46f8869cfb94f71b56",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.2/apriltag-cpp-2023.4.2-osxuniversalstaticdebug.zip",
        sha256 = "34f60bba03232afc66d4b85f1b1161498190f742072ab0ccaf2902204b91c6d8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.2/apriltag-cpp-2023.4.2-windowsx86-64staticdebug.zip",
        sha256 = "02caf781caf35f44295dc2afc14c69baa7f2b67765061cefd4814e5be5d7f04c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.2/apriltag-cpp-2023.4.2-linuxathena.zip",
        sha256 = "b998c93e5e1fe3523d4ae34df353e71f75e1ba354dd8bb4b99bbb98f3b27a1b3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.2/apriltag-cpp-2023.4.2-linuxathenastatic.zip",
        sha256 = "48539a73c77a2d211d44cfc43dc9c9829d495315d06b6fe1704eb7008f9ffef8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.2/apriltag-cpp-2023.4.2-linuxathenadebug.zip",
        sha256 = "05c89f067bad67411d86dcaa9cab315ff8996d01a5fe0126288660cb5ee9aac5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.2/apriltag-cpp-2023.4.2-linuxathenastaticdebug.zip",
        sha256 = "74e3b02b899f5d8860260d1fb11d1d53a7523a92e214f5958af3f3a47a948086",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.2/hal-cpp-2023.4.2-headers.zip",
        sha256 = "b1cb12c48c3594e6ee15d6d35acf19fcc74fdef589f1e5f26e2b76f152aeac6c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.2/hal-cpp-2023.4.2-sources.zip",
        sha256 = "0128888afd962a9658464a2e3fd2421582127d0cca5841b6edff036b08056cd7",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.2/hal-cpp-2023.4.2-linuxarm32.zip",
        sha256 = "ec699dbc2cd387353ac127f2ba8595425bf8cec48f9043141a1725e0d42c9326",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.2/hal-cpp-2023.4.2-linuxarm64.zip",
        sha256 = "b6bebb6352dcbaee70d979c46fd47a7cdf8936e1d06a0ccb69670d51eef8795a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.2/hal-cpp-2023.4.2-linuxx86-64.zip",
        sha256 = "fb12294c87a5806d39307d042e7cb8cbd4b5e0fa49b872fa5c49fa41ed2feca0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.2/hal-cpp-2023.4.2-osxuniversal.zip",
        sha256 = "40d20afea278c414d5835c9e6b14f450acf180ace22704ddc8b1ca6bf107ad0e",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.2/hal-cpp-2023.4.2-windowsx86-64.zip",
        sha256 = "87ef4071d12f129301604e356897e56915b4ed8e732e00d2ba03e191ab23fdb8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.2/hal-cpp-2023.4.2-linuxarm32static.zip",
        sha256 = "2f51d0e203b896213e469586b3da78df5a77a3920f856e336a6a52a43e665099",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.2/hal-cpp-2023.4.2-linuxarm64static.zip",
        sha256 = "06fce0daaa926825c530619f4ea0034367fc6cf09b4d80c492b5a034bf5ecac1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.2/hal-cpp-2023.4.2-linuxx86-64static.zip",
        sha256 = "8ec2e257a369b74a07d8f381b48ed387c96abaf90a5277ecd8cc6f1706101972",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.2/hal-cpp-2023.4.2-osxuniversalstatic.zip",
        sha256 = "8933317422bd84fdcaab51a2105e08cd8a493a3bec909312971f7b5eda06b5a5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.2/hal-cpp-2023.4.2-windowsx86-64static.zip",
        sha256 = "263714229b54d6cfd319439d331a8154edc7687ae7b5658b6fafdd3807768581",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.2/hal-cpp-2023.4.2-linuxarm32debug.zip",
        sha256 = "1918fdc1f976612b7c9870c9959493ca9ef57245bb8135c278492ac6f0ee3d5d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.2/hal-cpp-2023.4.2-linuxarm64debug.zip",
        sha256 = "e736458f15086081ab17f8b0fe1a1760ab0e518d3008cb8b51828b57f8a8c477",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.2/hal-cpp-2023.4.2-linuxx86-64debug.zip",
        sha256 = "dde689535dc005a6f914e906051065e23e4647268b3e535126fce58670b8b445",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.2/hal-cpp-2023.4.2-osxuniversaldebug.zip",
        sha256 = "bd735db57cd1786e8149dccf0e6e6dfc58157c8150ef0404ba04f23bd9fe8e0d",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.2/hal-cpp-2023.4.2-windowsx86-64debug.zip",
        sha256 = "ef4bff28abbc80b69515faafea5f7c998119fcc79b8eee6cc4242f06fce84a3a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.2/hal-cpp-2023.4.2-linuxarm32staticdebug.zip",
        sha256 = "56a72c1dd0779c1e76b6d821be59cc6ed6e0dae41a76a7ad039d2b46fa48cfc9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.2/hal-cpp-2023.4.2-linuxarm64staticdebug.zip",
        sha256 = "66fa75fed12752d622026ea1653b74a0f4c4eb8278b1159682b1184242673b21",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.2/hal-cpp-2023.4.2-linuxx86-64staticdebug.zip",
        sha256 = "2d72de029c5b4642f9c9b848ef7e126c8fc1505037c5ae89d940bc3eae04e845",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.2/hal-cpp-2023.4.2-osxuniversalstaticdebug.zip",
        sha256 = "7864dab00b541a6b0613337ff3af3eb55b45f9cc2a0a6634ca7ee727c603868d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.2/hal-cpp-2023.4.2-windowsx86-64staticdebug.zip",
        sha256 = "f40235251883b510c425285ae349a97a67a15cc3edb7e200cf8ad4522a7b1f25",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.2/hal-cpp-2023.4.2-linuxathena.zip",
        sha256 = "e9364d78cedcf1ab13964d5cda5462ff9aa6d1bef3e2e9e30f31623bd7164a46",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.2/hal-cpp-2023.4.2-linuxathenastatic.zip",
        sha256 = "510904aba61175c130a8f8566a60cfef8341a29aff67b283015c8918af7ed869",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.2/hal-cpp-2023.4.2-linuxathenadebug.zip",
        sha256 = "301f4e9fef2caa0b394ad45c79395b62d792a6ec58522a21bb5a47bc88f397a0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.2/hal-cpp-2023.4.2-linuxathenastaticdebug.zip",
        sha256 = "14cae14e9f49eaf7ba3c64d5c411f9fc30a2c8fafe8514fd2a455416cf43b3b4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.2/ntcore-cpp-2023.4.2-headers.zip",
        sha256 = "848aee6bfef512050357e20f8dad72bb7989e306d4232e21fedcf0945e562a6d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.2/ntcore-cpp-2023.4.2-sources.zip",
        sha256 = "66fb348b90ba887dc0e21a240ac5443ae6398d45ff73367215acd26ded3087da",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.2/ntcore-cpp-2023.4.2-linuxarm32.zip",
        sha256 = "03e49d4848647351ddcf29353ebed162f4c7b33b4fbde80622e66ff0e8fb334f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.2/ntcore-cpp-2023.4.2-linuxarm64.zip",
        sha256 = "ef8b23fe476794f3590091dbca8fe9ee75caf83b7eacc7430033130fd2334148",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.2/ntcore-cpp-2023.4.2-linuxx86-64.zip",
        sha256 = "8ff3529954a3fc8dc7e499812943bedcd7c95e1e7248e38bf9182c629d143d89",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.2/ntcore-cpp-2023.4.2-osxuniversal.zip",
        sha256 = "407f8f00ada8ec515fbb4dad820515db80bcee657ec6894b2c63e910abca97c4",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libntcore.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libntcore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.2/ntcore-cpp-2023.4.2-windowsx86-64.zip",
        sha256 = "e54c99e04465d38ccf564d176878a09d704389ebc9150a59cac55af3007cbf6f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.2/ntcore-cpp-2023.4.2-linuxarm32static.zip",
        sha256 = "5d5e8f9014169dfa8254ed65de5eaa764a530372cc765aafb3732083c999cc7a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.2/ntcore-cpp-2023.4.2-linuxarm64static.zip",
        sha256 = "8ef9ce6366a8f5a0e121b12084e6f3b5016540074ed43c88ffb47c7877c48ceb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.2/ntcore-cpp-2023.4.2-linuxx86-64static.zip",
        sha256 = "ebe87116123e5fa08094eb286d72d877007e4ec6231fbee45a2fbaf511cb51cd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.2/ntcore-cpp-2023.4.2-osxuniversalstatic.zip",
        sha256 = "11fbd085ab630ff5190770ee3a49be08d9818cf519710d5516882dd636e7669b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.2/ntcore-cpp-2023.4.2-windowsx86-64static.zip",
        sha256 = "4cfe06a7700dfc817039192bd8f414a5bf85e891b676e6e62caf7ff850e6d00e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.2/ntcore-cpp-2023.4.2-linuxarm32debug.zip",
        sha256 = "86b3e7ff5ae8f3184aa6136b471d85c659eac4541a9826d6f1932a3dc66baec6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.2/ntcore-cpp-2023.4.2-linuxarm64debug.zip",
        sha256 = "d236c2b039cc094451ffad637c434b71ebe8d2a51a93f3b68cbdd473629bf437",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.2/ntcore-cpp-2023.4.2-linuxx86-64debug.zip",
        sha256 = "6ba03a3738803ac14acc9733f994331e4769c14a4751498b7b49fd9a13e6fb51",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.2/ntcore-cpp-2023.4.2-osxuniversaldebug.zip",
        sha256 = "15a809ff84222b61f7171a61ba82ff5a9dfac8c0ab76eac1bf4d0d383e1dd5f8",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libntcore.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libntcore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.2/ntcore-cpp-2023.4.2-windowsx86-64debug.zip",
        sha256 = "79c44539ba62fb07f42dd45711cf6fb8b9d29162e038032c374804e73fed4e5a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.2/ntcore-cpp-2023.4.2-linuxarm32staticdebug.zip",
        sha256 = "e789707e59be90b4388e1446fe1a18e2416fabf782cbea48ba1daf912658d85d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.2/ntcore-cpp-2023.4.2-linuxarm64staticdebug.zip",
        sha256 = "552b9516f97917492440513f33f99d36c9e23a55201089848bd3d18912713701",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.2/ntcore-cpp-2023.4.2-linuxx86-64staticdebug.zip",
        sha256 = "04422038a92237c2f3b3cc183f4032b3202ecee1b9e356e650d226b4d08255ff",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.2/ntcore-cpp-2023.4.2-osxuniversalstaticdebug.zip",
        sha256 = "9cb7ff05c29b3b57c3a07494938e8d4fb11cb20db24e923da17482a0f396f4d7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.2/ntcore-cpp-2023.4.2-windowsx86-64staticdebug.zip",
        sha256 = "53cf2c6337b68a335c2c44397054b858cecdf4793c848d43d2cc2a2b7952c9d0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.2/ntcore-cpp-2023.4.2-linuxathena.zip",
        sha256 = "26a7b3b1b91451c2bb2ae2eb274b5725bfd35a7721994c0a3af2e436f5478ace",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.2/ntcore-cpp-2023.4.2-linuxathenastatic.zip",
        sha256 = "34d9daf33fb41ad4132c805f0660260cc8121d3aea6110d85ccad68c74881b9a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.2/ntcore-cpp-2023.4.2-linuxathenadebug.zip",
        sha256 = "6377a10309503e9d611de054b06465cf4a15d872943d128b4b54e541c836cb33",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.2/ntcore-cpp-2023.4.2-linuxathenastaticdebug.zip",
        sha256 = "3eb689606da1813682b726d9b58889a211555da3ad8112067863491987bdccfa",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.2/cscore-cpp-2023.4.2-headers.zip",
        sha256 = "34a35270cf4075960947062eccf5491c7d2967f88143fd95a8c12408dde00e80",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.2/cscore-cpp-2023.4.2-sources.zip",
        sha256 = "d6c07a8d0a758835f9884bf9d19d5f87766f1f45875609d7e1aa518a9ddaad4e",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.2/cscore-cpp-2023.4.2-linuxarm32.zip",
        sha256 = "767ce26bffef3851a1f11a55a48af82ef924ba9edfd65866a3895443b60579e0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.2/cscore-cpp-2023.4.2-linuxarm64.zip",
        sha256 = "cfc2becc2b377348483a3c94371fc8ec4de49b573e0497f80bdff6c54ba64d5f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.2/cscore-cpp-2023.4.2-linuxx86-64.zip",
        sha256 = "e59792e573a2ea31828d4af891544399baca541f050be27d982e2f597c4d1a08",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.2/cscore-cpp-2023.4.2-osxuniversal.zip",
        sha256 = "47ae656e91cf076a48f58fd639ca075ced01dc83625c97fb3872b43c8b7dfdc1",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libcscore.dylib osx/universal/shared/libcscore.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcscore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcscore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.2/cscore-cpp-2023.4.2-windowsx86-64.zip",
        sha256 = "751217e494198afcd3aaf391385dac7903da14a0e7498cc6a78617942a49e4dd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.2/cscore-cpp-2023.4.2-linuxarm32static.zip",
        sha256 = "cd21530ba4f50a2017a609ebdfc5b0295ba5e6bf743fea59c40f353ebea2c7c3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.2/cscore-cpp-2023.4.2-linuxarm64static.zip",
        sha256 = "03ed9a5c5b7e07ae38d682c6a45d57d99f3be2deb82552b5a47ef8f40d9d3afa",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.2/cscore-cpp-2023.4.2-linuxx86-64static.zip",
        sha256 = "15a63fef900ca1784c36f9a787ee80d4128a5c59430e77528430a2efb2e1ad67",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.2/cscore-cpp-2023.4.2-osxuniversalstatic.zip",
        sha256 = "d8f01d0ef9c39d32dbaceccfe877790e0617133cfd7aa1b97e84d85d8f11f610",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.2/cscore-cpp-2023.4.2-windowsx86-64static.zip",
        sha256 = "4ca21f38c605c6df9b0db0c1f13dfdaa304c715f954dfd7adbde04cf0cebd6dd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.2/cscore-cpp-2023.4.2-linuxarm32debug.zip",
        sha256 = "e9d2403cd66ca4909fbadd551589c7bcb8e915778a4a5528dd5ce7a66484b99b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.2/cscore-cpp-2023.4.2-linuxarm64debug.zip",
        sha256 = "5ddf5a2fb462d3f3adb4cd32b42700c61928995e9436d4539b7c21e6e2d2c557",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.2/cscore-cpp-2023.4.2-linuxx86-64debug.zip",
        sha256 = "013d3e4d4ee2076f6757e099d72217de1e958d56f3897d768ee92083bd9258bc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.2/cscore-cpp-2023.4.2-osxuniversaldebug.zip",
        sha256 = "a65a25f03711b1f8aafed99582aa1ee3483bbd3bb130e7b107c50deadd47e7c8",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libcscore.dylib osx/universal/shared/libcscore.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcscore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcscore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.2/cscore-cpp-2023.4.2-windowsx86-64debug.zip",
        sha256 = "b16c73a1e56a9ab6b804ee7ab36accee165fce5879096e2b6402ddf3eec417ea",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.2/cscore-cpp-2023.4.2-linuxarm32staticdebug.zip",
        sha256 = "ee3871ab198319ce247ae024c88c3cc75b119653b8307ec58131e4e7ceade20e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.2/cscore-cpp-2023.4.2-linuxarm64staticdebug.zip",
        sha256 = "70cef9279aae392230d8929cf7e2bf4a2f8e9476503fd467b6d0b18ff58e997c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.2/cscore-cpp-2023.4.2-linuxx86-64staticdebug.zip",
        sha256 = "c3cff0bd6ff395571b15a4a08ba329e40c32b69f86c3f2a2ba16688b0136e897",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.2/cscore-cpp-2023.4.2-osxuniversalstaticdebug.zip",
        sha256 = "4d3e6471ab44ad82d43c87d376be180469c65dc0b502a561daa41ab560078815",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.2/cscore-cpp-2023.4.2-windowsx86-64staticdebug.zip",
        sha256 = "c311aa049f5cc018a8d73872dea8b6849599b18c44e8e7cb28295754b20770ea",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.2/cscore-cpp-2023.4.2-linuxathena.zip",
        sha256 = "9af74e85fa8a7c260744cb2f1121cfe1b712efde778915309908360f3044a1fb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.2/cscore-cpp-2023.4.2-linuxathenastatic.zip",
        sha256 = "6e4413a23049b35740fed146c15bef59a2e95cb591cb1efc662325943a723a1b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.2/cscore-cpp-2023.4.2-linuxathenadebug.zip",
        sha256 = "9ad3a476eb2e73b05a6d26d8fe2df009f5c6633a72d7cd3286b44a2d9384a1c4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.2/cscore-cpp-2023.4.2-linuxathenastaticdebug.zip",
        sha256 = "15825e7e38f0a5eced2644c90a9c209536e2d39adc91fcc0e75741e423e5b7a7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.2/cameraserver-cpp-2023.4.2-headers.zip",
        sha256 = "370f3fb09a6558d09c41bbdf928c20746a77fca14b069f3d8152ee9c434350ec",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.2/cameraserver-cpp-2023.4.2-sources.zip",
        sha256 = "5d6396a4dafb9dfbf6cc0b573e6194516d096ce620127a890c966ba72a16fe4d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.2/cameraserver-cpp-2023.4.2-linuxarm32.zip",
        sha256 = "ca9c387b64719218217baae9cee982d1ee723b7584550be336d4a61b646495fa",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.2/cameraserver-cpp-2023.4.2-linuxarm64.zip",
        sha256 = "bf189cc59152acbd1a56c123e9b21c083d68e5a0745100937907cc4340721554",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.2/cameraserver-cpp-2023.4.2-linuxx86-64.zip",
        sha256 = "f9c6c01d8fa9cfcbffe0acc816b4622b5439dc445f8305de30ea185b42d56bb4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.2/cameraserver-cpp-2023.4.2-osxuniversal.zip",
        sha256 = "74320a68ab32ee46ca7f0bde849acf47c71c3a61d7ba7b63d94d8910dafd95d2",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.2/cameraserver-cpp-2023.4.2-windowsx86-64.zip",
        sha256 = "a8a83b9444be2f869f09b237b7d8a940f76f1377d3232998122c9de4349d5a38",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.2/cameraserver-cpp-2023.4.2-linuxarm32static.zip",
        sha256 = "676fb39266dc9081a3397fe8fa0f229c3e3c936139b0c8c743d20759623d2ca3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.2/cameraserver-cpp-2023.4.2-linuxarm64static.zip",
        sha256 = "53134fcd4ed0b22751669d3d9090532e1138ed87b5da6769112c7159d337119d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.2/cameraserver-cpp-2023.4.2-linuxx86-64static.zip",
        sha256 = "066d8f1e844815d44e2f9ae3b92a10ceaa03114e433dfc182caf8e1bf14d7940",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.2/cameraserver-cpp-2023.4.2-osxuniversalstatic.zip",
        sha256 = "e4282ea119b8bfe2c53e2c1d85559c4103d4b795bfe862c503cefa1263502def",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.2/cameraserver-cpp-2023.4.2-windowsx86-64static.zip",
        sha256 = "17ba6b4c22c2a59c6ab1c406deba9cd73077fa59758084ded60fcefdc6208ed2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.2/cameraserver-cpp-2023.4.2-linuxarm32debug.zip",
        sha256 = "f9f6ed64b4b906fd9f2999bb3987879b4ef92ef9e76fe7b63364d250f6a5d98d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.2/cameraserver-cpp-2023.4.2-linuxarm64debug.zip",
        sha256 = "75124788878e37b0d87f938163c82b87f6bdeb71c3c3071a528d39a5ed5a1c98",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.2/cameraserver-cpp-2023.4.2-linuxx86-64debug.zip",
        sha256 = "6658a144a8356e3eefef41c022a92f224f73ad7601ee50ffc0493ce3aa7ec73e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.2/cameraserver-cpp-2023.4.2-osxuniversaldebug.zip",
        sha256 = "c1ec99b58b8edf011664382f46c4e522a52d9c762e5b88ef0f1ac86e454725a8",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.2/cameraserver-cpp-2023.4.2-windowsx86-64debug.zip",
        sha256 = "012f58f3402b9132992e0ec7a1b4d05c8a469c2a58a37ade19c70212474ebacc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.2/cameraserver-cpp-2023.4.2-linuxarm32staticdebug.zip",
        sha256 = "f559cbe407e91a0062954819782f8c33ad51a0ae3072124461a2fd144a9c4a48",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.2/cameraserver-cpp-2023.4.2-linuxarm64staticdebug.zip",
        sha256 = "5c8a01e249482427cec80cd9e452b5dfea865b95e26cc720f323cc1ad51efc2e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.2/cameraserver-cpp-2023.4.2-linuxx86-64staticdebug.zip",
        sha256 = "92854987318699926bd82adc37f328bceea0cf96a79b9a5a153dacbedef4e822",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.2/cameraserver-cpp-2023.4.2-osxuniversalstaticdebug.zip",
        sha256 = "0b1cb47b4d0bffd791382961df6c466e57887254f411fdf995fd3fe621cac723",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.2/cameraserver-cpp-2023.4.2-windowsx86-64staticdebug.zip",
        sha256 = "1a89e860c1adb3f2bc02597fd128e9f506997fdabc6c2e3216379faeb1b303fb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.2/cameraserver-cpp-2023.4.2-linuxathena.zip",
        sha256 = "5cb71246a06cde28051df7944ae072943ad5e40958ea883a58e5a77b5e35eed7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.2/cameraserver-cpp-2023.4.2-linuxathenastatic.zip",
        sha256 = "51df4090d93d1311c8e49a52480b853f9d7ac2a584ffbc99b764ecf71345227b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.2/cameraserver-cpp-2023.4.2-linuxathenadebug.zip",
        sha256 = "b12669ee6ea891cf81766109e50cdc056b43ca96ba7c36da561172795f935a2f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.2/cameraserver-cpp-2023.4.2-linuxathenastaticdebug.zip",
        sha256 = "a0467eb7072f214b81851f348fc23e256794856106b6771f27589d708eb2d953",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.2/wpilibc-cpp-2023.4.2-headers.zip",
        sha256 = "7611d5e555fb37480e3ad9283632067003b94ea6a25db68ab6222d074b0359bb",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.2/wpilibc-cpp-2023.4.2-sources.zip",
        sha256 = "716cdd8e470cfd549b00b6d37db91fbd2ee208e652185ad5fd8b1eeccc3465b5",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.2/wpilibc-cpp-2023.4.2-linuxarm32.zip",
        sha256 = "de9ea673fabfde5c2e605dea7f9bac44d7d2fb72cf7a4cad4616ebc6a234459d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.2/wpilibc-cpp-2023.4.2-linuxarm64.zip",
        sha256 = "789f5acabd79e58a9be68e911719e48212dbb8ce3d14fb72cef1469264a1c593",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.2/wpilibc-cpp-2023.4.2-linuxx86-64.zip",
        sha256 = "293616b43d2bda985a522888f927b568f3bf72981627bb9ef3fdb9fe0a3c8ee5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.2/wpilibc-cpp-2023.4.2-osxuniversal.zip",
        sha256 = "bd87d4c3cd4d78d8551f054cb88777a8231362affa130b9f4dd7da11ead1e7de",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.2/wpilibc-cpp-2023.4.2-windowsx86-64.zip",
        sha256 = "cc643e80d974814d27f0fa603b2936b7c227995b2d2ac7f1842aa1288a72e094",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.2/wpilibc-cpp-2023.4.2-linuxarm32static.zip",
        sha256 = "b0f86a72b2853e8bcbd400343fa467e890d8096f6ff5e6ec53de170051f0f1ae",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.2/wpilibc-cpp-2023.4.2-linuxarm64static.zip",
        sha256 = "dd944475c345751b6c88bf5c08086f28a93c7ed496c47a9563475f5b8b71b7e0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.2/wpilibc-cpp-2023.4.2-linuxx86-64static.zip",
        sha256 = "d7dcf1a6e1dd1c0bd3dac2cddd64a4df4a0a778da8fb17e17ce689501f3b13f2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.2/wpilibc-cpp-2023.4.2-osxuniversalstatic.zip",
        sha256 = "63b3e70b3dc0330423c50bcd66c1af3af3c4c30d34c69206ef7ff2fd82b0bb5f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.2/wpilibc-cpp-2023.4.2-windowsx86-64static.zip",
        sha256 = "ad5925fb892b8cf09b834875a79ef09ba4aa8db947cfdf787517cf8f1b9ea5ca",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.2/wpilibc-cpp-2023.4.2-linuxarm32debug.zip",
        sha256 = "758e9217b41b50ef3307eafd538cbc0a2ced7c7166a1aa2d1d3c78ded5535a6a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.2/wpilibc-cpp-2023.4.2-linuxarm64debug.zip",
        sha256 = "9f59864dfb453f60facccaa67a834626f5fe3e7b99835725fafc91e8bdfeeec0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.2/wpilibc-cpp-2023.4.2-linuxx86-64debug.zip",
        sha256 = "b3be806322a44db7c6090a7201fbdfd5d44e2f85de8911615609d3febafe1c87",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.2/wpilibc-cpp-2023.4.2-osxuniversaldebug.zip",
        sha256 = "1bfb8a7d2d63d6062cac5407adcb0c7293eef54e625ca7c45e5445eae8a6fb03",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.2/wpilibc-cpp-2023.4.2-windowsx86-64debug.zip",
        sha256 = "905fcf1970dafed03565eba796eff22667f1f582cb04befcd3ba5af539ef04cc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.2/wpilibc-cpp-2023.4.2-linuxarm32staticdebug.zip",
        sha256 = "25d0cc5b4409d69a60f79f6e0da431469623c438b203ca047fdf8f8dc91b6da9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.2/wpilibc-cpp-2023.4.2-linuxarm64staticdebug.zip",
        sha256 = "dd04fe045c664dbac4d5a6d237b4b0442b724626feee31173bd3c776015189a1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.2/wpilibc-cpp-2023.4.2-linuxx86-64staticdebug.zip",
        sha256 = "b36d399a8f240a13934798e043bc016bac3b9e7915e7e62459589b41897ec04c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.2/wpilibc-cpp-2023.4.2-osxuniversalstaticdebug.zip",
        sha256 = "22838fb2e1c47f6a3cdfc1ddc1b72f6ab39100406084436d38672d1b61275320",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.2/wpilibc-cpp-2023.4.2-windowsx86-64staticdebug.zip",
        sha256 = "0e636661dd7b2506163636ccfadf2f23501f6d8fc504587923616d46745c2740",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.2/wpilibc-cpp-2023.4.2-linuxathena.zip",
        sha256 = "a5dc60b5e7e84258d7e8d8cec158c0cee008bbf2c0b5b6bd7bebb21e5640e7dd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.2/wpilibc-cpp-2023.4.2-linuxathenastatic.zip",
        sha256 = "cce26e814cb6679575d39d5b1d16990e7b2dd2e18f906ecfe84946036f6b5f92",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.2/wpilibc-cpp-2023.4.2-linuxathenadebug.zip",
        sha256 = "2752dd8ae08b611d120f3776ea98c10c0900c01cd15128c1698dca2b32b4213d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.2/wpilibc-cpp-2023.4.2-linuxathenastaticdebug.zip",
        sha256 = "aca201f4c678decf430f314de7901f6a6d898c58873ae2e8356f64c2607ad4ff",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.2/wpilibNewCommands-cpp-2023.4.2-headers.zip",
        sha256 = "3cd6a2a2c0580c3a999f3c324dd6cd81e703d1981f60b55632a1596ba23dcb62",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.2/wpilibNewCommands-cpp-2023.4.2-sources.zip",
        sha256 = "fd67f8be5fb8d8ff18d9ab32b79110332492845b75ba3e3690e93145dc5c075c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.2/wpilibNewCommands-cpp-2023.4.2-linuxarm32.zip",
        sha256 = "c07e3562d0c10101196f25dcaffc75d91d2c921b5f7296bb6fc4161339469ea0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.2/wpilibNewCommands-cpp-2023.4.2-linuxarm64.zip",
        sha256 = "c5c0571c76d8e9e305c2df559dc6e26a54af59dd07b6c3e893eb619d643e8d0f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.2/wpilibNewCommands-cpp-2023.4.2-linuxx86-64.zip",
        sha256 = "79fb43bfc8075213d37ea4e29bf54fb05026cbdb8c183a077897442ba0aca658",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.2/wpilibNewCommands-cpp-2023.4.2-osxuniversal.zip",
        sha256 = "558beb313457b53f6ec99542b9c69829e730b964329cba8e64cb0fbcd5f97bd8",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.2/wpilibNewCommands-cpp-2023.4.2-windowsx86-64.zip",
        sha256 = "a0f8377c6c12b5c85ea6b6ac4847eaf5359f8d1e1319e4529b2ce3e02aaec437",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.2/wpilibNewCommands-cpp-2023.4.2-linuxarm32static.zip",
        sha256 = "6fbc7fb1d6cb215e602a58f78da08e7c7808e60a372a0e5bbe9a7371a79b77f2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.2/wpilibNewCommands-cpp-2023.4.2-linuxarm64static.zip",
        sha256 = "066e780859c1401b60530663491710c1cb97b1c3f062b6071edba351552aa3b8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.2/wpilibNewCommands-cpp-2023.4.2-linuxx86-64static.zip",
        sha256 = "dd0f32fa95f62cb0002a4afb194ba0ffa682ae452b7d0627ca64f1d41b50214b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.2/wpilibNewCommands-cpp-2023.4.2-osxuniversalstatic.zip",
        sha256 = "92eab5ce172f5691f99fd135127e0f508dcaf6c1bea7ccd2e6ca723fb3389b70",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.2/wpilibNewCommands-cpp-2023.4.2-windowsx86-64static.zip",
        sha256 = "104566e6e59f486580779de4883a763f71cee3513258d9c9492f11a850331d41",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.2/wpilibNewCommands-cpp-2023.4.2-linuxarm32debug.zip",
        sha256 = "be4e7b89da6f341342e61e7fd3ddac3fa193a791341506df740581bb78d752e9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.2/wpilibNewCommands-cpp-2023.4.2-linuxarm64debug.zip",
        sha256 = "a3869a2dfa5de10479b139324a778db8753c8c34d5924a341c2230deb2a6a523",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.2/wpilibNewCommands-cpp-2023.4.2-linuxx86-64debug.zip",
        sha256 = "6fd6001b70387ec58e03bc24d84e0a03d63d18a41ef36c2c3f0ace2ce0e0d825",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.2/wpilibNewCommands-cpp-2023.4.2-osxuniversaldebug.zip",
        sha256 = "5c5283ed188e846593d6e9a934635d43984e08db604f7e993e682c5ca8075adf",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.2/wpilibNewCommands-cpp-2023.4.2-windowsx86-64debug.zip",
        sha256 = "888fd86e7836e41f7aba7af101567fad535132c7f71a7e3448dd7b25292f3e05",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.2/wpilibNewCommands-cpp-2023.4.2-linuxarm32staticdebug.zip",
        sha256 = "033fa601cb6047aed2ef6fcbb65983d5e9890b41d5a8685c41943163f14f3ff7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.2/wpilibNewCommands-cpp-2023.4.2-linuxarm64staticdebug.zip",
        sha256 = "5b7414eaafb6a74a5e03983c3ad1868bb3550cfdb658e641fd9186753b8db8da",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.2/wpilibNewCommands-cpp-2023.4.2-linuxx86-64staticdebug.zip",
        sha256 = "6271340c964422c705773786e94300b24b91a275eabb9d9ed329d8b34a6b70cd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.2/wpilibNewCommands-cpp-2023.4.2-osxuniversalstaticdebug.zip",
        sha256 = "67149081364eaf3060b454b369befef530ab57f8dadb3962e84e4fc68f9c7a06",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.2/wpilibNewCommands-cpp-2023.4.2-windowsx86-64staticdebug.zip",
        sha256 = "1c04bd00344c8712e893b4ab89a09c06c96c6028ca43237ba7cb3c133803558a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.2/wpilibNewCommands-cpp-2023.4.2-linuxathena.zip",
        sha256 = "a831b8364fd4892dc6ba541bc8e563b233402b083e2d1bab1b5aa42d769be5a6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.2/wpilibNewCommands-cpp-2023.4.2-linuxathenastatic.zip",
        sha256 = "b3321f56e205ce275189e402fea4304efc88317fdc9d3c94dd70ee601aa1d383",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.2/wpilibNewCommands-cpp-2023.4.2-linuxathenadebug.zip",
        sha256 = "cff46b1a0d14723580c0dcf61b4681be6daf5ab27011be6652b6314823610b6b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.2/wpilibNewCommands-cpp-2023.4.2-linuxathenastaticdebug.zip",
        sha256 = "6f39fed90b8af2432cd9401d76a93b0ed6f17270b63748731ca5533a9883282a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.2/halsim_ds_socket-2023.4.2-sources.zip",
        sha256 = "a04b037bfa700618d1ef53b055f47fb413a7cfe93f853cddf4200148efdfce3f",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.2/halsim_ds_socket-2023.4.2-linuxarm32.zip",
        sha256 = "1c6cf6d2596c8a1162ca53c6ed5f752a1fd3f1fdd260ed93395e526b80609511",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.2/halsim_ds_socket-2023.4.2-linuxarm64.zip",
        sha256 = "02440b0c0e2e7cdf9e9fd797f554c01b762055c02c903c90d9dffe4ac8c651ae",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.2/halsim_ds_socket-2023.4.2-linuxx86-64.zip",
        sha256 = "2d569534ce161b0673226b5fa29d67c9f0bd3782aafc4c2e3f88cb61bfba9bb3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.2/halsim_ds_socket-2023.4.2-osxuniversal.zip",
        sha256 = "d816e8b1eafbcba82f2ca6861d77e38ae6ae28448d057f0aeb73fa2eeb862904",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.2/halsim_ds_socket-2023.4.2-windowsx86-64.zip",
        sha256 = "8387662ca06ce961a41a683a404ebeb01babf930a5586ccb68099d06fd752d4f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.2/halsim_ds_socket-2023.4.2-linuxarm32static.zip",
        sha256 = "381845093fc6ce34b1fe252fa20e27ede4731a405997e3f08d3f377b54e1ef57",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.2/halsim_ds_socket-2023.4.2-linuxarm64static.zip",
        sha256 = "a18cb92789b900615863b75157d2576f9f4eb45d0f7a6c7ee0e19f644b61c74c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.2/halsim_ds_socket-2023.4.2-linuxx86-64static.zip",
        sha256 = "6910b6643438c75471aebaf5e35757fca756eef99b280c75e959a41e779a54d5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.2/halsim_ds_socket-2023.4.2-osxuniversalstatic.zip",
        sha256 = "6544c48d7b670a0c7311a3ac0a0da828b7ee626138738c4189ae5385caf6f4dc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.2/halsim_ds_socket-2023.4.2-windowsx86-64static.zip",
        sha256 = "4036068132070b9319a2dcbbc04bd038ff2ee824838f69f89c7f28db632adc0d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.2/halsim_ds_socket-2023.4.2-linuxarm32debug.zip",
        sha256 = "8c6f8fa3b8b6b5dac050f431863391fc8284e60a603112ad832ca364d01fc612",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.2/halsim_ds_socket-2023.4.2-linuxarm64debug.zip",
        sha256 = "4f424628048f07dea8bda09d21ad7c35c138b60e26fce46b33583ca5ed3b289a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.2/halsim_ds_socket-2023.4.2-linuxx86-64debug.zip",
        sha256 = "f4a27b6b20d4e9b7f8561ae688507c41c2c545885db78eb8e6c2fcb424812823",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.2/halsim_ds_socket-2023.4.2-osxuniversaldebug.zip",
        sha256 = "40fc055e08055ac9ef2cd9d0d9b27a0db313e6b68932a8f45f18c7a208016a9c",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.2/halsim_ds_socket-2023.4.2-windowsx86-64debug.zip",
        sha256 = "518fb986da3b494094270afcefc408bd55946c4ad88a19dde06a7b1dac670832",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.2/halsim_ds_socket-2023.4.2-linuxarm32staticdebug.zip",
        sha256 = "861b8b0620702101de0d19e2bb50db908baf7f30a74402110642a7c92e38859a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.2/halsim_ds_socket-2023.4.2-linuxarm64staticdebug.zip",
        sha256 = "57e1068484be31d6c3de97399f5ae680a7b87af9537d739036316c2f99d67b84",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.2/halsim_ds_socket-2023.4.2-linuxx86-64staticdebug.zip",
        sha256 = "e62be08266194afe3dadebe78457a0c136c4181ccdef47a905bda7f9697a0b05",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.2/halsim_ds_socket-2023.4.2-osxuniversalstaticdebug.zip",
        sha256 = "e396e84a82308dbcfbc8d72bfbae45888208bb54b1f179ccc6a8c3ec28d9fc30",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.2/halsim_ds_socket-2023.4.2-windowsx86-64staticdebug.zip",
        sha256 = "274e569d05140791b4db96afae3db55e7f04aac4fed155b8a84c5c18baee8cdb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.2/halsim_gui-2023.4.2-sources.zip",
        sha256 = "8f39956fd96be7830dec524811b70deb370f05a6f844d79762c53c0b6229da99",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.2/halsim_gui-2023.4.2-linuxarm32.zip",
        sha256 = "f7959522f0a2a1e10018609ba9248320c8f2f6f18faed7bb570346d6c3d12e6c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.2/halsim_gui-2023.4.2-linuxarm64.zip",
        sha256 = "3428c9400d1387e494a567ba121402d252f0656d76ffc85816d9bf28f4e4b2ee",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.2/halsim_gui-2023.4.2-linuxx86-64.zip",
        sha256 = "33a8a2073629ebed9ce9aba607117ca2f785c403c076d496dac4749eaec7a9e9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.2/halsim_gui-2023.4.2-osxuniversal.zip",
        sha256 = "7503fa810ef3cb379cb2ebdf8ce358281b2b79f361ef8bc6374c1aabc146e141",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.2/halsim_gui-2023.4.2-windowsx86-64.zip",
        sha256 = "8e0296852f2ef07c34aa0fc17a64ddfcb98d9e6dd3ea2eacd19b9b151e60e6ce",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.2/halsim_gui-2023.4.2-linuxarm32static.zip",
        sha256 = "744993b28f54746869a8141127bfeba123367b823270ba8c7346a76a8a20eb54",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.2/halsim_gui-2023.4.2-linuxarm64static.zip",
        sha256 = "543dae733a164df9ccc09dd693e549635c0b7a80e8f3b7c6844df8321e181fd1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.2/halsim_gui-2023.4.2-linuxx86-64static.zip",
        sha256 = "c0b4e5865cfff50cfe9ec105079b8d51a211d7f63d6a0bcfcc849441fed7ddc5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.2/halsim_gui-2023.4.2-osxuniversalstatic.zip",
        sha256 = "8faf70547aaefdd06069b0609c4f83b9fcc2c17862e2c69099df593a71e7fd0d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.2/halsim_gui-2023.4.2-windowsx86-64static.zip",
        sha256 = "e215f584987ccf7da27301c19156c24413698b1589f6161bba090e3050ef5614",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.2/halsim_gui-2023.4.2-linuxarm32debug.zip",
        sha256 = "6daeda97c30045232a1b5ad410813e6fe48e2b511e29203b29c9469c1a196312",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.2/halsim_gui-2023.4.2-linuxarm64debug.zip",
        sha256 = "4c2eeaebd476aaba950720dc530fe8fff9692390ac06d488968be82bd87ccc6f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.2/halsim_gui-2023.4.2-linuxx86-64debug.zip",
        sha256 = "d050b572a4d396d90382bcb0f9f56dfe3a7b13a213cf79184de8ad83d38c97ae",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.2/halsim_gui-2023.4.2-osxuniversaldebug.zip",
        sha256 = "3e330aefc1458d43bad9b7e53591250bf257dc03198ef668e9cb3dfaa118392f",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.2/halsim_gui-2023.4.2-windowsx86-64debug.zip",
        sha256 = "bfc38bc37562068ac2c8da5cb39c8d748eb19482577a485ed99313bfebde443a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.2/halsim_gui-2023.4.2-linuxarm32staticdebug.zip",
        sha256 = "f680b2d6c9abf42ef7f51281c48e276cc8fa004097156367e8f03de4fd882df4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.2/halsim_gui-2023.4.2-linuxarm64staticdebug.zip",
        sha256 = "1e07183f07d83664939ad4c81956523307ce5f8166ba02444f02e79e5f647fc2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.2/halsim_gui-2023.4.2-linuxx86-64staticdebug.zip",
        sha256 = "a0d0648362674386304f28db07ff5bbc6995867ada4a9f34a7993af3a77f6c50",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.2/halsim_gui-2023.4.2-osxuniversalstaticdebug.zip",
        sha256 = "8abccf31946cd3944ac897e3339e22b41afc445b20634b60744b62966cea740f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.2/halsim_gui-2023.4.2-windowsx86-64staticdebug.zip",
        sha256 = "375be31585027cfa7e5f9f940018d1d100004a5b353bfbab93bc51900374e42a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.2/halsim_ws_client-2023.4.2-sources.zip",
        sha256 = "4444129e55b09e5db53fa0ac643237a1da125fb0147dd11e0606ac9b5ae44676",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.2/halsim_ws_client-2023.4.2-linuxarm32.zip",
        sha256 = "eb4332c3f86478bbab5a07de5a5a4f6fac7fc5bbaf74573579c2ebc50759faaf",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.2/halsim_ws_client-2023.4.2-linuxarm64.zip",
        sha256 = "b6d3da8f3c8fc521d8fca0a5c7dc99cdc15ae394e674be7c3edb0420c13ba5e4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.2/halsim_ws_client-2023.4.2-linuxx86-64.zip",
        sha256 = "285fff4ec89c581bb9b3601d0ad13857a12f66a54393db4d5e59fd6c264c6657",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.2/halsim_ws_client-2023.4.2-osxuniversal.zip",
        sha256 = "33a77b5a3800d9dfbad223cad9728b239e55409500d9813e5e1506424a40c914",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.2/halsim_ws_client-2023.4.2-windowsx86-64.zip",
        sha256 = "0da4543a04d97846e944c46dbdad1a2b1488693a62adca4762d7b221fcb69ce2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.2/halsim_ws_client-2023.4.2-linuxarm32static.zip",
        sha256 = "010a8deae51dfdcb7646b01f6998708155162dba8265c89bac1df3734d3adb76",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.2/halsim_ws_client-2023.4.2-linuxarm64static.zip",
        sha256 = "5349df6902e0dfe6de2ffc9b09e36b0b4c9d74050ff6f9a68e859f7b45e61e56",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.2/halsim_ws_client-2023.4.2-linuxx86-64static.zip",
        sha256 = "89314be316f0b806d0b7970553d97e19c2639c4ad66d63f8495a2f7eef89182c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.2/halsim_ws_client-2023.4.2-osxuniversalstatic.zip",
        sha256 = "80a33ed2ce9876d5774ef98249dbafd825071dc0d7511c4132a45e327f3c9f05",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.2/halsim_ws_client-2023.4.2-windowsx86-64static.zip",
        sha256 = "7718fa95f30b223f8d28bfd916a54787e595662d11328cc82ea31b3bf5ee8d4a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.2/halsim_ws_client-2023.4.2-linuxarm32debug.zip",
        sha256 = "61aeb2b6ab592b4ba0ad3b978f000257d93b09e45f3f1ac6037a7a7e65a5d1da",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.2/halsim_ws_client-2023.4.2-linuxarm64debug.zip",
        sha256 = "7078ddac65a53dc0896ff08c9996c8c9a235abe3ab6669d0a859c051ca9c59da",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.2/halsim_ws_client-2023.4.2-linuxx86-64debug.zip",
        sha256 = "38e801fb4f9505b89276f72317b5922113754b4e266008bddd41db1e6110155c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.2/halsim_ws_client-2023.4.2-osxuniversaldebug.zip",
        sha256 = "f986a4618be07fea34df8a0a71f685fb38a9a5436975852eeb6ef2eba747a5b7",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.2/halsim_ws_client-2023.4.2-windowsx86-64debug.zip",
        sha256 = "e57bff77f910b02f9d7c48c8d3e7e9b846bfc3325211ee120ad0d0140078ade5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.2/halsim_ws_client-2023.4.2-linuxarm32staticdebug.zip",
        sha256 = "23109ec19d882d460cbbbbbad73441082a442a1d3d73a166525d56870ad5e781",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.2/halsim_ws_client-2023.4.2-linuxarm64staticdebug.zip",
        sha256 = "263a6a88cdb9aa18899eebf8e46f77cdcc7ebcc604d475315cc574cb8ec544f5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.2/halsim_ws_client-2023.4.2-linuxx86-64staticdebug.zip",
        sha256 = "e6e90dad4af22a8cd83befd36a01842f004812d3236dab350b647921394561aa",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.2/halsim_ws_client-2023.4.2-osxuniversalstaticdebug.zip",
        sha256 = "bbe5c60c5140151557003444d72e4b325a5cdc1caafaa5ea85f34a5ea59bdff3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.2/halsim_ws_client-2023.4.2-windowsx86-64staticdebug.zip",
        sha256 = "7d58cef83a90b760171105ec50a68ab5bb0d5fd870a75318e7a0324e1a130a8b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.2/halsim_ws_server-2023.4.2-sources.zip",
        sha256 = "582c22b75fba97e6a2027c955d838dfce42b2a83e14ab783fd5d008b221cb695",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.2/halsim_ws_server-2023.4.2-linuxarm32.zip",
        sha256 = "487eac9ba4af5ce81d115cae99213cae01601b7842bc81f019925fc5d7d238a6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.2/halsim_ws_server-2023.4.2-linuxarm64.zip",
        sha256 = "af911c998f9c5775cc5e247a029f5144b4a7b8aad1fe09fa1017a9080d6926a4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.2/halsim_ws_server-2023.4.2-linuxx86-64.zip",
        sha256 = "3d1d02589cf89dc362b5b3d7d99328450d6cac213b2a36ae81a3b68b734ca18a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.2/halsim_ws_server-2023.4.2-osxuniversal.zip",
        sha256 = "6159b1d7d81e2a611faed9d8e784555da2d8f23bf6b5c2a8700503a1c10dc64a",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.2/halsim_ws_server-2023.4.2-windowsx86-64.zip",
        sha256 = "effd5306281ea0db7f476c180a4aaef2058b504191a8bae998019ec308d7c941",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.2/halsim_ws_server-2023.4.2-linuxarm32static.zip",
        sha256 = "65c03be8c6c19418a6ddf9522d0dfa1edad065954769b6d363704753b7e795b6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.2/halsim_ws_server-2023.4.2-linuxarm64static.zip",
        sha256 = "c3c2bad0f6d1cca7079e923e3274ee896d578c23b537e0a27883910c19e271f9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.2/halsim_ws_server-2023.4.2-linuxx86-64static.zip",
        sha256 = "18c0a87c14522904b356e80ab09f72fe8258dd41db9ab9056b7fdb4d97bff874",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.2/halsim_ws_server-2023.4.2-osxuniversalstatic.zip",
        sha256 = "dced5dc5d5928d19b1772facb0f8efbb0f5d2a8ae5e6c9ceff1f9a1a037c60f1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.2/halsim_ws_server-2023.4.2-windowsx86-64static.zip",
        sha256 = "e0344d1d1ad4fa63b218de06b8dac6e28d8b8ce8c4a6bcde0a8a017fd1ea571e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.2/halsim_ws_server-2023.4.2-linuxarm32debug.zip",
        sha256 = "65a2183c47ee8b877c796d5d67c7e72d4e451641518b4e96492b3b7914e9f0d5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.2/halsim_ws_server-2023.4.2-linuxarm64debug.zip",
        sha256 = "8497a7d695d68051b77c8c6bdf4f796d46d9b3c9ac49d0e5dedbea158aeff2a8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.2/halsim_ws_server-2023.4.2-linuxx86-64debug.zip",
        sha256 = "2504dc855df046c79481fc8259c1d06a886cc609a3fa103ec0ce2c45578248a8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.2/halsim_ws_server-2023.4.2-osxuniversaldebug.zip",
        sha256 = "fda39ae3877bee5ac2a45addd4704aa54905895204f7d358fc900d0991724b3b",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.2/halsim_ws_server-2023.4.2-windowsx86-64debug.zip",
        sha256 = "f3f226b45b5e743045f1fae5eda241f3b43ee720cdc8b4c93eaefbf88e337ff5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.2/halsim_ws_server-2023.4.2-linuxarm32staticdebug.zip",
        sha256 = "eed99868b803919af5d91e21e84bf0a471a5f3b6eb0a1ffa866736e24b25d27c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.2/halsim_ws_server-2023.4.2-linuxarm64staticdebug.zip",
        sha256 = "cb41fd22414edb35fc6f914256dca60f21f01d32850171cd69d8a41aa45b28ba",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.2/halsim_ws_server-2023.4.2-linuxx86-64staticdebug.zip",
        sha256 = "b6c4d448c7134f71318b1f05bb68dcc6cc6db15c43c5155986933eac7254269c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.2/halsim_ws_server-2023.4.2-osxuniversalstaticdebug.zip",
        sha256 = "0216964a14fa3ff9776d4209822830c9715550660b4a6b57fb701cf25288a7d1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.2/halsim_ws_server-2023.4.2-windowsx86-64staticdebug.zip",
        sha256 = "e5cd5858383f9f7627b335e5d6b2c42f4e5702802526ba1e4c9ef7d01f504efa",
        build_file_content = cc_library_static,
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2023.4.2/SmartDashboard-2023.4.2-linuxx64.jar",
        sha256 = "c2c92f94ea43bc62207a049082d49721a18427df2ed8163085c8cb91ab28f1af",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2023.4.2/SmartDashboard-2023.4.2-macx64.jar",
        sha256 = "c06baf43ac47267610b626a5247950b900856899844b057ead871a25e671888b",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2023.4.2/SmartDashboard-2023.4.2-winx64.jar",
        sha256 = "52ce0d48e720c15817a5df300b4adfba9f4e6c45d8223541bce87d1c688b45c0",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.4.2/PathWeaver-2023.4.2-linuxarm32.jar",
        sha256 = "252246cd9aee6a1df776a4b89354d09d601b942f4728176d198c2026a66d3396",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.4.2/PathWeaver-2023.4.2-linuxarm64.jar",
        sha256 = "fe2ba96fdaa96d270e71cd418a3c84c559ce679f0c1e9346b3847e02236ca62b",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.4.2/PathWeaver-2023.4.2-linuxx64.jar",
        sha256 = "1a8c98179e216b67521beaf0e94eba43b1de651a102dbb1169a4811db56599aa",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.4.2/PathWeaver-2023.4.2-macx64.jar",
        sha256 = "097b0e5781760fdbfc0df9d8efe6b5053d26363099df3e812d7214ddb28b7773",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.4.2/PathWeaver-2023.4.2-winx64.jar",
        sha256 = "4bdb5cda553980872b846516e2a5ed5e6ab946c0d98b0b15c668a580c722ecb0",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2023.4.2/RobotBuilder-2023.4.2.jar",
        sha256 = "cd3f6948a4fdfdee292711bbdc897189ca4661f39773203740605e4705d1a97e",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.4.2/Shuffleboard-2023.4.2-linuxarm32.jar",
        sha256 = "20e4036447f975f085702edd114eb6c47a09774c141c498d24ac79792a76c982",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.4.2/Shuffleboard-2023.4.2-linuxarm64.jar",
        sha256 = "078b7ff5cbb55fa4ad5031cd4afc8109bb6ec5d06ba33060399af6c9019cf9a6",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.4.2/Shuffleboard-2023.4.2-linuxx64.jar",
        sha256 = "f0d4404c7a779d5956f7c1ddf964d1c376da45c509473bc3c00fcff1470ad64f",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.4.2/Shuffleboard-2023.4.2-macarm64.jar",
        sha256 = "366247dcbd728c51981e8674c2472e0b35e314a2b126be758aa9ccffa8ad47a8",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.4.2/Shuffleboard-2023.4.2-macx64.jar",
        sha256 = "77eca553f574f1878a135ac2f9ec63eb304dba16cf54a9e64eaf682abf4f1b75",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.4.2/Shuffleboard-2023.4.2-winx64.jar",
        sha256 = "2c22f536cceafca9764474e81568a259738c27b10044db06d0e2bf67893e7bc6",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.4.2/Glass-2023.4.2-linuxarm32.zip",
        sha256 = "d6d6e0c967700a2c3401e57fc0782a76239f7aaddff99b6f5f2a69080b88a27c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.4.2/Glass-2023.4.2-linuxarm64.zip",
        sha256 = "507ee5407c879f8260db17fdd937c21f1e3986788a2d5cbca4e1180669fa6b14",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.4.2/Glass-2023.4.2-linuxx86-64.zip",
        sha256 = "89116c333bf9e0f8327578b6a7c2476524ad8d3911e389222c6f1bcd6fce58b6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.4.2/Glass-2023.4.2-osxuniversal.zip",
        sha256 = "ccccd7b6c401b8bec88f9e11b442cac8d5ceebec837e78aff1bf1ec2ba17f1e6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.4.2/Glass-2023.4.2-windowsx86-64.zip",
        sha256 = "e165b9abd5818c50e0d7f0af317dbf6711077db5a636c279a1d452bdfd0b2eba",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.4.2/OutlineViewer-2023.4.2-linuxarm32.zip",
        sha256 = "ba0e82fac454f3a2956c364ba58744e0061444430d2dff84d2611631c8556dc0",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.4.2/OutlineViewer-2023.4.2-linuxarm64.zip",
        sha256 = "52cced09825128d67bfd3c5ce6f825138556cadb5aa494020394f83dc2dda6aa",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.4.2/OutlineViewer-2023.4.2-linuxx86-64.zip",
        sha256 = "88b98c56544fd9767746aa58cb702ad0d01351dea9d102b9e6185897e7ca9881",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.4.2/OutlineViewer-2023.4.2-osxuniversal.zip",
        sha256 = "51289160237e1fb2d418eaf553700197e1c1fcb671c6ee93d5a33988e7e4ea4b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.4.2/OutlineViewer-2023.4.2-windowsx86-64.zip",
        sha256 = "31fb17f70b637dd9a96c7034681c2f102e3a7c5e343d13eec7f361fc28c24236",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.4.2/roboRIOTeamNumberSetter-2023.4.2-linuxarm32.zip",
        sha256 = "1cc9af1950462fe26debaa810cf0fbf6f3a4a4c736314e87e6cea3c05851191b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.4.2/roboRIOTeamNumberSetter-2023.4.2-linuxarm64.zip",
        sha256 = "05febf5c7ea65e9b2844a3a5c4056b3461b63f423bab89ed31c1ad99257a422e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.4.2/roboRIOTeamNumberSetter-2023.4.2-linuxx86-64.zip",
        sha256 = "a7258c70dd169d2d982f4fe0d26bb43e821ecead582185e529be92a7cc748c46",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.4.2/roboRIOTeamNumberSetter-2023.4.2-osxuniversal.zip",
        sha256 = "87840ffe060be367d077ef8595250bb0e0e1deda3562d00ee837257062718253",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.4.2/roboRIOTeamNumberSetter-2023.4.2-windowsx86-64.zip",
        sha256 = "b32bf649e84377c12fb95a9edc3ca3921bf00bdbdd45dbcfb9dabd77e4b05122",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.4.2/DataLogTool-2023.4.2-linuxarm32.zip",
        sha256 = "3ce2c7c8691bce7fce98d58d69779ae5e6df19b166e7fe9c2f4ba8f8c381d74d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.4.2/DataLogTool-2023.4.2-linuxarm64.zip",
        sha256 = "95e3a8a33da995e6d147f0befeb5b73fbf636336fab89a678be23c00d8df6621",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.4.2/DataLogTool-2023.4.2-linuxx86-64.zip",
        sha256 = "02a24eb526b3275faf90445953e8d55293092315054f0c83186daccb935d3028",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.4.2/DataLogTool-2023.4.2-osxuniversal.zip",
        sha256 = "47d59d8b9a52f8d4a2625380dd3ed7dd538406acba139f512e28b8a23bdc349d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.4.2/DataLogTool-2023.4.2-windowsx86-64.zip",
        sha256 = "c0e9d337746f6c78df9b66791b689a910229631fe43abbe5e970a6c8fae4b496",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2023.4.2/SysId-2023.4.2-linuxx86-64.zip",
        sha256 = "17e79d9da8281e3256925d179ca99cc108d3fe3acd35c0c7b5bfc666f776ca67",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2023.4.2/SysId-2023.4.2-osxuniversal.zip",
        sha256 = "fa30d4c75dcdb05c8fb1eea590132b3f00c03938dff353816fe2cd0e43896071",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2023.4.2/SysId-2023.4.2-windowsx86-64.zip",
        sha256 = "e7677e1333e9279feb6e8e46d77a5082ab1cd275a0674e4957a0a32bdf9f2ed0",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
