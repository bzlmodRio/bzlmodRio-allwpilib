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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-headers.zip",
        sha256 = "e69c5ceeefddcf84700498dc42f210ea796d2b355303f63935cd0c8aceadea42",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-sources.zip",
        sha256 = "abc94a55468d302b479dc74bc622bbb21eab63f563facba633b0761205c875d6",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-linuxarm32.zip",
        sha256 = "b95faee257ef6e3c1d3d2f0ef07e11c264e1caa4b25e87103a9106716e82ab92",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-linuxarm64.zip",
        sha256 = "480d6a882bc97c4d39b4a68a374d6361da9f1f9972ef4f763d81daf54ab3f8fb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-linuxx86-64.zip",
        sha256 = "c8cb26526edfec0780216b23786f580f6b45717469f461f0d1a3a79a1738bf32",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-osxuniversal.zip",
        sha256 = "76ccb7638cef4ecd2fc4ba11680bc416e6a0f3cb20ed8ea7b79af0120e89eaac",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-windowsx86-64.zip",
        sha256 = "46cb0601431235e005542ba1db85ac5e7aabf969d858c98c262c4d5d6e23bbf8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-windowsarm64.zip",
        sha256 = "abdb555d834fffa3c48fb9e9aa5641306fae365f8ffe1d26c8dfa0411bff81d5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-linuxarm32static.zip",
        sha256 = "979b0aab36ab551ee6d3878dea4bf2005d6a2aea3dddacb66670e4bb135e518d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-linuxarm64static.zip",
        sha256 = "7f83ad996366eb89f2528ef93b03f77e8c838593a6db46501904b25083812c65",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-linuxx86-64static.zip",
        sha256 = "c1d5f131a8e54f9cf425556a22ffcd75b8b4f414da41b565542b4a9d4f5311ad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-osxuniversalstatic.zip",
        sha256 = "1c08be2b5f2ecc8a9f198a41afc6ab3184d725305429e41d491683c712813b33",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-windowsx86-64static.zip",
        sha256 = "4b513aeee114cd580f42ff15028fd3abfbe72764d534e27b879e5658a577d4ee",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-windowsarm64static.zip",
        sha256 = "19a8e4b39aa6a6869c9f88f60610f34371cdad940b00f7114a6f9e2b09f4fa6b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-linuxarm32debug.zip",
        sha256 = "6ae98db6ddc45c8c0a0898c75aa49718c2da81f8ab5c07df2e8626168b0a8977",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-linuxarm64debug.zip",
        sha256 = "8dc8e661717d31bc19f16833dfd0a0c65eba332ba6412c940c71f5e713eb1632",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-linuxx86-64debug.zip",
        sha256 = "21b5559eee9ff7fedd1fdd28b961e40e015cbf90d2b129862c6b841c9d29a79b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-osxuniversaldebug.zip",
        sha256 = "f3c7bd35874fd20c31e7fcb65e97710305c4744d87cff2130596c102f02139c6",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-windowsx86-64debug.zip",
        sha256 = "3df01ae95e8ac23622abeea693bd30091f86aae881397f015e02f2fe558919e6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-windowsarm64debug.zip",
        sha256 = "822757568070e73e0b323522e531e65cd8993212fc18490dd9c4b224f8af7188",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-linuxarm32staticdebug.zip",
        sha256 = "888ae2524d8b9090e8fbff064d2a640aaa172a4e692b97f817211de7460f5ccc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-linuxarm64staticdebug.zip",
        sha256 = "4d6191b9b1d4d6015405251e7faf1efc8538429da51191d9be3836dfc8d9660b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-linuxx86-64staticdebug.zip",
        sha256 = "5a5fba9c56dac41a2c2205873ae2281b38d19a9fffc1ca576315fae509ddd79b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-osxuniversalstaticdebug.zip",
        sha256 = "c6cfdfa136c7ea8aecd6a5e6bf5c031a8017c6c106f4a8ba44941ac85e7a835d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-windowsx86-64staticdebug.zip",
        sha256 = "2c8d139005d49d8abd138eebc50327145b99310cc320ed157a8729681b4dc5c5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-windowsarm64staticdebug.zip",
        sha256 = "13994ed03df6e19989526029ac4e238a1c18256f61e93f549f27bca211fc24ca",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-linuxathena.zip",
        sha256 = "9f283c039c69c2a51f7cdc050f315b458dcba6760f600e52c9d76ffa3fcf3cee",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-linuxathenastatic.zip",
        sha256 = "0d5d72d3db3aa0b49aaedf859f63b8113bf893ec424b1c8ffc8776a2e56f84c8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-linuxathenadebug.zip",
        sha256 = "0383f138e21b2c1244e97ee58be60f532cc50569c81e85659bbff514b0320cda",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.3.2/wpiutil-cpp-2024.3.2-linuxathenastaticdebug.zip",
        sha256 = "3af4882b73744c44c29a36d03fd2d1345c1a247be85b16316a0979e3a7eeae2a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-headers.zip",
        sha256 = "74066a02ab4b274719d3aafb9ff5714621319a8e6dc61c0fdec550d4fa140faf",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-sources.zip",
        sha256 = "df52624280dde86f1b2d285278b96dbcc05e8a1a6ab2ee4ec2f1c245827f30d3",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-linuxarm32.zip",
        sha256 = "cd7456a8518ccf18a8418ea0fc21f2eff47450b5e174834dd766f31a602dfd33",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-linuxarm64.zip",
        sha256 = "309a0706665566034e0473e8d3cfb0f4a07a0cc9121512fe4e575d512b77e995",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-linuxx86-64.zip",
        sha256 = "da443761f9804871c895455b1287f3c8f960d79c58c8a586067fdd66cd7daabd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-osxuniversal.zip",
        sha256 = "16a0cf22c01a3ccf6623678ea6ee45dae4b5166300c314c585822a8a67bb0137",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-windowsx86-64.zip",
        sha256 = "de2fef4af0c63ddc68307ad4f75b7d53b04c3a7d941319c7b8c7f31660cfda8b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-windowsarm64.zip",
        sha256 = "4fa59514c35aa97a5ef0ea155abdb0f44d74928f43f69bebc5e6feaa4b9c2a91",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-linuxarm32static.zip",
        sha256 = "5a165a85e15476090beb0032dc259f5ba2533071f257c55a4fca3fe7bbe84146",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-linuxarm64static.zip",
        sha256 = "e048ed72253820fbf2b73d3a68bed9f9354d560c666ea8ff48afbc6da0a2ada8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-linuxx86-64static.zip",
        sha256 = "fe90b28a5ed403a2085eb41164666906ef5d20ce745a583240f9ea243c6a8b4b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-osxuniversalstatic.zip",
        sha256 = "a78e05d6397eddfa2640cc39cf07f5a63be8b97f5bbedea875cf3450f16e01f2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-windowsx86-64static.zip",
        sha256 = "c200a7e3762e606e4eff7944da55ba75c23baf9ba971f910b318428be8e4c321",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-windowsarm64static.zip",
        sha256 = "14ee0e1dab923dbd39f7232569092cad17b4d9aeb439bbac9924b32c7e4ecb7b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-linuxarm32debug.zip",
        sha256 = "fe732dcb1bf88fbd1fe0e95a8e0f468e2dcea9eacaae1513199ef39dd6ecafb6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-linuxarm64debug.zip",
        sha256 = "17e46a84e2094442ae77d237149aa41cc924a5dea8a2fd17213f7159ad791edb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-linuxx86-64debug.zip",
        sha256 = "beb064d30bf1f40bb7f995df742cfe705968eb0b8a940b7c8424aee80fe9d4e5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-osxuniversaldebug.zip",
        sha256 = "7d16ea28bbd3a714d5a725983677be86d62f4868c967459ee11f2dd4fe26cff9",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-windowsx86-64debug.zip",
        sha256 = "c3c688805ba5c9626dc357cc53cfb3c27ae067e0ddd012f7144b8775543792c2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-windowsarm64debug.zip",
        sha256 = "68785768b879dcafeeb46034e3b7f24954635ad84ea89be4c57f8a16d5cd5674",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-linuxarm32staticdebug.zip",
        sha256 = "62e286c7e98af467b18806cd32ff6a9aa9bbb7922c925a9ffbed4d584dc8d954",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-linuxarm64staticdebug.zip",
        sha256 = "9cf8628d0cad67c06bdcc8abefdb9aaf78edcc1da91045b228083db212fa92a3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-linuxx86-64staticdebug.zip",
        sha256 = "4cb1e796e8acc62e326241ed42a2fbb2ac8c2ffb2c6a3c751365065cca207fe8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-osxuniversalstaticdebug.zip",
        sha256 = "f46e79f57569911800a0ecccd3522afb500df42e7df2b0cf0826351e6e3c8b48",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-windowsx86-64staticdebug.zip",
        sha256 = "8a0b868ba2c9a7e588b26759d8acaba6991b2cca666821e1691cec4c0c7ad338",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-windowsarm64staticdebug.zip",
        sha256 = "8c8392da9e3febe98f307a86e7533b9bef9887703ba61bc16ed0b6c79ca9642f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-linuxathena.zip",
        sha256 = "23b3acced7b07c084a63c1840e77df8e0e9d75295f3d08ed0b18f55cfe5030be",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-linuxathenastatic.zip",
        sha256 = "1e3faf0333bcea02eba57d952da888f67602a408a14499d5829170f990e864b7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-linuxathenadebug.zip",
        sha256 = "4fdd36cb354d90ff9326b3478421c24caca170ff250df4f087b5271fe4a6c032",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.3.2/wpinet-cpp-2024.3.2-linuxathenastaticdebug.zip",
        sha256 = "6a2a0d64404c70d789c39cba2243b4a54b2e03503c0e27f47471089991e7ae13",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-headers.zip",
        sha256 = "668455010c7d64ba48b413cf3da4fd582d74273c6d421f6d66e94869ee1ea4b7",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-sources.zip",
        sha256 = "67be60384bf4f2e84ccecd614c77964609fec2560b65d82c21bed04b74f174ae",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-linuxarm32.zip",
        sha256 = "bb2c421db89dc689748b0dcb9eb354e5885b4463d637027e79578de3cf710321",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-linuxarm64.zip",
        sha256 = "02d7ef7585177ecd92b4a1893163337217f594ddb89f1ab40a28b8fbf8f433bb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-linuxx86-64.zip",
        sha256 = "97afdc96fde5db88bea05e6ffb3f9020c883b98d2d36c6fb15e0f2740d6dc248",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-osxuniversal.zip",
        sha256 = "4d7390a49dc142c177606c409d16d9b5a0260752a12f5da555572a4b5746dd64",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-windowsx86-64.zip",
        sha256 = "76ac04d74cbf6e755cb7c1aee629fe51274a2c69961d8f306a7011ee1897eba3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-windowsarm64.zip",
        sha256 = "a7d6ffdad5244da14160924398bef00038705334d57f2322ff5ecae98215f25a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-linuxarm32static.zip",
        sha256 = "6ad68167811e499293971a8b9b3da820d70127194a4e93038964a9fb0fcb7909",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-linuxarm64static.zip",
        sha256 = "9a65f41825ea0c5234794e8145656469f2658f2f793a753b6439aad98ff35c00",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-linuxx86-64static.zip",
        sha256 = "a7ed03a6710cacd678fbd1e14b12e1b6b5a20b9fd20f26c0aec0e9c17f5fa1f0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-osxuniversalstatic.zip",
        sha256 = "4160f8540f2b2492a3d39329d66d29a89ae8a5070ef2b2b47cdfa8fb08de3423",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-windowsx86-64static.zip",
        sha256 = "5e16f9b0cb1d9aa3996fcd43462e90d91535748956c135df07b99b2ef2cf969a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-windowsarm64static.zip",
        sha256 = "f5a503b63b3459e8bffb0f38a86ebae8eb2977e53a66e8102adb98f6def27651",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-linuxarm32debug.zip",
        sha256 = "1b4e1154cb0ee31a276ad6649ab82750079cd29432f7d59a6e2fed57a7dfa8d4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-linuxarm64debug.zip",
        sha256 = "09fa5741e2afffeb29223fba0c66fdd64ca1dbafd35856f4db4b7ddc8253bed8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-linuxx86-64debug.zip",
        sha256 = "900278a7f816b502632b83aaefddb537c5852809dbe9a1bc8d2bb9ca47d56f35",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-osxuniversaldebug.zip",
        sha256 = "613ca2352728b0bd204e40bd4e0f3c60b63337e4ddd3cd355a0aee78ae90c930",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-windowsx86-64debug.zip",
        sha256 = "f6bffcc3dd62b2e905845218b8770b2a4240b3513f2438d5d9055fe48a34e8ba",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-windowsarm64debug.zip",
        sha256 = "61c84e33f8a29f4888cd84e7f3a52ede9e6dc3b6e812240cd392eaf5e9cc4fae",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-linuxarm32staticdebug.zip",
        sha256 = "051e121ad48efc4bf38165836c68900c2ca8aa923bed89849a38e0c27eaf4cda",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-linuxarm64staticdebug.zip",
        sha256 = "f0f211bb75ec1dfe80167e95f051f424e37120870456bebf2f2c7b69a8dbaae3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-linuxx86-64staticdebug.zip",
        sha256 = "d987e5cc1921676fd527cf0994fa0c8ddab7e748f00cb953e011c026efe1d5d3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-osxuniversalstaticdebug.zip",
        sha256 = "97625c648e5bfe89d50cadb3da4e460cc3ba90dc1cd56533076a3eb6c63601d1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-windowsx86-64staticdebug.zip",
        sha256 = "f4549a6c786d067e7466377e063a4a238f3061ef5cb1e8a22086da0d58a0f11f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-windowsarm64staticdebug.zip",
        sha256 = "0398a8c242f9a3b0441292fe76f176b5d5921136768f1a7b12fab0e5aeb5cf07",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-linuxathena.zip",
        sha256 = "01518c5224f7b12cb1eac2df0b74198e21daa60d05fc21137625db0f8af5a2eb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-linuxathenastatic.zip",
        sha256 = "63bf9715c485139bce70f2d4831b0925bb1f67d4b9dc25a8c4c20d4dbc00b4d1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-linuxathenadebug.zip",
        sha256 = "42c4e8bac2f6557e958a37e0aec5ee5f8e086793738526af1195f1db9b10e8a6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.3.2/wpimath-cpp-2024.3.2-linuxathenastaticdebug.zip",
        sha256 = "522229889c0aa7abf8b0619c9c1cc9f14ab0030b9d9249beb4de734e4bcc54ad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-headers.zip",
        sha256 = "1b0ef740ddf87b8d350b3ea7b1247014c1873dd8f19f78ca32e887547fd48265",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-sources.zip",
        sha256 = "a88f980dc9b8f5e6f93f7a17d6c133685f641922ff1f3b95eb083a4be65f19ee",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-linuxarm32.zip",
        sha256 = "d237bf8e273c303ce9b47cac712fb8cf58513d8e26e144aaab8c85f259814d67",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-linuxarm64.zip",
        sha256 = "21d0b4c9e18f925198715020a256fa48f689233dc92d1829296f56543db3798a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-linuxx86-64.zip",
        sha256 = "5917a63016451abdfa531a4d3d820648c59c4c9447aa672a8d59a3607afdd073",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-osxuniversal.zip",
        sha256 = "c56c31515a8aff7955f1d24cde3c0ef4cda988d0ef4c56afd676e3cdf450ea06",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-windowsx86-64.zip",
        sha256 = "219d4bdf2715adac62bfefea628942e6a2828cd67a144fe26bab7f7ca39bd367",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-windowsarm64.zip",
        sha256 = "616ae4f2f708faa099f9ba45b9da21a7343528cf4bf7a147c1c05ec30192fea9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-linuxarm32static.zip",
        sha256 = "0b4bc3d353c2b67458436d56f81775325ffd291b276d7086b61716d76123136e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-linuxarm64static.zip",
        sha256 = "c04f3d3ef2ea80f1a027f8551ca1818684bb7816da8a362b5856df9ed428a132",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-linuxx86-64static.zip",
        sha256 = "eda5971f2b7bf47c53209a93abb0a9010442767a8b319046d2ee649966703e7e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-osxuniversalstatic.zip",
        sha256 = "b24a07715370319654b84f9ff3e5e1920faf30f30f17fcbb3db614b8418ffdb6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-windowsx86-64static.zip",
        sha256 = "3e9e0ca6f17c1633d86e16a9f9a890a5f3ceef34af577d1ce201ee608d142d33",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-windowsarm64static.zip",
        sha256 = "746d4da95bbedf848a6e4f87bb4e4c5eb430422aaa0d3aea68b61ea608c86aea",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-linuxarm32debug.zip",
        sha256 = "51321e0a1927b03ec2442dd6abe2e4c5cd1b99a222b56c869b804545c2474cea",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-linuxarm64debug.zip",
        sha256 = "010bed86ea3399d1d3688dabc289c46b8ced50c489edc53e938fb8693efc6bae",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-linuxx86-64debug.zip",
        sha256 = "5620a1d9ea7a1c715b20f7fa689099665a2266b9ce3e416e38302d19892fc5e7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-osxuniversaldebug.zip",
        sha256 = "3b3cc5c686e73cb021fb3b29b31ccfb7ad9fa110516b3c7f746cfa42c36a59d7",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-windowsx86-64debug.zip",
        sha256 = "f8e2700f4f7fd1617aaeb406872d8772ae06a1a26c56f2f9a8045f2075409eef",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-windowsarm64debug.zip",
        sha256 = "9425a1b020a313e60d40b589a08d2e7e945ae1cc13a3cbccf49c241754ce87f9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-linuxarm32staticdebug.zip",
        sha256 = "cefb220a62382c7ad983364890b211b71a2401dfbf2430eeb8b0fd5f628ce975",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-linuxarm64staticdebug.zip",
        sha256 = "896f11ee263150fc9628002cf1729a0c7a86a2eeb866e44823a1ad2f5e5976e7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-linuxx86-64staticdebug.zip",
        sha256 = "144a6d01dc0d997aa855d31a55727cef94e6e64f842342bc666cb4d0a0a46e59",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-osxuniversalstaticdebug.zip",
        sha256 = "61cbbbc585e336f5077bff1057220e945df929d33d772d09256a17ca9af1e009",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-windowsx86-64staticdebug.zip",
        sha256 = "28db0bc074dd06c2e10be4fdc9f9125e6fed660d57ab1e36923611f1c28f776f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-windowsarm64staticdebug.zip",
        sha256 = "625d8d322569c3a2071bc6da69319e48ed8a82c3d2898205f31c4ab0a62580e8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-linuxathena.zip",
        sha256 = "de1554e22146e8b52638c76bace81f22a8cdabdfcad3391daf9d8db710e9c61b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-linuxathenastatic.zip",
        sha256 = "1481b0a6cdd590231c6a22417d89daa579e462ce7b2dcf4b4cc0b5c254f6d397",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-linuxathenadebug.zip",
        sha256 = "7ea2db860f9bdd436926f5cb867af295edb6b07724d39ccad0076769f7f9508b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.3.2/apriltag-cpp-2024.3.2-linuxathenastaticdebug.zip",
        sha256 = "f9c67646833cd504c8b60fe395b6c14684d1dffc635e5f7da0988d47740c3947",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-headers.zip",
        sha256 = "5dbd4ffe68fbf942b73fc7dff6f6478343aea98a9f0778d8bbcecb6d40d8f431",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-sources.zip",
        sha256 = "38a6a6fb132c44c8a82339941d397eaa2cb59b43ea86a0a17087c1a7272209ad",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-linuxarm32.zip",
        sha256 = "d6fe3f1e63d1f4c7cf5e8110ef27cc964dec4daff8f5cb929d65cb9acee1e34d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-linuxarm64.zip",
        sha256 = "15f12e536e48cb28708a5493b9f2eb04efef4373ff5da2ac7d633c7047883634",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-linuxx86-64.zip",
        sha256 = "ab0d06457100bbc6578703b54468c8fe22d5041f90bed4f0e73250198d0c39f4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-osxuniversal.zip",
        sha256 = "9b6692dbe25891ad1bcbe5a39c45c0ab584f74833c236d55414afa18bc5f5ba3",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-windowsx86-64.zip",
        sha256 = "295fe768609663b7e8580c99cd21460c31e93455ac025e30152b920cff2e06b4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-windowsarm64.zip",
        sha256 = "1af1b1304e8e4758a524c5348d90e2c44484dff166b8cbc3e304c1c305ec6c5c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-linuxarm32static.zip",
        sha256 = "a0ee71c34e060d4ef000cfad593495bd4e2a6bef363c52b5185c75b05471f2a4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-linuxarm64static.zip",
        sha256 = "aaafaccf7d1cd695bb0e851e44abc6b93581ea8b1a53b07c6769d887f1f21aee",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-linuxx86-64static.zip",
        sha256 = "6339213b09a30e9f28f99f3c298d9a6176153595b3aeb13af7cbb218a0c37693",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-osxuniversalstatic.zip",
        sha256 = "a0c29a4ec1dcb934a3695449db1fd5688c4349bf5a353c4195aef18ea90aaaa9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-windowsx86-64static.zip",
        sha256 = "3b25f6d07353fdb22eee7462f7a669e3c31466c7e8428c43c0e54cf6a2a32420",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-windowsarm64static.zip",
        sha256 = "c04badf294dc35e1633b7d6831b5ac40d341eb42e437da1695772d3e658b1a60",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-linuxarm32debug.zip",
        sha256 = "7497491a89458831a5f4d1c2f9b142d366da9ceeba7abf473bf2313f475032fb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-linuxarm64debug.zip",
        sha256 = "a6470805082f9f279527decf3e5572bda3e288f0878eb241443cfbc1c5d6d7a6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-linuxx86-64debug.zip",
        sha256 = "b5365a2555f4d17cd72d8fe4658b5d008c49632bc4ee86f8ceb8bd4ae900d8e7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-osxuniversaldebug.zip",
        sha256 = "e966f850bfd3595f796bdde1f6961cefb54d0e726356f9d00676057d7742429d",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-windowsx86-64debug.zip",
        sha256 = "88648d6bb2a422d83a5b4f29484c521c10f074b12e9aea4bea035f169657ba29",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-windowsarm64debug.zip",
        sha256 = "25ab3c8d582e7c8eca73d441322d71e4811706c6b6b4678a44aafc7cce529ee0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-linuxarm32staticdebug.zip",
        sha256 = "85d7daec2873fe1e43ddc532b482a880959bbed8edce90695b5a32674b1e21cf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-linuxarm64staticdebug.zip",
        sha256 = "039c0c2536964b048b117c6cb8351109a5b2fd65aec0ae49de7b166c5b0d9746",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-linuxx86-64staticdebug.zip",
        sha256 = "323ad8310d1b2ace94d006a1b799d1fa33281656d27ca04c57638e047b7974a2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-osxuniversalstaticdebug.zip",
        sha256 = "ce81dd64bf3bd7ad942f6a0b86ac0be824bae2c22667d8a32a3880c1d1f9ac30",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-windowsx86-64staticdebug.zip",
        sha256 = "a8a883ffbe285e13477935f203dfea1514ab5258acd5e36d58e2b21e7f10aac9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-windowsarm64staticdebug.zip",
        sha256 = "adfd6f7b2b87efb1ecb393dace2ae35cd5752121c01eeaeea62748554e060de6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-linuxathena.zip",
        sha256 = "af1c27bada6165060556e0f435e90d676967988cecc837a2b05be7eff5c18d74",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-linuxathenastatic.zip",
        sha256 = "3045b9a5e0f9041c90e26ac6ea9fca9df147634864fc29de17ea0c22b50151a7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-linuxathenadebug.zip",
        sha256 = "16db4a1d355185dc04571c04ad5cd8805ddf99a68fc2f0cdb7d7d2010adf61ed",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.3.2/hal-cpp-2024.3.2-linuxathenastaticdebug.zip",
        sha256 = "dc1781ab62339b9f61ded961530b0df27e64e091331959919f5ef98443255cf6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-headers.zip",
        sha256 = "769a558157a76c28b127379074180c47aac2886ab66d0b3a3df0baa9f83d7a59",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-sources.zip",
        sha256 = "baa46541c45c48f63b9ac30dd562871de27740ff3473e9f37b61c3f29c66b135",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-linuxarm32.zip",
        sha256 = "ee4e68bde04da806aa711ab813c867d27a9626e5a47173ab5a950f03b1750517",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-linuxarm64.zip",
        sha256 = "3fab7fe90aa36ba550dcc4035e312e5f3d08e7e1e70b4aed4138db3234793627",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-linuxx86-64.zip",
        sha256 = "1b34267202e99f09a8f65577aab72a0e5562688f9c0c0bae7229c7c515d2f1c2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-osxuniversal.zip",
        sha256 = "ab42bd5b99fcdc30517db74b89c2b96dd5dc42c4578d4c02e41b7f9e104d1f30",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-windowsx86-64.zip",
        sha256 = "4a3e729e7105e6327ec24484f022a795c6f112d515b7be16a9fc03a756bd1640",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-windowsarm64.zip",
        sha256 = "b21fba7557783e03a895b194165db186014642a96fcffc395955764314f28fe8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-linuxarm32static.zip",
        sha256 = "f3c5c326faeaead513bfc9c1273c5efc92820101fcbba6ef5a4dbf98361296b6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-linuxarm64static.zip",
        sha256 = "a1f2f75dc4bdaf859a7a079d5e582b1dc65426dab438be104c9ce8b6ea975e05",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-linuxx86-64static.zip",
        sha256 = "3e460cce71fe9de1825e67a7af1d9817ed0e6e417f1d5a27a020ab9d97f101d9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-osxuniversalstatic.zip",
        sha256 = "ccf9c16b9e969f46896c23df649111bf81e56efefc5a3e484c4365725701c9d6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-windowsx86-64static.zip",
        sha256 = "c88b7a9c97b840b377c3240cd6df865c7b020843315f1f2fb6e6110040ff543e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-windowsarm64static.zip",
        sha256 = "5df51d14fc528259473d66572263e69182d964f82cc4a3158ef6f7d72b00e815",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-linuxarm32debug.zip",
        sha256 = "29fe4fbd8a4345ca3da0c316163c913dec8dfb1203f738768592250242211cf9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-linuxarm64debug.zip",
        sha256 = "d8673d6bb2901518f3796e841394f52dcc313bc300dda68502fa04928e1d2a4e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-linuxx86-64debug.zip",
        sha256 = "cc2a61416698d6fb0c45616a50b950dd73efcf59c129e634f368545b24f47b32",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-osxuniversaldebug.zip",
        sha256 = "4f1e45275aa9fc98f6511f2b2015a30eed25ee44564c512669cb0e00c936777b",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-windowsx86-64debug.zip",
        sha256 = "564e7167e4d9599018d584cee92f2e9d45a23e295a909faab340f96daa6aa3bd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-windowsarm64debug.zip",
        sha256 = "10d91cc0cf7c58b5a076a4ed2ad844099b8c4d043d306b6a7cecc2fd5536f1fa",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-linuxarm32staticdebug.zip",
        sha256 = "5f7fd5b2e62bfb2d793a96348250de7e0e07178d9d5c05fb9fac4e8bdb10d072",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-linuxarm64staticdebug.zip",
        sha256 = "d6921ba20dd926d15ea90f9d417fca51dd02120c6e9e02da871232cf1886583d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-linuxx86-64staticdebug.zip",
        sha256 = "8e1a8d072bba97cc1ff0c256470c2d2a87eb1a182b35236c2b26df1fee2386fc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-osxuniversalstaticdebug.zip",
        sha256 = "5f2f1fad5b8cdfc50026cb04900db3b9194e6556c4bd4ee6d206b2468914ecc5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-windowsx86-64staticdebug.zip",
        sha256 = "3d0e7da98e3cd757919da861952219487d2b74bbeed18837d2fcf87e671e8a8a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-windowsarm64staticdebug.zip",
        sha256 = "ced516a601a84a64e04c797cdf91ed646c09cded88277ac7e850eade7ecef398",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-linuxathena.zip",
        sha256 = "63b01e220bb93eb3a6ec632f8589714533d0fade697cb8d94e4b68e308a55a53",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-linuxathenastatic.zip",
        sha256 = "38a38ed1e2be651e4d72bce65f2824701b4cb4fcfcce6118b82a29fe7bd2b80a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-linuxathenadebug.zip",
        sha256 = "ee6c34c4ae67aad7169f48e22a369f6089cb296c6a09c391b01672e872ef31e6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.3.2/ntcore-cpp-2024.3.2-linuxathenastaticdebug.zip",
        sha256 = "f05dec58fc62f8e676ef440c023dca199068dc9815977b5cb95addc1ffc9b06e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-headers.zip",
        sha256 = "968b7d3587c3a78d8daf4c19f62aadb14824fcb85bfbb82b36dba2abc843a941",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-sources.zip",
        sha256 = "3fbcbeb58515da4c7a6a130b43e281f711c2641da2459cf157ef9b3c390605d5",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-linuxarm32.zip",
        sha256 = "6495b1c30b9bce96d35f30186289e3472896c958825c5cbda32fe9f5e39123ae",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-linuxarm64.zip",
        sha256 = "1f97876c4ffb583cc563dd1d2347d313037445604d329b60d9773a0043324ec0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-linuxx86-64.zip",
        sha256 = "7ae2bbfba721b81b715cd825ae7ebbd29fe5c11689d0a36058e166ce9930062c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-osxuniversal.zip",
        sha256 = "4248b5a277f5ced6c8e345183ab213fcaf0db9b8cda3a282d6208190b7caa0a8",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-windowsx86-64.zip",
        sha256 = "75b5cf76f58f430606d841530511515bcd83ce5c32b51f63ecef3ebc48cc6c49",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-windowsarm64.zip",
        sha256 = "4aa4d3a0b5571f95cd942fe3ca1c5489baddc9b3448b85a450615e204b79fdbe",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-linuxarm32static.zip",
        sha256 = "f1e0e958747bc32b5df53009fb119c453ccec14b3909cef2fefa29c8acb9c4ca",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-linuxarm64static.zip",
        sha256 = "55f39b769cb00deb0b2dc02c432b0067b4d7d1b9e307fd18bb85ac03514898d2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-linuxx86-64static.zip",
        sha256 = "fc990083acd64677f9036ff43ec38d8e62e2add3ca34fe235f6b4a1fcf8f9ac1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-osxuniversalstatic.zip",
        sha256 = "fc427f04475948dd5e8556273b95a35a4c58f999edabfb052007502aec66316c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-windowsx86-64static.zip",
        sha256 = "4b547e7c108006080adec579e5b09516cf56fbb84acaf22887a81707a0138db4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-windowsarm64static.zip",
        sha256 = "08bbeda01a41540d934bbd00a04ce2e8dd2d8c67ede89f332ead0fc743f2b922",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-linuxarm32debug.zip",
        sha256 = "c49cd9660b2f0e8a1a50c03f4df7ab9e7aa08ffeae10a9cffdd6d66b1a01b7ba",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-linuxarm64debug.zip",
        sha256 = "32ae02ded326edabfc10f28ed4b3bc818fa1c42b9359ceb7bb164ab97159ca3d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-linuxx86-64debug.zip",
        sha256 = "a256918bbe84414f1e24186ea7af9750d81651e7ecf61582205c4b4f8424f3bf",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-osxuniversaldebug.zip",
        sha256 = "1746c0761b7301c2cc10f5289c4e34532625facbc9ad75d690aaf87232702191",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-windowsx86-64debug.zip",
        sha256 = "85d45927e4122d53aea24f1ae1620108b9330456e45344285482d6fadbabbbb1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-windowsarm64debug.zip",
        sha256 = "feab342b9b621446007f6c3adc4e2f025b4d4c64d7189357bc68ab9fac9a8fad",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-linuxarm32staticdebug.zip",
        sha256 = "0cb65c4649ce34743170cc612e5a3beb0665d6df1ea46b6bf7f14fe36005683e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-linuxarm64staticdebug.zip",
        sha256 = "8a8d73ec7d413ddb3a7f0ce04bbed5e5f41f61683977814b47ab40895f9a9516",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-linuxx86-64staticdebug.zip",
        sha256 = "8b180f7fefbf288f4c2784632caea4bf78a5070e44391eadb85777bf00e7128f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-osxuniversalstaticdebug.zip",
        sha256 = "035a4d4a2da27d20b123286e6ea72990ed39966354f66532cddd4e73c0add8e8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-windowsx86-64staticdebug.zip",
        sha256 = "2cf202a750dd15a36ca1d74f89479edff0d314450374b914d2084c072b17ce70",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-windowsarm64staticdebug.zip",
        sha256 = "044f7d75ffddb295c0d31d3a04ac87619c22f3f6b02d820f62b7b1299e96a533",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-linuxathena.zip",
        sha256 = "49219b84e7e322b9bf928cd13f108072bb2a8d18f12005c43f57152599fe41bc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-linuxathenastatic.zip",
        sha256 = "88f864238efd416b603d2736dd270b43b7fffecf10c1b4f101bc063a078a5bc1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-linuxathenadebug.zip",
        sha256 = "6738481e7e3592fdff0ca7c466d30c2612719fa1cf718b7c7feaf8d542456850",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.3.2/cscore-cpp-2024.3.2-linuxathenastaticdebug.zip",
        sha256 = "54a0f0862386162057ba8efc5204e45dc54b31c7467c7e9cee35686fe001a3a3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-headers.zip",
        sha256 = "a02eafadc88d0db286b84a5272a3c38035753f30a32e59b1ac4399d0b3da1936",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-sources.zip",
        sha256 = "ecc0f3c85cfc4c1cad66b977e860fa9e06673c4c70f7770471cdb167c0adf98d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-linuxarm32.zip",
        sha256 = "4d8901639529105437f64b32c12aa00aaedce4eeb5b1e2ee6ee1417d089eedda",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-linuxarm64.zip",
        sha256 = "2f8cca18077391b3361d02f677c3e10ee8e38e704131266dcf13d8712866c75e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-linuxx86-64.zip",
        sha256 = "c518c0ff85a754c6dffdd4e6c931cd9b7188a9135682672a4bac0f43d93d1a61",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-osxuniversal.zip",
        sha256 = "8e96329031a75b53a1dfa7a5818b6623016eb438c4fffca18924785276800389",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-windowsx86-64.zip",
        sha256 = "f88fa2e5192ac851e3bed2c0d93e3bcfae11c7957eefebf9c1b680d75b282774",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-windowsarm64.zip",
        sha256 = "bc34cf32ff397f47f062a70607ce9e26e66d33dea4365a98cee98770dd86e589",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-linuxarm32static.zip",
        sha256 = "2636aa35c21d4e0cbd2a575f643006a5e39d793509d7a5b8a637e3bf38e27c3e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-linuxarm64static.zip",
        sha256 = "7c679b9792700b15ee5ac9a96af5971e1071bb1b26c716368a46e9f70842a101",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-linuxx86-64static.zip",
        sha256 = "9d51884bf97c92556ea7cec7c06d2fbf060432ab3cc9818603f622e9b45505e1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-osxuniversalstatic.zip",
        sha256 = "c4ecb75ccbeb2b9c9eee3501575ce060c12f70fcd23aa336a5d2e897f7cd3b08",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-windowsx86-64static.zip",
        sha256 = "99b2c91bb16c9c967e0a9bdea8a53b1cd6e7a01d632d2107a4315a4a0dcaa479",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-windowsarm64static.zip",
        sha256 = "83326fafe48733647017093b2f8a5bc9068307090e57ce4a8eb16c154881a22a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-linuxarm32debug.zip",
        sha256 = "e39306e53106052994bac4e4776abfb18081dd8bcce16a5a485ca48898eb6316",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-linuxarm64debug.zip",
        sha256 = "ab290d4d2748f60a04e47ce1a96bccbcfb214585716b3b44d0817e1700011d76",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-linuxx86-64debug.zip",
        sha256 = "ab673142d16d45a9455d5792b816c05fd7a9c3cf380e7b55eed469f6761804dc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-osxuniversaldebug.zip",
        sha256 = "c0661a2d3f2cb14b579ffd498969d8fb5dbcc54785f041bee22ab094d8b2f559",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-windowsx86-64debug.zip",
        sha256 = "f1213be768608c0358dc569c8512024c763637a8248904e7dcb0d36d792d8d7c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-windowsarm64debug.zip",
        sha256 = "ea694317246c716488f1383b3fa8d78d0e00749d195044af679cdc55eea81c9a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-linuxarm32staticdebug.zip",
        sha256 = "6d1247d6c96e02f29e964cf38389fff1b90234083dfb23b4f5b95f703e411813",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-linuxarm64staticdebug.zip",
        sha256 = "659ee752911764952cee5e6989e212f539d55e658e63ca3e8ecd0f3616c89c08",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-linuxx86-64staticdebug.zip",
        sha256 = "006fd5f7c2a9b4033e25ee2fed27b2e0ea228176e95e80ab921ca73b908de0dc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-osxuniversalstaticdebug.zip",
        sha256 = "83eed841b665341870ed129fe03d1e1a3b5a8ace684f712ecc2a5d63a82c5ac6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-windowsx86-64staticdebug.zip",
        sha256 = "6a675fe2ce7a1d5f91e6e67bdf57552d832b15b171e413eabe9738af354faad0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-windowsarm64staticdebug.zip",
        sha256 = "8d4c002dc99ef71e42e0a57abdb7a401cd12b17fdefc6600972f845b1ac471de",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-linuxathena.zip",
        sha256 = "507fe91f9191b6ec736e58c4c0927f870e713d5cb59832df4b8eda22ae86ea25",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-linuxathenastatic.zip",
        sha256 = "80e096fd1d08e0cc964374209bb4b8eb5f708dbad22d24e0164edbe3155583b9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-linuxathenadebug.zip",
        sha256 = "a17142647893df3bf0bfa0581cdef7b1a4cb0f91c926f53947ff7930e1cd05c5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.3.2/cameraserver-cpp-2024.3.2-linuxathenastaticdebug.zip",
        sha256 = "6b57aa8a4d47cc2f67263b6cdaebe72a59438d6447e52014dbbf87a50f1d388a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-headers.zip",
        sha256 = "03770f6b62d8175b6702cc18ffb8383cc721061dc6ac77b4ecec57fed48f11fc",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-sources.zip",
        sha256 = "a8fed0f14219248c8fcedf804a3431c3adf2d0fd73c1a12074f4505719ed3cff",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-linuxarm32.zip",
        sha256 = "7bf33240c83ae3661a6de785340d35e02f664490203d470cc433217a2072b6be",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-linuxarm64.zip",
        sha256 = "8a1a757c489ff9b08bf534d05e98cf9234ba9cef702448957483221fb2149084",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-linuxx86-64.zip",
        sha256 = "2d499a0082bfd5ec7f7b6b2fefe8c5012962c66201c6bada5c5bbb79134c0477",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-osxuniversal.zip",
        sha256 = "202d8c3078ce2980376925ba68924e6f419b2536cc47d17b67acee573424fa72",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-windowsx86-64.zip",
        sha256 = "54a780033d8d77cb2d2b8ba3ee9b3ce5db3ebe1a4eafca80f3870f80f811c9a2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-windowsarm64.zip",
        sha256 = "9a116cd3b954c46391d19eb0af7f7d02fde3b3b7e9ff4d7ad1ff8ecb9a4150c5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-linuxarm32static.zip",
        sha256 = "8be18882f6a9f8d324875b1a86871a8485f48707b5c72d375dc9f52e51adde03",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-linuxarm64static.zip",
        sha256 = "93623d0d61856d68d0078e597b3a1ca848de91d6c064b28d8f3c6ef218912501",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-linuxx86-64static.zip",
        sha256 = "7337c82a0d4124e095e5ae3595d2f394373095463b5dcd96ed7e275d510f071d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-osxuniversalstatic.zip",
        sha256 = "c92a2b99aa348e1f00767c2ca3e27a8b90bf54c1b5a13ed8967da3c258ac9789",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-windowsx86-64static.zip",
        sha256 = "a9a8ce209c9eaed68c0d9ced6214647e7b3291f27c562f5fe417c20daecdffc0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-windowsarm64static.zip",
        sha256 = "db0c73fe607b673f1ea3fbdc84c80cf541fb88cd1371e876b5485e387b9d7e80",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-linuxarm32debug.zip",
        sha256 = "bef86c52892bc3d1bb10ac30e2b2fc35ae7eaeb7a901e2921248a6cfd6990163",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-linuxarm64debug.zip",
        sha256 = "3504141c3421e1ccca1f55b4fef4db858fab1f064b6a79f55c66008ff9328aca",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-linuxx86-64debug.zip",
        sha256 = "8556844d04e978dbf7e1a4ae56b8090ac1f99f3b0387005b3d9cf7a087d433e4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-osxuniversaldebug.zip",
        sha256 = "8bd0b5d2736f4fb346a308abe6279a50fdef9a0a0cb3e88049da3efb2acb1742",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-windowsx86-64debug.zip",
        sha256 = "99c9fc1a0e0b5a2e7715a2fff698b105a90f018c49bf7f283d4aeed5d38f47f8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-windowsarm64debug.zip",
        sha256 = "24e779ab3319bfb448775f7b233bff1d55c28b8b73c443dcf7bb6bcf3ec675c6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-linuxarm32staticdebug.zip",
        sha256 = "5d4b5a4ef752fc8a66ab7629a1f1f5169e321201ae217edc6746a9bc2225a5d0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-linuxarm64staticdebug.zip",
        sha256 = "bea12c34b058f4f81fc2ed60750a08fefc507780c7054c3b885dbaf9493152ad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-linuxx86-64staticdebug.zip",
        sha256 = "5c9cda8dd6e3b3463b5a3a45ae5613d65a704e236969b4f361a69dc8208d5007",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-osxuniversalstaticdebug.zip",
        sha256 = "d75e30abc9cdbdf690644dc42793edc8ea6a6a48b744342aede8425011324818",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-windowsx86-64staticdebug.zip",
        sha256 = "5243cad5ed109a021d81565e26cf0f636592ed1d2cacde10f6e2f176612bf791",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-windowsarm64staticdebug.zip",
        sha256 = "c7974bb14070c15d35bd2f1e03504c655391427bdb6a4ec5839eb2e551631435",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-linuxathena.zip",
        sha256 = "7cba37ef9d99f87f2f504d035a29357a4caa3dcd095a454fc47ed6e89b0a999d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-linuxathenastatic.zip",
        sha256 = "6cbed566b71489676ee1eadd5999b666b5e105c93e9c76c4d6f1ae0e272f3e08",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-linuxathenadebug.zip",
        sha256 = "8df2b7cded062d7a618a732a69e697abc7c38849a543b29ed61af1d83cb9ac5c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.3.2/wpilibc-cpp-2024.3.2-linuxathenastaticdebug.zip",
        sha256 = "19debd142f5fd7cd27b531b32a81cd7f3e8f1f3f15278598536e707957c9f5b8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-headers.zip",
        sha256 = "e77dfbbdc57670203bb1176a2de73d29dbb5f4c172bef122d6fa67efd64888a5",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-sources.zip",
        sha256 = "6b31e8275503904acdcd49581498185c7f367aabb588a342c0ca69f108789d8c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-linuxarm32.zip",
        sha256 = "207fac77823ae88bacb3ec443fe81eb68bfd25c7cae0c35def1dbb04e7995d44",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-linuxarm64.zip",
        sha256 = "fa188f4268870ef6ea07dfbcfac860c6f0ec079ced2b6bf1d7682d327ab78249",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-linuxx86-64.zip",
        sha256 = "c0ca349d92bcd5de0a6353262ab03376b8d2c7eea3bfc659c528294b32f15796",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-osxuniversal.zip",
        sha256 = "72bf91fc1608cc972d7cfbd18662f228b49f14f2858e9f581122cdf521654b47",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-windowsx86-64.zip",
        sha256 = "0ed6bac10953b7b64ef3b871c89e6f2ca47257c8cc73351354c953d1e72facb9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-windowsarm64.zip",
        sha256 = "e72d08665d97fa856aec9562b9dbe0235ea5031a58489b65e4b0e79b4691ff32",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-linuxarm32static.zip",
        sha256 = "e025feb84faf91492dc858d3afa0a55e996973e2c467accf937c9a80497d8c93",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-linuxarm64static.zip",
        sha256 = "8305712f64568decc5711d2c9369b59d089cdac1ab2070df7e9805da6f3b8528",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-linuxx86-64static.zip",
        sha256 = "1a0c284dc0ac76772c1e5e22bea554a63a2e1622abba3c8ccc675ffdcd8b15ac",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-osxuniversalstatic.zip",
        sha256 = "6c2820956ec2f1be543d7116e373f0c13eedee26da0272f9f1734cef2bb174ff",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-windowsx86-64static.zip",
        sha256 = "2120b9f64a344fcbab6f40b28a274af558b7703dc05cb55871b3d3157393f898",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-windowsarm64static.zip",
        sha256 = "d59c737d5d8a362d58fdde94649ed6d12a75538af48db7fc4b32446438799b46",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-linuxarm32debug.zip",
        sha256 = "fdb49fcdc25e9f1b6d4bd7e61638fffc515acccb4f9ec0d48b29a11a8a6dfaac",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-linuxarm64debug.zip",
        sha256 = "4157fb75a37508f076ec65e7d912ae13836a83f5e5086d660119eab38a44a20d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-linuxx86-64debug.zip",
        sha256 = "c961ca9dbfe50407088d29b2bf91cb03d4fbf8f2d9d562a8bd150cf500ded3ba",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-osxuniversaldebug.zip",
        sha256 = "a2c34260e1b13c6fe8f6d07f8ae90e96c033280305b43cf32dc6f477a341f695",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-windowsx86-64debug.zip",
        sha256 = "fc3ebe32def86a5c85e6ea3fb24b846818605c0ea8beca3c4f5ae5b109818ebe",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-windowsarm64debug.zip",
        sha256 = "ef101f7584fe63743bbcd514f41060a731b75128b6e305b5a97f9a11d7711621",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-linuxarm32staticdebug.zip",
        sha256 = "90ffa5e184dd1c6b9032e5c9634d0025f49512d67760129f827b0df753180284",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-linuxarm64staticdebug.zip",
        sha256 = "b8b3f3e65b37e77f992da50eb3dd7c055f211905d72774a97d0e77f6552aa3a1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-linuxx86-64staticdebug.zip",
        sha256 = "bb7674d88f409cf9e843f86aaa60dbfeedaae68cf0a4cabb1988977865cee47f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-osxuniversalstaticdebug.zip",
        sha256 = "61c7395f32903e06d9ceb4291fa5f974f46a5194057b1a0fd715d6ea8cc0eb04",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-windowsx86-64staticdebug.zip",
        sha256 = "9b71a8e4a28eb949e5548e69a847a261031f1f71657ba1022b90671c755e6df4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-windowsarm64staticdebug.zip",
        sha256 = "6dfdbcd0824c6beb77151fe9c6852586408584b313b196efa3d54cb407d38f7d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-linuxathena.zip",
        sha256 = "df9f332a0267747c02a442261504bf560c5c1d403eede186d3dc7201083941bb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-linuxathenastatic.zip",
        sha256 = "7b800f5f54cd33746463885cc0ed19fc80f85ab8accf35f6893d8f0078b7eff4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-linuxathenadebug.zip",
        sha256 = "a24d2ba99fbdafd2dc9dffb8acd9189078f919709e309f0857b7d5c86e7ba88e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.3.2/wpilibNewCommands-cpp-2024.3.2-linuxathenastaticdebug.zip",
        sha256 = "851c1c03182fc159c63b97fa6dce49944b0df9fd919b4a1f1f25f9497068c0c4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.2/halsim_ds_socket-2024.3.2-sources.zip",
        sha256 = "e44e277cf949678dd4b5da46b4cde1ccd6f1ee872f9d34e96f8ff924e12e44ed",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.2/halsim_ds_socket-2024.3.2-linuxarm32.zip",
        sha256 = "5a09bfc5b53e85eb5c5338f3dcbd0093695897a862b9fed31694f84749f936fb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.2/halsim_ds_socket-2024.3.2-linuxarm64.zip",
        sha256 = "ed4dcfe3e78e500bb967e80efe7023690b559d80ab8d29319c71e072fb1970da",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.2/halsim_ds_socket-2024.3.2-linuxx86-64.zip",
        sha256 = "f4ad9fdf3adba6876d5f0c1f0c5fb0f589243d2ff7d2a7a7bc81bd36802d1510",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.2/halsim_ds_socket-2024.3.2-osxuniversal.zip",
        sha256 = "e972342e8edb0aa8885ef44ff2e147029b5272bd6d393c5c838579fbd34c2ed2",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.2/halsim_ds_socket-2024.3.2-windowsx86-64.zip",
        sha256 = "65201c15bd5a2f3679e84733d50bad93249dd8bbcabef55def4aaa17ab1222ff",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.2/halsim_ds_socket-2024.3.2-windowsarm64.zip",
        sha256 = "b4ca9d969866737d2972bfe0d050d6dd05626c72415d76bf0c14a0fdc8bdead8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.2/halsim_ds_socket-2024.3.2-linuxarm32static.zip",
        sha256 = "03761e5e974e6a38e0e40b3baca6d29896b941aca2047bd33a86a3acfe038922",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.2/halsim_ds_socket-2024.3.2-linuxarm64static.zip",
        sha256 = "133c0352356d1627bbca6d7fcef744d7920eecee24e5c8903d7ec73432543ed4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.2/halsim_ds_socket-2024.3.2-linuxx86-64static.zip",
        sha256 = "4c266d1e489a54a8dcffee96f98eab5f49f3b6ca32d7a204322c4dffcab95de5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.2/halsim_ds_socket-2024.3.2-osxuniversalstatic.zip",
        sha256 = "4eb406d62595addca02fa7c03e05d861be968fa06148351a6ff119552c8e12d1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.2/halsim_ds_socket-2024.3.2-windowsx86-64static.zip",
        sha256 = "e290a7e3ce4c3b97397fde8ac2f142006c563c6a0095d1339acc77bf89740e42",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.2/halsim_ds_socket-2024.3.2-windowsarm64static.zip",
        sha256 = "72cb4537770b2bb3ee6ccea66f0fad788694f85dbf5902bb4136f836b62680aa",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.2/halsim_ds_socket-2024.3.2-linuxarm32debug.zip",
        sha256 = "7af5a3876d4d2cc5aeaec2e2248cb85658990c6d321da411b74ee0b7a65d3c77",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.2/halsim_ds_socket-2024.3.2-linuxarm64debug.zip",
        sha256 = "292d3b1f29b4826f5122b91545df20db1917abd82730742f89d2fba5a28094bc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.2/halsim_ds_socket-2024.3.2-linuxx86-64debug.zip",
        sha256 = "8420a5ba5d45674abbbacbfe7f366b0a14f25ba6a578fb195c673be672f7719a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.2/halsim_ds_socket-2024.3.2-osxuniversaldebug.zip",
        sha256 = "b54e4ef95b7acec9770c6204f7443534b8032127965737e11715902e799b2577",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.2/halsim_ds_socket-2024.3.2-windowsx86-64debug.zip",
        sha256 = "6335f4bee216b4f3cd408c06b0ad0f71d8daaff690a544c0a0aef191de4e510e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.2/halsim_ds_socket-2024.3.2-windowsarm64debug.zip",
        sha256 = "dd8bf37b43d669f90694eccd1b6c5b7ed7637f3acedffed7ac0243ec0a4f3583",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.2/halsim_ds_socket-2024.3.2-linuxarm32staticdebug.zip",
        sha256 = "3ee519bf4df9b2e992cfce7f8ec98d7b619e93dd98bd71650bbede564b085e96",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.2/halsim_ds_socket-2024.3.2-linuxarm64staticdebug.zip",
        sha256 = "cf3a41e63359ca7644dcda759c30610e2009402dffededcc49339d062b02a046",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.2/halsim_ds_socket-2024.3.2-linuxx86-64staticdebug.zip",
        sha256 = "774e7485a9f2c58a42b7edd92a1ee2491b9537a25ae92541e214bb13f92fa4cb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.2/halsim_ds_socket-2024.3.2-osxuniversalstaticdebug.zip",
        sha256 = "8f1b6229e2bdc22fe5caf625cf9f69b7bc64f980488f9473aa79746111c556e9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.2/halsim_ds_socket-2024.3.2-windowsx86-64staticdebug.zip",
        sha256 = "ce14faf09ac46614e987546124fe811bf82a6abe1e7d9c4a541a3206a611a3c6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.3.2/halsim_ds_socket-2024.3.2-windowsarm64staticdebug.zip",
        sha256 = "be16b29b4a77f2518fe86168a5cb5083436579b9769c31f3e6b89bc579c80802",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.2/halsim_gui-2024.3.2-sources.zip",
        sha256 = "ffcad9fede976b49c7b05db04b5033bab75d66b027535d1e844c285aafd8d963",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.2/halsim_gui-2024.3.2-linuxarm32.zip",
        sha256 = "6147d4459c94e7a41c28a7362d3c2899b4ef9a78e1940239c2d20e87a8ba5cc4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.2/halsim_gui-2024.3.2-linuxarm64.zip",
        sha256 = "50d57f40dce1c5651301a35dacc22be222bc3486e2fbdd7fe59364d8d84eb482",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.2/halsim_gui-2024.3.2-linuxx86-64.zip",
        sha256 = "cd4f3e5595d142bfc437442ee2ba181684268b4086a8e2ccda32b9737eefa912",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.2/halsim_gui-2024.3.2-osxuniversal.zip",
        sha256 = "559b6f8e400e53a1a09160152d78918b7bcd80cd51b731a60f1c143775c0b853",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.2/halsim_gui-2024.3.2-windowsx86-64.zip",
        sha256 = "f70c6c2e06cc4f42d7eeefe8cb27194e74f3fd3039abe3f2c415b7e705593116",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.2/halsim_gui-2024.3.2-windowsarm64.zip",
        sha256 = "e53a9b915ad968a7c2aff678eec9e0a1cc0df7c96c9cc32ad5dcaf2dfc52b58c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.2/halsim_gui-2024.3.2-linuxarm32static.zip",
        sha256 = "f30bce079be181b3a98bfec82f7aef8aa8c0faaec5601f89ad48c340e370e891",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.2/halsim_gui-2024.3.2-linuxarm64static.zip",
        sha256 = "f84b38dcd41546565e43a9764cd30f980ca6e0c8a42dff8f01be291983134c74",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.2/halsim_gui-2024.3.2-linuxx86-64static.zip",
        sha256 = "d777df4c6e8f060ea12d855f285c7553f05d1cf16f963c22ec45c5e4a4bc0668",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.2/halsim_gui-2024.3.2-osxuniversalstatic.zip",
        sha256 = "e0d31c081463dbef26a72bc7a98931b86419c4554dd85c9cbf5e3dfde572308b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.2/halsim_gui-2024.3.2-windowsx86-64static.zip",
        sha256 = "aa09917a1f3a3db1644eb7513368d8584d9111035e839781af24765e67143da3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.2/halsim_gui-2024.3.2-windowsarm64static.zip",
        sha256 = "c686d3bb0ffccc77d536ad2e3a666821ba5f3460c0a1d3b786b6cf9090c2dfa1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.2/halsim_gui-2024.3.2-linuxarm32debug.zip",
        sha256 = "8bd4c7ac35297247490336d8c3905cf73913742f8719900e8b0a83e4e6fff6cd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.2/halsim_gui-2024.3.2-linuxarm64debug.zip",
        sha256 = "0e0ef9b39a070cd76c29c1cf88fba7264095c5813359147538ac918d9783cfc1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.2/halsim_gui-2024.3.2-linuxx86-64debug.zip",
        sha256 = "fa5079ca70ae9e1b16397758ce04001a1b7a93e10094f77723e17e006e8ad60a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.2/halsim_gui-2024.3.2-osxuniversaldebug.zip",
        sha256 = "b389107ddad94be838bb2bbe3e271d9bef1e31eee662559030ee1f0a6fe22dda",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.2/halsim_gui-2024.3.2-windowsx86-64debug.zip",
        sha256 = "b2170c4c01e1ea5ba37d9a92bbb18ad738ccc9989b7f22f46d9eb5d7adc1c70d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.2/halsim_gui-2024.3.2-windowsarm64debug.zip",
        sha256 = "5eea847196bfeb6c2a1f8b84de1a7463fb9c00e460f8685bfe370e2211df7a27",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.2/halsim_gui-2024.3.2-linuxarm32staticdebug.zip",
        sha256 = "b59b082a847f75460a4723c49c3a58cb7c2b15ba96c7be675ef95ddba92fe60a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.2/halsim_gui-2024.3.2-linuxarm64staticdebug.zip",
        sha256 = "ac4359a483722724a0d7d0a69ced8cc9d9790e782413249a4472f8ce8087a66f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.2/halsim_gui-2024.3.2-linuxx86-64staticdebug.zip",
        sha256 = "c2b1a6c938b2c6a9cc59ddf7b398e991998b444374b2e1f2912960e73a6005ce",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.2/halsim_gui-2024.3.2-osxuniversalstaticdebug.zip",
        sha256 = "b9d5e28385d57a53316608c72e83e8fbbc6c382745c3a1984bc66ebef1759d9a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.2/halsim_gui-2024.3.2-windowsx86-64staticdebug.zip",
        sha256 = "53a56819c70375376a081f7711312001aec07075330a58a744cb55b56dd10561",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.3.2/halsim_gui-2024.3.2-windowsarm64staticdebug.zip",
        sha256 = "5a2a95555522a95b471a5e7f93b46daff438702af66f45d4c96154615bcbbcb8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.2/halsim_ws_client-2024.3.2-sources.zip",
        sha256 = "ce8d96f82ba0125635914ba80d83425f76134512aa42b858876f482f87154e56",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.2/halsim_ws_client-2024.3.2-linuxarm32.zip",
        sha256 = "c0226c814284a5a799991065e4ab8993cdc2d9192c6a9435213bfaf0f1149e82",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.2/halsim_ws_client-2024.3.2-linuxarm64.zip",
        sha256 = "d6f052473060eae2d06fcd58115a265a91e03a1870b48bf333a642167950b0f1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.2/halsim_ws_client-2024.3.2-linuxx86-64.zip",
        sha256 = "c53b17a6d4e2993b252cb3d1cc4c378dbc395a701078563bb889556efde949ac",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.2/halsim_ws_client-2024.3.2-osxuniversal.zip",
        sha256 = "de51711964757793f61600c6ab02f42ab81888f555f7b2348ffc9220ef66acf0",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.2/halsim_ws_client-2024.3.2-windowsx86-64.zip",
        sha256 = "0305b7b2941404ef8b15198c042d24c3a27b4345f4992dec04ac729a4b240dc3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.2/halsim_ws_client-2024.3.2-windowsarm64.zip",
        sha256 = "6098a76a01a2a877f21d78daac32a47d7d8b3f26df3d617a37024e17f4299680",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.2/halsim_ws_client-2024.3.2-linuxarm32static.zip",
        sha256 = "7c7da83705491abfa63b2c457af38aff5a1803f21fa5a919deada2f941f65597",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.2/halsim_ws_client-2024.3.2-linuxarm64static.zip",
        sha256 = "ef358bd3a6980d40009e56bd410702a4263c57edf3f09aa45b0f2af609d47600",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.2/halsim_ws_client-2024.3.2-linuxx86-64static.zip",
        sha256 = "ea36e8c94b07cb8005377b0ab5997518094d22adc643b27fed9cc3f9a83bc552",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.2/halsim_ws_client-2024.3.2-osxuniversalstatic.zip",
        sha256 = "ae7d7f259575c623acc06570111f09fc7a1cbf513e376e803ecc4d868e9f5d91",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.2/halsim_ws_client-2024.3.2-windowsx86-64static.zip",
        sha256 = "c9a25378156688de3e46b499c8e5ea0ae877c42d56520774cd757db98fc5ece7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.2/halsim_ws_client-2024.3.2-windowsarm64static.zip",
        sha256 = "bd3ec3bec356a0df7cfceefdf72d914d952961455cfcf36d3d30770197dd31cc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.2/halsim_ws_client-2024.3.2-linuxarm32debug.zip",
        sha256 = "be54d22518de05ed041e85b830d0c4907493195288973a18cd3d7a51ee6127c4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.2/halsim_ws_client-2024.3.2-linuxarm64debug.zip",
        sha256 = "6e6ee862e6f00f1407519767c531a6c8307d782fb9dc8ea76459827f5f8937cd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.2/halsim_ws_client-2024.3.2-linuxx86-64debug.zip",
        sha256 = "d2146dd7f1c1a90bf81e725c23def1669abe7331a65650540357384eb8f8b43b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.2/halsim_ws_client-2024.3.2-osxuniversaldebug.zip",
        sha256 = "9f873fd29428e2aa0c6ee29642ba19aa7d749f8acaebf0291519c8a7dca573ee",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.2/halsim_ws_client-2024.3.2-windowsx86-64debug.zip",
        sha256 = "d9752fa73ae589cf3a0d42eba9a37d7dce9d24b37321f4df84638a45ac5b21f6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.2/halsim_ws_client-2024.3.2-windowsarm64debug.zip",
        sha256 = "b631cfe5044ac515e5db53c1fd7c1305d756eecde7c5b0f670e0f89efbbfd2ae",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.2/halsim_ws_client-2024.3.2-linuxarm32staticdebug.zip",
        sha256 = "09c3b74e5d97a0d1906c55f697810d91876533fa4ac4d08225c36fcf2211a77d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.2/halsim_ws_client-2024.3.2-linuxarm64staticdebug.zip",
        sha256 = "7a6ff95562f542ac101376ab714de777b46d631140560ee1df9b22dc4bc2d01b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.2/halsim_ws_client-2024.3.2-linuxx86-64staticdebug.zip",
        sha256 = "8845d4fdb17977295cdf21f2f91b724b36b373f767cdf899e2ee09b8daa4d48a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.2/halsim_ws_client-2024.3.2-osxuniversalstaticdebug.zip",
        sha256 = "d38b865e74b0234381f0702ede18f727f51b2743a0b1fdd9fdde39af98ed5e6b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.2/halsim_ws_client-2024.3.2-windowsx86-64staticdebug.zip",
        sha256 = "dec7a5cce3fafb101400d02a76d648daf95b6447148d90ea73b32cf55119193d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.3.2/halsim_ws_client-2024.3.2-windowsarm64staticdebug.zip",
        sha256 = "93e8f1ff60c3feae6267b9161d9cc53dfd81d4d1ab1d8109428a0a76df8886ac",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.2/halsim_ws_server-2024.3.2-sources.zip",
        sha256 = "5224afb03ccbeb03cb4801b94debedf2082995dd463ff7db2bb5adb435d5b014",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.2/halsim_ws_server-2024.3.2-linuxarm32.zip",
        sha256 = "fcb2ff76fa7258280f8bffb983238b6f7a6b72430ab2b3ea4e375c05630dbdb0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.2/halsim_ws_server-2024.3.2-linuxarm64.zip",
        sha256 = "c73efb03d5613fb96d46d0bed34e82d7ca5a1d0fd05ff5a0529fe06256855709",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.2/halsim_ws_server-2024.3.2-linuxx86-64.zip",
        sha256 = "dd85105f62699e10c7ff6321bfb0b7dddfd7754c50e89c18c17f01eb66d37123",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.2/halsim_ws_server-2024.3.2-osxuniversal.zip",
        sha256 = "5ac98ce9fbfcd51d54ff4b484adb2907ae2ab70822e66734a957ca5d9d11d530",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.2/halsim_ws_server-2024.3.2-windowsx86-64.zip",
        sha256 = "abf468ad01d4560048056a3ce70e6db24f046ca2bf38f3d36babd84c861d1bc3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.2/halsim_ws_server-2024.3.2-windowsarm64.zip",
        sha256 = "0474825d67334047d78e49db108fe3e260dabb634fc619806a0ec56058cae837",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.2/halsim_ws_server-2024.3.2-linuxarm32static.zip",
        sha256 = "c0bdadee8e1fff74014e59442a5559c9b1782eaf95846a4be96a7d1a3447b387",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.2/halsim_ws_server-2024.3.2-linuxarm64static.zip",
        sha256 = "823bd20e92d2b8c2f337f2ae8471bd94394033379bbfd40e1794be91c1345b7c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.2/halsim_ws_server-2024.3.2-linuxx86-64static.zip",
        sha256 = "fc835b4b11166dfcf1b100a7af77cbd9e39b0b2f8d7742a1a1b6f67f9bdacf55",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.2/halsim_ws_server-2024.3.2-osxuniversalstatic.zip",
        sha256 = "8fe8b3306cfbb7536145f3c52681989fb3cbc928e70c2f23d2a8b970d06e59a8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.2/halsim_ws_server-2024.3.2-windowsx86-64static.zip",
        sha256 = "b9fab10dd375df0b0bdd43de07e73aaac62f9fe379046878f8e3f2092e776710",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.2/halsim_ws_server-2024.3.2-windowsarm64static.zip",
        sha256 = "5fe68b1d0a1d14d3a9f5cb591341b44e098421ffce0f52853fc901f3f56c9f18",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.2/halsim_ws_server-2024.3.2-linuxarm32debug.zip",
        sha256 = "2184d6d014391c025cddc7fe7115b33f8ac8e95020244ad861051971b39c49da",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.2/halsim_ws_server-2024.3.2-linuxarm64debug.zip",
        sha256 = "63ea3a5b1eca1c0d3abe2f42e24f47bf5a89a0619603dc2a55f6fec1f7d37a84",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.2/halsim_ws_server-2024.3.2-linuxx86-64debug.zip",
        sha256 = "9d413fce46fb9ed8621f2fcc8ebb13f357df32dcc6ba308e6de906b21adcbe59",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.2/halsim_ws_server-2024.3.2-osxuniversaldebug.zip",
        sha256 = "d78224811ec63dd9cc9b009ac687bce84a84c3b9440c8a41edf0325da79cd148",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.2/halsim_ws_server-2024.3.2-windowsx86-64debug.zip",
        sha256 = "f38593e15bbb2c26f1acabcd72d2b468e1244d779b9654f7c0c2dcc955bcd08f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.2/halsim_ws_server-2024.3.2-windowsarm64debug.zip",
        sha256 = "bb315315bea70ce8cf1c55c744c33ba153d289c4372457bc1845465b0ed6b9c0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.2/halsim_ws_server-2024.3.2-linuxarm32staticdebug.zip",
        sha256 = "7632d134043bfb1cb9caa7816a3a62b3891d6f744f4f36c3e5028f721e47d209",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.2/halsim_ws_server-2024.3.2-linuxarm64staticdebug.zip",
        sha256 = "cae1ba0447f1436dd70588797f4c86b2dcbe61db0f84aa06c1066452c6ee4683",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.2/halsim_ws_server-2024.3.2-linuxx86-64staticdebug.zip",
        sha256 = "511d560a71fd452e1394184322ae4eb9309324bb1b563f25a5d4f5070e7abbaf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.2/halsim_ws_server-2024.3.2-osxuniversalstaticdebug.zip",
        sha256 = "485b88f4b20368d8b1b5af07c2a9a1bd8c394e1e305b5ee6bde71503e6d8060b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.2/halsim_ws_server-2024.3.2-windowsx86-64staticdebug.zip",
        sha256 = "f3fd8b6bd2cd0eb71cff2f44d351137d35af94c4e070071465510667094b1b3c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.3.2/halsim_ws_server-2024.3.2-windowsarm64staticdebug.zip",
        sha256 = "b5398e4d939a700650e12b54e911588e138e383bd322777f7746b930872b8d40",
        build_file_content = cc_library_static,
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.3.2/SmartDashboard-2024.3.2-linuxx64.jar",
        sha256 = "91b7905d3312f19d062a21fb6c3edb8fc16c5f84a6ec5c6889b176dab84ee61b",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.3.2/SmartDashboard-2024.3.2-macx64.jar",
        sha256 = "05e7c4e6d064bf4a4ddabbfe81c5c0cf8c0836bc8ae1f008d76bcd501292ae60",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.3.2/SmartDashboard-2024.3.2-winx64.jar",
        sha256 = "66e1fc74b03ffa9c74cfa03d5948495480c9ab0fd2ab3fda241791b894c83468",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.3.2/PathWeaver-2024.3.2-linuxarm32.jar",
        sha256 = "16d3071e0589376e3e6c6bf0a322b70494cfbd6311e730060547d4062ce0044b",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.3.2/PathWeaver-2024.3.2-linuxarm64.jar",
        sha256 = "9603f22d274464f000017e21591c86aa5d7b5dc10af24f927d189635eb3bce60",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.3.2/PathWeaver-2024.3.2-linuxx64.jar",
        sha256 = "2edb3158ce4a480307647a671276c4fede0c3381375a1668985c63a46eed7d8a",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.3.2/PathWeaver-2024.3.2-macx64.jar",
        sha256 = "a984568e24c310d4ff91882534367239fd4664bd402fdd4e9c5713e9598487f2",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.3.2/PathWeaver-2024.3.2-winx64.jar",
        sha256 = "68776dd16d150bc8dad2701097b28015edfd247c5c9e04205bd84d34b7e2579a",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2024.3.2/RobotBuilder-2024.3.2.jar",
        sha256 = "d6e8f673961ee7a60a76ef436e71ca2476b639415cc7f758e1c14a911d501b51",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.3.2/Shuffleboard-2024.3.2-linuxarm32.jar",
        sha256 = "35ef046c9f1055acf22c4b497b7544e5e9d872eccb212126530016863919aa55",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.3.2/Shuffleboard-2024.3.2-linuxarm64.jar",
        sha256 = "0e236f59e385d07cc400c6dbd4379847c786b661fee404f10cf9ef0023d25b04",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.3.2/Shuffleboard-2024.3.2-linuxx64.jar",
        sha256 = "f68e79ef0fe3ab3b52d9c4aaf5a05b512e784c6462927e970067c93ed7c11b31",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.3.2/Shuffleboard-2024.3.2-macarm64.jar",
        sha256 = "4ba5e351a069f750dad3d474de604caeceff0d24577e65229ff3103facb25f7f",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.3.2/Shuffleboard-2024.3.2-macx64.jar",
        sha256 = "20e2884a4f19d4f668fe6dad781555ee445456c9423a7d750e2dd31fbc060bc8",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.3.2/Shuffleboard-2024.3.2-winx64.jar",
        sha256 = "19c1c01f6f483654f7ab52c6df65091f9c7c14fa70d501ab57896fa7485e589c",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.3.2/Glass-2024.3.2-linuxarm32.zip",
        sha256 = "721e34d56f28377f80a755abfa761ee0d8dea1050f9018b82aee68000c00ef02",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.3.2/Glass-2024.3.2-linuxarm64.zip",
        sha256 = "37d4b2a9c33b4d5c01d76dad2c1bd398e3de15c37d84524b3b7f78cc11f66084",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.3.2/Glass-2024.3.2-linuxx86-64.zip",
        sha256 = "86f87cf9a318417116577fde31f327b3eedcfc85788a9681f5dff7d7f179034e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.3.2/Glass-2024.3.2-osxuniversal.zip",
        sha256 = "36f946bf4c337ded9ac207bdd8906252b141a54eeef97256f3cc41bbf2a0ba09",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.3.2/Glass-2024.3.2-windowsx86-64.zip",
        sha256 = "1e0f3bc5a18fc7a417b2fcd26134191d72c620b6af130f6fb01003ca493b1262",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.3.2/Glass-2024.3.2-windowsarm64.zip",
        sha256 = "3057a82fc4814d09f3502d8c97a1e8a144f7066f3e1d10f42eab10804b96a464",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.3.2/OutlineViewer-2024.3.2-linuxarm32.zip",
        sha256 = "a244e4f0bfbc6cf1775b9288d270f1417f054098056b81f9e5ae26f8e8c51b80",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.3.2/OutlineViewer-2024.3.2-linuxarm64.zip",
        sha256 = "51b526634c1d2fa76977e42d0c2e0f235ed66a6e22e83d548edcc32c78a99a42",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.3.2/OutlineViewer-2024.3.2-linuxx86-64.zip",
        sha256 = "4b30de658db1e1b30473152e79d919bfcb249dfcf28ad9835fa83ec85025b006",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.3.2/OutlineViewer-2024.3.2-osxuniversal.zip",
        sha256 = "e0eff679d7a72aa227af640b7b872bde32dd27152365958737e7ad3518c8c477",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.3.2/OutlineViewer-2024.3.2-windowsx86-64.zip",
        sha256 = "8ae12f7c5328cc0551264b4cd9356c611496ec6713dc93cd0acaf6687a494444",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.3.2/OutlineViewer-2024.3.2-windowsarm64.zip",
        sha256 = "a9bed9e002b78f1cda846704c843c43053970208f8b42f8b7bfed5f16bd3fe11",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.3.2/roboRIOTeamNumberSetter-2024.3.2-linuxarm32.zip",
        sha256 = "80b27178d9fe49dcccb817c914c956f53dd442901824ecd4a73731d893de22ed",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.3.2/roboRIOTeamNumberSetter-2024.3.2-linuxarm64.zip",
        sha256 = "50627ed8d2c078d51b3acd9e2a1ce27c7bac273d11b84e6f29f0ccdd3bce5d1c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.3.2/roboRIOTeamNumberSetter-2024.3.2-linuxx86-64.zip",
        sha256 = "77a2305e228cbd2c58d08add7726fae6fe8e91013e3377b747f275f477d53436",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.3.2/roboRIOTeamNumberSetter-2024.3.2-osxuniversal.zip",
        sha256 = "0478a8e49b4c63d7a899584efd0835753842928e95afd5f8207f5905e5033d59",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.3.2/roboRIOTeamNumberSetter-2024.3.2-windowsx86-64.zip",
        sha256 = "6ad71fa88fc952fd2af1f2c522706af5e2c3627c932b7bbad7ac97bb1442d4cb",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.3.2/roboRIOTeamNumberSetter-2024.3.2-windowsarm64.zip",
        sha256 = "6fdbc639054de076f47a520da6ba8f15ba468cae7e759e61a823c00d68f97bf2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.3.2/DataLogTool-2024.3.2-linuxarm32.zip",
        sha256 = "5af71d40d7b2ebc58b667538c3caa2bddc23b9501c0136c16adf73d9e44f58f1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.3.2/DataLogTool-2024.3.2-linuxarm64.zip",
        sha256 = "ac42058b7a585efa786d4232ad18366a4c74ca9a78c46e530ee32fb5834631b8",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.3.2/DataLogTool-2024.3.2-linuxx86-64.zip",
        sha256 = "ca4597e3e8f78ce6fc779527454d95c6085024f5a7d469aa3b89f756cbdc1e27",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.3.2/DataLogTool-2024.3.2-osxuniversal.zip",
        sha256 = "417242fc535d46cb2958a1f2041b84fa82e3dfb56f6fa3b4187d721b53e424a0",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.3.2/DataLogTool-2024.3.2-windowsx86-64.zip",
        sha256 = "35a4de55639c7a623813b9627ee157a65fd5d6288ab777a954aa533960b4171b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.3.2/DataLogTool-2024.3.2-windowsarm64.zip",
        sha256 = "0f33f4fe0865c753a83cb35807eaabd32ace963831c57a9df339f258e026cf4c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.3.2/SysId-2024.3.2-linuxx86-64.zip",
        sha256 = "123b0265aef8f5173f847e7b9d8f378da8035c8de206ba3c26dd9d11c17fea38",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.3.2/SysId-2024.3.2-osxuniversal.zip",
        sha256 = "b1b803ea13ddd280035a4652ff80afe82ec20e91197c8bc9933b9bf49ccc47b3",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.3.2/SysId-2024.3.2-windowsx86-64.zip",
        sha256 = "ea9c8c2e8f88c64b7f8655c7053d208c25af43b72d72c679d9b0901c1578e6f1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.3.2/SysId-2024.3.2-windowsarm64.zip",
        sha256 = "16c43d3cd3bfb75bab104f4f2799e1aaebe08f73c27cb6d2a2f87eead186d735",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
