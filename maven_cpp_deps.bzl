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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-headers.zip",
        sha256 = "313253874f331dcf9c156082c760d5c0cec9f3371ed6d79155ec63b2e17113e9",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-sources.zip",
        sha256 = "e5564bd272578026c586fc3f87669f3927939b6573db8e915023373cac05052f",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-linuxarm32.zip",
        sha256 = "b9829eca1da4df015c4682d027e8f37b5cdbceeacbc2a31bde0e39dfac949ea4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-linuxarm64.zip",
        sha256 = "e0f7ae7453e043f6d460a73e9752e1bb2c352bb28d6950082ad2a2d0a298759f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-linuxx86-64.zip",
        sha256 = "5d55a0fdb1f65ea6d571750a0afa293d5c677036d3332d286b1e983eb4952066",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-osxuniversal.zip",
        sha256 = "7e423aef50168ca29817bf00edf2f60d91ccc3c7d79fc6d0a4d4649323716fbd",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-windowsx86-64.zip",
        sha256 = "0d03e90f88a362734c3028de71a54cc42056f235ef396ccaf65e8ea97e486ee6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-windowsarm64.zip",
        sha256 = "5bd871d2e30579bb96161fbf367eccc1551fb6ec32ca29e6ec32b3b0c5e31d4c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-linuxarm32static.zip",
        sha256 = "4dd199925705834d4b521cf426628264749f3b1e960a8666225c69cd8c808ddd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-linuxarm64static.zip",
        sha256 = "9efcf2a45c52aa6de76075139671f8ed8995b6912d7be04c712306f2a66f5e1f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-linuxx86-64static.zip",
        sha256 = "3009238c5a177ab51bc7f4d6b704a68673f0e441c39ff5b982d822d750dd9180",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-osxuniversalstatic.zip",
        sha256 = "230a63b8ce5593b8c5bfa82f880259da4aed87e741e286dc5e181ebd0f6ff00b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-windowsx86-64static.zip",
        sha256 = "18e0924e007820235a7f8ba7588a2928a3cff6e27e6ba012589e1420d453aaad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-windowsarm64static.zip",
        sha256 = "9e1c8379f3215f86224a13611360ce7b59dfa590f46f76405ac227cfec59684c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-linuxarm32debug.zip",
        sha256 = "fff7655a73a4f6df7d30447d24635b187d6e417dba3c8eaa3d38968b3911d93f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-linuxarm64debug.zip",
        sha256 = "d5c41b3552395df85cef2337a6f15720f808e70e422093ee4be9fc8f1059f4f6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-linuxx86-64debug.zip",
        sha256 = "b7862849b4ee39e775e053c71c3b4d067ad0176f378a9af2856806dfe9bf9899",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-osxuniversaldebug.zip",
        sha256 = "6a727163645edcd4e5bce00590a03ea6cb0bc537c38136cda399c6bee041be70",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-windowsx86-64debug.zip",
        sha256 = "783e958aed08cc5cfbe890ff4f2b359d9f44e9ce20608764a8a306c1d8cf2c75",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-windowsarm64debug.zip",
        sha256 = "12d62dc71794c9dc787f3ad47ccfd906cbb4b719807f4a955291c196f2b4a32c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-linuxarm32staticdebug.zip",
        sha256 = "6e1c0cbdac1f836455b88f901b98ae643aa6d89db09ca232daa928771596eede",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-linuxarm64staticdebug.zip",
        sha256 = "6e16dfcf762fa15f906dcfe647735244f080362f80e7e4baa3096aaf33bd0935",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-linuxx86-64staticdebug.zip",
        sha256 = "7a652df1a29c5e8710f3849629908015d23719fb89c39e52db673fb16bc1fe53",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-osxuniversalstaticdebug.zip",
        sha256 = "df7b32d557b6589a906325d5d8deb81b393ef9356e89bcd1aa0fcf64a9967180",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-windowsx86-64staticdebug.zip",
        sha256 = "09c86d26698c2cca709e094a9424845f9917a0c3865165356ddee40ed5d26699",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-windowsarm64staticdebug.zip",
        sha256 = "616f37a618fc210730576075e9fb721304f3ebbf0664193c6580146660f5bc89",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-linuxathena.zip",
        sha256 = "010cfcc98d21929a432da4fa0e5d8447dd676ae3e5df2186f4d579120d1c5af6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-linuxathenastatic.zip",
        sha256 = "b70254dac1c08d7461daad468de7b7088fc7707addc36ca19a7de158797956df",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-linuxathenadebug.zip",
        sha256 = "1b9bd7ca20593313f37a9043631c3a9ccb4f16709e2d4374d82d911aee398663",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1/wpiutil-cpp-2024.1.1-linuxathenastaticdebug.zip",
        sha256 = "3a32c015a2929d8d375df05abe1155d2d64e125f9556fd7e288e3ff283011167",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-headers.zip",
        sha256 = "4930ca364a4b6517c368da5bb102491288e77f1c178108182f7528a9e3c875f2",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-sources.zip",
        sha256 = "094778e1f862fcb4e209fa1f9cc4dd6caada5e3542dca2bdbd4ca20d91b124c9",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-linuxarm32.zip",
        sha256 = "a1a7f2a19486b8387f443a8700a4d16785af9febc88df2ec4335f74fc32ef4c4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-linuxarm64.zip",
        sha256 = "ed1f9fbf289522a1857b95b74f13c0524ba5ffc76e566f6c611f6d8f50faf438",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-linuxx86-64.zip",
        sha256 = "7a8cb0ffbbb9f9e79abc90e4e266467c85ea63caa931b42024668f21ee28bd7c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-osxuniversal.zip",
        sha256 = "d328bcc2b85d9783cf518bafbdee9cefc3d9581835fbd69de209231e3abbdd04",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-windowsx86-64.zip",
        sha256 = "3b0d413205d335caa05f2f8e052e140c9fccc3d07babe7b1823c8d6f02a0502e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-windowsarm64.zip",
        sha256 = "c5f7fd8c4f22b0c7737a54f0711a9c81cd059cc9ba13dd8eb3604575fff6262c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-linuxarm32static.zip",
        sha256 = "9640b7ff27e65874acc0a8b192c5febaa72bf49608422ec30739048cadb395e0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-linuxarm64static.zip",
        sha256 = "81bbf17d36dbb7581c5afd8062332a42a674ad67fffa97f6fa222b551cd10f42",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-linuxx86-64static.zip",
        sha256 = "4d22ce523f6e21388d3325e3f19d7fadec920d92024e328412f27c4a71b6aad9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-osxuniversalstatic.zip",
        sha256 = "ce990cc4f97fc8a3659c71a6f57df6adfaf31fa5bbe16f125f42437ec9ee2beb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-windowsx86-64static.zip",
        sha256 = "276050a64bcb4ece6b0fa30b38be18efe582a66306ebb4c61b24e922910f2209",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-windowsarm64static.zip",
        sha256 = "72284cecee6d16832412f6d6d21ce0a0d7c81f52913daa19c3370abd58ed0eb8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-linuxarm32debug.zip",
        sha256 = "a20ed5d8e9367a2362589b0c29daab17ebdac33071bb0b0787d24b29a9d3f6dd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-linuxarm64debug.zip",
        sha256 = "504a66caa9992721c258fd60b1ee156d46b1d97652571d38f792af07d13a8261",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-linuxx86-64debug.zip",
        sha256 = "a5106c6d1dcbd36739dee7090446e02667b1480189be216143a2a931c53125e6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-osxuniversaldebug.zip",
        sha256 = "6bbc4278ae57c6c48896750e6e4bfaa0ce4653183aa2207aecc8b5992d75b4a7",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-windowsx86-64debug.zip",
        sha256 = "720f9c24b9b93c9f918f23be4d010fc67ea5a1fa023d02bf588d22b057d8db0d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-windowsarm64debug.zip",
        sha256 = "17a20aa6589f718eb0be046235bd0558a18982bfe4d3ab2d190371179f167b57",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-linuxarm32staticdebug.zip",
        sha256 = "0680cc8056fb71c5e6d7b1595b61784f0c0c5fb1f3c957be43f6040a035efbff",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-linuxarm64staticdebug.zip",
        sha256 = "fc9f23d4f2e6ca18af2217a0f82baa4018d9c47d97399fa043dc784f16c30e9f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-linuxx86-64staticdebug.zip",
        sha256 = "b081284a88c4bfbbf7e1a344f5d4ad6ba02f4b5b804f5d452197ac04308ac73f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-osxuniversalstaticdebug.zip",
        sha256 = "400c4040862cbba3aab5ceebac05c563457abbfd24990cf372b13edebe59608b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-windowsx86-64staticdebug.zip",
        sha256 = "aa433ee01db08c3be456b90966a7cb875dc8c2dd98b2fec696087915295a5489",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-windowsarm64staticdebug.zip",
        sha256 = "894eef84732fe990cb14071956768d6bfe689503d533dd3a05eb83d1b9ce7d8b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-linuxathena.zip",
        sha256 = "ceb73a0aca032f19b47129fd98ee3c481b6f2ff2ce3cbc0490924fbf5e13a3b8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-linuxathenastatic.zip",
        sha256 = "a9208df9fa20c2bc90030b73e13c0b2f328d64d68fc2255c4290aefa4f041a3c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-linuxathenadebug.zip",
        sha256 = "0427e84fa6e1902315716e903d6c59231d53121aecb6cdcc53dbb51e68b1c60c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1/wpinet-cpp-2024.1.1-linuxathenastaticdebug.zip",
        sha256 = "7e6546e1755c905b042ecae791d64a40b8f85f3a457926ff6ec3be7beb3278bb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-headers.zip",
        sha256 = "84b10265246f7e666cba887b93f8dafa38b90a2feb5b2894a5d1847cbd8d08fb",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-sources.zip",
        sha256 = "f3cd2e51357f970dedc6338f20543e8700e0d568f925b862b75663ea21c81d64",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-linuxarm32.zip",
        sha256 = "5879e9c4596d538ac0365a40b34940cee9d5aa7e27a3218f75b44e84d6ea9272",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-linuxarm64.zip",
        sha256 = "038bef732440e4ee10b32f7582c638441b02d52bc043f993d6af56aa51a6c28b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-linuxx86-64.zip",
        sha256 = "e98e9b08de8fe608c8828a2cbf7efd7e9b864022c878ee31e3b1f82974e29777",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-osxuniversal.zip",
        sha256 = "993685e0afad3a8d279bc289bb70b48dfd752a94a087c640a8e9fd2ff4ddf44c",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-windowsx86-64.zip",
        sha256 = "bea5227fa5380545b051576bf1d1c1bad6beb164a8d7ab0a5f5c8769620f703e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-windowsarm64.zip",
        sha256 = "b5173d0334bcd105577787c0002bdff69e6fb097faeb298260cff8590bb584b9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-linuxarm32static.zip",
        sha256 = "d4bd896b13bd19e4ea9131afc42469e80d8b80768466adc9aef4acc17c5c1ce1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-linuxarm64static.zip",
        sha256 = "5cdcb8e3d531677fdcdf26d68af6e3696fcd45230706b1d397e1c05d1adaf3d9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-linuxx86-64static.zip",
        sha256 = "616a5ce858fa9025b1b9936b1b3d38200348ccac960f656e2f32700b15dbe343",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-osxuniversalstatic.zip",
        sha256 = "f641426b83c2ecac76e670d84caa510c627dc0294758f893892b5608aae38abf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-windowsx86-64static.zip",
        sha256 = "02ddee78b28693de9a2e61aba199e221c73c2e4f6f54a93cb9ace6e93e7fb5d3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-windowsarm64static.zip",
        sha256 = "1e2e47d02692348ba9d4cbf3c2124ced1b39f015ade5b8cfde06f413bf19764b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-linuxarm32debug.zip",
        sha256 = "cd4a018ef4d0d7879605ef9e29e199e70a28711f1a929d4b7d96d7ca8af864b4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-linuxarm64debug.zip",
        sha256 = "fd095350b2b47a58e62ca86c08ef0740b06b938362127d59039e72e192b572c3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-linuxx86-64debug.zip",
        sha256 = "faaa0b3722457bd20d9b54256a9112fd69a7285dd9cbdeff50b25cead3a06619",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-osxuniversaldebug.zip",
        sha256 = "d713bbc274768c1f454ab135e068aedd424ac78163ef47c326fb516a9b4e4140",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-windowsx86-64debug.zip",
        sha256 = "7ede43caf26b1f9c67d24de3aed205315b9bc357143625dc7040ebd8c57acea0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-windowsarm64debug.zip",
        sha256 = "eff8d41660568b0b7bc695dccd5603e99552d97c051e80073deaa7c78ab68ee0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-linuxarm32staticdebug.zip",
        sha256 = "252a3edf14b2fcd28d26bb08c5b0249f88c684fb3ca429dd2c9a98a147c9460b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-linuxarm64staticdebug.zip",
        sha256 = "7342d353cc0ece95b9df853be2944b589646e49d5c3d11dfd9aaaef9821880a3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-linuxx86-64staticdebug.zip",
        sha256 = "14f36ab755f59dba0866894975d9c82a60eecf05b5462a81993e1bb88d962ffd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-osxuniversalstaticdebug.zip",
        sha256 = "87450424824d7d2bd7fbb254ac7eb016c5c9aac6c0e0706e7de23fa4296d7e36",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-windowsx86-64staticdebug.zip",
        sha256 = "a8972a77772c83e9241785b19e456337e1308b8715fbfd70755691db283505de",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-windowsarm64staticdebug.zip",
        sha256 = "533662baeef1495c4e107255f410211e2e0c9ca89a7a84a9026e4381fb78e363",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-linuxathena.zip",
        sha256 = "ba152e6f2de0289f5980e37d387a6fb0ce47ac11cfac841597fc2dcae807e106",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-linuxathenastatic.zip",
        sha256 = "7b7e208e51a999441fea2e0ae76ef7ccd5e95ee816f7777604676e8357d63282",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-linuxathenadebug.zip",
        sha256 = "ed5ef2fdaf1f659a5e1b35f6fdaa8a75c18233be997c088c591d48762c1e4885",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1/wpimath-cpp-2024.1.1-linuxathenastaticdebug.zip",
        sha256 = "d33fa58967e684eda309f8b4d70a82e4609624cf22b3f5cc484a523ede389bb7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-headers.zip",
        sha256 = "ed42690c003c93c643649c3213f3dc56f946866f6fb401ae92d0f9bda78efd87",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-sources.zip",
        sha256 = "aeb9a67016df234249ae5075600d893a79127fb06ef91c02702f3ba3f523097b",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-linuxarm32.zip",
        sha256 = "3493f5a2e844b2af0a38026e79dac27733073ca3472aa2c4826529e3c18576e3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-linuxarm64.zip",
        sha256 = "c5d561fbfb0a2553ee3e922732a1d77f532cacb255199daf7d6db6fd4358790b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-linuxx86-64.zip",
        sha256 = "fe1e21c407b66e5c986a20578a3a1fb52a6609a56df90b6e97abd7ef352dbde7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-osxuniversal.zip",
        sha256 = "1dfc67d6de6a02cbcb709a25b96167c15119975b17b8df07bec97ff8c5e4df99",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-windowsx86-64.zip",
        sha256 = "7184314279514bf974900840a4d4ce3315befeac6dc732c63acf2a7dbc140be2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-windowsarm64.zip",
        sha256 = "6bb466aabd2f092a5533f477c1b3ec9d2af21f94366ff0b36cebf2784f7a48e9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-linuxarm32static.zip",
        sha256 = "d9a7fb1885bb28e16046b57a5674178c205ce69554512d68cc3834bfbd9b9542",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-linuxarm64static.zip",
        sha256 = "277440aead4e015b889148e8bd7aff1676ce007574d88e217a0e30cf1bc6590d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-linuxx86-64static.zip",
        sha256 = "a1765bba7ff7e8bbe354033b34fdac4a859b37f3a90cfca331ba4dad15846aa2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-osxuniversalstatic.zip",
        sha256 = "4675bbcebe031bdf361b7d9f2e13abab4c656502da3c75e1d42f7efd3e0a5554",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-windowsx86-64static.zip",
        sha256 = "22495028b4b6160024a2797578aa8613f95310424a043cb9ca5a295496fbe04d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-windowsarm64static.zip",
        sha256 = "d5018d54f08515df6138722e0684e11745eed987d838866d6a1fa72f4380453b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-linuxarm32debug.zip",
        sha256 = "14448803a518437307692fbf1e03a30741e8a567a9f1692feb5e6266ca3de91b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-linuxarm64debug.zip",
        sha256 = "754e30ce16066d5d0ddf0033cf2752f395fa96505b210aeb4716789c61bc604e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-linuxx86-64debug.zip",
        sha256 = "a6aa7b2a312b7d0046c3ae836c1517e76c23661a8bfb28ad4bdd4dbce0cc28dc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-osxuniversaldebug.zip",
        sha256 = "69c164dd2753290c04948724331b98403c3759f1e7d01728f6dac5c8bff59422",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-windowsx86-64debug.zip",
        sha256 = "018eb88dae4538e2bbc70128c4affa85c8a1dadc8fbfaa2e58829ebdbd62e605",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-windowsarm64debug.zip",
        sha256 = "777450855299660e77a5039ff96d1d2c6eb8e3b00bbff920d1affb0b3d216242",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-linuxarm32staticdebug.zip",
        sha256 = "3cc997dbab873473151345c75530616ae677438aaaa74f00d7d0d6317b092b96",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-linuxarm64staticdebug.zip",
        sha256 = "030fe31b5e02c6e9012f79553e69343fac1a733351284d4ced12c503901e39a0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-linuxx86-64staticdebug.zip",
        sha256 = "c21b5412ade49d2708bb3d596a15f9115e124b71c092e2af6160b9375f35a39c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-osxuniversalstaticdebug.zip",
        sha256 = "dcf68a1584d4bf37f0d066ce5818c072971bb96a25f9ad0f6746ea06b2d42478",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-windowsx86-64staticdebug.zip",
        sha256 = "8f6b7b4fc8b3675a4df4ebca533d1cfe0f92e5994bfc33253f933b1282b23976",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-windowsarm64staticdebug.zip",
        sha256 = "c895d50e7ce799a4c7f3f653cc8c4ab830976474c12761615ed3242e394b8c21",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-linuxathena.zip",
        sha256 = "3306fce86062dd6753494940dba8b3a317e0717836e42b543f2af847d828502d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-linuxathenastatic.zip",
        sha256 = "05691cfdb86a244512564a2c2cd6581c10fd3b3344e9b2a2744c174bf51e0dd4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-linuxathenadebug.zip",
        sha256 = "7ff4acff3b5576308a68b64b675d4a957c1823bfe83e6a929d8c964304dc1bd2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1/apriltag-cpp-2024.1.1-linuxathenastaticdebug.zip",
        sha256 = "3ee2e4f0efde9419f7700af203f58f52ab3fdb8d68f1ff32494729f4b99b3af4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-headers.zip",
        sha256 = "d05521c6ea407c1b6cf8e05b61d8f85a3372cebeef59f098631b9a6b3ccee439",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-sources.zip",
        sha256 = "5cbe9b5440b4f7fd97b76e3c39d92fc301f2b83e573e810cff36bd783d3a2c56",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-linuxarm32.zip",
        sha256 = "54209f24a8ddac9649d358c6f2e41a49addc14f5106d24b55589d3e5841342df",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-linuxarm64.zip",
        sha256 = "4bd65f4bfc87aceb6501ed3ab14bf05f79f73cc2c39babef14c5b5e618b358ed",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-linuxx86-64.zip",
        sha256 = "26535cf7ba25ac96b00f7fd73fe04142e955eab51c30ea2dd0dedf46b2c34889",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-osxuniversal.zip",
        sha256 = "ad85f8733cc0eba8c4ca443356c2419912fbdce6d9023f394bc796189378d7d0",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-windowsx86-64.zip",
        sha256 = "113597d06fa4877681f13d80a87a746bdfd7606fadb44c9e83eb37147f4f900a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-windowsarm64.zip",
        sha256 = "4089559f66ff68bbd9c18c295391af09e3fa3124d9e213812230f918da75621f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-linuxarm32static.zip",
        sha256 = "900c946f9f73a9b12975da637cafad9fbea8fe609d5969d9a72f7f57a064ac0a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-linuxarm64static.zip",
        sha256 = "244f75da82d5e92f1f03aa00a1cf3e491312e7b1b88ec434895739d165ba4d83",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-linuxx86-64static.zip",
        sha256 = "53feab45a707e06f5c7882c074c3002a5e04e24f4ca1f99dfa9dcbe1a97dd23a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-osxuniversalstatic.zip",
        sha256 = "9cfac3c026f5114dd73bf85b7149731ec2c43ddedd13831a685df762d398d60c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-windowsx86-64static.zip",
        sha256 = "495867db35da607812bfa362c01e2bb9cb3487a1d05cf484ba854edccb9b99ce",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-windowsarm64static.zip",
        sha256 = "08b4d5505ce95638526aeaf1faa6517a8bcfcb2421e9fdf1b22a05182ac34125",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-linuxarm32debug.zip",
        sha256 = "462f080f58ca290c54c11be9409840bfb7ba915993d357c134bd1da975e053ab",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-linuxarm64debug.zip",
        sha256 = "2da2cc80b621f6453682685596ee8d8c144d9265f98db536fba78765e43fc15d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-linuxx86-64debug.zip",
        sha256 = "b3d1c17cfd52a61e216475c1462264bf1ca512cdc615be7381b86f996864ad8a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-osxuniversaldebug.zip",
        sha256 = "b226b25f9502df72e750185548b8a58f01a14b0618dcf76edc028ea8f66ec195",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-windowsx86-64debug.zip",
        sha256 = "6c23dec783dc5e97e95f7ff7eb62fd60bcd476439d51b438212a339ea45f4209",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-windowsarm64debug.zip",
        sha256 = "5923425591e405ff194990273be2be38ebe6b55d16824e852a1fa5b9ba5af337",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-linuxarm32staticdebug.zip",
        sha256 = "255f4fb8a13b33f9fa51a75b820a673cf1db65f9d25d7027f09a881e751e2b40",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-linuxarm64staticdebug.zip",
        sha256 = "7d984877376d41d73575ac318934f870c3e06a4dfc2180bd95c8baef078b34fd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-linuxx86-64staticdebug.zip",
        sha256 = "60a8ae538d74ca10b22a6efd2ea8ac99b9e442f3e222e6807830f0196f38786d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-osxuniversalstaticdebug.zip",
        sha256 = "dcad156529a4f5247ca18dbd6438bdb63a41097d491145250711956af2c2e547",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-windowsx86-64staticdebug.zip",
        sha256 = "c80cd7a7e794fa2583bcd615013f3df168149a1fafd829b6f5750f37867bf177",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-windowsarm64staticdebug.zip",
        sha256 = "68ff54071adc5dcc15cb809f884c608e96ab0c253f4f7550589ad414be221e24",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-linuxathena.zip",
        sha256 = "4de8d6302261ee96946d23eeb57145858a15059be14817ac5037e56dc73c67e6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-linuxathenastatic.zip",
        sha256 = "0666e446224662b618c8b40693da6728d8f60a00cdc4950581c1c607e08aa300",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-linuxathenadebug.zip",
        sha256 = "bc8bebbf5864709b0029cbe0c48fcef3920387bae58fdc45433d05ebc9f01e25",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1/hal-cpp-2024.1.1-linuxathenastaticdebug.zip",
        sha256 = "9bdd0c922f9004bd36b2df39e4e37cab62727c8ced4211fa33c47d0dd1c7a92e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-headers.zip",
        sha256 = "cf60a74daafed9985c1e8068d7abfb74e2bae92e7460537d2d9a4b8a4f975c0f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-sources.zip",
        sha256 = "dbe0c5a866fc8cfa191e8866c3ab234b92e741e00c2f3d6686aaac09008409d6",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-linuxarm32.zip",
        sha256 = "a06fdec5e81dcd58e49e9a0983877638afd7ff34780006933326a649a3e64cfe",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-linuxarm64.zip",
        sha256 = "2886ada22c780da6a4c539e04f088fdce2ee737cb2d3c471dad9579ebaf7ace7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-linuxx86-64.zip",
        sha256 = "c98df3807e159cb95b413b7139d754e0dfc8781ef663816714b8813cdaac7f90",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-osxuniversal.zip",
        sha256 = "9e56ad3bbd39523612493f541c766792cfc6f974f5f03de4c1a01cb80063e80e",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-windowsx86-64.zip",
        sha256 = "22c8f7b3ebd8c5350394b3770a9a3c29da3f6f4aac2b04d0e646b697598466cd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-windowsarm64.zip",
        sha256 = "02488712546a647c15b9073fb9b8642eaa12dd2736bf4efe8dad396cf63fbc0c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-linuxarm32static.zip",
        sha256 = "3b63859ec67d1f6228409a061b2f92b1551c5617e0170544e847aa2de7ea2a54",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-linuxarm64static.zip",
        sha256 = "fa4b818e8cc9ba167553db9dd319285dcb0131e66f3103d890b5196462f5e48d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-linuxx86-64static.zip",
        sha256 = "24681d01dc1ed2ec734a9496d44bdc730cbd555744a137ceb4f02fd5b6dc6cfc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-osxuniversalstatic.zip",
        sha256 = "5713ad8f6b2704b81ceec2933fa34b1830a5d8792935ed3c2dd9363f92d93810",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-windowsx86-64static.zip",
        sha256 = "eb3456b403608ecc9fdc896d166f2fa49bed3d2a5f956d1affe60bda04f17e30",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-windowsarm64static.zip",
        sha256 = "76aa19dd1d3b116013609cf1b782f08460753bec32580b264e2b40631a66ec42",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-linuxarm32debug.zip",
        sha256 = "6ae7b4985986c1fbcbc508044cadca68a026dc1d3082b9b3baa593a12b00aa48",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-linuxarm64debug.zip",
        sha256 = "deba2729b607c16faa56f1938ea3e09c940ed4d974d069bbd628330522a3ea3b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-linuxx86-64debug.zip",
        sha256 = "853a2863b864ba71fa319452f20070ed4b50bbb4382c9402d2dca21c72f31a2a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-osxuniversaldebug.zip",
        sha256 = "34251937841879953c215bb781da96f4d8aea35f8cfd6f900233f4a1aa3b875b",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-windowsx86-64debug.zip",
        sha256 = "e33feb8d00d655099555cb4e30069bb3310b370c182746bbe7a98ac05279c09d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-windowsarm64debug.zip",
        sha256 = "0a9192464f8508daf61fecbe74e956878171a6ff04be4767a5be42e5e3f949a2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-linuxarm32staticdebug.zip",
        sha256 = "d15715f015d3052cca09788ab7f1d7c301c873a7d272bfab2cfcb9575fdefb54",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-linuxarm64staticdebug.zip",
        sha256 = "43948dcec81b51d771cd5f8225e729b71e29cec45558ca2884da3dcb46de3269",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-linuxx86-64staticdebug.zip",
        sha256 = "f85f58706285ce8e4ffb87cd2a266c56322f5779510ec6ac05bf4a9acc29362f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-osxuniversalstaticdebug.zip",
        sha256 = "6d0625bf176b54108fced0e3f250fd69e08a88b0cbc42008c4579d773a96be9e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-windowsx86-64staticdebug.zip",
        sha256 = "175e5470b6d84972556a62b4cf3a4c5a07734a61842f490b891b6a5a2fe7d0bf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-windowsarm64staticdebug.zip",
        sha256 = "594f125226e971f011b044298a5b188dbe2df4cd42b5d3c805755473e44e378e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-linuxathena.zip",
        sha256 = "d882bbe5e52ffce71e8cd5f72b0f12579b32691d3cfeb8ad35b81c0aaa7d644c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-linuxathenastatic.zip",
        sha256 = "97369c46a9ecf76b5077e815215a7d16d17955b69500155507e1b61805bb4a6a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-linuxathenadebug.zip",
        sha256 = "503e0ad039e04e7b026a912542dbb4735e3124a5399efa83486343dc34093b56",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1/ntcore-cpp-2024.1.1-linuxathenastaticdebug.zip",
        sha256 = "cd6562a02c3708ff25b549a2874176ec0ac89f190a0518be6b8e7f1a1083e673",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-headers.zip",
        sha256 = "e53e536fca5e703a8ea63713cb60f48f2361a5ed78a4da547e863ced69043470",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-sources.zip",
        sha256 = "23f7dcca321dfefdea02048fdb8e9d6c835565a813b5d6e9393e3f367a9242d0",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-linuxarm32.zip",
        sha256 = "d434139bed5739dfcc673b5f8d3e45b406cd3894c88766a8e2465f27f6f4e783",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-linuxarm64.zip",
        sha256 = "db3e92c91abdc2cef6e1cf8c4663e00c12a8f6161e0efb2a09b1750e839207ac",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-linuxx86-64.zip",
        sha256 = "079730ada6d4969a73411000b610f4bd3bd4ce6e9206191d28d44d1564c99447",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-osxuniversal.zip",
        sha256 = "74f80898d0788eb634ca7c97d174b6ff459b5371457fb5cc98390f2580850203",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-windowsx86-64.zip",
        sha256 = "e3bc4ed135605ce50f2445bbf27474c1463f12efb5ae0f4d6284aed1e2cef0d5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-windowsarm64.zip",
        sha256 = "8789fa79893ecc118c3d4ebaa80fce84a51fc9ef7cadd8708550755236ba3896",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-linuxarm32static.zip",
        sha256 = "943ddbdd76e31bcdc2e87e30cf861b5d8210c0e8f30b8e0f6b4b06f0c84cda2d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-linuxarm64static.zip",
        sha256 = "d93aed5805433687e5d4450a023f2beb6e4a79e06ba5fdf771b20ea4993cba2d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-linuxx86-64static.zip",
        sha256 = "ea230eecc37febea2d812c698d7b2241cfc4faf98fb077a6f195516e1b0cb61a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-osxuniversalstatic.zip",
        sha256 = "4a44205a1506a8bda9d324fee7fdaa8760f6314c5386e90249744e2eb94db57f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-windowsx86-64static.zip",
        sha256 = "d9c9cb8c8331ecef7bb04889854ca7e072c8f3fc98092b04d2769eba1cf774a5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-windowsarm64static.zip",
        sha256 = "aa59711680ecdde8c94e91da2aae3801d85d3482509372e74bef0ee63fc88dbf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-linuxarm32debug.zip",
        sha256 = "c1208dc0b1a68cfdac95b793c0448bf7bfbded0d67b68b518b1a631eea646ae7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-linuxarm64debug.zip",
        sha256 = "1d46cf9cb2d449ae3605de00b84cf75439216cfc11d226faa828cd9f49bd22fe",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-linuxx86-64debug.zip",
        sha256 = "79d0dc4a12662719130660f10a4d10a25cd97a114dd90b10658f3803a9a4b0f8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-osxuniversaldebug.zip",
        sha256 = "153ef197d9a8e6111e9f3e3ee6ddff72e2443686c9262588c0e17c0089fbd9d6",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-windowsx86-64debug.zip",
        sha256 = "3d0390efdf16b15e72dc42268386bddda9d022f1baf2a68ec97cb6f13742cb96",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-windowsarm64debug.zip",
        sha256 = "01847cb7118fc918fad275c3a050b7539381bed7e1b3d41807c180d72b413766",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-linuxarm32staticdebug.zip",
        sha256 = "6ce882e8e313f8ff5572ac5a4d195d4b1c98d94494d03a8c9536bc4d20c04390",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-linuxarm64staticdebug.zip",
        sha256 = "e4b9d0467a6d7dcd03bcc4190810bb516102813e2462b4dca90e2784a3a7ae9a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-linuxx86-64staticdebug.zip",
        sha256 = "fc4509023a2738391ba7e8c08aa7d8165b4206cd551aed54e1f0ca5ee3f2eb8d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-osxuniversalstaticdebug.zip",
        sha256 = "4b2699650644b6a752e0ce4659ce84981cb5f814c4b7a92fda33abe208d8c4ea",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-windowsx86-64staticdebug.zip",
        sha256 = "ebefb4482cbd4e678e9bd117c31786b8fba89b351bf5348502f514ee5dbb9acb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-windowsarm64staticdebug.zip",
        sha256 = "43db7aa0d37bda4014cb81010a453f8ee54617f14a17677ee6be7818ff284d15",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-linuxathena.zip",
        sha256 = "c14c6e1bb13745f700693cab88a4560f5c94873827f4e1cf39f11c4d072c1afc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-linuxathenastatic.zip",
        sha256 = "e7fcdc1688511d5f76b2566002a975e5a4944eeee8b512200388c16803237a54",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-linuxathenadebug.zip",
        sha256 = "1215c40b5e4037714e8a3be32cedd51efdb639f3134a972d8ccf7c7e2ff7151f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1/cscore-cpp-2024.1.1-linuxathenastaticdebug.zip",
        sha256 = "606d64f1c315d57adc7a21dc83e92e19598d5a83c518c1ce0ea3b2b9f941dba9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-headers.zip",
        sha256 = "adfd2f6414ede395834f64ffed44a87bb2ce6c2636a970fcd8d76bc87fa093a2",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-sources.zip",
        sha256 = "7b8b424504689c9f3b3a9e882bcaf98dd18468087b22de855340d6fd1363c863",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-linuxarm32.zip",
        sha256 = "ae186ca08cabf5a453b77089a32fe2678b3e7207969f86a7aedca672faa7cf08",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-linuxarm64.zip",
        sha256 = "7948c97919d005b22937dd5d03bb809932081dda0d51567adfd0185cb5f372b0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-linuxx86-64.zip",
        sha256 = "42a403f0bb5d3fd2bd4cb53ba35249ef5b6004762b063afb18a61e2887079da8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-osxuniversal.zip",
        sha256 = "f82c81ec7766db271a9831a57ae8668863dfadf215ecdd2e519a522bb77e9d1f",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-windowsx86-64.zip",
        sha256 = "51fafa6860d8858ae7ead764a0ac29e339ea846d71d6f6f6109e33be56d5505b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-windowsarm64.zip",
        sha256 = "7c4644b68ec3cf5688f65ba18d56a93d593430666072f3031beb43f3fbf63ab6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-linuxarm32static.zip",
        sha256 = "19a3a5fa57b6a6a16a5bd3b10671b52a3cc4390801e7ec1c9982f86379356950",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-linuxarm64static.zip",
        sha256 = "a297edd2145f90469456eed81f4c204098a3f30d2ad8fa5d2f57f787a179d209",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-linuxx86-64static.zip",
        sha256 = "5ee170ed307e90c3e3df65a85800645f93cd57ba644a57212027ab16ec02486a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-osxuniversalstatic.zip",
        sha256 = "78af7b6b773e0871e00dfb2f55cd65c9efcf409bea10512f328ee78456e039f9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-windowsx86-64static.zip",
        sha256 = "4fcb9045b66d8c3fca4decdb1f6c3c6e5146310d9f65a47ff6c91cd12c2a1bdc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-windowsarm64static.zip",
        sha256 = "478626df4d52533131618d201710ca1451c95f57cc2f32e9e1c5c46a85031d05",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-linuxarm32debug.zip",
        sha256 = "b4ce9b0d01a262eedcf114139fb8d6cb48e54928088e7b9979d56aa9d0d29422",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-linuxarm64debug.zip",
        sha256 = "4f150562e133b66630bf7a2376fddaba2ea3965773208134d39b70f6e095d8c9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-linuxx86-64debug.zip",
        sha256 = "0a04ae4859d62a4ae55315ebca9195daecb83a142821bc91aabe52deb6b487c2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-osxuniversaldebug.zip",
        sha256 = "2fd918f7c321384726b7389f42e1ee3e92dcc79b90b1486d981ffae977e76c06",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-windowsx86-64debug.zip",
        sha256 = "96555907d135a3e0f99849a2d6c593247bfe65ec850fe831add3bd284b7bdd60",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-windowsarm64debug.zip",
        sha256 = "c960f086f22ea8361adffafd0e37e8d6908be698697f656e02f640fe0b510f6e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-linuxarm32staticdebug.zip",
        sha256 = "220c71d06288429e995989d316c40831adfd97328a8fba715bff0376d002a1a8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-linuxarm64staticdebug.zip",
        sha256 = "cf40cdb1f8b239958148771ffb4a00bab4a05192cfe35c15309f2e5b6080265b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-linuxx86-64staticdebug.zip",
        sha256 = "a46462beaf4d0f850becb5231a9b5ba1b9b971c089f01b33d27b988a48f1b638",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-osxuniversalstaticdebug.zip",
        sha256 = "b3bbd9942f4c7d88f8e58d2d00821be06c4266838e69075e8dd1fd757547d2f7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-windowsx86-64staticdebug.zip",
        sha256 = "06da955aa53d0d2717e0ab070fec448d1096c1e69218bf62e84f07d3ceee90a9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-windowsarm64staticdebug.zip",
        sha256 = "cbbc84e0c760b452fcee1ddffb2d8fd57152081e58d28c921d0da5986dd2ce1e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-linuxathena.zip",
        sha256 = "3c2655f79d6071e0bb25d78a1e310b0c03b3321e8611ab0581153f3e70115659",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-linuxathenastatic.zip",
        sha256 = "143aa74da8a7c48e0b9e71a966bf30a244b05f7aaf0535f62db08a2617a791c8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-linuxathenadebug.zip",
        sha256 = "2c6fed36a0f95d5c729ec1c3542c6ca416b0d05c480edc29b60f28d8211392f1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1/cameraserver-cpp-2024.1.1-linuxathenastaticdebug.zip",
        sha256 = "fee9b0399b2c067330219248bbb41bba57f284edba171ef9773582c76859ec60",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-headers.zip",
        sha256 = "030577d3ca53cba0de88ce6b6c6f6b0b0de925ec9a681271a38b3d916acff0c4",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-sources.zip",
        sha256 = "4fa70a592630c24cd9d9a7c00acf0ff8566f0f388f1676b28a6e312866538797",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-linuxarm32.zip",
        sha256 = "9afa754be2f5e0973bd69f27a557b07982d5fc65a3bac367be3535b7b919325a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-linuxarm64.zip",
        sha256 = "b9b11f8e059836130a73784d67d152a73c3822f85752b82fb11efc753a22a3b8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-linuxx86-64.zip",
        sha256 = "52b5426a5b7f441daea21a25e2392d1e97a153d982a3c992f19e5562a3d6692c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-osxuniversal.zip",
        sha256 = "cef3eddde23fac92bad6845ff6dc6b283dd8592f8e6535f8a3f0d36490a72012",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-windowsx86-64.zip",
        sha256 = "4208c5d962aa7f22bde505b6ce149c215c5d423567bc58b095c84398225d8994",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-windowsarm64.zip",
        sha256 = "3557594ea2ef90e1b3d1f361a4691f71f757d2d8e9f0bbb04c024634799667aa",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-linuxarm32static.zip",
        sha256 = "325978ce8d5c3c275eccb4c049c51772ac5c24fec8d0964a0b7ba8e3b3f73c61",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-linuxarm64static.zip",
        sha256 = "f33f315cb64e190c8e89eb03e4f4fa4b94cf4b1cc7337e312ae7dd45c26614a3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-linuxx86-64static.zip",
        sha256 = "44b5fcffa0c697b99b426f70f73f152fbbffcf61d948ba4154f38f3445208239",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-osxuniversalstatic.zip",
        sha256 = "e6dfb3898c382ceb4e5c34cc2c35b170a90581da37986cd24535ea5ca6b32eeb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-windowsx86-64static.zip",
        sha256 = "c5e8a7650643680fbc0a96d9187445a3ab55c4fecaac4540aa9b1638659f28ae",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-windowsarm64static.zip",
        sha256 = "eb88aa0d42dc517184f0b8bc1a7aef5ab9784922fb40e38a746f3e27d7bc26ef",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-linuxarm32debug.zip",
        sha256 = "a400bba3928063f290a1d3116c36398c0d1c2c62105f2b14d0ee9d958bbe44a9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-linuxarm64debug.zip",
        sha256 = "a7b210653f550dbff96ec8f998f0d26c80e7bec5609f88078cbeee5070e51f9e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-linuxx86-64debug.zip",
        sha256 = "bc6e7feecb29ba0a4ef2901c80a174ba2dd335634ae51bb723139af14c7ff9c1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-osxuniversaldebug.zip",
        sha256 = "2e3aa3a27f67023bfe9462b6d25af8e4bf93a3262fa70cc3249f1f44e80aed73",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-windowsx86-64debug.zip",
        sha256 = "5e62e7b7d561d531c25ecbaa0362812dd854b5468f55cf85978354283856c116",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-windowsarm64debug.zip",
        sha256 = "d664f53637a35ed441f0412f9dea9e63dcc026d1abea61e960c4aa3fc09cc14a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-linuxarm32staticdebug.zip",
        sha256 = "3f79ba6063d581d20efd30da5908f16f9f4ced024cf62f1232b34d1ad6347b33",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-linuxarm64staticdebug.zip",
        sha256 = "58ab5b86b8c9d0a47d51758008641576b50f5ad3232d81db33f5e0c34027a6af",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-linuxx86-64staticdebug.zip",
        sha256 = "a5ee2d240eb70ec5a351bbcb8e7707814424f5cf38ed065357b533811bfab909",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-osxuniversalstaticdebug.zip",
        sha256 = "c2bc206f138fdba5e16ae8e4efd4b0a333b11ab81477e67c496995b818dabcae",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-windowsx86-64staticdebug.zip",
        sha256 = "ff7289cf706247dd619596ae06212e9ef70b68d67d6fb6fa7667ffae29ff5213",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-windowsarm64staticdebug.zip",
        sha256 = "ce78d30e5b49d67a03444cfb1395b3b50cea6ee65e4da9924dcffc1f39aed762",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-linuxathena.zip",
        sha256 = "35cb4f50d107c9174c0711aa5be450a8c51a7c5fe07e322907a13760659af06f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-linuxathenastatic.zip",
        sha256 = "2dfa07e0530dfbab4319e5e3759f5ab02a735a66e20f7bd9144671ea5a1fb34f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-linuxathenadebug.zip",
        sha256 = "93200e2a0c901d7acc8ef1d43f4c275744ae236fe34457f8440c64657a781044",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1/wpilibc-cpp-2024.1.1-linuxathenastaticdebug.zip",
        sha256 = "9070ba97ec9d18be47e465e84d6e5c68e3b96c72ac8444ea75455c02348b8bfc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-headers.zip",
        sha256 = "8ef4c5a9eb07d74fe2c027ae2f348c8a8465964be19323caeccf7c532c576977",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-sources.zip",
        sha256 = "0b6f2c322651f7645b49e22e427cf2f29f1a5caa7af1cf8c68bfc040983b62fa",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-linuxarm32.zip",
        sha256 = "a53545c8b2f62e79232fdcffb6c2f9a116c6c9426e8ec5217c6895d73e295476",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-linuxarm64.zip",
        sha256 = "4adb6e0ba120c58dbf684fe20f073d07d3f513a60ce5a772c64dd2b36f66d2db",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-linuxx86-64.zip",
        sha256 = "0943fbb2e33c294e8e81ae007fd7bf897138e97274cf9abd485eeddb6fbc110e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-osxuniversal.zip",
        sha256 = "01d537d934255ffa5e4a34cbe6bf207a960eee01f8b4c10296f03d33458ac1af",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-windowsx86-64.zip",
        sha256 = "be73539585a3dba181c2192b55d66427a7396f9e6ce2824bd70ee3d1d53e3dc2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-windowsarm64.zip",
        sha256 = "7c61a1c383e0db09a02c01cdf4f00ce9da523ac793fe2869d262f38ed148d0be",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-linuxarm32static.zip",
        sha256 = "a67aaf4fc14d33e18d7bafc22bd57a6ae9aa5233e222b15a2ce0a807af9a2e5d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-linuxarm64static.zip",
        sha256 = "e94e43d7d130ec7757c84c6e3f02b8542b5dcbac90f9a7c920e5eb99e8a9d9bd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-linuxx86-64static.zip",
        sha256 = "054253c2919d95bcdffa963b34817951a580c1fd09ff3251edb932a08abe5953",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-osxuniversalstatic.zip",
        sha256 = "fb44d706e26d6eca1525a32455b3425afe6dccf67bb5bf88a8fa5c8bef2e8d82",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-windowsx86-64static.zip",
        sha256 = "873c6844b3748d3a567587d15bd5963aca2fa77b0e2153ecd710ddda897860b0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-windowsarm64static.zip",
        sha256 = "7e02db1f62df6b5e126ee7788b5a2d05b7e8a364029942be9c629c1e6c8b898d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-linuxarm32debug.zip",
        sha256 = "ed4bbe04189127b69308618cdbebcd129bb89c9a294e399aa52e015fb60af8ca",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-linuxarm64debug.zip",
        sha256 = "0252b007bb9d3d2502dc5656255cc6831ace7c3089bcb84646a6f3acb4bb19c9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-linuxx86-64debug.zip",
        sha256 = "d1e7c3ebee26af5f77ae61f9ba646c6fc2094f696b7968fe14a6bff8c09c3122",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-osxuniversaldebug.zip",
        sha256 = "d9cd77a575ee972ff739243693fbc79510587801a991bb3f243acad7f2da4a25",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-windowsx86-64debug.zip",
        sha256 = "7b6e148802784ab502074d02265909ed5046df1f6ca3d09a3925044d221725ac",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-windowsarm64debug.zip",
        sha256 = "2695fc7e919305f99fafc8150a2ed1b478da7ee7c01c0019880938eee89d047a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-linuxarm32staticdebug.zip",
        sha256 = "ce70dd0b5fe11d5932669949d8980eadd166f67e4cbbbf3e34c0638139508347",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-linuxarm64staticdebug.zip",
        sha256 = "89801924f014a062daee516e68fafa5d99b260ac8cab0d5861ad278e1d77ca7f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-linuxx86-64staticdebug.zip",
        sha256 = "b4a28c5ae0f35e4e2cebdce8658104a99287a9ddc54adb2e6b9ccc57c4a19543",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-osxuniversalstaticdebug.zip",
        sha256 = "292d515186ee1ff32ce618b79dbf57828cb73b4505c5c3eb6ef4a5cbbebc15e7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-windowsx86-64staticdebug.zip",
        sha256 = "109a60177e9fca2f7f05140c6c13e4d3cfe068d10309c3a911aaac398ada0642",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-windowsarm64staticdebug.zip",
        sha256 = "5995f5076a7da056f759a658a798e6a03be62019f7ab24e2cc7500f9a782c007",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-linuxathena.zip",
        sha256 = "8e77a3d7e32548c2e5f0ceeac6cd29c92c359f7c1e5edc3f3e3f08eac1c8d254",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-linuxathenastatic.zip",
        sha256 = "719a126e3324170bf74069459aec7454086f9eba3156035faec4dc4ca64224bb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-linuxathenadebug.zip",
        sha256 = "1783a2719b06cd2e9e511e3dbabc023f8e1d46d5cc1b598979acef266b769375",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1/wpilibNewCommands-cpp-2024.1.1-linuxathenastaticdebug.zip",
        sha256 = "2d5745f0c3efd2d15bf51a66d4e39f8ed0ff09438736655efdfeb33f0c288cfd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1/halsim_ds_socket-2024.1.1-sources.zip",
        sha256 = "61f4d9fcfd8eac03fd2a8563c403a8cf20433ba541afbc99c0182ec995594067",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1/halsim_ds_socket-2024.1.1-linuxarm32.zip",
        sha256 = "162eeac3eea72371c5545731c81ce2b80907f541b16b15d1ad9f5919652fc357",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1/halsim_ds_socket-2024.1.1-linuxarm64.zip",
        sha256 = "47130fdf88f8ffcca4167c5b3c9b8584e67e7c7258829bc1d5be1bae0a905689",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1/halsim_ds_socket-2024.1.1-linuxx86-64.zip",
        sha256 = "b62bbd0ec7b826af938fd20c3de7747f7f8006670461545c8a9c6d0e9bef31d4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1/halsim_ds_socket-2024.1.1-osxuniversal.zip",
        sha256 = "fdd6d5fe2a14745fee95f74e41466df088f41068d0873d6bebbb7d0aac45a236",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1/halsim_ds_socket-2024.1.1-windowsx86-64.zip",
        sha256 = "80929b7cab668736b6fc07e13aca90df59276e7302f10bbf1763a6c09db33b1f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1/halsim_ds_socket-2024.1.1-windowsarm64.zip",
        sha256 = "dedfdd965876bde14824abcf08bcf76b1d175ecabbc363a15011b94a27a5f42f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1/halsim_ds_socket-2024.1.1-linuxarm32static.zip",
        sha256 = "91505d71f656d3ac4168f4e6f9b18dbef4690fa8addb84fe0d28b30466995355",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1/halsim_ds_socket-2024.1.1-linuxarm64static.zip",
        sha256 = "9010dbc6a67c92b71101becbeb4aa202ed496a18955b20fef07770be128c7871",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1/halsim_ds_socket-2024.1.1-linuxx86-64static.zip",
        sha256 = "cc3d810e3014e026362c22380942747423a169fcf43c7ed878a3fee14e6960ae",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1/halsim_ds_socket-2024.1.1-osxuniversalstatic.zip",
        sha256 = "16cf911ba2a40ead649ab1f6b0ad1307f93dcdeed14f2b309613c5bbf2e5f0a0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1/halsim_ds_socket-2024.1.1-windowsx86-64static.zip",
        sha256 = "ce4ab20ceb52c8c0004eb402b7327afe1da3246248874b0ffdd9c6f39456b042",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1/halsim_ds_socket-2024.1.1-windowsarm64static.zip",
        sha256 = "743f6f2257bc0b1cc66c16783ddf53c4a9a53196bd3f0457c918f40297a8f0d3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1/halsim_ds_socket-2024.1.1-linuxarm32debug.zip",
        sha256 = "2e6ee0e4c7906528133fb018fe7e87bbe39f6d772bc76fe87e8528db95277cc1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1/halsim_ds_socket-2024.1.1-linuxarm64debug.zip",
        sha256 = "89fc3f43b68e88b332985da5514cc95a136bdaf77f5e63a6c41d304689e818af",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1/halsim_ds_socket-2024.1.1-linuxx86-64debug.zip",
        sha256 = "3702eb3b5c86e518100bfa6d92057a18269c3b098b40dd1f1b41b4024a422382",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1/halsim_ds_socket-2024.1.1-osxuniversaldebug.zip",
        sha256 = "187890bd8a6a41327805c374a56d014d6521e1179858a2108ba9bb90d9f818d3",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1/halsim_ds_socket-2024.1.1-windowsx86-64debug.zip",
        sha256 = "eb0e057b22e908d80743e161c7ff4eb930276cde040fd8d2db16ba00f1dca38d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1/halsim_ds_socket-2024.1.1-windowsarm64debug.zip",
        sha256 = "5bcad86dae1c06b645ee40a9b0f52e9ff4952ebae5912bb4266b2f53d5a5cfcc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1/halsim_ds_socket-2024.1.1-linuxarm32staticdebug.zip",
        sha256 = "b4fc8a2e3f9b9168ea3946a1eb7923469d3fe0ce2f710acc2f8493fd2085b6df",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1/halsim_ds_socket-2024.1.1-linuxarm64staticdebug.zip",
        sha256 = "13fe888ebf4e39470b1be041ce840def7ae79ff8a9b047aae2b6d04edc2bcd2e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1/halsim_ds_socket-2024.1.1-linuxx86-64staticdebug.zip",
        sha256 = "73786b0b489383ed25ea9f86afd919997decd2150e407f903b3fd627814224db",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1/halsim_ds_socket-2024.1.1-osxuniversalstaticdebug.zip",
        sha256 = "4e8aeadf1ad938fa4814cd7ab90a8051819a8af29964d8b51f33638f36f7dcfc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1/halsim_ds_socket-2024.1.1-windowsx86-64staticdebug.zip",
        sha256 = "2c8e1f2288c56cf644320f703020a7b7416d7d682553c1f8b5ed30ae80ed7e80",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1/halsim_ds_socket-2024.1.1-windowsarm64staticdebug.zip",
        sha256 = "10e62e1ade7191753e61fea15eb74b75dc69497355aeada28aecb0c013b6f38f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1/halsim_gui-2024.1.1-sources.zip",
        sha256 = "a8085ea10360aaf67eb648e32999a34000065b4a78aa37006a26eeb14ce1d841",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1/halsim_gui-2024.1.1-linuxarm32.zip",
        sha256 = "593065fa5197f7361ef7ca1c565cdbdb85bc8161a3467f7004f82ed1e2ac7a30",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1/halsim_gui-2024.1.1-linuxarm64.zip",
        sha256 = "31a5bbf816948fd1fc6e89e24f54cf40bbe7e4c9c70a552145ea51e4e5558e89",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1/halsim_gui-2024.1.1-linuxx86-64.zip",
        sha256 = "eeae7e779e3b8c69547214db794eb9bf6290412cfb383effa0202e22a79e9334",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1/halsim_gui-2024.1.1-osxuniversal.zip",
        sha256 = "309d68b9a89f4204c08caac936410e8b225b838421d26cf8bb47ee3260d1cf9a",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1/halsim_gui-2024.1.1-windowsx86-64.zip",
        sha256 = "413abb24086576c9da79cd37a5e59a4d886314f5b7bb1c15ddbd484a5832d6a2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1/halsim_gui-2024.1.1-windowsarm64.zip",
        sha256 = "fcaea3d440b1386324ef1d84954b375d3d1e880950b58820d140dcc58585f740",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1/halsim_gui-2024.1.1-linuxarm32static.zip",
        sha256 = "a6fd3b0793518473d9e0f6297694ffde0157276c640ab28d72fb6dceec137cd7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1/halsim_gui-2024.1.1-linuxarm64static.zip",
        sha256 = "4b0ae41e682317fd13ee5925c106a7e907744e17e0ca3c7b8d1f892f9cd47379",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1/halsim_gui-2024.1.1-linuxx86-64static.zip",
        sha256 = "bd4bf574c6f776327e8176c739c2df57a2b6b6bb8d71bc1a5608a697084c0dba",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1/halsim_gui-2024.1.1-osxuniversalstatic.zip",
        sha256 = "dafdaa6e35cdf54af92f76a2913f045546705ba8fcc4fe0b90eb6b36e57954a5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1/halsim_gui-2024.1.1-windowsx86-64static.zip",
        sha256 = "0fa97d2fd9e2df0e5050618f9d32bc704e988386fa1f5c2cf620c6e91622fdad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1/halsim_gui-2024.1.1-windowsarm64static.zip",
        sha256 = "772e863541e00688abf9d05919ba8ea3f703a73775cff5b530be3257fa1cbefc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1/halsim_gui-2024.1.1-linuxarm32debug.zip",
        sha256 = "54473574ad94f3b0a6b1bf6ec145e4389230623543be873383992f14e321f1ab",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1/halsim_gui-2024.1.1-linuxarm64debug.zip",
        sha256 = "90d26b4e71bc71a7e34c07cf5ec1f727b958664782ea4129b3606f3524fffc8f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1/halsim_gui-2024.1.1-linuxx86-64debug.zip",
        sha256 = "e70ed35e6d4af1946cacfc268c465a42eab31fbd50c461e0b13b23812646742c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1/halsim_gui-2024.1.1-osxuniversaldebug.zip",
        sha256 = "fc720e29b31dff3958e939e4b3add613f3b2e6356de67328ffe4a97ea50c2f13",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1/halsim_gui-2024.1.1-windowsx86-64debug.zip",
        sha256 = "79207c50a0ab70ec4117b336a72175e8751e48ba9679ca0e16f13f9a12383722",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1/halsim_gui-2024.1.1-windowsarm64debug.zip",
        sha256 = "c70f2aebfe0c9e213c279b38e16f284d50815b63629ead3fa2db317ac7c72055",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1/halsim_gui-2024.1.1-linuxarm32staticdebug.zip",
        sha256 = "012a1fce1e8a55aac223210eb345e0f1a67c4045ae8dac47e55af8acd5c093c0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1/halsim_gui-2024.1.1-linuxarm64staticdebug.zip",
        sha256 = "8e547a19e11be8a3d90ac3015c655fa5aafbb2b8f42bad6f8b0069de88f3978f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1/halsim_gui-2024.1.1-linuxx86-64staticdebug.zip",
        sha256 = "2904acf46d862a0ca622237ff82910a8b2e72eec19fe8ac85e57ed409c5ece6c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1/halsim_gui-2024.1.1-osxuniversalstaticdebug.zip",
        sha256 = "49b17baab28f1a6e39aa6689e9ba3a748bea5211a477d80d8d15527b1909d546",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1/halsim_gui-2024.1.1-windowsx86-64staticdebug.zip",
        sha256 = "96a38ae8fb6cb3961161b2aa2c731c8f040dadbeeddeabe000b26a4c16ee2ec7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1/halsim_gui-2024.1.1-windowsarm64staticdebug.zip",
        sha256 = "bf0215ece88a1de6bd9aa578a3d0bc411202e121592e69c579e0c18017e9aaa8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1/halsim_ws_client-2024.1.1-sources.zip",
        sha256 = "246a5f0aec70530670deb436d182ee3d67d824d05c48b3dd7d618eed7eb463ee",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1/halsim_ws_client-2024.1.1-linuxarm32.zip",
        sha256 = "08f870fea89c7866e8dfebe0b9d3323dba012250612c8c641f84f5bee4786cbd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1/halsim_ws_client-2024.1.1-linuxarm64.zip",
        sha256 = "bd46f1cebbd22d726e29a294ebe648e15e3fc1e4889d2236ababd476b037ff6d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1/halsim_ws_client-2024.1.1-linuxx86-64.zip",
        sha256 = "7fd121632fa0a1570f3f20e3bd13eb12600fac5de52c74e6e81ea7dde113171b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1/halsim_ws_client-2024.1.1-osxuniversal.zip",
        sha256 = "61ca4ecd860105ae5258be6b17199febc793e93e54ba0779f77e995e673a629f",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1/halsim_ws_client-2024.1.1-windowsx86-64.zip",
        sha256 = "25b5d1a8025ac730cd32d13538d7c64b3eb48d46059bad8d22df529340d3979a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1/halsim_ws_client-2024.1.1-windowsarm64.zip",
        sha256 = "c8bdbc8ee9287b52e05291e03ce8b4d2d3cdf485aff049c00e2ca544e5f4ccd2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1/halsim_ws_client-2024.1.1-linuxarm32static.zip",
        sha256 = "e5ed0417d58e09192ed3968fe6a25538845a0d67119bbc7609676d3589fc944d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1/halsim_ws_client-2024.1.1-linuxarm64static.zip",
        sha256 = "81e75fef2676d1d6538bd718b5b1588699cb5018c8d0b928bd884c88ae3c5d3a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1/halsim_ws_client-2024.1.1-linuxx86-64static.zip",
        sha256 = "a86cc493319ddd890025a642b0c9df51dfdeda2eeafa3ef728fa2305dc71db6c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1/halsim_ws_client-2024.1.1-osxuniversalstatic.zip",
        sha256 = "161f59928dc5f2b7d998ee54a6b9fe359d88a9a6f684871909a55ba431296fcd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1/halsim_ws_client-2024.1.1-windowsx86-64static.zip",
        sha256 = "aaa8dcc14fdac0e75f381b0e308649e268447eb55e52ef5f6c0021424480bcef",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1/halsim_ws_client-2024.1.1-windowsarm64static.zip",
        sha256 = "3c7617d458a8e5b5e4ac769f11c1965e8d1546049f1758f55de760896a92a796",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1/halsim_ws_client-2024.1.1-linuxarm32debug.zip",
        sha256 = "78c87f3f108e281605c970e88e77596b59e80d5000a7821804d18d736cafbd49",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1/halsim_ws_client-2024.1.1-linuxarm64debug.zip",
        sha256 = "a2339a714efcca522ba2e2436efa2dfc516faf1d203a33d2254d8e2d98980e07",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1/halsim_ws_client-2024.1.1-linuxx86-64debug.zip",
        sha256 = "9ef2f9415260ec5677d0dda8baaf94a77b193a2d23c0d156c6f60171c3934961",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1/halsim_ws_client-2024.1.1-osxuniversaldebug.zip",
        sha256 = "44dd3b54446d424242b170539f681eb60041ec1439a108ad90d9c1a455cefae4",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1/halsim_ws_client-2024.1.1-windowsx86-64debug.zip",
        sha256 = "25e35a8314e6e5f5292841c50b1ce90ae7533a970027aa8bcbb6f3bcb11da6c8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1/halsim_ws_client-2024.1.1-windowsarm64debug.zip",
        sha256 = "c608cb9de1ecd86eb7a32b9c98d4dfb3d649fbe237341dcfb1f688ebeefd800c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1/halsim_ws_client-2024.1.1-linuxarm32staticdebug.zip",
        sha256 = "fb5c8177190ef2e56643318d5a739143f5cff604bfea81dc9471335305ccdd78",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1/halsim_ws_client-2024.1.1-linuxarm64staticdebug.zip",
        sha256 = "8a55050fe0acaf43b0025aa95a727af4148ddb1f8bfc47777bc71c205adbc700",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1/halsim_ws_client-2024.1.1-linuxx86-64staticdebug.zip",
        sha256 = "150bde0aeadc83a7031e2222ad285c5b403716294d608986d56e748ba79f41bf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1/halsim_ws_client-2024.1.1-osxuniversalstaticdebug.zip",
        sha256 = "6a2d32bd88d214efa3643052300dd22aee727d6b763c3e9e7e7437ba7e741a05",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1/halsim_ws_client-2024.1.1-windowsx86-64staticdebug.zip",
        sha256 = "a618b068aa4d635ac491e8ec74308a6f34786a234cb1e05adefcea59fac8b388",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1/halsim_ws_client-2024.1.1-windowsarm64staticdebug.zip",
        sha256 = "8943701963e2e8075868648cdcd1bdc2a983557f9774967cd7fb7d257d645cf2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1/halsim_ws_server-2024.1.1-sources.zip",
        sha256 = "8c245c10c6bb334481955b643c042bd7b64a54ad67e1bfc1bda2d73152c7443d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1/halsim_ws_server-2024.1.1-linuxarm32.zip",
        sha256 = "842623a589a565385ee8c619d4ada6430592ad0d196b5ab1ffb60a554badd0ed",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1/halsim_ws_server-2024.1.1-linuxarm64.zip",
        sha256 = "838d3a98e606648f820dd20b1c4c9d8685bac17e2d4c2cf42a31d0e6f195ade2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1/halsim_ws_server-2024.1.1-linuxx86-64.zip",
        sha256 = "f241fd101234ea49b21bd5bc8afc4958f786e403da6ee0610423f85cb86374d1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1/halsim_ws_server-2024.1.1-osxuniversal.zip",
        sha256 = "8c2c8c3dd4be62c8c1cca52f75773f8db145cb0c41a38a5dfe516d8761182135",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1/halsim_ws_server-2024.1.1-windowsx86-64.zip",
        sha256 = "69ab324dc6b00e1db2a8dca6de223b04b1ff5da21527dc374325b0f39c3394c7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1/halsim_ws_server-2024.1.1-windowsarm64.zip",
        sha256 = "566c39f5990249fbdec6845660a83780caaee1603acf17cf9a5c1d8870ea2bd8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1/halsim_ws_server-2024.1.1-linuxarm32static.zip",
        sha256 = "39c42dd10a2e64f154f8640172fb8bc4028871d5456bce39d30b6320e8fcb33e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1/halsim_ws_server-2024.1.1-linuxarm64static.zip",
        sha256 = "8f9f95ceb08f086568eda1c46e22e7976e2284b81dc7a65fef675ce06eb98aaf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1/halsim_ws_server-2024.1.1-linuxx86-64static.zip",
        sha256 = "c2021824e570d5ef9d63a01bef690af4094c7d6be4acd789f1b45b7ef9a1bf0e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1/halsim_ws_server-2024.1.1-osxuniversalstatic.zip",
        sha256 = "82285629fd483d0ceab626b5ed35ecfee78a0c629389a3c170a1fb909e896ee9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1/halsim_ws_server-2024.1.1-windowsx86-64static.zip",
        sha256 = "aaef75d8cbf52c6f1246b959d343395e33a10c0a1f365a393b5551ea5b541fdc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1/halsim_ws_server-2024.1.1-windowsarm64static.zip",
        sha256 = "2a7e55da0cd769925fd80863802fbbf886d924958337fda0f8a920020d09e962",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1/halsim_ws_server-2024.1.1-linuxarm32debug.zip",
        sha256 = "436ed484b31ddb65bb1156a7738588d07c650886c1eee8bfcd3f2fe0d546222e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1/halsim_ws_server-2024.1.1-linuxarm64debug.zip",
        sha256 = "17053bc45f216f617149fe85129eb93fdcefe588aac07e0c73da4402f1f6c5d9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1/halsim_ws_server-2024.1.1-linuxx86-64debug.zip",
        sha256 = "261304286f55cbecf8e529e9f684b5b36bc7f967f091633754df92722499042c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1/halsim_ws_server-2024.1.1-osxuniversaldebug.zip",
        sha256 = "12c03a24f8b8f32a5e1b4fa04e1de64c512ba70ebf5f858d2d622d5cd6edb600",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1/halsim_ws_server-2024.1.1-windowsx86-64debug.zip",
        sha256 = "291411d19ecd32adeb7271a54a36bd165043db4bfc03eca44a715d04422f5c3e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1/halsim_ws_server-2024.1.1-windowsarm64debug.zip",
        sha256 = "71846a0104cadc6f61476319939992503170d6577b3c7c8a28a34ed5bbb7926f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1/halsim_ws_server-2024.1.1-linuxarm32staticdebug.zip",
        sha256 = "10a6ae48845ee0fc4f5a4dda3e8f6ab003473fa548387f5b054524309fee0518",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1/halsim_ws_server-2024.1.1-linuxarm64staticdebug.zip",
        sha256 = "70a566b37de620f86d6395b83490c8f00899925b5ae87c398b90be4d25c8b168",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1/halsim_ws_server-2024.1.1-linuxx86-64staticdebug.zip",
        sha256 = "4cc62b1b03b2766597c01ea5b8eb7b58f691a1cc829ebbf7ea8f94d30a360941",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1/halsim_ws_server-2024.1.1-osxuniversalstaticdebug.zip",
        sha256 = "556fbe45cb799ecc9800f13c9073def5230ed8d194a520e9b40f8aace26854ef",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1/halsim_ws_server-2024.1.1-windowsx86-64staticdebug.zip",
        sha256 = "80107de9356facc23ff865795c6b8f705d0269c3e7059e595b838aac15a0f4c1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1/halsim_ws_server-2024.1.1-windowsarm64staticdebug.zip",
        sha256 = "539377523f94dadbe8c0d5f8f6a9087b0d2063554066da6d1ffb6bfc4e1a6503",
        build_file_content = cc_library_static,
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.1.1/SmartDashboard-2024.1.1-linuxx64.jar",
        sha256 = "dbc72f58ff28504ae62980b4fd807fe8a4079d68d6a2209449e2ea9853d735d4",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.1.1/SmartDashboard-2024.1.1-macx64.jar",
        sha256 = "3a06ef746397967d17d41d8195f8793fe6750e346c6208656cc1291ea99aadb2",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.1.1/SmartDashboard-2024.1.1-winx64.jar",
        sha256 = "ce7d16b506667ea4bb407caa775169ed50cd34016f45299938f96828790a78d2",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1/PathWeaver-2024.1.1-linuxarm32.jar",
        sha256 = "49b14d1f16ffced695cf634c02810b879645a39f2a47276daeeabf8d9d79a5da",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1/PathWeaver-2024.1.1-linuxarm64.jar",
        sha256 = "0b2905588b9a8670da15ae3e99aef8b9d8baa9c00153da923e22d9d2a9a214ef",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1/PathWeaver-2024.1.1-linuxx64.jar",
        sha256 = "8172a0e7ff593d13c14fd642681da4e7bbe92ab27464fb9d55017d07e4a148ac",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1/PathWeaver-2024.1.1-macx64.jar",
        sha256 = "1ade3a5e6b9dc8fdcb33cef945e9d8a2996d20589cfa764856ad72c2d5bc339b",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1/PathWeaver-2024.1.1-winx64.jar",
        sha256 = "514f690533019e786828ad9196f0eb69be8f3b98c0dfb9947431e81431bd42af",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2024.1.1/RobotBuilder-2024.1.1.jar",
        sha256 = "4b4fcb6847fd2accc68d219a0a8619115aeb97ddf6b19a9787113a0a48757769",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1/Shuffleboard-2024.1.1-linuxarm32.jar",
        sha256 = "a861fd39868ceb4065b5ce37f7b46df3d6f3758f72f48d45d5896ca1cfe4e0ba",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1/Shuffleboard-2024.1.1-linuxarm64.jar",
        sha256 = "b9e3519dcf2d0b434cdc751f7def5780c0738abd7d360025c32f8ebe1fd537bd",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1/Shuffleboard-2024.1.1-linuxx64.jar",
        sha256 = "0a926750e26f05dd0cb3a3234a45389aac8002d6bee9847527e5701ce807d563",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1/Shuffleboard-2024.1.1-macarm64.jar",
        sha256 = "27fbf9b1495ae6cc00cc7e3adc98017178a8257fe9b778efec80cb9cb9aa7b44",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1/Shuffleboard-2024.1.1-macx64.jar",
        sha256 = "a3ce957033e7b8b2b8defaa5e00d092f077f47b6df80711c1162ef1b63d0b681",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1/Shuffleboard-2024.1.1-winx64.jar",
        sha256 = "926dc68588555bebeafdd9439ab253cdc25ecbf238b3453329571b87a83ad370",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1/Glass-2024.1.1-linuxarm32.zip",
        sha256 = "a88c46faa19822e6f740b70283fcdc0cf7b36023592a39c079a6892c7036388b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1/Glass-2024.1.1-linuxarm64.zip",
        sha256 = "e2223041aaed94647a38ac54930118b6c0ce9d1f80d9fc4b9ca34674f0a8c1a6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1/Glass-2024.1.1-linuxx86-64.zip",
        sha256 = "262f5d28666994c89b18e6eeb8347900d76263fb9a0ff7f909964218410fea4e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1/Glass-2024.1.1-osxuniversal.zip",
        sha256 = "19e4990883137d52f5b9101645d4d2e80e997dcf1c2c5cd1809e1545e959ce97",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1/Glass-2024.1.1-windowsx86-64.zip",
        sha256 = "ac8df3fdc8efc9d594de3003b7b0749f5009ab762140e5e30617cb637b4832db",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1/Glass-2024.1.1-windowsarm64.zip",
        sha256 = "e7c2998ba7edf06de850192bc71ac76b623440da6507c0a3e3ae317b7fa03527",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1/OutlineViewer-2024.1.1-linuxarm32.zip",
        sha256 = "cebf81f7f224a46da7f7bb7cb5a2b7fc27870107455f21ff1d45f7ac29f7f7f6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1/OutlineViewer-2024.1.1-linuxarm64.zip",
        sha256 = "5e70e5b1510641df25044a7dac10f6595e9109c58afc2af98fd3648ccacc47e0",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1/OutlineViewer-2024.1.1-linuxx86-64.zip",
        sha256 = "9bd407c71ddad208881382b8b8acea395ff9d5821c99490bcf87e97f1560794b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1/OutlineViewer-2024.1.1-osxuniversal.zip",
        sha256 = "84d97159ad270ccd4b5703349e4ebe192a5cbdc17d1c972e9e7885be67479c36",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1/OutlineViewer-2024.1.1-windowsx86-64.zip",
        sha256 = "78c746a246921dc0cc1e928a4657e97e7c9b5feaccf1c86a1fa58600a14bc47e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1/OutlineViewer-2024.1.1-windowsarm64.zip",
        sha256 = "146ad7db7b0962f0d7fc94a0aaec7d8585e8a853bff271a6e5434cee6510942f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1/roboRIOTeamNumberSetter-2024.1.1-linuxarm32.zip",
        sha256 = "9ba8bace3d5702340ee5154b06fd49574a1fa40c441682748411baf73312d0b6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1/roboRIOTeamNumberSetter-2024.1.1-linuxarm64.zip",
        sha256 = "4b94c5befcde8aa25ebfe6023c3daa341773d1358f7745209f43196d492affaa",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1/roboRIOTeamNumberSetter-2024.1.1-linuxx86-64.zip",
        sha256 = "07464a7edae7d0a7cda1a790925571060cb252b18c7b15c32a675a53f0700e92",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1/roboRIOTeamNumberSetter-2024.1.1-osxuniversal.zip",
        sha256 = "73c66bd8b08334e38ecef397531fb6a61919784ac2a22ef0b0754ef252f7bae9",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1/roboRIOTeamNumberSetter-2024.1.1-windowsx86-64.zip",
        sha256 = "f65668b1651f8b68020bbb4b923f1267ed9a6ed6a582bc552383d495201edd81",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1/roboRIOTeamNumberSetter-2024.1.1-windowsarm64.zip",
        sha256 = "c63310da0e2ebadec57638fb6ed828a7d60f127dd42ff51434e4db67ca252ca7",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1/DataLogTool-2024.1.1-linuxarm32.zip",
        sha256 = "44ee62ffd88f9b04124f2dc48f83cb91a8fdadf2bd88aee9864e0669a3b3f541",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1/DataLogTool-2024.1.1-linuxarm64.zip",
        sha256 = "bc9be2619d6a7ab66b77d81fb9b0ff3ef699cc0d509c06e7f37263d3fb3d43a5",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1/DataLogTool-2024.1.1-linuxx86-64.zip",
        sha256 = "91635a01a67eef3da7813fe5501e5ab8f668fdb9ffe8b60e47dfda57e5a881a7",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1/DataLogTool-2024.1.1-osxuniversal.zip",
        sha256 = "875403172b915ee86cb7b640ca1136da112b1363312576ab6bb2ea7fcecb4372",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1/DataLogTool-2024.1.1-windowsx86-64.zip",
        sha256 = "e0bca9a87e262cc9dd4c1d24b27424208a3c1345720f8485e3639884d144f5f8",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1/DataLogTool-2024.1.1-windowsarm64.zip",
        sha256 = "d72770bd2201a31eac565bd1cda826f3da8153a7a599d1f2f2998d2a9fa0ebba",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.1.1/SysId-2024.1.1-linuxx86-64.zip",
        sha256 = "d5d1927905aaabbdcf7e166bdbbd8c053ee5dab9219d22e393bed704797c3f79",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.1.1/SysId-2024.1.1-osxuniversal.zip",
        sha256 = "c08430f8333649e7c099b9b2ae56fc2e80ccdf9a0ecbdc4af473bfdeb336c481",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.1.1/SysId-2024.1.1-windowsx86-64.zip",
        sha256 = "e1558a574149a9a6b3536b4d4cc6b513dc636a053abf65608a90604999460260",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.1.1/SysId-2024.1.1-windowsarm64.zip",
        sha256 = "72b2463d824880adef30c5a606e23fc355f906efed1c2d4d6930af39c0f8dc57",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
