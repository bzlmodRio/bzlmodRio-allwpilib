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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-headers.zip",
        sha256 = "0812fe53616bb35264dc29a13d3d97bb663424e5dc6c8e74189dea2e3de4973e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-sources.zip",
        sha256 = "0f1e0d995f6b6305acb0edabd455835844a13a7c78f2dada02b630da57224da9",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-linuxarm32.zip",
        sha256 = "a4f454b02afea0b8a927989a46a5bf04cf79d17e9934661bd99db2635d36db43",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-linuxarm64.zip",
        sha256 = "70263953fe56d684377e6ce5b90be3f938708bc736cdb1722c8ec97fd8d4866f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-linuxx86-64.zip",
        sha256 = "410d995c30c3778bbe73c35c7380d5445b2b344a1e08741756730ad4943b1278",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-osxuniversal.zip",
        sha256 = "3b68f10621fd6669b5daf1d27f8a1deddd0f651f8cac66746e4299ef5ea182d1",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-windowsx86-64.zip",
        sha256 = "13bf17f687a64d2f619ea8d4a161cfa27486120d8d11e42d18d64853728d8fc5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-windowsarm64.zip",
        sha256 = "fefb4cfcc23609695d609d510f677267414fcf2d5e6c3aff0d2a5953b6aa0c1d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-linuxarm32static.zip",
        sha256 = "321f3925dd85ed1771c98df106a050beb8faa693ee77442794a6c07c4d046e15",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-linuxarm64static.zip",
        sha256 = "6041bc588bcd09324044d1bff48d4f8e4cf8da61ba764ba4e1bd0e1a78d19d9b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-linuxx86-64static.zip",
        sha256 = "2384d3f2cd2244f5e3e716d2263350c56bb9de72e32e3ded77833eeeb1c0ddf7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-osxuniversalstatic.zip",
        sha256 = "da4b8a307a685e8289154849bbe6738dc449c303b918055907a5b0c54d2e9b8b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-windowsx86-64static.zip",
        sha256 = "4d5fe0ad9fbbfefda8fc3d49cc923ef6e184e2a6afe106a24d9352a6c0d1ebb6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-windowsarm64static.zip",
        sha256 = "78a00fb89f84bdd61c093795d3abf2de88ec5fe7866c2cddc8ee13f40300993c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-linuxarm32debug.zip",
        sha256 = "8bfce3e41cf644f0f2a192cf42cedb6a1625fcbfac5397a1a9cde6fdca5ce352",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-linuxarm64debug.zip",
        sha256 = "911e614380e19f7bd598127f7d77325641975642d0925c396e480eb365b3c0d3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-linuxx86-64debug.zip",
        sha256 = "a6e2da1284c96e697435884de0fa67704714c3bf925c5bd91ba296e2b4c2e76b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-osxuniversaldebug.zip",
        sha256 = "b9d93b66dfd8ae1f2cb033a777daf96e2c56db0e6e581ae560e8f70b029e5b4d",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-windowsx86-64debug.zip",
        sha256 = "5551aa49e096149cdff639073a051e1723539679a806f9c643fd69b839599c8c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-windowsarm64debug.zip",
        sha256 = "6fa986fb4fe0a95467eafc242c92458fc3ec2d5ac67c9c552e7ca57c03caacc1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-linuxarm32staticdebug.zip",
        sha256 = "40dd1d684464aad89afe74612ea3be05fd1114147787897c841aac5010b97a1a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-linuxarm64staticdebug.zip",
        sha256 = "3b51da484be37355fa5cb02fda10b2feea049cdd6232e82f71f8c5e838077283",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-linuxx86-64staticdebug.zip",
        sha256 = "e7ac8a866e4d4b3540bfd9fcd76b2185fcbb4791d7f613a8fa6eb9ac92a72ac0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-osxuniversalstaticdebug.zip",
        sha256 = "65cc58fd7c6666d7f12ef8bc2ca216896f97358b95c16666daf95a5a8384640a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-windowsx86-64staticdebug.zip",
        sha256 = "3c866e958c89143a27be1c308a8b98587f2e5415e2df40bc58b08b9ddd286522",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-windowsarm64staticdebug.zip",
        sha256 = "edadb2fd97cdf9c59ae86006be2b5d08842fef44c3168d42724c9bf49f9c5acb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-linuxathena.zip",
        sha256 = "f2809c8fb7f11e2286ed5f27083209900079c7824ba3673003ffc10f6bef987d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-linuxathenastatic.zip",
        sha256 = "29a00922462cefc5bdedc6425e3598339fce6d8abba0ed51573a1355119ed445",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-linuxathenadebug.zip",
        sha256 = "e7677495ffb247539171755b5d0a6e0040333bd865b320b6fae753da626a058f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.1/wpiutil-cpp-2024.3.1-linuxathenastaticdebug.zip",
        sha256 = "7c6d49f95aa59fb31b9bb5e8c86ce3e56a9752edea31e269a7d88c848159a5b5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-headers.zip",
        sha256 = "56aee9f2f6e8758704b83b61bc8482669be3206ddba2aadb041c19acd9760eeb",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-sources.zip",
        sha256 = "6415ba53c0b20628ba7f0c6e88352c3605817e00fd94a1ca83a9b91f784b11f8",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-linuxarm32.zip",
        sha256 = "91a4aa62fd9bdf9ba03e6b65a9d0ffcc42d16a035402652afe7ce0bdfa15d863",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-linuxarm64.zip",
        sha256 = "9e11248f82dfe07cef2be6eb94b9bc5d730f495b75318af88d1a70603eb25c09",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-linuxx86-64.zip",
        sha256 = "c53c13dacce91eaf8047eb3c15dc6e70f6df790cdf590a8c5394612b6ed0266d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-osxuniversal.zip",
        sha256 = "df341cf08fcbaa7c2eaff07f70a8d4914e5850924a34d8ae217f06ee9db1c0c2",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-windowsx86-64.zip",
        sha256 = "e9f82acde317c080b339a3cbf816b8382148ce4f15ff105ea762f027188d5992",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-windowsarm64.zip",
        sha256 = "45f92526dd792f3ef7db12e5337264979ee5623ddcdbc9696d7d90570bb2cc3b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-linuxarm32static.zip",
        sha256 = "c09b40ebba5cc6f7b4c390990722754e2efbba37f911ca3b9ba43fc30a16f763",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-linuxarm64static.zip",
        sha256 = "75be88246802f086fb66802c1c80323ff63f33305f534af2b7eb287ffa038d5d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-linuxx86-64static.zip",
        sha256 = "52d58fea63e943dc1405667640a7a20850759999857fbc6500b39de169a0921f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-osxuniversalstatic.zip",
        sha256 = "efa66978da85395c6f17482ecc6f4dd7d578e80563d66dbc435d9a4c79893742",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-windowsx86-64static.zip",
        sha256 = "9a7ea921b2ff212223d37d74a6fe970714ecf80bc6c2feb105f105e528e43393",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-windowsarm64static.zip",
        sha256 = "0e4ccb02d712f2c4cb89169da620c07aafa5ee30dcc8bbee1b82e9dd2638d798",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-linuxarm32debug.zip",
        sha256 = "d0448fe4ba73a4b456374327ca0bce1bd75a272605da700d9a4cdd7042792da3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-linuxarm64debug.zip",
        sha256 = "bb1f5190a8e7f27df58ef9303e8d36f37f94910d71505432124186eaf7737aa6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-linuxx86-64debug.zip",
        sha256 = "5fcae86e58bd076ec02b011d0c756ef968be77106bd3d448c20d7ee9b1d7888e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-osxuniversaldebug.zip",
        sha256 = "aaffbbb4cfb03918891b9c6031cc6820a62605681d39e01de7e8df88d7bea473",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-windowsx86-64debug.zip",
        sha256 = "966813e8c07d30e585489ec13f69437f641985ae8dae0231d0c68a2b01ab5ad0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-windowsarm64debug.zip",
        sha256 = "85cee53543f3fa589c84c5d4cfc1f403c8d85e405cc62100168dfdcff756082c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-linuxarm32staticdebug.zip",
        sha256 = "0a5b56ab72caa29d1dbf949385cc644dd3b81c6b5be6972d72f5a7799c9ee03b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-linuxarm64staticdebug.zip",
        sha256 = "a14870710a2cf18f6b04e8f402cced79991b1b37a8a76228b40972bf93273df8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-linuxx86-64staticdebug.zip",
        sha256 = "fd58313eed80882a5c31d3fdfd676b14430c181cf29bff40ef6ca80f312f6879",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-osxuniversalstaticdebug.zip",
        sha256 = "ba0e174c681cab5a74377c3d3fd6c47c4286d31c64fe94e2aa8b58759596cdd3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-windowsx86-64staticdebug.zip",
        sha256 = "5a47eb9d6df497b3cf13db94ef758b4485ee97275cfe2b41446258068a844509",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-windowsarm64staticdebug.zip",
        sha256 = "0deabfdd695cb109551a4c7a40a2c3956b682b61a39b0ffa2c0137f5941f5283",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-linuxathena.zip",
        sha256 = "a3b4ffaa4488f0c3c3c2cbf613862fd2709233947e1642be841ef7ccc90279e1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-linuxathenastatic.zip",
        sha256 = "482f65a3fde8c20c05f8cf244102bf2e4eeb6142b679a746ac9c8274d53e64f0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-linuxathenadebug.zip",
        sha256 = "638da0848e23dd7b187efe3a36cae55d480ccf77fbb5514b94b9aa3fc0a0d1f8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.1/wpinet-cpp-2024.3.1-linuxathenastaticdebug.zip",
        sha256 = "5e1e981183f0e340965a5a5ac61a810936589f860db1985fdbb72c5c68e8edfc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-headers.zip",
        sha256 = "9e8af8608ca020b1a91074ad5d50c434175f8be8db44e1381954e3d20ef8b53e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-sources.zip",
        sha256 = "7ee85442cfa4347140c5f4991633b3dc19f57494f4fe938493b34e961cc4788c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-linuxarm32.zip",
        sha256 = "f17465dd743752bd63220582df3de992bc769ff871b8dc2a0158bc412898ee4f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-linuxarm64.zip",
        sha256 = "4f5efd9d8b03d0ce3d47c18e2a1d9c988e63c480456d33db563054153cb49f04",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-linuxx86-64.zip",
        sha256 = "5bc634db88590a9a0487f763d4433a4fa5026d5c6b74e0d7e7183ad4f5372d84",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-osxuniversal.zip",
        sha256 = "4e6e229254aa75c937bd059ef47a46440f7d26b25531fe59350bdd679fd5212d",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-windowsx86-64.zip",
        sha256 = "b4ac6624131635a5612146c23b101d969f9f5fb95182674a84f5295eba69cade",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-windowsarm64.zip",
        sha256 = "517722868b2c59449353e22bdadb3dd063c9c7e53b3f983e022546ab921e88f0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-linuxarm32static.zip",
        sha256 = "dd3b30d1dca0bd4ffb7921e1a4e55322731ade260eaa99e4d0c520a4306a4676",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-linuxarm64static.zip",
        sha256 = "784e5ad2491e517ee4e1ba6bc1985327f650c3889bc745c0d503765e625b2a68",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-linuxx86-64static.zip",
        sha256 = "fb27bf617566e69584fc5c07a3793681cf47a65abcbd2b91a108d4d70e42e9a9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-osxuniversalstatic.zip",
        sha256 = "57dfc00b10cc2a4b3be8c39cd7c08c218a76efc974e56961970117db27b29fa7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-windowsx86-64static.zip",
        sha256 = "5a5b08a9ec5f281a5e2ee4c91a7db0ce893a563ad42b3bf9a177abad39a4cc53",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-windowsarm64static.zip",
        sha256 = "f1a3acaf4b558a52e1fcbc44fb0ab620954f74812bf35bd7ed2c7bc01848342d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-linuxarm32debug.zip",
        sha256 = "af7492c36877ca4b89f0ca2a7419f792bf7327f487ac2939d895199c83d86124",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-linuxarm64debug.zip",
        sha256 = "b5189f90c7e953b43763e338ada938e2cd12e957bbfabec276977ade0d45eca5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-linuxx86-64debug.zip",
        sha256 = "0137186ce7ee21f0903e4155d59c9020e7ff5e94166fa4e6ec54379f2ecc966e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-osxuniversaldebug.zip",
        sha256 = "e6ceeebf9ef877642489e5c3ed51676f607fab0f118f33095924a1f59647804f",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-windowsx86-64debug.zip",
        sha256 = "b6d7e765cca9a91212b0b1ee1b598e25756e6b3d1ac878723280f45955c2601b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-windowsarm64debug.zip",
        sha256 = "573d180cd42af43d3bb56fa94fff8f6ccad22531f00ec06794d680dc064d461e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-linuxarm32staticdebug.zip",
        sha256 = "dbbe5f11bb2c299feeefe437b6dab2f27ad0631ff000af5291fabf46daa8c4f3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-linuxarm64staticdebug.zip",
        sha256 = "6728eaa0cdfe8dc71855efb8fb5c3941ca8e8de362d4f655c324c49664b44db5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-linuxx86-64staticdebug.zip",
        sha256 = "c5a148fcd84e4f90f1450464af830abbac405261216f0e28ca93d8cee4ea237f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-osxuniversalstaticdebug.zip",
        sha256 = "2a73b5690c30ab8af9c9c9b06f7f18815c443abdf8e04d0bb814f57a9da9f0c5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-windowsx86-64staticdebug.zip",
        sha256 = "6c77e5fcd1aefa475100d0dcbbf9af595415cb545f5c68bc52229a9597fe6488",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-windowsarm64staticdebug.zip",
        sha256 = "d8766b5a47f43251bc6f832888378c5334ff1084c2c7c57dcfe34fe2642f2c2b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-linuxathena.zip",
        sha256 = "1459ec2d4ddb535e97479605895df084e8457d5b75ea1aa73ef732c94524829a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-linuxathenastatic.zip",
        sha256 = "f16849d9db90ffb58960cc4b8c95af67b1aaa92b09ddbacd8a78bee658c0c2c6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-linuxathenadebug.zip",
        sha256 = "a6f83cd00140139cd3032c35eaa2771f9d53981e56e9b4c13944e276ce3fb571",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.1/wpimath-cpp-2024.3.1-linuxathenastaticdebug.zip",
        sha256 = "ec9156b8a6cccdef3f12ed2de684b3fa63704a132799dac06ebb9a142b9d6c57",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-headers.zip",
        sha256 = "71ba68b63d954c3fa53d652c9ed0efa8c5f6474a1fae281cd90263f75303d606",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-sources.zip",
        sha256 = "64d9da4775b7efb57de3b2372f495519d2fc0e072958a2fe70c5bb690bd296b6",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-linuxarm32.zip",
        sha256 = "ceaf9277c68e46c96a4987a2b222e70ebf0acdd68845e73acc8cae236f9d0760",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-linuxarm64.zip",
        sha256 = "290d366a7a448962a5653b383842b2b4a5ed3e71abb295911b49600c31e866ab",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-linuxx86-64.zip",
        sha256 = "e9339fbc02357ad41394095bfbf63d743958f8aa2f63324b10ad54adf560f67b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-osxuniversal.zip",
        sha256 = "365775feb9413a3f68c9fead11853cf2a665d049812c0df5e447b648e310675c",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-windowsx86-64.zip",
        sha256 = "4d466606c7f5759f33838330a09ab10aee526bac807af394ae75fb9d5999879e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-windowsarm64.zip",
        sha256 = "ad50d1e65a539eeb131498cba1896855e0187d72c6ca93be693f459ce7d345b5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-linuxarm32static.zip",
        sha256 = "0df756c523a41f2b49a537336e2efee42e598045b84d2135f2eb0922e3c0b5b9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-linuxarm64static.zip",
        sha256 = "fa7ac64a46f9f0baddc3ac6c977a2182b994f20bd3c1441b3adef326b182c8c6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-linuxx86-64static.zip",
        sha256 = "8b15ec12835bb55370f8807fccdc80b34ae9ff5a87ab56ce96d1a1b15ace17de",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-osxuniversalstatic.zip",
        sha256 = "87c802344586d46a7a330c5e644e1f401bd5b76bd5e198b378e6cb01aba803c0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-windowsx86-64static.zip",
        sha256 = "87e0d718d25e0aac2d9c3996f3390e0c94d8002634bfdab097139c245b6ab41a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-windowsarm64static.zip",
        sha256 = "5f6f31231a0300a5d35b141d77b970308cc77c7781b23e3d3d9fb736f84f6683",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-linuxarm32debug.zip",
        sha256 = "68a76b02d37ce86d7283a44970be4f33abdad1dc60404757fdc81b2c1f72a45d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-linuxarm64debug.zip",
        sha256 = "60f438a545d38c2f6e4da6d7565e44d67e60e17febf42306d911d505ea0cc436",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-linuxx86-64debug.zip",
        sha256 = "d6c41d3cbe5b9677502ebddd9cbd8b29abee381f46b2a69d031d0fc66a83f1d7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-osxuniversaldebug.zip",
        sha256 = "ca0b4a43ec1a1d4fe6152470fbeebc37a5ad9015fb2acdb297bcc40218730570",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-windowsx86-64debug.zip",
        sha256 = "af6c8518116060a0d85208e81b863bd296197292e468018475ade1f48e043011",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-windowsarm64debug.zip",
        sha256 = "670d2ab00899f9a06ebcf3ee00a45eecc6f4e7f593eb8cd8e244ec0d6a646b32",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-linuxarm32staticdebug.zip",
        sha256 = "85347aab1651c54624217b1df001261c2f6728a2ef1f70849766bd3767a50139",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-linuxarm64staticdebug.zip",
        sha256 = "bbd173c1daedf200d524d015908a271c5985888607b046e10fb317ac6f1b83c3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-linuxx86-64staticdebug.zip",
        sha256 = "cfb00470b097feefe79847a14df3bede7fc0a102f004040a10cb04737426a35c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-osxuniversalstaticdebug.zip",
        sha256 = "c02d89e9c539cdc59cdabd9315753b2d4157ff0f0691034d708d363046955888",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-windowsx86-64staticdebug.zip",
        sha256 = "2b0592dd7de9031e1b404935ebe08c63bfbd8c2311c374007d41ec9b6ea0856b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-windowsarm64staticdebug.zip",
        sha256 = "e82f1a60497e15e74cc533fff13c3cee64bcf8c780a7b14c619535cf73d12e73",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-linuxathena.zip",
        sha256 = "1b8ed9a31698c9c8eb94340be457cf5d0507780b2d6dbeaa7e1de49d65d2301d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-linuxathenastatic.zip",
        sha256 = "05c6b416f80cc8d90d5b6f91ed013ff0ab4fbf8ad3f46ec307544a8eb7c93638",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-linuxathenadebug.zip",
        sha256 = "6f5082b6972666d691b7523ea742c696a5535a500d44bfd438b3d9ad6200f3fb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.1/apriltag-cpp-2024.3.1-linuxathenastaticdebug.zip",
        sha256 = "d683e4bdb759c4bbcd841f5586f723a912e7d6026173f38f5a1e921c35a3083e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-headers.zip",
        sha256 = "5a4a148dca7d0d12fd75a12a286117257af8290888ac4f38bb1526ab15f6b4b6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-sources.zip",
        sha256 = "884001a94a5f04647b8ba926810d8224ac8e4582c709ae251b5af251d3c3d950",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-linuxarm32.zip",
        sha256 = "15193cfd54ea21eb4562a48008c512c4652cee201d944e3729631475bb9c1f9f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-linuxarm64.zip",
        sha256 = "420052b8eb2fe9f4830e9b1ec6fcce32078f26b6d1aee911b23f3f6993e4f43b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-linuxx86-64.zip",
        sha256 = "85f70cb6113057deb324211ca2b132cd638c364ae2ff8d736e5ab26b6ce68268",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-osxuniversal.zip",
        sha256 = "7a5c38b03e4e87da5b4cb011fc3860531828274346933d838d8654464b41a136",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-windowsx86-64.zip",
        sha256 = "a97a26114be3164acf8931123f85c7c5a867361dc2d3b91c8c0e78e191812403",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-windowsarm64.zip",
        sha256 = "2386a318227345d865400c210b78672be029440f77dea622b2e9f856211517af",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-linuxarm32static.zip",
        sha256 = "62421c70adb777f09b6c90723a41acc12e9fc2106223c1f94f2d79fb4dd45d06",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-linuxarm64static.zip",
        sha256 = "4e526d1cf58c04fcc7fe7ea706de2ea45a754c929a7877f65f3272ba4fe48258",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-linuxx86-64static.zip",
        sha256 = "769b6131c8c9aab4bcf33c8718647635606c9043e1e563abc606176ea7339f81",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-osxuniversalstatic.zip",
        sha256 = "6bce9d97e111ca89d6915aec6051c4ab841fde0f06d5402ed3964e14cadde251",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-windowsx86-64static.zip",
        sha256 = "bf9c90878dc10823888f2017d9e52abfe4adebd9ddf50543d844094120daef4b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-windowsarm64static.zip",
        sha256 = "9c8e7c350c46ec3d6758bed0bbffb61969e652e4826f09f7db532ea6e9b45219",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-linuxarm32debug.zip",
        sha256 = "d184373fe214e59b85d49ec76efa58a2491feb11dd727d075843f2bf4ab7ec2b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-linuxarm64debug.zip",
        sha256 = "e3356bfde5883f386d702e15ca38a101c9345808a4717b37f8c02e65479d197e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-linuxx86-64debug.zip",
        sha256 = "7f82e99d8808cbfb609cb555d090838bee0187e8c3f18aeb8920fe269e960a26",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-osxuniversaldebug.zip",
        sha256 = "847d5bcf41104463c672a41caa5fcbebbc5d4f37c3e7c95de3e227505abdeaa9",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-windowsx86-64debug.zip",
        sha256 = "b2a8ac4fb03d830a1db78ba036ef77b113ac8d181e00fc978bf37e48acaab37c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-windowsarm64debug.zip",
        sha256 = "e20ce9aa2414a2a488db837b80ad63f9289df0d0ee27334c1138388007f9bf52",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-linuxarm32staticdebug.zip",
        sha256 = "6deeacd8eb52e33dcac82106740045b839b2b57d93265042769af1bd66ca2866",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-linuxarm64staticdebug.zip",
        sha256 = "d2ac33925b47dbf034046e5330df568ec9739af4d980bb578c73e92df5087a0c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-linuxx86-64staticdebug.zip",
        sha256 = "dbc5726b0f1e797c3d74b3a1760a4af21f66ee1d18fe3128c58134749fa0afd5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-osxuniversalstaticdebug.zip",
        sha256 = "f839f981cdf0a2ee01216baa2e904c477e657ca345aff554594214d4084593f4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-windowsx86-64staticdebug.zip",
        sha256 = "2bfd6345ff5436711653ea5af3020d8768c79768cef0e0dd3931327b95a9b42d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-windowsarm64staticdebug.zip",
        sha256 = "5a57ac160014ee001bd9075e04f1907a57a9878c0b97c25bbd4d8ebe5f8bbd03",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-linuxathena.zip",
        sha256 = "6d4fc857a6a0af0344f41e5d99f6d0d0c2a3b9b7ab93b9ded79c013f4e8311a0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-linuxathenastatic.zip",
        sha256 = "00da4888de4718d2157d770d4dff67d6b44c4df0408bc066e795db9baa222404",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-linuxathenadebug.zip",
        sha256 = "a787d607b31dd09427586f06287e1a75f7f71e0cef48608e3b2af38f76b4dfdf",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.1/hal-cpp-2024.3.1-linuxathenastaticdebug.zip",
        sha256 = "0d64ae0ea0a1201da86d470b900e7cb34f2a6b1ea72881f4208d39f0ba7d401a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-headers.zip",
        sha256 = "50507410ac317d100d7bf1b885e8f778e11c3c089387a074f38a53e091b16278",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-sources.zip",
        sha256 = "028021548bcd4727bebd7a1fccf7c6af9d12d06b6652a1b3143975c497d0697e",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-linuxarm32.zip",
        sha256 = "92d2f4377d383329ced1b92cf9e5d735304cd67c01b743b7b88a31998b37c771",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-linuxarm64.zip",
        sha256 = "1afa3b896ead0fb8488ab2874cc3e1ae362720eed73577a52f6ac9549d551c06",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-linuxx86-64.zip",
        sha256 = "8a06f6bd3bf6e8fbabfeff13d04aecf3d82a70b9552397e01a588c13687f202b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-osxuniversal.zip",
        sha256 = "442a398d97daa4f749f393a17961a890f727c36a43515e23a67217ca696ee28a",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-windowsx86-64.zip",
        sha256 = "ed4c1c9743d4c61db910db20526b664a3b2c9532d9d814aa9ec695115c597451",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-windowsarm64.zip",
        sha256 = "aade329629bc090b26c8e04c75c18970af149691cf91f96898b76578f0064d21",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-linuxarm32static.zip",
        sha256 = "8e284becb865e1958c75d0c02c71bcffc5a2e0873b09a6169711c215ec1fbb5e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-linuxarm64static.zip",
        sha256 = "d3c0b0f747a705ea7586ed004056f07769c14ab1b5d7885b84bee45b7c5bbb5d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-linuxx86-64static.zip",
        sha256 = "d60188e6fc5be16885fc3fbfac64ffd08e6bfd1440ef1f910ee7494f8ab217a8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-osxuniversalstatic.zip",
        sha256 = "3aa25acf91b5e43ee3b4c4a36bde4b0c27879db652d9c8f24faba60fe0300ee1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-windowsx86-64static.zip",
        sha256 = "eb57bc23f216164838f0abddf8f43696c6594e17cfad43ffc7d88878d9fbacd1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-windowsarm64static.zip",
        sha256 = "aa0a50fa84a7688fb26194451c1c9c26685cb393af33d59947d2a812947c5dd6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-linuxarm32debug.zip",
        sha256 = "39c578cc8edc85cba915f27e3975eea036a3839a52911eae24312f0e275aa611",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-linuxarm64debug.zip",
        sha256 = "60ba8b2c00c7ec6cd0e6cb98779be6807f0b9b55adfa075051d14ba5da142621",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-linuxx86-64debug.zip",
        sha256 = "bcc3de76609e43971f936cddd3926fc6e9408a27f7b051d344fb1d19b26bcf41",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-osxuniversaldebug.zip",
        sha256 = "c3d302dd0a26c19cc5f72a713e7e44a1563fb80c0c8499f06996f6345be94787",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-windowsx86-64debug.zip",
        sha256 = "f02d5dbe036c5f2ebf91300e2859bf2efef0e0c7ad252b19caaee7806c262b44",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-windowsarm64debug.zip",
        sha256 = "3c63f061dd17692ad655758d121007d68d4e34a2696e4e17e8dabfcdc85ae4b7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-linuxarm32staticdebug.zip",
        sha256 = "6d4224a62755cb3fbc309c24d20c88c9c8f6089596671795c0a54e26dec2d30f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-linuxarm64staticdebug.zip",
        sha256 = "64cef5a2f9cbcb222255fc44434804fee4c0a383569ee08fdf2e255e31b084f8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-linuxx86-64staticdebug.zip",
        sha256 = "bc6950c943e15cfe4bc07c37ce61b03fe99e59204a1f3b453d24bca8b0336393",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-osxuniversalstaticdebug.zip",
        sha256 = "fc50ee54bd43f801032e15b3649b1d6dd0a678e2eec735ea7a6c135535d418d3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-windowsx86-64staticdebug.zip",
        sha256 = "0d6eb2564b2b7dad17b8d4290d17765f3b301ef5c4d369583d0bc48682499a10",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-windowsarm64staticdebug.zip",
        sha256 = "7b49fc34a45594dd6a2524af626cb45ba051d9a24e596b6d6f2778f44d0f3fef",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-linuxathena.zip",
        sha256 = "3c2fbf9a128de56aa19dfdbfb46edbfa393353c63453ecb06a7e5ff7a4a55180",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-linuxathenastatic.zip",
        sha256 = "6f41ca76d16f0a18f441e664474c4ec9d3fa88f40b602fd3b380195920059d74",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-linuxathenadebug.zip",
        sha256 = "64ad97dd85e414358b336300e2c9bbe90372fd24d2388cf28eff8f028d7533ac",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.1/ntcore-cpp-2024.3.1-linuxathenastaticdebug.zip",
        sha256 = "c4bbff73d3a3926fc93ae702df31a03f5b1af25eac97ea0ed544f305d241dfbb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-headers.zip",
        sha256 = "a02c1b8563c174f1304c036b7e8ca8363d7db0a333c8a735ccede066bb0a7627",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-sources.zip",
        sha256 = "7ed5fa99f6a15ccc056563926d92f792060b1bdddf0bc2aee05c85628939f630",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-linuxarm32.zip",
        sha256 = "827d65ce5ee3660cefba3e00371ca4b42ad9933a39be0515cd4685f874843cfd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-linuxarm64.zip",
        sha256 = "0cb839d29622bbeebddd27b084e6b7aa2d399e5fa746cc6e797c48a75efcf053",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-linuxx86-64.zip",
        sha256 = "9309b5cf7622649aeb0fae67249a9fa42cb4782b1fea53721aaaed53739acb96",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-osxuniversal.zip",
        sha256 = "335329c78d16e34524b4fee362c6750e3bc00b182a3849f1c6df4850dc55bcdc",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-windowsx86-64.zip",
        sha256 = "108ef862fd82132eb71e7bee56e1a4a06d70db6485a07349b29a72552a87b66c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-windowsarm64.zip",
        sha256 = "3e9480c080018882a32689e7a82405441097735340a43e628222cd35b3740500",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-linuxarm32static.zip",
        sha256 = "27327324f6e908a59d0d5d597cc17ed1ad79ea21ef821f1abbb129e7061ee97c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-linuxarm64static.zip",
        sha256 = "572bce8af1d2a8caa37b5a06a770496d829ce82cf367c27e5ab5cb5d8b5441f2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-linuxx86-64static.zip",
        sha256 = "a82be93c9af6322f5c7a5ddb0da1de74aa6b68d85b5d811422e1c619b7efd739",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-osxuniversalstatic.zip",
        sha256 = "c30d373bc4bc3ca02a65c2d16011047a644d075f114c7b286f1dcf258372d0c2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-windowsx86-64static.zip",
        sha256 = "581565b211492ac51a0393cbd21552e68f3d2a61aba9f414e295fd6ce50931cf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-windowsarm64static.zip",
        sha256 = "bd2c1c40e1ba78ae881c24581aeca8bd615c8b85df37ff7e2869362a3df6ba2b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-linuxarm32debug.zip",
        sha256 = "7fb4ed52ae9e4a37e692dc6e8e3679d0ead0217f7cf5bf126535fddb44475484",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-linuxarm64debug.zip",
        sha256 = "7dde4b76409e0cd569f1cad60b2f9e2649d6fb4e60c203eaff9772b1b41757a1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-linuxx86-64debug.zip",
        sha256 = "20f90fb5a3477eecc1eaee5831e1400cbbd7b3900cad442e6a2c381eb02775dd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-osxuniversaldebug.zip",
        sha256 = "60709e7df176fae3c11a4602997271f0837a0a5d006990e52e6cf009f2cd57e2",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-windowsx86-64debug.zip",
        sha256 = "218b46cd1e6fa18254cd7222dfd3ced10af25999c64b6f25e4365852d95d9218",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-windowsarm64debug.zip",
        sha256 = "dce4e74fb28b19440a5f462dee4dea77636b2efe6a7755ff73a5a13c85c3be89",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-linuxarm32staticdebug.zip",
        sha256 = "5a52c36a57b4aba5a3bb50d7b79678572af971fff366eea6fc21b84d60fd8b2a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-linuxarm64staticdebug.zip",
        sha256 = "563e9c2c73b709040ce4c56f3df713fd735cb08028dd1dc00bd3171ba9941ff8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-linuxx86-64staticdebug.zip",
        sha256 = "f6b271c8d8aae417c6fd6e6cb8f654c93b5e545d563ed5a6081dd4d969b78e83",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-osxuniversalstaticdebug.zip",
        sha256 = "47378dcbfdd81a24adeac72def162a18fd7f0861c7bc69927a86021c6063a898",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-windowsx86-64staticdebug.zip",
        sha256 = "645a9ab5e625234a2732cd78859a9dffe5a5cdc3000329ff4d4bee65b122bce9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-windowsarm64staticdebug.zip",
        sha256 = "05bbc432af965559a61b0eb12ed7ee0c65ccbe2bf1743418b48c27bc01cdfd33",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-linuxathena.zip",
        sha256 = "36006c0250ddb7165e490fc31d584fe57873629e4b0e5b336ebaeb1d68a9f95c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-linuxathenastatic.zip",
        sha256 = "19e3d8e5b8b87f88d2f1ef2f084a8b278f4b2c67a22432c72920300f4fa5bc62",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-linuxathenadebug.zip",
        sha256 = "51a169594a90930a87a241742f2adb8e07b9d90e75f4190ef3966fde15ac3cf8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.1/cscore-cpp-2024.3.1-linuxathenastaticdebug.zip",
        sha256 = "426c81abc5ae9b2355c569369386b0180cda1f40648230e90d2414db5985a14f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-headers.zip",
        sha256 = "1d3f5578b42842f9ef96d83739cbc2b866075690df02a435126634258605cef7",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-sources.zip",
        sha256 = "9fce223fe233580e42436e99f46f98672f15fbdd671bd66b8e4698234f974ac0",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-linuxarm32.zip",
        sha256 = "31489177865940989bdbdef1618fd2b853661bce7ae6a71b3ad6b5795789a632",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-linuxarm64.zip",
        sha256 = "6049c3b0b1a9dee99a048424e2773ccf22669473d9ba0acdca0f151c10b8dc20",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-linuxx86-64.zip",
        sha256 = "09519b2e0706391752721189a611ec065611a96fb9bbf3b680ccee801518b203",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-osxuniversal.zip",
        sha256 = "ca8d8482b58a519774d2fefb53184eb94696b5925eadecca453f2dd449283aa0",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-windowsx86-64.zip",
        sha256 = "28e003530279b2248d69199db075068b162d4b98c3c9a64b3b7ecbcf3e05f5a6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-windowsarm64.zip",
        sha256 = "e4d36650a02e0d33ebe773aa4b87897586ca3eec0b092bd40eb499ec0b284af3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-linuxarm32static.zip",
        sha256 = "4da24b623887bdc6b2654b072f3d0731f550a89dca4d01d9684bba7432a691fa",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-linuxarm64static.zip",
        sha256 = "56c5863432614e80e0ef07d1e9737b16cb79c6bc9a72980c4f02fe5a1aca5068",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-linuxx86-64static.zip",
        sha256 = "51362a55729dbcac1dcb7aac9085457e59e0f10aade6937c1ce35fbc9b5ce7ec",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-osxuniversalstatic.zip",
        sha256 = "7ab735aff88079461799e7ed8c343bdcd5f0bfb2f2bdee9af64325572416aa78",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-windowsx86-64static.zip",
        sha256 = "64a0747d304546cfcb204de267db14b737f981f8be5862eaca2be05f295300b8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-windowsarm64static.zip",
        sha256 = "8136d2890811226d0982a387343e142b721981418ed5276ee3ef0eb0a2f77bad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-linuxarm32debug.zip",
        sha256 = "ef7b08ff0a63485d1b4750ccf69538d84b53b8b57ddd48b6f69db176914cb86b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-linuxarm64debug.zip",
        sha256 = "cd99879cfdcbc19e9c509ca37a03d0e779d1204e46188a5ad297540e3b361f60",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-linuxx86-64debug.zip",
        sha256 = "035508f8197e8e417d78210bae134109e02e1e5c28eaea4f0bc87885aa3cbe77",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-osxuniversaldebug.zip",
        sha256 = "a36822a9b71c0e52c9a7c97e6742d6b536d4046315518cece509909af05c213d",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-windowsx86-64debug.zip",
        sha256 = "070933b0c188ac649197bbf7901730c6fdd2d570a2e95ff2bd1802bde3046b86",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-windowsarm64debug.zip",
        sha256 = "b7c51a070cbdc7a6f02cacf01efe740d90d607fc5656564af84cbeacc799848f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-linuxarm32staticdebug.zip",
        sha256 = "d087da3c4846736e0e4cc1a0d2e560514a907f35510e779106699357cf835157",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-linuxarm64staticdebug.zip",
        sha256 = "a7cb0a682d733b9d318d7332e3b01b30210b8e48099c35ec0bb2f1a957fc4578",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-linuxx86-64staticdebug.zip",
        sha256 = "e81bd4a67ab7224f215bc1c63e1128009c1b9fcedceeb02e25cb402fa7770121",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-osxuniversalstaticdebug.zip",
        sha256 = "a5db33eef683e579b207e47c258ef0a40fa8b93094e545c03442f8d42f65d7ae",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-windowsx86-64staticdebug.zip",
        sha256 = "0d9938d3acf2564c5bb926a5bdf776927aad5d8de189e657cd4acc8be2a32a16",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-windowsarm64staticdebug.zip",
        sha256 = "c11344d9ce86b955f2637b8a7b7dd3bbfb48f2e1ede6c8314f09b265d3e8244a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-linuxathena.zip",
        sha256 = "033cf37a77f2ca7e3c42798fd8867ff7ba1248a13ee042b70eab53650119e220",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-linuxathenastatic.zip",
        sha256 = "6d9d1e6d87d8b08f9229c23add5c5b44aafe8b8c2a93f8eca6049891519f2f2b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-linuxathenadebug.zip",
        sha256 = "9fa54d48f88ed9419c969bb162f06a1ae329a1df8480fe154b44a6a35379e50d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.1/cameraserver-cpp-2024.3.1-linuxathenastaticdebug.zip",
        sha256 = "979ecc6ac97e514aaef4739a2b4a0cde7a99e4da09e800a15e95786550024fa1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-headers.zip",
        sha256 = "ce0f5ad108b497ae12780db244ad90ca6edcd8a2b66e8322ced5cf1df4b98d41",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-sources.zip",
        sha256 = "c369252f108b350907416721ca8dca43d4c712851911c14998df758a1aca8c0d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-linuxarm32.zip",
        sha256 = "92c8ce269f0ce68763ce57991d27bca872c5108dfc0cc892cfd3042a57e2ef14",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-linuxarm64.zip",
        sha256 = "6f75121e067acb749c12cb2369b8a533b40a4b7bc151c176fd02e7462cc7cee6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-linuxx86-64.zip",
        sha256 = "b5e74db37edfa2b05ef8db488f435c11212e7d2a742a71c2c4c408cb6c975222",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-osxuniversal.zip",
        sha256 = "588eb606740fb6aee3329a55c49b88de222523cbe3da2a604b7a681758586c77",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-windowsx86-64.zip",
        sha256 = "7a4b4041e8a9792c963c82b34b8f8996710902f9282037429bf9fa706b4e392f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-windowsarm64.zip",
        sha256 = "7395ab8e82a10f98f683e66fb8a0df249e691ee671c37c5ff991fabf22b864a3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-linuxarm32static.zip",
        sha256 = "785ca1fea6625035480a5304e6ad942ae9521d98a7b70a8c7b0135bccdce842d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-linuxarm64static.zip",
        sha256 = "52be8f60f6e70d5a29a213c305d0ebcf079b69cdfcd13ddbd739b91e05c9218e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-linuxx86-64static.zip",
        sha256 = "bfa1cccaf3e30ecc906333ccb3e0cff8ef059aa4e010b1dd984e146d364c59b2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-osxuniversalstatic.zip",
        sha256 = "fd1446201420feb6ee1ae1377939847b62dbe36bc06954ce3f8c6f70f5780582",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-windowsx86-64static.zip",
        sha256 = "0d7febe2ba04d91d31a60eca494cb833f5a90bbe339225c1b607bd8d7b5b4fc8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-windowsarm64static.zip",
        sha256 = "b9b8f07662e1191f78b26bbb8b04d0669992b5a894e895d2c3e57f82759e06c5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-linuxarm32debug.zip",
        sha256 = "7cc09ebe0e186e53300e089fe4ea98c83a915164ffc0ece629147d0cfe538b58",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-linuxarm64debug.zip",
        sha256 = "4f849402a9568b6eb6d04ee4243f59e6d17b4eae00b8a305fc983191cc2121ad",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-linuxx86-64debug.zip",
        sha256 = "84324f01716f1951a252a3756cf6cdd5d481c14ab799f38d2a35fe8fcde1705a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-osxuniversaldebug.zip",
        sha256 = "6a9e17035bb8dfd7e02385171f5422e9d967e9a92d384a991ca2c2f46ab250c0",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-windowsx86-64debug.zip",
        sha256 = "804c48a30d5e3e435225ba05360b7c9f71163a216be4c1efcad7b73b9eb53104",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-windowsarm64debug.zip",
        sha256 = "0842363211b0290e366142d3a66ab97aa30dc52baa276017fce4bc077a3445ea",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-linuxarm32staticdebug.zip",
        sha256 = "a04e20a0896da5b2514b2be6c2a67b731b433092aecab90013885b6896b2f6af",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-linuxarm64staticdebug.zip",
        sha256 = "1e564290d5010684c0fd5d72ac10952ebaf2527772d2eb7cde13759ebc3015ee",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-linuxx86-64staticdebug.zip",
        sha256 = "32b3d8e697d82625cd19e09f4da8033cbaa72dd69eadfc543d1938021dac82c3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-osxuniversalstaticdebug.zip",
        sha256 = "681463f3c10cb49dcbe1ef728f2f79314f944c0ece7111dd580795e1628de2c7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-windowsx86-64staticdebug.zip",
        sha256 = "e9c2b55f73d75086cfea9d7c2418c4a1de18bdc1d48e30bb8b7c2f89a5eeed26",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-windowsarm64staticdebug.zip",
        sha256 = "bbc4c2a7259afd16b1fc2f5fb063e5566629118fad16c27a67999cd6d2112021",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-linuxathena.zip",
        sha256 = "69587a4f77342968813fe6b56b618e8cb45d236431ebe69b273c206f9b50c48f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-linuxathenastatic.zip",
        sha256 = "bdf4b04dacfe7ac7d80bcc9722d2ce3927d4113f898165da3649c667910e2d61",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-linuxathenadebug.zip",
        sha256 = "062216643df78bfbae54081a84d59c30598f0000aefcf2ac1ceedf4271c24084",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.1/wpilibc-cpp-2024.3.1-linuxathenastaticdebug.zip",
        sha256 = "ad7b0298fb3afc717c9a7d85af0425dde250acc6c1018af46a7d7c1e880ed50a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-headers.zip",
        sha256 = "20e67909f97a41494cda720016076576b69119bc3824c48ce999ecffb2ebaba2",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-sources.zip",
        sha256 = "d74eb5d5dad5508a2f6f962b29f771f7407223902457a5e1da8fea6be9898a1c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-linuxarm32.zip",
        sha256 = "e471474947398444379df3b74cd582d5e631e0e7272a47765b8e8e16ea9634ad",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-linuxarm64.zip",
        sha256 = "45cd5a81c1ec590d816967a49f362bce49efb8e58f98c3748863abd04664ac49",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-linuxx86-64.zip",
        sha256 = "12dfc236aa1d75fb21a5c02a4db3b05e6de127dcb7e1343244822e16ea85a1f6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-osxuniversal.zip",
        sha256 = "757d14035d64f3935ca1710223a34ba8d793764c8931b228945c7e8b9348230d",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-windowsx86-64.zip",
        sha256 = "de492f852174dfac45ee70753aa7c4a4ba4fdbd1bafdfc9460998d7a010389da",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-windowsarm64.zip",
        sha256 = "d93ea78b765903907505d954d1b31de34c11f113629ce2fc95edd5e60d25472a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-linuxarm32static.zip",
        sha256 = "0a7c60c92da283b871c8266316453ae1df2f3ac95ffab388778b99fce04e5bea",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-linuxarm64static.zip",
        sha256 = "baeb1a33f312bf76826ea8db9bbbba164314c976be3e340fcdf23e821f2ff409",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-linuxx86-64static.zip",
        sha256 = "d656fa6720a1c171daedddd5c6df0410e44f1e10c2191eda40febaf1c565c418",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-osxuniversalstatic.zip",
        sha256 = "c9f0bfbfb31e09aa854caf4af6b52efec2e24fc1de681a65bf9108acc8444688",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-windowsx86-64static.zip",
        sha256 = "8ea129cc24ebdf4461654c3135a39f002d3b14e89ef29a6b88155b14ff977183",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-windowsarm64static.zip",
        sha256 = "0a96b44b1c8a87a1b517db0cb7a0bc1f57cf1169bfeee252a78b8802352bf5a8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-linuxarm32debug.zip",
        sha256 = "ca1e5eb22bc14851d8483ede034694731dfddc7719b1bd3ae7a6bdbf1bb03ee1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-linuxarm64debug.zip",
        sha256 = "978a43abe8d741a0a76f180f0aa6eace2ab9f2498f07fe8aba887d77d4a02a0c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-linuxx86-64debug.zip",
        sha256 = "0b9397278005c6f83c79c26a1013b87c018d366dae3c54a42c8e494aa4a5f668",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-osxuniversaldebug.zip",
        sha256 = "99024abaaf39f7d06051c76b7110dbdf8a550def00fc655c53e903dbb17c3d3c",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-windowsx86-64debug.zip",
        sha256 = "292bb888a0e430b822f17f2409834d83dddc258d69f695f8be8454200f751a26",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-windowsarm64debug.zip",
        sha256 = "dda435747b83c4b854a82dae6c2d15960a359930c87a919c5d3225445dbd669b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-linuxarm32staticdebug.zip",
        sha256 = "5fa817c3a2d33290e629f8812180adb97000473a6d62e0a2c1bc397473b69390",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-linuxarm64staticdebug.zip",
        sha256 = "51b0cdb9223055d33cb5db4a6c67661d15f8b982331ee1dbbdbb91338a369d6e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-linuxx86-64staticdebug.zip",
        sha256 = "34f76391809a286db7b7aa207c0bd1595a0596c577c55e4781c7aaa47942e166",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-osxuniversalstaticdebug.zip",
        sha256 = "f7bf95ddb1d40b6df35ddf20f2e1c063c3a8935f4320b67576178ba4d5f41fe7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-windowsx86-64staticdebug.zip",
        sha256 = "e122277c30374e1d77fa267c6c26aedda8242718177ad7cc704a989e7fa78be9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-windowsarm64staticdebug.zip",
        sha256 = "95b7962217ed17ff3ea00e836d75c64274abd9170e7f717564bde4f7beb5c95a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-linuxathena.zip",
        sha256 = "b27a24487b94a1455d2807ee18ee6e0c7ee768731f00cb4acb3a280e05b95203",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-linuxathenastatic.zip",
        sha256 = "853f8f73ae1d3d421048d23953780edafccf4991f527b63389dfa0c142599608",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-linuxathenadebug.zip",
        sha256 = "6ec5c472a831eb216692e65d9ba0ba1136b3ec9293118f17378f716647be2c9b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.1/wpilibNewCommands-cpp-2024.3.1-linuxathenastaticdebug.zip",
        sha256 = "8fd6f30e25cc9888b27df340107f9c19191fd8f3ec2da57fe6bf66b083ab93f4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.1/halsim_ds_socket-2024.3.1-sources.zip",
        sha256 = "9ea41aa8526b32f55765f55bab710925a44100493225974ba573182755c90302",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.1/halsim_ds_socket-2024.3.1-linuxarm32.zip",
        sha256 = "94922a7c630552c48550bbb3a6dda4a2d624cdc9e2d9f900382c9d743496c383",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.1/halsim_ds_socket-2024.3.1-linuxarm64.zip",
        sha256 = "ba718682759c5e869b3ee4e0289efc55287705fa0b21e0170ffcc3bb6b48b847",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.1/halsim_ds_socket-2024.3.1-linuxx86-64.zip",
        sha256 = "c972b22b327bd17309b587169260b09be4ea80fc52797ee76554fbf0fe38ef22",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.1/halsim_ds_socket-2024.3.1-osxuniversal.zip",
        sha256 = "104966ba815646143a15717b29ec01ce0c28e87eaefe8a6cbf36861f2dffc8f8",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.1/halsim_ds_socket-2024.3.1-windowsx86-64.zip",
        sha256 = "f06d7cfad33f3304f8b8419a4191944304a7e1072d24c8633002fb27d6bdfdbd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.1/halsim_ds_socket-2024.3.1-windowsarm64.zip",
        sha256 = "ccfc769a795f53a233a493bd77b87ded5fcabf59b5b2f59e272651aef9bf8178",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.1/halsim_ds_socket-2024.3.1-linuxarm32static.zip",
        sha256 = "9e361e9b58c00ddce316480432e3eb22ea4b221774218d8343a72b58f10b084c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.1/halsim_ds_socket-2024.3.1-linuxarm64static.zip",
        sha256 = "dce3eaf0af6735ddb5836ae2ad2f1176bc61edde6abd3dcdf4ee4023eb4b0177",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.1/halsim_ds_socket-2024.3.1-linuxx86-64static.zip",
        sha256 = "1b5f1a5d673eb0ff1242b0ddbbf2987ab20dd710ef98f674cc70edd6cab0b8f0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.1/halsim_ds_socket-2024.3.1-osxuniversalstatic.zip",
        sha256 = "045bb0e46741310de9e05ee3dcf3633da69cefd3837b21b8608c2b8b752e61cc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.1/halsim_ds_socket-2024.3.1-windowsx86-64static.zip",
        sha256 = "de5ae542ec08eef55e94b9f758c42c76228c2ac55b25e554f131b2b5a230abb5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.1/halsim_ds_socket-2024.3.1-windowsarm64static.zip",
        sha256 = "d83e085e19440a31652ae2935182641f2099ee8848664736d86bd3cb7aa506e1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.1/halsim_ds_socket-2024.3.1-linuxarm32debug.zip",
        sha256 = "9c7c3558e14f02f0a10d007d8826202b1d870f242eb2a1d67b11cda8229d7f50",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.1/halsim_ds_socket-2024.3.1-linuxarm64debug.zip",
        sha256 = "527b71afefde7c5d64c753845b598074ccf056039a80b928060dc6a3e0f89358",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.1/halsim_ds_socket-2024.3.1-linuxx86-64debug.zip",
        sha256 = "b7af18090b3fcbdf145d66f663da5193ecbd9b274257d8b4403d4459ca3f6aa1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.1/halsim_ds_socket-2024.3.1-osxuniversaldebug.zip",
        sha256 = "3378319ede544175c7fefc8338204c9d37dab4bb89197227a8d36844641fb8c8",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.1/halsim_ds_socket-2024.3.1-windowsx86-64debug.zip",
        sha256 = "55264ecbd4ceb343e7fcc199d8336885ed1394cea6054c425ee284a9b1ae46f6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.1/halsim_ds_socket-2024.3.1-windowsarm64debug.zip",
        sha256 = "3182db72f8deb117b1952e8aa860acf35bcb1380e0a84387056f9bf827c414dd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.1/halsim_ds_socket-2024.3.1-linuxarm32staticdebug.zip",
        sha256 = "50fc4e7189fbd4d5f868f515d650f6a43ca3cd74885cc6db960164b7265e7b17",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.1/halsim_ds_socket-2024.3.1-linuxarm64staticdebug.zip",
        sha256 = "cab07ae244fb684d8892a414b93e6e1bc3fcc3dd5bafdec724077e5d8a87e937",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.1/halsim_ds_socket-2024.3.1-linuxx86-64staticdebug.zip",
        sha256 = "6a9c5feb85fdf932ce118d55e9d5990bae73c38670c9aed44dddf4b904f72117",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.1/halsim_ds_socket-2024.3.1-osxuniversalstaticdebug.zip",
        sha256 = "aa9dbde4f25b9ccaff04bf85b82f4500db7f939c3b3d8236247ff568ff8a5f79",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.1/halsim_ds_socket-2024.3.1-windowsx86-64staticdebug.zip",
        sha256 = "f54122ceed9c5df39f8a730c5119929237cd289f9b27a7ae3b815725dc304a16",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.1/halsim_ds_socket-2024.3.1-windowsarm64staticdebug.zip",
        sha256 = "3bd5031d5b1e808cad0ceb5fc3277f856e0159aac940c15fd41cab6118c04ea2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.1/halsim_gui-2024.3.1-sources.zip",
        sha256 = "e84672201d7b5641cbc0bdec5062930ce123f95f17af9dd26470db5415a7faf3",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.1/halsim_gui-2024.3.1-linuxarm32.zip",
        sha256 = "ca919ea6d4ac0c651c0f4b6b872b452a6e2c3dac31028cdc187d7826ddf33cf8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.1/halsim_gui-2024.3.1-linuxarm64.zip",
        sha256 = "52709b1b1693a5763761eada26c9279a3ec1732431c131287c631704d4e14c3c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.1/halsim_gui-2024.3.1-linuxx86-64.zip",
        sha256 = "d242620d33d3b04996f48c38f423d75b9920932c54c40b1ddf9a3734e2fbc412",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.1/halsim_gui-2024.3.1-osxuniversal.zip",
        sha256 = "8cb7a11451ac856a3c954d3c934e115de26108fd242ecf7317b4c780bcbba245",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.1/halsim_gui-2024.3.1-windowsx86-64.zip",
        sha256 = "1474f5af68d7241df8025915636fca0b4844c4d8feae30fb5c167cd64cf14657",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.1/halsim_gui-2024.3.1-windowsarm64.zip",
        sha256 = "ed4d5aab34dd905585ce4f796eb73f86615d6cf4b853a8271c01c9d9e1a8c1a8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.1/halsim_gui-2024.3.1-linuxarm32static.zip",
        sha256 = "412e9cbd4c7f7161ec8c5b0cecd20bb676263e14df3d6e3e5c5649a48ec8c9ac",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.1/halsim_gui-2024.3.1-linuxarm64static.zip",
        sha256 = "50d1b2459693011b8d93f73263d2aeb1bb61cc7710aa2be7bd3fafe3e7178e5d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.1/halsim_gui-2024.3.1-linuxx86-64static.zip",
        sha256 = "c43f33a7547537a7ebd953c9295501c3cfc629843192c2b0140de108fb71c5f8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.1/halsim_gui-2024.3.1-osxuniversalstatic.zip",
        sha256 = "468b231c79c7f2641928b8fe103f37a1d467e886fd91b504623cb88b58b59925",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.1/halsim_gui-2024.3.1-windowsx86-64static.zip",
        sha256 = "ca1266e850fcc13a230d6a0b572199fd8fe941647e8f55a6919772a884c67dda",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.1/halsim_gui-2024.3.1-windowsarm64static.zip",
        sha256 = "a93dac4e2258e2d21dd01e5356cb289f600f9f4e6d3cadcbea5ba4070f75f8a0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.1/halsim_gui-2024.3.1-linuxarm32debug.zip",
        sha256 = "beb12c2da4523d301c5429ac5e26b1ef06caa4e57c3ba0458494dcda9bf02db5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.1/halsim_gui-2024.3.1-linuxarm64debug.zip",
        sha256 = "68ed3023acd2ee4294a4be1cc82f5a8b14ff3824e9ebd1e434830f82a5e4874e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.1/halsim_gui-2024.3.1-linuxx86-64debug.zip",
        sha256 = "f20aed00cbca4c6838eeb02a5ba0060abc5d0fc9a6ad882b1dc1de760a5326ca",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.1/halsim_gui-2024.3.1-osxuniversaldebug.zip",
        sha256 = "27093132ed1686f647aacba8cc61331c9b6b1bb660f72fd1254a4551fcb5643e",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.1/halsim_gui-2024.3.1-windowsx86-64debug.zip",
        sha256 = "36711493403f0164bfc9901dc0528144dfd1e703197a9fa2ce544d796fbf8bd0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.1/halsim_gui-2024.3.1-windowsarm64debug.zip",
        sha256 = "78b76b2f2af70b8b2a2d41f71afd5d34af6947cc699af3ba8a40e5316a6c1d7b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.1/halsim_gui-2024.3.1-linuxarm32staticdebug.zip",
        sha256 = "e4e8ec0e6c34aa5faf4b333981ad341e2d5cdee7545df02977c6ed9c8247b5d9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.1/halsim_gui-2024.3.1-linuxarm64staticdebug.zip",
        sha256 = "d6188466ffdeae23a1faa2f3a81186c1c3bd3af8c962ea8630a3e24fd75f4c52",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.1/halsim_gui-2024.3.1-linuxx86-64staticdebug.zip",
        sha256 = "7e50cd043e5c7cbd1ae115b45bff6eaaa5f481d2ecd5864ec361540de1885030",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.1/halsim_gui-2024.3.1-osxuniversalstaticdebug.zip",
        sha256 = "734526d1b7ae80f8d7dabf4c73d672f2c4fdcada5a742b64c2443e4138f03d59",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.1/halsim_gui-2024.3.1-windowsx86-64staticdebug.zip",
        sha256 = "340983287ab41b33d318c9b238632aab4d8c0379e90092a47416ee7ef61dbe3e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.1/halsim_gui-2024.3.1-windowsarm64staticdebug.zip",
        sha256 = "e064c3c70cd5a0a697803213a0557c02c0418c43f38724e4ea6a3617da0732d1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.1/halsim_ws_client-2024.3.1-sources.zip",
        sha256 = "ccf09390ef384d831bc77e62b669ebc07841d79e0cd55ea24b44e3873090be60",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.1/halsim_ws_client-2024.3.1-linuxarm32.zip",
        sha256 = "63214fad9695bfb2c21729863a84d2945e6e3e0dd0292855ae2f93e64944caa5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.1/halsim_ws_client-2024.3.1-linuxarm64.zip",
        sha256 = "94079d9c36322a1011d90762cb18a45bad5cca0d0ff648d3cfb745657367f9dc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.1/halsim_ws_client-2024.3.1-linuxx86-64.zip",
        sha256 = "004adb8027004e0b6ad9a5dd4430d099f4bc0cd7e7a8d86a6f8d8dfceeaf434f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.1/halsim_ws_client-2024.3.1-osxuniversal.zip",
        sha256 = "19cf052f51595fb8d03d1ed1d8e5f32e99e0acb5f35718d85d61fa2287d32591",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.1/halsim_ws_client-2024.3.1-windowsx86-64.zip",
        sha256 = "8ecd2a381da49436862ed15115049edf9884617bb2e6004b216a157598756b49",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.1/halsim_ws_client-2024.3.1-windowsarm64.zip",
        sha256 = "08da68a05fa16131ac21c80d3d05c73866e25f7755da3f818db947a2e0a30eea",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.1/halsim_ws_client-2024.3.1-linuxarm32static.zip",
        sha256 = "251e6cc91f5b4b081a6c3a68e56b7b7ff6c6a96b726c8120dec45f2f33d56424",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.1/halsim_ws_client-2024.3.1-linuxarm64static.zip",
        sha256 = "9a4aa93ecd2d967e78c564207a1ec8f378dee1dde94b446bf9751683f4ed8e5d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.1/halsim_ws_client-2024.3.1-linuxx86-64static.zip",
        sha256 = "be1276d294455250310cfc179e0cb5d912e1e75b5977e3d1fd0a463826e8b8d7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.1/halsim_ws_client-2024.3.1-osxuniversalstatic.zip",
        sha256 = "dcf0885b1b21a0925268b6c1b1792f00477bb98968b9a80614bacaa24aaf3d02",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.1/halsim_ws_client-2024.3.1-windowsx86-64static.zip",
        sha256 = "44136dcf42f636fcf0d83dfdeeb95caf53ee1dde7d4a950abcd312e6b38eb252",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.1/halsim_ws_client-2024.3.1-windowsarm64static.zip",
        sha256 = "668746fa18a1a8cbfc1bafcbab42dc65e433052b0bd8b7c08cb4ada2fd15bab7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.1/halsim_ws_client-2024.3.1-linuxarm32debug.zip",
        sha256 = "cb6b034b4544f67fc5181ef3cd94a1f4281ce0b1d991aa1451bde212fb7785f2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.1/halsim_ws_client-2024.3.1-linuxarm64debug.zip",
        sha256 = "018cd6c105abf419ac324615ca7184c841c358259c9bc15a518829e294d8fbc5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.1/halsim_ws_client-2024.3.1-linuxx86-64debug.zip",
        sha256 = "00b3117d518c629da5fb4315a6eef6c320d5bcda3c0587d6dcc8dd2ca6780892",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.1/halsim_ws_client-2024.3.1-osxuniversaldebug.zip",
        sha256 = "7bb3dafd1481b595ef900305cbab9a01eca5a019da84fb4781c7ea2d9aa1b291",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.1/halsim_ws_client-2024.3.1-windowsx86-64debug.zip",
        sha256 = "46ba68ee976b5cff39ff4785791e388d5d597d46a9280671e335c4d7fe9aa255",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.1/halsim_ws_client-2024.3.1-windowsarm64debug.zip",
        sha256 = "53c8629c3945dcb6a950c4bc7d442938755cebb7e9ec65b96d9de26c15ca7e19",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.1/halsim_ws_client-2024.3.1-linuxarm32staticdebug.zip",
        sha256 = "7540cdd2203edaab9fc92d21da87bd17a8a5b0ae0783510b6c77d1219c946491",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.1/halsim_ws_client-2024.3.1-linuxarm64staticdebug.zip",
        sha256 = "4534f002360d3b93d2cf2e29d2a7d012ff6dcdfb88dbda3966264f5cfd85f538",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.1/halsim_ws_client-2024.3.1-linuxx86-64staticdebug.zip",
        sha256 = "bc3a2001d497cf5c82fb0d2629e923fc533bfc2da4447b46e0954a80507d9939",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.1/halsim_ws_client-2024.3.1-osxuniversalstaticdebug.zip",
        sha256 = "76d48a7a369c7f2c3f35c8885927ec320912571dce108006454fec31069fbab6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.1/halsim_ws_client-2024.3.1-windowsx86-64staticdebug.zip",
        sha256 = "559657f5d06c5d7c73a82cbe7818d628dd302ef85a0fd59690c7889c9ee34829",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.1/halsim_ws_client-2024.3.1-windowsarm64staticdebug.zip",
        sha256 = "f509acb4159538b9d88f56d41179ad88b1ffa2fe0716d29f60835a71258656d2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.1/halsim_ws_server-2024.3.1-sources.zip",
        sha256 = "0420c66569f69af795d13ff7f01172b12ad9d6773a0274d2739320f510a5a960",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.1/halsim_ws_server-2024.3.1-linuxarm32.zip",
        sha256 = "10c0e3fafaa13ed52269a54c1aa054abb4831a2a512c54ce6878b8b76e0f3aaa",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.1/halsim_ws_server-2024.3.1-linuxarm64.zip",
        sha256 = "1c048c6a4c3a0308c34334edf9bac0e1971bc6e94bc233bf7f879407909e2c4c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.1/halsim_ws_server-2024.3.1-linuxx86-64.zip",
        sha256 = "5232a23f1b87485ce4c80b3a41b80ec40f1a8806a9ad2a6368ff6291c624fb3a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.1/halsim_ws_server-2024.3.1-osxuniversal.zip",
        sha256 = "d539bddbf44fdcace987b90c16dfef276dde6718881fd4924628f17362af2d46",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.1/halsim_ws_server-2024.3.1-windowsx86-64.zip",
        sha256 = "7790cfb0b8006de90fba37a02ad390998be0a72e4a201286fe9f8a1054664e03",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.1/halsim_ws_server-2024.3.1-windowsarm64.zip",
        sha256 = "fe7457a7356cd294d3a33abe75cdd2bb81bbcf7755f2d0ed2731568a8eda267d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.1/halsim_ws_server-2024.3.1-linuxarm32static.zip",
        sha256 = "0c5fe87bb2f57a6c875c7382d9503e540b8185427182d44b0e50f362e0c5fd71",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.1/halsim_ws_server-2024.3.1-linuxarm64static.zip",
        sha256 = "fc443f81278a02d49d60afe174e34681f3c5ebfd497e8d3e7159a0dcb73682ee",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.1/halsim_ws_server-2024.3.1-linuxx86-64static.zip",
        sha256 = "5ca129cbb57b0d0b7a54120ec0e3cd0607f249ab1f3ccd43e6ad2f88c19e524c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.1/halsim_ws_server-2024.3.1-osxuniversalstatic.zip",
        sha256 = "4e15bd34c52b43af8947c9948fa8053715d8faaa45fab0e093010720e85748b2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.1/halsim_ws_server-2024.3.1-windowsx86-64static.zip",
        sha256 = "f595ace72766af2da0403fb50d7ed6b3b071d8d401e333cbee7f165baa5647ad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.1/halsim_ws_server-2024.3.1-windowsarm64static.zip",
        sha256 = "d677a18c8b6a65e54bab7703bb1d56c1de634cc992e23672862cb0aa9ad64428",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.1/halsim_ws_server-2024.3.1-linuxarm32debug.zip",
        sha256 = "567dd1c34073c73a009aeb1e91cf100c89925e753beead359504073ab394082f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.1/halsim_ws_server-2024.3.1-linuxarm64debug.zip",
        sha256 = "9f1e79763c6152387804cd2839de770a095d47287009b9c8b5731f19dd1f5d5b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.1/halsim_ws_server-2024.3.1-linuxx86-64debug.zip",
        sha256 = "5f7b62f277931752db8e431609e2cf3df680098d2608547745652a867a26dc87",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.1/halsim_ws_server-2024.3.1-osxuniversaldebug.zip",
        sha256 = "16b3887721385d3244724c8d5d5776304a0bb31e408f57ad91347eeda8cb67f1",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.1/halsim_ws_server-2024.3.1-windowsx86-64debug.zip",
        sha256 = "8973b9740ac581e9f271ad7d8daa2aad2896c255f9ce424d7ff495c62f57e5fe",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.1/halsim_ws_server-2024.3.1-windowsarm64debug.zip",
        sha256 = "712226a1371c5068ac1d5e329a932ce587fe366d77bc0f0f39fba056360afc15",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.1/halsim_ws_server-2024.3.1-linuxarm32staticdebug.zip",
        sha256 = "c9382e3aa5ed1049b11a9e9eb1c712ab03cb03dc45f28fc26a44fc4a50b64d4c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.1/halsim_ws_server-2024.3.1-linuxarm64staticdebug.zip",
        sha256 = "df2bd803dd1a9aa8fd9686adf0b2ebbd5558d64c233807a76007478ddeb72509",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.1/halsim_ws_server-2024.3.1-linuxx86-64staticdebug.zip",
        sha256 = "d596d0e7e40c4439fe72d4d74d8ee2e16ca038ec88547528cab881afa86d6a05",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.1/halsim_ws_server-2024.3.1-osxuniversalstaticdebug.zip",
        sha256 = "c68a040e19cd120b1e3c0f07fa59414dc3e67b7b082ba240096caf91a909bf06",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.1/halsim_ws_server-2024.3.1-windowsx86-64staticdebug.zip",
        sha256 = "73c8408064b8a1d134877246698eb419a70d7da4365100cb8e8826a6c2daf0ae",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.1/halsim_ws_server-2024.3.1-windowsarm64staticdebug.zip",
        sha256 = "dc812520d334b0a8ebac38b1d6d92b11fed0570103b5ff18b8e98b41a9431f56",
        build_file_content = cc_library_static,
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.3.1/SmartDashboard-2024.3.1-linuxx64.jar",
        sha256 = "622cce27449c7d2f33ad99d974da2156c5c0e6a559b6afcbd8b8628099a3d9c3",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.3.1/SmartDashboard-2024.3.1-macx64.jar",
        sha256 = "60b7cecf3eca69df63ab632f72d0448d6a3eef6a1e3a4c19c4c649d566fe2fe4",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.3.1/SmartDashboard-2024.3.1-winx64.jar",
        sha256 = "0416dc9f5a1cc400079e6dc5d9856beed7967aa7a15dd8ec47ca4b38274cc20a",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.3.1/PathWeaver-2024.3.1-linuxarm32.jar",
        sha256 = "eef524bd15f0565d793d4feb88f97b2983665811abc12c1abf0f26d1f7987154",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.3.1/PathWeaver-2024.3.1-linuxarm64.jar",
        sha256 = "699b18e1c5dc567d783e12823beb63d1d4c2ad5f2b7c13e68fcd6687d57cd626",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.3.1/PathWeaver-2024.3.1-linuxx64.jar",
        sha256 = "045629f5db81da910ef1d06d76b253ba43a957a091111a375bb3508365258257",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.3.1/PathWeaver-2024.3.1-macx64.jar",
        sha256 = "379051338b0ac7711a54c2a6ffd3d9503367c13bae06760790eaec3c77d76a6b",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.3.1/PathWeaver-2024.3.1-winx64.jar",
        sha256 = "e0dd126f22e28cd1c3fe708005e65d3cacd8bbc10990e1807fbeb89758840bf5",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2024.3.1/RobotBuilder-2024.3.1.jar",
        sha256 = "30f95d89a2428f256166768c3b9a1dcba0d3a0e9f383bfbb950cc17b631f1983",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.3.1/Shuffleboard-2024.3.1-linuxarm32.jar",
        sha256 = "2e1e3db1c38e916c294783f65bcb6d2e92322b6b1abca9f96fea597052a22f27",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.3.1/Shuffleboard-2024.3.1-linuxarm64.jar",
        sha256 = "95efc54f9c3d1e5fdbfafa79bfc5fe6bda8851c233c6f86579d3b4f0fa882120",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.3.1/Shuffleboard-2024.3.1-linuxx64.jar",
        sha256 = "be93362c44eeb4a167e0ec80421e92ad38cf1f81ee40f11aa5f3bbfac22f2d39",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.3.1/Shuffleboard-2024.3.1-macarm64.jar",
        sha256 = "598eabc1fb70d1f2b669c55fb1266c3051c6427037be58c8a5ae46167a04560c",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.3.1/Shuffleboard-2024.3.1-macx64.jar",
        sha256 = "142cf10c79db5c584c7f7708e4b05855d0290f7b49cfe5ffd6c15e1b7ba99a2e",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.3.1/Shuffleboard-2024.3.1-winx64.jar",
        sha256 = "61f402dfb852dc770da94a19322321dcea1269b039a22925eecf0bcaeb24f151",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.3.1/Glass-2024.3.1-linuxarm32.zip",
        sha256 = "35a72933c3b9f3ea68db13bbded1cd9cbf6fd0bb7678f4267960c1fbdc7e8dbc",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.3.1/Glass-2024.3.1-linuxarm64.zip",
        sha256 = "e3e07ca4fa1a848c04c44bff10ab0e17833e7c9768cd095617691d41b7c9f973",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.3.1/Glass-2024.3.1-linuxx86-64.zip",
        sha256 = "64d60d657d55b3e8f7d76dc789b2b05d18ddf75a4bac807d9cf484c8fca4f49f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.3.1/Glass-2024.3.1-osxuniversal.zip",
        sha256 = "18487e3a37a161ff72327d1cc1f3797dbf000eedef101020de65a1e6c0881ba1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.3.1/Glass-2024.3.1-windowsx86-64.zip",
        sha256 = "756bfe2f29eee569db5c5a221de79af61d01b220004a958bc2acbdb621190ca6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.3.1/Glass-2024.3.1-windowsarm64.zip",
        sha256 = "61e17f3347aade5338d79b78020d2eba5445ac961f41fa1ca9552d567337f727",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.3.1/OutlineViewer-2024.3.1-linuxarm32.zip",
        sha256 = "6041cbff93ae331310372cafc9cb03121b35f7b3a8682c03fc731a6ee8a7b1b3",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.3.1/OutlineViewer-2024.3.1-linuxarm64.zip",
        sha256 = "cddeba0d12076acc9cb3ec0779968f823c3b1cd0f156229f194343b72a8548ad",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.3.1/OutlineViewer-2024.3.1-linuxx86-64.zip",
        sha256 = "cb54748d1b09d2874d1e50b6d5269f41d827e3e798be6d152816876bf3271370",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.3.1/OutlineViewer-2024.3.1-osxuniversal.zip",
        sha256 = "3738fd53d4551296fd72a93f33c0e40823e959d9ac68d80150e060af33429358",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.3.1/OutlineViewer-2024.3.1-windowsx86-64.zip",
        sha256 = "0ecb4c0280bd871bcc7da695dc9acce88485b2373b7fafa34bb4e69e2bbd85e5",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.3.1/OutlineViewer-2024.3.1-windowsarm64.zip",
        sha256 = "0288a6f569c3ea9fc3a086f86bdb7b8a58e95754e7ec200cf40c25a8be0afd00",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.3.1/roboRIOTeamNumberSetter-2024.3.1-linuxarm32.zip",
        sha256 = "82ddcc3ffcbb476a2eefb3d39f4c83c3ea7f086081bd551e962ac4231305e366",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.3.1/roboRIOTeamNumberSetter-2024.3.1-linuxarm64.zip",
        sha256 = "b03128d321703516af076526efe75005525250eea71aa604813db99a1f0935e2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.3.1/roboRIOTeamNumberSetter-2024.3.1-linuxx86-64.zip",
        sha256 = "4b94c0d0294dccfa0bf9422d8ec8d16f88f3366c6f68cfa2bce53d5e759d6d56",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.3.1/roboRIOTeamNumberSetter-2024.3.1-osxuniversal.zip",
        sha256 = "5e80b07aba749c9f79cc9d198868b1ca84973c7a54b6facb13fc94c84e3cc556",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.3.1/roboRIOTeamNumberSetter-2024.3.1-windowsx86-64.zip",
        sha256 = "c1a23b1203ab6615218fce107e38ff0fb6fd095c8c6c311782f646ce9f26f033",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.3.1/roboRIOTeamNumberSetter-2024.3.1-windowsarm64.zip",
        sha256 = "35f2c8b1f440208009e55b112e9e99d7d5da382295db6754ba01ed3684785a71",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.3.1/DataLogTool-2024.3.1-linuxarm32.zip",
        sha256 = "d4bb515056c6752b5c5bce137d9bf737a1163cca73fd0139e8b59cb27de7c77f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.3.1/DataLogTool-2024.3.1-linuxarm64.zip",
        sha256 = "a2eb860539d91e52fdd3da38610eae069f28f928b0b249d597a3f982f7435dfd",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.3.1/DataLogTool-2024.3.1-linuxx86-64.zip",
        sha256 = "c0b5afb50b70fbd97d5a4853d4087da80b296e588f8096b86f677adf114a5114",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.3.1/DataLogTool-2024.3.1-osxuniversal.zip",
        sha256 = "1c886154dff2f045b2b0ac245c6949d9aea4b0b396bf127c9238b6cce9438ee5",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.3.1/DataLogTool-2024.3.1-windowsx86-64.zip",
        sha256 = "4df463b20c2507c7d8d73a51b55b7a391ec994cf021d0cf90a4c2f28d09523e4",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.3.1/DataLogTool-2024.3.1-windowsarm64.zip",
        sha256 = "f23e1030c9e4ab27617a533750dfd0811656890e847388941f933220d841733e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.3.1/SysId-2024.3.1-linuxx86-64.zip",
        sha256 = "f148d137a877146e2d4a045ca5be271d3cd75b945d294e9c1e86cb2a3d16270b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.3.1/SysId-2024.3.1-osxuniversal.zip",
        sha256 = "e9ed6e90eb56b1e905aa36a0f0ebd8fd948ddbbf6fbb0759a13f0bd5f1b2afb1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.3.1/SysId-2024.3.1-windowsx86-64.zip",
        sha256 = "a342eba89c5ac443d6815cbb72eb0dab70714aa42fc93477c9ffc1a6bdd659ea",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.3.1/SysId-2024.3.1-windowsarm64.zip",
        sha256 = "8e7704ce6b3aad2807446e5ee59efc030052c5f03e21829eea333843345c843d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
