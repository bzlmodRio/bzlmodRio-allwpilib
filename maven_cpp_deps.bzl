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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-headers.zip",
        sha256 = "448c8aed303b46f1df56d9a47f37e0c0226ff948b04fba126d7e3c735bdcd5de",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-sources.zip",
        sha256 = "fb5b1ab69225061ca70c38b71e16de476811ab251fcee992282132dcf660c201",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-linuxarm32.zip",
        sha256 = "4af9c27c44f7b9fa28644dda4e91ad5c67975484d762b738a02ea6c1ecd8a43c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-linuxarm64.zip",
        sha256 = "5d098ff6db33002dbd3cbda40560b911fa3c24e8e6b044127a56cd5f892fe07a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-linuxx86-64.zip",
        sha256 = "6db0c6ae1ff1ac7fc6ba8d69ce9bfd274efa7a1a2674306ba31ad77e6fdfdeed",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-osxuniversal.zip",
        sha256 = "5a18d971c012d40ff91489373862d4625f110045179e5e1eecf88a5353f30384",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-windowsx86-64.zip",
        sha256 = "b045ab325644d2237615480519e8dcb79b206bd7e0305aabcebafd0c9ee07c71",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-windowsarm64.zip",
        sha256 = "8f67355c73214c12c943f72bfdd7d537554cdc3098608099549378d4c42b5335",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-linuxarm32static.zip",
        sha256 = "90e380f9b18148ecee9918d5fe70e26d480ec5b276b5ca2e51b145be68aa4ae4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-linuxarm64static.zip",
        sha256 = "5ba047007f9dc8fd4ecba47bf1b20a0d0b90ce15fd92c8978087d0dacf93682a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-linuxx86-64static.zip",
        sha256 = "e238ec657490c706a32723a775ee53c6d88fd8a41d058d791973a283cd9a78f1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-osxuniversalstatic.zip",
        sha256 = "bb1b36797619d81a12aa8c58c72aec8fe1eea896622942c3301fb4148d93de87",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-windowsx86-64static.zip",
        sha256 = "8290bb180b067e59fd5c87a94c68ac96035b5cf02e9e7225c5391c6e283f70f1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-windowsarm64static.zip",
        sha256 = "f433e4765de3a7062606d1d3a4a7c2f54c2e87d6a9304f5f02841cc867702117",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-linuxarm32debug.zip",
        sha256 = "a83327c67c81f7a4ad2f2dffa1eeabc71a018114682c9bbf9c4f41a55b1b13ef",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-linuxarm64debug.zip",
        sha256 = "4cc6276699cbc02aa6a4fb2c064341cd09521f55b6d2cef387c4be0ff74e1e99",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-linuxx86-64debug.zip",
        sha256 = "fd60a74dd5342a7f9f4e8c5ed7c74ed3ad64b65a336719b0d49d736437ee10c5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-osxuniversaldebug.zip",
        sha256 = "bbc8a5974b6d4a857e6d6919b5759a51ee7dc8c5c1c9fc21e10e71c3b3ad2e3f",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-windowsx86-64debug.zip",
        sha256 = "761909e087246337c0d0891f7091e3a12296132430e6b2238c767acb180460d8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-windowsarm64debug.zip",
        sha256 = "b989049cd2a1f405b70d538d80d4edd28bffcf677f701e06207ceac35ce4b7eb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-linuxarm32staticdebug.zip",
        sha256 = "a0da4dd905906c99dac819577bf8169102d0dc8ad365b5a991e9a3fbf5af842d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-linuxarm64staticdebug.zip",
        sha256 = "e5ad83fe4541249e90dc302dc670812a919de575a77ce5009af7ab2c7b0e4d75",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-linuxx86-64staticdebug.zip",
        sha256 = "0104b4fd73efcdf7395165e0aa1bfe115fa1215cc2d81cf885e80bcb81fa2545",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-osxuniversalstaticdebug.zip",
        sha256 = "91e488acdc75f0d7c869c850402f3a8d805ad96b75e1c461d72a0d87e687cf9f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-windowsx86-64staticdebug.zip",
        sha256 = "6200f8af2c1cac935f40a7ad08f6a24652f75018725ab695c6838b9bb0fb99e9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-windowsarm64staticdebug.zip",
        sha256 = "77aa5c05008e057e051f839c45dd32bf894fd2fa098bf633707a1a2c6ad79def",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-linuxathena.zip",
        sha256 = "5296e30d0913b5c22362d58761ab7213570a2faa87c62d39103b597851191362",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-linuxathenastatic.zip",
        sha256 = "5dd9ee9e56d1c221600df1377fb410b2a34cba679cd8b6f468535d279fe8e321",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-linuxathenadebug.zip",
        sha256 = "c43084a00ef7021823e6743d77198dd0b510e71eda1619a62ddbdb64f359b498",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.2.1/wpiutil-cpp-2024.2.1-linuxathenastaticdebug.zip",
        sha256 = "16d4e4bbf410ebd7a171ef2126e3e3a7696f3a81c39d572fca9c20e13f5a34c9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-headers.zip",
        sha256 = "e3483c140c58562f74264727ca5869c6d0051947a29c277507e0bdfabc266ad6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-sources.zip",
        sha256 = "11137a788ec53930635f0a6e692d492a4b1acd8aa390da4921ad78e3ee8e7171",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-linuxarm32.zip",
        sha256 = "cb49bb7cb78dbf3d94c9a9b1df60483f9582cf052aef0344de05690fbb0b425b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-linuxarm64.zip",
        sha256 = "39f0cb7bf048b6c0997e5a1d4e2beea2901ab9a0ae84a9e91b15ce595dc4429b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-linuxx86-64.zip",
        sha256 = "b56823f43fd5b55e37b7f4ec3b60a766bd05239d646113c570a38c63e71792c0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-osxuniversal.zip",
        sha256 = "3f34c75cd33d370701336b7c98eaa8ccd5de70e54a6caef9a41ac3abc9020526",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-windowsx86-64.zip",
        sha256 = "e8623d41de3baccb5d353b35006ea12c7ef87c0c365f3c30330308bb7be63f73",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-windowsarm64.zip",
        sha256 = "b63d2aa9763d77a2eb7243eb4054d0f88f0f9cd44564c9e553657ebc6c06a196",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-linuxarm32static.zip",
        sha256 = "0e1e4be381d42316a80a20a79135c6fb9a265c9fe4871016a0080470ec7278dc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-linuxarm64static.zip",
        sha256 = "a0465c0548fa93dea2b1591c26f8490ad663e9e7200a0ee2ad9a4ebd9a20bd5e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-linuxx86-64static.zip",
        sha256 = "2585870f0329fda28c464a4aa6b749410ccc77d6826bb8ef7b2eae1fa6eb821a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-osxuniversalstatic.zip",
        sha256 = "d110d37c94044c6cc1dda669d8bea496cf68f2cf2d9c40278d44a1d995ca477c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-windowsx86-64static.zip",
        sha256 = "b25bcbf29e1d08ecda88a092c19026069ea9dbe0649b3c94cb6f70b07df7221e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-windowsarm64static.zip",
        sha256 = "fd33e4ac378478a78ab8f9120c721f5705f353ab968dc305f6bab106e1e61a76",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-linuxarm32debug.zip",
        sha256 = "42e05549bf6323954262e354ede7fc9be4c45e9835e0e0112507439a63dac058",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-linuxarm64debug.zip",
        sha256 = "49cc29774790da4d2b64577cb3708fc3287bdfda9bc069caa3be68801255747a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-linuxx86-64debug.zip",
        sha256 = "ff7801bcc180371d488c7a8ddeb74a9e52145f8897223b71ba413c697f1453ac",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-osxuniversaldebug.zip",
        sha256 = "6552a4ac497b5c431e7ca8c18a24377109b1f72c9f4c96e82784c4d8e2331437",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-windowsx86-64debug.zip",
        sha256 = "1a7a0da3ba0843ce05dde9b70dc86f8dfcdd78e765cf8350dc7efd382996170b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-windowsarm64debug.zip",
        sha256 = "c68a9315c09730d66c30b64311593f5fc1e92f852147da9fa3dcec76e52cca57",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-linuxarm32staticdebug.zip",
        sha256 = "eaa0364f1742df7f70a50628a83c94bb09cdf52c96ae29e6d37426f877d93e10",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-linuxarm64staticdebug.zip",
        sha256 = "6484e9c7bb7820db45d64fd80463497913b722da0bea1c65de24d1fad53d53ec",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-linuxx86-64staticdebug.zip",
        sha256 = "ce275124b83736143f205b1583a93c146a054ec5f4216860cc016e108baa9f72",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-osxuniversalstaticdebug.zip",
        sha256 = "9fd2fcd9bdba837c580aa0296abae0bccf5f2e176074eec219531ca011887714",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-windowsx86-64staticdebug.zip",
        sha256 = "8c31752d823141f9ef0f906c43cf7e8d9c4aee287c3e5eb0084d2a6376eaf881",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-windowsarm64staticdebug.zip",
        sha256 = "cbbb891a7debc65081eefeec64fdbf1f4fa3e9d021c119ada15a1d753a9ff245",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-linuxathena.zip",
        sha256 = "f50fdd812f93492f1ae6278c89ee5ac77e40b545e75682577831d8a7f99aed60",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-linuxathenastatic.zip",
        sha256 = "420430751f8e0853e0c4625058874f9c9de8e8d18489b7c382211f8350e012c7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-linuxathenadebug.zip",
        sha256 = "492a4d53d9c81c86339c37dbb70c92cc92de6e972e6eac9d53e394687df220f8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.2.1/wpinet-cpp-2024.2.1-linuxathenastaticdebug.zip",
        sha256 = "0e23c180092408292d470cec17c405552e812bd12c6bc89b82d2bfe000ab418d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-headers.zip",
        sha256 = "05a7e586c72d05ac687a5ab4d47e6e5906c7fe6249d476840a855b25e7de53e8",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-sources.zip",
        sha256 = "c424c61e0bcf75ef0d10a6d71f9e3fa1918765bc4a9dcb23d72c401817832066",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-linuxarm32.zip",
        sha256 = "c798105999bea4b7716bcfe62685d62ddbbdc44bc47bbaebe1df3c291e739a1f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-linuxarm64.zip",
        sha256 = "c88b44c8d16a0dacb4c93959fb2aef1ab07ba6848b9b091fd9845a4c2adee1ee",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-linuxx86-64.zip",
        sha256 = "ae591c2b7a2500f735678ce00649fd04a5d14e327a94b6ee95cc1a0656780707",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-osxuniversal.zip",
        sha256 = "dd6d0761a1cb565567b056317c0ff9940e39262cba6a9d339c60c636204170c5",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-windowsx86-64.zip",
        sha256 = "fa1289d4a370eef03d44c81e74fbf16ddda28739e8da32cf29a07984c235b6e6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-windowsarm64.zip",
        sha256 = "d7ad4a930cc8dbcda481ddd8f3a56182981b9d49d66b8360908801468a042903",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-linuxarm32static.zip",
        sha256 = "fb9e0c945a478a43b9040759eae57ea4248ee2ac42df5ee0df2db856fb7ab417",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-linuxarm64static.zip",
        sha256 = "0e540fc0f3d486d56111ef071109a7848bd7214ade3f38ef3f2303e01c94ba9f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-linuxx86-64static.zip",
        sha256 = "03f894c0528601bdd93e44107333dab6696fdae2a98eafa5daddf76bc2d775ed",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-osxuniversalstatic.zip",
        sha256 = "6c44477eee547a6ba48981fcd80c99994d56c6bd7565645fab1f3e35ce7f9fd9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-windowsx86-64static.zip",
        sha256 = "b1848ba68384d050ca840d0765f8b9c9688f9108c4d42fcbb50545ec0391070c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-windowsarm64static.zip",
        sha256 = "c17d10d3deb607ae582e3bf16617ed1068cbeb311df0cd9cbe52573f3a12bdcd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-linuxarm32debug.zip",
        sha256 = "4109797e448978337cdac0792c9227074da3a424a7bfbf718efa15ea57730e25",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-linuxarm64debug.zip",
        sha256 = "dc9ab620dc677d0b04b4aad886291fb2edf78777ee4b849ab4521cfcb8e900a5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-linuxx86-64debug.zip",
        sha256 = "de99ba2fa097c08570d03ca6c5ac50a51faafdab3d648d5a81599da8aa19b3e5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-osxuniversaldebug.zip",
        sha256 = "64d6fed052ca3c370b95aab6f5b820d68be7a2118bddf3bc11b52f983203812c",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-windowsx86-64debug.zip",
        sha256 = "b395edc4d9e31941aa798ab09b5624396048b8efb8d23af67ee06fbd8beebb08",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-windowsarm64debug.zip",
        sha256 = "e083e826db96703994f4597461cae323839eb8c4674b1ce7534827d22fe0d199",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-linuxarm32staticdebug.zip",
        sha256 = "0bba6cc6817988228a79e602ad563615d1f32d333369470440e40695154b1d7d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-linuxarm64staticdebug.zip",
        sha256 = "39a7ad1aad5e06488907d1e9543994f05c9e27e16659ed238f8e5f960e8a95d7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-linuxx86-64staticdebug.zip",
        sha256 = "c46b1ba00968e0b024282a3d59489cfc58e792ccd0307c3740d63858252cf583",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-osxuniversalstaticdebug.zip",
        sha256 = "2097fd6126a3a8a1536d46a8cfa22c21f33da4587da0fd424e2324e4d15e73fc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-windowsx86-64staticdebug.zip",
        sha256 = "91ee3f0983e82239e5a8ea1a43a0988d20855f69e7374cae78696aa5e6dbc61e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-windowsarm64staticdebug.zip",
        sha256 = "f9d18aff2019614f3e3f3b0fde20658e5a6a93f9a7b55227535068cb19c95ff1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-linuxathena.zip",
        sha256 = "a5acb200072e45be6aedd0ac84869a0b04124ead2b9f8b2a867bca32fdb48385",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-linuxathenastatic.zip",
        sha256 = "e1c80d536ebf6936615e830edcbd0f7c17852971eda6496eda0d4d858fdf59b5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-linuxathenadebug.zip",
        sha256 = "4340390ced7a1d7b0fcec833709df051aaddf97e626badf4c2a5f0befe3808b6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.2.1/wpimath-cpp-2024.2.1-linuxathenastaticdebug.zip",
        sha256 = "29876582f06e5fa31426d90d6fef303b6ee6d7b419615b879ea471f274e3af54",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-headers.zip",
        sha256 = "066a90d74de26acd61bc49a2503988bcd6eed22e200ffa18f6aece77cd72eb1b",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-sources.zip",
        sha256 = "dd118dd3ee9f857ed03016757b9861646c851ec98bb04c31740d6f16749d6343",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-linuxarm32.zip",
        sha256 = "7a48e68a843ffad9d338ba1022671a2c9537a99441c8858b00eab43ca45d1630",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-linuxarm64.zip",
        sha256 = "205cfa69a1b1c1454f24916869de5cc0441102c4ab31b69d038603078100de6c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-linuxx86-64.zip",
        sha256 = "4e74a8dcc4ef02ac0266be7611fd30d28b71ebeb578c472e0782070f673f568b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-osxuniversal.zip",
        sha256 = "1e765e85ba2df6e0e3481fed84c1b38a3fa255c3355c69c7b942d6c6bd8e3e9b",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-windowsx86-64.zip",
        sha256 = "2c24ef2cfd2394a5bdd15cbd2c333af2864261bda55aabd05ffaacc1835a56dd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-windowsarm64.zip",
        sha256 = "8a572b999f3a776af0cc9b365f3aa115c87a6947dd52b548052c8136acedc9fb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-linuxarm32static.zip",
        sha256 = "e3959db031891687dd55e3e9faae0adf7e12f7613e773fd3976fd2dc8d6b25e8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-linuxarm64static.zip",
        sha256 = "558ca7ea688f91f00656402a4ba8430fecd4d4470c1659f983a6f65b22124932",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-linuxx86-64static.zip",
        sha256 = "c633255cba9da1f95b20aca826d83675985796e56cc8d39f556d9f462df92160",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-osxuniversalstatic.zip",
        sha256 = "bc2eae8b5511eb165882a83b46d13c2e90f9ac52b76bea2f482610ecfd7402f9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-windowsx86-64static.zip",
        sha256 = "3c21b8514640a102194b53816082aad6dd585881289e139dbf451cd7846f2d96",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-windowsarm64static.zip",
        sha256 = "35846baa718c6586dc39701e72c55239ec87a5197b4f1b452fb146d04822d2b0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-linuxarm32debug.zip",
        sha256 = "77d4ca0cf2c19295e59ab9d1158d9144375ec34bd623c89b45a0d6c7d24c9802",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-linuxarm64debug.zip",
        sha256 = "f1a8a293258c5af9878a0cb96d80eb247e39e5217f50f9bf21192f756deb97a1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-linuxx86-64debug.zip",
        sha256 = "6031cc3b903827f5d46915d4ff1548f2e2f4e970716bffc8e2138cff3d6e713d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-osxuniversaldebug.zip",
        sha256 = "692cd3fb4690f70d2b3ba811e73505f7cda9c6002108e359baac3876308c1ce4",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-windowsx86-64debug.zip",
        sha256 = "130cce787e1115c5289c330bf81a3b1652420e81dd79ee011605372b7ce2adba",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-windowsarm64debug.zip",
        sha256 = "255853c6b05d6ed476ee34dd2ee4a5b7b1f4e6a242d451efb67a73e7b4826e86",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-linuxarm32staticdebug.zip",
        sha256 = "d1dc3ccb416e0831e1f381039d031db17fd10d4954de2173d542f53120ef829b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-linuxarm64staticdebug.zip",
        sha256 = "7248ad614fe6f4594d0dbdf014ee927fcf820322fb063da5f1052f4cfc7bdbf4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-linuxx86-64staticdebug.zip",
        sha256 = "59bee88aeca9b13303c14849c4fcd59bc608e32d3c066157d0600cb1f2f26303",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-osxuniversalstaticdebug.zip",
        sha256 = "987d626d80ba4dd0b7827d44c63144564d943d35141c870791d4f0a7e725b9f6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-windowsx86-64staticdebug.zip",
        sha256 = "74e59ded5042e2b81d24f8e925bca67d112dc8260de9030fe8cd77108260b2c0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-windowsarm64staticdebug.zip",
        sha256 = "267875c61b0d2448aa89f9029a8cc1a6133c7338244ae93fe8ee2d7a8e55c47f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-linuxathena.zip",
        sha256 = "d8461cfaa37b9efbe986091b163bfd6a5cbd3218bf1cbe6fc2f0ba3f75ad2c50",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-linuxathenastatic.zip",
        sha256 = "79c2397b3b1e90efadd230adbc7211fe49d67fb095576e0a8bbf2972fb9698d5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-linuxathenadebug.zip",
        sha256 = "957cac37cc8c53ea6003b316a292fdfabf935b919c2414198555da01dae9a3c6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.2.1/apriltag-cpp-2024.2.1-linuxathenastaticdebug.zip",
        sha256 = "39998adcdb431eb6e4841f62e184bb8c5a84654aa763094e012403f2b84438b6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-headers.zip",
        sha256 = "8710b8bbb131d26edfd52818b2c013e8e7986d4d269675375e02635850d7e3ca",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-sources.zip",
        sha256 = "338288bf21f002baaa396a2e64f66928429ecb8124a5a26357f7c8843abc6e9f",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-linuxarm32.zip",
        sha256 = "e2d7eb158211a45c636d75f9a9ca67577aefdc53c47b4c9109f35835ea59dedb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-linuxarm64.zip",
        sha256 = "6f62da4587f3a70891210748052699e5b8186c10bb45e7e9910f9bf70a4fe3cf",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-linuxx86-64.zip",
        sha256 = "dce4373ccf36a3ad2ebeb5b56efaa3f852ff108f7d0a582d0f50bf2c20fbaef2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-osxuniversal.zip",
        sha256 = "777b580b61d80574efad7786cbff455450139bca4723bf2dd79a3a9c60beb475",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-windowsx86-64.zip",
        sha256 = "c6136dba2ce857a4d1dcca16d204a9ce35499b31eebca1113e6aa61020868a1a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-windowsarm64.zip",
        sha256 = "232af8ec463e0c1af8e241e5d0b9afdee4aec1e600f2823ae93f34dacca31fee",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-linuxarm32static.zip",
        sha256 = "4793613f638a0113f5cee8cbc6808c40faaec16ff8a6ff087cd7d2d7e899a1ff",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-linuxarm64static.zip",
        sha256 = "99508883be8090803c25c7e2e2f455da757f9a4123d0ddf4c9fdafdace0aea7d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-linuxx86-64static.zip",
        sha256 = "263a73dd9004d508d1577d04c2a4f9aa4567cc82473d544065f6bf7a214d1487",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-osxuniversalstatic.zip",
        sha256 = "5b3de0240c6d7d0a00f5faf7a97d2ec9a39f99442154e129c88bb7ea411a68d1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-windowsx86-64static.zip",
        sha256 = "3b90fb8e24092c17a05090e0c972810cc5f950463d58a6ea70a1a2f83033fd06",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-windowsarm64static.zip",
        sha256 = "ec029ec3362e978c4079a411e18f080435084f269edc1dfaa464069f90f3bbce",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-linuxarm32debug.zip",
        sha256 = "4ce9f4b2f0cd4513d472e14b6f796170d803328c7d070b5976cedde68182646c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-linuxarm64debug.zip",
        sha256 = "3caa64471db5605dcca6f58c46b74755b5c2431a91d9b1de78f2b7deabf94df8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-linuxx86-64debug.zip",
        sha256 = "896f892cd61bcf340e2a276d8cd32a48f46f0050f0fc89e7b9b7279876d09c0d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-osxuniversaldebug.zip",
        sha256 = "dc820eebad7e81f37eb709c11181d82ebdbeefd1c2521828680afde0e23362e4",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-windowsx86-64debug.zip",
        sha256 = "0c889b14a0dd9a4c8eaf13efd951cf472009768a072972f1d83dad67350cd122",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-windowsarm64debug.zip",
        sha256 = "cf72400d2ed5271dbea48a554e33cd5d72f90c725ba25acefd950723ad4c8a5e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-linuxarm32staticdebug.zip",
        sha256 = "c3ff1c6c3d291733fc449bd1c598ecbe711dc9153fd000067dbf7742bd7bf97f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-linuxarm64staticdebug.zip",
        sha256 = "87a43f65bd41814781004a1d57c5685fdd82a05015d3c68aa5564e93adcb9808",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-linuxx86-64staticdebug.zip",
        sha256 = "47b415a7889f0d533bcded0121ce927816ac9fb043c48d9bd5fe9455f0df193f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-osxuniversalstaticdebug.zip",
        sha256 = "d0ce293d21187ec28a4d457eb0d425f08860a7cc0d6bcf133ea66f31d48786a5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-windowsx86-64staticdebug.zip",
        sha256 = "e62875fc989e270d5bd3b52e2c355f6e0bea62d00448453ef99c2bef82fdf6bd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-windowsarm64staticdebug.zip",
        sha256 = "072f19d19baa844e75e511465c3f48c7f77a2502024a74ad6508831f77b57aa6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-linuxathena.zip",
        sha256 = "f7b5e812b0ab7dff3bc305c95796180b31d48debd4ff6d33a474f8851a5e1b18",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-linuxathenastatic.zip",
        sha256 = "b073cf7ed50125ca715f1d14e44664d637f6d0574c145373affbe178bc17004b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-linuxathenadebug.zip",
        sha256 = "dd1e3f40129d8c70f1c23495c8a7f53572d9212bf4ff3f5665697526d7e0b6cc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.2.1/hal-cpp-2024.2.1-linuxathenastaticdebug.zip",
        sha256 = "f0053661db73d52d3829cfc84a0f6ebd64f306fc01e5cc8267b22f90bb69730c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-headers.zip",
        sha256 = "59272ad0ca06556d2ebdba9362de6796b6b940b8310c103c3f62b858116dd09d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-sources.zip",
        sha256 = "337417ab6f7aba0adcfcaefb8a51ea6d1a52352f58e595cc866a682003cf1d8c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-linuxarm32.zip",
        sha256 = "9bb2e1f7d8c5e604080679d98f89bbc199352c7b7442f115a7a2b1d67ea37770",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-linuxarm64.zip",
        sha256 = "5cce2229b9f75bc915ead9f3d8bd91ef35d65003c4879b7dc17c6a2ebb14cb47",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-linuxx86-64.zip",
        sha256 = "f04fc85c6e35707be4d060a732820c47c062897332a33a69d5be4cf9e27408bc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-osxuniversal.zip",
        sha256 = "6890eb981d5b21b97eac13f64d2f47c96ed253cec223c968c7f49ed24d439e2a",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-windowsx86-64.zip",
        sha256 = "754f857a09bb26ee09319db183ad9c1f30f5b1a716dee9913d2190d6ee015c1f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-windowsarm64.zip",
        sha256 = "e62e594fe1f44fe4ca5421d5a8ee7522108d5a76013ab420abbe14bd65bdb7dd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-linuxarm32static.zip",
        sha256 = "566d0688d7c77950f8c459bba94131597dff0909bb8eb18536aeec531a1c7749",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-linuxarm64static.zip",
        sha256 = "408504849accf32ae048099e197e5574a8f50251b95e4f197ac16d5485162024",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-linuxx86-64static.zip",
        sha256 = "79d0e474330e485effaf5636f597d0ad989e7cb841024a34eae5a380ebe36353",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-osxuniversalstatic.zip",
        sha256 = "63b482f0c7100320a09d758808ad40279dc03ba0c95b867f23de9849b04255a1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-windowsx86-64static.zip",
        sha256 = "0a97cc22ce386305dc505ef7c40cfcfc65090ceb78cd306da43535bb21d52dbe",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-windowsarm64static.zip",
        sha256 = "72a7741f2028e13f241d841ed49a7a85a455b06e778cb018ac091741fd21eaa6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-linuxarm32debug.zip",
        sha256 = "8fb66f84a5edc02d459a42520de74e1b309332ef20791a5a21f6abd5f996843f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-linuxarm64debug.zip",
        sha256 = "42ffd613c4017575a48efb5ba8de472655f0313ecac9d6eb6ebde5a732419848",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-linuxx86-64debug.zip",
        sha256 = "1bfe665aeda2880730e665bf58cf81eb924de93b3b3b9480cffc200e4becd0ff",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-osxuniversaldebug.zip",
        sha256 = "facd5f83df423e9312e77d21c8d833c1f080a1a614943c55865394ecb76b8f17",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-windowsx86-64debug.zip",
        sha256 = "296b4247640c3e3c667c0753d876fd84c0f7f21f051ac4379aba3afc4b6d9982",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-windowsarm64debug.zip",
        sha256 = "bd086ca1a676a91327fbd09c35cc2f56417eb1d9d440191c15a666afee85b57e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-linuxarm32staticdebug.zip",
        sha256 = "3916c92367a8c2bccc89a68b925fe93238f41d34bf6287d22762151cd7fa9c6e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-linuxarm64staticdebug.zip",
        sha256 = "7fb4f645da67c9de6f40c8da6f8bdef71bc4ce365bafaa3a1ca3be7d27377df0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-linuxx86-64staticdebug.zip",
        sha256 = "e568d067bb8a24e13a0f129d44e3c662ef168fb37a72abe912e51b49b3cfbf4b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-osxuniversalstaticdebug.zip",
        sha256 = "7b64a8eb930a0cb45e24d6efcc29630219fcc01258f76634af0a350c2a8ebe7b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-windowsx86-64staticdebug.zip",
        sha256 = "c22b8fb1254f080a7d63eba9f94369f3dcefeb8158221d521bb3ca11aee4f999",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-windowsarm64staticdebug.zip",
        sha256 = "bea42f47f1faeb8bbc9f0c621ced4a9b4867a66cf351be1007502d9c1d922ac3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-linuxathena.zip",
        sha256 = "419a3578fd1f6f63e6ab30a9f5077ffa88aebdd9b8b074e59da75fcf066cceec",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-linuxathenastatic.zip",
        sha256 = "adbe2cc01a8e76d7904b312d2edd76ec36f586de9ce290e88130af449ed89e36",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-linuxathenadebug.zip",
        sha256 = "0a8db82a7046998ab1215eaea5c46c138d3991a375496f65eddec4f70a628135",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.2.1/ntcore-cpp-2024.2.1-linuxathenastaticdebug.zip",
        sha256 = "2e0f39b2e7397866847bbd933faa19225f55f5ba31997d6fb928b449913313a8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-headers.zip",
        sha256 = "fe5dcb83e2f7e3fa74a2e0ac679eb062b24b95e7da4c5bd01f68f09d9a27db78",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-sources.zip",
        sha256 = "f75eaaaa68632ce8d9aad6d2339b9cdd32e1e8d10815c7a780e5bb0d01aadc61",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-linuxarm32.zip",
        sha256 = "7f260f63c05b43831e04c3496b75b1bdf961413cc999b7adb7539600491cb493",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-linuxarm64.zip",
        sha256 = "9fca2ef86ec22c759ce0c1026933f85f6375f5ce6b45c89ac9d143db43fad6f4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-linuxx86-64.zip",
        sha256 = "eab5d1c8a31886d34a5eaa079dacd621990c422c2507248af57303c3aef4735f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-osxuniversal.zip",
        sha256 = "f976721bf60b89eb870e23e1aeae4689cf2e0ec7bc0ec3fe10c5aed3da63f83e",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-windowsx86-64.zip",
        sha256 = "550a97e3a7aae341520f17f141ee75132fa710d96186ede8df679d5b79efaf4f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-windowsarm64.zip",
        sha256 = "d99b3f89029e925e23ad15006848c9b849ee9fca1d917062f7e222a56c69859e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-linuxarm32static.zip",
        sha256 = "19d6fe97cd88940bc1d5e51e91cc0c38eb8275d0efa3b4b83a40b2473318dfd2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-linuxarm64static.zip",
        sha256 = "9b9e381e2fe4f3c750a05c2fcb3e0a0bbdbe63b1fceb45bfbb8ff2acce29c946",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-linuxx86-64static.zip",
        sha256 = "97ef9a47dc467ff4e04344b985b5cf3d99d7b09c1db1f8a814bc3b3b9fae96f5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-osxuniversalstatic.zip",
        sha256 = "86f379365925382b9d7233d9d8a6f7e2a0b3a7457d1afb901c26e5b2d9e4bf1e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-windowsx86-64static.zip",
        sha256 = "8c3b8c42779ea47e61d09aca3a4189c4bce68c1b23efe5d56e55379c3d6f7226",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-windowsarm64static.zip",
        sha256 = "853e6a88a29ac81a21005d47d2c36b83dd0c67f6dc46c11f99e38ff363766f1e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-linuxarm32debug.zip",
        sha256 = "975bf9484cedd18e1487f455a7dc61cbfa352a763778802955332c88ced0109f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-linuxarm64debug.zip",
        sha256 = "d3f0dedd7cfef787991e8e29de3edd6c83ebab9fb85e3901fa2f6397020604b6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-linuxx86-64debug.zip",
        sha256 = "86c8f18b1ce661a3617b1596f86a6b86d87721e3cf57b9e87a9fa3ddf509edea",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-osxuniversaldebug.zip",
        sha256 = "ca20ac7a11125b26ad286ee465925e680fecadb067c5fd9f737435bbabcae538",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-windowsx86-64debug.zip",
        sha256 = "ae854851b143a7592c345161bc33496194884a3cef630e94b83cea8403a67663",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-windowsarm64debug.zip",
        sha256 = "21f24a89c1556528827176bae3ed1c37f56c9a149edf302bde990a03def8e390",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-linuxarm32staticdebug.zip",
        sha256 = "5b9b1168914e86902623c7e8ac0ca1b1b41705d6f91deac8af3d90c53a2b408e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-linuxarm64staticdebug.zip",
        sha256 = "b3c8b24db23b8d97c264c8b9901729bc95b84e21ba6e9a07739d3b24b87b2058",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-linuxx86-64staticdebug.zip",
        sha256 = "d21bc73d8a4946338d123a43945dcfe2450ba618ecba18f297d61006ab406a35",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-osxuniversalstaticdebug.zip",
        sha256 = "5d9f003763a8e446c1117d063e76f967c719859394ae6a5a487521a13a4ee1c5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-windowsx86-64staticdebug.zip",
        sha256 = "43880cc2d44190e64c879f8bd51f693a1df73955b0d0b322ec82d68d4f366fab",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-windowsarm64staticdebug.zip",
        sha256 = "714d087eef1e8ced4796fe21b86c39aed5e2ad2c5f7f65997f1694f856b39ade",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-linuxathena.zip",
        sha256 = "f34a7cefcee23b5cee26b48664c958d7597d64c29147983c65af5b71282b7de4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-linuxathenastatic.zip",
        sha256 = "0c33bea49442ba9fedbec850ca71df396ae76dfaad96c922ece23de3280cf7ee",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-linuxathenadebug.zip",
        sha256 = "f75ab7562c815ac0a0176e8ba53fb5934ed0d5bc9435e8937e4e349eb7259777",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.2.1/cscore-cpp-2024.2.1-linuxathenastaticdebug.zip",
        sha256 = "f257da91e0a1ec572f6ed1abd64211077b897409f478502d7850f8c504000f00",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-headers.zip",
        sha256 = "d01bcd19480eb0f70cf80b483a4786f1147ec598920a83c5e9b36454ef07df7b",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-sources.zip",
        sha256 = "4bf936c887f6e65dd7746f298f5481bc1f92135cdd238f34487071138068cadc",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-linuxarm32.zip",
        sha256 = "e5bfba2b848be432b6eb6038558794ace6501b7be95b2aa1f06fee4eedc526d6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-linuxarm64.zip",
        sha256 = "85995d6cb70c0e258f528743939a148f5ebd382d1b14eb13d20db0358f19bdf9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-linuxx86-64.zip",
        sha256 = "2da53d700268095b402fb676981d873966bad1eb75663fbbb6e10627efb87f22",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-osxuniversal.zip",
        sha256 = "44d9be8de55b451a52cc829b1a4377236524cf8a001a0bcc6b45ad4fdb620e93",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-windowsx86-64.zip",
        sha256 = "66171706d331e36ce552bd5105e62a5e3676a288d820d6ec13b2503578c25e7d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-windowsarm64.zip",
        sha256 = "42ba05a5f44dd7cce7de69a691a6ed9f747b4a6e7bffb75933aa124b8aa36a75",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-linuxarm32static.zip",
        sha256 = "311c7c0d4ce81aa89ee7442f0fd8baffd2c2c1f0e4c5d58962d3225fe32413e4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-linuxarm64static.zip",
        sha256 = "40676f97b8a1810e0dbbcb9e925785e389ea5912f8594647e651faa886b4b8c2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-linuxx86-64static.zip",
        sha256 = "e7f0bda1ba3466a2a92922bc8b84732d2c7d7c721db0583dd22f5e53c8129df2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-osxuniversalstatic.zip",
        sha256 = "ab9e0864d5bf78f29e4d38926667b47c3629dfa145d3695fdfd4850cd23a1f61",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-windowsx86-64static.zip",
        sha256 = "8ab0013c4bdfc80e2397237650566f9e7ce334502c715f3401d4c880335f41f1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-windowsarm64static.zip",
        sha256 = "ba200c29ee97a2712855bfdee0e510cbbb0a09c4fb02988ca6ef0957ad433651",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-linuxarm32debug.zip",
        sha256 = "f6002de985a7f095632267f98aec0b47541ce0e497654df7839c8baf098c7059",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-linuxarm64debug.zip",
        sha256 = "7aea6865b548e79f6db8e748c2582e65c8f193ae5c569ccf132dfab91a307394",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-linuxx86-64debug.zip",
        sha256 = "fdf5bcce0e07e080f0e9994b288da7167429af5141f2553f4b994748502a5719",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-osxuniversaldebug.zip",
        sha256 = "15866287858bb1f4ca125bf78caa69ed77181b78c20a6b83f27d2ddecce76e27",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-windowsx86-64debug.zip",
        sha256 = "da508a79e2da44ad73eec87b0e0497c119678c73e46d58e9bf6de1fe54c3c828",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-windowsarm64debug.zip",
        sha256 = "96654d562b3acc6e7847e57c0e5757625f8cce7b6f4d1ae4f33fa5c75e67f451",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-linuxarm32staticdebug.zip",
        sha256 = "f77a0af213a225088396e1f4b279a9de51c710aeeff005648fa115ecca60c96d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-linuxarm64staticdebug.zip",
        sha256 = "d41f3cf99bf53953e52753baab17745b24a2b2e03d437a46dddd1298f0108d9b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-linuxx86-64staticdebug.zip",
        sha256 = "878c5b7414c7c347bf8955ecc9b0100ce9e8b27a028f92ebe487e0a0f2fb5b9a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-osxuniversalstaticdebug.zip",
        sha256 = "a99f26061ea47310fd49b663563a30548a10d56043c74b43921a2440d1f176e3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-windowsx86-64staticdebug.zip",
        sha256 = "6b7708ace7a05befc26bc749504b10f746946576cbeff9137d8c1c76bea62052",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-windowsarm64staticdebug.zip",
        sha256 = "931849090b14cfd1ebe94967adb72b2d9fdcc833ac08ac122ed0225c5267f1d8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-linuxathena.zip",
        sha256 = "de09287f950d14994af93ccb93fea580fd9fd4248ca738498687dc9d355bfe11",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-linuxathenastatic.zip",
        sha256 = "2a96c8cce7c35f5e1317e0440a988082984ebaa20eff63f2981c6b8eeaa21fd5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-linuxathenadebug.zip",
        sha256 = "0883e4055e8e4c4055a08e016abfdbd82f5837b5b7c10ee1818915fdff669887",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.2.1/cameraserver-cpp-2024.2.1-linuxathenastaticdebug.zip",
        sha256 = "6a70c4015c73025c16c9b11960be1df62b5adb26ab8995c6949bd434d037a209",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-headers.zip",
        sha256 = "88941f42b4accd4c1cccd7d52276a978ca133ae0d36eef1a4fb752f024ec1b6d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-sources.zip",
        sha256 = "ba820428fffb1950a9397897fdd0df757d0d9b3e4c0e95ef2155e6383d69add2",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-linuxarm32.zip",
        sha256 = "01c8fd83705d71d34ec597be6e9a250ef79301eeb38426916dad393d26f42c1b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-linuxarm64.zip",
        sha256 = "5607faa14fde3e4ebaab87781a5fd7079845bd4bd31ed491c5934da98abfd953",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-linuxx86-64.zip",
        sha256 = "66a420d5dd59c68d44e9c522078f42a9279b3d4c856ded4b410107743f637f62",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-osxuniversal.zip",
        sha256 = "cc1d27156a517460a8bba36c067a3802508e084c969afbf0402b90a2fb37e9d4",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-windowsx86-64.zip",
        sha256 = "e67512edc9bd116a7bbb37b59357ff724a89d8d1d1d627e110daada3e2e93c81",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-windowsarm64.zip",
        sha256 = "0537c5e3ecb2206aad529053a777599db4527a52a2a242a47b1703045f7f1f52",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-linuxarm32static.zip",
        sha256 = "8874b68e8558edb5669db244087f1b092685a5761d44995f676422bce566ec50",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-linuxarm64static.zip",
        sha256 = "30c9f8bd153e6221e3247a186441b241345460811ebcd34da5186c05df9c5f1b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-linuxx86-64static.zip",
        sha256 = "0cfe7842805232b567c8678844fe6eff6d84ad54515e9603952434fdaf636d67",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-osxuniversalstatic.zip",
        sha256 = "d669650f71fffd99dcfcf2b2caa4fe5adf33d1798b099dbdcfeb08443cf419eb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-windowsx86-64static.zip",
        sha256 = "371633ab27081906bfd9bc321c2433614a0bc0481c922654d15c3c39bfcc941f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-windowsarm64static.zip",
        sha256 = "395b71ce694e223830af70b221db7c3a063505dc46ebd908c2d6f86a37e2a660",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-linuxarm32debug.zip",
        sha256 = "c484aee1c117d2ab8a7831d3be269c6b675f9621ef00fa04e1b6805760a0b23f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-linuxarm64debug.zip",
        sha256 = "c9fa7c05fc3155b4f4893a98682a5ee8c652b83710266a7d4af3a4192bab49e6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-linuxx86-64debug.zip",
        sha256 = "fb0ed5c6077b87057eabc7c029f175ca5b83ec9eaef076bbc8ba1b7fd3973598",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-osxuniversaldebug.zip",
        sha256 = "b0d15b49a312551d647cf01e3bb9e8311a3afc7aa148ade644bfcb83d3d6b08f",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-windowsx86-64debug.zip",
        sha256 = "792f5789b71e311a18d3f424e024b034939f583a764ae9fdbbd42f5a4b2fc8f4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-windowsarm64debug.zip",
        sha256 = "b17b1a42d4d1c6e505b876c85a9a5e6cfa913c7f31682be927ead852d63af3d7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-linuxarm32staticdebug.zip",
        sha256 = "4264cb2295bcc1b7a221decb6492dedd3c20f0f14b20f944674d640110c686e0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-linuxarm64staticdebug.zip",
        sha256 = "8778c7f8ea1ca14313b85b64151fe4e19fd8196a12bbb84b99cee18119acf410",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-linuxx86-64staticdebug.zip",
        sha256 = "435e8a5f50d7d28ad5453ceafa461b2cd69f471e774a74432b23594559565d7e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-osxuniversalstaticdebug.zip",
        sha256 = "ee7102b7c742366d23ce9dbaf4d709e351006ab68dfa139aa270286b6ad30695",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-windowsx86-64staticdebug.zip",
        sha256 = "bd86d4f7be245ca3fa041c21f67b9bb3b0e90ec3cd71a925bc54c55eaa32b145",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-windowsarm64staticdebug.zip",
        sha256 = "c76b904c7c5dad2abe8232e88104806aa0e03e625836d868474013a89f585377",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-linuxathena.zip",
        sha256 = "68bad1c62c09cef79df9ecb4aca42c733a3a0f19705292a345a797ec427758b8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-linuxathenastatic.zip",
        sha256 = "7512451e626683304ae27995cf58668d5c7a54f87a74cfb0beecb885ddd0267d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-linuxathenadebug.zip",
        sha256 = "7a3d2fa2f1fbd05fada31005d9d06f6ef16ddb70f009d4cbaa8492b982c705f2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.2.1/wpilibc-cpp-2024.2.1-linuxathenastaticdebug.zip",
        sha256 = "10d6e5e6549415f85b73199a33e00c0d7cfd49230f7f68425cf7bfd677a3aa5e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-headers.zip",
        sha256 = "0c278eb68d9eaf265619db55a972fea9153d94611904f15bfa5b9ba438b806ba",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-sources.zip",
        sha256 = "3c79804d3e135f690ddd9eb24e337753df57e04d9b12e5adb18613d542d0b9c7",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-linuxarm32.zip",
        sha256 = "84826d036cf61ad83ae6dd3e133a938a17f81696c65f133f2203978db2bd3c80",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-linuxarm64.zip",
        sha256 = "5bcc76e3e81c1fe00bb876649789f48053083a1f3ed34546183e9128b6e677f4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-linuxx86-64.zip",
        sha256 = "fdbe4192d40d9f2993349bd791e8d1688f358e58c5fd611e7108985fc2c0ee09",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-osxuniversal.zip",
        sha256 = "246a913ec1974af0810554af938e3649d091a35c893a8b99245497d1b4979a21",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-windowsx86-64.zip",
        sha256 = "6dcd9c42f08bae525fb6f646c98b6f9f0bd4ce73661641a6ad571275db8f0b66",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-windowsarm64.zip",
        sha256 = "c9e07518b9b9630f301aecca34756d33332878da7695431bb068c180da330a3c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-linuxarm32static.zip",
        sha256 = "a81a0a136a08f7e17a109508b9697eb45814ddb956bef5ae57b7f4f08f299e29",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-linuxarm64static.zip",
        sha256 = "fca197d01eba55cd6360d21d34fbf995dbeea95b46a0ca29e32b634ddeeaa9be",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-linuxx86-64static.zip",
        sha256 = "595e2c44a7733c04e9c96ed1fab8967e8fa8829c65ad97932108023883b32fee",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-osxuniversalstatic.zip",
        sha256 = "59f94f6240815e0793582557a59037d0bd723a060e02971218125e0516b94855",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-windowsx86-64static.zip",
        sha256 = "fc394d166966616887182ed7250b2f416064a8fe0f8833c1f5f4273250cf94bc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-windowsarm64static.zip",
        sha256 = "720f19cbe2a641c5d8fdee3f1861ad37a4f8906f7b0bf5b7a9466626f4613e4e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-linuxarm32debug.zip",
        sha256 = "22ad6cd352f2cb1249f81319a804778173727c72f0f1412586f12604da1843eb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-linuxarm64debug.zip",
        sha256 = "29b4b805eab274d1c388d3bb4f187dcd87122b1e1dddc99c6dd65e4e9342c1c7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-linuxx86-64debug.zip",
        sha256 = "9475bbbef3fd81f309df651ee9676512651021cb43acdf81e9df509c9d2b34ee",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-osxuniversaldebug.zip",
        sha256 = "47924bc411c347fdb5f439cd087e292106a250237cf0f6a0718301ec6a351f50",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-windowsx86-64debug.zip",
        sha256 = "e70177f46d2c5284f5bc861224637f4139e00a77582da6f0202b239df98db5fe",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-windowsarm64debug.zip",
        sha256 = "88dd19785a41681c513a2dc13e683622b54eb4376df5b18c4d86cb2c60082622",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-linuxarm32staticdebug.zip",
        sha256 = "0e55e8083b4ffe2e8feecaf9c5b6d7f532c744e1a2946970a4c90a40d5c4dab0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-linuxarm64staticdebug.zip",
        sha256 = "639cb9d99e615dbdf0a94b15d49d885da6d3e0d0dc47df7af577d806cf58b487",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-linuxx86-64staticdebug.zip",
        sha256 = "44c35a6d52d477182367d9da16c7cee491010f4f007a06229bbbb8a0dc4d9063",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-osxuniversalstaticdebug.zip",
        sha256 = "ff54841016b492d3f358856b8051a7790de920272b17766610bfb93d5a5747b4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-windowsx86-64staticdebug.zip",
        sha256 = "aad8929c466e0dc475507e0a7c586c906492fc200b00c90a68dcb006245d1bb3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-windowsarm64staticdebug.zip",
        sha256 = "c8906e1d75fddafc8c2b1929d588e346186f327e0d2a36385538e711f468f4de",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-linuxathena.zip",
        sha256 = "dc8279db8de284a5e91824e207660ab2662fea9e19dc2cae5b0d52353ed93fd9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-linuxathenastatic.zip",
        sha256 = "f6e4ab4582c187d59ecca69d8d424616b65e7aee8164292b742790cff218fabf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-linuxathenadebug.zip",
        sha256 = "0b0fba23a8ea8793cb2e090478c800d9e1486dcc7f8a9e062c37e12684e2ae78",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.2.1/wpilibNewCommands-cpp-2024.2.1-linuxathenastaticdebug.zip",
        sha256 = "891d31d1f5cddf14b6e22fe8b2299d3b9258b0067bec0e16565662fc22290182",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.2.1/halsim_ds_socket-2024.2.1-sources.zip",
        sha256 = "005f889e6acb705b018d03c54473cc6a57c3a3023adef6c4345db6c887c9c481",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.2.1/halsim_ds_socket-2024.2.1-linuxarm32.zip",
        sha256 = "caf3236f3dbdd1a757e377af27c3274ed0d061e0dcf8fad221e5b430055d4303",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.2.1/halsim_ds_socket-2024.2.1-linuxarm64.zip",
        sha256 = "08d93b3952f1c37dc56c398c5d390c088e74d9c97619a6bc7e2b0492578b46d4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.2.1/halsim_ds_socket-2024.2.1-linuxx86-64.zip",
        sha256 = "34ccb0fbddd79c90c94c3c4f5cf8933c06c1e264dc1acbca60d664b791df8aba",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.2.1/halsim_ds_socket-2024.2.1-osxuniversal.zip",
        sha256 = "b9ae8c4a9723b2a2f4503525a555f83578281715c4ce42d485d9335cdddaab17",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.2.1/halsim_ds_socket-2024.2.1-windowsx86-64.zip",
        sha256 = "b8752bbfca1d64716a4c5486cfa2e9b395053189e6eb32b1d81779d4c8e68d98",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.2.1/halsim_ds_socket-2024.2.1-windowsarm64.zip",
        sha256 = "299961922504266d1fc4d39313de8b0cb56319f3bc6da6c793a0170849c88052",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.2.1/halsim_ds_socket-2024.2.1-linuxarm32static.zip",
        sha256 = "05bcd72eb4c8e0dbd90fff60ad7a0d3dcc2d9fc52100d2a2bda4301f9c14a4fd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.2.1/halsim_ds_socket-2024.2.1-linuxarm64static.zip",
        sha256 = "efcd13acd546e2615c1c9cc761ba6ddf9fca65474c5d659aca40283d96d84163",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.2.1/halsim_ds_socket-2024.2.1-linuxx86-64static.zip",
        sha256 = "e224bc8a2273d0dc42571851c6fe6092124ed17e7b53eab88a8526f49a82167c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.2.1/halsim_ds_socket-2024.2.1-osxuniversalstatic.zip",
        sha256 = "6edb893911aad144f0692e36aff4fce0ebd8e91df3f0023801ec5324d7b5a0a7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.2.1/halsim_ds_socket-2024.2.1-windowsx86-64static.zip",
        sha256 = "f6fed3961ce03fe44bab1badd8080bfa5059967f49af681c5ac8b6a0cdd2ddbd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.2.1/halsim_ds_socket-2024.2.1-windowsarm64static.zip",
        sha256 = "64f43bed1a874ea4c95d49901b576ca948f5f2a9c5c70c67262298c7ae6e2cad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.2.1/halsim_ds_socket-2024.2.1-linuxarm32debug.zip",
        sha256 = "e8958ce0543e5472b36c05c346bd9375e15c6e2929e795710e491b0c2501a790",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.2.1/halsim_ds_socket-2024.2.1-linuxarm64debug.zip",
        sha256 = "8dea6a2a8c838fd41967d274bda1d0d294fda59ab7af7b2776a79f0bd1a65329",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.2.1/halsim_ds_socket-2024.2.1-linuxx86-64debug.zip",
        sha256 = "261e35fe905649b179516b3c190d4e104f14ec4ae654168790dac29546678065",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.2.1/halsim_ds_socket-2024.2.1-osxuniversaldebug.zip",
        sha256 = "c7baad4a04b32907fe594ac10e959d291be1293f365470f9845fdb22b6e26a5c",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.2.1/halsim_ds_socket-2024.2.1-windowsx86-64debug.zip",
        sha256 = "d5c41fa73bedb3945b2a64b38bcedb9ba16defd0ad6a175cd2d69f0898261712",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.2.1/halsim_ds_socket-2024.2.1-windowsarm64debug.zip",
        sha256 = "7ef86aa2f4d01f8d2dbe445d41f7523e630eb6d33925f59b2b20e8b4ef1b8052",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.2.1/halsim_ds_socket-2024.2.1-linuxarm32staticdebug.zip",
        sha256 = "06f9eaba8730d9623c1167642bd8b6e070ef0f50e9a8e5e6a55cc587b9cc1d6a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.2.1/halsim_ds_socket-2024.2.1-linuxarm64staticdebug.zip",
        sha256 = "20b942f28c67b66a6895272f71a97966a290511c1c306a39aa401e540350c078",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.2.1/halsim_ds_socket-2024.2.1-linuxx86-64staticdebug.zip",
        sha256 = "372501168cef57468b311e0d1e399828061fa32b9a7b7a84c66ac35ce9c47515",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.2.1/halsim_ds_socket-2024.2.1-osxuniversalstaticdebug.zip",
        sha256 = "1387ffd52b7f8bd5ffb01afb0f11243da9f88d72bc60b577758fea4ebba47519",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.2.1/halsim_ds_socket-2024.2.1-windowsx86-64staticdebug.zip",
        sha256 = "90e4b9a1353b04f55b474b85c2e710617d270cae0cd7d8659301be599800a61c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.2.1/halsim_ds_socket-2024.2.1-windowsarm64staticdebug.zip",
        sha256 = "fa0eaa7c36588f566d6bcce2883f3f9b8b1ee837350e615c1f4568390e2cc29f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.2.1/halsim_gui-2024.2.1-sources.zip",
        sha256 = "667df71881041490254e65e4d7920d908af9510c8d844d294f2cdc8a72618e2f",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.2.1/halsim_gui-2024.2.1-linuxarm32.zip",
        sha256 = "55d05f2c4b3c15822300ba290a86117eba0cd0adb9412110e658b7506527ab8e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.2.1/halsim_gui-2024.2.1-linuxarm64.zip",
        sha256 = "082d6252362c64a4056e56a4d0b79b04d071791c29147a4a5bc87fe7feb2a8ca",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.2.1/halsim_gui-2024.2.1-linuxx86-64.zip",
        sha256 = "d774501aebf4167ac6bd0f1b491d297bb0d60ed721aefc13daf4f6db00c639e2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.2.1/halsim_gui-2024.2.1-osxuniversal.zip",
        sha256 = "27067971ec4acf78028e7ec1e2ea3f0deca428650ee51f61426223ff6c794f57",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.2.1/halsim_gui-2024.2.1-windowsx86-64.zip",
        sha256 = "dc29189f10d174dfe26eab127e798ffb7ae1852393c89e2d3b52b8237a6b2990",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.2.1/halsim_gui-2024.2.1-windowsarm64.zip",
        sha256 = "aedddbefcf586f77d657088778ac7d85c9eb65e19a159dee08e69610a5826323",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.2.1/halsim_gui-2024.2.1-linuxarm32static.zip",
        sha256 = "de388fe92e5985307329ad6219c152488e6bdbbde4ae05463341b0682f7f98fc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.2.1/halsim_gui-2024.2.1-linuxarm64static.zip",
        sha256 = "b7ff409d62f82f4cd818d8741c1634af0d00ba40f3260251cedc2c250cdc301c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.2.1/halsim_gui-2024.2.1-linuxx86-64static.zip",
        sha256 = "616a98dacabd0c715111bb2a71dbfb62a3c92bd4211b2b75d9d2fe75ab8d00ad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.2.1/halsim_gui-2024.2.1-osxuniversalstatic.zip",
        sha256 = "6675ea442b4a597467b18bada75b12555df5146978e7bad0e0f7879a46484158",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.2.1/halsim_gui-2024.2.1-windowsx86-64static.zip",
        sha256 = "629d8d8a7d06b41bb5bd4b9a5d84906101113ac6217eecc520fe289e2a8b33c6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.2.1/halsim_gui-2024.2.1-windowsarm64static.zip",
        sha256 = "2af0a86524bc55337cb41a0f89c5b2b5f24ec876980e5fd414b7132bdd5965ea",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.2.1/halsim_gui-2024.2.1-linuxarm32debug.zip",
        sha256 = "c0f51bee29e43597698e27edd8963306786e15e919b3fb7b091d0c461839a295",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.2.1/halsim_gui-2024.2.1-linuxarm64debug.zip",
        sha256 = "697f773b2013db169dcda324fb3c6d0f45f60ef720f96caafaf9231c1722ef97",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.2.1/halsim_gui-2024.2.1-linuxx86-64debug.zip",
        sha256 = "42a49b84a25d8fcf2ffddcb1d7c9b49d3793eefc4e20361da9f37425f2396ea5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.2.1/halsim_gui-2024.2.1-osxuniversaldebug.zip",
        sha256 = "951608ea4cc8abc4129502987192f3f314a2702e870daf81ac467ce9320801ba",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.2.1/halsim_gui-2024.2.1-windowsx86-64debug.zip",
        sha256 = "b99962b30cd0cb8f0b10c4116cb0d2b8927ff566afcc0b88dd91506043326658",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.2.1/halsim_gui-2024.2.1-windowsarm64debug.zip",
        sha256 = "2046e733ff4f4592065ad9c86bb8df452f5ba5453c76e3e33029ce67ad7ee9bf",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.2.1/halsim_gui-2024.2.1-linuxarm32staticdebug.zip",
        sha256 = "52043ae082acbf0eabc54fd976845720a602b8500544123213e99dc235b93de5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.2.1/halsim_gui-2024.2.1-linuxarm64staticdebug.zip",
        sha256 = "dd8c1eacb3f20ba9b8a8146a42cd0ad9d5e5796f8067dd11e33f3aff96efcbd6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.2.1/halsim_gui-2024.2.1-linuxx86-64staticdebug.zip",
        sha256 = "2cf4a5761992eca9acbb30d38a2035381b4f04558e83f7add4381a75659af510",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.2.1/halsim_gui-2024.2.1-osxuniversalstaticdebug.zip",
        sha256 = "c34994b57ef423f7df9711f39fc4b3042750d8aa48ef83a8b2c47686455fd8a2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.2.1/halsim_gui-2024.2.1-windowsx86-64staticdebug.zip",
        sha256 = "739b01cd9e9d501a2ecaf5d54baa4f8442e849416eef6f7ae937019d78f84e92",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.2.1/halsim_gui-2024.2.1-windowsarm64staticdebug.zip",
        sha256 = "51a98c44b9eb987372de92c9250e45b158e1b09c5c73f992b32f8432a1270573",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.2.1/halsim_ws_client-2024.2.1-sources.zip",
        sha256 = "3a40db26ef31beabf86e3d5d97d106c4f91ac647eb384247632c3ec367da15a0",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.2.1/halsim_ws_client-2024.2.1-linuxarm32.zip",
        sha256 = "f6d9aec214b69c198020c53509e6f45a566d29829319f3be5245ef5a85a57164",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.2.1/halsim_ws_client-2024.2.1-linuxarm64.zip",
        sha256 = "98881acad060ba9c59c2e8ea97c9d0c98f41e28ba780efe7c1b850851fc74ac9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.2.1/halsim_ws_client-2024.2.1-linuxx86-64.zip",
        sha256 = "4d4f8ee705c52721c670dcc94030c9af9b7af74321132b179b2c323b16d8d1d2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.2.1/halsim_ws_client-2024.2.1-osxuniversal.zip",
        sha256 = "e304c8ae309760071de52afd0dfb359cab941fd732fb637d618086b9850d998d",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.2.1/halsim_ws_client-2024.2.1-windowsx86-64.zip",
        sha256 = "f7a96b0769f08d28da0cd2ad352929a7bc341db93445c260e6563b6f34210032",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.2.1/halsim_ws_client-2024.2.1-windowsarm64.zip",
        sha256 = "4e2b1a261edaa19cafcd30ef3f56e1c6e6765e7082fb4bf7e938acf3ce3256d6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.2.1/halsim_ws_client-2024.2.1-linuxarm32static.zip",
        sha256 = "84ce5b526582f21cecf9de89476849cb82d4c62d734901c5a23c7f5a2d03bac1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.2.1/halsim_ws_client-2024.2.1-linuxarm64static.zip",
        sha256 = "e72bf18c33c66ba31ffcf5f28e2a825964a6d502e06003e6e7216008aeef475a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.2.1/halsim_ws_client-2024.2.1-linuxx86-64static.zip",
        sha256 = "bc4d21b26b2718e50fd29168b1c998a4be32f68cceeb4f2a5a917779f208ff9a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.2.1/halsim_ws_client-2024.2.1-osxuniversalstatic.zip",
        sha256 = "e27d65b97864ec7290b7692220c17ca21a3363cf006ceae8972ae2f3203ca42e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.2.1/halsim_ws_client-2024.2.1-windowsx86-64static.zip",
        sha256 = "d7a3d9d01e1639c5cd94c905c495e655b97cf92b8a9ce18c9c50d5643a406910",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.2.1/halsim_ws_client-2024.2.1-windowsarm64static.zip",
        sha256 = "9b6106127b042626007f487c28cdf25db99e417e438175c32215feace4720933",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.2.1/halsim_ws_client-2024.2.1-linuxarm32debug.zip",
        sha256 = "4154704fd587b2042d351436e49c6095d3cae9ac9d6ac40aa09643848a69c7fc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.2.1/halsim_ws_client-2024.2.1-linuxarm64debug.zip",
        sha256 = "72b3f376530850da9d9fbcde4e817725546cecfd95b95212c90d02238a7d116e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.2.1/halsim_ws_client-2024.2.1-linuxx86-64debug.zip",
        sha256 = "e14bf552b461c3943f765107c767ea4eafa2e60ab1f7f88a13bb4496b16e46b0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.2.1/halsim_ws_client-2024.2.1-osxuniversaldebug.zip",
        sha256 = "7eb49618416d125fcf7e9ea153cf1db5d05793d90beb406e715210feeb8f199b",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.2.1/halsim_ws_client-2024.2.1-windowsx86-64debug.zip",
        sha256 = "ac68b6dbe7765f948a11c3aafb9dbfe5ea7a6bdf5a9f737792e81794bbb2189c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.2.1/halsim_ws_client-2024.2.1-windowsarm64debug.zip",
        sha256 = "569d60dc5f0978a6b9d5b64461e1a6f7df18acdb584d0fab061f8ffde8926f41",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.2.1/halsim_ws_client-2024.2.1-linuxarm32staticdebug.zip",
        sha256 = "8d278bb05ad6032357c798ea58323b0f62a43e5dca7b0d12e34251cefdf912af",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.2.1/halsim_ws_client-2024.2.1-linuxarm64staticdebug.zip",
        sha256 = "7fbf0557b7905cdfd03406a17a6b4daa32e0cbb293cd2e265acf0bb747edfc81",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.2.1/halsim_ws_client-2024.2.1-linuxx86-64staticdebug.zip",
        sha256 = "da21d2aa5c24ac6f043cc175c4244b670950f666d204b826d1e5c68295bf6c53",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.2.1/halsim_ws_client-2024.2.1-osxuniversalstaticdebug.zip",
        sha256 = "7dd0de2bc9594fc91bfad174f8d4233658e6e550e6f19801ed1add3a4b96b8ea",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.2.1/halsim_ws_client-2024.2.1-windowsx86-64staticdebug.zip",
        sha256 = "22e242fe00dee75c94ac7b8920a10b079ccbf39a45b5b2b70d2cdf78023cdeb8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.2.1/halsim_ws_client-2024.2.1-windowsarm64staticdebug.zip",
        sha256 = "c606dcdd1d83b6c8956bbc7dfcf2e6bf20afb129001d5c51aabb10956481284e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.2.1/halsim_ws_server-2024.2.1-sources.zip",
        sha256 = "c433064ae2a77fd4ad0eb909bf1614e44b684b6c471fa3bfdd346652413602df",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.2.1/halsim_ws_server-2024.2.1-linuxarm32.zip",
        sha256 = "03b59df4da11da86b00c0e177cdc2245a8ce7cf2fee1d3e46788cca47859d8db",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.2.1/halsim_ws_server-2024.2.1-linuxarm64.zip",
        sha256 = "f8773632632ae6ebb7ed8851cf2ab77be367cf862e9cfc44ff676f3d8a721604",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.2.1/halsim_ws_server-2024.2.1-linuxx86-64.zip",
        sha256 = "8fe772447dd399447b615acfc70fc7325c8a11fcd18eb23e62e11d6ab6e905d5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.2.1/halsim_ws_server-2024.2.1-osxuniversal.zip",
        sha256 = "c19d73556527426ba264e6f97dcf924cef29156ba2e0988a1b75e7ebfafdd82e",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.2.1/halsim_ws_server-2024.2.1-windowsx86-64.zip",
        sha256 = "1e52c6b5b3b56e83d02e1c7b4aed98c10e67526ac79aad832c0aa0db7b83b1c9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.2.1/halsim_ws_server-2024.2.1-windowsarm64.zip",
        sha256 = "be84c63c6bdbb682a11837dc180edb972d4f4e3bf687f4f9293dd84cb9dcb632",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.2.1/halsim_ws_server-2024.2.1-linuxarm32static.zip",
        sha256 = "784a6392702fd799d2012294feee496fa787054ee4527d0e96aa2d4bf7ea486c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.2.1/halsim_ws_server-2024.2.1-linuxarm64static.zip",
        sha256 = "c96aea5d34ec390df18be28d913720b9d82798b38894d8367a880619042606aa",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.2.1/halsim_ws_server-2024.2.1-linuxx86-64static.zip",
        sha256 = "9ae0f8e301966e2cdd853d3fa0b39b138c4e987643f1271749243597ecf700c3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.2.1/halsim_ws_server-2024.2.1-osxuniversalstatic.zip",
        sha256 = "f3d9b1508cc26f44cd60710ad6d8dc88d089da9ba3ed7650a2501a627602f63e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.2.1/halsim_ws_server-2024.2.1-windowsx86-64static.zip",
        sha256 = "a23f2173dc7016b2ceadba2cf0ef4e885e5493e871480ceaaa1b3f1ab04e8cec",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.2.1/halsim_ws_server-2024.2.1-windowsarm64static.zip",
        sha256 = "874af9494c49fbff7720999b3ff49eb0eabc2c419fd317c022f4f708841f5c42",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.2.1/halsim_ws_server-2024.2.1-linuxarm32debug.zip",
        sha256 = "9450815183c5d6df328f9e995582f2d38f0c1081d001f642444d6249c420da59",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.2.1/halsim_ws_server-2024.2.1-linuxarm64debug.zip",
        sha256 = "f06f3b26d33b0f86cf8cd6d596b423f11fff7f43bff8b72452c3edbba3226471",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.2.1/halsim_ws_server-2024.2.1-linuxx86-64debug.zip",
        sha256 = "32886ad9f26288620201c21d96002a09ec67e3bfa752fec90c5404eff7b5ed55",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.2.1/halsim_ws_server-2024.2.1-osxuniversaldebug.zip",
        sha256 = "2aad84210d26104f0814970762460a2ada066b77dd4cf76352b8e7952734dc86",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.2.1/halsim_ws_server-2024.2.1-windowsx86-64debug.zip",
        sha256 = "578ba2b53f97a5fa26f70661bdd478835f404a7ca7d9247233e0f66cb0fb782f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.2.1/halsim_ws_server-2024.2.1-windowsarm64debug.zip",
        sha256 = "73723b31c40a17ca296711a30031016216abb5a2e2712334d59a38ab5b9646a7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.2.1/halsim_ws_server-2024.2.1-linuxarm32staticdebug.zip",
        sha256 = "eda777f5878620bfcc932bf4d139a013d5f312fdc0af363f333da5951535f659",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.2.1/halsim_ws_server-2024.2.1-linuxarm64staticdebug.zip",
        sha256 = "3c17950a14de445df07128ebb9e36b5e2ce12450e0b4f96709b2b512619fdb5c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.2.1/halsim_ws_server-2024.2.1-linuxx86-64staticdebug.zip",
        sha256 = "e5b64836ceabcaa21259088876d2de36e9054c8e79a37521f445b333a9f269ad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.2.1/halsim_ws_server-2024.2.1-osxuniversalstaticdebug.zip",
        sha256 = "133c2f0b6ec056171bbde8f9fef06980526840c9fa235255d3dd23df698fd484",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.2.1/halsim_ws_server-2024.2.1-windowsx86-64staticdebug.zip",
        sha256 = "26122a36186331f9913d9d93b05e4263b60e5524215ac98fd1c6f0d3301dcc28",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.2.1/halsim_ws_server-2024.2.1-windowsarm64staticdebug.zip",
        sha256 = "bc84ad2f7b6bc2e95f9fb3e6d5c95be72c575004f9cad649f39425aea7026c8b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.2.1/SmartDashboard-2024.2.1-linuxx64.jar",
        sha256 = "6051ef9921bb78f670cb385d8ca3fc66a2b5869dc7ce6ce78be2fb6ac05188f4",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.2.1/SmartDashboard-2024.2.1-macx64.jar",
        sha256 = "0528f1a610c390af1ae3ed14fa5d1bf24af9ad4db01e399726cb0a1bd1be3039",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.2.1/SmartDashboard-2024.2.1-winx64.jar",
        sha256 = "4a572afa0376507912b7519ae3f3646723a0a14c3256a400bcb539aad48f4d1c",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.2.1/PathWeaver-2024.2.1-linuxarm32.jar",
        sha256 = "ee120ab63839c0e0249801fe31c7b7256f805d433fd0c3dec876ee8253d24e2d",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.2.1/PathWeaver-2024.2.1-linuxarm64.jar",
        sha256 = "0444ef7eb7bc4966f8870456b1da9bd646421eba7380e101271946e64e87da5f",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.2.1/PathWeaver-2024.2.1-linuxx64.jar",
        sha256 = "0390ea6dae21da29d86188cf55fce5a90544330ec0661cac70f80f9d0bd4168e",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.2.1/PathWeaver-2024.2.1-macx64.jar",
        sha256 = "39a107d5c164afca1fd6b1820ed930b658c47046c08b7eb3cdc5e1d47bc94ae1",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.2.1/PathWeaver-2024.2.1-winx64.jar",
        sha256 = "c591a09641e4b0fae73bc71b3fa2017613d595f6226e95df2d5527ae44775184",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2024.2.1/RobotBuilder-2024.2.1.jar",
        sha256 = "e1ba64dd6caf23941c81c1d746dce9c54aa62c7d5d38b7323f7dfef6dd72d0f1",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.2.1/Shuffleboard-2024.2.1-linuxarm32.jar",
        sha256 = "176061cd882b3a82694876c9f1d31145bcbe9902350052b5b2db610c2c9fa15c",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.2.1/Shuffleboard-2024.2.1-linuxarm64.jar",
        sha256 = "ab27b9793459f2467ca0cce13d6562aec5128603ab32004ff46de92cc25ea878",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.2.1/Shuffleboard-2024.2.1-linuxx64.jar",
        sha256 = "a3568388cff8b909e43b0acec4e60c500d06c15a6335b29f754dd39a6ce36a6c",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.2.1/Shuffleboard-2024.2.1-macarm64.jar",
        sha256 = "a20e94d3453c09523cd12131aec91c520b75c07250458e2a47249aa8fbf7bccb",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.2.1/Shuffleboard-2024.2.1-macx64.jar",
        sha256 = "aafb288a2eecad92f53f5f86bd8bd7510f56ed55215bfa2ceeee3aabc66d6eae",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.2.1/Shuffleboard-2024.2.1-winx64.jar",
        sha256 = "fc28a46520225db09e7982497e0b08491769a416a20f611ce7d11f19f6ef3ac8",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.2.1/Glass-2024.2.1-linuxarm32.zip",
        sha256 = "bb9fd4f9e2dd82b7bbd7a341a59c577f6891c063204284e9c5cb1729ed7b1a16",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.2.1/Glass-2024.2.1-linuxarm64.zip",
        sha256 = "655247773343f363351244023057fad17010fb85ba942213b3ab5a752d3b1c5f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.2.1/Glass-2024.2.1-linuxx86-64.zip",
        sha256 = "04dce69ea458d80a683f3f3e25b79cbd05d0815e7768c5fda4d265c5b0e3c5f7",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.2.1/Glass-2024.2.1-osxuniversal.zip",
        sha256 = "1d4c820d33440577ede8579f2cf1d9738378a53456fae53fd2710fd40024e821",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.2.1/Glass-2024.2.1-windowsx86-64.zip",
        sha256 = "0aeda08a5d3fc6b9b5c47880fa5aaa6e914f6b3a94cbfd1927788394b160fc3b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.2.1/Glass-2024.2.1-windowsarm64.zip",
        sha256 = "5e7993a79a500aab7e9c83dbc3c1b8cda4aabeca991775a1e01c08cd9fd22d6f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.2.1/OutlineViewer-2024.2.1-linuxarm32.zip",
        sha256 = "e4668a1b26bfe952ed4fc32cc0c2df16ad45e06c6d30774bca593e9a2854a430",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.2.1/OutlineViewer-2024.2.1-linuxarm64.zip",
        sha256 = "44a4148df01bce1acec81929cf035c21603e9eeaed88377d6247ddf43ce91769",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.2.1/OutlineViewer-2024.2.1-linuxx86-64.zip",
        sha256 = "5c6ac42493a3bb2f570753c0f2fdc82516c68b0751be11b3aba3130cc101b48d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.2.1/OutlineViewer-2024.2.1-osxuniversal.zip",
        sha256 = "148e4694804b6a7cae93d3a78e9244cde4ababe62f1609a83720f40718d4e9a8",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.2.1/OutlineViewer-2024.2.1-windowsx86-64.zip",
        sha256 = "d55e12acbd6a4cbc17d441fb3fe589580fb4cffd20e846fc0cfb7f32dc9e6f0d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.2.1/OutlineViewer-2024.2.1-windowsarm64.zip",
        sha256 = "12ac0faef3c599358468e7e51615e81f67e49fe67e9418dac8c47110d00b37e8",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.2.1/roboRIOTeamNumberSetter-2024.2.1-linuxarm32.zip",
        sha256 = "565a7ee15402955d70096d96eab6440fde35739d3ae89c3dee44024580f172e4",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.2.1/roboRIOTeamNumberSetter-2024.2.1-linuxarm64.zip",
        sha256 = "7e6f867a021f445246d3a5cc375b4ea298961b9f1f2bca1cf016a869cc2a0bb9",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.2.1/roboRIOTeamNumberSetter-2024.2.1-linuxx86-64.zip",
        sha256 = "cc755154209ffa0cf2b83baba6677f1334ca1e438cdc55340e814718b68e7be0",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.2.1/roboRIOTeamNumberSetter-2024.2.1-osxuniversal.zip",
        sha256 = "5fff382cbe1b0c50c728055d8ac14977698eea3e720e956900ee8790ec985271",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.2.1/roboRIOTeamNumberSetter-2024.2.1-windowsx86-64.zip",
        sha256 = "b1e45c52b2a11e9b5c49721feb3d8c27b025f5486b664b1ac01fca5d553fcb36",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.2.1/roboRIOTeamNumberSetter-2024.2.1-windowsarm64.zip",
        sha256 = "0d42a858d89de0b3858b8bd03e2dc978c98900c04f990a93d08994987b417c69",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.2.1/DataLogTool-2024.2.1-linuxarm32.zip",
        sha256 = "1f3f1b297f92fb8e6394f9dfabcc94e5e88facb899c2c28c14cbfc3f1322c1b3",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.2.1/DataLogTool-2024.2.1-linuxarm64.zip",
        sha256 = "71bc68ebba390a4091f92f259a78593e00f98c359bd6b704c482dc8d9f9b2a8b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.2.1/DataLogTool-2024.2.1-linuxx86-64.zip",
        sha256 = "509a5172ceee383329f49647cef75dd48a33ed27e788669d99a43517f53478b1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.2.1/DataLogTool-2024.2.1-osxuniversal.zip",
        sha256 = "174d6c0db75158c4b1a14dd9bc50e3ca4731a2699e617f61b5dc7c9495bd3845",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.2.1/DataLogTool-2024.2.1-windowsx86-64.zip",
        sha256 = "1a6f91b707f0d627596a82f190d33a04a6560f2e0f16ac7abc365996d4a0abe1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.2.1/DataLogTool-2024.2.1-windowsarm64.zip",
        sha256 = "44cdf1339129077ed6faa8905110f1ac1d5843a00d15fadfc7efcfd606a812fb",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.2.1/SysId-2024.2.1-linuxx86-64.zip",
        sha256 = "f253c62a49fa4e6fb6dbf7011f8e7f8e128ff1337ee9a9d8dba6964d895a6c19",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.2.1/SysId-2024.2.1-osxuniversal.zip",
        sha256 = "4f38c3b49b159c3b7845f9442a618f5d53e3a1c8b427be46c343402795f308a5",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.2.1/SysId-2024.2.1-windowsx86-64.zip",
        sha256 = "981744859b7afe3e1162383468de45b857cac246545e3386b25e93134a18de96",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.2.1/SysId-2024.2.1-windowsarm64.zip",
        sha256 = "119f1278af622a9c26d7ad52d48e3dae88d0970085b0511d93e366b34c4a094a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
