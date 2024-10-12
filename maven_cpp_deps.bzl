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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-headers.zip",
        sha256 = "3edba7d483562e1a79fe867bacc5ea55f615fe307b63e1b032fd6f431110b7f7",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-sources.zip",
        sha256 = "65813895909c8b977092ac90460b90820a64742edf257df1bc538639fcc819ea",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "3e6c8f6595ffd945730aea3379f70e670e6d5ee27bcba6297da8f4c794234a1e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "29b1e3299c9d2016fba3ce021584e48ea47edc91691c2f520e423e7c5bd093fa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "b922fc22e158ea538d466c79e5997721031c0bb59fc8fb017b641810faf4c80c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "66fc934ae73300ad36c6dbe7759ef46da46488121178284d14005d72fa87da82",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "25669611ba8dd4563b8fa37a86fdef85831c108f2e2f230abb299cebdd25b125",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "9c9e1ccf597f9a1d8c4e629daa5e4e1e7d65a826577760a8f865d9f62cc70411",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "c258444545b85be305ffef4ed16d7a03c15dddc19a4fa994348bccecf019e5a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "4ce7665eb8ff7adfb326f463bca7a5443c708b0c9b2c873e5ceb1f4c9253bf83",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "2db17e6b9806811ccde3c124f6533c8b6212e4c6aa673a18477cf56be1f48b16",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "425689f22d49f8c845fa5c973453487d1601768bfbf7e73e0eef98d8d395d5e2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "5897a9e525d44c5516465ad302ae1ae2a638b02fc66364703b91efed528660a4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "abc588cc0da4e7312123809be9a9a4ac13ee3d0164be53768c539827a92a03b3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "fa3249b9d615de58cfe9945b2c0ee00fd4c0cf94409f47699e1cac26193c4449",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "5bde7b83041a8b42b374c13568ea0a2b314d631198ec7c80eb3f74c9a4a42f81",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "f32a7cd1ea96006b150c37f33ca95cc84a439270c09e9080a48d7c0d7b8de718",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "2ceb5b0cf2f01c8e43b2ed7a9f5790c5e1a39b859066213c4f6a425d691cfc9d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "87393f88f2bb85c87041c2af0a21c3f9203b680c44e8c94e52b4e317ad16a25a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "43ae8d7f18d22644673bc2d891960a4e09f3a4228256a7ee3f176315afacc591",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "e92a73b02a4499bad8c52f11e8034f5ef1304c597f7e069c4b4b63e2677e5a65",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "234ae455d51e943d258cb3013d0766d3bf75ba757c1880cfa7de0a19883f7be4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "35916fe41c3d9b565e5baf5334a58ef547f13dbcf1dd0514841268e54ab767d9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "eb0af49a03991a91738a0456b049688a1fad34946439eb227deb973921ca1ee6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "bbb0729718a963e1c77fcd731595499df6556342faaa6096bf91968e43c61b0f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "4acc3f8c167a6149aba79d92348e4ac9905af2377e188778a587bf10be6da22a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxathena.zip",
        sha256 = "3a62a2eff570db86ad6e0dde4dd56520c77e7030f8afa7db2d1ee7b7ed0c4a7e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "a0e5929f0a7430d554521a6ac4b7a54c69fced6836c4437da5f9320748d83a21",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "d2523d8aeb9bce0e5d00f766ed462bfb38a4d448670974df7eb7e824c459c594",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.1.1-beta-1/wpiutil-cpp-2025.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "d5e6ca71a62fd4a5168bbc9f1b486345a519abc36ee7e515ba7b861c8c923ff7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-headers.zip",
        sha256 = "78647a81c337ae360262e98a1bfe555fd06942e97679d49698cadea00bbf1682",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-sources.zip",
        sha256 = "ef61eb0582c653292b62dec4d5ebbacd8c3a738bdf4aec6f150f8e7a158870b6",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "88720e85170e1cf762dd956c3b62c6c3a973eabf28004aa41e27b6d735968974",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "a5f3539e1d5f22e629aa9cbf4496aa3d49e417ce754f8760336ea55ab38de480",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "93345a078dd786cb3a2fa1086b990c19bea86f28408731942cd90ca3f8034ed9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "bf6f067e9bfb098b5f6e5d81b270691c56477b20f01c21fb54dbf6431efa59e0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "a274e6fe3033396d7f61342ab6ef0ff4c3ad9e45bf4fed4007493897493364ce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "786692f60ce918041c6bfe807a9504c3db063d82179a33936de81a4214d6aca6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "549863c32e8ae3fdea6bd3e69d5834dcfcdaaa4178e699eef215481d6125176d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "a1bd6927c209a02581b235d9053b7bdaa8c72ba5993deb1260ba61ed7c4cf9fd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "1c19ded7cb94dedc14a46614cd9f7bce94a6cde5cab3015140e7f56da13e6cca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "1a392b31a402e76fbebbb8e22ff8c3302240a5e8f44d90794fb6b41c14a4aa48",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "e2a7296e9c88f5be6a35482d7558092157bfa80fcad69a812d7972bd624dfd34",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "99e72b379fa96febdbdc9ae946207e26138ae34951702f6d6500e5cf8f35981e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "81d9aae76da5f88f27a80d896040374f4161484cf7da05e0fa18753a157f079f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "cb61024693163f3214985657dc23f3394a6c20fee1ead0e6e5f3f3e72a98051b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "96edbf002a9475f4afb160f40b6148475cff355f722e61e42265fce3b566812f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "a3840d6707b4d4fff1b19d0c4ca66c86d79d74c8c1bc676341b08788ee5d542f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "76c7d2ceb51a6c917ed5573e7243954e57532415ddb8596ce4a911d65d03c0d9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "1ddde2942295641c6f4b4bcace304c55bec0f3043f8cbc81ba23da247461944c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "57d0bc8b7f664c1ae91a2dee28e47118ab2ac498aab2f153e886838aca53b1ce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "e38fe65743cdcfa475c3390eac247b8ab08beb0f6caa10aef988011372e04f55",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "8674e0acb2060ce3f2dbd73b9966fd9a2c28da650f2f7ee4ad7d75d703c19864",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "b99de9da51f757f0d6e0b7a5892b78f8367e27f25d4921e1145c9fed0cf093ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "e5b034e517c879e8f27013f33a918d27caca28e0e0af08d6a2682888101ed82d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "e905734364f809ca9ba923d668fac40b230a12d8a0b8b1ac8a1c3a5c82786ca9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxathena.zip",
        sha256 = "193eb7eaaea99fb583ef8f75d53936b60ba4a2512a99e19b942435e8aecc1e97",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "0230e186b3db98307e8c05717cf0a8392b60174771fe6d5602c48a16378ffd9a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "39a6723c4f3cdecef8886e1d5297c7fc1d3bb1c7adc2b01a69b4300d06b98c45",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.1.1-beta-1/wpinet-cpp-2025.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "f686c9a9c6390eca91b1641e3536b084f69ee292814de7d1145e70cbcd9e2f54",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-headers.zip",
        sha256 = "2d605fbf9420919587da66bf81ea0c25845f9b870558a24b15fc12df2ead34c5",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-sources.zip",
        sha256 = "c06c6ec4a5b5944fbff2bce94acd8db01fe47d1738f26e0d89b09e40e87f072a",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "ab472b8203ec5118d8ec94b4db5d45a8abc95cfbc9bdfe4a0f5581603fb2e37a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "46ff002c19069ec2119da2674734c4b8bff9abe43efb99afb41c4573dee338d8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "7ca8cfa92a5d873c9e351ae3405c6c3d6d1e4f80178b2a63c925254c6fc6d40d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "8ad032e32482df8cb1ed06b2d198f4216762c285f4975db344eeaf548df8d28c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "fbbc40911936aadc4ec940df2f783bba966486c70aa8ece2e4926b5abc621ff3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "0785d587a6b88031073219167ecd9312d5b18a071eae536e1bfca65bea783102",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "9ae6f59f05a26d136b25e93c94cc5fb18b78a0dca623b24075c2c95b61484c94",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "fc5834878146b9a045ace087f89f4da976fdf1572510e0089056553c7b670a64",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "f06f295fafdab178a1df910fb5e6c4534f85e8136b796d7230c4cdd3b8c04dc9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "f9d3b418d4d0d3e6238311f9e1c2139702f4603861c8762b248e9a5bf43bd061",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "c4440b46a956dcf2091d2e6d2e06b4b2c04175d6e1038c76427e4e900c38df0a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "f67c0f112858bba730f5730c405f0bc3ff66188b73514b2f0c001e8f85ee8428",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "f93a9a97eadc6495f7f291121377fc188a0c439058d7241f11de717c529fbff3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "f0b529b341250efb3e61cff6f63f7c39810d7e16fc8453d1c0f7aec8f53f9b9e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "789650d0797492c1cbf75df8ef23629c7c2a7e9e8be777471edd5d383dd331cc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "a6014fc2873edbe9ce054c908efa30c33bc137efd32b2ad9a92e0de1a07b3a54",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "6a70524567ba91fc4ba2f71fbaa4c2fe27098dfe8f844a8ff10cea5ece49dd27",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "09c800631c2659eec6c2b80f2032db03f6048c84e70fc7ffd5cf5c959c789cd6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "7cf4e57bbec132f3768487e4014d85287a024e035e8d3a616d2062484ab42e49",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "526d726bb64b50d0ff1757ecdc3d4134736a728d1ff64cd542fd32dd88034550",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "5c191567155ca66d138704414c7186b1f0d80d2f9a33b3ac7b78f9aecc36a50f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "eec2e97ffa6a8b6d7074271a8ac29b37a6905ebc6bbf6e83ffbb97e920f26eed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "c61fa4186ada7a409e83127cf939daf45f20a3240a0059e8c75da023123b058c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "32b023572a7198eb1e74c7c53e41bd5ed24ead5c6822bf36155a7977754f00e2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxathena.zip",
        sha256 = "853954cc85384cf9433c0e3151edf66fe18003abac275c2f4bf2d12fdaa542f3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "0ce5b72b503d237600dd2ea11c5e4018561ee22313e762a1a4b53b15eff64da6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "de5d1680f8c48ff9c20cf6e5b8a82bff0b9f5cfc3d709b7371d7c325ca1b6a1f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.1.1-beta-1/wpimath-cpp-2025.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "93d7a280e03281e2ad2906791cff0df372ba074611c4ab6996d16b33b8876024",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-headers.zip",
        sha256 = "37bacd073b06dd0b3e15e6002a571b006cde9e3295b2ba2fa8e82db112f507ab",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-sources.zip",
        sha256 = "2246fd6c9618026be99874a592d09a7d4564739581479f2a406070c46892651d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "c2cea3c096915bebc3a90bf47dda1fbd4837759da5b73c586c0f7b16fee012ab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "36cd4d7d54ad9c18dd9f11d7574fd27a207ea907b43cea1c6825fbabdc929a46",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "38cb5877cea306f428b82b16c459c0640802e9e01a291977028aaeb4771e186d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "76f7ac2b5cdd935c75632499763970aca5237cba7fb7c3d34a1c13cdfaf1c1bd",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "d08ef28b9ad6933bc701962e51d6d80b329314e15feae68bf49ecc11feb9354e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "c06160bab023e59c149678740c20812c0f18f1e7db3da115c36d44ccb37ae0b8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "7d6b22799dac88d4694da4c5407202ff41d2ce4bc5242fe2f166651858e448b8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "13f48c92861a8c33d96d5239a41f7ef60ec8dcdfda215eb852989644b1fdd763",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "133dc83b1268d25117fa6cdfbe1f951d135fd6f6fa9b9dc1dd4a9bc492526c83",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "7e4454a82962faa91af69940f62747e07f1757590f2adbf5916ac3386af793fd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "1478c54dd6153e285ad15fc159b684d9442ea89ff8014d14e1cc97b5840cca8a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "0e9d16ba6ff70153ac31a8a88773b949d6640ab712419b13b161ec8ee7ba3550",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "1c5666ba700aabe476a1a27a6c787d2709dbe5acd6497a8596424b21c0b64a31",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "dfcd5c0e67f3166000c316f3490344f2ab2100a31c85f4520fbd9c9305f3b799",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "e99407a4e01a7dd529a33be1e8d413fe6c106dc4335f229445efb2f6678e3511",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "7e8535f2c38bf47eaf2ea4708ab98c4ed5a74d3499616b4ba22ba8a349c331c2",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "dd221ef1050e18b56931487d4637b29cc0a448d3d2733a6439fe56847aa7ae9d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "fb4dc6795e248873862a19ef99cdb586576a670bf4e8d0284f5cb7955dd041e6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "f146da7e05912ee74762addb1d213e4da0feab13e38608f763fd95162b947f21",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "4ed337bcabe1a6012e3fd7422889293c1764efec8271c3c3e0f0fc743ee8c8eb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "94a52a4cc3bc26ae1c6420834dab7c777b598338c54dbe726d6f6c851e3053ef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "8e1b8a5ec24cf1011d43ea9cc3d67f322541bc669f067e3442d876ed9de981db",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "c3f0079445e68699464f6ccc675dcc0f672e38cbde0ff4e8e703fd9d5477e6a7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "4ffc5e4f2605521794a59ff85a2f61c4047c6467c98e48d26a4346d90c02bd18",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxathena.zip",
        sha256 = "bf1ee606033cd976f7d32efa0ef80303672fd1fe7e84c99ac42dacdb88e13e70",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "fc50f577171d8bbc957aac53f310d3550c91cb12d84207c3f86cbad740aee4aa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "6c71d86b45d5ac848628cd642d85aafbf9c5bf1c4050b25255188a876a17119e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.1.1-beta-1/apriltag-cpp-2025.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "404a7920dd3fcb99aa40ad89a56d1f7c77b5a70d7b9ca7d1284546ffe47f49cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-headers.zip",
        sha256 = "3eaf582ff997323911da9484edeb27f0a9abf4f2fafb98003adf07f35c9ff393",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-sources.zip",
        sha256 = "c61ee3ccfa947304ff756af1eeeea7f25bbf7ce75a88eb768da0e540251e1cc7",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "f3767d816b11643156c509f34c4a9b6f3afe5cfb2359d51e45ec2eea26053171",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "9177e2bbfa29c821611f605dda0b33f4c51f9d2b178deaff5c61bef904743525",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "19379deb3f32a430d56d05b77837a49261c89f591e3d9266829a89094a986bb7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "71caddfa15dd81724f41c0460a724b8e5935d47de291d4a4d6117303f142e479",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "bc592f0740b5b3c6a4eefe384a4f9c13df8f09c0ce64c8f60ce5709c3422db55",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "870a7b2104eb369620545990daccc9557c83c21af7c95e77f5c5067ef3a8e846",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "66939a1574a726e5093f279ffe1b0e129092d2f0a77b72642c4beb7b3316caae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "e8ef6f376880eb0a634b30fcd1cce49d51bcf5216768ffcce5064d07275fbbeb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "2f8bb4c45bd7cf6d0cf0983f6692044c2135e92f01ab38e2db58390c02abc049",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "7d8eaab0cd776ca7f582dc75aa381436b8dbd91413133717ac0288ce4c180804",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "04ab07f9ac7f981ac835882ca2713ca52e16af690e3237a104b2e0d41b86d141",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "005959ca0396d4fe4928683c39df2131bc89ce8e4f59d8dcfe437aa6f1be4ee8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "0f78807b050c8abc7229d3553222dce9560fde338a100d5e0aef09bfcbc0820f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "1d0999e002355c2d0ca1ed1adb33a2c6c9cecdd114e669f399ca61a4052ac220",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "dd96ec6cfb88018e99d0e0c271b01f37cfba46e9903925a3c25f3e7abb46272c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "ca160848eff5caf8da2f42423031c87f7fc6a342f28e37d308600923ca3b14ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "687f6b1e86f0191c1e333c868d6d8aa9f123fe8cc8d90c4bd71de95d5f00685e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "686c1966c1026d2855ac2dba45f7146d9d081fab8ad83ec91d0708bdb30481e0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "2294adac41ccbc3d498b05df5efa507888328b840147921a0e736a38af25af20",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "014eec0765d7e77994dd1576bfc55f00ff63acfa3002e28cda2985c3b9259f08",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "5cf091a31693e69323266372c21e2bde714bdf58eb03e17870c08e42d4ea02f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "6adf4911bec5650d078bd99ce9c15fdffac9d633b322ae063e8133448180c57d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "5f40925d8a43301fbf4cf12e476831fb90cdb0d2e7c12c72156c48ad5d3babc2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "76505905876964eb74e405e91aeda9a48ba2e92c7d486497df128cb0cc58ee6b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxathena.zip",
        sha256 = "2321953ce34878bee508cd65e17778b3e7d5ff6dd05293ce5ad0b13ce72e7c7f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "5f01f1baf2844a217a8f92cccb91174931cbf4e7bda677c57fca2121dae9d2b6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "124aaa4d0a525d2487004a6cdb8cfb2a6517b4bccd98121e114281ace7223609",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.1.1-beta-1/hal-cpp-2025.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "9512cfb718a336d315fe533aca5ed25630eddbacc9cbbc3f0c0afdebd809ce4d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-headers.zip",
        sha256 = "605af4468a734b6b19794aa3ee9583b109bf56a33096936a20afd1301d5b55e5",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-sources.zip",
        sha256 = "1e84a222b5c07f273c2ccde39f39791ef2fe6ae14bfa26b27cbc3d80a61720de",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "cd132385667cafa6b0cf6b164758a413795f588ef57670943a7d8153be7675e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "c7b0abdb207b4e6fe92d720cf3f0534f6fd87169e0a283331fa8afea915881c4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "e0b4f680a962bb707cbb310619786f68f0c62277fb45fc491e8cc3aab67a85c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "06f909ab5e3217b257c37dbf5d498d56e42cea54aae212828ffe0097393711d6",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "9af42615396d6d1f2442b3fd768018ebb0fdd9776079cc60419d5e1dad04f32a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "38bc230bd9c4fd702b2ab1919bbda5f354c0ea01506e6f66959c4faaba9ae4a3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "9984eda1a0a8f6d3bbbfe165a868726c7dd2ff16c5d765c8b5a3593e5cf8f14a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "59461c6c830c760cabceb6356fb974c29927e1dc42acef7ea17cfbe07c2c7d52",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "9650b52a5243eac8935976b27fa7a2ab0bd763b9db8102c78d1c6f6c00b5a35a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "dcc8da9180b577052067dc0b7b9575c1210d2ed354d73cc60c1e40aad86e6bf7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "89a0b30e1b952c01fa37f4428336c5f9ce0a4e9b53e99625c081daf7992d2cdd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "1fbe59102954a87a045d8197c7605ada4d05e61fb599a19930fea7a798b1881e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "cdfcbcd2651c78026691cfa84115352fd95dc008bddcbbf388f4ba2c46c0f237",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "0d8716ed243f45c6142594feef5030ecb76a72fbf1ad17014b090c2a37dab8ce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "1b06da1c7e8ce8aae8557a707afc64694eea6eb51476d04bfa2dc0cd954d099f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "07d34113d35d36ea38f5cba686940c7e02fa5f055ed7f787e388a72c0ea2e035",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "1059592ac7d4b66d749d6d94c9ab0d87ac89f8693495c9c638e7be75c70faf87",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "0c9c84b54cafff7d99da14d6e1d9a5708007e134ee26fabe370744e2fabaae8e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "b40503a0b8b242f04a89b698f56af0fd527041c77465b0f7f5f3f62035c1b0fb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "f5ce7ebe79a91b2c194c19d356ab79fc9fdd7d6d7d8da5183a2e2b05256ecf5b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "7712fc23cd93922a35e789b46bffb946609e963b77670d0dd4ce681ed2a25268",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "bed7332db2bfa9b769f23c71bdc6a3d6821179b2be8933be62cee34c3e5f4b9e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "02f63c458fb9df86dfd492c8acc7576c010f7a0feb184ccf2227b5bccbcaa0bc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "5eafed1b863f971e858a8db1f7ca1ac0a0104a513afce499a4ee7487bc6672dc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxathena.zip",
        sha256 = "d23939552d4a85bc7961f32e62932ef3ec4c37be2e4a07eb1a7a1dda722df34f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "e99424e9ee8a70da5addbf5aebb4a8cf6b4f5835d8e1f8386699ed1f925aefc8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "a893a8e714c3ad5fdaa802be531d5a57cb3b6c63d41a255396a9d40691c6c6e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.1.1-beta-1/ntcore-cpp-2025.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "2434640a4382aa53e57ed6b1aebd9c766689dd67ac6f9422af6ac8f11488997d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-headers.zip",
        sha256 = "44152a1fb216dc317e9f9fa7a2b688fac376a2116b25423dc22d041f9f217007",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-sources.zip",
        sha256 = "0df450b7c55d3ce1d55932b6983e254e47700f35529653e156e365e6b1f10fb1",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "2678a0955e1186d9b5cc7cd41264e21edb5307ccbbaace8d728df8587cf84bdb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "8a395c99229ef204e48f754c499bae3b0f2912514683fe2eeef6aa3fd9a1883c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "9f0453db27573fdcbe915ede73839e68bf8858ad9439dadc6e539ceeca680f8d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "db5568e7c3bfc227c97a2d75773d476d8a43c2d38e44afc43e3b0fc05128502c",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "7d938901c2350515fe6e0368b469030755a717cb0bb479733fc845e5dbf34929",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "0091037df55fee366ce0756d49eba0f1dc7c6532a1d383bdc863192403d4baca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "c993ff7d9d3a58edc6ad95219f6602ac7ccedf6ea7f747cfe396a4fdcb35f36c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "1fcb18e0cfa8acbd6ec22c8b556514244005f56c683126cd3ba9e1632193c53e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "97284253df54530be349f9d3cd7591d7a9ffd20fee66c02f27b9d29d15abd37d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "9e9887a129dbb037ab394205e28e70a0f1586ec6fdac296f35421d4545cc61bd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "c99ec8200fe73c2100fbf92481c07d169efb48921d68befacee518bc3940fc00",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "13ed955f18bdcac6bedc5a3b8d13de214d09120007bb1e2dda0a11b75f6cbe0f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "2d01bead8214b8a1dd98e2cecf47ab2f545fa0b847cae4b846b1f6b155248303",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "d5d823c5f2c15eecb26bfd68a0bf8694a2909eca80c7d886122cdcdad398b691",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "ae599bd9370d9c4dfe957947e5764def47becb1fa272091990809adbaeadb976",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "2d5dc5cdd5ca1d2803b29843478a7637970b13158543d20da34ca26f94feaff1",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "c48110e1c3be8f3a40ed2ee4ec69a4adadd4a5903bed4c9ee0f587e0cbe867b6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "53f385d29b9c81a8123627ad02871a2f41f12809dcb443b11c1c415dff718714",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "b7ec50ee4681dd271303a0236154f585d6ff8dcfd31c44bad58013e59df6daa8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "d8434350c11da8904dce5caebe061fa49544cdd0a0c43d5c6058f3d0c1fcc1cf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "b7089862d088559dcc59e416f041e1c6ade3f3e0f61c6e3abf1ece1b8168d2cc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "d1ffb85bedcc815017a62fdb5b28f97dd85f1360714e3e550b1172eed52e9d4e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "708cdac6bd38b22e52b1bc081800360e6768b8200a725733ecaf951ceedf49dd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "2a7030a45b5ea9d68be0aabc6433ff96589e57ba69453a2ddb1d18205c5fd05d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxathena.zip",
        sha256 = "b4399a364ebc9ad0292f5a6d17d03fe97bf88a38c4cadd10a605e3aac992522f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "5b65d95e2c4e5481552de730da139ec4ec65e4aabb450e1e236157ee46d65b08",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "bd82687b75fed88e2b6847da93a67b68e4f127fe85f4895da2dd58dc8c736513",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.1.1-beta-1/cscore-cpp-2025.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "8edeb0fb5924d463f9d5e170792cb7ec9caf831e9d23afc6776c75775524cad3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-headers.zip",
        sha256 = "cc907f44473d769a7f8d3b1cb0426a945c417fd3fb1330d7eb8d57c212dc9dfe",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-sources.zip",
        sha256 = "ba01e15b8299c2408c87bc4cecbf751d678b07ec2b4cfe747db3eca3e7ff7805",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "0519f37ba095bd8ee4177f59e667f84777c01320536a4e786fffb675305c5ccd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "0a18bd7ba922b65a60179a44c684eee5a095264741ec96b1bb4401c4506730e1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "b34a84c838610770a88eb915e338b1c448388f8359cb45e0e79349e0e22edbcc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "8e957f77b70f73c238659eaa72f54184cd8a220ce556e815ab40277fbee0fc89",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "55193b97df1747cc4321e1bd99c6082e96ccebd1846355cee5c730721f7414dc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "1a9743e11388c73c21af072d2e7151030fc40494923a269aab021370b769c8b1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "2c828761c2d9dfa211176869835a0ac16116cfc589a57cc6b9bb19936bf2a1b3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "4e9a33d64a3dc20bd6518014e8621d25ee2a17c8755ac6c3dc468c0b9cd5aa18",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "46412a2a2a5de9f09135f403d27b91a56d71e99db0c1db160d91b7946203a94c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "70ad6d6c45bb1c2359dd0b3c0f03a0468c694c96d08784dca33ec4984e8ecf2a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "0cbf1117f342db6b4924c970d4ce2b6bd2fa5bb386af8c150eb387187f969546",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "6081568e9dd3a7b88092235a7da8438f3ce915469e6ef63e0f66a39868c682be",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "0d994040d7f3e9e2c7d3800fb2da34477e1097c186c0b883edc5d52e6c284071",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "0c489baad39fc9cc92abfba4ec37e149eca42b13ab79244c488ddae8e4377562",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "c97bdf2983420aceb991c5c077b2c6a0ddd301981c5eb3f6f8b651da75d552f3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "48979da1f6aee9ba5dab65d0a33c07830fd5508ca371d74ed8193e15269d49bd",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "b33764a50a54d35b8c47557f76ead516a9d60168fe3b815617a6d47972698f60",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "d1cc0829b333138a64832b5d9ad7ec3bc9b31f36bf36f24451bf212d8444aecc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "a2f637fc8645243211c5965d10e3e633f09f15109f858711a991ffd8c4989c9d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "c72424cc99960da75815fb8dee2ccadcd2273b6e617a6aab2c7ce2462ff9d9da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "8b9dfa2854f5ff2722c7f499ea06ade39630da4d2ef3b54d45995efd223d1027",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "b929fd74c59da03f630a2b89fb9a4b21e1d2994f9c509ddbabd48b720e805f0d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "9dbb15d0f6d3befa914fd1c6140fe00070a0934f9b57c51f7f010646e5363ddd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "ec7b046b581a8e48aafeabcf9fe73b9019093f35c02fd859d72f00736f6f2270",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxathena.zip",
        sha256 = "cf4fee97e94a4f3d3113f4d681d85eec2493fdd7f0e9ff5f2b88a3c818a98378",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "dcabefb701fec044cbecba283250f0d1ea4d3b59e3b4166c31c060f69e2d72f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "e75a00dca842a02bbcb7e077b77edc6497c91d4a2547d7f2f25563364a490e2f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.1.1-beta-1/cameraserver-cpp-2025.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "a53d3d38b484161e0b21088602a165502f96f6e0a17f46f99beb97029122cb4a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-headers.zip",
        sha256 = "92a3581544ef7d3b5c041ba59b56ee7439f4429b007d036c126d381c62103c1b",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-sources.zip",
        sha256 = "6663f07b99e18644c753d16bca8af6a097ea1f34ecdb57a87d15c32c2829aa8a",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "4abd398e8589b2ce179d3985bd8fc62c3d4c61e95c791e1969ee79218f1b45e5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "443d41fc9923a07c2f18a787bc3a2866821b439003bd3fb287f0ff86bfa14427",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "608424b5dc3da22624b9634cf28f2681f6c8f104c750401f9b918e04b3732e3e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "f718f442f99df189658294658e14ab221ecb88387043ad97597a250e09a4acca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "fec4b599825f7d76e4170b627d49292ff35a2f1cd04f8d9eb2fd4f5e1b84cbd1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "7a84ffd130c572e8f0624dc4f5106aff4a3d5ebeaa4c81e907d72bdbaeeea781",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "de1303721c02a6d71e53249d07ef6eacdc0fd6d3bf2b8b3a8c167b7f984725c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "cf8f53370d673797ec13735232f0abaaefd4fabd3d76e117a98a4d6dca192f0a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "5b1a4176e363eac43c9201847267870cae4956ac5b5bd500ffd1aa0d1eb4e01b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "068f14f69b91a4535118d141dc7374c8f0fbeec577ef7325cc5e1f764f69cc8c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "58a21811f57a1cccce6872477781dd09ee45c2bcd1a6896fe9e6a33c7799aa9c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "215ed8e89d6d487f5f1dd1d72d8a5b4c8513c884104c9f350ea1cf0068cc81b7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "83cadbef9495a8b556b479f3568d48befb53125da8fa99c4f076d473c37186c5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "c9c282ec33f0ee04fe3f6961171f0af57951c31ff2dfc9cb84410e5fc61828b6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "8bb8ba5f5e218b80584e0a9d30ab8888c10f7da0b2c604942dcddafae8a84acb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "b7b928f53a5aaa4b2d5a894e8514789c95b425076f0558c401e4d89a79dd2a73",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "e618a92f6ede8af13e9efa82b0ff194452fd83804901468f588ccc6bd742cc53",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "f917c002dac95d40eafc142f188fbe253aeae6c0bcdd37acfd2cb2add19e94c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "5113483f03d4e17fd98e49c083277cd27b5c8b9769af433d33858cab30336914",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "e618bd0b0aa61b54fc2ec07cb7881c826fd2e2a4f4634065295891fe9a23199e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "94123488db5791b6b05ecf5ef076f7fa3f4195a8d6a88a4204fee9729b9c86da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "9fdce3ab616b23278bdf7d006a0ab1855b6ddafdf0b4280e6f550403f60f4551",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "e07b2b08c016fefeebe0633293a4dca4a801635d1a42ed681235aa31f1cd0141",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "007ff1bd2f96bcdb6e8c2a7bbfeb1ad5b1ba4585aca6d51ebf25db4e69867150",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxathena.zip",
        sha256 = "8f3d7aa480b36da9a1924c6186b5382c5402c0593cfa585016166cdd2f2d1cc6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "e43a51e7bbb88c84e0a26eec3ab5ecda2d82d56f41e73e656b8603bfb0335893",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "59d8bbd12603b671a6b5a579650e659dbc0b84a0042b1dbc67a721512febe707",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.1.1-beta-1/wpilibc-cpp-2025.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "a5fd24eb395c38a6efded224d261aa930943004253e059eafcc79736c0aa3bfe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-headers.zip",
        sha256 = "db91f1a5cfb533408a6851c4dd8c04ed260d77428691f2336e175584a92dbf1b",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-sources.zip",
        sha256 = "e6cfda8f4fbdc7da5c34c0e9801651ffb2e68dae60f7bc127bd64794e6841c2e",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "bfcbb6407ef65e7cf80ea2c759abeaebbb66b5f0642f595532637e2930558bab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "750db8b950ad1e51ff20ba21acbda516392d7100632556acb207e1efc74e7a9d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "20a55754f38604de4b173a87e6d3ced03bf9191ad3553b0fe45ea6cc9c53b123",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "5d282fb48cd70ab9137b170d045500ade9bad88dd11f1defbf909fd340533d94",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "0a09b7758442024a94669999eaa82664d156e13f2ef4854b296cfadf143c9755",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "674b6b86b27fcafa7c1937cc7ab650b3b251fa96644c37a5ded360c2ae98be2e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "14921fd6a5234dfd606a32bbac85d0244e205932f6370827ddaa049cb584921b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "b1732e0f49231240eae4f8b0aec48d75819a689e93f93418a33347a1bc756099",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "ee8d5fa82467e9b9d2e970106fc7bd4a26949cf635966624a009205a9a08a556",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "e55d31348a840606febd52256e8fdde2f076089d0e5465a44c2c05f3eb09e257",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "c22c2053040a76069e62623f04c6df16819fb237d9605b8eb3e728ed946cec6b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "b367dfe91ccead14a82c55ce20f20a11a10d68e811dae50fc2b82422ab960f3d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "26244aef18daa6649f29f174744907af78217b9f4481575f1adc3bddf738cbbe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "73f73d17ca06a8fe5002aecc91697ac7cc887918f67a47a9644e7f61ab1f09dd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "03d79a0d770b3d23c59074bde417f21525d0a55054e900aa29a9dc052cde3e2e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "c004f54bb5b3663860ef9b76e0a4210e95ad5b2c77938c946d77b93db18cdb53",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "6c5c74d3bfd3816ea9b306a427f21d9de9a33439f6c204eaf73633d0829c4a34",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "40ff6bf1b47bfc602d198c5125e3e3b7b705cb26638cdf792fe0ae0727d71040",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "81ac0ca83221bed932c0ed970a74ea438379f1f948b8d127c3aeae0ccdf05d52",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "08118515ac331a27249b8e9a65b01ba5e727ff63ceb9160589e47ec415fe6462",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "cf7244fcde6dc37b8a3c1898541969d91265063b97dcc80799f7ba6cf2648de0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "3d65e552d5dffa333abc8d6df18609e78ca458afb4a7ac53660abeba627a4394",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "1fa8c2c575b6ebde345fec0798d399dafc8bf8a71252937a29200ab3b9a2de32",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "e4a4cbe40f12a55c75e74bc33b75beb527b0a8f2a5a36958a3d80de49ee58921",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxathena.zip",
        sha256 = "eb22e59004c6db273ad0547c72614ea829082cd1f791b58203925073cfd173b9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "ed3b33d67dfc24cd4c8f6bec56feb5dec9bd5df2705ee892cb3482bd9e1b18ec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "a025a23463edc1d3c117cc937f8ae90d8d7c336e960db30174e07e1c0185d372",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.1.1-beta-1/wpilibNewCommands-cpp-2025.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "60cd512dcf54409d58216e7c55bffe338a9937a534f002eb32a2d132238b8b83",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-sources.zip",
        sha256 = "56d8f466d09f90c91d7c121ae05870957f9e3f8a5fce54399c6e642c1d55a91c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "05b891d8a2117a9b44c018bc37e8d52617af0fc674d594fd8ea2ffb20d1f51f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "acefcb575e43746d1185f7d6f31607e0aad436d89b057e898b96dd4cd2c560b9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "f09cbd4326c3be3c6b561327899888213101046f61cbeaf18d3e131e266759be",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "ffc3dcd993fd7fdccb44206b9fe2d5588b1134f57d9a5bc8782fbe54e403caba",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "5427d253aca72cceae3f05c5e6a9180c457a73153453cde2da86a0daa5600b2e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "7377bab6955f362a77dab4531c900461c0f7b26bb9daff17ddffa315982f5ae8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "9022a7d0935d925db5ff19cda43a0ee9eb1eea64349c2ea38acac0ba337c06b4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "300b51c76aed25290e3c8b57108d56447c00091d828134e8967e32c1a0b870e1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "517fd971a6422a1768628c5de5ec55dcb694d824ff33033a311ab7721c00438b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "e196385da44ceb05da02293e800f19eda0755db64adadaa9591b8bf7f0030859",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "030a45d47ef61431f41a8481c5b1aefa566e971d45294ca1280fb36901b90691",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "53a553f774662e978730388ce65c4ff1e14948aef55988ebc1ee1e571b105d7b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "20f82dd4f0bd07904fc0cebfba0c89ff8ef27b1acdf332e1836cc8ef273fb47c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "2b1b1dc564639a1baba6ded6566c6f0ab7ba848979721c7aa7adbc0bd7ee1659",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "3570716049897033450b08d1e7904455e1674bd9b60c1ac2e03303eca4134f95",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "5407f4fe95ea99edfc994d51e345a9171ef139ab70381d412147f1d0f0090db2",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "2fa62daa2b3acebb7e37b1f75a94bb9a364e563a86821d51228bdf1cfc9ade08",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "ec2aa729e167185464c05b690a66c0238c8f022b90590e0281d36ceb0e7fbdd7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "7a12ced5975323bd80ce16021336042ed3a61450bc8c98a7a17a883ff58523c7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "3a1cd8042d30ae588c5c822cd2363823722e789cf26b88f99c3857e94cc21fe6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "721c3c289620b7fd3b0551858f7dc8ea1fac7dee9da73b77282da566f9bcc898",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "b05ae5073885bb48128afc9dc0532d4c958acd493eeb7c09a12905b24a3e7003",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "a404b292b49e0bb4dfbb45bfc4951b64e75e00c8877c136b2325ac4590a65d0d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.1.1-beta-1/halsim_ds_socket-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "e92e12b9176703ecc5039a11e96ea1d5eb8d7619e15a1a1ebe04801c459970fd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-sources.zip",
        sha256 = "a715ce9a4a5240a9d47d329930cd9ac8c42afedeec50083c21d8d889021f6449",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "f9351e20c8348268c3c3e7fe10eee1827e89f102648c23f9473fb90d8b8b6c44",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "c431f5ad69cc1493a61770420194fbab127ffb8be10d5f01ab257ee9de400ba0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "e55a08056926fed1a6c062034210c4adff809408c04fa1411a7ceed5f713669a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "a764655d16918a6d14babeedc54bc6a2960ed40b2b709e335bd096a86a45ad43",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "66977a720bed21a380517b1705b48490566cde62e5ac3938fa5b5e855639d9a6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "cbd8a0ffd06d8e910ea72fea00358b5d17d94daf8e74a55d9926d533087cd615",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "b99d69a28a9a7d6c7bb6816c38d5c0d65b3c0324c4eb5ff1d11bf5d4b50d4c11",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "8d5a28f81671185b3fbdc0baa2813eadf8d2f15640f2b8a124d81eb880568184",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "b27741f11bba64f69c82fc82d15006aa5f3537b7b33f759a7602890a7fe5b358",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "6b2378b8275030202e44f3c2ede16bf32b63c07f16ec23ed7eab0365b211f7ba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "8fea8189d136cf4b59876bdb5f427e1749cad94771b4cdc9d38ac6dee7b9d038",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "0782a1debd6d56d4aecb5e46ed3537de230269c6e15ac5fbde6b14c195bf2352",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "77643ba084f30c53c2c5df6a32d6b4a9f8d6e8c45fde0fe2df8bc2a565266ce3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "ac0fca37158b01a8656314f1c8963171a15a59d4660fb05e72b6d71275852d46",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "fff84fe7d78967ed7cd17494f04d7803ac5998fd5ef71cfebf7a73e64dd22864",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "94252e2ea348d533bd02a41cef3d70277c81d7908ae5fbc99a4e1c0a92584942",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "99b0bad69e1424365522d38ec93f31cba18d9cb0109db11ce366e1c601482338",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "20e1b9b06166bc8c2b2c5281e6291ae775891cf666dc58b2464645b9ec08d43a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "1e1ebe31ce380b14d68493ec85bfe94bd0cc3bb06c3c62c0760156af080f869a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "b5ec4fbded022d189c98eb62da5afb0b84b2310af6d3db0f30b372328aae1c5c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "c26b4e59083bc1d479620fc1f7f507958ab2d588b668b725777f25c0aec671f3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "adc99bb07a9d0e36fe93f2c10b603e5d07e38f55377dd498770c49315bfdb09e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "ea3e5c4b2b67c89c7f8cc067b83b7499b18359b621f21749214280370e376ba2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.1.1-beta-1/halsim_gui-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "f633a4022d888bc4dff9c36549b829d3bc34b1922c8848e3795e9d28479d756c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-sources.zip",
        sha256 = "14d45edd8ecf3da66422fe0f81dfc394bea3b2809dd6a90cfe3af05bda681b56",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "1afac0e876a37fbe58d5a4c11e7b684e08a7335e8b501685a13808c16977aec9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "153f3e5b924a0115cdd2ea3c46210fef920ea9cfff704c31e0270747c4bbbb14",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "67fa5e56cab0f9933673bbbdb1edb18c76d5b40119c1ad3759115ab6d8ec2cf6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "64ef83a7d2f53026904a8646a755a0d4ec022484bf3ec14abf18b5d1fb8824a3",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "0f65976a8b96237d2e27374bd3d98b400a2e6d65aa485ffc31e54ec368826a70",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "a292ceb5d6607f515935be9825fcf771ed503b377891a8ea8ff1ce3078272401",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "658bb944f83b9c9152b4e7d1a5738e43aab71c2a83aa5a24f71fce376c29cfe8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "a54e39849991e5f3fcd2d5f3f1557cf24bd3997cab35e5f0ee5293a011e19a42",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "8aafc6ed598e17b0b0571dbf9e4ac9f89e715463e6ab22d7121b8a8e83d9f939",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "04a7b738e1330d5ba58a457dead4d3ea4fcd111794c3e1339d61238c28c3d282",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "4e4e6aabf3e2d8e395fd269082cceed1a1cc3030b4bff7734a2e85ebc85b211a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "20e423fc1892d0902b913affe5591252f6890733315e3585268e60d887ef0de2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "69263d2a988382a219a565e0f469e90fea449b8ad29777d815e18f53fc6a0e04",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "94a4b76f5e3c945b3d509584c4b4cfdecba58c1a9b87c3980cb4ba21d050b8bf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "e78947667e8866b28701eae7eb3277681b5ef4bd96dfa1c45773160bddc1bd42",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "52f445e30102bd6d02a4982c5e5d405eac5458d7ccec0efef0f13d54fb47d8ae",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "7c01ec0f2dfa65b0ce1204adf3a847e628ecc7bfccd4b9e2f110e9b9e682affc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "1256db02c4afaa7f99af4f519afc8e28da7116c9f1517968351ed686be6e0e4a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "f2f1b5f47b4b39d7d5d9b5912fe2b3cd05adb24f8f023fd856740e7e11155669",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "4162aaf2500241b703f1e7027fe61a1384517631a56500bedbd9b12255ad64d8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "3767b0463367a6e2501da48df06535ff6b8fad17d49359311b30ab74fe7b46d2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "636a9ebc63704f1f5154f7c87f0126571f6305214e72675daa56e1f6c826ec9f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "5051906177f212a02703bbf91c687a9990b18dee8e36272707559e4e7052496a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.1.1-beta-1/halsim_ws_client-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "72fabc7e919a70f98d14913be7bad8fae3c558d42d124250b346d8b7cb9ccae4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-sources.zip",
        sha256 = "def2f0b2ad401556b484789af66c687b075e8fcc3565f9ed11ac1fd56c8cb4af",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "b2df91fd955631dfbbf56cdbbde62b6545ca81917968e335cc5ce6ff8a319d0f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "18854f390dec0c245ac7887299bbf453ea9e4303e17fb5d4b68d6407bbfdacb9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "e2e2ff0767429a308ba3c0a6bcbd768c9680ae71413b9cefde6b684451bd4f96",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "639297c1a553528bc2dbd7542e1884227e1ad0075070586c2c1a725b7420ecf5",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "c417514e85cab84133cdf1ffd4b9ec7c011175c6c7aa73761119cf60077ccf47",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "a619cc4b43d26179d6d118d61634b19f06a3562023bdc9f2a1dc5b31156f71d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-linuxarm32static.zip",
        sha256 = "2daa8a933a53782f4fb9ab3e2623d14fad1ec1412fee8cc6f96a9d85f4ac2be4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-linuxarm64static.zip",
        sha256 = "9f23dbea474c8af589747e05a4903216a3025936345a110f35771ab887751045",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "d7c5ea213fd394707f4ec48678fcdcf3535bfdd876f7af11794540531b653e2f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "d59edea08b3833dba65bbdc0af968ac9133cff76d45686d4715616c62fda7b9a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "11bd6a4f1c578b007d355593c4f67ee29db38bb7fea1d5f8633c48ff724cedd0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-windowsarm64static.zip",
        sha256 = "1ae5e426d05819560a4e91b2af6717e7753f69374f34bd99c679a8728b670197",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "808ac3edc05e3714f7acaad707a42bf2b75f7dd9fc58f05a0a821d3b2a11077a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "49870d25497d1db70224d448eab060335d15ccb12d92259753d69cba01263d9f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "44430283320288ccd8df52929eb28c4583d70a41ce852db1a687742edc71bd6d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "4b517d461280f35c148ff923a38455f11cdccacfb92d7f264052dc46d4cf664b",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "f94dff5eb8570e4ad1f442df50aec8c1f2beb6795057b0198ca0b9bdd2e0d321",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "67a16979de1ab832612c9d9c5802edba08c8bbc8b7c2d8d12ed0ef17402eda55",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "9be9dfe6409f5de6b25273bdfe9fcc65a45b162ec5687562df77236d6e171ae9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "1f54d8dd38b76af45be420e42e7c3a1c36f40ed77c0f67fe4a8ed549bf74cf74",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "3a6fe87b7ca8a7d26cdf4c9c43675897605bf96a9c13075285c9339b8d27e652",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "486d20e78087ad208ffedb9aeae1445e63027eb6d0ed10ce8b44a5959ad77264",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "1d45aa29286bce8bf99697a36ece73bc416fe184b3d2f303eb2407c442fecbf4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.1.1-beta-1/halsim_ws_server-2025.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "eaa6b7fc716730d8439b01f754e5055856f808d2dc95898b22d52b621208a7c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2025.1.1-beta-1/SmartDashboard-2025.1.1-beta-1-linuxx64.jar",
        sha256 = "eb7a9ad7c7212f9473ca150422c6b45b2e864b5dd26148e9dfef784d4387b071",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2025.1.1-beta-1/SmartDashboard-2025.1.1-beta-1-macx64.jar",
        sha256 = "63b73b60ac20c7ea1e1fef7eced3e8eaedc0e39d5c75c64b8ce499f481ca78e8",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2025.1.1-beta-1/SmartDashboard-2025.1.1-beta-1-winx64.jar",
        sha256 = "6dba9aac73c24989a62865b76d1c71f00d3b7d32de1851c52eddbc3c4ba5d313",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1-beta-1/PathWeaver-2025.1.1-beta-1-linuxarm32.jar",
        sha256 = "b626889f59cec5b864e47a9184d4c73f7ff298363555e44a57785c6b0f4b3295",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1-beta-1/PathWeaver-2025.1.1-beta-1-linuxarm64.jar",
        sha256 = "e8396fac5cb476f38a84f957ec8436bb3b4f966b3f4759b780b68deabb02ec6a",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1-beta-1/PathWeaver-2025.1.1-beta-1-linuxx64.jar",
        sha256 = "bf22f5b4ab323f46d87f8191469712e1c962fe49bb53bc0fb34dba453bf0c5a1",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1-beta-1/PathWeaver-2025.1.1-beta-1-macx64.jar",
        sha256 = "2537d5644756f8785ef8f63fd9c8dc12aec6e8b48f4906e9b06cedf9e8969952",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.1.1-beta-1/PathWeaver-2025.1.1-beta-1-winx64.jar",
        sha256 = "da9e0a2c94bd9bcc98993db2d18140907efeb763bf53aa04f4df10135bc702b2",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2025.1.1-beta-1/RobotBuilder-2025.1.1-beta-1.jar",
        sha256 = "4a65e72084ef599344ccf9189a9ceffee57bfb3f18e0b3a1cb3b1ba320991eb6",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1-beta-1/Shuffleboard-2025.1.1-beta-1-linuxarm32.jar",
        sha256 = "67f162eec4c31eb649fc6b5226d3d3841669d313afff7a5bb909375e78dab941",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1-beta-1/Shuffleboard-2025.1.1-beta-1-linuxarm64.jar",
        sha256 = "3d22df20b665ae9c1082d3b7b0481144dbd62ff6aa987469dd8d138e24c9bbb6",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1-beta-1/Shuffleboard-2025.1.1-beta-1-linuxx64.jar",
        sha256 = "c99d45c813e903174d53697e57bb56e2b0f9877ad4cb5dbc71735e382baee23c",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1-beta-1/Shuffleboard-2025.1.1-beta-1-macarm64.jar",
        sha256 = "39debbfbcbf189dcf0cccb92796176e38a89c65c1ae3c39b49fd2fc8692bd952",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1-beta-1/Shuffleboard-2025.1.1-beta-1-macx64.jar",
        sha256 = "47ca18cb2ac62fbb564d2da47482f9c3e468e4d48d8ffad2e7145645d25f5e54",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.1.1-beta-1/Shuffleboard-2025.1.1-beta-1-winx64.jar",
        sha256 = "1ade8a93242ca213899e3188485c72c5215defd04276f554ee0eb260599a794d",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-1/Glass-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "00b0a0122ff75b8b7d72b690a8b1f938ccbc5267b9a76929352dfd284576459c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-1/Glass-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "d03b855376558b44269eed9b57b85eded332bbb759837ed3ab5bdf1b9a6d3a9b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-1/Glass-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "3db87f4ac2d4bbfa9d9b71b8ded3f4d78d1212b079e0a4b012e9f7e6b8ecbd1a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-1/Glass-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "b4d6f6ca68d79f6d5988aea1d439dcf5599dde967bc820c9f5b7c29a3b7608a5",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-1/Glass-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "9632000c775d8b13c2551fe5ffff7c6ed49bba07a9dc3bb1287d8c7fc79583a4",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.1.1-beta-1/Glass-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "bf00a07bc67acd4423ed645f05edd795bdff308420e6a4afc1bee7e79d06c88d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-1/OutlineViewer-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "45cc7d77173ccdf512e01e2d0ff2fadbd9cf5646e489900493fdeab3e1c6efd4",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-1/OutlineViewer-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "50f65ba4163d71dcce6eb80fb9de686611872922998184d5d0e333eddd507290",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-1/OutlineViewer-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "132105718e4324ca1ffa57a9af18143cc5bb1ac522bcfe1d8cf0dafbeb4159c9",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-1/OutlineViewer-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "acf8a06a4b21694b786f4d3e4bd5af6976e1e87074f1b3c44c1297b466d061ca",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-1/OutlineViewer-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "bd6fe0e97bca6172cd4a794f151cf1ac942df2fa5150ed95071efa8d35f32e70",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.1.1-beta-1/OutlineViewer-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "cb0e67ea78913065f07810d3bfc015c7128195982307c084fd192862a12e3685",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-1/roboRIOTeamNumberSetter-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "db15ecc5aa397ce8482604902ab0354fba89760503218a97220cdb8971d88bed",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-1/roboRIOTeamNumberSetter-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "2c043667d7c1e20e59435515b76e6b2fa8ebd586c68a5c8cf82dc1215618b69d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-1/roboRIOTeamNumberSetter-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "63c0e1730c2257bfb074c069548bd62608b43d75d7160bf77770c9ece76d5039",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-1/roboRIOTeamNumberSetter-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "be21c6858a76f6aad6dead10c6a077bdbfc3075a1be0d3c7777bc12716968e10",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-1/roboRIOTeamNumberSetter-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "104406c90890f3775a374afdad18c482496f0e1540d265efbf51a4f0d3b045f4",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.1.1-beta-1/roboRIOTeamNumberSetter-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "3d08a39263c572285fa85d02c50f8db52f126ce83ef3428f4044554b292dfb69",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-1/DataLogTool-2025.1.1-beta-1-linuxarm32.zip",
        sha256 = "b419b30297eaa24b83e66d2887a5e450f5fbde645f12ce54a05ebf35f6d332ac",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-1/DataLogTool-2025.1.1-beta-1-linuxarm64.zip",
        sha256 = "ebef3f67f307571b98214c997384c9b69655d53b3e8f8f1e2a5f80f113e725ca",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-1/DataLogTool-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "f5a6e4257e63cb3cb5378973c39521b55eb26def173d515ec0816a1e3a9fe5e0",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-1/DataLogTool-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "b6fef14d4b65b4904f3801cc59cdb0468621ddb26bd48060caedd99e25e08c94",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-1/DataLogTool-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "73d5d826b3f0053d518350706dba8456d520d44f3051f221d71d3f20c78463b3",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.1.1-beta-1/DataLogTool-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "4b97ab0feffd669ef5569d84b5d085d116678b1bb98f7d17d816eb1c0c87698b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.1.1-beta-1/SysId-2025.1.1-beta-1-linuxx86-64.zip",
        sha256 = "2dcfd314685b19f54000f7d168a61957d73746174b36dfc2202394c9bd17903a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.1.1-beta-1/SysId-2025.1.1-beta-1-osxuniversal.zip",
        sha256 = "24bc1c0537fcfaf84d591e731cb095438af24f37efaf909602f822ba7279a07f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.1.1-beta-1/SysId-2025.1.1-beta-1-windowsx86-64.zip",
        sha256 = "40b2b65dc6a1612a9d4a788072aadabdae4c0ad0f0b8dcd2747f0f6793f28631",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.1.1-beta-1/SysId-2025.1.1-beta-1-windowsarm64.zip",
        sha256 = "bc8387b8e77dfa19996eca1969e50fe79e06cd42ece255b02b1536bef3ea716c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
