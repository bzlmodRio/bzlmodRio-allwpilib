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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.1/wpiutil-cpp-2023.4.1-headers.zip",
        sha256 = "0406067e783586f2d943afdc0376276a747cf68262d71d8c5174391c6b209155",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.1/wpiutil-cpp-2023.4.1-sources.zip",
        sha256 = "3f5c473a7a0aea6bed54c2cd72a5115b0697dee17d5e64b9851dc0d7a8f90f32",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.1/wpiutil-cpp-2023.4.1-linuxarm32.zip",
        sha256 = "d19ebf7edd0b968a98554a827aee3363f30cc8b353b43668cfad968a987bd892",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.1/wpiutil-cpp-2023.4.1-linuxarm64.zip",
        sha256 = "5450a1e9cc9c1f30ce47ab2b56bc0ff3f03907a4c8d87e24972b14b23925f123",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.1/wpiutil-cpp-2023.4.1-linuxx86-64.zip",
        sha256 = "b6a7057b701b92f872d633a53d044383317710a05ae2bd19d1178d02f1a4717b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.1/wpiutil-cpp-2023.4.1-osxuniversal.zip",
        sha256 = "fd0e4d678497504e0128acc548639919f9b38504b8bf59430a74a23019dcf3d9",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.1/wpiutil-cpp-2023.4.1-windowsx86-64.zip",
        sha256 = "e89258cc5d994b7543f7cffeed2f91a3c8e5bbc03626461823169329ee5a4023",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.1/wpiutil-cpp-2023.4.1-linuxarm32static.zip",
        sha256 = "d7b04a40c61ae1f5b5fcd7a83b4fc28464a8abb2249d8d86f87785d928fd2caa",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.1/wpiutil-cpp-2023.4.1-linuxarm64static.zip",
        sha256 = "098280836b738e6fbe84de640e25e88ada870d9d3c27f7e70ee83e1823a2b2f2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.1/wpiutil-cpp-2023.4.1-linuxx86-64static.zip",
        sha256 = "0614a3a9087ed495c98c0a95b78dd76f5a1c1e54ad5c433a2171a584913cb968",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.1/wpiutil-cpp-2023.4.1-osxuniversalstatic.zip",
        sha256 = "4410a53148764415313b2d11bc1c021cbbe1be7df8fe274b605e2875fdf28b84",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.1/wpiutil-cpp-2023.4.1-windowsx86-64static.zip",
        sha256 = "a05152767a33dd35ddebb8d6d7c725a9a525cbc5545b31fcb8452f6a74ca80b5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.1/wpiutil-cpp-2023.4.1-linuxarm32debug.zip",
        sha256 = "fa0b8186d70e562ef927f87a78dc2c0803e17bd608248226d141533ad68dad4f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.1/wpiutil-cpp-2023.4.1-linuxarm64debug.zip",
        sha256 = "03bdd6101fc7ab2ad0cd49435aa2c477196299d9ec4c4e6985c4d8d07d2d1cc5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.1/wpiutil-cpp-2023.4.1-linuxx86-64debug.zip",
        sha256 = "89a546cb52d5972d4fd32cf6f31ebb1d61fb7433c16e6c5d77da8946b99aaf73",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.1/wpiutil-cpp-2023.4.1-osxuniversaldebug.zip",
        sha256 = "f95e27fc44ad0a453f3d9cda2f6be6baa5807e666410c6e217e0f0146d9464e1",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.1/wpiutil-cpp-2023.4.1-windowsx86-64debug.zip",
        sha256 = "93b66a09c82b95ec5782e6bf408c752205f070edd63248712008aff8122ab016",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.1/wpiutil-cpp-2023.4.1-linuxarm32staticdebug.zip",
        sha256 = "ebb950398cbceb8736dcb0930a5b2d5084bfd68d6d701d647f4f2e10cd067fc3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.1/wpiutil-cpp-2023.4.1-linuxarm64staticdebug.zip",
        sha256 = "712460c1ad85f3351b7b4277f5df90511ebdd25c51bd5ffca6e8397309fb91a6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.1/wpiutil-cpp-2023.4.1-linuxx86-64staticdebug.zip",
        sha256 = "58e97c39f835ad2b02c80336da694289fe08d8f2959df88728644f240ac4ec87",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.1/wpiutil-cpp-2023.4.1-osxuniversalstaticdebug.zip",
        sha256 = "7eed2c312abfa177230ef90ff0490f56113c0c681a7354c63b81fa710d8f7846",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.1/wpiutil-cpp-2023.4.1-windowsx86-64staticdebug.zip",
        sha256 = "5955106da205b9e724ee42c49c4ee548cdbaf7a351fd988035d1be41327632d4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.1/wpiutil-cpp-2023.4.1-linuxathena.zip",
        sha256 = "cb18fc898790d0d0a4d69d00cc54ddb50d084803c8e09f96509c83c9561a8e8b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.1/wpiutil-cpp-2023.4.1-linuxathenastatic.zip",
        sha256 = "2833eedb33b9a6de0bcd5bf29166d7463fd0aae18ee187854ea4ab87a159be51",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.1/wpiutil-cpp-2023.4.1-linuxathenadebug.zip",
        sha256 = "76bef0b03e68b0a87605fd8ef3c424ad906051c4b1ac87896e807f5b2eca7351",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.1/wpiutil-cpp-2023.4.1-linuxathenastaticdebug.zip",
        sha256 = "59285d7cb03b4166d27852206d7526dc6a324d64916355b231903dcec21a5a74",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.1/wpinet-cpp-2023.4.1-headers.zip",
        sha256 = "47ae9bb20b723f0e153fccf8032e13d9cb689005a3dc1878600647228eca37f5",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.1/wpinet-cpp-2023.4.1-sources.zip",
        sha256 = "9b1e5d3b4ae5b406d80da9315341b3107d75d64bf250f1ce545bcad529578175",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.1/wpinet-cpp-2023.4.1-linuxarm32.zip",
        sha256 = "7796552a5cddc0a932a8c577ede1bc21e4343db50053f508b4a9a1510e5e8e86",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.1/wpinet-cpp-2023.4.1-linuxarm64.zip",
        sha256 = "53d1b7bb72aabba8a8e0d9072e4eae10c362615dcd60acceee9ee8fbe3a2a5bf",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.1/wpinet-cpp-2023.4.1-linuxx86-64.zip",
        sha256 = "eaee5206017dfb7a3fa02b18d700b538522c3c2db933b2520ed9b6767c3a6343",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.1/wpinet-cpp-2023.4.1-osxuniversal.zip",
        sha256 = "eaec677a193a6cad3b915c738d9a50eb01621f45c57ae75b8a38d13d4dc402da",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.1/wpinet-cpp-2023.4.1-windowsx86-64.zip",
        sha256 = "e685ffcf754df5b5a773e6a33892ee76508db79e54e5eefa62577780ef2ae2c7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.1/wpinet-cpp-2023.4.1-linuxarm32static.zip",
        sha256 = "878a0da19b5e6c953b3c7d1cbdaede2d5ea3a2b619d3ac054c52e00cefa76c50",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.1/wpinet-cpp-2023.4.1-linuxarm64static.zip",
        sha256 = "2938d106e8e64a67d48e0c0d65fe3ad310e079a81404cc8e819b931eda6cb8d9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.1/wpinet-cpp-2023.4.1-linuxx86-64static.zip",
        sha256 = "1050434c78d86a410bcb882b17db8fd5f29dd5c343b53ea8b582399f55ef9064",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.1/wpinet-cpp-2023.4.1-osxuniversalstatic.zip",
        sha256 = "b3c39d1a3d696fea19d1b21097692a96160e36a70a1cd74b9ea4bbd82bdf9ced",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.1/wpinet-cpp-2023.4.1-windowsx86-64static.zip",
        sha256 = "69506f936ad800fa2be1f5f72e8c7edf97f0b0b9e8b8df2f3b0724c112a9536b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.1/wpinet-cpp-2023.4.1-linuxarm32debug.zip",
        sha256 = "07e8000e5e765134cf57905992c076b969ba4b9ac8b753f5595bd34aa1d7deb6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.1/wpinet-cpp-2023.4.1-linuxarm64debug.zip",
        sha256 = "69f7111740c92d07d8d2b84b52b14f6e7c4a2d3664d33f7e2696aa7d7ca882cd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.1/wpinet-cpp-2023.4.1-linuxx86-64debug.zip",
        sha256 = "c61976df1301c76ae4185000ea87882653eabe8e5113444e8f3b34eef612af67",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.1/wpinet-cpp-2023.4.1-osxuniversaldebug.zip",
        sha256 = "6a9551749918946791cf5863c37bc4a4c8550c5cde319df66b25f778a7619164",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.1/wpinet-cpp-2023.4.1-windowsx86-64debug.zip",
        sha256 = "7937f379dc40f11db0b8a6189671cd0f60706a9941298f1e08f4cdd2aab1939c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.1/wpinet-cpp-2023.4.1-linuxarm32staticdebug.zip",
        sha256 = "3e62abcaba3d84791196b9c3f381ec53e4fcfa1fd1d3086a77890c73a1b2fa2f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.1/wpinet-cpp-2023.4.1-linuxarm64staticdebug.zip",
        sha256 = "4ed4cbd14f2314b511cdc63e0265d074fdea1c1b96d9f6468ecf6bdb97a7710c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.1/wpinet-cpp-2023.4.1-linuxx86-64staticdebug.zip",
        sha256 = "6e4a72ed77b5df08d4c9ecb6de46e40bb503d38668f04957638ccc568c895712",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.1/wpinet-cpp-2023.4.1-osxuniversalstaticdebug.zip",
        sha256 = "b1f5c3798d08e5b017328b074e8f1a7e458bdfc287e9a67a9ceca6c587f1096c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.1/wpinet-cpp-2023.4.1-windowsx86-64staticdebug.zip",
        sha256 = "da16c511ff3e899f13400cbe9f593094362b1f72191c576a20efe7278b078249",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.1/wpinet-cpp-2023.4.1-linuxathena.zip",
        sha256 = "3288e131d2a584671db87309511cc83babf29eb76b67c7b1d3c642ae3c03df2e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.1/wpinet-cpp-2023.4.1-linuxathenastatic.zip",
        sha256 = "3867272e23f57df5512a227f81689a6edfdcb82450e0d1df53588a3036fe4c8b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.1/wpinet-cpp-2023.4.1-linuxathenadebug.zip",
        sha256 = "3909555b8d63d41ce4a3483603d4816bd652375a61b41e5cae0d0b777bea32ac",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.1/wpinet-cpp-2023.4.1-linuxathenastaticdebug.zip",
        sha256 = "0b98b2da01da427d155121a9c055e20977091eac7af06e8ce6dec74f0d25b075",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.1/wpimath-cpp-2023.4.1-headers.zip",
        sha256 = "02f8d8e88fe6f296828a4444bcdeeedc7c691a596dd597bf3900f56cba32bf20",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.1/wpimath-cpp-2023.4.1-sources.zip",
        sha256 = "1604f657764cbd8394944c4371cf31aac0492e9bc271ac99e146803762c78ee3",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.1/wpimath-cpp-2023.4.1-linuxarm32.zip",
        sha256 = "eddb164af24154ba8be387177a3675b31e9b267e8670a868397b25867c38dfc4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.1/wpimath-cpp-2023.4.1-linuxarm64.zip",
        sha256 = "b8565f00b927edfea48a863928454f6951b85489b5e34048f6bb1d7088895e83",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.1/wpimath-cpp-2023.4.1-linuxx86-64.zip",
        sha256 = "a913b503fc92511d76a7380db948f15f22c53a8758507af54a166382081abac2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.1/wpimath-cpp-2023.4.1-osxuniversal.zip",
        sha256 = "b3209368834493ff7533c5184b7dac8ca8d7a2311ce8b998936b5dad6cd390dd",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.1/wpimath-cpp-2023.4.1-windowsx86-64.zip",
        sha256 = "23de2228bbf3c983396ec5ba239a1a597ae880e9a365388c659458139449a307",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.1/wpimath-cpp-2023.4.1-linuxarm32static.zip",
        sha256 = "1cf885b4af06980a23118923456952c082f7a60f604b588bb4d1e78ef8a557b6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.1/wpimath-cpp-2023.4.1-linuxarm64static.zip",
        sha256 = "cea65f6ef3f0e58a826d1ab98a08a5a3b5342e98e4003f2a4d1eb951440a8473",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.1/wpimath-cpp-2023.4.1-linuxx86-64static.zip",
        sha256 = "2c2c49f7e370b7129f83054ba4e80d4b051ca041532ec289d68a49c6efe35ada",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.1/wpimath-cpp-2023.4.1-osxuniversalstatic.zip",
        sha256 = "a2194bad68ccf39515438a7713b9fdcba84182af1d40a598da9afcef646c6870",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.1/wpimath-cpp-2023.4.1-windowsx86-64static.zip",
        sha256 = "1de624e25bc6ef73c2106f5ce00dc0a5eb2c6a898a1160db0aa91b34eed55a57",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.1/wpimath-cpp-2023.4.1-linuxarm32debug.zip",
        sha256 = "6d4871d6b947232693628b666528ee452e7355bc6747241958ae2f3c6b71b6bd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.1/wpimath-cpp-2023.4.1-linuxarm64debug.zip",
        sha256 = "8b5898f017c9d685e78bc25ad8ae6cd83d4267291db8c8de595cbb342981a9ab",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.1/wpimath-cpp-2023.4.1-linuxx86-64debug.zip",
        sha256 = "a5ef733cb9cca9a84570850f56ca3a2abaef3fbc970ae93966b9c09314b8a758",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.1/wpimath-cpp-2023.4.1-osxuniversaldebug.zip",
        sha256 = "cfe45525fc6cb79fb5a48030f6dfea458bad45c062c51449048619cc6ee4fac6",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.1/wpimath-cpp-2023.4.1-windowsx86-64debug.zip",
        sha256 = "542549b8211b6a258ab44c8b7f023ed6a2da776c200c40b4afa9e1c46d25ecf5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.1/wpimath-cpp-2023.4.1-linuxarm32staticdebug.zip",
        sha256 = "8f5316c5440faeba6e50ac6b2f983f3ba2fc8724e677ee17f927d29b518f1afa",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.1/wpimath-cpp-2023.4.1-linuxarm64staticdebug.zip",
        sha256 = "3bc41a5e4971add976336391a91bde64515e3b3abb49d274693177b2a9889739",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.1/wpimath-cpp-2023.4.1-linuxx86-64staticdebug.zip",
        sha256 = "0fe96bbcd7bf48a45c8193042cf216d4587efda511cdfa1cc68ef2ade56e2027",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.1/wpimath-cpp-2023.4.1-osxuniversalstaticdebug.zip",
        sha256 = "baea2167873fe317c86044e042f3480b640144990ced4fa6b11388096ee2e7b5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.1/wpimath-cpp-2023.4.1-windowsx86-64staticdebug.zip",
        sha256 = "c275ad54f207245576193064f25819f8d8399b568eadd198c64f0d6c6234dc70",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.1/wpimath-cpp-2023.4.1-linuxathena.zip",
        sha256 = "92eca2d75773b007a4f845a11db79db922bd1856025ea8b38828e62f7ea959c1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.1/wpimath-cpp-2023.4.1-linuxathenastatic.zip",
        sha256 = "61da07c69d0f5f44c42a95c24c3c4427a32cb6070aef5b6218ec97ed443c64cc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.1/wpimath-cpp-2023.4.1-linuxathenadebug.zip",
        sha256 = "c087c57bf02bedd161187a5053e4ecf1bdf493103acc811d7222b3131b6abe7c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.1/wpimath-cpp-2023.4.1-linuxathenastaticdebug.zip",
        sha256 = "71bca8e3b3e955ac56430a6ef530023e1adc1f684ba33cc68090674fb0448280",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.1/apriltag-cpp-2023.4.1-headers.zip",
        sha256 = "585d27b152c3462e151366a7f644137d8b699bb91a0bda9dacb44679c116b596",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.1/apriltag-cpp-2023.4.1-sources.zip",
        sha256 = "33db1e92b8a6564ef1a5c7ae258357204bfe5c7dde3f8945ff6e495b8b74c215",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.1/apriltag-cpp-2023.4.1-linuxarm32.zip",
        sha256 = "b0b9289dc27baecea5b0b8e1a792170bebea4f149b339030cfe5bb6a09c830e7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.1/apriltag-cpp-2023.4.1-linuxarm64.zip",
        sha256 = "4abcb38e45a9b37f4e63151766c39f983da6012a1da5731008687715225caa48",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.1/apriltag-cpp-2023.4.1-linuxx86-64.zip",
        sha256 = "3552e02f582e95a81a5ad0e266b3bf6a08a705ca3f503b40524a6fbab616cd3a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.1/apriltag-cpp-2023.4.1-osxuniversal.zip",
        sha256 = "d86e4d1c07d0f702834e0ec169caca2a0f9043fba2a83754c521d530c46c7f94",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.1/apriltag-cpp-2023.4.1-windowsx86-64.zip",
        sha256 = "da72ac0831568639e1d24dc800224b4d48a8415101bd666b08a3716cb01e4b17",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.1/apriltag-cpp-2023.4.1-linuxarm32static.zip",
        sha256 = "2ba6a2b38b5588915fe597ed9ad6000f07c451ea54a5c9134e3e96ea61fb0c23",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.1/apriltag-cpp-2023.4.1-linuxarm64static.zip",
        sha256 = "2edb84e0df5e9e013be070b414e0621104308703d6815d9b67bad8460ee3180c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.1/apriltag-cpp-2023.4.1-linuxx86-64static.zip",
        sha256 = "01306b6dbee53ebb2610811c90f07077331680db4b1c2ff79263a90f878f4938",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.1/apriltag-cpp-2023.4.1-osxuniversalstatic.zip",
        sha256 = "d34347e02085f428e9df00e2506e6ee0e5e346e78d6eb38e5b7a4aab0bee5ef3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.1/apriltag-cpp-2023.4.1-windowsx86-64static.zip",
        sha256 = "d49d1ea66739487df29584ffb795c55e78cf40a2b0a29228c3e6e19822b8da18",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.1/apriltag-cpp-2023.4.1-linuxarm32debug.zip",
        sha256 = "2130be6c2172c18c75591d472ef0024794401cce1c90b1b3029291bf27d751c9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.1/apriltag-cpp-2023.4.1-linuxarm64debug.zip",
        sha256 = "117bfd528a8d9cdceddd395c35baa5156443d9d4c659d8c7e056f18340bac7ae",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.1/apriltag-cpp-2023.4.1-linuxx86-64debug.zip",
        sha256 = "37e279c69bd663c59f5b142935650a708066ee7341ec5f6d80c779deacf57b2d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.1/apriltag-cpp-2023.4.1-osxuniversaldebug.zip",
        sha256 = "7411791a22dae09625d20ee98b5843201dfaa0901f8823b63993982b3ce15c4b",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.1/apriltag-cpp-2023.4.1-windowsx86-64debug.zip",
        sha256 = "3c7b228610da01065329e13a21b021a0f6dce7885701b90e0627ecd4c4b017d2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.1/apriltag-cpp-2023.4.1-linuxarm32staticdebug.zip",
        sha256 = "0880c9531902af1066bf315d108b513ab6d9fa204ed07dda16271b17dfdf280c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.1/apriltag-cpp-2023.4.1-linuxarm64staticdebug.zip",
        sha256 = "3488ac7a76b4967454fe1ece5f03b3bf39335c28536784a7e3027581eb989fb4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.1/apriltag-cpp-2023.4.1-linuxx86-64staticdebug.zip",
        sha256 = "8488727792582650b0a8ca5f29397e5292b65022d631aaa6a9dc5cb43c7d6152",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.1/apriltag-cpp-2023.4.1-osxuniversalstaticdebug.zip",
        sha256 = "56a2a728b9909111738e63334916411769c4824a969b55aa922729a2e91ec286",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.1/apriltag-cpp-2023.4.1-windowsx86-64staticdebug.zip",
        sha256 = "74254bbd3ff08cf7d29590ca3db1133bbca91f33ae4ef8d3cb6a8a482486e123",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.1/apriltag-cpp-2023.4.1-linuxathena.zip",
        sha256 = "deb6ad4f374c9a934b959a3c0017168d3e970638c1ccd306136d2b041bb36349",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.1/apriltag-cpp-2023.4.1-linuxathenastatic.zip",
        sha256 = "0318b940f1a23bd5f36ec1017305247b2f210e8b5202eb75851f2f964008d4b4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.1/apriltag-cpp-2023.4.1-linuxathenadebug.zip",
        sha256 = "9ef1c11237eef7332bf25a5abb8b8e71a640be9608dc7b83101910a97295aacc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.1/apriltag-cpp-2023.4.1-linuxathenastaticdebug.zip",
        sha256 = "2a75cbec3003197422c8dede7b058ab6788e494d61dbb58baa46a5942f31d5ee",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.1/hal-cpp-2023.4.1-headers.zip",
        sha256 = "4505bb1ee585d5c9df5233468e759d7a871c6b134c536eb446f045cbb320b3e4",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.1/hal-cpp-2023.4.1-sources.zip",
        sha256 = "66aa3c4ecbe76544b3ee62012669e354ee2eef07ec2006ab50c830c29fc7422f",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.1/hal-cpp-2023.4.1-linuxarm32.zip",
        sha256 = "8489bdf9c1bd4c0b9a11ed858478bebcfda62bcbf84808465f715cf19f939c2b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.1/hal-cpp-2023.4.1-linuxarm64.zip",
        sha256 = "2714cb3931c6c3db9da6688a5704381fddbcfdedb111569abe6d35b1d70bc686",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.1/hal-cpp-2023.4.1-linuxx86-64.zip",
        sha256 = "aad300fca719300aea85798d58648aee68059182bba6d2800f9037707f29a437",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.1/hal-cpp-2023.4.1-osxuniversal.zip",
        sha256 = "947c104c88fa177827ec7f90b3dc8f7af7ddbaae47cde7ce37d9c97524deb314",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.1/hal-cpp-2023.4.1-windowsx86-64.zip",
        sha256 = "2c209e504f9a6c83863698aa697d1170b1c504452ad802fbeb6184a895acab23",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.1/hal-cpp-2023.4.1-linuxarm32static.zip",
        sha256 = "59711ef8aba3be30b6dd8565aa8a2740b06f2c6923ba75049454b265df578a44",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.1/hal-cpp-2023.4.1-linuxarm64static.zip",
        sha256 = "ba2bf7c49a1a380340b8a3a83b78a66b85557b3fc7d89439638ae8f2ae683cd0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.1/hal-cpp-2023.4.1-linuxx86-64static.zip",
        sha256 = "f53a2cb3af04ebe2859c4840f0e26633f7bcc37dd8dc66f6d2f2d6bcb12fb20b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.1/hal-cpp-2023.4.1-osxuniversalstatic.zip",
        sha256 = "eb23d88823aa6310b56a7c5ff6423725b2d99a02cbd8edf770b1eae8d39eb4d4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.1/hal-cpp-2023.4.1-windowsx86-64static.zip",
        sha256 = "be8ee23b012af88915161df556e7239924c1d978e04408cf8fccd34efaf2d11b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.1/hal-cpp-2023.4.1-linuxarm32debug.zip",
        sha256 = "a34cdfc12dc98beecfee537e75d6c203f437774ebd82d2a81abce4ff5fb5aa77",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.1/hal-cpp-2023.4.1-linuxarm64debug.zip",
        sha256 = "c123e91bfe448d0cd22ce9a6d6c77f6a3e12c17c4effeee15529c70ccbecea45",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.1/hal-cpp-2023.4.1-linuxx86-64debug.zip",
        sha256 = "4b068b9be37cb61dc1efd3495bb8b1a49ab10e35b18782f9da0e462bae877d16",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.1/hal-cpp-2023.4.1-osxuniversaldebug.zip",
        sha256 = "b488087a20ae3a5e26ab8ce60485e14757b83ecef6611fcca55659253e4d3c12",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.1/hal-cpp-2023.4.1-windowsx86-64debug.zip",
        sha256 = "ea404904cbf3b242bb278ce616dcb9ce71ca0a6da74cce3d9294e61d59707906",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.1/hal-cpp-2023.4.1-linuxarm32staticdebug.zip",
        sha256 = "530b75ed6c0ce3d75c5499e8eab2d9bea73ca2816a518d2ee3085672a44bc01f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.1/hal-cpp-2023.4.1-linuxarm64staticdebug.zip",
        sha256 = "241fbe7881cd833a5d6e8e0bbc00d0e997b7f4af1f9a601e56526611bcded2a0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.1/hal-cpp-2023.4.1-linuxx86-64staticdebug.zip",
        sha256 = "3ae2e021bf086417bfd8040845832c78b4eeebfec787f7f9959245373402107f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.1/hal-cpp-2023.4.1-osxuniversalstaticdebug.zip",
        sha256 = "c93c711673f9ca109e334bc6ee6fc5fcf8d78203829bedce4e8731aa854c6495",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.1/hal-cpp-2023.4.1-windowsx86-64staticdebug.zip",
        sha256 = "ed098039ddc3fd6cb945f685f664a45a5bf7902c86097de1c974a35ed88be0be",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.1/hal-cpp-2023.4.1-linuxathena.zip",
        sha256 = "21deb2fd326b23660c18b97ce734603fad485f6e017c443ec2be0d55fd53b9d1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.1/hal-cpp-2023.4.1-linuxathenastatic.zip",
        sha256 = "64968305b03b35042cae7bfe85926b3b1971353643ec748bba8a2623c3776eda",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.1/hal-cpp-2023.4.1-linuxathenadebug.zip",
        sha256 = "bb634279c7da2fbc5be6639b46e8b062f22cb0d5f49a8e6e004031f6e0387685",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.1/hal-cpp-2023.4.1-linuxathenastaticdebug.zip",
        sha256 = "8807604b294e6e2809e555cd172655b716baa91d545356a19cbe67d7d30325af",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.1/ntcore-cpp-2023.4.1-headers.zip",
        sha256 = "14357dd3f3d70a66febb2c4b661834986f26217109e6ff394efc9fd94c0c0fee",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.1/ntcore-cpp-2023.4.1-sources.zip",
        sha256 = "0b3abc705a2386e67d4b2f7c78297b0ef2f6ff466f0ab67333f4129ec27bc4db",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.1/ntcore-cpp-2023.4.1-linuxarm32.zip",
        sha256 = "ce262a87d99fc80d52118c2e67e1c018efeba32876289eec53b8e22a46b9feb7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.1/ntcore-cpp-2023.4.1-linuxarm64.zip",
        sha256 = "7ad9f94166946422314143406449401aa4bf893a4844d8e619f72e3b6f691ce0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.1/ntcore-cpp-2023.4.1-linuxx86-64.zip",
        sha256 = "c1d18c4d58a818f974cb8877851eafb964577b5adafb8fcd10071a57613fe0e0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.1/ntcore-cpp-2023.4.1-osxuniversal.zip",
        sha256 = "71137a7e8056d80e10b472ef6102a7ce234dad15ce309c3ce5f2da51bdf264cb",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.1/ntcore-cpp-2023.4.1-windowsx86-64.zip",
        sha256 = "6f6f002d994320319b463cc2d4d365db7ba7a6fc2422987146859d04fba10bf6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.1/ntcore-cpp-2023.4.1-linuxarm32static.zip",
        sha256 = "2f893bb976a3be178b9caac3be495c930d70a428082d807a9086cf74a3bf4808",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.1/ntcore-cpp-2023.4.1-linuxarm64static.zip",
        sha256 = "d365e2ee9a449bef334ad9efcb6d881850d0416138bb9518e3d0f067003c2efc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.1/ntcore-cpp-2023.4.1-linuxx86-64static.zip",
        sha256 = "9728733ba91276b76f74b9095936f11af90b5a21719ab8ba892fae76b0c6e049",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.1/ntcore-cpp-2023.4.1-osxuniversalstatic.zip",
        sha256 = "e68f94baedf23c1455d031a080319bdc21d232a3e1c22537b12c2daca7a24a2a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.1/ntcore-cpp-2023.4.1-windowsx86-64static.zip",
        sha256 = "159c5dc9e5485de84fc312457597befd4c0db55ed200076dca3e961fba66d0fb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.1/ntcore-cpp-2023.4.1-linuxarm32debug.zip",
        sha256 = "16330264003e3f13d34f192012886971c116699c48ecb0924ecb43eafd6b5dd4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.1/ntcore-cpp-2023.4.1-linuxarm64debug.zip",
        sha256 = "99ce03b27921dadde4a299e021ee448575769228e2dbd815cb17ec1689a2c81d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.1/ntcore-cpp-2023.4.1-linuxx86-64debug.zip",
        sha256 = "358a2d6cd09f670f68ab1e81e58c24c33fdf9612b4e927c6ba9d07b128d406fc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.1/ntcore-cpp-2023.4.1-osxuniversaldebug.zip",
        sha256 = "22f0f6f978a9d1424c3469f8417f81df9a8702fc6f9029591ef7eb70571fb916",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.1/ntcore-cpp-2023.4.1-windowsx86-64debug.zip",
        sha256 = "64f4b14572215dfb0fdfef3dc9eb56d4e55c5b3c1f2836cb974ec3fab4858589",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.1/ntcore-cpp-2023.4.1-linuxarm32staticdebug.zip",
        sha256 = "268c28cee9ba58a848893ee380fbeb4e25836e4b51f75d5dcd29ddef27708a9c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.1/ntcore-cpp-2023.4.1-linuxarm64staticdebug.zip",
        sha256 = "a7106112bbf20defe4b289b207eb216ecdc73f305c1b9f662d3451a97076cd65",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.1/ntcore-cpp-2023.4.1-linuxx86-64staticdebug.zip",
        sha256 = "6b6a385363014cfc511340d2ce7c0c2e05649b81ea4fd58a0215efb603a121d2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.1/ntcore-cpp-2023.4.1-osxuniversalstaticdebug.zip",
        sha256 = "8301ec9894ef3f0eb9a8138c745b88a6890c26098a3695176b9b4d2691dc4b08",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.1/ntcore-cpp-2023.4.1-windowsx86-64staticdebug.zip",
        sha256 = "a03f6937abf0ad4e72af0216d823e4ac33904df36973a3be88c47759ce19748f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.1/ntcore-cpp-2023.4.1-linuxathena.zip",
        sha256 = "d44b72133c4eea9b29b41ead861e3b344449bbe3e87ebc13c4d4360e2f182560",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.1/ntcore-cpp-2023.4.1-linuxathenastatic.zip",
        sha256 = "92ce8731986aa23e259f76a0744d92a4ee2ca626e38f2479230fe3037515df5e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.1/ntcore-cpp-2023.4.1-linuxathenadebug.zip",
        sha256 = "986e4e68290cdd501b07f7e5b6640a0c1e8da325b1dc87f7dd98fbfde20349d9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.1/ntcore-cpp-2023.4.1-linuxathenastaticdebug.zip",
        sha256 = "83003be3c6d6b78540d7065dc20b969cbb901584dc29f504bb2a736fee2f0e2d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.1/cscore-cpp-2023.4.1-headers.zip",
        sha256 = "bbd8c2cb94049992693faf24dae34dab7d83b1a1b3e08228e991dc0f9237b25b",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.1/cscore-cpp-2023.4.1-sources.zip",
        sha256 = "6440c46c481fbeab2e31d640333a60a2d858418214ecbad6d896ea66091fe605",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.1/cscore-cpp-2023.4.1-linuxarm32.zip",
        sha256 = "ea4ef50e57a1d6f8b0ba7a65f297c3e0ab22e2a0047813cde8d01ea2a6d8cde7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.1/cscore-cpp-2023.4.1-linuxarm64.zip",
        sha256 = "27a7df5409eaa8499d555feaf6b43f0ee1446b02b24e66997d3e2479198cf8fb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.1/cscore-cpp-2023.4.1-linuxx86-64.zip",
        sha256 = "667ce95792b8df0165ee8765ad792f33d79943ad4816c82b56df17a0ee9f15cf",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.1/cscore-cpp-2023.4.1-osxuniversal.zip",
        sha256 = "fbea1c1714a10b3c8506254fe18829829402880b156877003e79b3396d91a50c",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.1/cscore-cpp-2023.4.1-windowsx86-64.zip",
        sha256 = "3d39b4a826178ca6f311d9faea0831707818b92bd76c46fd4874eb089d8b3bae",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.1/cscore-cpp-2023.4.1-linuxarm32static.zip",
        sha256 = "29d9a8f679152c8c924a5467aca9bdb789a78a9a85dcac54531ea0f95458d0d4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.1/cscore-cpp-2023.4.1-linuxarm64static.zip",
        sha256 = "d2934d30d4565162cf647ed2c59001172bd933eea746d95095e6fdfa4196bc96",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.1/cscore-cpp-2023.4.1-linuxx86-64static.zip",
        sha256 = "a59ebc33a4b8f77514d8685088036d11e6bd31077997f3980915f3847d516d97",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.1/cscore-cpp-2023.4.1-osxuniversalstatic.zip",
        sha256 = "3efbe7a0b0455e4ad1b76a18ab0871ef2d190799c41478932b65fe56483f7fa7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.1/cscore-cpp-2023.4.1-windowsx86-64static.zip",
        sha256 = "71dd63cc81dbb72d2ac0f50f437b38d0ea59a07309682a2c5fd14ab1bbaddae3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.1/cscore-cpp-2023.4.1-linuxarm32debug.zip",
        sha256 = "2ac1d5b70ead672d7b9385cd04a4bbf74eb17e9e29681a5b549caf3d3bbe250a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.1/cscore-cpp-2023.4.1-linuxarm64debug.zip",
        sha256 = "b8c122798e6fbb0b71a679c31b75a4dabd095783e2500784cb78a57c79d8eab4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.1/cscore-cpp-2023.4.1-linuxx86-64debug.zip",
        sha256 = "e7853eb26a36b8d78a88dbbd8382a042ce90c2f06969606728e9bd0887f8b299",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.1/cscore-cpp-2023.4.1-osxuniversaldebug.zip",
        sha256 = "1453061c70309448144decfb243bc32668410914578c69c1db78deb6c419a837",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.1/cscore-cpp-2023.4.1-windowsx86-64debug.zip",
        sha256 = "8d1a070f50421a412a2dd03a80e6193b3090002662731a34ed1d6ca41645f066",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.1/cscore-cpp-2023.4.1-linuxarm32staticdebug.zip",
        sha256 = "1f038df302b838b488580336ab70c87249fb1704ceaaa98f6d4d5c0f3e306659",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.1/cscore-cpp-2023.4.1-linuxarm64staticdebug.zip",
        sha256 = "444a65df87408edaec189b336e54b8eb7898dc292139e3b231efe57d464aae62",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.1/cscore-cpp-2023.4.1-linuxx86-64staticdebug.zip",
        sha256 = "5a569dad3e5b2ceefc5eafef050bd21866a5ecc48b628f36822793618b6f361f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.1/cscore-cpp-2023.4.1-osxuniversalstaticdebug.zip",
        sha256 = "05cb7520008a185abcdd2f4ad63c4d9ce44a2cf9aa3cc8e163464bc81caa9f77",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.1/cscore-cpp-2023.4.1-windowsx86-64staticdebug.zip",
        sha256 = "cddaf6674ae46108bac69f3eb3a1ca54b1f75f2d05610ea6a58db0cd462b27af",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.1/cscore-cpp-2023.4.1-linuxathena.zip",
        sha256 = "b7f3d8df6908b0c6657b98e6948f8d216a459133349f49aab471314ce9440f37",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.1/cscore-cpp-2023.4.1-linuxathenastatic.zip",
        sha256 = "7a8c68d6d64e34dc1f548ecca2d33c6dda6d654291bb541ca99d14611f6bda0e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.1/cscore-cpp-2023.4.1-linuxathenadebug.zip",
        sha256 = "ec7556947dfe0897b435404f8630e1b7600a111d9c694f18e7ea20e6898f464c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.1/cscore-cpp-2023.4.1-linuxathenastaticdebug.zip",
        sha256 = "f39cc5b718ac8be0ef296ef6c580786abd1f34fd10505e669f0ea450c7ae2d97",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.1/cameraserver-cpp-2023.4.1-headers.zip",
        sha256 = "5edfe07b90594730e04618b4018378b20c91959bed18dcf1b1d45fcdbb946bbe",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.1/cameraserver-cpp-2023.4.1-sources.zip",
        sha256 = "6c7231fcb0cc8e272150901c8580821acd79069e15dfb29831c7deb8edb3bb56",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.1/cameraserver-cpp-2023.4.1-linuxarm32.zip",
        sha256 = "2589891c318612b166907fb4684bfdfc83370db06829b106b370b108bb45c1a7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.1/cameraserver-cpp-2023.4.1-linuxarm64.zip",
        sha256 = "66e4194ca6a5f09d6beade1a20b4ddd293b9f3b4187cb4cd290b51d664c709df",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.1/cameraserver-cpp-2023.4.1-linuxx86-64.zip",
        sha256 = "972c83cc7ffe710708b88157fe688282aa62f376bdbaba4ede1ddb93dca0ec6a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.1/cameraserver-cpp-2023.4.1-osxuniversal.zip",
        sha256 = "490a56c797bb9a4d6d6ec29cebabfe317e1ce2442d94b363ae55fc1ff072e4bf",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.1/cameraserver-cpp-2023.4.1-windowsx86-64.zip",
        sha256 = "f1d2895170b7cfab08b75f07fea1d7a1b2abe6d46b9089b101803b05dcb19d98",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.1/cameraserver-cpp-2023.4.1-linuxarm32static.zip",
        sha256 = "a95ad3146038ad0aec6b589fa54b35caa242aa7ff29952ee3a0a95b518fa913a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.1/cameraserver-cpp-2023.4.1-linuxarm64static.zip",
        sha256 = "95a73e9c9cb8523136869929d5530e8f0236a0b4c9d82b6d1c9dcdabf80aac81",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.1/cameraserver-cpp-2023.4.1-linuxx86-64static.zip",
        sha256 = "9cc1d5f548ae20780374e2b787363ba6d3f79dee4bef45a9934b80e67e86b9c9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.1/cameraserver-cpp-2023.4.1-osxuniversalstatic.zip",
        sha256 = "7919b200ba3ebeb78bf4680798efa8e9b506f62ccb9fcbfb90f958a0d1b6de35",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.1/cameraserver-cpp-2023.4.1-windowsx86-64static.zip",
        sha256 = "8c28f06c6ed2e01b582bdaa89768c109dc1fb11c647444c4ff8043eff7f9688b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.1/cameraserver-cpp-2023.4.1-linuxarm32debug.zip",
        sha256 = "cae4cf03389f35912dc95613f4e46878b75ee60e9043cf1656e0b6ee39b5b415",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.1/cameraserver-cpp-2023.4.1-linuxarm64debug.zip",
        sha256 = "176757e7810cc0dd599ff9b2211a00ffab9bbe6c313c6e0ffd3c22ae02b85f3e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.1/cameraserver-cpp-2023.4.1-linuxx86-64debug.zip",
        sha256 = "8f4928b65102fce09fce5cd2eb23912c9068b7c7286d8fc927ccf06303bc5af2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.1/cameraserver-cpp-2023.4.1-osxuniversaldebug.zip",
        sha256 = "917c84b5c630fd11eaa4a93e247e8240445d1bc79c4da37a9381ba8e3e2b62cf",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.1/cameraserver-cpp-2023.4.1-windowsx86-64debug.zip",
        sha256 = "fae6538fde6cc979403930da2c753378c615519aabaecfe513402b4c15640313",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.1/cameraserver-cpp-2023.4.1-linuxarm32staticdebug.zip",
        sha256 = "f188e1caaf21eeafcdf161ea9402a78c7a491ed0b620deb35f83c4500e5faac9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.1/cameraserver-cpp-2023.4.1-linuxarm64staticdebug.zip",
        sha256 = "58e4ee17e7c4356d41e2e04767005c44303007efbd15bb28655517925e6afac6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.1/cameraserver-cpp-2023.4.1-linuxx86-64staticdebug.zip",
        sha256 = "29ff50f7c53912eab69bfbb1754d5bcf59a2213e19e7ceb97d58d333f15b31a3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.1/cameraserver-cpp-2023.4.1-osxuniversalstaticdebug.zip",
        sha256 = "1796b2006cee2f544da08c36eec2b6889f43865a47d216e8df361e61474908c4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.1/cameraserver-cpp-2023.4.1-windowsx86-64staticdebug.zip",
        sha256 = "4d9ba8c587e132162ba8216de379b6d0876cb3319c6ff8171c099ac1b9742727",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.1/cameraserver-cpp-2023.4.1-linuxathena.zip",
        sha256 = "73818aff06181d600d7b60f05ae15066ff5067c6881ad4e9d33ae9dfc76dba88",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.1/cameraserver-cpp-2023.4.1-linuxathenastatic.zip",
        sha256 = "afb7a31855b1fc21931f9e42121eef51500a13980aa4f74aed7496b408fdf6ad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.1/cameraserver-cpp-2023.4.1-linuxathenadebug.zip",
        sha256 = "434b54c33b674cf1903de3fb85c0cf1cd5ee16d7744c95bf23be3051cb82529d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.1/cameraserver-cpp-2023.4.1-linuxathenastaticdebug.zip",
        sha256 = "75e0f6ae806c823ef2fbc1eae24cb3dca7b9222e55eba8f34410cb17cd2bba2d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.1/wpilibc-cpp-2023.4.1-headers.zip",
        sha256 = "cbf1ccf4756262ce10c43a134262b3b4f1d49d5ad5a2cbbe5003e04cf5d82bb3",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.1/wpilibc-cpp-2023.4.1-sources.zip",
        sha256 = "ce255bfca2cb28092c28e11f0a054f00561bae417c7848f4a255e10b163fd124",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.1/wpilibc-cpp-2023.4.1-linuxarm32.zip",
        sha256 = "8e7c23f0e6a8e74d726569e2da464cf35cab14175e4b4b0b3171a134722a853a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.1/wpilibc-cpp-2023.4.1-linuxarm64.zip",
        sha256 = "9d978f4344f585e67b0846aec05b6cfef367f2e4eb1129bd8f75b5b44e27c6a2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.1/wpilibc-cpp-2023.4.1-linuxx86-64.zip",
        sha256 = "af5b296fecb948419956babe986f70f0022cefed5c67a45ff57e0a102d5d39d2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.1/wpilibc-cpp-2023.4.1-osxuniversal.zip",
        sha256 = "dd7e508dd31d8458294839ba78fad3699e558ac3024ccd74748afbb18e4c2008",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.1/wpilibc-cpp-2023.4.1-windowsx86-64.zip",
        sha256 = "257b75c8198252499a613995e0d9629b24594202301c0b5f1726364a2b788c91",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.1/wpilibc-cpp-2023.4.1-linuxarm32static.zip",
        sha256 = "1656f631baf147cc6c57f614dff9ed5ee74815a9d5bca1f0913fee312256a881",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.1/wpilibc-cpp-2023.4.1-linuxarm64static.zip",
        sha256 = "26cb84c43b655c179a15fed243c2956d9117749b09d0e0db30a82964fd30e526",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.1/wpilibc-cpp-2023.4.1-linuxx86-64static.zip",
        sha256 = "6a865966faa7134fb33688e3ffecf93ba0b8dc47caa65b2f0addef79415ded7b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.1/wpilibc-cpp-2023.4.1-osxuniversalstatic.zip",
        sha256 = "922f6e27facc1869e2d314e43dedda3f8fed706d91110c01d3a7ec618cdd2360",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.1/wpilibc-cpp-2023.4.1-windowsx86-64static.zip",
        sha256 = "e1f56dafa1205caa1f869e1b1c7d37cf7719e94a417d0080be11a7f9777da624",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.1/wpilibc-cpp-2023.4.1-linuxarm32debug.zip",
        sha256 = "4c53b0e61bebcd6dad7f28b8758144c52dea40b651bb6ae697c1df87a3c24a2e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.1/wpilibc-cpp-2023.4.1-linuxarm64debug.zip",
        sha256 = "e9635b1d4eb7a6cbd2519e61a473e0a48253e745d44a92d0e275bf0216ef8f2a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.1/wpilibc-cpp-2023.4.1-linuxx86-64debug.zip",
        sha256 = "9e9ca57e40e9badffa94b35b24cb5b1f22b22dcb5b22f6c37f00c11eb06e8585",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.1/wpilibc-cpp-2023.4.1-osxuniversaldebug.zip",
        sha256 = "017501aebb429ac5b9b44e3b1165a9af2f5c41edf4fe7c83599fa73be98ce525",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.1/wpilibc-cpp-2023.4.1-windowsx86-64debug.zip",
        sha256 = "f8e279d9b81e3caa347ec27f7db560010b01b4b36856763c61258231f53876b0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.1/wpilibc-cpp-2023.4.1-linuxarm32staticdebug.zip",
        sha256 = "5e4f2697457c754dbce27c535b9540456c02d465973cd280b6d380609ba38244",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.1/wpilibc-cpp-2023.4.1-linuxarm64staticdebug.zip",
        sha256 = "41b3b524fcc4e2e330f835bcbfb055215080a7aa853487301e35e90f07a762ec",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.1/wpilibc-cpp-2023.4.1-linuxx86-64staticdebug.zip",
        sha256 = "28a18cfd9fc14bb15804bc87d27151606c3c3dd3cb741e3531d8068a43f66abf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.1/wpilibc-cpp-2023.4.1-osxuniversalstaticdebug.zip",
        sha256 = "8ada4ee7c39776591fc10f97c2774c9d7107fdefabeacd0b2a63c39300c174d8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.1/wpilibc-cpp-2023.4.1-windowsx86-64staticdebug.zip",
        sha256 = "8fd0952b8a5b3f95f6c6a429240229c0d7dc47e985161f51482dc13ade47d2c0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.1/wpilibc-cpp-2023.4.1-linuxathena.zip",
        sha256 = "059b168cf689d1b0fa596c760318f48bd3a39af5afc70518647dc4ca43af8aba",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.1/wpilibc-cpp-2023.4.1-linuxathenastatic.zip",
        sha256 = "dfb8e3aa52704bfc8c56b24e1feb7a8ab7eb6355efdc725930c87775428ec5af",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.1/wpilibc-cpp-2023.4.1-linuxathenadebug.zip",
        sha256 = "38f7b949e849bedfc8c5e9e1be929ff078fc52d7e76921fb19cf4d2889fa7860",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.1/wpilibc-cpp-2023.4.1-linuxathenastaticdebug.zip",
        sha256 = "818ed401f6f9e74dd28d088ccf54fe1b8f63302bf1418b7c80051edce011b001",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.1/wpilibNewCommands-cpp-2023.4.1-headers.zip",
        sha256 = "b7b7a157df62f9496fbb088be4ea15a7bef6a57ec5cd6fc4f8d9b9cfc6608728",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.1/wpilibNewCommands-cpp-2023.4.1-sources.zip",
        sha256 = "14b5acb92e000da25d447eccdaf9acfede852340c4d99e1b8d932aa3f4ff975d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.1/wpilibNewCommands-cpp-2023.4.1-linuxarm32.zip",
        sha256 = "18d46df2feeb6f0f205b26af64a33492bdcabebd23b86bdc31310a3b1c441e61",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.1/wpilibNewCommands-cpp-2023.4.1-linuxarm64.zip",
        sha256 = "e05099d85b1d0440da2391713b206e8b8b140911c322407b5a046e162437c436",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.1/wpilibNewCommands-cpp-2023.4.1-linuxx86-64.zip",
        sha256 = "5b6b0a04ae768bc7294afc153744bf6758d3dfa5d0f17c1d1ca291e6cca31d32",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.1/wpilibNewCommands-cpp-2023.4.1-osxuniversal.zip",
        sha256 = "482b79fd095de004ebd05e96c5822976c612d7cfd755905f118bd34689f4cb9e",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.1/wpilibNewCommands-cpp-2023.4.1-windowsx86-64.zip",
        sha256 = "6898384a709d96f98a558927f8fd43ceb396d58ab73defae1159aabe05d4719e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.1/wpilibNewCommands-cpp-2023.4.1-linuxarm32static.zip",
        sha256 = "1ba20ea93fe927a9ce80c389bc0e07452c521c66e3a051bde4f10d2d356c6eaf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.1/wpilibNewCommands-cpp-2023.4.1-linuxarm64static.zip",
        sha256 = "d46ce6ae1cee6a66795e80f44589c853f5bf448ed7017594c336da0c683d4887",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.1/wpilibNewCommands-cpp-2023.4.1-linuxx86-64static.zip",
        sha256 = "c1f1c6b177274f3af789740658c26396c0958da5c663ab06c8809a2baa67f282",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.1/wpilibNewCommands-cpp-2023.4.1-osxuniversalstatic.zip",
        sha256 = "090da9074c63e9d7de1f950c0216a85cdf7bed112e3e4f362f428ecc734e6fbf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.1/wpilibNewCommands-cpp-2023.4.1-windowsx86-64static.zip",
        sha256 = "c663977889e069297fb50df8bdba9ade9f102561b7cb1e426e599f4b2b58b273",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.1/wpilibNewCommands-cpp-2023.4.1-linuxarm32debug.zip",
        sha256 = "7dcaf20ff42079afcf5d28dc78e5aaf3c8f0884afed63f6528810c5552f657a2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.1/wpilibNewCommands-cpp-2023.4.1-linuxarm64debug.zip",
        sha256 = "9e5057413c6ec31208e13a661956fba1b749a32452d51b7db7cf3d7e5f4c5834",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.1/wpilibNewCommands-cpp-2023.4.1-linuxx86-64debug.zip",
        sha256 = "6dcc6c91c1b823adb8fdd242a253791e2bae4311fa96e596d6f78fe2543a9df5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.1/wpilibNewCommands-cpp-2023.4.1-osxuniversaldebug.zip",
        sha256 = "8405f3271a0c9851e74358ec344fa9169d112824b857eaf95f3418b722d0efb9",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.1/wpilibNewCommands-cpp-2023.4.1-windowsx86-64debug.zip",
        sha256 = "b852388f4729c0eff97d9cf723e524cff1c6db5a4aa12ac09ddee10ee9a6f116",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.1/wpilibNewCommands-cpp-2023.4.1-linuxarm32staticdebug.zip",
        sha256 = "ffea8da6f5205fb9b557aef67bf3d50a3f3396ea3101dc3c35d001dda1b0b22c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.1/wpilibNewCommands-cpp-2023.4.1-linuxarm64staticdebug.zip",
        sha256 = "14469aa42afc1502e16252fdce295a702f7264df0eaff87d484962a84bd5b0d6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.1/wpilibNewCommands-cpp-2023.4.1-linuxx86-64staticdebug.zip",
        sha256 = "b38a269aab3d278c4387bc1f67a8092de4a3b2c1d1306eb3d4aeb593d754f5cc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.1/wpilibNewCommands-cpp-2023.4.1-osxuniversalstaticdebug.zip",
        sha256 = "b46bc7441d39e1747477f5edbf08c99c5e5afce78834dd7091f6437b29bf67b7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.1/wpilibNewCommands-cpp-2023.4.1-windowsx86-64staticdebug.zip",
        sha256 = "3359f89ab6976e7abfef21a8b798acb17850b0bcff65387b9ef19ce8d243093c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.1/wpilibNewCommands-cpp-2023.4.1-linuxathena.zip",
        sha256 = "ce822a58728b07d478e96f90118794d9e77a71d224f4dcf66a2d13382b63acd0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.1/wpilibNewCommands-cpp-2023.4.1-linuxathenastatic.zip",
        sha256 = "c2de6808d9b2f9ec5fe5c32a9f518a5ea8bf0ec6033a4ec06bb1be4b29622539",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.1/wpilibNewCommands-cpp-2023.4.1-linuxathenadebug.zip",
        sha256 = "39bb2a7211c7e3bda413a55dec815e935a95d73c8860a3984115468df01dde50",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.1/wpilibNewCommands-cpp-2023.4.1-linuxathenastaticdebug.zip",
        sha256 = "d47a8fa0cdef14fdf0d1c85d7a14fe561d52360a5ca1555eab08150e303252ac",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.1/halsim_ds_socket-2023.4.1-sources.zip",
        sha256 = "198e70817510a1a4673ae4cfcbef12d741777e4f87cd7313a8685ff7ce7a0bb4",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.1/halsim_ds_socket-2023.4.1-linuxarm32.zip",
        sha256 = "f63e939f8709c3b8217e4aabba5200186ec43932f17397561e9a21ab8d7856a6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.1/halsim_ds_socket-2023.4.1-linuxarm64.zip",
        sha256 = "98453fa44f489fad8349c390d0d9ba6aa1c81ecfb40f3fe807b2d61b192f7b8a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.1/halsim_ds_socket-2023.4.1-linuxx86-64.zip",
        sha256 = "eb4793a5ae2a266b65a40704e8287193901828cbf724adbcdaceb6d75cf681ce",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.1/halsim_ds_socket-2023.4.1-osxuniversal.zip",
        sha256 = "21a2c94eca74a1ecf9bce011c14c5cf163a2e5a59e30a568a3bb39d2624246fa",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.1/halsim_ds_socket-2023.4.1-windowsx86-64.zip",
        sha256 = "c56fa032fe42ac796b7c6653d81b3f812a51de74b2d5cb44ac1a70e34757385a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.1/halsim_ds_socket-2023.4.1-linuxarm32static.zip",
        sha256 = "ab19f3ec70254787067853ded17a734c7af9ace421502a3caa0172d4074e749c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.1/halsim_ds_socket-2023.4.1-linuxarm64static.zip",
        sha256 = "e9d8a68d1f0ffddc5744f3e4023f0257584d48137d295c03b32739490fda642d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.1/halsim_ds_socket-2023.4.1-linuxx86-64static.zip",
        sha256 = "a791cf53300a80583d9486f074643df659d0590a99b0cf60864272a52e457320",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.1/halsim_ds_socket-2023.4.1-osxuniversalstatic.zip",
        sha256 = "769976180b1606c842cb9d24cfc775d95279caed023d12b02134502fc84c3b1f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.1/halsim_ds_socket-2023.4.1-windowsx86-64static.zip",
        sha256 = "f4d9d5103c6b1d7f013a7b3b4417e454bf008f797503a81b212ded755edb2340",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.1/halsim_ds_socket-2023.4.1-linuxarm32debug.zip",
        sha256 = "8d1de70163bd5bcf8253bbb9af6dc27bdb4f720ab4065db8931e8238a0fd29df",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.1/halsim_ds_socket-2023.4.1-linuxarm64debug.zip",
        sha256 = "cea23ada47d140c4b0ed84813eae8d3b1a0d6879b5ce9eedd03c495b407d63e9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.1/halsim_ds_socket-2023.4.1-linuxx86-64debug.zip",
        sha256 = "7237ae4badf8cf8334a6be89c89926b37591511742a3e20965957ac75b416d88",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.1/halsim_ds_socket-2023.4.1-osxuniversaldebug.zip",
        sha256 = "e7b01161b74c24da81a5d03a130aade70953a59f4738f02301b9d74433d6e8e2",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.1/halsim_ds_socket-2023.4.1-windowsx86-64debug.zip",
        sha256 = "6c4b15c14609576ad3cecccfe03b791116602067752f998c1c34cee97f16240a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.1/halsim_ds_socket-2023.4.1-linuxarm32staticdebug.zip",
        sha256 = "4f3ac860b65e3b081da03520afb000b33ac8b4b824a0166ea32b8e59bee2e679",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.1/halsim_ds_socket-2023.4.1-linuxarm64staticdebug.zip",
        sha256 = "2527d33b5a4eade65bfe27a3dae435a6b1b817af430570842a132120b6ebfef9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.1/halsim_ds_socket-2023.4.1-linuxx86-64staticdebug.zip",
        sha256 = "17a21698f064099cb9ab3332ddc15b92bf399fab632aaa11192ac6317d8a5083",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.1/halsim_ds_socket-2023.4.1-osxuniversalstaticdebug.zip",
        sha256 = "adf037a419ee817f069d1727dd7ec9cce75a450ff1bd8d44ffbb0af185d9d229",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.1/halsim_ds_socket-2023.4.1-windowsx86-64staticdebug.zip",
        sha256 = "049594eae19f439a23d908484c42c591f95b594a2e05449f7806191316baaba3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.1/halsim_gui-2023.4.1-sources.zip",
        sha256 = "b75d4e751940fdfc62918bf0ca03ea2a6a6f857b5fac2b9afae81a5d787c7d11",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.1/halsim_gui-2023.4.1-linuxarm32.zip",
        sha256 = "588d6b6721c1ce4dfba675fae69416f4047d018497a8a4989f4bcecd78b53651",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.1/halsim_gui-2023.4.1-linuxarm64.zip",
        sha256 = "6d73224ccd55cdc28ac948a6690784d0669047745063c4545171a3cb6f573c95",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.1/halsim_gui-2023.4.1-linuxx86-64.zip",
        sha256 = "9c71281d300d80e73f639e1eb15a4d133af6458fd1359c81c4e5c465cede35f8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.1/halsim_gui-2023.4.1-osxuniversal.zip",
        sha256 = "51a061453f5505f887c812f518e4194137625d7576c4e20d10a59715d3d45e63",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.1/halsim_gui-2023.4.1-windowsx86-64.zip",
        sha256 = "41d9bd5f2ecc811eef565e767a38964a80ccb0ee089c303a7e18ae08810c3c1d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.1/halsim_gui-2023.4.1-linuxarm32static.zip",
        sha256 = "6bb5a5357b88d71810c422ab5dac92322566793bcc575acb440b181773fb4c21",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.1/halsim_gui-2023.4.1-linuxarm64static.zip",
        sha256 = "ad6838656c63e24585a5e67aada9bf6a7d87443651854e47b94120d076e00c2f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.1/halsim_gui-2023.4.1-linuxx86-64static.zip",
        sha256 = "37ad9874781cd0c2e90afb7c34fbc7359757a556912e4577a2d7e1857eae188d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.1/halsim_gui-2023.4.1-osxuniversalstatic.zip",
        sha256 = "68f00b6242fe59c3ea1c1ca0f5e8ca455241bc1ddaa9c9451788a53751473fad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.1/halsim_gui-2023.4.1-windowsx86-64static.zip",
        sha256 = "a78cf8f36410414b44e443d51cc76a6c937b1142ca5cdf8f747bbea06660335f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.1/halsim_gui-2023.4.1-linuxarm32debug.zip",
        sha256 = "723818697afe4ba8dfbb46dd4fab84ba10b46c5373a31deac003a1387384fc20",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.1/halsim_gui-2023.4.1-linuxarm64debug.zip",
        sha256 = "8e0fb8c9504c1ef1c24bee7279d8c72ec99e644f96887b50a30d3ed4b039d602",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.1/halsim_gui-2023.4.1-linuxx86-64debug.zip",
        sha256 = "c34e111545ed5eb93abffe7d0c41324d4cf3ed60fdefc66dd5d8070b718013e7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.1/halsim_gui-2023.4.1-osxuniversaldebug.zip",
        sha256 = "d5ae81acbe5db6be920920a215d133550572e6471b54490b0ce6ca634616e0b6",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.1/halsim_gui-2023.4.1-windowsx86-64debug.zip",
        sha256 = "f9275b72b271a18e125cb7261b6b2bee81f3b96ac0937393cee48afef196cd5e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.1/halsim_gui-2023.4.1-linuxarm32staticdebug.zip",
        sha256 = "84465af809284b7e92233205e581a7856c300479024224fadf8550bd9ea93842",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.1/halsim_gui-2023.4.1-linuxarm64staticdebug.zip",
        sha256 = "b03f8d1a187b56ae3dde452b0e4b457ba35bf50373b0069fa75da27b36f89efe",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.1/halsim_gui-2023.4.1-linuxx86-64staticdebug.zip",
        sha256 = "5c4147b816f5131ff6a84191ed254ba2816b67c7f5a5323738b8f1deb880eae3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.1/halsim_gui-2023.4.1-osxuniversalstaticdebug.zip",
        sha256 = "d8f462754e603a5e34b12aa5d90ec570889eca9a9890460f9e556455ed496562",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.1/halsim_gui-2023.4.1-windowsx86-64staticdebug.zip",
        sha256 = "f4517a3fa7968b803fbb6ca63a47d675ecdc79aaa8093c8a06cccb7e6c6bec1a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.1/halsim_ws_client-2023.4.1-sources.zip",
        sha256 = "1bbfec2abd39947a07c1aa15e85a8bb0d2f8fa0099a26e20aa2c157c20468896",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.1/halsim_ws_client-2023.4.1-linuxarm32.zip",
        sha256 = "8deb39e7957909ab4d45baf48f503dbe7e96e5860fef52650139670ec8fdbe14",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.1/halsim_ws_client-2023.4.1-linuxarm64.zip",
        sha256 = "40bcce649d58f7b5ed89801114201b6565174a0023a4da4585f292b3b03f3b3a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.1/halsim_ws_client-2023.4.1-linuxx86-64.zip",
        sha256 = "59dec12bfad42817422266ffd6194c994377da78f4020081bac307b169c76385",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.1/halsim_ws_client-2023.4.1-osxuniversal.zip",
        sha256 = "61b8992d650fa4882f429ac3fa3e14c230bf10adb491ec8661ac1a0dd96596e6",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.1/halsim_ws_client-2023.4.1-windowsx86-64.zip",
        sha256 = "cace0a81ebd41588aaa84be65ecd4dae815c9fda7f96aa305cd77fcde495ca35",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.1/halsim_ws_client-2023.4.1-linuxarm32static.zip",
        sha256 = "94148f6f5c638b4fb57168fcc0edf781e829229218ebc51a3d16164845882382",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.1/halsim_ws_client-2023.4.1-linuxarm64static.zip",
        sha256 = "0287acc45ec5b861112b67cc8b5a53b93ffdd8ba6c33fc289a2e400839e99266",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.1/halsim_ws_client-2023.4.1-linuxx86-64static.zip",
        sha256 = "38c409c11a9f3578cb8e2d2c39f3c652d58788e900a02abde4f5cdf3e14149fe",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.1/halsim_ws_client-2023.4.1-osxuniversalstatic.zip",
        sha256 = "25aa1cee985d9c6fdccfbdbbfc272ebfd5033032c25242023f1a38216eef0998",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.1/halsim_ws_client-2023.4.1-windowsx86-64static.zip",
        sha256 = "95fdbc31c202e48066e4523541a433887f26b609928e17c38b71d9f92b140e5e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.1/halsim_ws_client-2023.4.1-linuxarm32debug.zip",
        sha256 = "d48e5120785c89261027c1fd64118c08723ca263e6429507c7f6837858923f0a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.1/halsim_ws_client-2023.4.1-linuxarm64debug.zip",
        sha256 = "39a8c5a3d1397a8486c0a7dd16443d0916323ba83aed10540839338e4c813470",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.1/halsim_ws_client-2023.4.1-linuxx86-64debug.zip",
        sha256 = "6efe2773d65a33af2f10bd66ea2c7cffc10b3daa36c6fc7d042c058a76199274",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.1/halsim_ws_client-2023.4.1-osxuniversaldebug.zip",
        sha256 = "5d387ae8d0e40fbf198d380a0cfd66ac3df0fb46b439b5d55918dd96d32fe235",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.1/halsim_ws_client-2023.4.1-windowsx86-64debug.zip",
        sha256 = "fb7a4f7a0e3c57b4d6c4c3fb0034c8c873b53b5e270a213f2a4b9bf9dd257ab9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.1/halsim_ws_client-2023.4.1-linuxarm32staticdebug.zip",
        sha256 = "954507fd62837afc45953a13341bc58bc52fb7eca87ef6aaab630f13223b30f9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.1/halsim_ws_client-2023.4.1-linuxarm64staticdebug.zip",
        sha256 = "d16b0afde01b8c2420f0a159214153ec79796f1268311e6bb1e8db5b4df27499",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.1/halsim_ws_client-2023.4.1-linuxx86-64staticdebug.zip",
        sha256 = "e43455dc6c2e1a7dab3fd3033b2fd925f19e0d1ed86d03cde5e1027bd33fe632",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.1/halsim_ws_client-2023.4.1-osxuniversalstaticdebug.zip",
        sha256 = "d372723fbd1b9df8aa7613620ad58fa802b37aaf5883ca56c6dd89e81c854cef",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.1/halsim_ws_client-2023.4.1-windowsx86-64staticdebug.zip",
        sha256 = "81380ed3d30fb81a249624b7914d3306a8bea5cb4cbb9d30326a34f4649453ee",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.1/halsim_ws_server-2023.4.1-sources.zip",
        sha256 = "621f34a2348e82ff0bff30948a606977c0d24cf9abe83ef0533089fae21f916d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.1/halsim_ws_server-2023.4.1-linuxarm32.zip",
        sha256 = "9ab21aced2a7801054b3b926c2c7bc454bbeaff8ed5fcd22408ea9f71b1cfcf4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.1/halsim_ws_server-2023.4.1-linuxarm64.zip",
        sha256 = "8b16290a4586f8836a9f21a2a3d0b92d8c4ea107e929cd392dc8c5959543158e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.1/halsim_ws_server-2023.4.1-linuxx86-64.zip",
        sha256 = "db0de5cf2b09107cbaa9a29f5ed44047994af1fb4c717d3f913131f3ba46b6f1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.1/halsim_ws_server-2023.4.1-osxuniversal.zip",
        sha256 = "277df06812122a89bdb226ee49cec3d74473d34e96d5d7c7af56a2e2e482b709",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.1/halsim_ws_server-2023.4.1-windowsx86-64.zip",
        sha256 = "c3d236b54c2f0880ff615cad5ba0b71c421191b790926073d7d4d3a86abe967a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.1/halsim_ws_server-2023.4.1-linuxarm32static.zip",
        sha256 = "83c9ea9481b5191cef630dcab21e0291c52670c448e7fb679b163bcf855015b1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.1/halsim_ws_server-2023.4.1-linuxarm64static.zip",
        sha256 = "40703e93db557f6ae7839430837e1239c9871ed0d0db39d6bee4258a49e88612",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.1/halsim_ws_server-2023.4.1-linuxx86-64static.zip",
        sha256 = "53586ec1b2a7a2c35915c0d78eb24e9f68f752306c04ffca1708757fb6b71211",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.1/halsim_ws_server-2023.4.1-osxuniversalstatic.zip",
        sha256 = "79dbe0dd74f61f4a3956acbddf6f7310ce32c17fa19ef721c5268425b5048e54",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.1/halsim_ws_server-2023.4.1-windowsx86-64static.zip",
        sha256 = "b86a2446ba495a5d39add7d06f0ba2f589e739dc220cf5dd0f7b19d78d11fba1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.1/halsim_ws_server-2023.4.1-linuxarm32debug.zip",
        sha256 = "78ae37eec93d405af86a8dbb22020b3e0a965eb0de87e22ca69a1fdf76540f91",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.1/halsim_ws_server-2023.4.1-linuxarm64debug.zip",
        sha256 = "1fb00362192d9bc473e754ab4d9637016bbf80feb96277b328d18efc36987884",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.1/halsim_ws_server-2023.4.1-linuxx86-64debug.zip",
        sha256 = "7926edee9827a0f950cc643aff57ced48bc6a09054bb00b283b8a2cea959a21f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.1/halsim_ws_server-2023.4.1-osxuniversaldebug.zip",
        sha256 = "e9d94c2de25d31a4eb6a1934df2a91109505ada64c53715ce29ed48e1a13e163",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.1/halsim_ws_server-2023.4.1-windowsx86-64debug.zip",
        sha256 = "12975a39684a53ba16356ddf49f57f43dcbdc84d187dbc9ec0da4d6580802df5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.1/halsim_ws_server-2023.4.1-linuxarm32staticdebug.zip",
        sha256 = "45d82dde80af8a68ff6777067e430e8540ae9b8ac9522b962ecf9c7464a18c5a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.1/halsim_ws_server-2023.4.1-linuxarm64staticdebug.zip",
        sha256 = "c8a4d49308dbd5d136cb2a784d3da17ae698094e48351b628bef560506a84a89",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.1/halsim_ws_server-2023.4.1-linuxx86-64staticdebug.zip",
        sha256 = "b981b1565ba1a6cf42189644ad913146ea646e588f922ae43308dcac391f5e87",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.1/halsim_ws_server-2023.4.1-osxuniversalstaticdebug.zip",
        sha256 = "6920d5f59a2a8b2cb8b63e3418e93346d5630b8cfc292b337d50441c61b48b56",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.1/halsim_ws_server-2023.4.1-windowsx86-64staticdebug.zip",
        sha256 = "e28a71ed8f93da8326eb2effe1f91d3f014b14a26e0f64db583e589e1ab32c95",
        build_file_content = cc_library_static,
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2023.4.1/SmartDashboard-2023.4.1-linuxx64.jar",
        sha256 = "ec997453eacd08d159b979255323d9cde1c9f4d2a21f804a8c888160d8db526b",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2023.4.1/SmartDashboard-2023.4.1-macx64.jar",
        sha256 = "2aab5ec10637f22ce343e4487eb7118cbb475a95489bdb786596b91d1097b074",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2023.4.1/SmartDashboard-2023.4.1-winx64.jar",
        sha256 = "af4d690adcc00f06e97d4b4e35eb967b7792a8a55c61a5e7d0d7c08912d38d22",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.4.1/PathWeaver-2023.4.1-linuxarm32.jar",
        sha256 = "c3abadbde3cf8dd0491c48c59783365de9bb913fedde183e8647d11d2d9a31c4",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.4.1/PathWeaver-2023.4.1-linuxarm64.jar",
        sha256 = "e3d0737b09eb4f349fab23ab568ca560a8cd9c4a8d9682b04552c50d6ae98edb",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.4.1/PathWeaver-2023.4.1-linuxx64.jar",
        sha256 = "1cf5f2de6de7c4d2d26ecda89de52978a9c65f742a8bd542068031410c8f72a5",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.4.1/PathWeaver-2023.4.1-macx64.jar",
        sha256 = "c18638ce40002bdd00911334991d86d32731b522f486813ef258b1a00560cdbf",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.4.1/PathWeaver-2023.4.1-winx64.jar",
        sha256 = "f8e2548211411eabca44fdbfd91453c57a7583afdc83fc1f85d0091cae9666ea",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2023.4.1/RobotBuilder-2023.4.1.jar",
        sha256 = "830e88e62918ed8335b3b152b8e0ddde9cbc19f38ad01479d3321d375d8da467",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.4.1/Shuffleboard-2023.4.1-linuxarm32.jar",
        sha256 = "8b051cadb924f30f113a5e2af0f859a380a89b2208cefde12aa13daef22b27bb",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.4.1/Shuffleboard-2023.4.1-linuxarm64.jar",
        sha256 = "9a4845a64ef08f53295ba24bcdf408732895bf4cff53a321afcd261c484c3746",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.4.1/Shuffleboard-2023.4.1-linuxx64.jar",
        sha256 = "4e269263762e85d837f8cb7c1d09467fb60dd9f728fa38703efcd23abd6d685a",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.4.1/Shuffleboard-2023.4.1-macarm64.jar",
        sha256 = "ea980ca94ea6e8c62843aded0d52b0f3f9893c2dc554c1a40428268dceb55e96",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.4.1/Shuffleboard-2023.4.1-macx64.jar",
        sha256 = "1043ba1dda0d54fee39255884e2e4a6478548777ad1917cb50bf8209647ba5aa",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.4.1/Shuffleboard-2023.4.1-winx64.jar",
        sha256 = "037180cf8aa0737a0c68c4e8ad2206815c52209f26e896ccaf96338615b7a757",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.4.1/Glass-2023.4.1-linuxarm32.zip",
        sha256 = "d8b06aa2db31b26c10d5a72aecd594919062319d902d2be4a1d7503ab36875c0",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.4.1/Glass-2023.4.1-linuxarm64.zip",
        sha256 = "034cf76cb9dd160df80eb007a860a11300094798ec5a9ab0dc622aeac80ee27e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.4.1/Glass-2023.4.1-linuxx86-64.zip",
        sha256 = "275939f0fe906ec87ec476ec234747cddb21654dd05aa402c878121e3f9c2679",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.4.1/Glass-2023.4.1-osxuniversal.zip",
        sha256 = "01405c15f0f1dea58dd0b9488913047d1cd794a9356a227ad563fa0332d38f7c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.4.1/Glass-2023.4.1-windowsx86-64.zip",
        sha256 = "58457894a01d66899eb1fa9e2533fc88c1af561c95dc93d4b2ba3fb0ed94b52c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.4.1/OutlineViewer-2023.4.1-linuxarm32.zip",
        sha256 = "d19c3085adb7dfa204bf56938b56f830ac4a2f228adae0b009b9d614f1702f0a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.4.1/OutlineViewer-2023.4.1-linuxarm64.zip",
        sha256 = "6405ce3ef4e29a18caa203b95bb6b483405d841b52783d13246c00826d8882a0",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.4.1/OutlineViewer-2023.4.1-linuxx86-64.zip",
        sha256 = "b1339b615716221ed1217be6168c5aef410d9ab80cd922e63c173c8d8a872f65",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.4.1/OutlineViewer-2023.4.1-osxuniversal.zip",
        sha256 = "1c7e98eb058da4a2ef356ed2f64ba4e14fb7be0ef24917857c5c2adb8f093005",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.4.1/OutlineViewer-2023.4.1-windowsx86-64.zip",
        sha256 = "c6299c5a52f9359a0f2c8e478e64d458ae077bcd607d1d749bf94cf7d97a255e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.4.1/roboRIOTeamNumberSetter-2023.4.1-linuxarm32.zip",
        sha256 = "a510f4182a29db8f8f87735937fb4c4fd1e5ed50081951e3bf8004422eb27bb2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.4.1/roboRIOTeamNumberSetter-2023.4.1-linuxarm64.zip",
        sha256 = "e7675bb37973c5380e49194a27e01f8048272ca7a1edbfdc6f58ad0e3b7a1718",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.4.1/roboRIOTeamNumberSetter-2023.4.1-linuxx86-64.zip",
        sha256 = "94954bd73254f9d3d46bf88f8e95d826463fcf6e42c4532b84837c2c014b2a2d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.4.1/roboRIOTeamNumberSetter-2023.4.1-osxuniversal.zip",
        sha256 = "f40f20b6888f12710735b32d670510ec3e017e23b6a4b3ec589388c40c6db878",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.4.1/roboRIOTeamNumberSetter-2023.4.1-windowsx86-64.zip",
        sha256 = "39833e185b6a916a421c709117d1b55cc916ff07d8c947159082d032aebd2d06",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.4.1/DataLogTool-2023.4.1-linuxarm32.zip",
        sha256 = "865b8816a03a5ec7b37725dea6c90c25273a2a7c1473ded41efb483e8453348e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.4.1/DataLogTool-2023.4.1-linuxarm64.zip",
        sha256 = "c35bd5c4f1b7ea2bd181d2c39b62ab013c376cba193c1b8d48ffea23d008b67e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.4.1/DataLogTool-2023.4.1-linuxx86-64.zip",
        sha256 = "b18f0743ef88530d22d1853960669be499a6212a1511a569c2c313bdfa574f67",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.4.1/DataLogTool-2023.4.1-osxuniversal.zip",
        sha256 = "00fb238fcc2b1a57dbbf562e29deb43cdb6428fa20860c72a3073db6575fef5d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.4.1/DataLogTool-2023.4.1-windowsx86-64.zip",
        sha256 = "d259d2524734471ea20067c7f8f5d81f79f2082b0ff5361669d35a65506b939c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2023.4.1/SysId-2023.4.1-linuxx86-64.zip",
        sha256 = "20d1c6c3559670c78dae219a64e765af14f9ab4f04035ead243788b7d64a2987",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2023.4.1/SysId-2023.4.1-osxuniversal.zip",
        sha256 = "99f77c72c7f6275d90c9e36a6d85c99eec0a9e04fc85d5ca5484fba353e0d658",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2023.4.1/SysId-2023.4.1-windowsx86-64.zip",
        sha256 = "58937b33a67d42285a4def75d49be3e58c6bad740a8121efe1f4fd50d3afdcec",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
