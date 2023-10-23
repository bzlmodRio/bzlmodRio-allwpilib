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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-headers.zip",
        sha256 = "942dbde0d2bb071130c6173a6f706889a9217b504ffdaabd86d543c376b21585",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-sources.zip",
        sha256 = "67fc8b03500cb5ac0b6f24c29cd7cfe042d29c9ff03fc3406f1e58df872a37d1",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-linuxarm32.zip",
        sha256 = "f46742eb724b9b0935d649055c982ae93009272fb0c0274f40d74828824f989d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-linuxarm64.zip",
        sha256 = "72d8cc60721b1882a9d0a16be4d5daf8b9ab6962bb2bd46624187fd06ab682e9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-linuxx86-64.zip",
        sha256 = "735bb4c46a451c3165e76e8f08e92df66e194abd0a334079e496a05778a9059d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-osxuniversal.zip",
        sha256 = "368138d2d7e7b4011308e0fa1b3ecb0c4928bbc0d11c5b2400e8b5f1ff0f8985",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-windowsx86-64.zip",
        sha256 = "a683d25738c436b36c0cc3475f68444dddf98a007cc5b80b17542069fd8f0934",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-windowsarm64.zip",
        sha256 = "f12bcba6bb582eaa5a02243d3e8d24387e3fccafd456dd2c896aec31a0daed82",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-linuxarm32static.zip",
        sha256 = "76ac7bcfcba85e808439daff56f83bc767d00b95b85d60f5b05b50b2e3a02be7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-linuxarm64static.zip",
        sha256 = "9fa53ae19ea6d743189a4503268b8a3063e5b8f2e7e28dfa83ca0a0df8ac8807",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "2f6c78a9b0d1da36aa98ba44b845958fb61fd3c3f837e6e94cac22ac9a911cea",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "319e92e81c4b2f02d125be0afea0a6f8fb19b6f3776b12a1faea8c2dd9d828a1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "e94df3177d4004796e56d3fe6df6b9bcd3ba67f508a6ce88ec22cf0fd22bcad6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-windowsarm64static.zip",
        sha256 = "8a44e0274a887422599067b346b8a5b5dce504c9f7763d0187ad8b4b97377b30",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "19ab25760f8ac0c64893856377654022bd14182fbe9587856caa7949032c874f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "99903b65760f98be973659cf2858ac84afc64b37bfa9115eb5e31d72de9f48bd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "352141424c028e9d87c64dcd094bdee82f5d4c41e6f532e87dfe7d828be32eee",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "4566c2c63315450f734dce770cf342b596e0b596fb9a0965f2baad248406ee3b",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "17beca83ed758cd6df957a59ac301b28914d7e0e4c19acec3c19a097b1cd9ac7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "73a8aa3e60befb3bb00f732aa46a075e61cb5f8eed1b2946b1425d98f8b07351",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "2b5310e2ea53e39ccafde009c84faff96cf9ce27af6095ac198dabf577f15da8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "3a01551cb57b969752f824e1b1068f1b6659bdd69b76bb8e86243a21233a83f0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "1a53d933689c4a9828684bbb912667a9f413335f0492fb9cab1602cc8c098b41",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "c1879f98e62b93284ead07db388bca51c8bb7ccdfead928e1f7bb5311faf8b12",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "e559d80f4ddd037b7df882f2bb55284a9bdef47716d4fcf16eb1b9e24c71e803",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "005f1a0567cfbb36f92c60ca0da7b9700619eb43c9c149ecf2231a07541496c5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-linuxathena.zip",
        sha256 = "331693e853c136f0ff140b6c3a9e04cbee11b77716b91b3e3a37d6e17337d446",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "e77df821152b1d7c33bfc4838502263048b2c28c76ef5c77524d88de1afb8c6f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "9afbadda3897ff5fef3811b8d54b7696a78fff59a3516c5af11b0e9b4251b773",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-2/wpiutil-cpp-2024.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "874f8c657dcafa79ac03f09f154e97a3feb7c3f424c1848b475fbad477b626ca",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-headers.zip",
        sha256 = "20dfbaaddfbcb94b91f76d0c7440490cdac1cf837919f4988dc4c52d24a832b1",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-sources.zip",
        sha256 = "5ff85acfb393126dc457ca03274b3042e06d573503457366427f9c338cd70100",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-linuxarm32.zip",
        sha256 = "51f4a02cb4eac3b4e5e05bf811b9d6c36b9a435ba8e5874f180854a43b8b17e8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-linuxarm64.zip",
        sha256 = "943278842b71cd6edc9e25d5f28dff03924ea43c6d687a31486bae24e1078d74",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-linuxx86-64.zip",
        sha256 = "64f52f6d5b36d3b68d0a716bc81a72d6cc5a42d5bc64ab62f2c44e2e1fafc4fa",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-osxuniversal.zip",
        sha256 = "60bf137aeab0ec7923e41ad57e84678876687a7af8d62a449888f07f8f00321b",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-windowsx86-64.zip",
        sha256 = "16723263aae88be861fef8991077e554d66b9703389430bac56248b45ef153e6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-windowsarm64.zip",
        sha256 = "ea730380737ba0f0e0e82ae7ada22bbf156ae8d89bd8f6f039e69cdc559c5d88",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-linuxarm32static.zip",
        sha256 = "e17ce6bc945cea8484a95a8e68a47b3f15f71ec1c68b56f414503de1ee6f7d82",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-linuxarm64static.zip",
        sha256 = "d7763958281db8ff5085d75f6dead39234014ebada2a21a4e73518a104730836",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "86b87379dc1a4246f13c0ebd5ef9c2aed1b5d9d94d7452a322b2c5e29c27d2cc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "207aa07f2a0941cf60497301aa62c7dcd2e51908ed403e36fbd059ec9b14113e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "5c7dc39bbcaeebdd74c2e94a905a747df8e523e003ae62c53316c405b835a611",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-windowsarm64static.zip",
        sha256 = "889da5bd24fc2f1e0456c23f54ace4d9d6e4d2fbecb0eec297aa4eb8108dc65b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "a21c257ebe283fc1f54ebe054a75bc8f3151c0dcb70db58bc54a3d24d519975d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "bffeebd816a474112688a2a4f1a6b95e513e3e1e7fcd42d7f23eb869298bff32",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "c3a777472263dd1a19227a9109eae644ef24546fbb57d749986bd90b7aab46b6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "4d252866c0e02d7cae3108dbedd71f69709a9e16a0b4079e73fa231d32961f79",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "31c8d40a35c3056ba802bbfaee349a0f6a032bf50a6ad4eae8d299371b26045d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "463e743943820cb16f3768aaeaaec0dda8adbc661a4b8310166aef015dbbe9a2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "07e89d4cf408445e77f3002957adbb69869974658c0ad7da1e200bb581bac6f6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "0c03460bf7279d53e48ecc1a522805417a6f43fb28dcf1ae41ec8bfe3c12666f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "1f12e6d33199678a918e523f9127fb9e145bb875e2dc7a3a8279434b8724492c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "7c00d568cbe5e65f5a4946da24cd96b10606e2ee8d679943d6b9af5ef44b71a6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "1a6a1c16ec926903dfbc1e4e48539bb6e735cb7faee8d8f176abf1a411facc22",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "9a890b77e251e10281bc3db4ca7d71d5f1b88f9595b74430a16e496b612f9177",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-linuxathena.zip",
        sha256 = "38d361c4c40981db3d95b074a00a1dd1172008416fe8f592839540b7e74e424a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "abc336d58ec83e043d26fd0490a37dca3d61e76112c812fe53ef0db883698197",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "8fa19611bfe0522bd57e0a20a3187209f866495c210792a04575f7c20d40b769",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-2/wpinet-cpp-2024.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "79b475e344313d1908d4cf582396a62e0bcb3cd800f193c7d501a7384095dda4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-headers.zip",
        sha256 = "533ec7f0a7ee3e61b84f711aa3bc2d1556addafd8bd77c257d3ac30c3f33d5c8",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-sources.zip",
        sha256 = "33496bbc69e5ebdb1701912923941ebe124d2f44528f53be17fbab3cb54f74c8",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-linuxarm32.zip",
        sha256 = "41da8ad12a56506ab8d94c2d22c824660d7138c98c8d7420871d417a8ad491c0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-linuxarm64.zip",
        sha256 = "9d521fcba66d565c8d686e61f7308307179c72f96fee92a36df9c837a0eeab5d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-linuxx86-64.zip",
        sha256 = "b34749c6ecd547628bb70736647b1c775b1579a614a069e5f6ebac63046a2b4f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-osxuniversal.zip",
        sha256 = "33e92b3c37990a72632599527c72fccbdd5a9ed720d61586c610715d26249a4e",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-windowsx86-64.zip",
        sha256 = "7694c54bc9df6a7a3040862a5fc64a8ceba77ab8bbb72eae8603f30305679f9f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-windowsarm64.zip",
        sha256 = "60dc3eac30726baf7d14a7b2c3633c560085a4a682e58abc05a05629a2e7f486",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-linuxarm32static.zip",
        sha256 = "65d8910d6f1fb2c6cf74df2ae008886ae677dd5cf83c3168c2af0a6807b8b959",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-linuxarm64static.zip",
        sha256 = "b3fdce4c6cb07b5e5d96cfbfca88252704e92cf979b4097e977ddfd18530ef8b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "4c6872eef06ea70ff7c3ccb875fb661e21320093b8ad1dccf225f14e5a098d30",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "b5cfa2cfe4b3e579903b41ec3cfe7f6d63d9c020bf64e2bce5d1ea6aba296e0c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "afa9cdd0750d734ae9aa99b3e1ba734201d6e4181ca5643ef0b86c6beebf73d6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-windowsarm64static.zip",
        sha256 = "ef30dc1d6d62a1dce53e43bc8492b01567c0a4abc8f9e7ec175dacd36632befc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "5f900c58aac2093bcde3760bb73b9960fcd0fe3b9fd42a5fb840e6e77276f19f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "bcdca23e0a6c8bb5e8f0834e7555f544cb086437338668b550ff3aef5d590684",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "84af63b6814a24037e1614590ec531de3fd8a1bd0c415fb56ee39c986afb794a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "6d39a0ae6f33c75fbb6dd87aecbb02ba5f8f6a36a66316c8f80c8c7acbd4c8f7",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "2d3952e70de22be64da91b9204392fa503efaf0bd40cf555b10edb68db1c1388",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "e9a57922b7b64090e86de56fee2ea56e934c790b8d870f3ab63e194c23256ccd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "199c017c1fe43477c9d3bdf8ca7ba0b028a316086b59ff21c01c0f7f2665518e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "9ad4c54e34c3739185327b3901771bf484a6b42bd253b57469be9c1909f9cca6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "cdd36841b6b0a043b434d24fef08adce7b31063f1999a659a349b3a25ef6f780",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "6ee4bb0389144e4f2d2398ebeeaaac2f64841aa4de5f5bd70e04baa8f6bac7f6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "e7f81a2dfac41e821c90b8b835a4a2720c07ee258ce88cd3ef6df304f97b2386",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "ec878af328907eb5946c9f36d3441a99e7b4bb4a6d05cac9cdb50ab8ccf60cb8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-linuxathena.zip",
        sha256 = "4315c1befac0e0b9990c4ea2808447eeb2837f2eba911061960234a33061b737",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "0d3cab83cb7ada47fa5d227bb2cb319a1dc7fef022f1cca99c0968be9c254363",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "08eedf3441608516310ce706937b59a35211e4cfead3bbde7ff8f50079e3fa91",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-2/wpimath-cpp-2024.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "199d9d6eb289748dd400b9bd590c7fc6792a4ee8e49eeb437108452eb773740a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-headers.zip",
        sha256 = "7909255ba0cfec17025d17fa7b8aef60816b177be87fa1a423772e0ee6fba151",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-sources.zip",
        sha256 = "000f9a4c3cb851962b8f1bc854c7a79c3a13afbc17b7348bd2b00a2935c0de30",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-linuxarm32.zip",
        sha256 = "58f36088f45ce0ebe398272ae8a5c9d2631fbbcc9531b02264324bdfa0341d15",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-linuxarm64.zip",
        sha256 = "d971fd92069301cf4fc3a0d55ab5364f866787fe54932f49a01d2dafff7bd166",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-linuxx86-64.zip",
        sha256 = "2a936e5a0a6f20fa2919900cef40dd8046caa3f73baf43e627ca1a5594b8f0b1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-osxuniversal.zip",
        sha256 = "c51a8abb2245fcb0f245cece818ea089ca35ca1ff5216f24e549c1c27a03e5e5",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-windowsx86-64.zip",
        sha256 = "448c14f2dfe0cf20a35b210f2d2e80ff624d8ab410e5ad176ec93e1416a0ce75",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-windowsarm64.zip",
        sha256 = "783a90ec2e77219169a2a989ebfc79f03b4f08954ee10a3bcdca226e36dd5ed1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-linuxarm32static.zip",
        sha256 = "045bb04a7e956d536016430265eeb5907d5beb41711d17c7601656f5eadb3a88",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-linuxarm64static.zip",
        sha256 = "c601ffd6b2cc191cedd62759103aaf2fc434ce10b6575562e1b61474208b2012",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "2a2ceef7878b1f84b86c405ea811615a8dcdeda5f91b57ed4af8522963eea36b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "75ef4a4da6820ded655c775ff39edbdab53cae247cc2e97c6a01b490b2088eca",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "99f9b06ec0e465ceca6bcaeaaef6985c3c9a7afd69905bf227aea0f924826b56",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-windowsarm64static.zip",
        sha256 = "93b9ce3700468e571ad9d32c5fe81acb6fabe7759e3e5ee981cdfd56d8f1d92b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "e7040a7d0a45a87fa02cd4f8b39a6b45efee045b5958a113702e880fab1e969f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "9e288bc22810d138b1923da2766e15560265b17575abe3cc14a9fbb922bdcb9c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "cc3d70035c0f45ce89c6f5340e1821cfe86058d22d0f4b3cae459c7edc0a254b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "c8af31e7a1672cd7d81c00cce20f4c277747d282be30af1d2a81a4f9581a1ca5",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "f0c059171354a26da437849279fb3e59c109755c22dc8bc14aaa2cb6a8461445",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "00471d5f52b3f5f559b0ca2006aaff34e9361f2936fb5ed88390ccce9ce450fb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "fb57286e0e5b091808d2cfdfda386aae8361f26c35b80b83fa2cddc754f7fbfa",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "1bdc173025eb69b3b97ad5c009f42415a8834f8e773faa891a90c76de5dcb3bc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "88117d5efac66394ad6e2cb3f78f31e2d3a6f634bfbac5497c62fd38bd5f638b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "cf6b3f3c1b4e958e10ad2295e3e409d823777283774a036bdd2fa46f40110bd8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "4500b682effefe6c89b7a3bb2062851ed01a34f580a42172c899b0dd1eefe0f7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "b83f936593c0a094c59e9170cd358cfce29164d5b82f5327dfb2074c53c281e4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-linuxathena.zip",
        sha256 = "65ebba786ebafbf2640cacbc4dd9339354cd2973f0398418cb8c388f44ec6281",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "3eccfbc7404ce82d6497f638475907f0efa96fb352159fd6f156a7d728055c2c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "98ef1a9f6f296988f630f3504f3370bc83f39da1f1a056c0450f847ad880981e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-2/apriltag-cpp-2024.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "5f7e24f1fca2d61d5167f679cc92ecfa467108c09e6b7315df9534ae13a5f441",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-headers.zip",
        sha256 = "dde71bdca142cef30282c8212ffc04eee38631949d10912a5a145969e21d67df",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-sources.zip",
        sha256 = "73ba806b3be5578b0a31e99473aebca68edd0b7437be54fac04a9a5ea3fab8c6",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-linuxarm32.zip",
        sha256 = "a07d6ca1a63049b110aa546086bafb0f2b0803d5964990b65ecc04bd7a392096",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-linuxarm64.zip",
        sha256 = "5d48444c2dba77a05a4fe8982830009694e0987d6c9794efcb41ae1d9f2cd61a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-linuxx86-64.zip",
        sha256 = "f2fd6b25b168af8ae675dc09de086d80321c19d4a28db6cd4d05a7d562ba73c7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-osxuniversal.zip",
        sha256 = "cc4a061d46127c23f7875f3dcdfef00bd4cf73422aec479e2bbde55b800dabd8",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-windowsx86-64.zip",
        sha256 = "59fe9689bf23ba87e3a2f02ef6c0a898c3ed9d5eea79d914fc80ba3c8f3ebcd8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-windowsarm64.zip",
        sha256 = "8d960eaf26de804c788f7e61a381a169469699c17647114a0767e7b30e09bab8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-linuxarm32static.zip",
        sha256 = "414b1b2e32d6a015da2d71da4a51577c76570a4a56c565d4830ec9ba0609f271",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-linuxarm64static.zip",
        sha256 = "488d435409cd1cdd08b0e6f2a0d44cc29385914c6dc66d09a45618abca96b6d9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "b047d72d7859dbed4eed6538cdccbaad4ece4d6dcb39177d0d479d994ed6f165",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "99d1dd7d9c4d6f72e0b205f8645f61fed55df78307e7c80803f0f44a110564ec",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "132699129c2bac06c469790c137ac174d9bbb1f614e0ca5399594bcc84cdc10c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-windowsarm64static.zip",
        sha256 = "d87e8d9b29826cb0b60c141ce254957336f3cc4a5776503ccfaf86b9634ee1cf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "fe670b94ffd1259a60484de59d7cd3ca65c73f9e77c63af3ac9764d63bd5e147",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "d807342da9a8d9e1b694419a2672b724a380c4d5ccf66d44e35be60b56b08ccf",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "92211352d205dcb553a388984c0959f994fe006486f2492094079a7ab817ef16",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "03d698263c0e1ade2d7b93d7c31f317f1fd5ff2ff8c2235564f935cb5708cc0d",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "8dbaf2ef4fa34b558a62e6c44d61f46cfca2a88c4759baa88fe6cae6a32ec75b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "85422b9985dcb99d8934cb430445e78ae5456ba974898ddc17574b8c4c4b0da3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "0c4380c164b7d0a5b8a0b86dce9822015e09805a840c2e5c65341d13f62432b6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "cc5a60f188f85827be04a44db9990c090986cdb73a126eff859084e09eeb2949",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "5a816042ed76351f6cb7f97acd472039e892aa982dec303c2199aa3e94691321",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "688185ae3bc63ba5766f0a918853a891ab031a73e67c8bb0920911878cef018e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "029705e83de9864c87d7583693d0319605386c719e7fdbf802c4b139ea9748f9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "666b2462e9f5815e3d5a6b9f8eff44058204e8d3a1d2bc96b915acd7fd318d81",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-linuxathena.zip",
        sha256 = "96bc06067d4441a2429f1cb4f214096443cb7512a63a0c6c1b509a7f6bbae5e9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "c64af4361239c9c34ad674513c21a2277bd5555197fb191b84d341b205a17be2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "c26a558ae574f30bfe76eff717eadffe00ed334a342343d6f8e259747398469c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-2/hal-cpp-2024.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "e59aefa0e886b382ad0b2f039cf8431b36a4e312af7c357ba47a7fe525cf2248",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-headers.zip",
        sha256 = "35677879f8775fe57d97d6dd61db2f6c0dd00f5f7ecbac504d0c25ff60e0816e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-sources.zip",
        sha256 = "7cf3b4835de9cd0433ce85e31c26d20f0973f5e98110a8b9fd827d3c46269985",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-linuxarm32.zip",
        sha256 = "5890b29dbf7fc5a153e6713454fa19462fdb52c63a59a4f35fc8d4202a4903a6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-linuxarm64.zip",
        sha256 = "cc1dfbe9af0715d4b034a0bb66eb73df5bb900c598fc3ea410e76bd2e232e252",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-linuxx86-64.zip",
        sha256 = "6165496e02bd127589644358bc7ad200a78332240b362b9706d8601b4bf41616",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-osxuniversal.zip",
        sha256 = "971dba3f4711dc6ff513c1311b52bb02d0d375fc909bf4493c2ccd2784c20211",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-windowsx86-64.zip",
        sha256 = "3b110d27205c15f08f82241d9341ebab049630caa8a72f8e7db645d71bdf3992",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-windowsarm64.zip",
        sha256 = "f4320579f65416b2549f0e3ca63dae668b20e79d05fd8942cf93f66db538e03f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-linuxarm32static.zip",
        sha256 = "65c070b8130c7837b536e72aa934afcfe304c9b5e938d0309c336a56834b4920",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-linuxarm64static.zip",
        sha256 = "e59246ac8d69f9743bac6499a9619a613abd9c6760e6a200297edce9fc43f50c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "0089a81feab415dc037149657b902d60b9f7cec85e5669ecace373c2a1c1705f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "52227d6b355e86e2506a896e46c0fc3daecbd37d4b6875fc23e11e01cd2eea9d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "5a9231b4416ed2de7f5c10832bbdd13d868359528664a677b6e2c3164a93dc02",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-windowsarm64static.zip",
        sha256 = "713904e7415a3c0ccde893bac9e87382615348fee7f403a9f3ce38df937c62e1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "40ea90184e5bc1310b023f0f3e5e5d2df2c9eb7c991c21cd2ea3858c47f6dc52",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "32358cc7aa7e13f03976de5cf9ef729b73a4b9273cd1b416bc76d78d95a4e696",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "545bfd4fb11d54e94fe7f61bcdd3a89e9278e365498ca3586282e2a2fab9198f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "fe42c7db9246e859186af02f32ae2963250874c84c1751be5caacffac547ad27",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "8f8dc959a9a6695d03e444710a756150ee97c8824ca788c96f72e9c3a7f66894",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "287fff9516e2c7800babf286af293792656992a80bfa13809b686eee708175f8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "671d6cbd831572a71f702177deddd82b5555dafac06f03165d5ddafdfa30917c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "850e63009f8c958b898b081be156162bf1cff16a57fcf536f883177f48dbea08",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "f18fedd0c3b8f15afd991167ce30b54e4ebfbd3365b5c23b36f11c54ab849840",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "7673cc805d8fe7892b97ed9daedba827d540ae7bd031042489c2a6a4d41ecf91",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "7c1ee60d9f0f3bb3300654fe38ea1df03f27d074030cfdd4b20819d3931dd56b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "01e3d46e72e53f6d219bffca006efb1d3596c347396494397e973b8343e7d73e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-linuxathena.zip",
        sha256 = "d39516142286f7297c59fd4a39d3dbcb817b2c138e0886712ffc53944140933c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "ea467a0968bdf39962ce6062e47daf111baf61fdd9b30b2dc072934eb59ef12b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "6bbcb3a173f3ce0dd446b6c1051a322dae57ee5f33d04f5efeae7464fa3131ac",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-2/ntcore-cpp-2024.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "789a8950c68866ea2e4f3480d24eb93450400ccc966c29aace3602a27c06cdea",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-headers.zip",
        sha256 = "fb36476d0898880174c4fa279b04534fb299f7d354c42586850b811a3cd4b391",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-sources.zip",
        sha256 = "45564259f154bf122f3c928f3b676b98f96ccbac04312c98b2b65b4806017520",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-linuxarm32.zip",
        sha256 = "7e0adc2c9fcd2d442fcf6ba7ccefd66d69f00b3b3a3f888ad5adec6331bfcd9a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-linuxarm64.zip",
        sha256 = "5f8d90d9b518dec4cf14177a7ba0958d4474b24a7c73d32a3e1c8edd9faf2a61",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-linuxx86-64.zip",
        sha256 = "008a0ef6b54179c7ed74b2b462c1d2330feaeaf56c83655272476734b75e32a6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-osxuniversal.zip",
        sha256 = "df8f18563300f1e7985346de11dbd203eeb5df5dcbb56b14d473f38af855b8d4",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-windowsx86-64.zip",
        sha256 = "47b26e5b0ccb6227076480a77ccc5ba76c7a3ee6874874637053f2bfe1b5551c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-windowsarm64.zip",
        sha256 = "fc5690605da039dfb1b165e1734c9aa2662c66235ca6310d5044a4fdc623c1d6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-linuxarm32static.zip",
        sha256 = "ca0e34dd7f5e87bf2e30dbc04cb812ce75827c1df8cd2395d497a578554f8e03",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-linuxarm64static.zip",
        sha256 = "158fa411c3db9ba9d5eddc865ad6a9f11cf7a6a4fca2526a9bdd54974b94d7cd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "e2fe2160860f7c737a0ef5ae4be88b5f7f51f0ec7297f9814ce7e9a0e54e86d6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "4014be0f9623933fdd961d0b16949011aa725ebcaa4f49215f295d6c7ca1ca92",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "4a711ee975b1a7b19fd07c3c596998ce664e96dc1497cbb29ef85a0395c65640",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-windowsarm64static.zip",
        sha256 = "d831f66fcadd2c828eff56135b1369c41bfa7fe98accf6e91b5138c989c96d82",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "5cf8c9edc5b5c0f1f745501526efcdcc0ddd7bfca39adc8622d19774c5b62a1d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "30e99d121fd734b76654f4c0e7270a80abb2949af0f45eef3fa209423f7fb745",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "15b9c1cd462289b52441f3d01c38a602a24ef9e1fd4531299e1c1f299ed84768",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "26ba436a36209afa02fd8eaed45a92f6880701e8baaea01b5639485e9211e79c",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "d18e42b067e8e757abffd8d91ae9576e063d3a03d064b3d074138220ea0d3541",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "96d7a6f67672717f1ea051106f55f91acdc7fe51910b1f45614e93af56c13e65",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "bab5a2501956808dbce52648d782f00b030d7f83794af93f179c4bc7dc1342dd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "e2e7a988509f8b650d881ad41395f4191816702251d97430398ee2ef1fbb6dbc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "fafc447f450d4ee5620bcda3deb6ed577c8ecfea54fbb2a1b3ffe0e31ef6fb47",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "c720f0667a701ce301f9f818f6f6fb560bafb7f8607489b5ef53bbeecaf531e3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "515d14eeadad8ae28276874f981ba70da3a76eb90a13191e8522b43e5ca32a20",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "8e482ad9ec086560c6631aa4eb108de7ec1ea925c231e7b234fcc854bfc6c3ad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-linuxathena.zip",
        sha256 = "c94fb18a212f9af885565213d28a58c136151103e4c6a7a7b811dc6ed161d851",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "02b6eb3d4ca88cf01eeaa8d577ab6d706299e07ea9afee17ac99be187f56acc2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "f84817a52c28b9de98f0ae0952f9074af4534ff7dfbbe8dc0f9be0aa8b3554a7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-2/cscore-cpp-2024.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "f928bdf274ab6afdcef3de0956ea178796fb974469bc84007da2b30f86b0453c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-headers.zip",
        sha256 = "aede8e84a297e7a47eb9627d5776fac9b7629a0bea29ed833a0c2c684284bba4",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-sources.zip",
        sha256 = "deb4fdde603e6a902ec7b0097b67e3a59a761ee67e9cf1858ba074bba973a246",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-linuxarm32.zip",
        sha256 = "ed4c983212bdf29a1c66a131e210449607d296a5b1bc5d0eb42e06116ee66395",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-linuxarm64.zip",
        sha256 = "e10e447dc983b47a41c0205e71efe20cf9c585c0917adc77c918752c76b80ce4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-linuxx86-64.zip",
        sha256 = "cc5ef3b6d3c004df6f873f144050e876f925ba0bdf0dde0259a59ea50a9af190",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-osxuniversal.zip",
        sha256 = "4ede6c05a51721bbe07e14a643e608fe00c624f1c202030c4f76f2b3857959f5",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-windowsx86-64.zip",
        sha256 = "e8657907c6eac1787ab6b11530a3464c4548b564b1b2208358e92ece8e49259e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-windowsarm64.zip",
        sha256 = "ebd6b57dc130957b1819de17e0b30f01e0341fbfa6d42c2d0e15716970f5a990",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-linuxarm32static.zip",
        sha256 = "21032a41b27e2a3ac5222f03530b0ace261169f7d4644c3ad679d43571e88de0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-linuxarm64static.zip",
        sha256 = "542d9959fa27620ac5aa9224649a48e6a189037a053286f0f748b92e0f7bd4dd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "62ddbb28acb9b3d6975ce6b48e8e1a69ee22ba840a16b55bf563d41f4f913464",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "cc154d5ea59f9451be81d3cb46f8d09169445d5ed76d8bd181eb2f14e793384c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "fa90b9b2722ce9023bb1b587030b49cc70f8279a653950ba7e3cf2352d1bedb1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-windowsarm64static.zip",
        sha256 = "ca68857ef8c128ca8bb8ead5cb98b85652e54d49eb9cb822c92d1611eb252f27",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "3961f2658ea6ffcc36ef3706b0c41d2d50817caaa827f510d17fd39403b727dc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "4d28031e6b1742e64d9f4c2b0428ba2e0781f744abdf2c0868eb31f15a0f581a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "8c3668a5648c90903fe3e86c008c84ae92b4bd829463d0807b5f0f9565e218a2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "7cdcdd2354845c7828c3a53cd66d5d403b8508ca14d184c24d21b01ddd615677",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "e5f6b26b318f94737e653dd5e8abbd44e46098665d58cc31667a63f46544553d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "98fd74cf125efa9e89ddf0b54bf25042931451e7e5448c837c969c61991a7fc9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "448dc8c842b77bed49389299ba4f654fe9dbb8039c832fd9b17858c6f37c1a8c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "fefe99c96f96ef43ba3592218e99f5b0bdc43b7b33a1c81f5fc8fc0a3aa630ce",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "7fa4eb551897e99e5040163d1b08a18e50c51a25e1083f668d8a2c8824b2fa37",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "3ff68a27aa6282e501b64e5e0f03b4b01a25ecf5a1cb428a6c3287366ddaaa72",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "342550e7408544244e369a7d7fcee3a28ec5ebf8278660015ea9ce082729ade5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "4ea0a66f30a085d3a5291ac14683f1af88494d7a2263cb181c1f344c5c9186c9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-linuxathena.zip",
        sha256 = "9ef9d271d825a62cc95e0dda9721090ac4baa6c082cd21e77ddfe9dc1eec9e70",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "cc5f0a14185af1b6188a09a4d7b4b64cde01c0da8d9ff8e49a0118466d34182f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "903bc7f6b8996f26afe3e05fd3ad2a655aa50e5a7ab76bea3666a3b300a2e8a0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-2/cameraserver-cpp-2024.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "bcac6489aca5e01706e426c1ec9f69c34f16201041308bb58ced7a177e6dd587",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-headers.zip",
        sha256 = "be4a1e7553973e34c932659c62923bd9f3fa4992f553f4eed50f63ace66333ba",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-sources.zip",
        sha256 = "ba5c7e936a46ef97dd396883529b2962da07608b61c441402acab79e79aeb2d9",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-linuxarm32.zip",
        sha256 = "fe939e9104ae8d490462c57142e9c043256f942cc0ac81c0fbbb02877f18b842",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-linuxarm64.zip",
        sha256 = "17095768e94afefff1d7fe3693b339cb9a0b91ba5b77fe9ebc5df123b1c24a49",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-linuxx86-64.zip",
        sha256 = "a36886382602ede09132ea5e73241ed2aa287d33c0c8d160488cfd2f276e6fae",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-osxuniversal.zip",
        sha256 = "13d9d75eaa31570a2a350c39743df2a62e4177b56e4b68da53d1bdae4e8e7840",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-windowsx86-64.zip",
        sha256 = "3d3bebd9b0b40f935aa71e36f103139cfd696a535efcf3a744c6460797613270",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-windowsarm64.zip",
        sha256 = "64f98b19994ec80b61ac766424eaac060691438200bfdbd0129f5f68c4d65856",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-linuxarm32static.zip",
        sha256 = "2c511b9a429b9623ca619d922ee8a9c5d6c656fe50994b7c675bbbc76794bf03",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-linuxarm64static.zip",
        sha256 = "d01bc68d7cd17fa40db71f01c04463f92285aab118b1147a37e85e226f476794",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "1399d253f56cb937741bbd97e394e2ce2e0dd818547e161647c032c2b5e18e8d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "e52788615a15fa667ae8637011153cf7e6a75458c1487dcdbba3f26c912646a2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "8bb00fb7d876fdb0f05d9ab53697c26363ea2bbb2d5b868d76f1f48b45b463b6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-windowsarm64static.zip",
        sha256 = "c639d0147d2ce01d929cd3f419d252a8d0b44ac41dc5d4dfdfbe7ce56548eff9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "7852adcf948bfb0fd1731b54ee558465d9ab097f0e0ace988363ae41562cd991",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "52a7928724077b9a49d09e99fd9a2e6b302f026ea28647e7f69e025067b4d7eb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "0746fd5ebad6b670765e9d9866da19edccf8fa6195d9fcada7a2e78058635637",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "d31b683ad1f6d6216ce25e2b1e66bf96581b244d7c33e5e02c8db25550400835",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "f9636b6e4fc4e1c707b21b28a6e3021eab5c9e28632f6a1181ff1a63cf21aab2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "9515d2958c4e1a6caadbc8508d8a02a5388b0abfd9a78e63becfc39c3627a10d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "819e79f5907e96f25118c9613449ffd3b39e52e4302c9b4f81c08565a31fa156",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "d5bbc6ee20a280b5bda1a8b808f44a5f18d833a5ec2650b4ca597fd5cc355b53",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "e8680c06d27affb2e4b60ca6f8a044b33e16d57ed93823f48e3dc4750ea58aba",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "259bcf9535d220865ee07edbd9e302db0d343870037290e8e3c0121c8701f531",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "aa4c4194b7cb923ff90db5b0f8775b9c656edf60957d46c01a69cbd0a270e31d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "e052dc08aaa810f456246b667ea88243c8390f4939c366228ec9cb02eba9c881",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-linuxathena.zip",
        sha256 = "35b1a1d43a1c2ef24ac15039d35ff5c9d6610cdf21daf6023b557af52f68b1d4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "da56829ece001ceff6fef9524a6cc69a56d057effd2c7a70e7f2297521a1a920",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "5eb559ea35b089e4f4b12cc3c2ea0a01c86f3a05ce7294d5a0ce7a54cd58603f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-2/wpilibc-cpp-2024.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "4d1639ad372be49d88d62963710d34ac0c16a938ef8021699cbfba175f2a4b5d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-headers.zip",
        sha256 = "90e9136d03bd02f592694461c34a94cb6e70da2745a83ce8331070ae5b117fce",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-sources.zip",
        sha256 = "714e57349500679e96bd12b8421427b7ca4eaa8e51d583c438733f5245d00bc9",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-linuxarm32.zip",
        sha256 = "ecf0c9fe2d353dca26db315a442364e844cb02c722d5bc4a12f6f66136128b34",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-linuxarm64.zip",
        sha256 = "81beda712c3e7d7ab2f705d1d134195c6520a3e897302eab2b67823a3f5fa3c8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-linuxx86-64.zip",
        sha256 = "7e0cb36bce838f5547dfefbba5820a0d49630c40d1000a43556cc72f6008a0f4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-osxuniversal.zip",
        sha256 = "e8f1f44902b8d21cc45689afc202eb50f9d7d4d9d7c546eb6d488058787ab9d1",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-windowsx86-64.zip",
        sha256 = "ba74d99d847a985fbe016421dff7fd1683cf5196638f9c56b92570ac8a808599",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-windowsarm64.zip",
        sha256 = "6098769aca41cd564a629ebdb08612fca71b39617762064a41fc80b63d377498",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-linuxarm32static.zip",
        sha256 = "aa8726905d643c72b0e1d58233c0ea7920d9d33d2137cf2badaea4d115291712",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-linuxarm64static.zip",
        sha256 = "e66bbd888606ee549d638280d576dc98934d32907f1eab65013e6f66b6d1c8c6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "5fc8e2b8cec2a33533a100a8e6d5a7c4697f0ffb5e5aeee2926d6fb4edeab32d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "8d2465f248bf3cb2c3c1715ee79b41042df1410213d36317d9ed32270a529f71",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "675c2b01ab2287b889bdfcb0dd99cd1fbdceec1889703df12e6417c4b3995720",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-windowsarm64static.zip",
        sha256 = "9244460af007deaabfec169f7208ac54f877dcf6492952d94e64c6da7fd1928c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "1ed56eaf7c7341f81cbfec2d7a54c2ecfe6f64bdba2741e19332805b34aea85a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "6674603661678cdd09450cd285515ebd9600ce10e56e1c09e2fb55144bfe5464",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "d8f3a485544ddb2c9c262a8fa53e7a470d002e7ac57b465b48c612dae4b886ba",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "b68ec96b422e052cb27a04c68fb3fc6f91353686de985510400da7275b0176ed",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "e86881f690fe4571ed806d46d109c2d03b3a199acb8cc2a700acbc853d06c92d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "28df1a7fdde87a963492a38c4c4736893e99b3bacd2f13ffbeb35e3357898fff",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "49cd5c5fb52836a574cb5592a92476c5f9fb6c1d62d2a766d0bf56fdf28ee7ac",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "c83b0807e344b6261cbae5d0735c57a1cfc59753a5085b2b1cf9ecc14e7cf8bf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "aebc65224bba64f83ef563fb3b44a1838f6d5464888ca2825c4b8586727e8cf5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "c54d048855d82e9e952e14726bf2a298c7807118361a6c579f7c078c3733fdcd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "820d93c41080af6fa25ba180d0b65d01ef8f3fa7ac25087dd20435b75e3433a3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "97b735bff088c96d364ba468ae891acba308b7dae842988a285d664a51c9e21f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-linuxathena.zip",
        sha256 = "203899c0288f8221faca4b8d0e99a7ed5be251b9c6e87d8b485b6d855901c633",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-linuxathenastatic.zip",
        sha256 = "bb306151594577cf2949766f9e2846b0d0c769912fd6c498d18393bf20429374",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-linuxathenadebug.zip",
        sha256 = "6cfb99ff4973f2604cdee320520b993b356adbd064abab1abd290a8c64b8adc6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-2/wpilibNewCommands-cpp-2024.1.1-beta-2-linuxathenastaticdebug.zip",
        sha256 = "cbc444d136475e3addb874e48cc38856de45e440dab982c2d7a0aa2ebc885728",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-2/halsim_ds_socket-2024.1.1-beta-2-sources.zip",
        sha256 = "84469a5d685747283e41d3604504ec94224ef2979adffbdd513b49d1cdd5b9a4",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-2/halsim_ds_socket-2024.1.1-beta-2-linuxarm32.zip",
        sha256 = "db2923c922e29ca84af4f0d7d969b0bd9f9a9e077ddf35208172dfc867ca72d0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-2/halsim_ds_socket-2024.1.1-beta-2-linuxarm64.zip",
        sha256 = "6e270b71b6415f1ece2c408d19ae6c28db1e8192b0662608dfd67d7365da5d0a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-2/halsim_ds_socket-2024.1.1-beta-2-linuxx86-64.zip",
        sha256 = "6c44ebb584dd283e091913d4ba53c9ea36043017954d588ab405593d59e15780",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-2/halsim_ds_socket-2024.1.1-beta-2-osxuniversal.zip",
        sha256 = "37d74f62b349f48fae5f548e633612cddb9221df0d781509601c04be7e20e8d1",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-2/halsim_ds_socket-2024.1.1-beta-2-windowsx86-64.zip",
        sha256 = "e733cf5a8f4a0b67a0a0055f32307d073ee2396154f151c5f9138a55302f8f19",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-2/halsim_ds_socket-2024.1.1-beta-2-windowsarm64.zip",
        sha256 = "09e093c58080b7378c8a1e0d81448d2794b97d88706cf3708ae8a11060fd6b6a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-2/halsim_ds_socket-2024.1.1-beta-2-linuxarm32static.zip",
        sha256 = "cce7958ef0bc59d660d17d13257e4ee11038c30c327f29095dfb818c6cd3abc4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-2/halsim_ds_socket-2024.1.1-beta-2-linuxarm64static.zip",
        sha256 = "bfa3d2fc3e9216f237bbc90f4b5151e5e950036535180e3a5c62bd4604a72efd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-2/halsim_ds_socket-2024.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "08ee314ac83a49a255927cddc465c0e26e49094a4f3dadbf6fa98e4c56260333",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-2/halsim_ds_socket-2024.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "cc838f5231d91108988906bcbb97d0fd08651ac7eec0cb6278c470b23ac90997",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-2/halsim_ds_socket-2024.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "17a38e79733e35946fa075ae1525101f6edc45d808a3165146672da94354fef2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-2/halsim_ds_socket-2024.1.1-beta-2-windowsarm64static.zip",
        sha256 = "7c26b07b2677650dfdd74c9eea81c933ef9a906f3a987f467f66ec19e8571b0a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-2/halsim_ds_socket-2024.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "abe22880f5138624dd1a943546bd6eaed5c9fc30e70bc028249fc5b9d906ed70",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-2/halsim_ds_socket-2024.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "d255220cab5585810b0cdc90915c44a70b389fd0475f0a55344ffe02a0d5a4b1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-2/halsim_ds_socket-2024.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "6a1465bb7f8e09f51c39607bc427647378f1b5cb9b8e028d8cd3297680faede4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-2/halsim_ds_socket-2024.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "dda6bfec93f6c1fe38242e3f7d5069797bd4d8a544d678e1ab940db3f3f4d818",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-2/halsim_ds_socket-2024.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "fab9d8870acd69f8f37d3d9417caeb3299954426c15d43c0ea26dec893fc4d92",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-2/halsim_ds_socket-2024.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "4a8c9d1e5f66c46541eb933bc74ff4a40318fc37901b6d605b25514ff5570537",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-2/halsim_ds_socket-2024.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "68eb4ab24f839d5c68f3df30ed88c27bd61606de1dd9e9cc9c20416b556bdcfb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-2/halsim_ds_socket-2024.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "4f851af77476f1f7774374b1930bb3fe9f3251ed9cd311b88313d76efa05b701",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-2/halsim_ds_socket-2024.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "e8861988e23b23876669a1fb4275d0336542df7b69efaeefbb5c03a3201b15f7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-2/halsim_ds_socket-2024.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "a0488e4bdc61908fced392907cd8d433fe83bcbd4e0f66db2cfa34b9eee48507",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-2/halsim_ds_socket-2024.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "c90ecdef878784cfbb52c22ebde381c2cd597f6f759d8740127cfafbafac50c3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-2/halsim_ds_socket-2024.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "dd467c6ab50198ce132d5faa3cb856258d9bc035ffbdf25ce220e13268da6393",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-2/halsim_gui-2024.1.1-beta-2-sources.zip",
        sha256 = "99b5321b73233a749305025966d41454132607b170eed3b44db16b403eb8753b",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-2/halsim_gui-2024.1.1-beta-2-linuxarm32.zip",
        sha256 = "93bd47597918dab22af44063f33aab86c0bedbbd60dce99f330d0618fc1fa96f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-2/halsim_gui-2024.1.1-beta-2-linuxarm64.zip",
        sha256 = "3a964f496532362eee69d3d5e26e1ce916495b2435363490b5deb53e042b02fd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-2/halsim_gui-2024.1.1-beta-2-linuxx86-64.zip",
        sha256 = "6cf96d2ebfa29d8693f18e43e5ba81af906607fd6b7a2992a2f0f90f264f55c7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-2/halsim_gui-2024.1.1-beta-2-osxuniversal.zip",
        sha256 = "6eb5342c6d2b3e7b7445aada2eda7929471ee5380b77fe0f2d77cea3262efef0",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-2/halsim_gui-2024.1.1-beta-2-windowsx86-64.zip",
        sha256 = "4c4feca36f70c587ef46f9fc7e128cc640e29342dc1d7e58a07a1f0ec3ad8038",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-2/halsim_gui-2024.1.1-beta-2-windowsarm64.zip",
        sha256 = "aa75b010e0192b21b793664496a5d7f124506895a039c444270cd234d152fd43",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-2/halsim_gui-2024.1.1-beta-2-linuxarm32static.zip",
        sha256 = "4a9d47fedec62a4e5aab7754490f19428599937d00e200d24d6ab7043e0ec446",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-2/halsim_gui-2024.1.1-beta-2-linuxarm64static.zip",
        sha256 = "f4ecebe69afc9d773db3ad538806412cdc5df25a80d07fa6302254186055d218",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-2/halsim_gui-2024.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "91bfe9dea8f92c65184193da68a954fd0cf53ccaf09fd18ac7d2b9feee465be2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-2/halsim_gui-2024.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "739e4b936e76af2d2db9deb49a08611217848cc30918f971e193748e93f64fc6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-2/halsim_gui-2024.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "3186b1c4d6e7ef190813f950335a4bdc3bb9028fd723882807a404c854465a60",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-2/halsim_gui-2024.1.1-beta-2-windowsarm64static.zip",
        sha256 = "7964eb8b2e15f1e0482f352ccdcdb2fb98890809ef9f89010c3955bacc2146b6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-2/halsim_gui-2024.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "a56b83b946182bbd24122e03e50071c75ff9fd1da866a0686e0009969e7b1168",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-2/halsim_gui-2024.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "7eb15a388cdb0ecb79a82ce803a8a13473f8df8c63e94ec7047152795135844d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-2/halsim_gui-2024.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "95ac6fe53210c07221ae14cbcaef08e52890c79d3028e0571f74b4ee092dc8fb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-2/halsim_gui-2024.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "a47b696373abd0435a4ce66263fcf234cedde7cb8f85daf40b2e25436da123ca",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-2/halsim_gui-2024.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "208460642d7728762208cd6b7db1515ff287d53cec0b6b7a8a561a9b5f47bf34",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-2/halsim_gui-2024.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "ba528cab089c76091d276653096433406820232a4f3c9ad1c9b85b57332fd8a7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-2/halsim_gui-2024.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "ec3900159bbdca9df99197fce123f15d3d1a4fa81c8575c2c8d87693976746bf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-2/halsim_gui-2024.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "792da48f2fd72974b07ea21eb5efd4a149f31a00edce1d3ce692bbfa678acdaf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-2/halsim_gui-2024.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "6510fc8390915821a62446b6efb74a9d30f9a6e08b37c2e19b982c860c3fba2a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-2/halsim_gui-2024.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "d59c0e89ce2d11efa7de691eeba389ada08e975a6044cf7133005035092d9d42",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-2/halsim_gui-2024.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "5145da45f0372a9a4beeb224b5a563c670a88cd865e3a8888e51420aed33f1c2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-2/halsim_gui-2024.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "f25181cf2f0fc2553d248cc62f017e804da262641f4cb256299a9dae9931cfd2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-2/halsim_ws_client-2024.1.1-beta-2-sources.zip",
        sha256 = "9b07be875481a626539482ebfb58b036d77045599229756b57d447adf469e509",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-2/halsim_ws_client-2024.1.1-beta-2-linuxarm32.zip",
        sha256 = "fc0378dd33157560a199829077dee17f4f2321bbc07f1cfc43ce684d2f74fbe8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-2/halsim_ws_client-2024.1.1-beta-2-linuxarm64.zip",
        sha256 = "9121b8143624b6bcae0c54fdf95e8b40ad82352a1ad8033bef831bc405279d70",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-2/halsim_ws_client-2024.1.1-beta-2-linuxx86-64.zip",
        sha256 = "6ba0b682bce1d4d73689ecf6806059082b9016ea1bc71b94f8b838129864620d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-2/halsim_ws_client-2024.1.1-beta-2-osxuniversal.zip",
        sha256 = "a186f6d7ec4d8253e5039422c2fc351ad3a78b1b53a563f4ec9b2804b0e45cb4",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-2/halsim_ws_client-2024.1.1-beta-2-windowsx86-64.zip",
        sha256 = "66430ca7c537cd0860dcafd472716e0fe69fc473a10899559deb24c960dadd95",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-2/halsim_ws_client-2024.1.1-beta-2-windowsarm64.zip",
        sha256 = "34a3ce0e93d8ede5b557f33dbd572f219bd2dcb96c38b1a2f173d0fff4fce77b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-2/halsim_ws_client-2024.1.1-beta-2-linuxarm32static.zip",
        sha256 = "5353b9fe90b72bb6654e6bcb76a62a19a6f2c4a4cb2b11ad6df922fd45feca42",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-2/halsim_ws_client-2024.1.1-beta-2-linuxarm64static.zip",
        sha256 = "96cfc37105eba9018196d82030218992f45b482e7172c3f6eab66586beabb71e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-2/halsim_ws_client-2024.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "d7db5f0f6742e98ccec29a356e4df1c4c14a2325264b1c5dc78251ea39435f6e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-2/halsim_ws_client-2024.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "37b6d5313b3a74f9d91921e6b2faaed1b5f6e242a1f65ac81e94d8946c710820",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-2/halsim_ws_client-2024.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "d840546e82ce561194a24ed585ab63a945c12aa21d8240fa824bf1817e2c931b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-2/halsim_ws_client-2024.1.1-beta-2-windowsarm64static.zip",
        sha256 = "f4fad77286406976c506e4f5ffcfb409324d76c0f4f9086a40a4c1c93929d57d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-2/halsim_ws_client-2024.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "6f89cc0782e056401815d305542356d760e9fb35e97264b53b5e548fedc5fc3a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-2/halsim_ws_client-2024.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "85c0a5882413c9215c063cdc3901a3d4a1a81216b024da3a5beebaef842f95a1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-2/halsim_ws_client-2024.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "a43e726a5f65f070485fb9e34ab6e6323bcfdfae04f4654702ac5018e247d9ae",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-2/halsim_ws_client-2024.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "3a232d3a68180c4be0541055b7109ff2cc87da60b49bd661688a3bb0e39e7d95",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-2/halsim_ws_client-2024.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "f38d45e89873d1aaea3a5f50d45d440337237e1942634d6cfdd742bd63db288e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-2/halsim_ws_client-2024.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "ce4f40937a1bf8d091256dc7bd38d6b2c8e1aca3efa3da5f4c8d2999ce1dd5de",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-2/halsim_ws_client-2024.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "1d4c7e34dd47ef780df44aab15c3ab5cd722604ef54d56f24c565044d9d65c48",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-2/halsim_ws_client-2024.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "0e9769982af26d74a7a76f2032b18aaee5c9f7a566e697490b6df3fed09831dd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-2/halsim_ws_client-2024.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "155aca8b1805e647e2f93656519f57a31559a9c544a48f7c2ff4d21609dda555",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-2/halsim_ws_client-2024.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "ffc5397071044850621cd20daa6c09c19e318a89f4374ccf8120e88c0ac9361d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-2/halsim_ws_client-2024.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "8ea1ec509e432be170d3e83b89ef5243a08a8664b490d6d0827eefa729261baf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-2/halsim_ws_client-2024.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "15f265b3f0dbb8fcb24ee91cb56877ff35201fe49e39a7aba8dbc06c0ec82931",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-2/halsim_ws_server-2024.1.1-beta-2-sources.zip",
        sha256 = "5cbcd0a6e4a8480fa16621932ba2cd70c2c6bfe56e87064744a9e282760ac1bd",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-2/halsim_ws_server-2024.1.1-beta-2-linuxarm32.zip",
        sha256 = "e93971d4c89a7efdf13abb5cf4625b52230bc9a3a5d9ca420370ab470c4b591f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-2/halsim_ws_server-2024.1.1-beta-2-linuxarm64.zip",
        sha256 = "7b15803109efc71dc751de675f51dc1a13c93259e4af36fd20505c0ae65b6fda",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-2/halsim_ws_server-2024.1.1-beta-2-linuxx86-64.zip",
        sha256 = "866f445d8d88cffd503b9a449fb4d14bd5a18bfcfc63e37f54796ee29815171b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-2/halsim_ws_server-2024.1.1-beta-2-osxuniversal.zip",
        sha256 = "3f897b6aecd1cb1bc5047e7adc067edc9737604f5696e8f2a743d56722bd9cf4",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-2/halsim_ws_server-2024.1.1-beta-2-windowsx86-64.zip",
        sha256 = "0eceb369215e4242c154fed2773d5f56ad282a5db96acdab2d17342ca567ff16",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-2/halsim_ws_server-2024.1.1-beta-2-windowsarm64.zip",
        sha256 = "4d5e5a0a1fd67050329d232135384ad32cf653cda89fd439f88077ac7709b054",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-2/halsim_ws_server-2024.1.1-beta-2-linuxarm32static.zip",
        sha256 = "c3f5bb59ae67e4b1b9955a3e2f0599babdf5babc4dc6e972192a3d61343d6752",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-2/halsim_ws_server-2024.1.1-beta-2-linuxarm64static.zip",
        sha256 = "3cb9cad49953f01459136d0fd50f46940223ff89bd33581908164b243a6d10bc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-2/halsim_ws_server-2024.1.1-beta-2-linuxx86-64static.zip",
        sha256 = "451ea5b5e78528a1b2f50ac905dfabc09ca2dfa317352315b74bcb9a86383982",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-2/halsim_ws_server-2024.1.1-beta-2-osxuniversalstatic.zip",
        sha256 = "3ab7813991c10de84adec3aa12750ec64cce8a50c0b92e598a383caabe33f8f2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-2/halsim_ws_server-2024.1.1-beta-2-windowsx86-64static.zip",
        sha256 = "8cc1cb3b176645ca239df0725c069f91aebbdb3511e7cb8bbd3c92aa228f6010",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-2/halsim_ws_server-2024.1.1-beta-2-windowsarm64static.zip",
        sha256 = "d3c19ef6ab65bd798a3c65b408f7bc128bed20073b5bc26ddc613ac6448029c3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-2/halsim_ws_server-2024.1.1-beta-2-linuxarm32debug.zip",
        sha256 = "06a57dee2dc46ada518fda0fca637d98cab6027179e3b65f7c242291dcd68134",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-2/halsim_ws_server-2024.1.1-beta-2-linuxarm64debug.zip",
        sha256 = "c9059448bf8dd528848ee09077cf7e7f8cde4f3929c70957de9769f2fedc838e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-2/halsim_ws_server-2024.1.1-beta-2-linuxx86-64debug.zip",
        sha256 = "9dd1c88186f1f424aa96e41e298fcafcaa6488dc72b3ee7ed43e8f92d12503aa",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-2/halsim_ws_server-2024.1.1-beta-2-osxuniversaldebug.zip",
        sha256 = "c83aab06f8c3c51623ddb21d27ec1507e5260a15ce8e3c31b1c496e4330caf69",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-2/halsim_ws_server-2024.1.1-beta-2-windowsx86-64debug.zip",
        sha256 = "c496d69201200a43b180fc37bf54573a228448ab95465c2ebbfadf205a0c6320",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-2/halsim_ws_server-2024.1.1-beta-2-windowsarm64debug.zip",
        sha256 = "9cb331ee987aace09cd2f6f89f77091566ec1b745ccbe73f1300406b6cf9f0b1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-2/halsim_ws_server-2024.1.1-beta-2-linuxarm32staticdebug.zip",
        sha256 = "1178257cb891b487472cba60a944001e7f7427846a52f36f3c5b72f4bd8b5c7d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-2/halsim_ws_server-2024.1.1-beta-2-linuxarm64staticdebug.zip",
        sha256 = "a369d201002975e8bb3753b8ed0a75c5607d8decc78a66f91ad0b30cb1f33341",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-2/halsim_ws_server-2024.1.1-beta-2-linuxx86-64staticdebug.zip",
        sha256 = "070b5607175e5ec4e2756497db0f42661109e0e9b7a70f8af9d96b2c6f466e5a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-2/halsim_ws_server-2024.1.1-beta-2-osxuniversalstaticdebug.zip",
        sha256 = "0e77cc596f11f80ce7d5ff25428314036b56373b06db659e61c1ab9201966822",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-2/halsim_ws_server-2024.1.1-beta-2-windowsx86-64staticdebug.zip",
        sha256 = "39a30ade153eb0a86d303dd9334f40ef223258d8b719b332ad03f6f8443d65d2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-2/halsim_ws_server-2024.1.1-beta-2-windowsarm64staticdebug.zip",
        sha256 = "9497a582286140871cc9cffbb2302878f93f7c40f4a77673859cd72b4557f83e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.1.1-beta-2/SmartDashboard-2024.1.1-beta-2-linuxx64.jar",
        sha256 = "4494499b97e151ba7945dc6bfe1552c4d2fdbbe25fbdcc7ed8c99e8d67c4df9d",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.1.1-beta-2/SmartDashboard-2024.1.1-beta-2-macx64.jar",
        sha256 = "b474f6be66775efca7b41e54c4281d24f57e6a0a4334cd43889b0ce62aa1eb40",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.1.1-beta-2/SmartDashboard-2024.1.1-beta-2-winx64.jar",
        sha256 = "add17cc757beaa3b523c68139be07d5dfe0b7f637f078dc58e9bf87504e8d341",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1-beta-2/PathWeaver-2024.1.1-beta-2-linuxarm32.jar",
        sha256 = "273279552a3c6288bb8a35ac97146b70cd1c93d2417b87d55a1b96d68dd4652e",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1-beta-2/PathWeaver-2024.1.1-beta-2-linuxarm64.jar",
        sha256 = "f9907427f324b80b178568e1b9d0c3e3bee3b9fad9139b6535e158321ebac462",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1-beta-2/PathWeaver-2024.1.1-beta-2-linuxx64.jar",
        sha256 = "4cace22b46284a672924a1c0579b50b48f3fda52d9dab01774d73994142c4ec5",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1-beta-2/PathWeaver-2024.1.1-beta-2-macx64.jar",
        sha256 = "a5bbbc2119ac855bc5f0a77226e3c9bfb39add05c8cdcdd92274587aa7c3dea4",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1-beta-2/PathWeaver-2024.1.1-beta-2-winx64.jar",
        sha256 = "77e1c04154c54cd86d505bd66a535059186903cf56788084a0756c1333950135",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2024.1.1-beta-2/RobotBuilder-2024.1.1-beta-2.jar",
        sha256 = "1a757a7d6fecc3edc27ba4ca92cb200be984c6361c828932686f38a4adbadf89",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-2/Shuffleboard-2024.1.1-beta-2-linuxarm32.jar",
        sha256 = "0cca11293ffbca4b51d32cfe1351cbf5fda188df42de00ada4a2a3cf69fa7337",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-2/Shuffleboard-2024.1.1-beta-2-linuxarm64.jar",
        sha256 = "a0f1e2222c0bf1f7097f3263b325eaee8bd6857c9152c3919686439d8cdaece1",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-2/Shuffleboard-2024.1.1-beta-2-linuxx64.jar",
        sha256 = "5a743fbce6afbc2d775929d7b5685e0d3f398e7b95ad187ce60ff50c95a8083a",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-2/Shuffleboard-2024.1.1-beta-2-macarm64.jar",
        sha256 = "e3f51ffbac914a97a4a3a223655b56335527f1c075d6c291be99692b603de8ca",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-2/Shuffleboard-2024.1.1-beta-2-macx64.jar",
        sha256 = "70e13e96aeabc07a280f255c59a678514ec71cbec4e3ec5457b21c69a281e84b",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-2/Shuffleboard-2024.1.1-beta-2-winx64.jar",
        sha256 = "8b96b935fff9d1e337bdcf333cb211a4fe569ac6188f94426462282acfcff9f0",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-2/Glass-2024.1.1-beta-2-linuxarm32.zip",
        sha256 = "f0b95978ec7c4ef8f02a6a2b566dc42a0cd88e198a3395818ffe106ac87766ea",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-2/Glass-2024.1.1-beta-2-linuxarm64.zip",
        sha256 = "c3ca5b9bb596aa5dfe462cb54bc34439fc7a92b8189359036609458414e2c1d9",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-2/Glass-2024.1.1-beta-2-linuxx86-64.zip",
        sha256 = "40095ae689facba6cabac15121f3843ebe8b3fc59ba2c1b0ee80954face9bc33",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-2/Glass-2024.1.1-beta-2-osxuniversal.zip",
        sha256 = "2d10fb96ba6a46318d518a3f3ae2528de5513d9415d2f1ae0686086693b4e9b5",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-2/Glass-2024.1.1-beta-2-windowsx86-64.zip",
        sha256 = "d0b9768fe4c222064d160b3da44e66474a2c7976875d48495bc89dad9fdec433",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-2/Glass-2024.1.1-beta-2-windowsarm64.zip",
        sha256 = "555cb99f8ad12c1984cc4c25b03d2b50fac44fb526bb15b3b6aab2702c5a6434",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-2/OutlineViewer-2024.1.1-beta-2-linuxarm32.zip",
        sha256 = "805124760af9e32858fdfefb7c6fe24f520bf456065c9083ea78af0a3c2ab5ef",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-2/OutlineViewer-2024.1.1-beta-2-linuxarm64.zip",
        sha256 = "57937b0cf213a46d99283c78a6960fdd212704001ee25f26383b53ac8988fcca",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-2/OutlineViewer-2024.1.1-beta-2-linuxx86-64.zip",
        sha256 = "05138de4c31d9837d4513ef4b50318af7288db736815c2786119a262301e3b64",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-2/OutlineViewer-2024.1.1-beta-2-osxuniversal.zip",
        sha256 = "da998ed805c2c786e28e1f760e54586abbd43a8ed9dcc162fd1f469f45dc8c23",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-2/OutlineViewer-2024.1.1-beta-2-windowsx86-64.zip",
        sha256 = "30665cca2c46d521b49ce1bdf3d7e9bc0f9583bec9d3c486a78f062eedc75ca9",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-2/OutlineViewer-2024.1.1-beta-2-windowsarm64.zip",
        sha256 = "bd4a8eeea7506e8e21d6336cdbe8c279933ee7d65f2e3ac8396457c0315efab5",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-2/roboRIOTeamNumberSetter-2024.1.1-beta-2-linuxarm32.zip",
        sha256 = "c6e1b7052eb74fa976e18f18279cffe9c84e81a1bcfeca692a155e609925c116",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-2/roboRIOTeamNumberSetter-2024.1.1-beta-2-linuxarm64.zip",
        sha256 = "0389c97866dfbb956afc9bf151dd6aabc59b2b135605da97a092a8bb5f5f1954",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-2/roboRIOTeamNumberSetter-2024.1.1-beta-2-linuxx86-64.zip",
        sha256 = "e7955bcd9333f9df07e3146ceeb26f017ee29d8102e51a629e8b34bff232a18d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-2/roboRIOTeamNumberSetter-2024.1.1-beta-2-osxuniversal.zip",
        sha256 = "a0996be0808ca6be569d4015dfa9f0584fd7b28a0545c92a2fdedacb97eb69da",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-2/roboRIOTeamNumberSetter-2024.1.1-beta-2-windowsx86-64.zip",
        sha256 = "929c5253fb28731683ed5d7c9ff02502c10065344d986750df62ef130e68ebce",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-2/roboRIOTeamNumberSetter-2024.1.1-beta-2-windowsarm64.zip",
        sha256 = "e0a80c44a6417ef1a3dd49838bafd988448633221a27dd1ab8f00c39a43f8f16",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-2/DataLogTool-2024.1.1-beta-2-linuxarm32.zip",
        sha256 = "ebca4a133aa8d0bbaf6effb51a2814338ead4487ec426ee8567b54eb8e70f62a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-2/DataLogTool-2024.1.1-beta-2-linuxarm64.zip",
        sha256 = "f0b9d134f9cdfdc712ad696eaf8d66a1602b5c7a0faac86b1c7f1f84f556b94f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-2/DataLogTool-2024.1.1-beta-2-linuxx86-64.zip",
        sha256 = "af208d15b14ff3609958fbe93f77b8c0239cf13d0c40193f40eda05deef9589c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-2/DataLogTool-2024.1.1-beta-2-osxuniversal.zip",
        sha256 = "227c912625a982d4466f760199cee5c603fa28b5b0ec4919b22ebf5efbbb5aae",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-2/DataLogTool-2024.1.1-beta-2-windowsx86-64.zip",
        sha256 = "2deb25d08c302d5a5939d99dd066e3da7cd6fcab8dbb17a81b9061ffc495a6ec",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-2/DataLogTool-2024.1.1-beta-2-windowsarm64.zip",
        sha256 = "f6b0317c53d42677c90827117963c0e2aa62a8707c4c6a917fd6a9c0eda4bf29",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.1.1-beta-2/SysId-2024.1.1-beta-2-linuxx86-64.zip",
        sha256 = "d82671a5cf4106062905b74f40b119a4ce5d21d06f08c002ebfb50b92c2c305c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.1.1-beta-2/SysId-2024.1.1-beta-2-osxuniversal.zip",
        sha256 = "72b72369e0e8f08a5c8f2714c2967c7124e0ce044f6959999b4f0a8d7ce7849b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.1.1-beta-2/SysId-2024.1.1-beta-2-windowsx86-64.zip",
        sha256 = "2bbfaaca7de295455ca993e3eccea05dcf8fe188e608fb2137b1d3e174804c47",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.1.1-beta-2/SysId-2024.1.1-beta-2-windowsarm64.zip",
        sha256 = "39d84a63f175e58c3056d73896db3986453a89186b6cee914fc69e868e3d6fb2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
