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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.0.0-alpha-1/wpiutil-cpp-2024.0.0-alpha-1-headers.zip",
        sha256 = "c831b6c83e1b9c83f4b41191021f94185a0e0f535cd2d9ee4cf7b2a6b3cb0b30",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.0.0-alpha-1/wpiutil-cpp-2024.0.0-alpha-1-sources.zip",
        sha256 = "7b2cd954d96ad0b8913a61960c7cdcb9d0854e7fc22f71a7dd11fd05e4f46e58",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.0.0-alpha-1/wpiutil-cpp-2024.0.0-alpha-1-linuxarm32.zip",
        sha256 = "fa634fdb423698014ec0e6d2c30f576745e7d5cdfa526d0208658365be2a32b5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.0.0-alpha-1/wpiutil-cpp-2024.0.0-alpha-1-linuxarm64.zip",
        sha256 = "9ffa4a0f79677f021f446ce3306d235f024fabf46ce1990ea7395d7f472e14f2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.0.0-alpha-1/wpiutil-cpp-2024.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "bcfc06c78278a7ac62c90dd7c0b51b2ff084d66a13b2fb12a5a55e91da160dbf",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.0.0-alpha-1/wpiutil-cpp-2024.0.0-alpha-1-osxuniversal.zip",
        sha256 = "31922b40ba522ebffa87722c7c5cd2e2e2806c9980b04d2584441f5112eb2fae",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.0.0-alpha-1/wpiutil-cpp-2024.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "ad7200b393cb639efef6e906c35e61d1e0e25676abc59de1d9c4af4f12584487",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.0.0-alpha-1/wpiutil-cpp-2024.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "b04f17d9c7cb6c9551eb60f66dc2c22a85d5e3f2a5997a833266f81f8b06fd56",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.0.0-alpha-1/wpiutil-cpp-2024.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "b09e382853997bb94888cbf4ebfc990af4bddd17bb1acb23fd6a44fa1bb633e9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.0.0-alpha-1/wpiutil-cpp-2024.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "a78dc680b9de4451dc30e367b4c4330da83780c3d25c9a0c95f1621fa3661852",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.0.0-alpha-1/wpiutil-cpp-2024.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "f709bfb9a9e55387d4e6be763469c0433e6004e98053730a8811703368faed76",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.0.0-alpha-1/wpiutil-cpp-2024.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "b58b8a20ff5db09f27f84942c05c4b6dc774da4f94f0436b6dcac72d646172e4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.0.0-alpha-1/wpiutil-cpp-2024.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "912018712c9c54b505256cbee1ee186bb25b059b97a8d4c55fa7467362797495",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.0.0-alpha-1/wpiutil-cpp-2024.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "8607451492b84014777dd2977c0327473175e6d5a0ddcf7c4f99d24b4e224842",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.0.0-alpha-1/wpiutil-cpp-2024.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "47ea2d46eaab73de0a915e4d655113f493e8e5c18be260227cf651ab11f28346",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.0.0-alpha-1/wpiutil-cpp-2024.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "77691e47638750e479cd9ff698879e335efc348a1ef909360a7143abe8b2f7d2",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.0.0-alpha-1/wpiutil-cpp-2024.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "9b3b58371aa583d910b0beff2f80a4ac27a9c41a5bc2c4c25f64b2b702ed57c8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.0.0-alpha-1/wpiutil-cpp-2024.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "0acb66efe58d87f00ea7630cc6dc280234aa7cba6eaa6aeeccd61ebb7774528e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.0.0-alpha-1/wpiutil-cpp-2024.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "091b1fe44812f5533cf8597d06dabaff3e2e307b59b1455f42c08a4cd6cf4f71",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.0.0-alpha-1/wpiutil-cpp-2024.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "1b7c4db08f88071a718c3a281d3c0e66842c409f734bd4ea1b526e4926ad6076",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.0.0-alpha-1/wpiutil-cpp-2024.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "87e9b231d9942d016e1602803af4b4b2e7d5f32f263ac9b11e648973e7b5c358",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.0.0-alpha-1/wpiutil-cpp-2024.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "1d432fb468b7d20033c603f1e49c64741709df95ae691f8c434bd3250c5361d8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.0.0-alpha-1/wpiutil-cpp-2024.0.0-alpha-1-linuxathena.zip",
        sha256 = "3ccfbf71ac2453ef146ee181d11bae4931a300df2dcd63e5ae947979808b03ea",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.0.0-alpha-1/wpiutil-cpp-2024.0.0-alpha-1-linuxathenastatic.zip",
        sha256 = "898b290e0c0323df349762337d3f0baace1c670c95f7bf4c5cc5041de3f1b001",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.0.0-alpha-1/wpiutil-cpp-2024.0.0-alpha-1-linuxathenadebug.zip",
        sha256 = "57198e08d13f1f4e58fa709b0922c0f7b804e16279d2fee9c5a45de37088a9d0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.0.0-alpha-1/wpiutil-cpp-2024.0.0-alpha-1-linuxathenastaticdebug.zip",
        sha256 = "d00e815dd75d36481593c731a89a84964ea67831940cb44682ef2a041d7ad0b3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.0.0-alpha-1/wpinet-cpp-2024.0.0-alpha-1-headers.zip",
        sha256 = "2e769498009ea77653de3c5eddf61df1ba5993bb364d52001d6977bf3e679500",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.0.0-alpha-1/wpinet-cpp-2024.0.0-alpha-1-sources.zip",
        sha256 = "781844780c35235b61a7ccdf721a597d0d574a380ccb782135a1f7f1345b318a",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.0.0-alpha-1/wpinet-cpp-2024.0.0-alpha-1-linuxarm32.zip",
        sha256 = "780f2f557bccd859227f932094beeb5f64b6ff32f1300bc5b9476eff34428948",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.0.0-alpha-1/wpinet-cpp-2024.0.0-alpha-1-linuxarm64.zip",
        sha256 = "c4c06409478af143da40013a8c5fdf631b08feacffdd4593f3b516723026ffb2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.0.0-alpha-1/wpinet-cpp-2024.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "00f55b65a3d74a6c1801be96c463dc296eca2d77fd6a5a4f1f3948717068e0a3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.0.0-alpha-1/wpinet-cpp-2024.0.0-alpha-1-osxuniversal.zip",
        sha256 = "5ce55729df16a1360943388d084a7b21ab349637e25838caf783f8cc5ed37473",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.0.0-alpha-1/wpinet-cpp-2024.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "c85e040eddc8027100fd955d2bf2223bcd7408478193baee7f950e2398062a80",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.0.0-alpha-1/wpinet-cpp-2024.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "991980a94a6bda62d847e4aefc5ef33f8fdb77db42f8c0a70d1851912c928cca",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.0.0-alpha-1/wpinet-cpp-2024.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "d488c6a80a37019a97b4c70288f3482f24904924d27ac942a926960a7fb1b39e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.0.0-alpha-1/wpinet-cpp-2024.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "63b727a75f2217b5d9cc41577a9d1a3e124f1225807e25df1bd7e6d6c2fbbf44",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.0.0-alpha-1/wpinet-cpp-2024.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "689e226f55d8cb606fcd27c673057d5918c00810ee3e7487eb251dd6a0c3e2d3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.0.0-alpha-1/wpinet-cpp-2024.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "6f32e3638b565f9083e9f2997f5623fbc9243c1ed37376628cb7292b925ad29f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.0.0-alpha-1/wpinet-cpp-2024.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "aad3e6bd32c24df487e480f830dda9cc74b0a5c95ccd33ba0bba4abcd376860b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.0.0-alpha-1/wpinet-cpp-2024.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "fc0ab39cac57e91a9080ff1495e644dd01f55351c023d8f3e90547fcbc0205c0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.0.0-alpha-1/wpinet-cpp-2024.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "5e1ba06e10d41a6adcf0a275cd2db756aa4236521d29e5b54b624fecea7f0470",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.0.0-alpha-1/wpinet-cpp-2024.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "6fb4fa18545285174bbabed86bf8d1fabf880acab3d5589183acec96a4b96f36",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.0.0-alpha-1/wpinet-cpp-2024.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "ef53337eab2767d20b57a465b9068783ec42c700a79330402abbb7e1ad381845",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.0.0-alpha-1/wpinet-cpp-2024.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "ce23e1d50998dc49e205b6e0eadf11e2046a2b7d2cac6eab48e25f15bf0e0d1a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.0.0-alpha-1/wpinet-cpp-2024.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "f9cba606e955ced3e7cbad99503d8d86a08bc45f1de59d6b666df1476d1312d3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.0.0-alpha-1/wpinet-cpp-2024.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "8c9fb2b938fec5ff87c710f54cb05d87139ddbf7b0cda9c131fdfc794939c36f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.0.0-alpha-1/wpinet-cpp-2024.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "b77c9fe36d669d974523ef75e415574c5a959740bb11c9db5c3e8f1041766674",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.0.0-alpha-1/wpinet-cpp-2024.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "ce9da51d07f7b717b53499aad2f2f7edbb1f23ac08bb22ab5cad515e18f5d33c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.0.0-alpha-1/wpinet-cpp-2024.0.0-alpha-1-linuxathena.zip",
        sha256 = "ede3d1127f44963cb749b321180bf809017cf577c0e03e1a5ff9164a76e1faab",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.0.0-alpha-1/wpinet-cpp-2024.0.0-alpha-1-linuxathenastatic.zip",
        sha256 = "6e8c21decf0770eabccc5e16eb479237da0b017c65e0a444bbca09cd7ab9a141",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.0.0-alpha-1/wpinet-cpp-2024.0.0-alpha-1-linuxathenadebug.zip",
        sha256 = "304f82eb1935addbe21a800dbc14761c056068140cdeb2b56b8b1a000ba8c41c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.0.0-alpha-1/wpinet-cpp-2024.0.0-alpha-1-linuxathenastaticdebug.zip",
        sha256 = "29be81f1b010a9863b9e72e907c8fe3fe4ef1fd9816e04d91b128cb784cb4509",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.0.0-alpha-1/wpimath-cpp-2024.0.0-alpha-1-headers.zip",
        sha256 = "6ae1cfe0650bf2bb96e680a32dcf404ed79b7106de7d871c0daff4c744d4b078",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.0.0-alpha-1/wpimath-cpp-2024.0.0-alpha-1-sources.zip",
        sha256 = "8600530c596d90ebad53135fc1183c2f5b23f39c7467953dc54c986d26dae64f",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.0.0-alpha-1/wpimath-cpp-2024.0.0-alpha-1-linuxarm32.zip",
        sha256 = "710a00f2ed29c381ba8eaf8865a2c35f54a26b2b59ccddfd32f8d84827aa3625",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.0.0-alpha-1/wpimath-cpp-2024.0.0-alpha-1-linuxarm64.zip",
        sha256 = "3dc864cc70ad50c93efeb651b2149cd0c44b7ee16e82361ee0c60ac6b33f59f3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.0.0-alpha-1/wpimath-cpp-2024.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "ccdf15a5674d8221002f2ac12203c3de55a83b15357a9b10e8df818c7d1efcff",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.0.0-alpha-1/wpimath-cpp-2024.0.0-alpha-1-osxuniversal.zip",
        sha256 = "221d1331fa85a95d0706605811b42a958f6063c2654682d52485f442f318fa0f",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.0.0-alpha-1/wpimath-cpp-2024.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "c3fd4703b6d894785cfc7e1a6ab9be5e944f3a1303b59598e0f33740729b58bd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.0.0-alpha-1/wpimath-cpp-2024.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "7db85f55dfa2470a4d676bc942c617bffa8fdb2f79b26b9e97eaa17434d5b7b5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.0.0-alpha-1/wpimath-cpp-2024.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "5af59ac2b5adedf8a709ab1565d640e54f24fb7f0a00d88b377803f01ef0a632",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.0.0-alpha-1/wpimath-cpp-2024.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "f65859ab6be9acfdb7383e3260975ffc1b65e12db2db3f82ef930eb9384a668e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.0.0-alpha-1/wpimath-cpp-2024.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "85423f5825f4245f5fea0f8284c0591c188a8c4ba2911a0d37c1e3d2f19b0169",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.0.0-alpha-1/wpimath-cpp-2024.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "07d42dce3690850fac9a9c6bcbb42b0c329087113df49df9607bd87b91168286",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.0.0-alpha-1/wpimath-cpp-2024.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "0c51f64b6af65e1de0d27d763f1e3e5020710f62f4415adbc4846a47bb298d8a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.0.0-alpha-1/wpimath-cpp-2024.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "e3e936deb5086df975415b1103aaa9b74393b077699f696edf689df6e89450cb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.0.0-alpha-1/wpimath-cpp-2024.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "1dcf57ef99077b332eb7949a25a20fc83def1713cfd37f046acaec5dbaef69c3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.0.0-alpha-1/wpimath-cpp-2024.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "df984c2bd76c10d3b00dd79a535b0ea49e144888e68d11ff157961b69f4a0ff6",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.0.0-alpha-1/wpimath-cpp-2024.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "12d50431b92e7cbeeb8908dbba0b7f214eacfe0f1b13451e482d6d10c44cd3e1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.0.0-alpha-1/wpimath-cpp-2024.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "3a701a3f58fcbf926809c3b2747cd620943674e8f8ba98294b4501c72e5c5326",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.0.0-alpha-1/wpimath-cpp-2024.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "31a166a4cb59d9a5b48224f4c790bf15fcfa75ee29a28b97109783784bd98a71",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.0.0-alpha-1/wpimath-cpp-2024.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "e25add6cd468fb04b54e2919a9c4f292e2281dba3614d4289e661f5642775465",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.0.0-alpha-1/wpimath-cpp-2024.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "51406ed6e80c594b13aec30d0d309f44db5a4b8234507aa7c3adeb2ad275c3ac",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.0.0-alpha-1/wpimath-cpp-2024.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "800609551ae8a8e41806ece0b02c50cf8a7ae3eb6ae21dde9aca8604590d86d0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.0.0-alpha-1/wpimath-cpp-2024.0.0-alpha-1-linuxathena.zip",
        sha256 = "93d04cace1394b24db7668fd66fdb601727920daa45891542aecdb7df4792251",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.0.0-alpha-1/wpimath-cpp-2024.0.0-alpha-1-linuxathenastatic.zip",
        sha256 = "20fded0022ed6ebe74fe1afa2bc148e5d987135a8be768de5f9cc6aa121d0872",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.0.0-alpha-1/wpimath-cpp-2024.0.0-alpha-1-linuxathenadebug.zip",
        sha256 = "85b2ac69cbf1ad308c0f269c3a173c36207e44ccbd38b4702e03beaa2cf20bd2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.0.0-alpha-1/wpimath-cpp-2024.0.0-alpha-1-linuxathenastaticdebug.zip",
        sha256 = "dd2c031a65511c4ad6cb3ca459330a9daeb88d8f9dfb86f68a9bd458c57d80d0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.0.0-alpha-1/apriltag-cpp-2024.0.0-alpha-1-headers.zip",
        sha256 = "13ded423077a18ae250bc0d123ad9dec962de979b6e0a66874a06411980fcd99",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.0.0-alpha-1/apriltag-cpp-2024.0.0-alpha-1-sources.zip",
        sha256 = "9a14ffe41afbb7c7586473e43ed034e6a4fd95063bf8e5f0f0799d651fc1c247",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.0.0-alpha-1/apriltag-cpp-2024.0.0-alpha-1-linuxarm32.zip",
        sha256 = "bb1506aea4e6809ad70c26781de07fb2f3f3deb3bc64930b471971860e387dda",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.0.0-alpha-1/apriltag-cpp-2024.0.0-alpha-1-linuxarm64.zip",
        sha256 = "d19b734ab9e5fddd7c5c200c449b860d4ca90c050a5e12af0acc009339872521",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.0.0-alpha-1/apriltag-cpp-2024.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "f2fc5fde2d0da6f5f74f85ff1eca2139ee1342fec0565f11053c33748ca66e83",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.0.0-alpha-1/apriltag-cpp-2024.0.0-alpha-1-osxuniversal.zip",
        sha256 = "8d09bcbbeee2e2bd67ce0060b14c20398569b475c0c72a2b6aa8ad10710f3cc4",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.0.0-alpha-1/apriltag-cpp-2024.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "28908dc99bed4cb9bfcb3542201372091df66bfcb6e6f4633af820ce80fe87b9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.0.0-alpha-1/apriltag-cpp-2024.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "04ffa92af0ed6816eadc9f9befe1526849268652feeef3bd4b5145327e6dd49c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.0.0-alpha-1/apriltag-cpp-2024.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "aca3541bf69096579038b6346e788843f5fde011d02458814fca6eea08195146",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.0.0-alpha-1/apriltag-cpp-2024.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "70962824b59e94b22f0a7fb67bf9359fe68a5f3445683cd514795468941085d3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.0.0-alpha-1/apriltag-cpp-2024.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "76198b2cb270a77cd2175a5907447d07cb9394df05206110f9a9633971a87b75",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.0.0-alpha-1/apriltag-cpp-2024.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "8970d07e9dbd2e807a21caceeaa11d8f8ae8cb95bc25e24a68bc2072d66777a6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.0.0-alpha-1/apriltag-cpp-2024.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "35775229818b8260565f3c90120277616221370a883b999100c61b630bc36f88",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.0.0-alpha-1/apriltag-cpp-2024.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "3c7f70766c231b26df93dffdfe4256d05c8703ce78f3b9533f3ecd545eb0a352",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.0.0-alpha-1/apriltag-cpp-2024.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "d48efaf62376933c840b49083092b68047373c2a8ce502d900ad42230a53dfe4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.0.0-alpha-1/apriltag-cpp-2024.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "27e81902e92c9feec46bf1e27ce2639504c986bb1153f8876e29c0ebe9402789",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.0.0-alpha-1/apriltag-cpp-2024.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "7ca00feaf9cf2548b7a277d754535c1a3d578752f5c56307e81004813f12daa1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.0.0-alpha-1/apriltag-cpp-2024.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "51e5aa113d7df0cd3bc704f4b5324af47abe10233b8272cf10c1252c58b71e61",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.0.0-alpha-1/apriltag-cpp-2024.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "a628a3faa93ebcda2c30e4471c4d45773c2809aaba884afc3b5583e07afdf0dd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.0.0-alpha-1/apriltag-cpp-2024.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "e439fe5402277f53aafbcc57d521a6d3c6f893adcf99c2e87bc72ea8ddd80a23",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.0.0-alpha-1/apriltag-cpp-2024.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "ae486463eb7108bf0fb183b3725803165dd41898ea969552e0a5c5a5abd150ba",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.0.0-alpha-1/apriltag-cpp-2024.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "d01914d1354b687522bc09bd5962693146d18094f0ba13b5dbb05463f3b0d7a7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.0.0-alpha-1/apriltag-cpp-2024.0.0-alpha-1-linuxathena.zip",
        sha256 = "5340cb1ed0275bbe78328edb5c678c47b20852b0c45dd0c6d76a34f9f49a53b3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.0.0-alpha-1/apriltag-cpp-2024.0.0-alpha-1-linuxathenastatic.zip",
        sha256 = "46d833c7ad87005b489593d44e075394f96a99187f983e390a34ad740129267e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.0.0-alpha-1/apriltag-cpp-2024.0.0-alpha-1-linuxathenadebug.zip",
        sha256 = "f0fb473e5fb4272cfc4d8359c579e37ea719b5ee97234dde5070f739bdc77949",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.0.0-alpha-1/apriltag-cpp-2024.0.0-alpha-1-linuxathenastaticdebug.zip",
        sha256 = "9d64b89dacda45199dd1ebfefe0caa23176cdb0a692d6453534536dca56b7118",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.0.0-alpha-1/hal-cpp-2024.0.0-alpha-1-headers.zip",
        sha256 = "3e461367f2b0b9925d26d33b2a094bbadce03226baedf3c94b3aa401f1e0de85",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.0.0-alpha-1/hal-cpp-2024.0.0-alpha-1-sources.zip",
        sha256 = "964bd507a45e245beefb91f833c8728185cd5e94be4a502dedfd64ccc0c002e2",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.0.0-alpha-1/hal-cpp-2024.0.0-alpha-1-linuxarm32.zip",
        sha256 = "109a5aca39ad7c50f898765c1d57421ab35c67566091c08485e9db45f128a272",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.0.0-alpha-1/hal-cpp-2024.0.0-alpha-1-linuxarm64.zip",
        sha256 = "59006480ad1f810903c6d50a2e67a9f93219aa9634ec317a9ac3ee0457ea7bf1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.0.0-alpha-1/hal-cpp-2024.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "ce9cd7e137d4ca6b6890b8a7ce25b77fea2426a3a5539570c4721c75503037b9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.0.0-alpha-1/hal-cpp-2024.0.0-alpha-1-osxuniversal.zip",
        sha256 = "ee6b4eb6f45f63d41eca93819f66a9278323fb8218887393dff9fc3a46f1aaf9",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.0.0-alpha-1/hal-cpp-2024.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "2ec785654de79ed56f9ce5d6f5dc42c96e6b4f59ac39f6e69349f59bfef0188f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.0.0-alpha-1/hal-cpp-2024.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "e640949e3fa3b269b132f631f1cfb572f9d8d6093af253656a33d1f127bb6bf7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.0.0-alpha-1/hal-cpp-2024.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "bb6e0f8484afb94ad5234e9c5cbcf2b91ab3f3b57bb2801ccfc4506ffca006fd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.0.0-alpha-1/hal-cpp-2024.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "6dc9199512bb08f7a6729de30955b8f94721d024deeea4d286dafc5f436d086f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.0.0-alpha-1/hal-cpp-2024.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "b02f8cd9189c4e0f5d3f87192ef2c1ca1da41ac26437a9d7a405e2b3afce33e1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.0.0-alpha-1/hal-cpp-2024.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "9cb7e2cc95b7bb7023e835f3d69fc5bbafbe98d1cc5b43704315ca58490ed503",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.0.0-alpha-1/hal-cpp-2024.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "974024e9f2714b93a00118a095d05f8db4011a2a22be8e50467358293e75a614",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.0.0-alpha-1/hal-cpp-2024.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "39afa5e4ecdaed29d6acc9df83cf50d67862dcd1c8afdea8dca5a4106fa8d97d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.0.0-alpha-1/hal-cpp-2024.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "578b1027099c4f00ad26e4cf0c34ee8ac336e14f5f7b45999ce379b887a913ff",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.0.0-alpha-1/hal-cpp-2024.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "ddcc70942afcce2809afb297f03e575cea05e0dc2d68f165091c1f440fe696cc",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.0.0-alpha-1/hal-cpp-2024.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "f20271d77e00bd9672c3a19b01bb78c97afec503b84a556473e3fc10924f02a1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.0.0-alpha-1/hal-cpp-2024.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "c2d74c306bed583783030c32e38d082bfdd3c62f611e9074f125a7583c19548f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.0.0-alpha-1/hal-cpp-2024.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "0e20f163f3f099c0bee02f1b53444f63dde25ec4e64e1cecf5b12f7fddca2dac",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.0.0-alpha-1/hal-cpp-2024.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "39dd6bc112bb9571ad145e6b0d4a5b985395e419189f97d943d25d5a9928c0ee",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.0.0-alpha-1/hal-cpp-2024.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "50b4b3253bee9cfd427d7b5780ae00ee58c1d44f6e4bb7ec812d2cdd2eb6880c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.0.0-alpha-1/hal-cpp-2024.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "3e9bc8fb8613b91217a2158d8704ef7cfbd814316813b77b8bd76cc4ba018b1c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.0.0-alpha-1/hal-cpp-2024.0.0-alpha-1-linuxathena.zip",
        sha256 = "f7536faa0b3c0868288ce6c52581f39d49abc371b78f42ab591eab8b8753ab9f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.0.0-alpha-1/hal-cpp-2024.0.0-alpha-1-linuxathenastatic.zip",
        sha256 = "8bff63bcad2043827541ce59110db5b14d199055aa559117c6303ab09590f2af",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.0.0-alpha-1/hal-cpp-2024.0.0-alpha-1-linuxathenadebug.zip",
        sha256 = "d1cb4357d40d1385546d9c46a9c71708a632e8ce4d660324d8660db28cd35326",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.0.0-alpha-1/hal-cpp-2024.0.0-alpha-1-linuxathenastaticdebug.zip",
        sha256 = "3f6997b4c8815360731308e676c03bd5f5188e4365ef23a1513bc0743a6418ed",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.0.0-alpha-1/ntcore-cpp-2024.0.0-alpha-1-headers.zip",
        sha256 = "a98fda0fbf5301ac14713d839eb0d3838ef3ebb25e57dadd338204601d84975c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.0.0-alpha-1/ntcore-cpp-2024.0.0-alpha-1-sources.zip",
        sha256 = "8f490e683a29466b886afa3fc94e5c477dfebe05a8c7251c82a93033ceba228e",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.0.0-alpha-1/ntcore-cpp-2024.0.0-alpha-1-linuxarm32.zip",
        sha256 = "c815a6e320f524f32c4ff9e0d33711aa6acff11f65aa36f2ef5db2830b90910c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.0.0-alpha-1/ntcore-cpp-2024.0.0-alpha-1-linuxarm64.zip",
        sha256 = "fd8374fffc5a31235e88c60f70b5652196fb850c198c77f5f93c1f5717c419e2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.0.0-alpha-1/ntcore-cpp-2024.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "859fe6083c2ce840c8ab1fc9aa6344949a98a71efd77e6001e0c2705f218e268",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.0.0-alpha-1/ntcore-cpp-2024.0.0-alpha-1-osxuniversal.zip",
        sha256 = "04899915933c7be3d8c190ab777ab2ac7cb71b757f811eb6f8a8fe3ada54bcd9",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.0.0-alpha-1/ntcore-cpp-2024.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "a7662add34815580ace518db7d08b78b9284863eade07150429726a035fe967e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.0.0-alpha-1/ntcore-cpp-2024.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "af14b8a458c74b0b2b543c7444416514270e59ecef31fd6550c3fe1f04f5419e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.0.0-alpha-1/ntcore-cpp-2024.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "5846d8f4afcd1e3a66d0950a3907233da527913b0b11643a36dad6df23c97d1c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.0.0-alpha-1/ntcore-cpp-2024.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "7b048b7610cc8a0a707d86205b5d00a0f37e3d4abee310b71724d0902fb8bd37",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.0.0-alpha-1/ntcore-cpp-2024.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "21332b49f9b26cf58ac8d17d63c492e97ba11da3bd79ae88907898d057f9a7d3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.0.0-alpha-1/ntcore-cpp-2024.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "0c30fdc7246fd537c07dd542e85116e53016a7dbe7fbbf8c7726cba5027a5d27",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.0.0-alpha-1/ntcore-cpp-2024.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "5bdd4c802ff38c6b41548ec1e1143546a601ad58622b30ba3879112fb2344572",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.0.0-alpha-1/ntcore-cpp-2024.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "e573b93f2be885af33438ba5ab87e226649164dd9a24bb46cb01839ba4355e1e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.0.0-alpha-1/ntcore-cpp-2024.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "7f072acb2987fe42964f600280ff93f489e85f48f07fd5af22f38e54683bed59",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.0.0-alpha-1/ntcore-cpp-2024.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "3017292e7312ded97d4dccf2614092bbdef6f69b2e503cfd264c033edd8fa8eb",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.0.0-alpha-1/ntcore-cpp-2024.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "4909ebe808fbc651bb2bc31eca8f179fa36293b8fe3a64f37b85ab1cec81e74a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.0.0-alpha-1/ntcore-cpp-2024.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "075b0df75d1fce95974a84f933d8bc6ad723de19c1dd5235e2d3182d7dbd8682",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.0.0-alpha-1/ntcore-cpp-2024.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "0de59a4b97544d24ac3dc4a3709e49731b2860d05beac746d2cd96ce85aed6bf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.0.0-alpha-1/ntcore-cpp-2024.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "74057afc77ae3bd7ba3ced9ba38b5e87ddee54d6ef5199203a9ec09280b92ca0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.0.0-alpha-1/ntcore-cpp-2024.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "a01aa5af6937743a01baada41b9e1fd355a23553ac902f45a1041102e8bcfe97",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.0.0-alpha-1/ntcore-cpp-2024.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "77b950589e1b8abe6d29ad10c0b6a930fb07a1a757f138b4f1daf70613a1b709",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.0.0-alpha-1/ntcore-cpp-2024.0.0-alpha-1-linuxathena.zip",
        sha256 = "523620ef9f6abb9c7dd8b710570b309eddc288f6f4d8b4f97aa14b3f3c097ca4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.0.0-alpha-1/ntcore-cpp-2024.0.0-alpha-1-linuxathenastatic.zip",
        sha256 = "a87724921070ceb68b3de66ad441212b0b6d8a112474ce592ce1c44e247e8855",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.0.0-alpha-1/ntcore-cpp-2024.0.0-alpha-1-linuxathenadebug.zip",
        sha256 = "fb50a7e369110bbf45e7e1b17cdc80462183cc05171e60158993d511e62ca75a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.0.0-alpha-1/ntcore-cpp-2024.0.0-alpha-1-linuxathenastaticdebug.zip",
        sha256 = "6bf7377f03e75dbc0f7f799fa78a1d313c2c6f2c7a500b7b34d78cad743fb1f7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.0.0-alpha-1/cscore-cpp-2024.0.0-alpha-1-headers.zip",
        sha256 = "da7e8c4d91f65e7301394a8fbe23d9b11cfb4996a08bf6ce5fa6cfa5e6b4fa95",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.0.0-alpha-1/cscore-cpp-2024.0.0-alpha-1-sources.zip",
        sha256 = "23f36e05af5fe6aeda963dee50a758c6b1f3eb784b1840b016a845dab0f09937",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.0.0-alpha-1/cscore-cpp-2024.0.0-alpha-1-linuxarm32.zip",
        sha256 = "b73b94d5f376622d0342640a553f7479300e9d26fc77908afd200840f96c5077",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.0.0-alpha-1/cscore-cpp-2024.0.0-alpha-1-linuxarm64.zip",
        sha256 = "2080acf28fa2b0802fdf89afe7f92e835c7945acde5830157b4e06cf52e049ab",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.0.0-alpha-1/cscore-cpp-2024.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "da627b7bda6f18e7529e3f7965ada49b739ae79b485e9b3e8c0fe7e0559eddf3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.0.0-alpha-1/cscore-cpp-2024.0.0-alpha-1-osxuniversal.zip",
        sha256 = "738b3b024f1ec76ea317dff4312061381c2cd02382e344e5992d412d4324341b",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.0.0-alpha-1/cscore-cpp-2024.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "002b409ab4580d65d393ad4d37eb4df7f656311485a236e9f2107dcb0998be5f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.0.0-alpha-1/cscore-cpp-2024.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "962dc52db6b10dfdd1cb455a9fd9c55c9fe1a91dc0ab4f3659a7937eff043291",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.0.0-alpha-1/cscore-cpp-2024.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "e11eab9e0b34d5ec3c6468b0e516ce060d3e7274753a6e075709214af250309c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.0.0-alpha-1/cscore-cpp-2024.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "577f11132fa3559c0c63fa8735d3101ad254c2ff2d2c6e4637f775dda9739059",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.0.0-alpha-1/cscore-cpp-2024.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "be688f0e09d7ee128d06b0ff5d346d06785337512b9bfbd8023643098dc007bd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.0.0-alpha-1/cscore-cpp-2024.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "7d6228f7bf097f06a3fb7925d6ef30b4016e2a31ce368c4377eea7fa49d97a34",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.0.0-alpha-1/cscore-cpp-2024.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "d3dd589365d4fb2760f9b4fc5f1c3b6cf821051f126390f738940f5197036f9d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.0.0-alpha-1/cscore-cpp-2024.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "2bb1e8683591dbacec72166f063d84fe2cf56853c8346365ce3be331c209fa8e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.0.0-alpha-1/cscore-cpp-2024.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "57d321fa530b749e55bad19f1fba6c980b7b0c8a55f2a6a695dc52c8674aef27",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.0.0-alpha-1/cscore-cpp-2024.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "7300f0411db4b0b6cff91f6a06dab1f9b4d864377d8650f44f2b79382b33be2e",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.0.0-alpha-1/cscore-cpp-2024.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "4b4f72f5c1418eeb57a69e771ae7ead6d8ce84e6ed9368821d85ef275e83fa86",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.0.0-alpha-1/cscore-cpp-2024.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "7176f9aad26779c2e455303a3210618d98dc5ea52e094be90d915ab85295e0d4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.0.0-alpha-1/cscore-cpp-2024.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "4af9ec20372d2918778aea139004f906010b1dcdcdc6206fcd6243d101a63879",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.0.0-alpha-1/cscore-cpp-2024.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "0bd4849b7fb4396b622692f43bae71e17737c3ed387de9b21100e14d805ecdeb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.0.0-alpha-1/cscore-cpp-2024.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "a43ff69710e3d7cb80b9b87fe0f486b1116e102c26313dd9324ad9c17c632572",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.0.0-alpha-1/cscore-cpp-2024.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "2a93c8b805243d83f5cd28b0a79596e0a04825bc047776fd53bcd62370a62cbb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.0.0-alpha-1/cscore-cpp-2024.0.0-alpha-1-linuxathena.zip",
        sha256 = "ce20c1d76df30e0e3ba9be1650045af9424005eddba218a982fdd48cc6366b0a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.0.0-alpha-1/cscore-cpp-2024.0.0-alpha-1-linuxathenastatic.zip",
        sha256 = "a3898e8818b9cb373b4f1b94b83a80f3137421bca5164fb42e8871af1898cbff",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.0.0-alpha-1/cscore-cpp-2024.0.0-alpha-1-linuxathenadebug.zip",
        sha256 = "c9e89069b09fbc7ecef64f75cc464e923493660ef27af1e4e0267f37347e717d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.0.0-alpha-1/cscore-cpp-2024.0.0-alpha-1-linuxathenastaticdebug.zip",
        sha256 = "e999a6aea004b7bca5ece1611d337a51eb6407bd68ec77c9bc51800589a4e84d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.0.0-alpha-1/cameraserver-cpp-2024.0.0-alpha-1-headers.zip",
        sha256 = "3a74a44acf024406783db795429e270b8cf64e63fc1865e8a04cc6679c550c72",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.0.0-alpha-1/cameraserver-cpp-2024.0.0-alpha-1-sources.zip",
        sha256 = "b68878f7c62261de404b337e5dfa6fe391a959de961d5ffa56a23ec00f97e2f3",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.0.0-alpha-1/cameraserver-cpp-2024.0.0-alpha-1-linuxarm32.zip",
        sha256 = "22e05687f5ade83e3d008d68df4fce6644cdd998141ad57d40b8d6a784b50fb2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.0.0-alpha-1/cameraserver-cpp-2024.0.0-alpha-1-linuxarm64.zip",
        sha256 = "589e31a45084d8f4ff21cb6b02eb0d2fb86721eee830a291f1c31e3b2663765f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.0.0-alpha-1/cameraserver-cpp-2024.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "0234c9789b46dac165102743569fc0e0de2ebe4984a78958f17fd78619e2d023",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.0.0-alpha-1/cameraserver-cpp-2024.0.0-alpha-1-osxuniversal.zip",
        sha256 = "78ac015c0cacb51f699c538ddb1f9ec5d3cb462b7613561d827cf5e60133681f",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.0.0-alpha-1/cameraserver-cpp-2024.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "0dad7f6cf906c0ef04c736711e746dfd093c1dcf20b2ddfba853e0e07f7ec552",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.0.0-alpha-1/cameraserver-cpp-2024.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "8c399dc47b5c2d3bd2721a555926e0c8b7fde1d4be8e6c88cd3e56829fc3bfb2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.0.0-alpha-1/cameraserver-cpp-2024.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "ad685b021dc1f9aeb8c0b8319428d7142a5de5759f270057e68d33b29aa8dfaf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.0.0-alpha-1/cameraserver-cpp-2024.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "13bf0221d7a1dca1b565fb0d797103db9eb55205e5e5843d1c5ff7773e021d30",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.0.0-alpha-1/cameraserver-cpp-2024.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "3f2d427c295373165d508ca1fbebbfdc1dd46c3fb7c994bacba7e7822685d09c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.0.0-alpha-1/cameraserver-cpp-2024.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "760e6734912d2a86ed8e9b1273fc118f4fc6ba9fb98933e4a2d4f1cf348cb1e1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.0.0-alpha-1/cameraserver-cpp-2024.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "596f4b06c23b874070a73a52ccc60c48a4cc63bc0f49319ff019bc7536712475",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.0.0-alpha-1/cameraserver-cpp-2024.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "64fb2ec996cd8d9d2c5f1b00f69d0f3c2959e9e69a6c02bc22bd6737ace51cf3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.0.0-alpha-1/cameraserver-cpp-2024.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "8807ed45e9b9e321680a7bc62252ca73e58f475a5323a6824c4889edf66b9d2a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.0.0-alpha-1/cameraserver-cpp-2024.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "c8fabbf879274358d945c03224e59907dab984ede60cace3ae05e20d08a10fd8",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.0.0-alpha-1/cameraserver-cpp-2024.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "9b39ee0093cf7809afdfed123942ca795ee7348d5a6f7fe95adb0625a7fb1ac8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.0.0-alpha-1/cameraserver-cpp-2024.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "1e27008f1a11b28d773c2e6cffceab89eec7ab4c53a88739ace38aeb73780fff",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.0.0-alpha-1/cameraserver-cpp-2024.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "55985f215e19f28624f1c80ee88ac67b9be684102699a7beed07e889dd8058a3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.0.0-alpha-1/cameraserver-cpp-2024.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "ccdbfc0acb998446d7a6123c257db13d3abdc596d88f213ec4e3ed6ceb554045",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.0.0-alpha-1/cameraserver-cpp-2024.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "e7aadfc9aaa9d2f09f59fe2c193e0b7cf91c7729057110e73bd3051e2614b3f4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.0.0-alpha-1/cameraserver-cpp-2024.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "3d57a96a82c2bc75cad6be0c57df3f1782358ddff3186f37df0aab7ff069bebb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.0.0-alpha-1/cameraserver-cpp-2024.0.0-alpha-1-linuxathena.zip",
        sha256 = "fe6ad3f7e3735f67db90d827f9150c29b7962037b87c8f0a8c8f26ccf1bd2608",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.0.0-alpha-1/cameraserver-cpp-2024.0.0-alpha-1-linuxathenastatic.zip",
        sha256 = "ccbf94c9c58af2b509085f94c978324e2d12078c51dc716fbd53ea9c0e0cafc8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.0.0-alpha-1/cameraserver-cpp-2024.0.0-alpha-1-linuxathenadebug.zip",
        sha256 = "8848f9984d1fc0b074eabe1f2c06f7bf9172a36f004b41afade0aa611b6e82b7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.0.0-alpha-1/cameraserver-cpp-2024.0.0-alpha-1-linuxathenastaticdebug.zip",
        sha256 = "8f7467a3f57a07a151a4567f25a9a927b9b9741450254a194f6ac572eb68c8bc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.0.0-alpha-1/wpilibc-cpp-2024.0.0-alpha-1-headers.zip",
        sha256 = "b8140ae0ba8a9c85b4e783f70c3f0e702e8f9d8323dbbb846f07dd9ad6c72f7f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.0.0-alpha-1/wpilibc-cpp-2024.0.0-alpha-1-sources.zip",
        sha256 = "fdc38301ce195e34a8e68dbff6bfc02d715f85fd51bc3745e2ad61ed7df41a03",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.0.0-alpha-1/wpilibc-cpp-2024.0.0-alpha-1-linuxarm32.zip",
        sha256 = "d44c850aa182d487899e2a82f5e45cd7b4802ec54840562dd20ac46ba231ee95",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.0.0-alpha-1/wpilibc-cpp-2024.0.0-alpha-1-linuxarm64.zip",
        sha256 = "59e4bb248482830748eb07cb9df8f88e463fcb9ec08abdf76c6f9345266c14c7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.0.0-alpha-1/wpilibc-cpp-2024.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "57a68adab02c8278fda6034cb4d31e8013d7f56edd700a38f60a90102cfca951",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.0.0-alpha-1/wpilibc-cpp-2024.0.0-alpha-1-osxuniversal.zip",
        sha256 = "68c40453f6425bdbef891f50036394c4e475c0f3c3d1925c5a00bb3bf46b11ba",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.0.0-alpha-1/wpilibc-cpp-2024.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "0d624a20451df59a8de877625cc462dba104f5990360ba571b09c1ee7a64c2a0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.0.0-alpha-1/wpilibc-cpp-2024.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "7eba16ce69f819c1b0187b2f5af49d251000b3b031e583c0761fc95a32a32779",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.0.0-alpha-1/wpilibc-cpp-2024.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "5de1cd2c465a8ebe5e9b691bececc6023392cd95742c358f7228c24943f7137e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.0.0-alpha-1/wpilibc-cpp-2024.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "76f696ee984cfc640c684e5b90accb59f1bcdd32d4c21718ebfb274397f20dab",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.0.0-alpha-1/wpilibc-cpp-2024.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "90e23689c1416cf79a73f14823fcbe7181d5ded623a32f803744a3061070ab7e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.0.0-alpha-1/wpilibc-cpp-2024.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "936be023696cfa7d95698ab459bf987c1871da125dc36e97165eef25859712e1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.0.0-alpha-1/wpilibc-cpp-2024.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "13b3fe5ae73df289fed00296a965e4f248ba3b76f495f87da301c7850210c49b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.0.0-alpha-1/wpilibc-cpp-2024.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "d24b5a1053c3f6fbc2717e2c33036aff4a0db768adde52ea4ae32e29a17f34b9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.0.0-alpha-1/wpilibc-cpp-2024.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "db3898712c90871583ef87fdbfa9182852fb00c8be9abc869b64392badfd1eab",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.0.0-alpha-1/wpilibc-cpp-2024.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "325bc4de2d3d5f1aa49193e9a8dedcbe04a09732ac0584b464a8cc35bf5fbfc9",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.0.0-alpha-1/wpilibc-cpp-2024.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "0eaa57de0a6002756305eec3ce6aed9dfdaa5562b4ad8d49f3ca91e317780e68",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.0.0-alpha-1/wpilibc-cpp-2024.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "9a42bd756d5a7cf2b889391121e0ec9e630f50532ef72a3984efe3f498156047",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.0.0-alpha-1/wpilibc-cpp-2024.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "a50ecd0ac1b631d16ffb8463efd24b0be9ba279a9b5d5cc4dcc40d7a26d3ba1e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.0.0-alpha-1/wpilibc-cpp-2024.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "ff009361e2ee4d2700bf8b9a5253ec2afdbb2b1f9eb8a0c269ce2ecadfdbc3ab",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.0.0-alpha-1/wpilibc-cpp-2024.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "9c5f7f79819ee9fd49abae3b5a692957292ae194bf69c06a8c3ab064cf97d3d5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.0.0-alpha-1/wpilibc-cpp-2024.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "4b0848671ff7d087fb5eed65444f6f09a40827993e1dc2f90a478faf32803af1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.0.0-alpha-1/wpilibc-cpp-2024.0.0-alpha-1-linuxathena.zip",
        sha256 = "19964e21227ec60fbd35376929f8e1092144378e5dc9486c06294830669cd4fb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.0.0-alpha-1/wpilibc-cpp-2024.0.0-alpha-1-linuxathenastatic.zip",
        sha256 = "42f247f53426d473219a1cb6c536ef6fdcda51c8017650cd5d309408c3912dd9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.0.0-alpha-1/wpilibc-cpp-2024.0.0-alpha-1-linuxathenadebug.zip",
        sha256 = "ad43d5c256ba257ad41a11a625b26f246d2e2bc804b5ca22057d4880a265d713",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.0.0-alpha-1/wpilibc-cpp-2024.0.0-alpha-1-linuxathenastaticdebug.zip",
        sha256 = "6aea44ea2a2927dd47d18b3c9a0bef7fbf48ef8d4a281d0c7e838af56c5206d0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.0.0-alpha-1/wpilibNewCommands-cpp-2024.0.0-alpha-1-headers.zip",
        sha256 = "4d9abca7431819019165f58c2e794a111f63f7cc9013deca4758bc1f5a86ca87",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.0.0-alpha-1/wpilibNewCommands-cpp-2024.0.0-alpha-1-sources.zip",
        sha256 = "bf6246017e79ef3350694b6629c4bb784e9551eb9f6e15622d23154b1729a942",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.0.0-alpha-1/wpilibNewCommands-cpp-2024.0.0-alpha-1-linuxarm32.zip",
        sha256 = "0ca4e352634041ad1aef4fe45e7f0acd7bde80d3f05c018aa13df1415671d79d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.0.0-alpha-1/wpilibNewCommands-cpp-2024.0.0-alpha-1-linuxarm64.zip",
        sha256 = "f972c3eb4dc49c5842965a5c4670b074558f792a855a946122d636518753cad6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.0.0-alpha-1/wpilibNewCommands-cpp-2024.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "cf6d3fab944ced8de7729f18c55fc837bb93ba238d5af465df7a13542aa02a2c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.0.0-alpha-1/wpilibNewCommands-cpp-2024.0.0-alpha-1-osxuniversal.zip",
        sha256 = "53eb19e82087fb594424c9145d7e5a63050f00d63bdb61e4d54bf306cc39801b",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.0.0-alpha-1/wpilibNewCommands-cpp-2024.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "c331afd9000bfe2c603018073571a4aa55065c6e0d13ee314221eac967cd5b04",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.0.0-alpha-1/wpilibNewCommands-cpp-2024.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "bead5a7e40340dfb128e46dfc5fcaad104327cea1e139d04138c2b2122a70e13",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.0.0-alpha-1/wpilibNewCommands-cpp-2024.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "2796974307ef72ec59d86e94c0ff3e504dc92b7ee2cad8ff9fdeb5aad5c843d3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.0.0-alpha-1/wpilibNewCommands-cpp-2024.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "c0e1a31e9a4c7986c84e49147e31d213ca15ed242e8de42605bbad92470c7d09",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.0.0-alpha-1/wpilibNewCommands-cpp-2024.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "f637952bb69d06064f64520d6eb48e57d6427f2ee186dff8b22f469a6ed7cbb3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.0.0-alpha-1/wpilibNewCommands-cpp-2024.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "3cdd5f8fad66f3c7f16def1693a9a9bdb7d287bb8f0a1afb84719ee061a08963",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.0.0-alpha-1/wpilibNewCommands-cpp-2024.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "88100cb91a606032abc55654c48bea56f042b5ee4ad4760618d16780985bc3c3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.0.0-alpha-1/wpilibNewCommands-cpp-2024.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "d22808953c61bc74e8d4e914099c236d296b1c72fc66362b458a72e17875cde1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.0.0-alpha-1/wpilibNewCommands-cpp-2024.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "d62b0000c250969a321cb95e03a36839dce14b5b59e162ff07c382bc2776130e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.0.0-alpha-1/wpilibNewCommands-cpp-2024.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "e248232bf0c79a244110c2924a3f289bd66c12914466066b103861063b02ee6d",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.0.0-alpha-1/wpilibNewCommands-cpp-2024.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "f724b34fded66acff8bccb035c811f6a640bf120703147065260e496fa967f19",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.0.0-alpha-1/wpilibNewCommands-cpp-2024.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "e43a2dbb6e84df2429875f6f65bf045665ced2714e80acad8512217fad28348c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.0.0-alpha-1/wpilibNewCommands-cpp-2024.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "b119eb4cc74115b86ae455f7f97ea2968a21e14f21a858dd6fa958de20561c8d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.0.0-alpha-1/wpilibNewCommands-cpp-2024.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "dc0b2b853e4bba00a8efbe98d063918825aa8aebfea8ad7c9aae4c83bfb07e02",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.0.0-alpha-1/wpilibNewCommands-cpp-2024.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "a227cc3eb6c4dd57c8c4db9ba282e9d2f7c36a1c5e49da97d8bd0486f59148e7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.0.0-alpha-1/wpilibNewCommands-cpp-2024.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "6b1cfc35ab2aa98541e431dfa2d71aa4583a429d532b44d6540987a367a724a8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.0.0-alpha-1/wpilibNewCommands-cpp-2024.0.0-alpha-1-linuxathena.zip",
        sha256 = "bc5cd42c242e1cbe6daf695f78d54f7c85ca4dbaec8467bbd269bbed8ba23bb8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.0.0-alpha-1/wpilibNewCommands-cpp-2024.0.0-alpha-1-linuxathenastatic.zip",
        sha256 = "1a050d15e55f51c2e787dbf9437ec18f68243d5378c41b8978b43cafdbd6feb4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.0.0-alpha-1/wpilibNewCommands-cpp-2024.0.0-alpha-1-linuxathenadebug.zip",
        sha256 = "f527e93c32a1dc1433e6c90c63430f01b1cd1b505b28e012a158ed180ba27c0c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.0.0-alpha-1/wpilibNewCommands-cpp-2024.0.0-alpha-1-linuxathenastaticdebug.zip",
        sha256 = "fc8b507116cac9774792369e46e0830abe990f929f7133b609d8bd15733d13d5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.0.0-alpha-1/halsim_ds_socket-2024.0.0-alpha-1-sources.zip",
        sha256 = "f46185a2b311bc7745d663d14889b36406682b40a8018ad9000f21c818894491",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.0.0-alpha-1/halsim_ds_socket-2024.0.0-alpha-1-linuxarm32.zip",
        sha256 = "291506d374878d788854a822e85ce84c2858755969c386bf6486e2461ec8ff1f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.0.0-alpha-1/halsim_ds_socket-2024.0.0-alpha-1-linuxarm64.zip",
        sha256 = "499c33f71c0a2c2398862f4e4182d18c887eb443e83fa98d47d8830ac05840af",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.0.0-alpha-1/halsim_ds_socket-2024.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "840d1045539982cb3904a78b4d6aa91b8f2773bac05d4b439d4dbf4ddbd8831e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.0.0-alpha-1/halsim_ds_socket-2024.0.0-alpha-1-osxuniversal.zip",
        sha256 = "94634bad6cd66ef24bc00ba10c913a743c4b1f2f64892f5538a023a984c11bc1",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.0.0-alpha-1/halsim_ds_socket-2024.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "e3e1c405e72b2d137ff95c95ba10810ab08650e7eb2bd02d7c0a5f80d4563d33",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.0.0-alpha-1/halsim_ds_socket-2024.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "e6d1a7405eb71d2d3bdaab743f4d5c926476da22996ec12c4ffc79a094b9cf97",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.0.0-alpha-1/halsim_ds_socket-2024.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "c682578064d3b86f06fd986348391519d31bab3b0e10c1f6e76fe49b83974740",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.0.0-alpha-1/halsim_ds_socket-2024.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "c9b09775dbbc26a758e8db4bc288fc2719059bf45b3586068ecaff88dedfc561",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.0.0-alpha-1/halsim_ds_socket-2024.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "2df9e3fc52d6bf285555739f6341561416790606b4eab9900497adee15b64216",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.0.0-alpha-1/halsim_ds_socket-2024.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "8b9ff665cf3295e6c01db29ca9b5331f50ae6987f608ad28a4b849668db67dca",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.0.0-alpha-1/halsim_ds_socket-2024.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "9ca74631e91b985892b4e65bedf552374081ff3651d75c9a5fb3cce48c3d5b13",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.0.0-alpha-1/halsim_ds_socket-2024.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "b1d135d3e59d5b61f7cb4180a2d4447da3c42ef7de581b17f107d824e0b02cdb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.0.0-alpha-1/halsim_ds_socket-2024.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "2211183c0a787e743aa9451a7a6fee700eef7a6e82888efcffa585d29f433a5e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.0.0-alpha-1/halsim_ds_socket-2024.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "e21250120b30b297467a0f95e699bbbc07def3f39050921577e58f8dd9de123a",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.0.0-alpha-1/halsim_ds_socket-2024.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "c1a4cee7fb95eec7b23932156d04b027194f75ba94847934bdb26137c4af6906",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.0.0-alpha-1/halsim_ds_socket-2024.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "25ecb05fbdecb0e16e72f73ecfbaedf145dd08bf42b7350aafb9f03fde76b253",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.0.0-alpha-1/halsim_ds_socket-2024.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "f9d38ee69aa3395dfd3fe8f748f611fc9bc128ec0ebce12ed9cfbb04dd729081",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.0.0-alpha-1/halsim_ds_socket-2024.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "6ecb7434762226f4b3d0be9c1e3d9a1058d49286b049eb53cd7b34e5d5bfde19",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.0.0-alpha-1/halsim_ds_socket-2024.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "3252f302b3f44208bc2aa3b9fd328acd1c02dc134723a9c138b3943e64aa69b4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.0.0-alpha-1/halsim_ds_socket-2024.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "489417bea69235701837e5aab99bc0dca25aa2dbb0860b3f70f406015eda27d1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.0.0-alpha-1/halsim_gui-2024.0.0-alpha-1-sources.zip",
        sha256 = "6f63c1cb09ab0ee71910eda8662ec22c0139a7ce589aa71b2f1f08d86b8e4d6e",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.0.0-alpha-1/halsim_gui-2024.0.0-alpha-1-linuxarm32.zip",
        sha256 = "ec127fe1c9c531c2544eaf7ec1237febab9715edc4bfac63987b3cacea1cc161",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.0.0-alpha-1/halsim_gui-2024.0.0-alpha-1-linuxarm64.zip",
        sha256 = "4f6eeb1c304d15652a14e298a968c927f5c084acd01813ff6a79ba83d90e18bd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.0.0-alpha-1/halsim_gui-2024.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "4e2f72ef0697a739fde94c852d8e00dbe899aac8a4f66fae8fe3f5ade97db186",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.0.0-alpha-1/halsim_gui-2024.0.0-alpha-1-osxuniversal.zip",
        sha256 = "f9a7adfea0d43514e76f8e99a1fcb21dfc1342e8fedf64c28959f4e3b97f4116",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.0.0-alpha-1/halsim_gui-2024.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "64169022cbf88f9b25d3dd74b06e4aff263a23ca5001cdd51cbd96dbd555e1a9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.0.0-alpha-1/halsim_gui-2024.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "8b17a725559fa0c46b5c790a1505d805c981f7e190a7aa0f4fd9f1e038e50f7b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.0.0-alpha-1/halsim_gui-2024.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "ad6e5fc5e441dbd536e74e6c5943680552e51354f23d9398598f7331a14613ad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.0.0-alpha-1/halsim_gui-2024.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "49abbe39a806168c3cf37cdb037f87ca80808db256510d91c9d8873157e5eb0d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.0.0-alpha-1/halsim_gui-2024.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "7fed1817a77b77d70ae3d2bd098a4b0917cabdbd7e428169ea71657583b1e655",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.0.0-alpha-1/halsim_gui-2024.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "70ff367a137949181a140e3a1fc08b9feb492d29df46275f9d3c10bc6307ecdc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.0.0-alpha-1/halsim_gui-2024.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "f9c718140b3207df69fea90e33d995855c6834e7d4f47dc7e5bf8b08d66b586d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.0.0-alpha-1/halsim_gui-2024.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "ffd71f5bf6bb0d761594fe19ca1f269dc996d4942a0fd86ef477412c197e214d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.0.0-alpha-1/halsim_gui-2024.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "d9a61c8a5e2839acff69030c98239797e35ca721de06efa66a185fcc4b1a35a3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.0.0-alpha-1/halsim_gui-2024.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "397262ed21bc2a02eb143eedfd10445de48109328c5366add9c519da09435e7d",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.0.0-alpha-1/halsim_gui-2024.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "9985adc00a47c2d09123cb3de8f502f8d8390294da1d3be7bf84f9f2a85f4bae",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.0.0-alpha-1/halsim_gui-2024.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "dae4d7281fab3afd7c463203b75a31cca503e49ee52cbd256f138cb5df3638ad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.0.0-alpha-1/halsim_gui-2024.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "522cc439a96a697126cb51040f2f65360af4fa5c741c6eb2a205860aec7ef408",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.0.0-alpha-1/halsim_gui-2024.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "faad3e52c999913ff3e0b8c3380a2fe2dfc19a31ce0378be90d86bc0962d3712",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.0.0-alpha-1/halsim_gui-2024.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "01431978e10a3129916b9576131c0b8f4e2047aca5c89c07c2957649f8eb2ebb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.0.0-alpha-1/halsim_gui-2024.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "3cebfaafc318e4d719ad41a31dea4d2aaeaf6431c35d3feb6c4c0e430c378f07",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.0.0-alpha-1/halsim_ws_client-2024.0.0-alpha-1-sources.zip",
        sha256 = "40077c77146d3122e40fa0d756c6f82f3e9ad0144105062e842ef3164bddbb41",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.0.0-alpha-1/halsim_ws_client-2024.0.0-alpha-1-linuxarm32.zip",
        sha256 = "dc9b9eefc186ffbc9ec666efb72784dd6df6e3c0f15dbaea9d49c283e6829223",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.0.0-alpha-1/halsim_ws_client-2024.0.0-alpha-1-linuxarm64.zip",
        sha256 = "939ee877705290eb95e82f8bd20c11398035580af1de4db7be1bce01bf0efa9b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.0.0-alpha-1/halsim_ws_client-2024.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "10de3551a68c40d3d9664c58dd752c87e589d3ef2831c045476bad12e07e5b26",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.0.0-alpha-1/halsim_ws_client-2024.0.0-alpha-1-osxuniversal.zip",
        sha256 = "60d208d59e44d403b841e42fbf48278222a85fa1acbd1abfc6f92128c0206236",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.0.0-alpha-1/halsim_ws_client-2024.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "e075c045440c3d5798f2416dcf3d65fa2d0647ab4dd1157d38578bfaaad0a9f9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.0.0-alpha-1/halsim_ws_client-2024.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "caeba2460829d3f44409faf40dc6ea06da967a822467626377194d6de70bda9b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.0.0-alpha-1/halsim_ws_client-2024.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "803556d4afe356c1049f309043b351edb8ad24d9d957f936b87d8e1504eac733",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.0.0-alpha-1/halsim_ws_client-2024.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "2c4294b6ccdba225eb0d10ee79997795bd240341588034522202a8cec806aeb8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.0.0-alpha-1/halsim_ws_client-2024.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "452ee57ec3c50ad8160b1806e2f56494e43dff24af204c8abaf271e5d2e1461a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.0.0-alpha-1/halsim_ws_client-2024.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "1ce087db290e582341b6d037e482b6479d21c0d07b7515ddc16d0a739e3d9ed1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.0.0-alpha-1/halsim_ws_client-2024.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "69c5664a4db7b8436d9261a5f8c22c418996abb696f0473c97e5b2fa03fe8466",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.0.0-alpha-1/halsim_ws_client-2024.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "29b634f0da7489a4d577a362b50dc0eb2878ea5e1f77636c2eabfd5bd1372663",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.0.0-alpha-1/halsim_ws_client-2024.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "aebbfd8f2765e07686331758f72e49acd8db1c0a96dab1badaece5b0ec6ce023",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.0.0-alpha-1/halsim_ws_client-2024.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "69dd8c9453c8622a2b04e347159f4de4f71a4d1d836d1fbf8423ed0f61ee3a3a",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.0.0-alpha-1/halsim_ws_client-2024.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "b1ce13acea254998b289d7de70c9c5950078f5f62c3a4a83ac4282ea09de2d25",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.0.0-alpha-1/halsim_ws_client-2024.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "acdd20d44b7f9a1d3aed6c7608c8724ccdc4f11748872aedd93df8160de0c942",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.0.0-alpha-1/halsim_ws_client-2024.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "6bf0e43fc2a3059d5a20d6c0ca925d9cef1f195ea2b7026e0f4a4f24815ccc30",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.0.0-alpha-1/halsim_ws_client-2024.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "f4dbd6069f3f3151f8c84a29a912d87b04552b45129e9349b9090ba0ea82ade7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.0.0-alpha-1/halsim_ws_client-2024.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "2f987a25c04283922800dd5fdcc4aec07769d8c55d6e2a73ee919b3d2ba0d93a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.0.0-alpha-1/halsim_ws_client-2024.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "cfe21145b9d243d50dbd0327aae574faa488f40fea804c0beb4d2555e3c836be",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.0.0-alpha-1/halsim_ws_server-2024.0.0-alpha-1-sources.zip",
        sha256 = "064cb0949b1e2503c8765548836b02cedac3339329901a9715052f7b902f8db7",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.0.0-alpha-1/halsim_ws_server-2024.0.0-alpha-1-linuxarm32.zip",
        sha256 = "3803b74e2c9eb66281b8ec7652d48f72ab19d5864e3e4dcd87a61a174730a770",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.0.0-alpha-1/halsim_ws_server-2024.0.0-alpha-1-linuxarm64.zip",
        sha256 = "d9b57929a3ec016f0e400f9166a4831f5a489d6e1f9830b0920a6405df1f7dd7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.0.0-alpha-1/halsim_ws_server-2024.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "3b985f6230b12e366b90344754414c83c078f0dac7d387d3a2db3b6051c42738",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.0.0-alpha-1/halsim_ws_server-2024.0.0-alpha-1-osxuniversal.zip",
        sha256 = "6ffeadc89b9fdea61df77bb58320f6813ee8965b9183264f91e8c9b1fb4ef3cb",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.0.0-alpha-1/halsim_ws_server-2024.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "3e649ecfac2eedbd6d0e15040ff134031a9b800f1cb09f8f227b0560d817a82e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.0.0-alpha-1/halsim_ws_server-2024.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "adfc16c70a568d3528f646e0830cc15458cda86dbac68399d2dd40b80e434b15",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.0.0-alpha-1/halsim_ws_server-2024.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "2b642725e5c0cdf4ead17ce79ddd07750fde89de1e34e35002126f26727d36a9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.0.0-alpha-1/halsim_ws_server-2024.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "2f59a60745b73c646fdbf38d88e9501983602937623703e3c97d8e0aee9c0fec",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.0.0-alpha-1/halsim_ws_server-2024.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "af5f99ea30a78b03d8e241937d1b75568ee7a6dfa5865424c6c91f7044729c0b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.0.0-alpha-1/halsim_ws_server-2024.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "df30ca02f3f74807f4e7ee0df3275983faf51dd90a3742364c12a7db0cb59815",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.0.0-alpha-1/halsim_ws_server-2024.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "7c49a47b93146ca9d2fde66844164d634a54d1c984d05399db23b1ce6f4cf03f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.0.0-alpha-1/halsim_ws_server-2024.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "cbd07c032201d57e862cd9419cb770005806e3ecfca2dab55ea6897541e7fa7e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.0.0-alpha-1/halsim_ws_server-2024.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "81aff55f7d92aa07c6bacb1b77673b1c5881c1053fba6389e9cf5b3b733e97aa",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.0.0-alpha-1/halsim_ws_server-2024.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "d3cd5ebbaf7332d14c80185b9851cfb2220709d230ab50ced52c0953f3afa044",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.0.0-alpha-1/halsim_ws_server-2024.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "1585ad35bb7339cbd9f38876dee4594d393c98b3b8806d4278b9c396f561712a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.0.0-alpha-1/halsim_ws_server-2024.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "bc949af7fe1931c2db3bb176d2fbe9280c7d9b97949b003f3f1a34cf70961f72",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.0.0-alpha-1/halsim_ws_server-2024.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "0d8bf32637e38c2faf086c4c93ac5479a7a6f66633a0049b8b1a33fb526eb3d5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.0.0-alpha-1/halsim_ws_server-2024.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "4678e9ddd631b4ad14c95ae78a31ce4b9ecddcca0e0a9111d48237d96c947a48",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.0.0-alpha-1/halsim_ws_server-2024.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "8d2bf19855adf0707950bacde72bf895ee8e300e21a9fca3e9de315c93eab406",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.0.0-alpha-1/halsim_ws_server-2024.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "0d8b75fb620cc0dfe908a8cd992ce78fe54ef6c50069aecac83678b588283c72",
        build_file_content = cc_library_static,
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.0.0-alpha-1/SmartDashboard-2024.0.0-alpha-1-linuxx64.jar",
        sha256 = "2a8bd1cfe7e381a5d96a9161dffa4a048a0c4fbe95b1e5a6de3b65965a81a27b",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.0.0-alpha-1/SmartDashboard-2024.0.0-alpha-1-macx64.jar",
        sha256 = "c541f8ed090e704c280747861cb750c832916b37a8e6bb089793bc52e220959d",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.0.0-alpha-1/SmartDashboard-2024.0.0-alpha-1-winx64.jar",
        sha256 = "82f3ff1f08a350240ea41a0a9fb2229824e8b554af456eb6f4b6756dd1d620c2",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.0.0-alpha-1/PathWeaver-2024.0.0-alpha-1-linuxarm32.jar",
        sha256 = "907db6cfb56ae61be358c52d874790e18ad74ee945b5cdc252146eb6cb2ad747",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.0.0-alpha-1/PathWeaver-2024.0.0-alpha-1-linuxarm64.jar",
        sha256 = "b18678038f0023083aa290a923add560ab3d976ba3a8640ed5c76485494b4f2f",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.0.0-alpha-1/PathWeaver-2024.0.0-alpha-1-linuxx64.jar",
        sha256 = "2a4d9506a2af60b4520796092edb4c19deef3a4854a6e3d01c2d6c330b30fc60",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.0.0-alpha-1/PathWeaver-2024.0.0-alpha-1-macx64.jar",
        sha256 = "72a3af89772a5f81eb3e4599b6a72e03448211230484364c7912ce2a55c0d657",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.0.0-alpha-1/PathWeaver-2024.0.0-alpha-1-winx64.jar",
        sha256 = "4ab331f5f208f642b90687168f8c216b13c84915fd12c2118470d5edbf60797f",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2024.0.0-alpha-1/RobotBuilder-2024.0.0-alpha-1.jar",
        sha256 = "46dd0a697bf90c24dd72588ff826b9f9812c29e0781e90748ca1c939f3014e57",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.0.0-alpha-1/Shuffleboard-2024.0.0-alpha-1-linuxarm32.jar",
        sha256 = "0e940a758c7e8c577117598129931e569efd30dd9e54e6515a076515dda9b5f1",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.0.0-alpha-1/Shuffleboard-2024.0.0-alpha-1-linuxarm64.jar",
        sha256 = "9f07f2b853bb2bc283ae72749f9afa763b21ecfc41c9ddb21f4b230d3246416a",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.0.0-alpha-1/Shuffleboard-2024.0.0-alpha-1-linuxx64.jar",
        sha256 = "be94089d63b7c224e6519580348040e0eb817903489f06f178193d79610aa551",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.0.0-alpha-1/Shuffleboard-2024.0.0-alpha-1-macarm64.jar",
        sha256 = "7d66eea87f2d5312c8e72770d89cde86aa9c0d1c3aedbd321caadb4c8032f739",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.0.0-alpha-1/Shuffleboard-2024.0.0-alpha-1-macx64.jar",
        sha256 = "29fe53173282075ab84dc4e0152d41d1c916310a5523c90d7bf19ed331b83e07",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.0.0-alpha-1/Shuffleboard-2024.0.0-alpha-1-winx64.jar",
        sha256 = "b599a67fda5a899ed1074f7ea9c1c1736c6e438e8db7051c5ba5e0f48a408782",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.0.0-alpha-1/Glass-2024.0.0-alpha-1-linuxarm32.zip",
        sha256 = "c2d44198b4304c42f56c6fb7d9060930c20b3dcef2ab09fc79dfb564cd06acb3",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.0.0-alpha-1/Glass-2024.0.0-alpha-1-linuxarm64.zip",
        sha256 = "207cd2a34c80e195c5dca2e8a982866d81e318810b860a958e93447cabff874d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.0.0-alpha-1/Glass-2024.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "78741d1a5abba47bcb3b65bdcd27ad76329ab161fd814fd61c05efcebe6ef218",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.0.0-alpha-1/Glass-2024.0.0-alpha-1-osxuniversal.zip",
        sha256 = "f10c2b156e9e3d3706990c705c65368d0ca0a5a99a0405f3fd3aa5d3dce7dd25",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.0.0-alpha-1/Glass-2024.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "104d9e774e3c9ae3ab5995c5b5062162bb75913e45db69a48baa201d8c0340ac",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.0.0-alpha-1/OutlineViewer-2024.0.0-alpha-1-linuxarm32.zip",
        sha256 = "86247d8b7e4234596fe76e85f7ceb3cd609b6f1f0edd9c6e339bfff1d8f3fadf",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.0.0-alpha-1/OutlineViewer-2024.0.0-alpha-1-linuxarm64.zip",
        sha256 = "7da217ad6b9410de40981aa96c16b0423b22c4f78d3c8a35a9d209066e6328a7",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.0.0-alpha-1/OutlineViewer-2024.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "f6cb807950b7ee880eeff0070852fbd52ac4a97996774ac92c01a3141af95586",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.0.0-alpha-1/OutlineViewer-2024.0.0-alpha-1-osxuniversal.zip",
        sha256 = "884c0a4a6193f270a52c4dda27c2d17c171d90abcc3b9665537af35d56fd29e3",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.0.0-alpha-1/OutlineViewer-2024.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "07edfe04ac906404bcef43c64593ca639a19e38d81812e67a5179fc7a86aebfe",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.0.0-alpha-1/roboRIOTeamNumberSetter-2024.0.0-alpha-1-linuxarm32.zip",
        sha256 = "13df4d4d65b410760ce76e4ebe0dcabc677acb3a97e145c337de7a7303bf3d14",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.0.0-alpha-1/roboRIOTeamNumberSetter-2024.0.0-alpha-1-linuxarm64.zip",
        sha256 = "31cbf64c44cfdd5aa4b9f763c51f428daf7f25033fe8919f1ff9cb96c4ba054a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.0.0-alpha-1/roboRIOTeamNumberSetter-2024.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "3687b513a9ca8494783261e496bf9b3a5c970c630d696363ccef4527abba6d13",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.0.0-alpha-1/roboRIOTeamNumberSetter-2024.0.0-alpha-1-osxuniversal.zip",
        sha256 = "80e762bb268546b3c4ddbaff10c5627f9a4e3beb97ae793127b96263db3901d2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.0.0-alpha-1/roboRIOTeamNumberSetter-2024.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "1279140d9cb05a891147a28a13f8fcdc432c3130f09f4d1aa906d6d836531ec0",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.0.0-alpha-1/DataLogTool-2024.0.0-alpha-1-linuxarm32.zip",
        sha256 = "6d26bbd7f3343fedc146cefc60b32ad2e5372277cdd646e62bc6def8f7b89d2a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.0.0-alpha-1/DataLogTool-2024.0.0-alpha-1-linuxarm64.zip",
        sha256 = "4ae54dd80d06f6fbe949ab28127bfd7776dc6aeb462d63d39388dfebd08dcc31",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.0.0-alpha-1/DataLogTool-2024.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "6a108695021614e2b83d8efbad22ee5a58aec42781684b7fab77eef038cff375",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.0.0-alpha-1/DataLogTool-2024.0.0-alpha-1-osxuniversal.zip",
        sha256 = "35daee7ed2f1aafb56518dff701d55de5bf3b96a1a81bb26113abb3f24174d23",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.0.0-alpha-1/DataLogTool-2024.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "d0d3df0ba25a39293c896dab5848d7efd11a017ab7e4cb26ba5db52cad69b651",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.0.0-alpha-1/SysId-2024.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "None",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.0.0-alpha-1/SysId-2024.0.0-alpha-1-osxuniversal.zip",
        sha256 = "None",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.0.0-alpha-1/SysId-2024.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "None",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
