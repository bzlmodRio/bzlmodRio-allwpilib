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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-headers.zip",
        sha256 = "edadccd3703e643ddbf06450cac82ce7ed9618527fb05c1bc972ddc4a89bff2b",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-sources.zip",
        sha256 = "74969ad4799438c6410b0ffc47ebe94e95b331f5ab92dd4493f4350311178609",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxarm32.zip",
        sha256 = "2695b8754b682465ed6cd64102970a0c84c0f1a5c1c2a524a122fd3fc293da0d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxarm64.zip",
        sha256 = "6fd1e8199c6aa1065f2308ee8423bbc5d8b0deb2995f80a1e5e5e012781cd074",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxx86-64.zip",
        sha256 = "49e325a290306a6a53a047312c38ff336056daaa1300eeaab6d2678a922efd18",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-osxuniversal.zip",
        sha256 = "ac8992940ae5e1bc7ccd2816d27874cf6810f282ce5138de818e535a20373203",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-windowsx86-64.zip",
        sha256 = "198c285998ea9aed21780761b184f58d4f831388739a51ed9134cf9e5a0df0ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-windowsarm64.zip",
        sha256 = "ca9681cebdc8127f9f97305cb64273826b090bc02b70782c689f58951bcf77c9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxarm32static.zip",
        sha256 = "191271d9534c1a4d7082d06b0ad0d94f7a3b07cf3e8d5967d44c35e5cfc9b733",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxarm64static.zip",
        sha256 = "af74773410c0ae69bf73a5e73ef2967e79dddb2394f10d349fe1cddaf586c156",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxx86-64static.zip",
        sha256 = "c6eece8b608d813517e9cba3394ff49043bfd603b45487f8f3a20d7e3dcf0827",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-osxuniversalstatic.zip",
        sha256 = "46f59aa8c8c74511be7eb8378f696575408041eb24a1b3d32caa695b00aa6cef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-windowsx86-64static.zip",
        sha256 = "d8a59041f9cbe5d143595c13519eb3fc65e13f8b87055bd26c3ca468071471cd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-windowsarm64static.zip",
        sha256 = "ad08a1ff3139662036932067ede17a223a16d3c60441962aa04dbacd7862bbfc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxarm32debug.zip",
        sha256 = "1023c29c7720c0d8ad9806533e642f200f21def281ece6832ddeb5692cc81621",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxarm64debug.zip",
        sha256 = "17e7fa307d5cb25addaa9e7fe5e69daa67aed1d94990d3868eec56c08fe4d027",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxx86-64debug.zip",
        sha256 = "ff991c0dc12b3474685861a1a991493b6548cdfefb52841e095daf80024aceba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-osxuniversaldebug.zip",
        sha256 = "4207781a08ab66bbd79141440abe9644147d6ee9d5a0fc088fe9bf141fe85e90",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-windowsx86-64debug.zip",
        sha256 = "b4cacbd6efc3fe90228bd54cc127e0aaf5c44db4c1dfb063216ee7490143f603",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-windowsarm64debug.zip",
        sha256 = "b1c9bda5884699c273bc7106b3280e1fa832b37645ca1e3b15b0b95da16b890f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "13160ebccf7c284dc89c5e4c8397ce93ba0bb026a66adc89e7b9b12c053fd4d4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "50490cbad6f8b901a7bb168ab1da41af2a30b74f0d6311eea555cefa40a8acda",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "60b8e68669302ab67a170264d1be9da86abdb76352d6bc47b649883dba24ea22",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "d0fe6a812147e28c8ee8aa5560be8b97a2f8b5db23116f9b04d33ee207490b26",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "126783b240b7daa65b02d59d165ebeb9def0c8502df6ba028d12edec26942d70",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "347c85bf820eb39d5aeb8ff192c0d0393312ee9232b5e180c4722af3c7338643",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxathena.zip",
        sha256 = "6abd8c074fc764d1374d7b7dfeffa9ad48cd7f4e8d51ff1a25fee5e27ed77cb3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxathenastatic.zip",
        sha256 = "31bedf8c982d3fd210724d03898ca12a0cface6e5cd2dd1fabd81d4c841f7e23",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxathenadebug.zip",
        sha256 = "ae7896478797c1334fdcba0fd90a68606580ad3b7400823bf18d27219622f0cf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.2.1/wpiutil-cpp-2026.2.1-linuxathenastaticdebug.zip",
        sha256 = "b0130e2ba9ab04eab303d5465bd1c79eb830680526119751ff3881392d2a6ebb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-headers.zip",
        sha256 = "30f5a6f0e0bf95437d498175669c4ef5e976d930b68031370b33f9bb8fa9458e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-sources.zip",
        sha256 = "bcbc84aa92da692193bd23588084189e91975a3b8bb1f05dc4f2429855eebaf7",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxarm32.zip",
        sha256 = "1bb84c7cf42bf2d5584748dc1f43297257f6a19b5a8d6edad1b44def0e5add91",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxarm64.zip",
        sha256 = "ba2545fc5a348733a2dee66350aec60dfdf51ccdb6520326c767a6d8b03eb0fc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxx86-64.zip",
        sha256 = "6f77c03b8528a9c82a1e2df4141cfd65af8f6b7d3a2f92f250291f6546f388d9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-osxuniversal.zip",
        sha256 = "bc1253205b7657607ea282f0b7dc3bad53c633576819698bc7b657423190f2c7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-windowsx86-64.zip",
        sha256 = "cf244c8fcdeee2fdaf965a8d3009353ef394362be7bb83fea72ab39f2211edac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-windowsarm64.zip",
        sha256 = "6bfc942f6dbcf6ca39ac649e874e7f20531fe9ab7f9b0d08a2cb734a1fdd87ec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxarm32static.zip",
        sha256 = "5e1269e1b35dbf43a60e76c88b12a7eb674c37e4eaae3f0656c57040882ff14b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxarm64static.zip",
        sha256 = "51018c5225d970bc2cb3738e89ac3b1f0ddb1a43d1a00eccbd84cd8b67183127",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxx86-64static.zip",
        sha256 = "e6b8508b737afed1f5f3fa6bda9929d45051fa2c1b4a734cf9a7f0bebc5fcfe5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-osxuniversalstatic.zip",
        sha256 = "685b4dddcd85e1b02cb064269a62ab31278a8d61343b3e1b91ba5082d5c72f58",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-windowsx86-64static.zip",
        sha256 = "76d61954b6b3ba0f95bca5328ffb65904a42fd02322eaed83c8215848c66b831",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-windowsarm64static.zip",
        sha256 = "50cb06474f6ecbe001de9cda169929d3441250fcdfb16d532dbd75fea1af1f42",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxarm32debug.zip",
        sha256 = "82cb7c844f5fba181fa73e0a3950a97e748cbb3b04355901f55980d77d9d4fc5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxarm64debug.zip",
        sha256 = "3746d2cad5a4c2d08f41e2670bcef1bba20ffcf54b71bf829b4726b490ef98bf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxx86-64debug.zip",
        sha256 = "61d46b450f0e7bbb9bb395e1c5fe64273ef8a5bf8e479338a5c2823e18bd03a1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-osxuniversaldebug.zip",
        sha256 = "8e4788db649299c6fa7507562829a00e4a8cabc1220768727656173be03e5ef7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-windowsx86-64debug.zip",
        sha256 = "3868bfb9f8ff984d71a1883126fbaf7a92269cf231ec620d4d59e15862a8b291",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-windowsarm64debug.zip",
        sha256 = "804eb8dae4c0a8be2ee051c80e10399555311defd2359babffc4350f85404415",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "1ea4d1060f85a42ae631f336fc438a855bcc00195ffb97ffb39c20b2a4020d57",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "a7cda2722fd7953984fdfd3e9b9bc2c0a2f462f42771e67027f85d911f461fc6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "8cbffd5fa06858f5cc02ae2313046918c07e7ec1e607aecaf0e3f3d9f9f3336d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "c39a8afd51139ff65471de4e1deb32c12e228aa59a897c8f0d2301f1157c0c5a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "273e8b7f8b288deada03cb4ffdf4f5e09d5a139036d585bab34b74186f51936a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "24b51609fe5bef4058d44f06fc2f7729c6d0176a4d0c08af1e225e15b4bfa8cf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxathena.zip",
        sha256 = "76b6ab11bc11012c23f30ca418ff46488fc822d9a9331383fdb1bb9cb7d9c5c9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxathenastatic.zip",
        sha256 = "1a638b4f700a66b588a615da9f1b81013ddd3cc3351051cd7b9eb168421ebf85",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxathenadebug.zip",
        sha256 = "c3956587639ff24c9c5ccbaae57c5850fa59c9914a689c4d3d9d923c34f2b84d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.2.1/wpinet-cpp-2026.2.1-linuxathenastaticdebug.zip",
        sha256 = "9c3adb3ccc6458d454dc82ba3678ef3e1b3f3b8b6e7af8347dcc5b339981ebef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-headers.zip",
        sha256 = "25b5e461efb35ec097a6023bfe07fc9baa87bfbb2983a23880d2ea7e0ed75ac9",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-sources.zip",
        sha256 = "ced5251505ffef8cd7e0a65440803ba73720d4ed9171cbb97684d2378700ba4a",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxarm32.zip",
        sha256 = "48872cb94e2191840d6540c0bc85836f8e21f590579982bf2969fe1a2ed0c6e7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxarm64.zip",
        sha256 = "b0686a5c5630e420f2c664939c895dd602eb7b57e33f817ab0f2b0dfd8857c17",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxx86-64.zip",
        sha256 = "57b17ca2472577df1d85d344504509832d7e156dc2d75849dfd452cb6c655e13",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-osxuniversal.zip",
        sha256 = "cf6bbe8a72810648b405b12e829b0a77221d18fdd15b180154aafcdd10e4082f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-windowsx86-64.zip",
        sha256 = "f65bd41bf913d579a9656c0a081f714169c24602ed9870c9a7247601a9ca426f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-windowsarm64.zip",
        sha256 = "10558604c8cd1e4e404ae5d04016bf5707439836ae49d6d286043f2ae4f6fa9b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxarm32static.zip",
        sha256 = "3c2dd2d67c9914002f1cd9bdedf6464dceb0532660a4e284c1c3c5a99af0c23c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxarm64static.zip",
        sha256 = "faebd97092ea3ca887eda8f44f34ed8fe686c22c8ec478006358e875c687ab1d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxx86-64static.zip",
        sha256 = "7cf946f96504e0597138f4252d4c19e72474bbe5c733c2488709e66e0aad5909",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-osxuniversalstatic.zip",
        sha256 = "c0fbe96c6d135835783609ffa9b66de5fc224ea71853aca9ff7ea8925175ddb1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-windowsx86-64static.zip",
        sha256 = "7c96812d3480eab50ae19c6c26d6e46ca72adbb64ed4884582a3c84db248c161",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-windowsarm64static.zip",
        sha256 = "359fc166c0d19f31a91fb8e731d869e5c93a25da71264aa7b87bceec60d4dc8f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxarm32debug.zip",
        sha256 = "4840910d0f6212b8734edc20cee1198c27219ad2ad401a47f67a28ffcc18f582",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxarm64debug.zip",
        sha256 = "95f1da3520bfe916bc210d20443de76985fce7cc57dfffc7c7dc23fbeedf0b6a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxx86-64debug.zip",
        sha256 = "ca2580efa9e1cf7afcdf38bb05c1bb7bd79c3aee643a561bc9a3cd4ccca696e0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-osxuniversaldebug.zip",
        sha256 = "09ec0e9262b4e6c1f19df1c1719e0dd5767b1ee41353f2c2253960edc01a5057",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-windowsx86-64debug.zip",
        sha256 = "e9e10e30e0aa10dbf1b3768027d6f96e7b77f9cb22cb1c28e21b05d8738bf0a2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-windowsarm64debug.zip",
        sha256 = "790c482f1ce35ebc91e9af8725d952d19fa6ce41bc6024538ec1a49752c77799",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "b323953553e4edbdbb455ebbc40cb352bafc3a9f59b17bb0e02c3f05002637ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "21d52e88635e39428e3fec0867a774fa77d2636079e3c1f8c4b95ac9dd2a0ad3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "de8816e22d2c4f6390a3aa7857d18d656cc96e5168a18cedc0856af610f1600a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "1385ed128cfbbf0c74d47828cab8b684f3e36b3b3b5b79758786843329f22cc1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "90aaa023dc5f6c7c817be8884f7dd5f74f50492309f289fcb518f49f5ed0481a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "879181ae2c2d2bddcfb6a492266971916e2bced3e4e37c053638c42fa0b02e75",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxathena.zip",
        sha256 = "c7e439bae25a4d82d827d28e8fdb51f81eb82156609a88ed0b35cbcb24e47ebc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxathenastatic.zip",
        sha256 = "b366eb4f5a88f405bb5873584bf2ce55d80a12f616df8047eb106c9ce93ace56",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxathenadebug.zip",
        sha256 = "eb1e88008970961afdea588b8363a95c5b7aa3a437ec9f97d4d6a17ed38b963d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.2.1/wpimath-cpp-2026.2.1-linuxathenastaticdebug.zip",
        sha256 = "808d1a45ac47e25ce7029799396266225f6ba4a379f2232132cf76ae6ad6e9e7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-headers.zip",
        sha256 = "b59a8d4d40415d6672a307efc75572d4824b50f61a7d8cb45b98502422ef6d75",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-sources.zip",
        sha256 = "57175e8acaedf32b5283d137cea9af95f708a92c5abf8a282b7a2546f49267b8",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxarm32.zip",
        sha256 = "f112dbb0c382b8570d7e793faf20aaaaf9f9480869c6fe52880c7fb7c01a88d0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxarm64.zip",
        sha256 = "0ff30fa599d8dc774e95f239184ed2c2802c39a91d3bd4203a03558e79950d67",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxx86-64.zip",
        sha256 = "7fbebff6cb056003b3004afc256a9315c7c3ef69e2c5a7417248fa44f8486209",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-osxuniversal.zip",
        sha256 = "7b189bf2dd254a0904e3087b2b2bc659a54b0dac158b30a28ac292a6ada3d569",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-windowsx86-64.zip",
        sha256 = "72709c42316239cf75803a89796ffe288ba4af7e48616dd6db0d64d19bf7fdd2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-windowsarm64.zip",
        sha256 = "8e46c9498a5345e7048cdcb8a1e3422cf788d0c5046a387c3a5c86189e1e85b8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxarm32static.zip",
        sha256 = "fd2202fb1c00b5f8cdb9b42ecf07f55fac472dc2eb49dbb7137d520197874126",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxarm64static.zip",
        sha256 = "83b19a542b9c2bde87fee1c649d44a1d89ffb78f8bf232fcfb987ad8db904992",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxx86-64static.zip",
        sha256 = "6dae4168f6380fa609d712fa3445df35142c6fd4482d6033b9af98a672d1f96c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-osxuniversalstatic.zip",
        sha256 = "b1cd0f4ed692989e0dc7278146c0eeff6ad6121356591949b857a2218911bb7f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-windowsx86-64static.zip",
        sha256 = "2a5ccc0b48d82d33a491a6e29bdac4a43751c4416785e3e97e1fda6ebd8b9973",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-windowsarm64static.zip",
        sha256 = "0a3a0666a918d0270a8a78b1449776398b5a63553479208d15c033f687c10c4c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxarm32debug.zip",
        sha256 = "dd50074fbd363c7d53159054c70ec4f7969ae2e0c4ec6f72eaa0596838acde20",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxarm64debug.zip",
        sha256 = "fb6b81d44ddd80b85b215fb616c01e0aad799bf0c1622195d5fe257e1398f0ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxx86-64debug.zip",
        sha256 = "e66731703d9a1e1ff5ab1ed25c98add9c81af3cecd7c28e8040d7c2e8b875f1a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-osxuniversaldebug.zip",
        sha256 = "9356802ab447b4fdcb93e93f90c788ab6336b513743a855069dc32620c5296c2",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-windowsx86-64debug.zip",
        sha256 = "a0da5b6184c4a09d114eb361b698a8e5891b5b7e896ed318d2b66549ae40ecc0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-windowsarm64debug.zip",
        sha256 = "f597ab609331ba645d887c919b1dcba1095820944e5ca74615eda381e2f320e1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "2689b41721952f471d4d9e2bebbb1740884802e66f0255029d43820dfe8ac745",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "6143e313179fa2e379f852788635a0d6dc0e5ef542db04049b107e2eb590fd43",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "9755f57e3358fc87275bff808de21ee4bdda359f79005bfb4f14cc2e61b063cc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "2b955c066d01046af60ef15c034ce3e62dd7b8d671def5225b76165e6fe97b20",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "d4bfea1fae935b6fb922750e1a1f4b84f8da7c7ac2d2dbac3920ab94de1f2556",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "cd40e95353d88858c92eddf6c5a4a52da1afb99fc8a06e7a9e3cfb72663bafef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxathena.zip",
        sha256 = "4091660408e0ffd389be88b1cb0ed242ed675091669cb766397d1866d693c628",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxathenastatic.zip",
        sha256 = "d0262928384ffa1688f9d5a074d242c6686a3de1b21e072ac9ba318b0e1636c7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxathenadebug.zip",
        sha256 = "e9ff5165d865f14428a0f6639c7f671ddb8f1656a59ae2e8aa8dea1fe52e7c62",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.2.1/apriltag-cpp-2026.2.1-linuxathenastaticdebug.zip",
        sha256 = "eb69d60bc9031543756834d0e258ea39d21ff63b038b44ee214225d6890b5dff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-headers.zip",
        sha256 = "2595c89904c224332cde5bad17b428521d231d7f919a4ecdbdf4298c172a574a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-sources.zip",
        sha256 = "18c4f8e6e735d656ffd9d65e148d874e50cbd40955dceb6c3f2843e855d57f75",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxarm32.zip",
        sha256 = "617a71caaa43d2bca946bacf38c4d8d86567d060a7ff1958a0b917c765322ea7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxarm64.zip",
        sha256 = "088ecb3303b93e7c302af3371e4164601f27c6ff018828b17c24e82a62717beb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxx86-64.zip",
        sha256 = "409a5fed4ec5db709e3dd035262080129e7347ebd882609fcf755e9abaa85728",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-osxuniversal.zip",
        sha256 = "049834cfac83998af4318ff1593f950d37a250c9c67276d4df922729d32b5dc0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-windowsx86-64.zip",
        sha256 = "e19673f9f9374d036206cabb8c95e86310548720578eeaeccd807c7ba64b490a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-windowsarm64.zip",
        sha256 = "eb15fd8285aa803fec63786279b11d0025fa780e7c58986c27c2e6dc1c4f9923",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxarm32static.zip",
        sha256 = "161c024a4d15d7af9768660fd0b5f39f26c31a6d620bad54a266c88766d57836",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxarm64static.zip",
        sha256 = "46da19f7b749c005f7c06e8cf9d11cd8f4736cc80f3736cead7783a69a0340c0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxx86-64static.zip",
        sha256 = "764ac145efe229fb858e56a4e5060afc4ca8ae1edeeb57e5dd0d47a52b047628",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-osxuniversalstatic.zip",
        sha256 = "95355b94fb7a6da05ba9c035b4ba761f23afb08a4b6c4c7a2b54ffee1b9d5a5e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-windowsx86-64static.zip",
        sha256 = "5948e2677532d09d90be9cb8cdb700c02ecdb0002b122749416bb1aaf2cc5fea",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-windowsarm64static.zip",
        sha256 = "4352cd83cdc42173ea87fb509258090063d0ef4f21dacd485e05062e77d2c4d7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxarm32debug.zip",
        sha256 = "973fb8617b54dc86b78df1a30326263a682329c2081630fd22ce79b215bafecc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxarm64debug.zip",
        sha256 = "2f267fe148ea4940693b1ab708ad5d33a234f00d8e7c52a8ab96ac63baa27150",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxx86-64debug.zip",
        sha256 = "8762d733e2fe77007210a2bad2e1ab42ad57fc3297d836ddd84f403a039c2c00",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-osxuniversaldebug.zip",
        sha256 = "52e968fa7e1fbd02ac59952a2fdd33c76372d745c1d8b18d169bcc28d6f4f0b0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-windowsx86-64debug.zip",
        sha256 = "cea4e178484329882b8a2dddc729abca04750210775a586e9c2d6017cfe31bc9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-windowsarm64debug.zip",
        sha256 = "1ad7244fe218da8924bac48b239f50406a6a5200f6e2e72b22eca1c8cd2f0a1b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "26933b3740acd647de6884b45b77190c2a450eb65b368a60ed6af79e369c2767",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "ad72819da64cffe6a658993ce02dc286110e4697ae9eb81b93d08e07febd8be3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "42cf8f30a692936c2cdb86d2669a6334e46acd908db0292dfd514ab0552b3025",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "d9238d34c1403c2a1f88aaf5965d8558a2daafc8cd77cc4b3aca0de106df98b5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "406ea877eda9a3d4c2d76ec91d878ea8bfe9796b96f6546b3969c61b405cfe37",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "ef8b9db87966c8c86959c3693af142f8629b0c44d26a48cdefda702866fbca28",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxathena.zip",
        sha256 = "9227b4edd25f2287081e45333b6347ff0418044356a12c36a6363bef89c21059",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxathenastatic.zip",
        sha256 = "cfa8b9dfedd2ce0dc6d405fc53fd12b9f272118d6c03190459745f15e61793e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxathenadebug.zip",
        sha256 = "cf7b12e8fd6d79bf43957144e04ddb5eee59dd2ff6b0c5686cc7f4ca5e60c186",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.2.1/hal-cpp-2026.2.1-linuxathenastaticdebug.zip",
        sha256 = "67cbf832ffdc957424326ac59eeccca6b3a95258cf9b304f6703afc06a814e28",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-headers.zip",
        sha256 = "842552c7d7e9c757c28d4d2a58af29aa0e454106f5e07d997085196edda1b03a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-sources.zip",
        sha256 = "1c362b85b124deba3f23e1562e65215b59c013786e052ab225e70ce1f0558ebc",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxarm32.zip",
        sha256 = "63748d0dfb2c251fcb0937399d81c2d84d2a362a084c16ee3c8d9d749d99f742",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxarm64.zip",
        sha256 = "a584335874a8dd60328ffe5cdf355aba8c30c580e47cf29e468b3f746dd9b599",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxx86-64.zip",
        sha256 = "e08fb2d1d161ae2d51780452f4be89ddb4875b44401562db409b8cbbebe508f9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-osxuniversal.zip",
        sha256 = "1d6833f340401b756b777b7a247f04bc714b02a448a631f44b5a780b421a98d2",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-windowsx86-64.zip",
        sha256 = "b86c645ae8d81863ac63445543a033e5e010e3ca8ce6abc2e07299e9e86b90b3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-windowsarm64.zip",
        sha256 = "21a8b7be56a5e013c53160db0e4fa04d726952d9460b513b2b106014017902dc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxarm32static.zip",
        sha256 = "a26eb87726ec6aa0425b911edd5d4a01afdf797f9f4bd4e7ad0b98e341cd280f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxarm64static.zip",
        sha256 = "35cd2dbac8763d2ab41dbb7d8b98d8000e72420a5bef96d8fa5ab2d68f9e3f51",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxx86-64static.zip",
        sha256 = "a44ec1640c7161142a2c9b95c403d75b7078aab1a38bd83fd905dfea33d82aaf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-osxuniversalstatic.zip",
        sha256 = "39ad9aa30994d0d41548630502ef385bcbaedaab1378fcfcac4b2b53ab77aaac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-windowsx86-64static.zip",
        sha256 = "8cf38941cef88643c0712897690ec87d63a8e4f9756f136b5a435af2e4fc9f65",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-windowsarm64static.zip",
        sha256 = "5e0dcd55507b5fae449aadd7dc12078be883a20ebddac9f4de4829d7213dae88",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxarm32debug.zip",
        sha256 = "9a6a68131e4d1ecfbc7d06d37ad641ce4250ca473b89dd7f1a0936e0b9c366c4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxarm64debug.zip",
        sha256 = "8ccf40f6f2b86d3d70f3900802a64f214c65beaf9efc0f1f431074ef93517b4c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxx86-64debug.zip",
        sha256 = "1a75a08a619fccef80e926a3b7a43850e33a39a15cec7c75d58150c675b8928b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-osxuniversaldebug.zip",
        sha256 = "cea5f074e4e7f7c1f8f1cb71c61ae89bfcb37fe9cfc91264b208c746f48837c0",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-windowsx86-64debug.zip",
        sha256 = "efe25c8b681aa93223b4c026bebd4f74a0807acc2fb8a157eeed91bc85936d25",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-windowsarm64debug.zip",
        sha256 = "6021562b70d43e3eab900088665b600943e5dc177741bcacd76a56693295e985",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "124a7720c00c75ec7274636d93862dd1f6c0256ffe6bd5ef1d1932c84d180e94",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "4d87ce72ac9e5fe323046dfa35eba8db9953a4e482bc953181da077d31dbd03f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "83a938bc1a4744843db3f22c7ecf258b3558aeb71ba5459807f7c12c3356468d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "0e2d9caa794f49c4e18166d4a3e64af7bec469fa60263a13cec2f734a0da104f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "37ac2acb78bcc17fb361c09ef52676e74966e07a5d86c3f32999d1171adba73c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "585edc09727c763ea9f180fe81dd9bfd9b770dbba315ddc64ff27bc8c25ba24c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxathena.zip",
        sha256 = "fa56c567026a36ec9c925434110c0717ba44ea7862896288e57f7f27671e53d9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxathenastatic.zip",
        sha256 = "9e0f26c4701492deb55a17f39e3953869cb68f27c19992cb235da0c6d656cbe7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxathenadebug.zip",
        sha256 = "90e80de4e986f94ebca1e6edd95487d5a0f254f9979749e9b4c1c231e444e410",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.2.1/ntcore-cpp-2026.2.1-linuxathenastaticdebug.zip",
        sha256 = "c6b23b441b66e9a0e8968d118d2caa091917cb262451e92cf380bc31e07ff95c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-headers.zip",
        sha256 = "1dc57cf434b802a0ce903ec2d42bb8f4a13a9d56732d9dee2df8c50bd7f97d67",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-sources.zip",
        sha256 = "baeb3b9f5a425a39000be9f65efa5544fa44268e927c573b3a1c1361f7c9003d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxarm32.zip",
        sha256 = "a05a061ab0bb9280de557203087185c06f86b228f08b479bd4c3258b68453f84",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxarm64.zip",
        sha256 = "97846968258bcb633fc718ab69a377d29285314e8425d090939d8734d54840f6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxx86-64.zip",
        sha256 = "eb0ce0c3f1a331e251287271089d4a1d5026c90981d481a984439ff9f35d74ca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-osxuniversal.zip",
        sha256 = "41aebfbefc40b76646dbdebdd0903855676f488804569b7084058b0541bc2414",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-windowsx86-64.zip",
        sha256 = "571cd0519d12294488855852c83a07fa0476da6c22b173e9452821ce90b676eb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-windowsarm64.zip",
        sha256 = "49958c47b0be807514dab934515f76ab942edbc870aea4a7e3062093c7648ade",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxarm32static.zip",
        sha256 = "4740efe8b1f746eececc0fba3fd2ccf9f02481b0a5d8823f99716fe4ee1cb54b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxarm64static.zip",
        sha256 = "56226da1ec809b8d0a1324ac3299c57978b4ac9e752dfc0e23eefa95c96274eb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxx86-64static.zip",
        sha256 = "01b9417b907699142b8fb6db6678b74db50f2e1cb93dc4ec8764c883efbbcb5d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-osxuniversalstatic.zip",
        sha256 = "d5f5ead59008ab59f1329afcbcb064514f16d84b5945cc43b8791b5e40e4f3fa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-windowsx86-64static.zip",
        sha256 = "918c91618ae77d4c45f90cf5c1f3172d0c3ec36accf732f49663fb32c7103e86",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-windowsarm64static.zip",
        sha256 = "59cffab7281a6b397c6e935caddcbaa7f18ebb0c148aa66debc00fa45ab20076",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxarm32debug.zip",
        sha256 = "9a123fb433d768bb8ff01dd4019aebba5abbabf45cf4ebc7e9f635d6b6fcc964",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxarm64debug.zip",
        sha256 = "84c0f66b3c9d4f6e30bbd2372ed077798d9a2c6efb2af4bc0913ae9c4e923db2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxx86-64debug.zip",
        sha256 = "e67be0f53e56505ae3c6f8bc6249d674f3a63531617a9d5d6e4635337bba878f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-osxuniversaldebug.zip",
        sha256 = "9d483d4e6ebd9953b23ab322726166a76d23f95d09fb61aaf533967caf978d91",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-windowsx86-64debug.zip",
        sha256 = "b91bba1e887c851d3a8fb991bacf1ad39628faa9f74ebcf615139509320113e5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-windowsarm64debug.zip",
        sha256 = "937967b0171f476b0a2c1fe19c98853aa95a606bb7567b072dc6a71f3f28242a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "576d93848b70296099f78f00a6f01837138fafec11f512bea1d75e1c2a5a7dab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "60546bbcd7e5b993051abbae87f7bb63705f41fee2924c75aa5d6268598b2d78",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "56d81f6cc247edd0411fe28f77bd8e5c698de2e010dd94420dd39486966209c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "13225844297379e7df1f57a8895baec2e184e817ce2a383f3db6c64a7c8abb0b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "7c8e70c67a70a5a1b177b3d6a544a83cd60450fda4026b85dea968a655092a09",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "baa5d28f4a1d73c6185322221284e3650fc30c7eae8c7c703187e0a3d0172190",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxathena.zip",
        sha256 = "9671332471440bc413dcf222c2119deb119cc08d5a99789582891d8306b258c0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxathenastatic.zip",
        sha256 = "d7d4310d355bed8a282b1c47f85feebe84c2a3e7d6b4ab4af69f1853517f4555",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxathenadebug.zip",
        sha256 = "ea41b561d52dbf6408961817319bc4b93064bb733236300a5e12c4a3ce48e9f0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.2.1/cscore-cpp-2026.2.1-linuxathenastaticdebug.zip",
        sha256 = "45f4ad605977fafc9017b20f09a0ea8dd6d111f6f624e0855cb66c40ffcff416",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-headers.zip",
        sha256 = "1a65f7ed1420fa34b07af3a401d85bebd32aa54c088f4f40aca02e71d53ed1c0",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-sources.zip",
        sha256 = "503d8ec4792271e363c1a105e346c1fb273ed24974a948f7ee48bc5db046120b",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxarm32.zip",
        sha256 = "5aa6e36ac685d8f18035f5b432d20f84eaa01b7e52c8cc3f1330d3a16dccd1aa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxarm64.zip",
        sha256 = "033abede5f666dba5a4c60a7aa2d0ed473355b15a79f7d16b53e37b675e3a567",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxx86-64.zip",
        sha256 = "984631c1b4cb01bde7da28c00c6f5fec7f86e4d4588f1f19fdf9763e345d4bf4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-osxuniversal.zip",
        sha256 = "8d08f23b6170f3762bbd8ea3e8f528d3a3173511c61194a0ead7edae63e9877b",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-windowsx86-64.zip",
        sha256 = "b78c73e8be3748c2398e8a3e6d614bdac81339975510f68feb5b010ffe686038",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-windowsarm64.zip",
        sha256 = "a42863c48e7d053bcb327ea3c136e707a4bc3db3fa5cdc67e917cff6dbb28c09",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxarm32static.zip",
        sha256 = "1a4899650b2e1b11113cc7ee9368debb22788c7dcb2d585df6c20975bd0737be",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxarm64static.zip",
        sha256 = "d0ae5bef7aefa0f51441dfd6b6b36ed56bbf2d70bc68718589a3fa557ffcb600",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxx86-64static.zip",
        sha256 = "fb564c52aeb2af1cd71a906d3eef84b4a0357fd0d69f213802416720ffb971a4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-osxuniversalstatic.zip",
        sha256 = "fdd5d40821c60c157356457c38c0e52e34b87e5c95e878aefdc51db4e6858d75",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-windowsx86-64static.zip",
        sha256 = "88352c805f1727401bf23b782f84ec583ea2354e72d86bded2bd337a2fa48039",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-windowsarm64static.zip",
        sha256 = "232a3273c53bf8d889fd05d520b0aee1064b82c085771088e34c46f4cda28ea1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxarm32debug.zip",
        sha256 = "75df45731a069ff2b677a60210249cddf95f851a3a3e02d3e218e3c7b8b56515",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxarm64debug.zip",
        sha256 = "2c5a878d3a177a97288621ee221e2f392e63ae118fd9f13874b7bc97a77cf56e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxx86-64debug.zip",
        sha256 = "c5943a7374bc5d6183428bee5c0ccde98eac54ebf18741f1df5a5cb8ed650ede",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-osxuniversaldebug.zip",
        sha256 = "53160f684e753f209a19e2e11e501bf022ae470520fc200b2b3ceac99acac920",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-windowsx86-64debug.zip",
        sha256 = "df13761f2936a848e35d026d35dbb14743dd75c6ea71dfdd4442f4e50df8ae50",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-windowsarm64debug.zip",
        sha256 = "9bc4dc70096a06e2a23d344f4cd27746a5d28bf15e9aefc872e467ebe5beabaf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "45cb46b5ee8aa704a8e24304c2dfc5514f01e166515277e5ae1710253456e7c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "765a814987ac6ed7d829d704e651abf14252eb57eac6936227747d227a07646a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "6ec39012f72878014db345cc44b91f0806fce37a27e89c42f6c4f0f353216b03",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "0a3a934fd93345c0ba7d9b43634524b6847a41dd8977d042ff1f74dff183fb9a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "fec6d46da64ed619ec69fa00a020520f74f481813255c1efee676f9ca556370b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "45ce7feda222c69493cb071ef1ad99dc07ae7843a20bc5acb3a6c7e926ea8774",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxathena.zip",
        sha256 = "b03dcc442e5bb032de7650beac8471400f9a8ea36f37c1950f6f70e5278d419a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxathenastatic.zip",
        sha256 = "90c6f82ab6b018ee88d5efa6a4b2b276f8c83a05b50b132d700b2c66a53eeec9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxathenadebug.zip",
        sha256 = "aba83fe89e98cfffd7b841e15e5741b95739efbc2d383cf5edfc196e247758cc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.2.1/cameraserver-cpp-2026.2.1-linuxathenastaticdebug.zip",
        sha256 = "666b7793094a2628acee05083c1a9761d82c667603cb6b1500f817ba5fbc1366",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-headers.zip",
        sha256 = "20e79042c7d74f426a10005699bca013feb0f6b7891c5e17754fbda31be90ffb",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-sources.zip",
        sha256 = "bdd80a067aaad27fb132d567bf72c3ee54332b88b53a5e360bc19c316e9f2637",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxarm32.zip",
        sha256 = "68587cec2fab1556b8417b71899c195cf934a659738e3dae5866fbf31279df4e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxarm64.zip",
        sha256 = "14ce9736698efda2130718291aa309d9778d218ffa1a89bcd52c2fc2ecdc0027",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxx86-64.zip",
        sha256 = "ac220bfafaae45f024235b5aa8492e31808b672f6c775c090e51f44261c7d885",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-osxuniversal.zip",
        sha256 = "6e55e3e458c92b369c24b17a08049c78f15165203445f652143ee29c4e5bf7af",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-windowsx86-64.zip",
        sha256 = "460e0992669f712b9bb88e6318e28a0b60011d7bf7cdd2faa2ecefc478f11040",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-windowsarm64.zip",
        sha256 = "74dba2736a193a17ef8a8c869a13263c511b646d4b47c6c8521add4e355cf154",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxarm32static.zip",
        sha256 = "2297b5f29403eb124c49712d2c88111efda2025ef3e46e9db4911be7371e58b5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxarm64static.zip",
        sha256 = "791f96634e19d9b69fb6671d8867cce214dd04f831ac2594a2597cb795edc466",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxx86-64static.zip",
        sha256 = "c6590d9837cff60afa593eea2d9d29961d37cad79ffde48cb8fec8c400247175",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-osxuniversalstatic.zip",
        sha256 = "cf8078384b4f7e12ce74223e860fab72f24acbd31caf613c62df8024f78f546c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-windowsx86-64static.zip",
        sha256 = "835cb5c6d78aab351565d3b41147efee342dcc53d5dbcf8f21baf940a50679ab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-windowsarm64static.zip",
        sha256 = "2a63317267ffa720275d0a9b77e115071df33b810efa42e525c177945e5f56ba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxarm32debug.zip",
        sha256 = "7e745b5c7d520536d67bce473d4051e8e6b98f5b83063837c6d495e0b99041ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxarm64debug.zip",
        sha256 = "e69990e949bb84ba7048812a56bee5bf1b24a6e9e15d80712b5e9eb63526bd57",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxx86-64debug.zip",
        sha256 = "7bc84c25094792557703b8d05812cf6782edc338f6df1924f365e7d86f6c1075",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-osxuniversaldebug.zip",
        sha256 = "4c683b3f9a6fbfc004b807150bb2695854a8e7fa7ac2e85b4b3d081bc7eee4e6",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-windowsx86-64debug.zip",
        sha256 = "8810b863898c64b8d0a8c35b83cb86f7cfe5e8c7bb178d81ab1bc0b6b927e29d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-windowsarm64debug.zip",
        sha256 = "f3e1e64391a5d558ad5a1df7ce307166c418483638a5c88a659dde6b76a630c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "5b42ef699ca6552d487b7c292a884d8a096fbe13e9c5ec353a02ee6cc185cccc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "b3ecf7e80465046253a044166d8e1d339eb63a1bd138892783f4eb137c7a0f8b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "6405f3e9adab6677f6d85abfdfa3f4dc783fadc00abdebfeadc10b08c3818a0f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "576d6cba78324019f90b2e15d86448c3b8d478d1e24d20aaae3d06356fef2cf0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "400039891339f992591911a2341fe23fe5e53c834359552c0c80d569727561d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "f9862be9489d6480c581a88ed0dcb2d3e33a612643f26f5bfb3321a45060c094",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxathena.zip",
        sha256 = "4f4e02e6e8cfe9b1fdc6ac2e1dcc43fcb5e1d78022faf78c7014539e419ea80a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxathenastatic.zip",
        sha256 = "9f5b73e72ea9c6e65736111463a234c4b0d93a3b65305d52622350ea7b2471b9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxathenadebug.zip",
        sha256 = "4a298822a0a6b10e4b444b4f173c743493251e07f0e8186e4d8df24005c7f023",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.2.1/wpilibc-cpp-2026.2.1-linuxathenastaticdebug.zip",
        sha256 = "3fc191b0e10d9cccaeb3a7b4da33ecdb2d223c12f47276fe3c168465801c91ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-headers.zip",
        sha256 = "a984988a5f2c934f3901eab87065a4a3e35172a67711ae03f3e9e984a9572e03",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-sources.zip",
        sha256 = "fab35f7a3c37526fbb56a5eb97781833a609ed2f276b3a649c6735a4290ff804",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxarm32.zip",
        sha256 = "15bf70308d63ee5294b75322c1e1ca12581a57ed522f734524cc984b743a8994",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxarm64.zip",
        sha256 = "8afe718a6f8b397bbf6d4385fd626ecdea97da8122e1c2cba54a393368b8d179",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxx86-64.zip",
        sha256 = "e144b6b36dab1485c3f81165aa7ab185e2a8831b072105b8ee5453f631d13062",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-osxuniversal.zip",
        sha256 = "4248e7b90fdd4a3c1e78134b518edf2eb498bbafd7a2bfe7d6fa48201d2adcba",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-windowsx86-64.zip",
        sha256 = "d39caa05efdebce7c2f34b0ed813de021befdd2da40b2012401e61ab21a0f16b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-windowsarm64.zip",
        sha256 = "67836b20aaa3e24609c47091541ab6e80557339b85073fb22db56b67a919811f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxarm32static.zip",
        sha256 = "c350217137b5bd2ac4125f7caf48152de6eff2a17032ce03f2283fe23794dc9f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxarm64static.zip",
        sha256 = "96ae3447332f9b225dac78d51d4cd80802688d8277241bdab1286ba7dd01a2b6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxx86-64static.zip",
        sha256 = "03538a465afa99c9a0f764a41b66a9afa67d9deb4bc593709c99b4c609eab39f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-osxuniversalstatic.zip",
        sha256 = "a725487632e3fe1336560671025c4b97311c1834f170801dcde9c401f6ac13da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-windowsx86-64static.zip",
        sha256 = "9cc221a4a216505860c894108c27343d720b9af1319ea1a629f43e66c5ea4814",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-windowsarm64static.zip",
        sha256 = "391d557bb3f5147f1c02274dd642ceb36d06ec8b473e67eebe23fb9392918b72",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxarm32debug.zip",
        sha256 = "657144956e62578f96d3a9e4b0cf28831a6040ddedb5dab765e98ddf387adecd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxarm64debug.zip",
        sha256 = "5db6b45e75d7885719b52db714e224752fb74e0e132d8292ce8bb52d2fb01bde",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxx86-64debug.zip",
        sha256 = "497fc7a3b7dbdb5f8ef991829ac84ddbd00084038f0d72767028ce44aa84b98e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-osxuniversaldebug.zip",
        sha256 = "a2be428fea4c4ad78301d5f62fbd74ea96186f917a03f3555c6b37020c734701",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-windowsx86-64debug.zip",
        sha256 = "0c99f5fbc3f9276284b0c3369e4b352889568b1d8303cb84dc88a1b209cc4524",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-windowsarm64debug.zip",
        sha256 = "4fe89e4b6ff39924074b74cdb84710d4d30ee1a2a94dd2856e13f5d436cc4321",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "113c46fc1dc5f1153fa7e7a02236e285af868738717c1cf3b66642e85c9a1bad",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "1710e4477011cc530175f9ce2720931a26e9f8009a5635c9f1f96eee7b8b198b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "ce34563c9e8bfd2f0a6fb602af598df27258375ed77006f634e384b2ae3482e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "e1a31367e1e0f7fdb9c40553bb2cf47e4cebb186b8a82079c91992cbc0c816f9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "fc1a66cc0c5488e330bb3d28bd5f7d236d8dcb9f34ea48fc9d828c8ab2ed7cc3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "75a42a13f2ce4fa33b5df699c78e0bd0db7939dd9f117a3caabec0866095434d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxathena.zip",
        sha256 = "b03efb270453f2861fb177aaaee883ada867ed00faf14bc0cf68b020c234a482",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxathenastatic.zip",
        sha256 = "5933e3d748a0093e4852d096fc5b98b07ced614b9f4c3888e9010b50697259c7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxathenadebug.zip",
        sha256 = "4c786614652654332b1260e6232c588ed2c6b7c707bb9a08d5369a193b6cd939",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.2.1/wpilibNewCommands-cpp-2026.2.1-linuxathenastaticdebug.zip",
        sha256 = "a91bd8e1da7b2a36dcec7336ee456e82b2359b3c5a577cdac86ee62edae96ec4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-headers.zip",
        sha256 = "f9a7afe4cf11546fc3328a885c6249a7b3af0e23f309ca7e54abbda1c0cbd110",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-sources.zip",
        sha256 = "5d788c0beea02652a782dd353335af70ac223b24d974d2fb193c5808a6172356",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxarm32.zip",
        sha256 = "849e2be7f453121b669069ab9a1e8f5108e405351dc4de6011e5ee05038d9401",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxarm64.zip",
        sha256 = "3958716ca0b41dbca0bfffbcb239733ea6cd1160c4299a9954585aa99d57c996",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxx86-64.zip",
        sha256 = "e05959533c680ba71550cfd8f7b934ff9079711ac138b65d5ebc13ebe8ec25bb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-osxuniversal.zip",
        sha256 = "bf6c72a240f1bd098afb6fb3b2e1938dae1b6d4fdf07f4d840d7a600ea148d2e",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-windowsx86-64.zip",
        sha256 = "499b086a5679b5d4284f2753d14a1f656671a8c43f1dd58a15051f6775c85275",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-windowsarm64.zip",
        sha256 = "4024e87b6cb90ee885be7d8c130ae5e10450a024ad29723447c941d263f2bae9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxarm32static.zip",
        sha256 = "c1e2e0723ae44dd641fb6d9c68735f074a8ede4304f4c603f52878b98211095b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxarm64static.zip",
        sha256 = "ca318167f7e7c40e217d506b5d5397cf9889b71fa4a45c5493fd9d62d11571bf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxx86-64static.zip",
        sha256 = "3bd72160dd41c8ec23ad21e2361f3a9a27d0cb83c123a6f411bd71d98ae24506",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-osxuniversalstatic.zip",
        sha256 = "ed6d442c015a621ca76400359d8391c78c123b9a74d26280c1087177eb0b0ad7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-windowsx86-64static.zip",
        sha256 = "2d13d13f8f5c8a46edc72415c42b9877f41bf49fc375e758f4f6d89244a01b31",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-windowsarm64static.zip",
        sha256 = "58fab94a1e4d34a80b6835e70a3f4c5c25983632a5709e5a04411d21d514d6ce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxarm32debug.zip",
        sha256 = "ea32e77296abe525a8cd1d75e1cf21fa2247c3f3500d32509329c36a7c3f74c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxarm64debug.zip",
        sha256 = "e24eec3751dd97853a8be44c789ac55655bc8fba743dc849d658e1a7d339a1b6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxx86-64debug.zip",
        sha256 = "243d12f82a14f858547f27ca5dbe3c31cc5545978c07e8d46a92b2b6620b373b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-osxuniversaldebug.zip",
        sha256 = "b50fa234c85a26821c541e8e10a6a86be69e1b40d5afcab275270ba4551c70d5",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-windowsx86-64debug.zip",
        sha256 = "19ec7b30b3679987dc5212c1c699454d3c12e026fe64d797dadaedb6f0fd41c1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-windowsarm64debug.zip",
        sha256 = "0e6eb2f53953c0c3cb9d0ac7dc63c5128e36ebea2a722c2c46bb8c09e5a67626",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "eb70dd5d16bd90ddb47d8e816ae3638c085716faffe3518f4c64a0b55943c8e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "d624a639c6c28798a3bb6dcd6719b2a63656b06d5bb7aeb32b45b8a3c12b5830",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "5ceca97a6ebec6241cf1a6cdff975c95867c3ab262ec32d5ebbbe627cf0f437a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "45a778eefffffa0c1013005638964c07b6a0fa4fa00a8ab105e2b3ee442fe1b8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "1f5454d79b8bfb0192d277559e2bb31b4382697c97f167e9f9bb5b077f7e033f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "99bdfa6865f496dfac75d5467bc8940b371442e196551a159e4f1c9d4d83b81b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxathena.zip",
        sha256 = "87667ab0525d1000a8502c884c6d645216c0fea4627ed95e54ccabdf81a149e1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxathenastatic.zip",
        sha256 = "7bc39dace70e6816adb237055624b75f01b2eb35b434c2eec5e78a96c33ea196",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxathenadebug.zip",
        sha256 = "d8ca3a52e85dacbb1ee74838739495d97ba7111c732118bc550e12e37bf3de82",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.2.1/romiVendordep-cpp-2026.2.1-linuxathenastaticdebug.zip",
        sha256 = "63f0237fc04aed260abd73be197174f5765442c32203f2e1a2bdc576b97ac2d4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-headers.zip",
        sha256 = "b09ce9df247e2360be94deaeb6f34edc5723240a0443e957da527e4ca47fba0c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-sources.zip",
        sha256 = "83a24e7d38bdbce0c53cf21ae2901fe2f5a672bb0b334f3a1a7786a67d6a303c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxarm32.zip",
        sha256 = "2350d9e83648ba571d1dde3b2713ea453ba0ab455e2e4a380360a739ad86abc7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxarm64.zip",
        sha256 = "32191ddddcbecbff2432e36c4eaf269608b01aca4bf3e42c0a1a24abf55bd29d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxx86-64.zip",
        sha256 = "ced4fa773a672af932097c7b5af120707ae9bfe7661443fb44e334576e308d2e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-osxuniversal.zip",
        sha256 = "5d18cff1c109a92108f68e3ae56fdf1a53a2a8782efd178f983cb839cca01c7e",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-windowsx86-64.zip",
        sha256 = "053891a1bd0377c2a4e8e7f5e39e06f7d28168abfe8eeb55671d4cb5afff84f3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-windowsarm64.zip",
        sha256 = "e8d5b73ad7dd0de152af73cde4a0e93bc086a1fca405fa06bf321c303ed6a107",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxarm32static.zip",
        sha256 = "5ba2d62f99460d1373493e8cd06adc6e3d9f95731e0127534409e09d55bacd81",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxarm64static.zip",
        sha256 = "29535684d41002848369cdcfb47838c38729bd665a633e32bed1a811efb00f24",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxx86-64static.zip",
        sha256 = "6901b6055473fe436240543081da325cc9afbbe17fcd263a3f2be90ddf3ef230",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-osxuniversalstatic.zip",
        sha256 = "0f32903a2082ed3fd82643aee854fedcc04b5b58888fa1a126a77a28ce5167ba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-windowsx86-64static.zip",
        sha256 = "1403e27154bde3e15b0d77b12323ac0fa6355918dddec16c989a4988bb9f1d5d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-windowsarm64static.zip",
        sha256 = "b44f631ba8ef030a58658d4074e3bc5f4044b66dbeee387a9cf8e7296067ecc7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxarm32debug.zip",
        sha256 = "4d59320b5de6d4df486fa9d4377c3ba224df8da550e1a6762ce69d6e9009233e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxarm64debug.zip",
        sha256 = "c65b05557ee65925a3f04f2377e82c3eea3e20dcc1fb31a96c764b9be8343443",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxx86-64debug.zip",
        sha256 = "a121a96be45bbb6ade1477826bfd7f6a2e7252ace08f88431ec7b8b72ce36257",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-osxuniversaldebug.zip",
        sha256 = "2336ef32c6b27cc08f978cd3ea73c9f2eebd9c694d59bcdf65f8c9e33601a6a8",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-windowsx86-64debug.zip",
        sha256 = "aee166a6a974e5cbadea09795852a90161769ce64152191173a0cc508bdde6d5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-windowsarm64debug.zip",
        sha256 = "1bae60cac4e22babd28bed06bc67d366a5f877ff7622a8b4421a58a21a5e0519",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "8281ca5a899422a1ec04fdccf61069a9f19b677e154358f64da392fd7cd4d8bb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "70451b234d6464377ad5b560591776da50454f8a72f6a8196d8798c018bb697f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "fdf5c28cdf3c863693ca8580106863461309af94e33652066d582855defab35a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "1fd3034a657c75be6513b554778d3be71289c522cf4344406b58b89bfa896c1a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "1b22c670eb00175316c6b6d374ce4291d2d28a1a73811ff3053321916bb22800",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "919cd8909e68fc0f16c059b2b9fb6a5003099b36bf1a69af451160524654602c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxathena.zip",
        sha256 = "6254217623d02b5c7af7776ce977cfe9915707ff8708fea3d1854470adf6fb98",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxathenastatic.zip",
        sha256 = "b38e1293ad84c91c478a3223c20468227550e697b16310715f473a94d52adbaf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxathenadebug.zip",
        sha256 = "4bb28d3dfd2b9c402c7f8b901240f2db650ba7783bbc994bd012c4f41e4e8865",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.2.1/xrpVendordep-cpp-2026.2.1-linuxathenastaticdebug.zip",
        sha256 = "4c66a68a1fcf74a3d5fd4b8b433a2a23be7dfe2314b707067c3570953e21df42",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-headers.zip",
        sha256 = "bdd4ac035ea59a04e7ba30be8cb13178ad5e85d7670fee4d9fdc4bb2f4421577",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-sources.zip",
        sha256 = "b2736f4ba5ac7903b9863c1f7689a8452d62c7e1b5c1abf125cbad8c7cd0849e",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-linuxarm32.zip",
        sha256 = "42e7bc041a7df795113a1bc6caf116648a007d53c9487f4d87a40bc671513abb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-linuxarm64.zip",
        sha256 = "c5675b9ae51b692afa8164ce3d01780559b4ac4524985515340fd1baf8725c7a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-linuxx86-64.zip",
        sha256 = "8644c53c33a288b0c03e2d0609384d4c0c458f517a51ee2f661f45cba8237670",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-osxuniversal.zip",
        sha256 = "39dd9611af70f95201107d075463c115fcbc5ef7e55558a67c61d22886755981",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-windowsx86-64.zip",
        sha256 = "b4300d5aaf690d743ff686240b4305f68dc97876b9f4ac3b504fdfa4f880cb9b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-windowsarm64.zip",
        sha256 = "eb2012b2888dd005a6365990e1d79d457d6440fc134615aa6721a07955924d69",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-linuxarm32static.zip",
        sha256 = "aa3250814722abacfddfbb3d72ce348fcdd10917bf18e066aff88f940889ad67",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-linuxarm64static.zip",
        sha256 = "91af21ecf0bab6c841e626066cded0ae0e6707c71f23e183cf85d932f16773b3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-linuxx86-64static.zip",
        sha256 = "b4dac1626378820d75be5d76bf96be375988beeb6dff25e337fb85b861340659",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-osxuniversalstatic.zip",
        sha256 = "4fb9c54fe2125b7a73dd0bd1552325b1ef46801f76b345cf5a3e24d1165276e9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-windowsx86-64static.zip",
        sha256 = "c775251c6e291d1744d5bb3c8966be84c24334619a769c5880f64676c5a0e1bc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-windowsarm64static.zip",
        sha256 = "83f7cfad17159cdab9da2863607150ad3212def09fdb91743629849a902c8dda",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-linuxarm32debug.zip",
        sha256 = "fd8b05a2bed33c0535f5130db19ae863fb170c94fe287c37efe74bc440578de3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-linuxarm64debug.zip",
        sha256 = "7a3b7d083a59a5d773fd33a1a6d6bd9b370c4abebf229fe76908f8664433e72f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-linuxx86-64debug.zip",
        sha256 = "440add75ff9b0dd757857ebc43a8cf7ec90057c51dca06ee82ffcf5f66f8d9a0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-osxuniversaldebug.zip",
        sha256 = "dbd12cca6f04a95b485f2517be322d931f2c9c2a10eaa740047d0c67c00e6797",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-windowsx86-64debug.zip",
        sha256 = "fc685d81ebfffb8bc863afe8b7d52c3bf9e1d5a1f072b615354f4a715c11fc07",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-windowsarm64debug.zip",
        sha256 = "e2dd96993206dbc4646a0e2ee275f68c211b907fa511b0c9c235204267a8d793",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "c9f454ae63b4cb8c593653a0e337568a8bd9ce24f51bc619953e596eda0cace2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "8b681b285a89ad49dfb69f9e915cc8f020d7b42c727563a48ae8f3b191781704",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "3ab0029471df7c785f12a7a393c33d650a22f15657eafb2958a5e98592820449",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "a6a6ade1b0e7eca1ffe0f4567c8baa856db29ff84d128b92409c1362cb20bc92",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "97dadd68084fc5b54391243723e36c3e8855498b8b0a28b458c4b81a45635b76",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.2.1/halsim_ds_socket-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "5bb571158a51f8e8a7d1941dccae887085d918e5e948d90ccf48033b0bce891d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-headers.zip",
        sha256 = "6312a5886f4977c2f609252e2c9d6631f680a2bb5246c8e6357fb3dcefa1d24c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-sources.zip",
        sha256 = "aefdcd05fd0cd11ac7e8a45d548be23c04b204d821d9bcdb6db7538668d9a558",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-linuxarm32.zip",
        sha256 = "4441aa3320394fbb56ed7185d6b12fea798d5bb44fbe4d28dc5f9073c004e472",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-linuxarm64.zip",
        sha256 = "46d9a93fe5626d798b6d3fe591bd43861639ebabc50f2c775f10521f6388e81b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-linuxx86-64.zip",
        sha256 = "dd28155586c6a2e23359224a4a1ad3b9277a72997741115b9fb9b693ab552278",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-osxuniversal.zip",
        sha256 = "86f6b180a7c999ff4d992cb51260fd3a075c1fce5f168e290192be4441d3aa2c",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-windowsx86-64.zip",
        sha256 = "259450b1590820897a85b01dbd6f2f0c5e479272fe19b794874748ef24dacd3b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-windowsarm64.zip",
        sha256 = "9ad13b350d7d9f11f39d85bd7a0da20a24ec15287f02c4a6e08c796256817bee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-linuxarm32static.zip",
        sha256 = "e867cb54a3e439cac6265f4937b6fa2e676a4bbb5ff924aef078ef8191b237a3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-linuxarm64static.zip",
        sha256 = "7fcd4443c5cacfd3f78aa9e9f9609d2d96d259574d0b3a314ae49095798cf9d3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-linuxx86-64static.zip",
        sha256 = "217b81c642ecc7c3aadf3d002ef3b413d9ecb0611170461ede167f850eba849b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-osxuniversalstatic.zip",
        sha256 = "556078514a0e25a2964a24a7d6fb4763443d00c5b2d823e50c47c377b56bf221",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-windowsx86-64static.zip",
        sha256 = "5fd2aa387104688559e55cc8dc6cb75c9b95b9e6dc1df3e9f0d01b3c1ccb3e1b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-windowsarm64static.zip",
        sha256 = "f295424b799d1f3093ae32d64428926f5823b87b32050f99c4cefc0c385f3f2a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-linuxarm32debug.zip",
        sha256 = "9cdcc2c37884831f29031e63d6de258c224949d3327b4cbe00cb69b4b59d80b8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-linuxarm64debug.zip",
        sha256 = "aba22f552553b86f9afb1af8e9689bbfd25646afd811ce68b82b80100ea95ecc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-linuxx86-64debug.zip",
        sha256 = "9096998b57213a9239401ee8b4560c18a6b6997f4df5c15c5897f0c2aae948c0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-osxuniversaldebug.zip",
        sha256 = "20d1cf55912b9641d41c980a2416ea54f320162386a2f95d2299236dd22d9b56",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-windowsx86-64debug.zip",
        sha256 = "4916696b997d6ffb13c642fcd9711c69e1984bb2a402791685d50a03b72ef781",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-windowsarm64debug.zip",
        sha256 = "1415b49b0124d60f9d6fb07ada3c6fd3c0823e2278ba9d00e008d302937c6d61",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "54fc28401716bd86a8c8bb0af52104db7949064118ee37d192e2f24eafae5da7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "01a37a4631fc0500eaa836c99e1ec34e77edaffc1dd97f61bf6d9bc1a27d7b40",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "11942a4d3f654655cc262bc12e839e0b02f7cfec35189054d573b29d80a83a49",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "8f39ae2c192ad17236918be08b7a5fd69ea982036a6bf47ac936f5c6ea31bbe6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "36da9292787d7d02f19079aae974a465947dd7d52275936b0d4d97124c50d05a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.2.1/halsim_gui-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "47685eb34f748e15435eaf74e035a2e497793add6163cbe261fcefef8d349211",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-headers.zip",
        sha256 = "3a0c37aa224abea0e792431d1e9ce8b6151ab5222503a70e497b90f4a5a0d1ec",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-sources.zip",
        sha256 = "493c51556ee4aad7b689f0f603c227a4a50469f9cb499ddcd5af8c3c385ed71e",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-linuxarm32.zip",
        sha256 = "51496de982edf6238de376f889d4739e930b7b6c267e9cfe6fbcf426169bd11d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-linuxarm64.zip",
        sha256 = "851d1cf225af99286783d73dc46e317e873bde35fc0caf856d45a2806e0d4128",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-linuxx86-64.zip",
        sha256 = "a386ced4fb8021dce77a714a93a4e280a1327dcf3ec87ccfb68b53b69bee8e25",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-osxuniversal.zip",
        sha256 = "878662e06e7aeeff1831e52048a453c115c1e0e612ba14271f750a37247d2c59",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-windowsx86-64.zip",
        sha256 = "d0682868b6825938e8cb9714bb447adde3f5f9f15e6c0d8b280e9a170175d0f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-windowsarm64.zip",
        sha256 = "12687155f7ac760a6b9b4d1a02eed893ec2d7b535c1a9ce102aa79389fb2d444",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-linuxarm32static.zip",
        sha256 = "cf92586f1b911e0190bd65c48556d505b016590644856dd9c29eaf9aec520065",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-linuxarm64static.zip",
        sha256 = "6437efcba6c87bef26b7db7834519261c486f926be32b814c22c02415e09d2fd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-linuxx86-64static.zip",
        sha256 = "c4b45e9477902ddf92f3a30803d1ef5b90831a8cdf6aed6a96f3e1e1c3ea7a0a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-osxuniversalstatic.zip",
        sha256 = "4f4d0610eb1496e229973b2c1debb76d3c7eb9d4a448fb51317291fda6cd9228",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-windowsx86-64static.zip",
        sha256 = "fc69ee58fa3121c2a273cc2ed3e156a02e401c6a50e5a369957ab82f6dc968e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-windowsarm64static.zip",
        sha256 = "ea065132048923462ea2e7fb55e5f4e4cfd23a5d516820f6fa8dcfd7eb598a17",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-linuxarm32debug.zip",
        sha256 = "bea124ffb932489e1dd17c8d7c7c1b117425ab4ee22a38ce92cf7f43ec5026cc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-linuxarm64debug.zip",
        sha256 = "7b72a1ff47a34bf0cd1d8ecd38a91776b96320caf74437b6951f5d5788a90141",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-linuxx86-64debug.zip",
        sha256 = "31a3188dbb7c785991778cd3cb79fbd2b2acddc7924eb664a4874dc00d6c35b9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-osxuniversaldebug.zip",
        sha256 = "eec6019d0daae2efa4c4a484f2c99dd4f43d417365746ab0f6fc878be8165d7f",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-windowsx86-64debug.zip",
        sha256 = "625ce9c22932bb5815c04c0316a4dac70a8dca118a6faaed7a205fc9d2e18154",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-windowsarm64debug.zip",
        sha256 = "c1927b6dd469c56fd05b2f930bf210728d8f2198ee5a2d17bb6dd074d32ef98f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "89efda5d773f1d3e19acae26b7c999dd97fb07444091080694907e0458399b31",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "f38740055b09f502203b48be2164f41a6c8b3b76c02be2d98e5c72986e7c84d5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "01e1714f18e79b53244eabe3c36ed75ab7a66d025e66c3421c2d9b1773fa154f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "48af7d6b516e076a6c6512d0c32b2cf266e317a2b4589697d955045933266fca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "29fb208bbe28925e5554cdce4f50b7f509da1a11c4cea1cf32aa1e05c4195401",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.2.1/halsim_ws_client-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "e42fe3db74c2e57ee1fb91835a95f1d040f106eb627513eed77a685f84d1493d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-headers.zip",
        sha256 = "cfafbffd91f5a68732f0bb7510733bdbc1ddc8782349e5a5b29e8adc845dfadf",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-sources.zip",
        sha256 = "0fd9c6719a01f741b0f0036b3115bde59e19a20b5d9e802dee564edcfa6da83b",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-linuxarm32.zip",
        sha256 = "8a10b2d251b466c001407abd4b480c136b83ed0a8d68f14939907d0835ef64c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-linuxarm64.zip",
        sha256 = "da9d2d98673c57b3b622d8e67878283882c5aba3d742109cd18e94a626fd9a0b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-linuxx86-64.zip",
        sha256 = "15c784caeb4e5e8df6a3c04123055c7e7f62217b886241efb29aeaa5b53aa655",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-osxuniversal.zip",
        sha256 = "c2ff77cd2a7d8ab21f401bfbd19babb4edd564c9cef835fa359d79579ceffd90",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-windowsx86-64.zip",
        sha256 = "97b3b5c36490fdff7101f89d801dd0edff59f2f2625a225fcb77d08ccb989501",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-windowsarm64.zip",
        sha256 = "63ad12511aa60e04c7ff2be18f4b2fa53cf618ea9ca035731deb8799988f0ba3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-linuxarm32static.zip",
        sha256 = "7b7d84651b2fb5f26053d32aee36a5eff8b5d8382c5098206c992010df02eeee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-linuxarm64static.zip",
        sha256 = "2ad51ee23c3ac31ac82dd70cbf0e2bf30d24ae3a9b52c0b7f50102b150845590",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-linuxx86-64static.zip",
        sha256 = "25ae85c386104a1e31cfcd60e2bfc4f423a0a1a49c14228e6e971ad54e82be78",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-osxuniversalstatic.zip",
        sha256 = "cc90fa2870a71831f408658848e80e115627caa03d46e79b04adbd180a5204c5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-windowsx86-64static.zip",
        sha256 = "f8e77bc1d937db60fd7cb04a987d9676b7ce9280d0a8871f2eddb75032013bf4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-windowsarm64static.zip",
        sha256 = "99bc761ecadbd99a40eada34e4064ea1cf2d10d818dd9fd849bdf2be8ca10794",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-linuxarm32debug.zip",
        sha256 = "bd6f9abfd6fdf834dada69226f1ee630b1c9e8ca0dce370df2c18eaaf0e22423",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-linuxarm64debug.zip",
        sha256 = "8366ad2f2db9bb17a6bcd037fae2ba474d9340571e599e810322c808198410b7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-linuxx86-64debug.zip",
        sha256 = "bce85c487d8b741982c3a8b5c822766d8b7a81ec8d7b8214f85086e239e6f05b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-osxuniversaldebug.zip",
        sha256 = "19b956e3d4886c2d529014b76d9f04bc89d52b158a1bbb13e9ede9fc7e493318",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-windowsx86-64debug.zip",
        sha256 = "3daba1bcf653df76a2832abcd62381b799228bf55a826dab01ba5b35b1bc2f83",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-windowsarm64debug.zip",
        sha256 = "c5af6e347e6bd59d02ab4956be044bd39b2d98efb6144314206626db00f57096",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-linuxarm32staticdebug.zip",
        sha256 = "cb36c44c08c7db4fc5a528135b16e46d28c26d94a8ba70a611a56685fd94f968",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-linuxarm64staticdebug.zip",
        sha256 = "a5b666fb61ba53f2fe754f1f8cefabdc0954dc8ab61e5b748c8da987b960e418",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-linuxx86-64staticdebug.zip",
        sha256 = "713c1beb0b9199497b2987295a8cf858d303e8220ec58e6d210fa38f2f3203e7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-osxuniversalstaticdebug.zip",
        sha256 = "1c6dad471c40e51c9a4fc18537d1882fa4bd6395f142315300e8ab0d002e56a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-windowsx86-64staticdebug.zip",
        sha256 = "b4ff3dd9dc5d68e43028941126b4c0e32e3fe994af8a20671f14d2c17fee5581",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.2.1/halsim_ws_server-2026.2.1-windowsarm64staticdebug.zip",
        sha256 = "3d8a5f72a6898728cd2c07bfb4fec71b0fa58b8e84a905517a47d405e18ec0e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2026.2.1/SmartDashboard-2026.2.1-linuxx64.jar",
        sha256 = "e3bffb202c23e0b8e774324aa41d91b8347f5d5b4e333a982e31b568b8b52e63",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2026.2.1/SmartDashboard-2026.2.1-macx64.jar",
        sha256 = "f624a49f946046ab17b75d59da2e7b1d6502fb98e1cfdcefac87621f1498299a",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2026.2.1/SmartDashboard-2026.2.1-winx64.jar",
        sha256 = "b6a488d0b8f0da1c6f9e566327b9cb35529ec72922c7f680f4b71d608c55a27f",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2026.2.1/PathWeaver-2026.2.1-linuxarm32.jar",
        sha256 = "af04b3f35d60d8d84ba8f6ef1f5489e2d2cccdbe17afbba54874197d9048877d",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2026.2.1/PathWeaver-2026.2.1-linuxarm64.jar",
        sha256 = "d828e17273a72204897527e04502df5727de9c57bce0cb515eb37b72203c812f",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2026.2.1/PathWeaver-2026.2.1-linuxx64.jar",
        sha256 = "691a0d03b7dc945ebde9689586f31ff0d1816e74b31a1790964e15ededeff35d",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2026.2.1/PathWeaver-2026.2.1-macx64.jar",
        sha256 = "da5cf6c3bf873b2504ff021bc3f1d4c2ebcdd2b1e674156cd6e47236b1a6af82",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2026.2.1/PathWeaver-2026.2.1-winx64.jar",
        sha256 = "2fc698de2bf78f6f460aed6360871e9d525fb7a96480f707d2c381859726016f",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2026.2.1/RobotBuilder-2026.2.1.jar",
        sha256 = "f94594a76ccf248be314531f1e46965fd6bc824cece09be60f5561559a0a603f",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.2.1/Shuffleboard-2026.2.1-linuxarm32.jar",
        sha256 = "65957f79a4f39ee27e512bb75501484e322ef5cfe46ea41df2fe47bd12f30762",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.2.1/Shuffleboard-2026.2.1-linuxarm64.jar",
        sha256 = "7218e0fde8ada6850b115da26137d060af7e94fda50d32b490934ee9444e5f86",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.2.1/Shuffleboard-2026.2.1-linuxx64.jar",
        sha256 = "fc5c34d90700953cac016f4599f05762c9b758c9fc8549cf290cfd4e6a82f26c",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.2.1/Shuffleboard-2026.2.1-macarm64.jar",
        sha256 = "524714eb798a342f4c5732d3a0c46c88f32fbfa67711f32891a49c0bd8d4db7e",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.2.1/Shuffleboard-2026.2.1-macx64.jar",
        sha256 = "db098d63fce9c39a4ca171d07047b589c373e1da0a2448482a55d464243ced69",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.2.1/Shuffleboard-2026.2.1-winx64.jar",
        sha256 = "0a1e15b5ef89faa0882083dfc32c8bc4e918a235465efe355b2db02fa4335871",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.2.1/Glass-2026.2.1-linuxarm32.zip",
        sha256 = "dee9eefa231e4d3a34eda9af9b113583043b8d1f1f3c094db54ac39ebbb6b01f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.2.1/Glass-2026.2.1-linuxarm64.zip",
        sha256 = "2fe5c52e8bd2e0e13a29554fc8ae87a8683735db0fec2bf01303d7c62ccbc9f0",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.2.1/Glass-2026.2.1-linuxx86-64.zip",
        sha256 = "182e4778de2a7509cfbd7121c97cbbd233649db1e4a0edc493cfa3d97867e84d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.2.1/Glass-2026.2.1-osxuniversal.zip",
        sha256 = "db678fa2a2c315297fc91f9b3b75ba24180c9c5e35046681af543c9df77f901b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.2.1/Glass-2026.2.1-windowsx86-64.zip",
        sha256 = "6bdf1d2944de6a786abf44093b0a58062880e1d74912bf6fe04f009c5bd681a4",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.2.1/Glass-2026.2.1-windowsarm64.zip",
        sha256 = "06efb0392dc912c1c64c9e8006ea1d97f809bba7539322e98d8deffc235d55b1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.2.1/OutlineViewer-2026.2.1-linuxarm32.zip",
        sha256 = "e8485ae6094a6c085703959b154b963562de5c910257ba6c32b6d65ce29b819c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.2.1/OutlineViewer-2026.2.1-linuxarm64.zip",
        sha256 = "70e0d93cc6e7d7a0bb30881ed5e9765351b410506970a0e9baf80df269cda568",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.2.1/OutlineViewer-2026.2.1-linuxx86-64.zip",
        sha256 = "f5581e414bdb9f721a5968ac15329bece226e8edf9377f6d35ba444b7ba1ff13",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.2.1/OutlineViewer-2026.2.1-osxuniversal.zip",
        sha256 = "e6f9a1879d10bf9d534df56be62389651fd416c0494cdc53bfcdf511a796c110",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.2.1/OutlineViewer-2026.2.1-windowsx86-64.zip",
        sha256 = "bb23a37f3252a0f01216c66fc1e6ef9086e8efc05c3cced032c0a11de8d9ef21",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.2.1/OutlineViewer-2026.2.1-windowsarm64.zip",
        sha256 = "5ed95bddd436dad5bde7c4fc6689f7a1502caf7466c9497a19c761304346dbe8",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.2.1/roboRIOTeamNumberSetter-2026.2.1-linuxarm32.zip",
        sha256 = "ba3a2d8c462648e6ee860ff950b272664c1fccd76078a8d8f933cb6b29c003b5",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.2.1/roboRIOTeamNumberSetter-2026.2.1-linuxarm64.zip",
        sha256 = "1a6bb1ae2acaad71cbf421cf2448c32b19d46abb47ffd5786e3211fa28aacd6a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.2.1/roboRIOTeamNumberSetter-2026.2.1-linuxx86-64.zip",
        sha256 = "bee7c546779b822422d91945a69c6148fcec68767ec6262c9ef3940f314cedfb",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.2.1/roboRIOTeamNumberSetter-2026.2.1-osxuniversal.zip",
        sha256 = "a537dab1b119b48aa667badcea1bdc0e654db7b2bc0609e26fe9bf07f42c3909",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.2.1/roboRIOTeamNumberSetter-2026.2.1-windowsx86-64.zip",
        sha256 = "90bbf37d09be3017c9e43b27e34a1cf46d3bf10f8afab3049abeda73cea91fc6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.2.1/roboRIOTeamNumberSetter-2026.2.1-windowsarm64.zip",
        sha256 = "f10db29f54eabfa4c42ed8973a2c93283c091eb651e4ca9163c478825cb70a87",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.2.1/DataLogTool-2026.2.1-linuxarm32.zip",
        sha256 = "fd828993f5c5ad0bb83f1f01114c1dd7e00df7ae82de4ffad261da87148b3649",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.2.1/DataLogTool-2026.2.1-linuxarm64.zip",
        sha256 = "a2f6d10d96271cbf1a15e6dfc6bdd4d9411f806a639759a9ff09f477380b1829",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.2.1/DataLogTool-2026.2.1-linuxx86-64.zip",
        sha256 = "4c03d178efaeb4dc6aa0c8b5e2acdc29eb7a006ee70078e5bc71b7abf2d28c8a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.2.1/DataLogTool-2026.2.1-osxuniversal.zip",
        sha256 = "9d60ab67c5ddcf0d9fcde51e9a4200444a716c155f3cfe8a1617a8c066282fe1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.2.1/DataLogTool-2026.2.1-windowsx86-64.zip",
        sha256 = "7f7864ee16cd1a4cf6dccfba10b44ed82f39dd1faee3e0373f9bdb267d620156",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.2.1/DataLogTool-2026.2.1-windowsarm64.zip",
        sha256 = "71e171a10d83109ab278c71319770985511dcd5a3b550770fc66426fec597696",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2026.2.1/SysId-2026.2.1-linuxx86-64.zip",
        sha256 = "83583c88651a089744a7530e77a911d030f0135f12f2195c6cecb5685112511f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2026.2.1/SysId-2026.2.1-osxuniversal.zip",
        sha256 = "4fe82488f1d31750d321100f2d52e1ff9e7f99abc4caefb143763acc804cc4a5",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2026.2.1/SysId-2026.2.1-windowsx86-64.zip",
        sha256 = "76078257daad94c3239c70f8e89f16ac088614b541c5cf57730d356a7df44ad5",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2026.2.1/SysId-2026.2.1-windowsarm64.zip",
        sha256 = "57c21731c95525c9f041a7da52d607da85d55d5ec6f701b61e181d1c3f30f769",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
