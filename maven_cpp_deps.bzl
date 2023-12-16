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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-headers.zip",
        sha256 = "05e9902012186a9dc47cba97222d4ac58c7d237607027b9226bc10bbabbb9655",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-sources.zip",
        sha256 = "55f34aee925bead88ddd57de6ff806696870f432681b9f76a75a0cd2fa144645",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "1e2855fed59d51a4c0f7225164b5c0b3c0f9e8c6fbeb525b4eb2641464d114e5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "a183661cff8b5c726f0c9bc17bcdcf8d42211a072d7ba364c688fe920e41b450",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "e7d563f4257bc29962cb0852c04b7a025520f69cd3fdab84d9d9527c5969e642",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "8265f8662511f71cec30024a507cf69c93319368bab2057ab74c133b9eb0d986",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "6de079ce263c416e199530cf4e3fb89bb34c22a29800a56fd20466fe826d086e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "e23a21bd543c84c696a050f773e023d570d6e4c25f5f0d3fb29e899dc2657cc8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "b6b59d0b2f2a049fc6710ff7cde0364cfd98d3d4c1b23c170caffff9dfb10697",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "c0fa12116fde89a47b99bf936b8ab331db2252b763ff7bae7e4f148045cf32de",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "1a018b60f32fbf583db0436297d246562d65cffb4886a54e1db304ab8decf3d0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "1d7ef632b36097312c8d1dd42f4ad395652d969c6619cbc249dc3a7110a3414b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "ebef570124b58810a71a4467ca28ddbf9e560b8ef43caeeb7c4b31d6e3b617e6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "ccc158c6008877ff4df3fa4a42f594246e8261d0bb95ee96e77053ab7aa2e321",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "ebc8a60e202587cd48fb1c56dd3c26ba83f97ac10d8d5a715d8a8339c110a271",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "a8e3240c18190aaaec01c6b0c1393e04787bfcf62d0e4d1e04a15472af856e61",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "299878c1dcd3ea1d25672b9e6566b52d47d023b23c1b264cbb2b9a5b909a3d41",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "69ef777040cf842dc7795ea553bb68f1fe398ab3b61995b9d12c28ccc0a4f546",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "511e8b7a4325b9a21e062da3e715046ec40ebd769ec673c86257d4b17d0ad195",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "a337946c332f9ec5f36cade3093904b90454f9fe8e1d8010030aa9b2e734cb81",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "8aa87b59d74095e81eab60736306973eb748ee80d5cc662453b35b3e3c45e2b6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "082d046e38fd9a6fb65243d62df3f9246e9830d6b084dbbc4b7a9973f60fffd2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "60f573ea6810279292cedfbaf0aaa09e9276dd164135f76cb5bc78c5381a06da",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "ffc168dfb383f88263e27e8dfb61fcef70bd8c36b4c11231fd13302e69f1e33e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "41903deda9fe4ae5cbd6691ee5f703018bf6904c4a67916578d2791abc3b165c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "9f6c35172a8f0d1168d3d899441d475fe32b0f6053445e6164d47626262953ac",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxathena.zip",
        sha256 = "a2ea25cf07eb1c0334076a9957ddd7523e838a00ceb12672eab59c62f2ce54d9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxathenastatic.zip",
        sha256 = "f12de6ba5c20a72063f64a0b0e4b7953252311b608e86d05f6ade864bc8d6de9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxathenadebug.zip",
        sha256 = "c17034a9e9a5146fee7882984a13c97163913e0fdc1d8d78162533e9abd8a563",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-4/wpiutil-cpp-2024.1.1-beta-4-linuxathenastaticdebug.zip",
        sha256 = "42decfffd964f9ae032e8e8778dd2e7eb2f3986bf3ecc7950e62bc87914bf62a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-headers.zip",
        sha256 = "f5f435043e0f555df1c97ac01dd532303ede739f0969c83ac903819337e54d36",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-sources.zip",
        sha256 = "0fc607525b7dc5ca8e447317102773226c5c17dae21d518404c1299b5680381c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "9ae0b3e063ae11dd938c9cf70f3a3df8034d37bd6237dbda69c002fdfa6aa6e5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "4178d7a7a144d7e9e892705f4c91af2d73369b94ffd8914e5486ae0450bf9199",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "3a375cfa10fb306c2f23939845fde14ea61b4ccf737181d355399d8e28c6a3ec",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "9f00d70198144b4505a9578ab75a89cf180cb064a661dbbe938ebfd59d5f6a91",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "f4eb7d3b2880e09962778356817a7d0fd51b31e014c754c60c0b1dea9410fa85",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "65f6f963adfa45d36a04544783c005a303b85c3fd1cb11d7eed5ec27f331613b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "00a0cf420d2167870734cccb619020fa8237f0330ea1b82cf0c04bb629c6e643",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "edbe721257a845650ca83bdbb9d732f2225c52c45c7833296d3a67f0d2a3a20d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "860d50644254046176c1cdfce39e89512709869fe8ab19f44ac4452b92af8ae7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "b417e6875ea061c1d5cefa9e9cd82ee0dff173e35240be5c32ba41baec9024f8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "314500b0706da37cc7f678093ad2a8a32bbad151f6ae28acf759f2d17988cd63",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "3bdc59d0ae59ae3dd0473768b854d0d4224e50f7774dec05f98dbb1c5a4d8908",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "e898ec7cff2a37cff9fafd6641c77520e62252a415e9ab95ab8309b982e7cb97",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "f599088af3f577b6a8d7ce61e1d7f0960c672ca99458cbcc87d0ada867a23328",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "9a7b0d1c33f822072c34d7f82d3e45f4ea2d16d0ad160870370d49596aceb05b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "7aec9db9b501398197b1d19a3fc83e7ea8b85d19296cabe93f3680b452a3b5b0",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "19eca32658430ede2d9fcf0bcb6d7184c7a7601574e5ee2af68d78b60f926c33",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "765bf15ef77bd893138f32d3f7c0895fd44167e222a6eabfbbe121595861f7b8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "c7c3d87ea6ba1216d1c87f09efde3ed77c7fc9549ebb921065e641e97cac4bcb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "0d2c2727a057f8ae0ecac78228e8c2f362063c74315d9aee9e0fa951d2372544",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "7fbc6230babb8f2fb8c370ecbac0ea72319dfb755d1a15840a43a967ae100f07",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "7b8662fa2f78fa42a3a58821d71334af66bacf196c78fea75471321c27eb3b83",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "451ed2cf99ee7433b12a7ec8f5435d98e2d6d93f1b028069acea2247082a7c9c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "8784d8a6e46c14ead28d4b7d4dbf1b8d0701fbd30e53f56880ffaf3dbb8d728d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxathena.zip",
        sha256 = "1bb67f583d3b02f73c24dee83d131eca272df2b53a71ef4b6eccabd0616e276a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxathenastatic.zip",
        sha256 = "b45537fa534cd4afcaa6f781501609f0f7757cb1cd690afdeb689212c18adbf7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxathenadebug.zip",
        sha256 = "83d1ad2568624e8acf2826959c39edcf8bbd528417cc811c9b7f4decbb587f11",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-4/wpinet-cpp-2024.1.1-beta-4-linuxathenastaticdebug.zip",
        sha256 = "45b146b57a099e5ab0bc7d05046a2871061fca95888064b736102fab0af25b45",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-headers.zip",
        sha256 = "0eae61f496fa63db060da7aa03459adb5308df0d9b182b185c59ea1d96a88c5d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-sources.zip",
        sha256 = "7ce6b69180cd2db51145b41c430047835197f861e83bf6ee9d6f07899c329825",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "cbf9a6cf5bd4a8137e653ba08aba0fd46b9eb5335535b517c2296b5c37c178b4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "a12e4be04690c15602989d4ac882e3579c924aafc90316a66e3506ff0e91e11c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "5644ab5cea1f1b786b066494d69c0b9290ec3cfb2336c15239a96d5dc2fc96ef",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "ec0e230558478e9860974d5064cf6a71d8b45932f13d2f119df4836eb44b9258",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "9767124094918582b986ab83d01602f5091b0a7b4d22fe49bd4fd0adfcc6c934",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "82f3f99a237f8067fc269fc7c3f3953a6dd22d1ca2b096fd544d5aa0e357b2aa",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "b925174b67436c2a1ae52d17d18570e056288dfdab1c11d9332176f1d06d7208",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "b859fdb0f74b5dbffe947c94857ffaae96694bed6320ec77afa944e7fea1f0fe",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "c77e0089ff5ae343d05664e48f26a699ba13bc1fc4dec698ccf2364714e4f6de",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "fb1bda2b2557b5761a356869ec3232779a2ea923824aadd021e402dac5a93be7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "55e200b92a1918c8eaae6959ab5bdcb59f9fed501e794c63e9cbaf47626e179c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "441c13016d344ac6c63572caff2f4e08c150ea6f57756bd2b4c7f6a12be6cee5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "78afd59d227d821d70f5982adc4e1189cce6324dde9f4f7a6836fd53309a89fd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "95390a589afeac5e181f12da037f48270e810b4e81121f6682442fa86a556599",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "5466c356dc69e61f878daa35e149881e59437860b5ecc082e1add0642a0b51e1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "6038b7d5580db5974f08e3249f1870e75219927eb68b25f0f1b7a324d03bfdb2",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "01a514ecc8896779fd065e47fb5bfbea308d63e3244b84ecdca5c6e15140ecaf",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "133ff7f92833fa3a3fc4f5a7fac9b49c8f12b8ccddba766afc1b8828a4faa660",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "7c6041eae21a985c5e39a85edf27c6a724adc76ccb6ca5bd08d5a765a6d32623",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "2712ceec4294aa6ffde5bd0b232ba52960000519853d53d1f09b8c94f45a96fa",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "ec48c3759a2df2a0af9180d4d888ca76ab9104d9cea181c31f6a83c75be3e55a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "874a5996d2f8dc0be6a82c8027dd8d4165af8b0873d9fc414e607c4fe3f0fdf4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "802b5e13ac959d1062defb1e87274a680dacc96ccfe047276b78fd1544b425f6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "db6caf420ca349696e0b581ff371ffa4c1045a19798eb02a34f077fbc69512d3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxathena.zip",
        sha256 = "d951ca8299247f3bf6df965b8654bff3e1e03d273fa67aebb40b705c696ad47e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxathenastatic.zip",
        sha256 = "e7467f087899d68eb154a76ed2915c6440848089c9684e252a23337cbb62b899",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxathenadebug.zip",
        sha256 = "65433ac42e734fc7beb39dd62938e6aa6e4e6e29aa2ee44c64c58ed6264e2987",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-4/wpimath-cpp-2024.1.1-beta-4-linuxathenastaticdebug.zip",
        sha256 = "022d6e4323bc9c6585e5c109e0300865bdb6f84c1e58ae09acadd3dfeb5dd4c7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-headers.zip",
        sha256 = "4114e82d8750c7de1a1e257114e3f343692a93fc607b4adae053533b0841c95c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-sources.zip",
        sha256 = "4995e00b11a2bd9db55bd6f414fe98b6d7a4984280179cfb7d3140642d6bf936",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "12863349c5093be897eed31e1eae93bf917f5f559f94d48086792c3b6e27b89c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "729b65e3f20b13a2df7a89894119fc60a96378eee69249f188ab993466350079",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "f85f9033ff99bff76638f67ce5ebd450f04037bc803341809b29883f575ad6d8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "08330e0eae27ab648b5fe4e203643964b6a6a3d0dbbbe1a629e9590b949e770c",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "e2a9fb60b0038b9f0966d1b5f6f171a0af4e154ea1c10c1778fa0587b373f4b9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "4ff9d572679450383df34cebcd84c3114a6a1ffcfa885971b8ea4d02d3232d75",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "7626471a3dd901c88e99369682e8926c924d06187898a1f37c33b394b996db18",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "ae4d96a9666406237d90879ad45d293401b5d3abd7d04375a013aa3e88ea61e3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "cfd8b52293cc77bc929fd8070515054be4df3859b7c70eb4a058c94fcc141112",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "d836fea0eef0cf7c9586a3bbe622868f93a57b7b172db61dd8abfcbb8ddaab4c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "902bfcaefb015fddb88db0a1ada83709144a1fcc47aeb129b83239c3c93c4b11",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "2910bd30bab4dc941afab70144ca46df80f28a2f78fac27fff0509878022fe6d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "42f4107e00d06f52c3ee8cbd46f626aca4c6801b1c4e28adeb6ca8b55e0d11fa",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "ded8ae45ee8ffb03cc7018aa3778e3f9fd1751e37e881af4e585762e99f91514",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "bf94623377b6852eb15d6eb2a523e3098de39cd41c7ecea6768e3b7328a6825b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "b9a52c21603d11b98eb01d27091c62be7db569b680e3405190026aa283e1311a",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "7d67803adfd076f03b8e01c01274be7d4369dce0a2356ec8ef7bb5e7d8360ec6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "b25012b613d30d86ecf7a8f0521a80bb5ba8718a31b164df2fb334c7674f1548",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "5a54c26747d5dc4e59fe6df46c54d46c81eaad2c657ed6333ceb03f11e4643da",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "31c8a31d6f6233e4e6bf5fa6226de04d297bdfdeaecc154e81be0b41acca8f7e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "561b3012537b9da5a5fa9c229353a0a0a0bf293813641c77c5f4466ab671e461",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "8c1bbf7d9d20415911deabfa987ab2d00f2d208ed84fc27bde97f1408fe09a64",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "9fa1d94fd56c96c0a27d1d07dcd7a18a021d0d709b51aeb72739841a5412d49b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "60a9de4fe4a52a20d36401d42dd3ab6234a685dc9d7cb64bfd5049c6ebdabdbd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxathena.zip",
        sha256 = "99014f7009dcaba396e7943322787b5797e604c86bd6a86a59b4d8ff98c96756",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxathenastatic.zip",
        sha256 = "029bd34a498a01df790a7b1c0b5ffefa5bd89e5d3e53eecca8f08cfab656b9de",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxathenadebug.zip",
        sha256 = "3ae1239d9ccf49152db56a843f0b720ed6208b7975301b5b752853c3524d8c2f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-4/apriltag-cpp-2024.1.1-beta-4-linuxathenastaticdebug.zip",
        sha256 = "1c2a7a22ac395b5c7ac4bae8dd471e39ec52b109595e8f43979de2c9f16f7367",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-headers.zip",
        sha256 = "e20f24f42451b8254ecf40ad301a0b394d38d76f37ffccb0d33691c2d6d3ee2f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-sources.zip",
        sha256 = "5e0fac43bbb901a7b6dd922355fa3f69ddbc5e6787727dba53f4ef0d2b38c92c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "95c635346e3b5ffcacc02773ab8ac875458c78d4abc3da62f9c56842856e838b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "60ba09aad8d04cf4f64a621fcc6ec360d6504e15914358e3ec75d36d6c548158",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "f59d1560476d171994ee0f9db23da48410fd265ebdd8d88a13eadce315149b5d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "585c7b44749c356208ea69f1c987559218663b1645477b4a6b3f492c2ba1969f",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "b142723a26f79f1afa9147ba2103c4916c7394d5b6ee39d6fb4db29bba42021b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "51beebe40ba71185ea9b1bd9e7cab56d82817a917a85e4dc2c722f6df0316da6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "8a12a53a1b3f924d12c6b9cb2c6f14ab633347c7ae782ffa90dc688527101ad5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "a5830c9c16cd7779fd0d0a29d7328fbb5ac7f08f8697eeae25347639982843e0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "d5b72342bc3b13fe96b1ca053f19eb7019ff189b59e4a88f88a51ccd92c7ed66",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "3ed563d93dec967e503b5b1ede7157b3ddf54c1ca96b0cd80f6aee08ea26800d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "5058792b1540046dab28476998d62755c79dc65ec80b7873e95e3abce3058dd3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "d12a5c36ccf5e07239ad89b6647334e2e32d0238ba68d9d1d40152e12498f29f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "d9b02b42f97b17cc345f218415cf679d5c19331848e72d87b013b7c57fd0cf11",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "642665fe8e8825d1574a1a8b23b0e63e37439bf4dd57ef7bb021477f2ed964bd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "0b180c0f335ed8068ae69ce91ba6aba7a0887ba52f6156fa8911b06f206b8a0a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "cac3c41f7580c711a98a9f769216da89484afc5daace333e186370044aaa2af6",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "87d4ba812837e410e70d3cbbfd1cb2c5e0c6fd4503ed22508c6f5c8ed0013f27",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "302de678fd2dbda62ef75e78e1801286cf86fd91b4c050d6e3cc42c864a59c7a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "174e8a68eae4c5023bb77c3f301cf41ff91b468fcf1c8128ccd6fb72d1240b8f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "6606a3754127374df0c8127de0b10b4ad30086daf0a5cbce53d27da52912a5d0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "52cedeb66b5b4b77529b2aa4907d8fb008613a1ea04a771de1894d6f0472f69d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "0c92dbb9eae6a1499a634777acb3f0b7cd39e7d29b98ace1bea2abfee9e72ef1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "c82bc7c42496383d15fed9e0b1d72a7aa8f3140d5aae983032ddc9b77d57e999",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "44985e43cb9e903cc5ef7a128c36f0cc4052f74866a047679d77049ba3db112e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxathena.zip",
        sha256 = "72fd6a4c14953b844dfb6bd7c556d65a979ddd61f3f7c112864e62cbfd1077d6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxathenastatic.zip",
        sha256 = "ff227ad2621d29c6bd4828db08300dd2c17307c178fc23a80213a56f87b1123f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxathenadebug.zip",
        sha256 = "b9a377f4bfb0e637bd58c55f6d72c13903ddb3c3e9bda58fb32e74202c56c8d6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-4/hal-cpp-2024.1.1-beta-4-linuxathenastaticdebug.zip",
        sha256 = "72b2b28772514863d3f8961eaf0d0ed43dbf6b57358bb8e79b0cc4207abd41f9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-headers.zip",
        sha256 = "d51909060c4fd68aa59ce4269759d00037d5042f0afe6fad9dc7ef3b25ad4ae9",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-sources.zip",
        sha256 = "b5cc4057d2a2eccf114a2c171dd5d2cd9f21a3822b7c4663b34ea6d476ee4bfb",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "a6b2156cfd46916d6dc0fb39276fc3b4226da5fc602a6c8d4a102d2b5d1aea22",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "9f2441a43144ac5c0a1e304e876497b40b2b30228a57d9af4e42fe39daf4331b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "ea647812530ec841d062d855577c5b134d4b532669780be9a18f103e7bf72329",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "222d92a4f3986394ad4c204862de706053d6c4197b3b5b590c0c14d65b201cc3",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "d1eaf3b39a8a3c9b73958500987536b85eae2c258a9cbd175991a5b90259245f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "83df8e097d5b17c9d20358d82648962f6c7ab063d0e07bf986bfbe87f4e5658f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "91c5a7212bc06fe258796c7d877eada93cc5143f0dbf56449541482d63d9d1b7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "6e1c4c822f16778b7463f0261a1159235c2b52bdf6463bd8b56a496312fb074c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "5aea651e997127e641346e185485e5cfe2a8728d20c8d5f8d135cf56fea7d720",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "ea0f20b0c6e99813dbce029d84c60a94d4204d155d86f5fb0208dd926fb6e408",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "9cb8b7f21bf7445d86803bd221dab447e89de2558dc9927decfbf7ec65c31f55",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "bb982bf875ac8fab9a14cd8d8ac180964517c682a4ffb670a4cb69ef1cb8970b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "8799076839a7a3daccfd1af97e8a5f5bc7aaa68730dff329ab6583451e54293a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "b7a3f2b359d0b19850e0ef36908d9a31eef309268282c617070c3031a531911f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "3e0ce0da96c61444a1fbacc687d2a223580247bfcab9bdaa3790d7bdb20610aa",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "34903f36c1d7a713a2b9febd7861138b3950615a573f06b5a736fc9d3ebfbf92",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "86ad03ce3da7389cf1e0804637781bbe984cf442af48a9ff3875f59d1298170f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "5205a1e1cf11f2f1cc56ed16304ff28bb5c98267cd24dafd6e967c29c73303e6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "c179a9e6f1bed7abfd62ee60c1dda927f705b0379ef5487516437276ae7fd3b4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "4bec252ac15c9096e05ee9baa0bdc3f05b766c37b5e38108448f1b23d628234f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "b2be64c0149a8272e4a1c1a37acaf9010655f6976f99fd1a9b07f0cc3f645b18",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "6b1df4be10861678c5b47c487a60e7753ffdb55c9023f3a4498d320a64696fc4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "ef939937a264147dc0a3cdbcc09bd8942e8dc7ae1f304a93a81386b6fd5eac97",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "eb2961caa6060c63f85ce81b753dd243aaa6102e01ff67e2143534abc29c5863",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxathena.zip",
        sha256 = "6afd029c67e04254dacdd6acde7afe699f43762f2c9156bb8bd66f78cf83375c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxathenastatic.zip",
        sha256 = "c65a01c5683bc17e6330d6a734aac9ffd75c1bfc30c7e1254252807c933c18fd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxathenadebug.zip",
        sha256 = "7df7efdc7eeff21e36662f7d9a072a15142cf387ee7abe3a3b5f32d06c0cd5b5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-4/ntcore-cpp-2024.1.1-beta-4-linuxathenastaticdebug.zip",
        sha256 = "072c88be60b61b2ccc9a1ecf1b2b458779b2f5b9a31a3cbfbb0a52b5bbed60e0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-headers.zip",
        sha256 = "f8cbdc788b488e6097e1a7689c77b5c597d845b84fe9730be95518aa5dffa6f6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-sources.zip",
        sha256 = "686a787a28bd1b2592af1f606ca14b972ccc21b7e0e19540c7ab939a54833650",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "c803c19df8766f49e709ec031aff2f3490aa76741abe3a63d754cb9031067af8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "c17509cbab730221865995f84b0b4642b9b8688f4ee3194e9785392980304375",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "26b45bf783feb9998bcc99d700070844f69a9bdcb48df09ceb4de6de9f2fc001",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "2854e4e1d3dd6af1d5f7db19cb5597b8da5f00396380cdf47d32163cc19b413a",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "242cff39ad4e10d66744508f75829b8d169d2f9b2a938b1f43f3204bddcddc91",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "11a4fc961118093333d50f7a021397d57df9f5da9a151f284f49b501fe00cd17",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "815365e8b756b45336a0a2f449cc2103c45964470bdc362e1daf3f914c17b4cd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "9a97d9bd01776b2f961cfdc6acf2161108d634a2540c88fcd8c4d9fcbcf6ba1a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "d288e08be2e6a665042cea3dc3936d8b138af39c3d29cbecc53509ff6007fd11",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "76929cfa44efcf4c616f6f52019f8848922c56d369c0a52953aec63a4c66fe17",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "3bc37d6c79fb1dc62543b7da8b94182221b8230550a8cd6c031c2796c3f13570",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "de61aaeb931ba1402d04a4f22d6ffcfd780b5f5c1bebd6a3945e7e0486e5920e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "106e6209bc73f82c9f10f53a115730583524f901d6a83da53d5ecba6fe582d6d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "84aa24a7c3ba8a63d68c4e24604592d124ed91e5fb3c34be4b2c9f3dd6d72a39",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "676fb8bf31f048aa89a4a7bab85b1c0194eed347b8124c41cf4b30903db54883",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "45676ba4ed88af4bb7394df88a843a707120b629ba145913a0fdccefc602e6bb",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "4f1e5cf88bdb8365ef8e9da78b5965b9418166cd4a4a9a4d48e6cc8d74556ab0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "396a2c42cd798c4654d5f187850ae37714b32fc0ff0793b9d8c59435c0a81d22",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "d08a477fc6e113d8418a46c6f167892348040fda46f980f7ff57f5426dfa5af5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "a91445a202896c955f069985779572e4d5c1547df806e75930de21f4a465a3f6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "d0d6af100c1ea0ecdadaa7fee3c9e74af3b3985e2782ebdaaf2be1f15b464416",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "c5caa1a0abd480154de884f90970bba55189517c1416eba2ae5cb310ccd51cf9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "57c707e98fec2f9a3bb5637da40b92ce20971cb7ed2a42a37b1cb51621af31b8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "aad7f6614de1046beeeaee31252a1fd23de8530a5b6f386ca9960b579d42b4ae",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxathena.zip",
        sha256 = "e27506e08849414507c3f5505d1c7164fdca5db0a0dcf180640dd1943cd94f45",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxathenastatic.zip",
        sha256 = "158b9955feb81be17aca84adc2d1b745616a746b9e77fd7d8d7014a21c2248c0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxathenadebug.zip",
        sha256 = "7fdeec5be8ae8c821698b5266f260f5da029c0e10e5f552f7a8f8b036d7ee7c3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-4/cscore-cpp-2024.1.1-beta-4-linuxathenastaticdebug.zip",
        sha256 = "413f35a2b215dfeb2a0733c89dc4cdf1bf84a601fa8d2388ed7d5e1bda7d99dc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-headers.zip",
        sha256 = "8bada2963486c2d6560979eb80e5a391b340806d524091f2424f4467b1aa1c9e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-sources.zip",
        sha256 = "9f0154c2b7be5d88d5bb5ad368a7aecb9781f3b199db4e360f32188fdb57b0dc",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "52d878eaa5564dfcfed1b7f4504aeb3c2b78cc23dd48cfcfbe4082c122d3f266",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "bfeb2883f03b563ffb6887a5aca348f2282b35bd6b8ecdcd5bc2186e98b859de",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "835fff47f1d1ca90fd32f00552c3190393ab6c3efc529b49123205bae486137c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "ce7888c9fa82a47de2135772261c4ddbbff7015c12f1c82de0b59a89742b3c08",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "5a67b2b3ebfcfeb245e74a868c8152285f60a5af3126ff8caa0e5696a3ae09c5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "312769397c604843cb621acb914170cec0f38f0f668848ad9f94d264b6e14709",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "a94433b5a565950d9ec980ad931c42420257d9c0a0cd01ddb4ce6e86dcf0b798",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "6aae1da67652af13153750cef8ed3d0f56fae514db07f18aa36c4356b9359acf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "f05a34108f7fb463f7b21c50c16c6ac1a9d87342919d4147a985c0e2c65207e2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "9d35404ac149607039525ae579862d6a50aa5c2076543e481bda62e5adb4f4a4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "6c303323f70605768594b55b06a27f56d1239c368c930bd3bbb94a4d53690731",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "c4481517ddded6cb2ed7e5cb2ee68de7c75aeb2a48c1d49573a7fbc77ea5fcff",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "ab114e3cdae88b0685bd13da5278234da21ee770b89f5566a34aa62833f0aa23",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "9f75cb383de02fd7a83f4d8eb5418213109b376d290a5cdc4c58c6af1e5bcdc7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "d09417683d7e37ef73740297a06bcb3f17e6ed38847684833d4cfa02e4a8d953",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "295b0127c279b329e0b959ecc2595f6edb0a2f128697031862dea23a16994aa5",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "8dc2c66db974e9bc79a3cab125ddddede49dae83c6376b989388f2d1af634798",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "01bbddc1b46f5c7aeddd782a5b6446609f28850d6909e5e99c5360c48f3c54ef",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "d24da5bc82e0e10e011dde42605ed2c6186fdc20977d086748639431638cff9f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "a0a7554f64b93b984409cc53895439b4793edca52df67ae9bfcaa2687ef921b2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "e5750b1147a16f5fb7ab3504d7b27ad67409d098a50d7edbfda967babeaf4b27",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "e50c07ffe2731ef55601a75d9c12fe2111d39cfc6e4120704275f78078b5a13f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "e2e02bb5185304797546f211aa7cd56d1088b3a896abdc47701f706ce0df9f7e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "34de1ee13650f226876fdb97f863d79e946ec9b0ee85c9456e39f6f439ee9b98",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxathena.zip",
        sha256 = "32322540b01501d237c66eb698a310c70085279914ccd9dde7f7ea96e2bcd993",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxathenastatic.zip",
        sha256 = "82372d611044a54a1255ce72dcaa70f47d87da2cd30407279700987c606e469a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxathenadebug.zip",
        sha256 = "15046fec08676725891ab319280b51535019ae74f9247c86db39b78a65530524",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-4/cameraserver-cpp-2024.1.1-beta-4-linuxathenastaticdebug.zip",
        sha256 = "f7d657f1730d1f64ab80863af80f962db39c16727a57cb25b5ddb709885b4905",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-headers.zip",
        sha256 = "af691ce9d43bb0d24df710d4a9a0c3dbc920adfff0e2256ea9ad3ee8e44785b8",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-sources.zip",
        sha256 = "34a1b49ebfc4906cb8088b4bdbc9bec50ed3a9e6dae95740d0ece6b28a8f5581",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "63db9d1f58a1946aaa90fee655963cf2ec3d677e0e27f6cc4d182a2d8fd11004",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "90ce0ff620fe811e9253ad131746c86ac2c8001760ac58210a2abf8ed63fb9de",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "ce21f736157d1ef711abaef80234a90e7fd71e61a1ca2d6b2d1e74def53ced4a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "c808060df9475c276d5e285ee439dacb6da570061301e3f9d68fd98168f488ef",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "dadcdca913f9f4158ab5a4fb47e8f1c85a4ed1ffc05c2d218f4690a4c8daeab3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "6cc04a0da1a8fd9fe0d4e16f7cbe45be8f8cfabb996ffb17a2f1010c7a05a6ee",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "8635195ef4aeca718f2cf77790f9339f99e8c3e921d8c6883c9f1da1e3c5d822",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "5df2a048605f0013054e0fb6f09dacbec3b87a022eeeec0f6e35cd94f1ac57a3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "30f48fa0ad7bd548c002e764e965fc627776ad5023fa9205b3df530c071333d0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "2eb63c2b7ea79a52b33dddf0520436ce2fe9621503deacd85cd27d3caa88e9b1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "669714507a039d503521ac1dbb6cabab47c658fed5ebc659c10ff64746500751",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "aee30f8ff913f4fa84ada007dfe2a39eca2d43c19e1847bc3ad11321385cbc63",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "3b3b6eaef6a27d1b84967e67c9f52d0d1052f3c16a45475502d6744adbfecc11",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "bdb8c9c878bd154a2662ef9c8a41acdc82fb8eaf58c576808d2b1480afed40b9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "ada3c384d71377bf1eb7a3ac2e974061a0f0c51a74d9b35dc6416d50bd1b6c87",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "ea6885b2076b205e2e0afb2a029356fe4759ff8a47a5f65055a10eb1eaa7741d",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "87724b94c9a199c929ff2611af4136864c0fb68ae46303202e27da0bce54bfe5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "021a6821cba96bfaa8b07f12aaa120353e267f70931a643ccf0e407ad98a1e3b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "88d2e8084d2a05342d5da796c3e042f96dffe97d055be26ccb1e898f939fa678",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "e12a018eed69028604d4178a5a0fbc23e30174b1c5af28eb5ca236559b254ffc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "4a791e61abf05b9bebfc015812aa24b7100b58492c49571e6c3089f754eeac3f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "f521f5d4f2df0ae48367d5efcb1952d1b66b85c518b632d0735e2c2659dbd551",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "78ef063c22e669c7c801e32d3ae529d2585d59f15fd53bb316a3f74f596bda34",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "8a37f818c09ac16045e34336e90534435cd1027d4094f58625359f777c95ca8b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxathena.zip",
        sha256 = "b0f8cb97c74fa481a40da040f35a0ed4da32799ae28b3d2792905e1e1138ea05",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxathenastatic.zip",
        sha256 = "8d249f63ac9597ab33ef596ad2fd5db0d7ddf3c064a7be5ad9e082a90151a8db",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxathenadebug.zip",
        sha256 = "7fff71bce88874332027b165c3e2e8eae5248b49202637b892f3041047cce856",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-4/wpilibc-cpp-2024.1.1-beta-4-linuxathenastaticdebug.zip",
        sha256 = "e4944006ec8f882127669188ddfa18cd04c04e9ed10419ae9ffd90efcd1d7ebc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-headers.zip",
        sha256 = "52e30cd8be91d7f4dc1c08d882cfe0c04131983ef50369dfee99fd9fa4b63f9d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-sources.zip",
        sha256 = "c1e3afb4a79884ec6213a92223b213a4ad51bb2eed21bc81b0734a5e5e67e117",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "c7406fc8b56da4a29c62e50814afbaaed9556645420a0117c6a222e02e2d3f1b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "f99206722445db9f4544d3938e70028415b463358f20b86bf74bd8852c26848f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "5318cbadf4d8bd59fe61ae513990fb1db88e72d71970d5ab9f56f30be2bdfa50",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "92bd493721e89e7129d7d14080a86d523a0f614c05e5008caf4e276ea59950ef",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "f2653b49a2908b43c21b472a90dd3fe695617700cb724cb1cae7fc5f36777c24",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "5632341b6efeedcafa00ef899b7cea7ef0f4dacb82010b5dbc708cd4e8d7013b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "c2f7d86c3787f7789e435e799b680770e0e58942113544effccb93aa583a0964",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "312dd4a90a4b38f73a2854b3538a64569855dc120da19d4caa19bb585158ab59",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "edb395f693b9404e6f73bf25cf03a75920c8a684604839ec9062bd1530a237fe",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "6a540fbff39c1ac80d8b93fa9a8e0b1b1fe76bb7fbca890dd8279d508b6353e2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "0a4e65f14aa2577510c0e93aa634ae390e19ca6bdf45ab530eedb03b4a073342",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "ad1730abfd07d332ee54a39937b666489c36148e03678fb5556d5ce5afeea396",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "2d197714cf48c82d31c7005b0485ec092568041a93f4907f78d0282825bff821",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "de8204816252aa7da6329c570bee1be72bc86bc477a502f63602bdd67aa9217d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "4d7618bc75ff51eb9d485e57d9e99cf06eee700b2f973a07b76fd56e11c6641a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "7d4e0a7da4dba4ac708435c122c44f0b30ffb9b6eb511ffbb09b0e1a9ee16681",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "95d37d5baeba4c19eef2083bb8cc5dbbebfda5a8fa0e23330a199ba6f5f86ade",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "83e6169e31ab0be48c032fbc07192a97848517144dfbf2a5182c32a27415e639",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "c299e359e36a1164f7f7fb601de0848e5fdc583a11ad9705e6a9d23956f064e9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "e1fc40e82e5c2283aeaf6cf240584a93bcf715876ca949e5889bc68f3bc656d8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "618dd91e5c8858ae0c155c10747faf316c1b0065d044d264e02b925835019b45",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "91e41dd6bf9d59244e8829589db844c85e1f5c25d858276a9fc08cf24029b829",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "f850c450e1dd4f4557f7f15bb80cd9ebca5f01620f9dbe318bc97c6acd1dd6ab",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "511f73350c6323ff0bb4f6e12dc861a463cbe06ed4cdda13ffa8bb4923243f07",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxathena.zip",
        sha256 = "b0052a40328b03c39a1d6bb7f27552a2c96caf3513d2dbce0c69382127eab075",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxathenastatic.zip",
        sha256 = "f0231c9527ccee517b336047415a53ff645eb334e2861ac4071e0391bd342862",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxathenadebug.zip",
        sha256 = "158542567f91bbb8392e0408fda6d67d22e244561455acbdb14fac4b8cf058a3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-4/wpilibNewCommands-cpp-2024.1.1-beta-4-linuxathenastaticdebug.zip",
        sha256 = "9e3a4a9d58e09657d98cc78055ed3cac539b3a45a1ee0b0b22ef59caa178805c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-sources.zip",
        sha256 = "0dbcec8b63a9ebaed31cf2397bec1c59a004d9c8acc282fe9d4c416c9bc4fa2d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "18840279db04345a6b694f0253261be669da9fa181ae5c62f07239b1ae626b87",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "41be59e46a35032a77c5b7295c2258a88846794ba54cf73ef9dcbaa12c93b4d7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "bf8cea5bb19f6605e5d62b5ffd2b96b18b284115e8ec1997313e023a3698ee32",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "e8d5ea82a8184574cb2bffd71a01b56a584e59eada0378b2ebb2bcd70d7d4ded",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "bc8c156e17d4f1e2357eb2719b37bf7c0b99fb07291b1bbf7b302bf3e2970a30",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "746092b5bb6aeed1cca8fde9b7943cc862ab1b2bb862c9b542256bf8fd504b86",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "06c03c259686cb7d9ae43e01ef68b1dd3620d4257dc5c25ef87180b7b84335b4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "6e7283e3e836a4c15f53b7108ca93548253bbc95e47ca80a880717ff4e41d347",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "aff1f9054356781eadc7b6db375cbd8ed4728d0136b04143ffa7573e01f11f59",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "46ee0a800d5db0c5155cfb199069aeeff100a9c8f31f0adc67e5f4f434a172ad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "32709ea79e2be500b8df184bfec6a9153e91cadf165ae094fb863174a6a112ed",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "0602e7828def55965d9584678c1921d689ceda49d2b38f418bb5c5265115734b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "4613b631bed359035ba9ec208e7458d5efabac1b7fe21610d2def1fb330c354b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "e85b6779394a00952515faeb1831d1c25c2b7a45ee281ecf4f1273ad98b5e3f7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "700b278749ecc6205dc5bffa8b4964689431cd9d4932a78d87b7f03cd7b04db9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "5b8ce6c80e6442874a66b7fb3532294fef4c98577c42cc97fb05d904db4e7a24",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "bb41e10bbd4eb53adbe297433a21b1abf601cb6f676c6e12a27203678415038b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "d5822d710066455b8dd52695d8770bb78b926dd8fbb919d799740780e3856f69",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "22cd2e311a4078eae095b3c7c908fb327c242e6aa95a12a985007548bbf0c75d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "32d4e0e5375b3047c6369394c10ab9a1d3e48633de154d2366cb1c1250901736",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "5c64527283d874eccad7e5090a8d065890bc24ce8aa15f1218e01b85aa4763f5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "c878f4db8efbc4ec5c4696fa1322df9586042c56daec551d53dc60d8d0ba9cda",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "9fbee9c823904a8897a7414030925363086276e8a66145ecd63cf7c4590a46ff",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-4/halsim_ds_socket-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "d6c2d886d0f6d9dfee4453cc495e01a67f24a4c8974f6eb53c61d577db93c429",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-sources.zip",
        sha256 = "2c0def2b06578eac257373e6ace3da5416d0f947722cb0c62f99f10730a138cc",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "b1c240514ac14d26b454ed0c5511ec2b5f9ec8c3997b8964a8f3e52caadfef57",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "e804c9c9d112c779c954ec9194fa2f276193dea1e8dc6608628c649282fbaa25",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "fb86b0102b43f00657ea6e16b25808bb6bf1cafbe37d559d1fddc7d1e32f7d05",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "8cfb9d5e9239f0cb4fa96440a9a20171b17e275aa7cb287bc1ca3886a5c9bc74",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "30f9208df94494ed6f1614bdf7837750fc581dce7701a468f296e4a73b175c42",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "ff81a8519a8e066138ca8f02b49e7e31103e31e86922b143de56fd9aae686b1c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "20b546024599b2f168cc9cca1068d1053a56d310f73b439c7abdbaef0d72e9cd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "baeaa8d34a914ad668d5b8ad9c13dee47d82fb42e51af2829736f1e767e91724",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "872e0e70fb02c15a35a77a95bad051d5e62ef14fb9424cd980a5fa290f7cbe3c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "0d4a47a4cc1203f0e64e12514512b57fdbb0df3d316c4856397c106cb5d6e148",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "27b2a4fb7a91ecc37c0c79c22937fa642ed349b4a7d998f981191ba9dd937348",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "08383f0c435d8028f361adc0d54abedf03beb6d8a003fde380bcde682627d502",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "1c8d9d0a075d96830ac59c0e1db300853633dc325de3554a47f1c024f2d900bb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "d3ee531068ea8455d8f580b6f9bc5ff62a22b8976b2f4073c2713da3ad48d6b6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "add7202ad624b2ae145080772adc622596e1140edbae6177e403472818556499",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "8ece50511798f91fc568f306cec4fe771c81ae752d9ed5fb4b2076ec9543c9eb",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "41916876b8d3ae9a7764ed0bb826a041d3572ce0886e140caf835794fd416a28",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "10f810c3945225f3fba00014aba3d1aea02aa1ef440ab57d10608bd781982b79",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "852c57002600927dc5db04a061cab127a5c9fe146154937ed5943c101c847674",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "f58121ed0e6f205398d963da4e3c6d9d1a7f0ff1a5ac76f35d5f9292f0057116",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "3e0bb43dbe540b9e1138330a0691bd7c37f24b8d459afd7cc39a72d1ecf53421",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "62298e3565bf98f5d4198433c232f6e05d97077c078f95ec0f98fe2f022cf720",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "39123c5feb92ae2facce3db8aad16b8b07d9834b5be60effb684d05b12520b6c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-4/halsim_gui-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "dea0036bdca639e980f7d1e52c7518095a8e1cdeefef192c35c2b0e127091ffe",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-sources.zip",
        sha256 = "91490c9de45d6575ddc01386a2b15ff7e5d3729c2faa53a262b7064e1d5521d0",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "44509dbe1e99f94bd84365fd336deb8fea576da70492f556c2ad3b717230d696",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "e9e8281a1e8839a333c912d8fc92380c905740091be0f234cc93a654a0ed3b52",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "67b98c248d0ff03c6a0b386b2ec2dc6a102cd91a50a1bc5519a24278d9283b34",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "b68ce528051dde2bf15a56bb529b01a04a24844e89888ba2a221a8e15a528dbe",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "99a300d871b48e7056e4bb18837987bdb78af66b41fc67c609e4a0cef6974f3d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "490b740c96e36fb74a1152c723dcd8fbc23daf99d1fb1dfe80103fbfcdb346f0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "f4923cec2633325a72941eff4119539704c1eb49f1650552ad6e7f3f28f4e9f3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "59236665e6c657b64a247bea82b595c8ea56bab1688aaa40de503f0d41d95fce",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "55f92cd2f0082e2a90d97a263065a8f26e2e421a2ba22b0c77c48f5d9ba7db43",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "793295cb6cbdf031efa1d2dad94122bb1216269ee857a2dd93fd77de9eadb7c5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "ef2b61d2796932ed2794d365956b66de9d503a427b1912707a567ba48c633fda",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "ee397bcd7c9c577776bd7a5e63fbb7a7a077a3cc6733cb1ad6d592fa41887810",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "10537e63069e17767859cb696cee24984930df7d3a3e36e53087c7041252429f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "a936bf74dedfdc3dd0dfd42fd40182d6c8d14d5a64d73b30456f1b5919d6cbc3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "8a90c56f1577142bb5653d7316a2d17b0e29aa3d3684fda6c68f494d9e281614",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "89efc4e3fd53feb76e83294cb7bba9dcea511c5176bd3da9a488a79ecfb4c7ae",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "d94a0d3fe7a65872a6cb9b9423e3ab007022d5a769cd7f169f404d5f1169da42",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "b37d10445a642a71c69c905cf95b530551a9e3a4c66427a2af6b7f44280694eb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "e6be9aedc26119277e8f2f311fc93bcc60f0acd0fdf654e49d5d5ee94ed28a52",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "8b349a2eebbd46fe61a68771842979eee6427b1573d9b3cd47a579a3bcc94035",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "4680f3c195fddc9dc6b49e4875fb45d6c7f3ee18f6eeb4ec835abac8f57c551e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "5eb562992129d160cb49fa26812d539844b54aae2a519815d857b62fb147e4ca",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "2c09e640799ec67fe5f90fd4dd92e32bb5476a2bd5c41ebbc4a65db8359897fb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-4/halsim_ws_client-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "f71475cf41d7f0927b7b4a0904e8bd5f1a5447443c761f9038eb1b07286668f4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-sources.zip",
        sha256 = "9cbd5c5ff2101fe783a09a04bc72e5fa5618ddfdf7b20f2dcc7dba89b1545398",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "2e81258bb59745fd4f05bd90c00cb402d89d1e942e5d3e35ffd4b5e46ab64268",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "d9ad99e5977f35bb439bb74404bbc5a844cef56a304cccad46c0299b78c88b1d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "9ab1d7cabf45615798f1e00ec19617cde609b527541d17bce714af85a08e162a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "53513a5bbaa4587301ace6b96a9a352528c5de511d9ad323a29c4d5caf28de1c",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "3ec1d39fc69e9c83d8f2c3cb4b52d3168a452415418004e21fa7a31a29c84046",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "186b8630356fc7d8da00ce3f10cdc88ed5c7f625700b13f48c9b4f4105e6caa6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-linuxarm32static.zip",
        sha256 = "a86c69abe148c5e18067e3243c38742a16f2ca53ddba7c25a19369eb46ea09b7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-linuxarm64static.zip",
        sha256 = "0754da4b9c296acf465fe0d52418fc63a429421cd4168d535fc42e3f4f279591",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-linuxx86-64static.zip",
        sha256 = "9fbbb61979eacbec4ad80feca63748a9b28d1b747189e368a6801bfbfd61a93e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-osxuniversalstatic.zip",
        sha256 = "549a978976a02443ad8d207b4c216f65ab588f3a42c006c4214599447cd257a5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-windowsx86-64static.zip",
        sha256 = "e77e1c7e582d5cc233b2f6850b75ca30cef00e2f8602800b55b6d38f31a8210a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-windowsarm64static.zip",
        sha256 = "be7f98ab44e4c3c1efd5ef6c9489cd065e74219d32883237595c284ac2aba5a0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-linuxarm32debug.zip",
        sha256 = "9167042c968c26fb76464810e430bb8c2772f56681f3fe93883c6dc0912b050f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-linuxarm64debug.zip",
        sha256 = "93a201afbd22ad7ba5df52bbe6d18d1ef004ea7ab92e4674b60b01aa39995e1c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-linuxx86-64debug.zip",
        sha256 = "85c96e9ecc0797d9c4799cc14fb91b26a727023ff5c36f95518b4a6253b280e5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-osxuniversaldebug.zip",
        sha256 = "b0f8d8f3f6a889fa1e5e941fc168766b2655195d296f1550c9ba7fe1c9158d3f",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-windowsx86-64debug.zip",
        sha256 = "c1f2886ceba422f25dc718bfe974756adb149a757fa5eef7598836883697ce1b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-windowsarm64debug.zip",
        sha256 = "5d67425d14c8de2794a3df8922be4110cb821f9fc8e13d12e544520c4c592192",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-linuxarm32staticdebug.zip",
        sha256 = "5691a809742126cce77d4eb98f226b67c3dc89fda7133490e9ec87209938d875",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-linuxarm64staticdebug.zip",
        sha256 = "7bb504adc6ea394467f430623bef985b93d6635e9e38a7a4f72c962a2b0414ec",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-linuxx86-64staticdebug.zip",
        sha256 = "66b5b1e9eb8d7555f1f3c6ff4e7489d67c151f3424ab65edf9f5ba586255c96d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-osxuniversalstaticdebug.zip",
        sha256 = "befbf792ffe27f10479437b758be104f97967424fc464a916b6061dcab14297f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-windowsx86-64staticdebug.zip",
        sha256 = "10b83ffb6a3e0e07f7f0974c39c5f35a9fd4cff3dd1990de852f431307e67883",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-4/halsim_ws_server-2024.1.1-beta-4-windowsarm64staticdebug.zip",
        sha256 = "e51e0e6bb37e415b4bbb897ce8307fd36bd4cf2fc3f4b846dde0ee7bb80fb8e9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.1.1-beta-4/SmartDashboard-2024.1.1-beta-4-linuxx64.jar",
        sha256 = "6a782e7716c771b87b5ed3792e4cb1690a66afbf27452d33c13927d496757794",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.1.1-beta-4/SmartDashboard-2024.1.1-beta-4-macx64.jar",
        sha256 = "f33628a44f781a89ff5041606cfd258c2ca163475ee14eaa9375386880752a4d",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.1.1-beta-4/SmartDashboard-2024.1.1-beta-4-winx64.jar",
        sha256 = "9e5c7bb12b75897693475b9ec084c9c8dbdcfc41d427f3cd81a0bc268970bc38",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1-beta-4/PathWeaver-2024.1.1-beta-4-linuxarm32.jar",
        sha256 = "c5e0dcdf1a87e78d1874c0c1379ed9c3e7a613ffb892c16a12cc9f5590ae1f1c",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1-beta-4/PathWeaver-2024.1.1-beta-4-linuxarm64.jar",
        sha256 = "88f9ae2edb3f342bcfc776f943061f1463374312556c31eaa38710274a29a5b4",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1-beta-4/PathWeaver-2024.1.1-beta-4-linuxx64.jar",
        sha256 = "cf6a7f2eedac69212b9d4adcf0558ab917b6fc9a257c9b2457a69b736f3917ee",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1-beta-4/PathWeaver-2024.1.1-beta-4-macx64.jar",
        sha256 = "bddfb5a53d996590fc6df252577e88d1e7ebf3a7b85db272af0c4bd5debb2b53",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1-beta-4/PathWeaver-2024.1.1-beta-4-winx64.jar",
        sha256 = "6e4f28583e6f4b835be1831164ae07514fffdeb352b2d9e7e34bfe0790a4c0b6",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2024.1.1-beta-4/RobotBuilder-2024.1.1-beta-4.jar",
        sha256 = "8e88bf7557192ef62d7251a4cc6dcdd4b26034ef25509687e59e98bb35dfb96d",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-4/Shuffleboard-2024.1.1-beta-4-linuxarm32.jar",
        sha256 = "9ffee7a10cb7c55744f22ac64293c30104ca861a651913668474b1982dc25a03",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-4/Shuffleboard-2024.1.1-beta-4-linuxarm64.jar",
        sha256 = "061fa97c23dc6e1163decbb95fcaf432ddaeb2dd5a691675d458924a6ec1accc",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-4/Shuffleboard-2024.1.1-beta-4-linuxx64.jar",
        sha256 = "07279ad0463c45a9dab67c483f5b06468396b658b0a6df43ef50d484f718c4e7",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-4/Shuffleboard-2024.1.1-beta-4-macarm64.jar",
        sha256 = "28abdcc5ae3ae7aa8aa57a8d4b8572f3b1dc471d2ff04485b0d128b2d6e91ee7",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-4/Shuffleboard-2024.1.1-beta-4-macx64.jar",
        sha256 = "d7ec1407188184ec9012e7e3e4c742e2ce8a7802ca267c43e92b8b4169ff7bf5",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-4/Shuffleboard-2024.1.1-beta-4-winx64.jar",
        sha256 = "70bcfeba4d70bdea8d1e4ad31ff271f1c7f82470b7345d55d7546d634ecc6b04",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-4/Glass-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "291a4f08e5708b85e05bc70e8838b2c2dedfd0c6bd43b3666765ff4455e12cda",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-4/Glass-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "ea305701295760978d5ea74594352b055adb6bebfd11389f29fc68d5484184b1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-4/Glass-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "82436cb887d889691b4952786f5dbd39a3afb403f30bf9d5bb579f053d95ab6e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-4/Glass-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "78da9c847d6fa5b0eb17e1402fa3a2225d516ba9d575ea590595d5360c09eb2b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-4/Glass-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "9caa59dfa4268de88e7d6109c4a377e1c26f6533f9475424c505de73728faf68",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-4/Glass-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "fe36f9fb30df107f1ac56b1b12dbc9a6d240341aedd4a4f43c62723432264c4b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-4/OutlineViewer-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "83ec14918e1395568e92bf31f16a712030cec31169d2a9ffe3b5cd79ed492183",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-4/OutlineViewer-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "7a6a9e6529b2708c3e0033a59fbe82e148832364bca8a296246658bff4993395",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-4/OutlineViewer-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "f646ea85e813ffc2dab1562318cc8709f68c872aca66f3203e980ca292ef0c1c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-4/OutlineViewer-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "153bcedbfafa34f3c4a3f630df338a26eb992f50bb01f818b74289fc0d7c6018",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-4/OutlineViewer-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "87bdb732ece671fb3c819edf39b7b83f6dda5e9efa0d9eee5c615f64086a7bc2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-4/OutlineViewer-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "73b7fa76a5d12492791751a38cfbc1444f82aa8e744dcffc8006ca157a369b87",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-4/roboRIOTeamNumberSetter-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "4bdcf3737c31807942dea5b5eb4384befc55da3815f7ca6f1925eea6195114cc",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-4/roboRIOTeamNumberSetter-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "75e6fb7bac33aeb7f4270a3122f75e126054e4043ba234f23d9ea2ccbf756933",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-4/roboRIOTeamNumberSetter-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "41f398d7ddba75b34611d65124c3a66817ccbe5ae4b4fbc1e5c4d6d4d950ae1b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-4/roboRIOTeamNumberSetter-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "2d6d139645019ad0b3db87da5f96456f7b5d5bdb3baf5e3edde98d62c3f41d93",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-4/roboRIOTeamNumberSetter-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "0dc67c141cf17af018a1064cc213ee0e9be492c2d4e6f39551d405fd8ac24692",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-4/roboRIOTeamNumberSetter-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "3b0600cc8de2b80217b633156d8978d7a76229260c95cb11f04301a4830ee2d2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-4/DataLogTool-2024.1.1-beta-4-linuxarm32.zip",
        sha256 = "32b103fa6fad8c279ef70d4f5e1178175489c97b6909b5778dc1fc3c14a9ed3d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-4/DataLogTool-2024.1.1-beta-4-linuxarm64.zip",
        sha256 = "6dff0aacf0e109c6055ee636cb6da99722797e5b9cb7f97411f0412283adb69a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-4/DataLogTool-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "83e13c70f08624a7fead0330c5d19c148e7a8b524a0e3d569fe2054dcbd471db",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-4/DataLogTool-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "1aa9cc17317eaa18ff17f3d7d3d8424447c7dfb4811ec86261cad9f834492d09",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-4/DataLogTool-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "492274d85803c9e0b128b779701d101f251dd4891dc30fe6e1b6a4e0ec7eadcb",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-4/DataLogTool-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "574186a3e39f23366b26b4de28c37cfbdca73b4e3fbbe7717c8aab4a97ad6af4",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.1.1-beta-4/SysId-2024.1.1-beta-4-linuxx86-64.zip",
        sha256 = "90c45aa7a5fd5aacdeb878e67731889af6ab7a571294a44bdf8ee93e698407bc",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.1.1-beta-4/SysId-2024.1.1-beta-4-osxuniversal.zip",
        sha256 = "18274241f67954b8597b485c6b7d7cef2d4e7d2918c0ed9b85f180a773badc73",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.1.1-beta-4/SysId-2024.1.1-beta-4-windowsx86-64.zip",
        sha256 = "16391648e1b479a282d35a4aeb6d35e4e9d1b29ddf6ea61daa9da9842b93498c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.1.1-beta-4/SysId-2024.1.1-beta-4-windowsarm64.zip",
        sha256 = "7efbce592866102acc566648f784c987d773cdc28dff340f28be8be0798b2466",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
