load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
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
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-6/wpiutil-cpp-2027.0.0-alpha-6-headers.zip",
        sha256 = "50082fe8d8311d77fa5c7794ef3d2d841f58fc887995b8c4eb7c7b17f7e5d73e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-6/wpiutil-cpp-2027.0.0-alpha-6-sources.zip",
        sha256 = "466d85f93e8f6ba7c172b00af20057e390d0e1a610cedda91d01a763ac8f2ff7",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-6/wpiutil-cpp-2027.0.0-alpha-6-linuxarm64.zip",
        sha256 = "328e86fa41e8201885765410c51106a3cfac4a30d7bf7b584d950f9f778aad7c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-6/wpiutil-cpp-2027.0.0-alpha-6-linuxx86-64.zip",
        sha256 = "90d273d289f63564a8b67987d1aab5e4667ad1e40bbbdfdff6ff61193908f663",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-6/wpiutil-cpp-2027.0.0-alpha-6-osxuniversal.zip",
        sha256 = "2fe361e67609085292f5e9425bdef9b463a2d6d53ff2ae7d923f5ac80810d9ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-6/wpiutil-cpp-2027.0.0-alpha-6-windowsx86-64.zip",
        sha256 = "d150c7ad04b0c6eb2d7ce4e090fbeecec1c5fffc6004054632169a2d220cf80c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-6/wpiutil-cpp-2027.0.0-alpha-6-windowsarm64.zip",
        sha256 = "0a79363024c9e7c3b1f4cb5248ef68bda4f08f523d5749a0d2eec94919c9e776",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-6/wpiutil-cpp-2027.0.0-alpha-6-linuxarm64static.zip",
        sha256 = "683494e6d2d4ab4d8969022a37149cc43437155dded85f8d00cf80ca0eb7898b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-6/wpiutil-cpp-2027.0.0-alpha-6-linuxx86-64static.zip",
        sha256 = "ae256952de963dbb2d5eea87a9dcc3443dfde1d6e89163d38d2bb61257097071",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-6/wpiutil-cpp-2027.0.0-alpha-6-osxuniversalstatic.zip",
        sha256 = "a98151ee9abaac6d9b2dbf5df254c3efe223f9f7d9e14648b235fbd919664ba9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-6/wpiutil-cpp-2027.0.0-alpha-6-windowsx86-64static.zip",
        sha256 = "7e6d776307b8e8f036c4ea5a390f60d75ac11e04167137b60f969c1e4f02548c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-6/wpiutil-cpp-2027.0.0-alpha-6-windowsarm64static.zip",
        sha256 = "4ce8de210d41b677df94afe24c569f2944bf8c3b6b8f89ad2d6d99f2cafe0f7c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-6/wpiutil-cpp-2027.0.0-alpha-6-linuxarm64debug.zip",
        sha256 = "74b5bb02bf0b454b009ce7e51e6005b66b8a604d761b82fb141b66a03d5ecb26",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-6/wpiutil-cpp-2027.0.0-alpha-6-linuxx86-64debug.zip",
        sha256 = "c571e41c1bfa585fa24e35e8e87056aa8a278b4e36328d83fcf361d75bbac832",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-6/wpiutil-cpp-2027.0.0-alpha-6-osxuniversaldebug.zip",
        sha256 = "797b191713c79bc23dc2cb490ea1a3f08f2929347a3b795ec91e2cee96a7815e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-6/wpiutil-cpp-2027.0.0-alpha-6-windowsx86-64debug.zip",
        sha256 = "66b3f1a83ed1deddc5bf68940ea6da675cd8867fe4c27fbb0beb99d080f43f01",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-6/wpiutil-cpp-2027.0.0-alpha-6-windowsarm64debug.zip",
        sha256 = "85f5fec653624f029069479bb47b19dcfe18241abc2471e97f795bf40991ec23",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-6/wpiutil-cpp-2027.0.0-alpha-6-linuxarm64staticdebug.zip",
        sha256 = "f7131ff88fa42d915b7ca400c9e69c920a1ed096d054718cbee41278c5118ecd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-6/wpiutil-cpp-2027.0.0-alpha-6-linuxx86-64staticdebug.zip",
        sha256 = "2a4800ea091fb53165537ee79b2ab9ed47473b19d0abeeaecc057ec6d2bf6f8a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-6/wpiutil-cpp-2027.0.0-alpha-6-osxuniversalstaticdebug.zip",
        sha256 = "63d67257ffcd76f7880f776ecba3e8cb4f88e4be3b7dd490fab15d27e9550386",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-6/wpiutil-cpp-2027.0.0-alpha-6-windowsx86-64staticdebug.zip",
        sha256 = "fa8ec0ef3472e0ac4d855932ae7d0b34dd3ae3f40fd1fde4fd111fc158f5a8fc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-6/wpiutil-cpp-2027.0.0-alpha-6-windowsarm64staticdebug.zip",
        sha256 = "8a3b910fc494e8557f94c3efbb339c500207ac94fb7b28c489aa98034212f029",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-6/wpiutil-cpp-2027.0.0-alpha-6-linuxsystemcore.zip",
        sha256 = "c290c444d1f1be0c7bea0a76dc4a4e1cedd14d9ee8cc06e272e278ddd31499dc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-6/wpiutil-cpp-2027.0.0-alpha-6-linuxsystemcorestatic.zip",
        sha256 = "367de223f8000141a3a3f334a4a1e0373fcf02833cceeccb9bfe95e9cb81edeb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-6/wpiutil-cpp-2027.0.0-alpha-6-linuxsystemcoredebug.zip",
        sha256 = "7eaa9fc62fdb8b8b91a07a3e2a31124775c69897b1e4a91878807e841800567d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpiutil_wpiutil-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpiutil/wpiutil-cpp/2027.0.0-alpha-6/wpiutil-cpp-2027.0.0-alpha-6-linuxsystemcorestaticdebug.zip",
        sha256 = "28e3b75d71e10973abbea2650a02e9cf2fbc14a97bbadb648c980909d09176fd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-6/datalog-cpp-2027.0.0-alpha-6-headers.zip",
        sha256 = "a201b8dfe0d01a319759e1354606ebdf466e41b11357beca42dad7059aa57b7c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-6/datalog-cpp-2027.0.0-alpha-6-sources.zip",
        sha256 = "9fd79e62e864522ebd79d059f323dbea0760a965ea19d773d1b261879ca4bd52",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-6/datalog-cpp-2027.0.0-alpha-6-linuxarm64.zip",
        sha256 = "74d166444dc7692186d1bc0c2e80a8a7c123c885987e8257a69a3c9690d32669",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-6/datalog-cpp-2027.0.0-alpha-6-linuxx86-64.zip",
        sha256 = "e31ef03a78298ff42bb2499effdc9652f272a91e32609abeb1185ab49ed399a9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-6/datalog-cpp-2027.0.0-alpha-6-osxuniversal.zip",
        sha256 = "a8cd71da7deba5d0a3505084c9053cdba58bf3bb39872adfd715cc9c6ba37a12",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libdatalog.dylib osx/universal/shared/libdatalog.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libdatalog.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-6/datalog-cpp-2027.0.0-alpha-6-windowsx86-64.zip",
        sha256 = "ceefde9767924320b2f38b01ee620a02dbde769f8e7212f72a1069b0d204a5d4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-6/datalog-cpp-2027.0.0-alpha-6-windowsarm64.zip",
        sha256 = "318b5b9b808d02294012725b3f7927809e7aae63e228282d0dd0737a57334409",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-6/datalog-cpp-2027.0.0-alpha-6-linuxarm64static.zip",
        sha256 = "459349ddb1bdbdd25d2a442ebca439278aefd6263272ce69883938e8b6741dc3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-6/datalog-cpp-2027.0.0-alpha-6-linuxx86-64static.zip",
        sha256 = "c86c2a31bc1ee3ea64c5854f004db5fcde72fd8ca71bf6387f137aca1dbf1b87",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-6/datalog-cpp-2027.0.0-alpha-6-osxuniversalstatic.zip",
        sha256 = "e6711ad9e2d978ed4b7af83e6105675ae5f12f33cf0b2f56bd710985c537bdf6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-6/datalog-cpp-2027.0.0-alpha-6-windowsx86-64static.zip",
        sha256 = "851b3d89e7e6a6e5cb3e4849ed1e8aa0fd18b0f8cb187c5b9d4e317b9cea0139",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-6/datalog-cpp-2027.0.0-alpha-6-windowsarm64static.zip",
        sha256 = "3f94f1036bdaa77e531821fcd30b111f5aeefb8b4fdb4efa07e57304f4e39bd5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-6/datalog-cpp-2027.0.0-alpha-6-linuxarm64debug.zip",
        sha256 = "13e8c5791070372835cfb4f3c0c06abcaefc1bfc2dc3bb555aac12cc0b875e25",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-6/datalog-cpp-2027.0.0-alpha-6-linuxx86-64debug.zip",
        sha256 = "ddae97947033a1fc7cc70b734f7dc982e07523ffd4d29ccddeca679ef82faee1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-6/datalog-cpp-2027.0.0-alpha-6-osxuniversaldebug.zip",
        sha256 = "99239cf1e65c6a7cf655cc93d1dbd9ee8f797ed64ddd5938f875ae26c586bccf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libdatalog.dylib osx/universal/shared/libdatalog.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libdatalog.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-6/datalog-cpp-2027.0.0-alpha-6-windowsx86-64debug.zip",
        sha256 = "b9712fcd357f4c5bbceb7d688557eeb25f8e8e6c43fa74626cd38fe6b7def7eb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-6/datalog-cpp-2027.0.0-alpha-6-windowsarm64debug.zip",
        sha256 = "5231ed9b59dc862dbc3fb8e1268fcc795207396eaa6ccf16eabeca98bdd5471e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-6/datalog-cpp-2027.0.0-alpha-6-linuxarm64staticdebug.zip",
        sha256 = "0671491162d1badbae6b79e821204c7dc1f50a82f7becff9bae2816a9a87f7ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-6/datalog-cpp-2027.0.0-alpha-6-linuxx86-64staticdebug.zip",
        sha256 = "c135e525f134e211b90690abfd070d9cbd6dbe6804405189f9dbef2fa17a0c2a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-6/datalog-cpp-2027.0.0-alpha-6-osxuniversalstaticdebug.zip",
        sha256 = "d63ac40a5f3f65b5680a9adc643ba2b0b68be6ae168a39f3a5a539bc40085aee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-6/datalog-cpp-2027.0.0-alpha-6-windowsx86-64staticdebug.zip",
        sha256 = "71aee868bfaf9e065be40593210ead2c080836f40fe7e7458af0ac00a42f95b3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-6/datalog-cpp-2027.0.0-alpha-6-windowsarm64staticdebug.zip",
        sha256 = "d46158908ffefa4c3847af7224cb77ee4f962e6d928c40d03eeeb80df21a73b0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-6/datalog-cpp-2027.0.0-alpha-6-linuxsystemcore.zip",
        sha256 = "907ad4de23eec20b91e66e555a5a682d5fbf2af5afdb2766623d56a6ad881777",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-6/datalog-cpp-2027.0.0-alpha-6-linuxsystemcorestatic.zip",
        sha256 = "638a61ce1c763e7507cb839dc3ff07a4bd1dcfcda0932d0a35a67d603f292a59",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-6/datalog-cpp-2027.0.0-alpha-6-linuxsystemcoredebug.zip",
        sha256 = "de79433bdf13f0f012f752fa31d49b7a46d5fcf1f2b36ed8121ca329a08e9b06",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_datalog_datalog-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/datalog/datalog-cpp/2027.0.0-alpha-6/datalog-cpp-2027.0.0-alpha-6-linuxsystemcorestaticdebug.zip",
        sha256 = "2dd04f3d48e9d48ce8aa95f2c90d93169308109544c8a523a9515859f166a48e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-6/wpinet-cpp-2027.0.0-alpha-6-headers.zip",
        sha256 = "1743edc62836bec802304cfd91be6ee25255a8b29c70144b151728268c8466ac",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-6/wpinet-cpp-2027.0.0-alpha-6-sources.zip",
        sha256 = "e71731f158356d047d5c4fc6238b4971822432225f9cb1ec16653b2a1626562f",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-6/wpinet-cpp-2027.0.0-alpha-6-linuxarm64.zip",
        sha256 = "e14c9dcc10ae555f2b205b2b526743e2759c7fc4bbc5ca1c31d0d266d1fcf050",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-6/wpinet-cpp-2027.0.0-alpha-6-linuxx86-64.zip",
        sha256 = "257f1a55ab4bba50b3047d7b34fa67ff8bb1d26548d6bab5a19706e7b696338b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-6/wpinet-cpp-2027.0.0-alpha-6-osxuniversal.zip",
        sha256 = "cae3668dff4723c4ddde233e94a8b7d457ddc4a837fed9933d17a04f86f29cad",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-6/wpinet-cpp-2027.0.0-alpha-6-windowsx86-64.zip",
        sha256 = "cc7f80bcfb791aaca1f17e7ba51430548b97401550a08df0f7021cdbf1105cfc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-6/wpinet-cpp-2027.0.0-alpha-6-windowsarm64.zip",
        sha256 = "edab1e2e507c62347a0c66a963ba52beb204d91fc7f3fa0cf0cebb31f8675383",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-6/wpinet-cpp-2027.0.0-alpha-6-linuxarm64static.zip",
        sha256 = "fd424e95507171ff1f51a713c824cd0fa977bce6a9b5a391e27a0569aa2a1eee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-6/wpinet-cpp-2027.0.0-alpha-6-linuxx86-64static.zip",
        sha256 = "100c22c898186da7cd181ab69cdc5a555e682e6dd2b7be6d2c61d0bb69312bb8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-6/wpinet-cpp-2027.0.0-alpha-6-osxuniversalstatic.zip",
        sha256 = "c41c2c6ddab18e0982a05672ec071616945192ad83d59614403f461ab052d971",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-6/wpinet-cpp-2027.0.0-alpha-6-windowsx86-64static.zip",
        sha256 = "58870435b883040114724e6de3b4741b2c013ef0de8cbb5b81c23135029ae043",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-6/wpinet-cpp-2027.0.0-alpha-6-windowsarm64static.zip",
        sha256 = "ac1d9e94e059302210d577e029c3a2d220dc63f3263a34f487487a3d6818fe2b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-6/wpinet-cpp-2027.0.0-alpha-6-linuxarm64debug.zip",
        sha256 = "5fe22a02cd7d7d0594c1189fb6e64d5c09cdf88317360061e3cb5b7cb8df55ac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-6/wpinet-cpp-2027.0.0-alpha-6-linuxx86-64debug.zip",
        sha256 = "512b9b65b94f5f591c39c89d1857fe9ac874fdf2006f38bc2712c2daf6cd07bf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-6/wpinet-cpp-2027.0.0-alpha-6-osxuniversaldebug.zip",
        sha256 = "54beb447cd58cba0e58e11373b0b87cbb4eed42ef679857795f47695d2e2ca52",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-6/wpinet-cpp-2027.0.0-alpha-6-windowsx86-64debug.zip",
        sha256 = "cbc67a145203b6a52b77b0a58859e3d56dc8c799508e6cfa32c59bab2ed2911f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-6/wpinet-cpp-2027.0.0-alpha-6-windowsarm64debug.zip",
        sha256 = "da5364aa8671a6d24f7473cd969f76559c8904c83bb14294fa8050c4243bf568",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-6/wpinet-cpp-2027.0.0-alpha-6-linuxarm64staticdebug.zip",
        sha256 = "463ac66f8d8188e410d788ff717ebdaa261c6cc20e079c190094d7e1c31adfeb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-6/wpinet-cpp-2027.0.0-alpha-6-linuxx86-64staticdebug.zip",
        sha256 = "10cec1b7ce9356e93b07f3d7ef2bb3faab84ac43f7645413e5767254ced448a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-6/wpinet-cpp-2027.0.0-alpha-6-osxuniversalstaticdebug.zip",
        sha256 = "006b1c2731d2e6be9f899c03e6adf470d6b16d24f2da2e943a000eb57eb2c290",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-6/wpinet-cpp-2027.0.0-alpha-6-windowsx86-64staticdebug.zip",
        sha256 = "3f0f28c9f6fc0dd9245d6a7d02026909f71502d04c64e4fc19f0a52db21927c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-6/wpinet-cpp-2027.0.0-alpha-6-windowsarm64staticdebug.zip",
        sha256 = "ddcdfb99ea50755cfd54d41c4b5815799c1388b09b9cea25bf8a709ea0eb39e9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-6/wpinet-cpp-2027.0.0-alpha-6-linuxsystemcore.zip",
        sha256 = "f194e4f2be534d141b99c04a3c8bc5158a99624fce677906d59169c3efe886f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-6/wpinet-cpp-2027.0.0-alpha-6-linuxsystemcorestatic.zip",
        sha256 = "57e6292127b8352b115b5052f3dec503acdbe2f88a1dbf8bdedc73d35ec74a75",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-6/wpinet-cpp-2027.0.0-alpha-6-linuxsystemcoredebug.zip",
        sha256 = "1b2cd9900f4a0023e31b22858efebebf0818fcf8c221b846a7371919cc72e0ef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpinet_wpinet-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpinet/wpinet-cpp/2027.0.0-alpha-6/wpinet-cpp-2027.0.0-alpha-6-linuxsystemcorestaticdebug.zip",
        sha256 = "7731b2779a65e35c9b882b94dc071d8f861b91c93f0194f865ea2ed7af560d19",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-6/wpimath-cpp-2027.0.0-alpha-6-headers.zip",
        sha256 = "3f7add9e6b33a5065956dff3fc8edd4462eb4aa41f5fe3f3f102ec68a5a6a495",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-6/wpimath-cpp-2027.0.0-alpha-6-sources.zip",
        sha256 = "e34b84c68e0ebeca67c1003f41284f24b09b7068f691f62fdc9a1348ee11c4cf",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-6/wpimath-cpp-2027.0.0-alpha-6-linuxarm64.zip",
        sha256 = "53812baf84dccfa893ec31fe244ef6d668c345970c210cee655633755c4b7c7f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-6/wpimath-cpp-2027.0.0-alpha-6-linuxx86-64.zip",
        sha256 = "616037eaae754acac8951148cd2f7347e1964d29bb10313fbc8df8c152ab33c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-6/wpimath-cpp-2027.0.0-alpha-6-osxuniversal.zip",
        sha256 = "9defee188596271d017e5bb5875153e6d9adc2a501c493958d222ec7731ed620",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-6/wpimath-cpp-2027.0.0-alpha-6-windowsx86-64.zip",
        sha256 = "77ee246f9d1ced2025c9729d1bdca886b5dc495917c2ccaa1db83d38915c1fde",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-6/wpimath-cpp-2027.0.0-alpha-6-windowsarm64.zip",
        sha256 = "397c61e3981340830801892293b6671d5c63f09daa86d03724b32a02e4def725",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-6/wpimath-cpp-2027.0.0-alpha-6-linuxarm64static.zip",
        sha256 = "7ffdf4c9b9461b9b32dc098283372518412a10bb0d04cc3d6802bc6677d83c7b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-6/wpimath-cpp-2027.0.0-alpha-6-linuxx86-64static.zip",
        sha256 = "a6c811f331f94e858a6482d78076ad2eeb3f07f3f3f215d2e9622c0fc949b73e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-6/wpimath-cpp-2027.0.0-alpha-6-osxuniversalstatic.zip",
        sha256 = "7f70645bc32f3c19341daf2a5fa18e7a7eaae6bfb09b22ed9a0e13a13567c882",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-6/wpimath-cpp-2027.0.0-alpha-6-windowsx86-64static.zip",
        sha256 = "2095bca1e762490fef202e08eea33f6bde541f8d2ab4e85a421aa865bef21c31",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-6/wpimath-cpp-2027.0.0-alpha-6-windowsarm64static.zip",
        sha256 = "e000f0a9533f8fec2bea5495a214eb172cd49b400fdc522fb84bba4d12a0e9f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-6/wpimath-cpp-2027.0.0-alpha-6-linuxarm64debug.zip",
        sha256 = "543ae122f8045d0bc0e5e5db4b83a9a25c847146ddc5701bc137f2ea92f3e022",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-6/wpimath-cpp-2027.0.0-alpha-6-linuxx86-64debug.zip",
        sha256 = "46ca79b48bac52b5576fbbe306eecc5c7de4e8c84f4d01ac6dde268fd5ca9e0f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-6/wpimath-cpp-2027.0.0-alpha-6-osxuniversaldebug.zip",
        sha256 = "42d3bd712b0053e66be61aa74a4284036b388f8d467cb9e81187f3b74774903e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-6/wpimath-cpp-2027.0.0-alpha-6-windowsx86-64debug.zip",
        sha256 = "640bc8c0bc4e3e554ce63fd0263d85d7baebba39045a48956eb42f4e9ae634cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-6/wpimath-cpp-2027.0.0-alpha-6-windowsarm64debug.zip",
        sha256 = "6205968d42ef8a79d24effff95c5e0904e48966f9ee8f65564bb67a8fe06ba97",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-6/wpimath-cpp-2027.0.0-alpha-6-linuxarm64staticdebug.zip",
        sha256 = "3003e400082df10eb5e32fdad0bf5fccd600fdaf9cbeb798e9d18f945a347f8f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-6/wpimath-cpp-2027.0.0-alpha-6-linuxx86-64staticdebug.zip",
        sha256 = "ad1eb5e233614e6834011b08590ac4183c66c6f5e6c5ee893579bd209b5bb587",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-6/wpimath-cpp-2027.0.0-alpha-6-osxuniversalstaticdebug.zip",
        sha256 = "7e5ceccf7c963f510ecd232031f84222fc405854b0bd6b01f563618cf667d3b3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-6/wpimath-cpp-2027.0.0-alpha-6-windowsx86-64staticdebug.zip",
        sha256 = "03d0342b63a52fd0b63edf2185b3b0b6385b2719465704233c590f6dd3d82fc7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-6/wpimath-cpp-2027.0.0-alpha-6-windowsarm64staticdebug.zip",
        sha256 = "54960a25d199d3837810391d26e5c67bfbad1867142127661f6af98b9b6982d7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-6/wpimath-cpp-2027.0.0-alpha-6-linuxsystemcore.zip",
        sha256 = "b360b352928a17c1ce638263da51cab67ba17f901d7e891dea1123c6ef902b3e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-6/wpimath-cpp-2027.0.0-alpha-6-linuxsystemcorestatic.zip",
        sha256 = "7bb125688bf0bca4cb2887682c4cee4737cb9345e39dc1246040eab1bc679cc8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-6/wpimath-cpp-2027.0.0-alpha-6-linuxsystemcoredebug.zip",
        sha256 = "de2f2b084c8e6f37298b14c74bf0bd1e7ec5c4e5440af03e583b6580ffc602f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpimath_wpimath-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpimath/wpimath-cpp/2027.0.0-alpha-6/wpimath-cpp-2027.0.0-alpha-6-linuxsystemcorestaticdebug.zip",
        sha256 = "d21d064abf793a7d7b58aba9cd725f0ae8b23db8f006d7eaf9cd0b4589ec2fba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-6/apriltag-cpp-2027.0.0-alpha-6-headers.zip",
        sha256 = "92c0eb6f7923ab37c7d6b44d81fd60ccf2424ea8cd5628b91fe72619aec44b24",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-6/apriltag-cpp-2027.0.0-alpha-6-sources.zip",
        sha256 = "28984a4b8d7b4db21508064101f2958acfc4e8780cadffcae4f7f7d792df10f8",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-6/apriltag-cpp-2027.0.0-alpha-6-linuxarm64.zip",
        sha256 = "7ec37f3cb966dff0a435462d744ab7fd8dbe6819137b6314d5e106a27ec0e185",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-6/apriltag-cpp-2027.0.0-alpha-6-linuxx86-64.zip",
        sha256 = "34f9a9b449b7b27dac2e7d6e14f44eaf26265964b5579e710094fbc31b33460e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-6/apriltag-cpp-2027.0.0-alpha-6-osxuniversal.zip",
        sha256 = "20be0cb41a93c1bcc06457826490d0ba96f94b6ba29e823d5323504a7463db11",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libapriltag.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libapriltag.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-6/apriltag-cpp-2027.0.0-alpha-6-windowsx86-64.zip",
        sha256 = "e6b68ed392df334680d378abb9f29ad427bef9e830cf3e60f178bc3f9fdd9abe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-6/apriltag-cpp-2027.0.0-alpha-6-windowsarm64.zip",
        sha256 = "9f859f33f0434b908a96eff9eee0f3b116bb4dc2f765154582a7b36b31dfcca0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-6/apriltag-cpp-2027.0.0-alpha-6-linuxarm64static.zip",
        sha256 = "b00ec9751beca0c2a189f5ee9ddc12a5467d2fa5505ae5da78538f58faa61eef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-6/apriltag-cpp-2027.0.0-alpha-6-linuxx86-64static.zip",
        sha256 = "5028ef2656d2adb22bd665733c647fa1cbcbf58a306fd5be3bb684ac2b51b5a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-6/apriltag-cpp-2027.0.0-alpha-6-osxuniversalstatic.zip",
        sha256 = "282ed5b4d6fe0bc1da0d824ff8e81f4351b9e7cbe1b41dbb457df90c7692f607",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-6/apriltag-cpp-2027.0.0-alpha-6-windowsx86-64static.zip",
        sha256 = "87612446483510d6e94cbb1cf66bb9b0bf1d16e9148d04624cf203a2905fbe14",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-6/apriltag-cpp-2027.0.0-alpha-6-windowsarm64static.zip",
        sha256 = "e7d43ea6cf89d37724e1ed7735592a4e04985d42e6f872a410427d8614917e1a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-6/apriltag-cpp-2027.0.0-alpha-6-linuxarm64debug.zip",
        sha256 = "89e197745e4ce8c1ed73687c316c11363bb381736958af809e79b3fc0a61980c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-6/apriltag-cpp-2027.0.0-alpha-6-linuxx86-64debug.zip",
        sha256 = "621fe5db480743b2c7924baaaa8d8191f30a3f2916edc18c5e388d7e22004fc1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-6/apriltag-cpp-2027.0.0-alpha-6-osxuniversaldebug.zip",
        sha256 = "0c98b00c62dec73b9ca84256e11fc828dad79786a642311188420d028f31012a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libapriltag.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libapriltag.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-6/apriltag-cpp-2027.0.0-alpha-6-windowsx86-64debug.zip",
        sha256 = "871e4b7758332efab90402c52958308115e68c78204372f58c55351125d78af0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-6/apriltag-cpp-2027.0.0-alpha-6-windowsarm64debug.zip",
        sha256 = "b63af2bec4b4f85d21ce2e2bd7d66f442ee404403864f621ce705238fcc2d30c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-6/apriltag-cpp-2027.0.0-alpha-6-linuxarm64staticdebug.zip",
        sha256 = "a738e21a1069ea61a7c06271e58d0f693806c56c9a0a1a3ad8514b4660e6bb3f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-6/apriltag-cpp-2027.0.0-alpha-6-linuxx86-64staticdebug.zip",
        sha256 = "f275fb4257ddb12b1a886a245c30d8abcab0a250d53fe57ef9e5754e2d133232",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-6/apriltag-cpp-2027.0.0-alpha-6-osxuniversalstaticdebug.zip",
        sha256 = "8a596c71c3790af81234665b4888db018190168a25a20cc44a0f3d3a84c20183",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-6/apriltag-cpp-2027.0.0-alpha-6-windowsx86-64staticdebug.zip",
        sha256 = "afa81c26d864ebbfef14d6d5d2c706dd35d8f9f26c0db127629afea2467ebd69",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-6/apriltag-cpp-2027.0.0-alpha-6-windowsarm64staticdebug.zip",
        sha256 = "31de65ee8a85cc4849d06bb387cf630e4d2f17233fc5b1aa16f2b556fbed1277",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-6/apriltag-cpp-2027.0.0-alpha-6-linuxsystemcore.zip",
        sha256 = "5343c5db896c700f759ab12b3516ed7c50db93163e0e5f92d8fed826dc21d3e0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-6/apriltag-cpp-2027.0.0-alpha-6-linuxsystemcorestatic.zip",
        sha256 = "713c7f22aad75e0d56e2917a599a30f6e1a1e94e70fd3e448c3670346e80c5ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-6/apriltag-cpp-2027.0.0-alpha-6-linuxsystemcoredebug.zip",
        sha256 = "25fcd1119e36ea2e444e86e9307510150d3779359012527b9cdf969d9802529e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_apriltag_apriltag-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/apriltag/apriltag-cpp/2027.0.0-alpha-6/apriltag-cpp-2027.0.0-alpha-6-linuxsystemcorestaticdebug.zip",
        sha256 = "b4a92bf034dcf3af3060e94eb225b19271bdde577a0314f51bb0e18e8979a2f0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-6/ntcore-cpp-2027.0.0-alpha-6-headers.zip",
        sha256 = "9124717de1945f12c6302256befac432885e240562a06607aa6cf8b3b753b9bb",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-6/ntcore-cpp-2027.0.0-alpha-6-sources.zip",
        sha256 = "f324cbf24234610b7f23e009678a4d9b0f7567ee484a1845dcdbd0eb7bba76a0",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-6/ntcore-cpp-2027.0.0-alpha-6-linuxarm64.zip",
        sha256 = "fe01280d1e994cef5fd56638a50f8c5a4fe2b1eaa214b35ebeb199fbf086eefb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-6/ntcore-cpp-2027.0.0-alpha-6-linuxx86-64.zip",
        sha256 = "3e4d2cf6a215268a6e7f230d324e102d704fcc80f966c9f075bbec8ffd2a521d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-6/ntcore-cpp-2027.0.0-alpha-6-osxuniversal.zip",
        sha256 = "ee98dbec556c59bee4ec0fd8fbc044eae515d46a6071a7416108b412659943c0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libntcore.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libntcore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-6/ntcore-cpp-2027.0.0-alpha-6-windowsx86-64.zip",
        sha256 = "d0c7c409b98cc5b9123d94a910145861ec9e1224a70855bf8cf5a69a194421ba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-6/ntcore-cpp-2027.0.0-alpha-6-windowsarm64.zip",
        sha256 = "cf763edf0f9ce025efea27570be78a566655253629318a898672b06bbaafe1ad",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-6/ntcore-cpp-2027.0.0-alpha-6-linuxarm64static.zip",
        sha256 = "b4c1218674e8b135b8b26e81ebce601b82db536d801821794e9a63ee7103605a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-6/ntcore-cpp-2027.0.0-alpha-6-linuxx86-64static.zip",
        sha256 = "9eb3562c9836a0da7b87d732d90bbe665f7ba26386fb3b8252de4cf193d03803",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-6/ntcore-cpp-2027.0.0-alpha-6-osxuniversalstatic.zip",
        sha256 = "c8a5c2795ff34d52c4573d2c31cb4d50aebc8b2a9dcd27aae794a308b82bea37",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-6/ntcore-cpp-2027.0.0-alpha-6-windowsx86-64static.zip",
        sha256 = "d754f890e19ec396fa7c0958736bd50d264c22cfa02db526900e05d04d9ae66c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-6/ntcore-cpp-2027.0.0-alpha-6-windowsarm64static.zip",
        sha256 = "d84d1311ba301d5c2817e50c057792981724d5c29ae55eddad511b347effb5ba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-6/ntcore-cpp-2027.0.0-alpha-6-linuxarm64debug.zip",
        sha256 = "07522d6a82707fac68f99d54b4a86535f191cc51d6bdb7b7957f53078e9b879d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-6/ntcore-cpp-2027.0.0-alpha-6-linuxx86-64debug.zip",
        sha256 = "ee69e2b110e8bd5ef01749ab53c46659f6114e659a628caa0b7369feb03f653f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-6/ntcore-cpp-2027.0.0-alpha-6-osxuniversaldebug.zip",
        sha256 = "bdaabe14bd915b9dc12fa6ae4c9e01c8d902a8bd333c40dcef6ff15855c6d207",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libntcore.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libntcore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-6/ntcore-cpp-2027.0.0-alpha-6-windowsx86-64debug.zip",
        sha256 = "6eeafb889a00d8882cd1e28aae10da2782548bdfdd2032e1cb23659309366033",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-6/ntcore-cpp-2027.0.0-alpha-6-windowsarm64debug.zip",
        sha256 = "655deb87240144d6e1a854e9ddf8f0ff9927fd20c3fc07ff4a92eeb8d900c424",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-6/ntcore-cpp-2027.0.0-alpha-6-linuxarm64staticdebug.zip",
        sha256 = "ed2dde69a24c707291be5c07f57a4b9d3a6479b41e13e164ccc240df6d385b43",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-6/ntcore-cpp-2027.0.0-alpha-6-linuxx86-64staticdebug.zip",
        sha256 = "dfde7e796e1f5811b7d56df0f4a653e4c89b8dfbd30c1541b9b4417e70c9689a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-6/ntcore-cpp-2027.0.0-alpha-6-osxuniversalstaticdebug.zip",
        sha256 = "571e0170be199e14b7fc260516ed49e938d2610a2be3176cb747151c6e661154",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-6/ntcore-cpp-2027.0.0-alpha-6-windowsx86-64staticdebug.zip",
        sha256 = "61e732fd263660b94d5651af4ce7d85795a6ee15d3a7ddd0904d0cfbfa77039e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-6/ntcore-cpp-2027.0.0-alpha-6-windowsarm64staticdebug.zip",
        sha256 = "9ac989101a7c24cbdb9578cc54237dc3f74b86b6f891ca2357590bc7c25275ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-6/ntcore-cpp-2027.0.0-alpha-6-linuxsystemcore.zip",
        sha256 = "e67d7eb8180b0c135445611ea9667da025a118697768af78aea0e8c7dda455f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-6/ntcore-cpp-2027.0.0-alpha-6-linuxsystemcorestatic.zip",
        sha256 = "ef8539f2f509ae1f745814d34bce2dd675ee58f0ab09dfc0b2318e42855af4ef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-6/ntcore-cpp-2027.0.0-alpha-6-linuxsystemcoredebug.zip",
        sha256 = "c0d9b7f32cc037e88110e80fe9a2e7d1db174c29f38e67a9823000ee9d76e3a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_ntcore_ntcore-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/ntcore/ntcore-cpp/2027.0.0-alpha-6/ntcore-cpp-2027.0.0-alpha-6-linuxsystemcorestaticdebug.zip",
        sha256 = "ececabf1edcf42b775725257a4f1d9b7ea6fda0ebc5dc8d4074f6fb6f33c745d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-6/hal-cpp-2027.0.0-alpha-6-headers.zip",
        sha256 = "ef3be37499a0cf6bd550b300d3e6021345340abc7a1798cc36255aa8f4b84549",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-6/hal-cpp-2027.0.0-alpha-6-sources.zip",
        sha256 = "12dfc900058b919cfd4a754b0e15521aaefdae9b91eb3711eeb80b97f5d22253",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-6/hal-cpp-2027.0.0-alpha-6-linuxarm64.zip",
        sha256 = "4180f77b0402186126ac0e87ec638cbd987751de5516247d88883a930ee21051",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-6/hal-cpp-2027.0.0-alpha-6-linuxx86-64.zip",
        sha256 = "3bd764310d43882f2b61ce7d8c2bcc5151a7dae48079d209c0d9eb7ca45c977d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-6/hal-cpp-2027.0.0-alpha-6-osxuniversal.zip",
        sha256 = "4c4df3d053e915c35e70918fe36a752615f630f8a8f463ae95cc4c62ec4e8b0f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-6/hal-cpp-2027.0.0-alpha-6-windowsx86-64.zip",
        sha256 = "b596e295232a3481dfd4a3166971b57cd93f85f2ca7d86d57a7b9beb79d5cc31",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-6/hal-cpp-2027.0.0-alpha-6-windowsarm64.zip",
        sha256 = "b1b743d5ade2c63aa2fe3849ab20167c41d873b6bc766750d30550a93320a1a0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-6/hal-cpp-2027.0.0-alpha-6-linuxarm64static.zip",
        sha256 = "1ab3a443c89d993e15bffb1ec03cfdc5f8cdd4e77e9994c7c3df20b2ff813216",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-6/hal-cpp-2027.0.0-alpha-6-linuxx86-64static.zip",
        sha256 = "f0682c5b7f845d47f4677dfb1355cadd3464f6a067c0c487a0797a43e34ca2a4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-6/hal-cpp-2027.0.0-alpha-6-osxuniversalstatic.zip",
        sha256 = "8434ff3094f5cb3c11dfcecb00e7d05fc945671109f047f68314baac79090881",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-6/hal-cpp-2027.0.0-alpha-6-windowsx86-64static.zip",
        sha256 = "c4897e31a9ee06eb0f522d5d543571aadb606f345bb5fba9843311ba342c2818",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-6/hal-cpp-2027.0.0-alpha-6-windowsarm64static.zip",
        sha256 = "b866d308698b64b048d1022d6bd9c3b51e084e6c00ed623f8c34224fa8bdac71",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-6/hal-cpp-2027.0.0-alpha-6-linuxarm64debug.zip",
        sha256 = "8acca4e09add3741a0f810ecccef59c4a7933065a45573beae369e41dcfdf3e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-6/hal-cpp-2027.0.0-alpha-6-linuxx86-64debug.zip",
        sha256 = "a880b3d15474adfb5d6d9aab8ef5445a585353ce55baba9f022ccbc0ddd7c87e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-6/hal-cpp-2027.0.0-alpha-6-osxuniversaldebug.zip",
        sha256 = "34fd0ead86e9a2181364e6c76ff21b67e16b2c10abcc069407150317df7b0dd0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-6/hal-cpp-2027.0.0-alpha-6-windowsx86-64debug.zip",
        sha256 = "cf70638099f7ab16da04686c033a00bc5d96ae85b43a3743fbfbdd168361cbeb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-6/hal-cpp-2027.0.0-alpha-6-windowsarm64debug.zip",
        sha256 = "9741afb71d59e5ce3f16fcf7508d061c22cc39baaff4ba8f65d4ebfbea911cc1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-6/hal-cpp-2027.0.0-alpha-6-linuxarm64staticdebug.zip",
        sha256 = "ce7ab8fd3aa7581a22c2721a58ff04b6e1fb142ebb34ea8be52a49c3607b0c16",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-6/hal-cpp-2027.0.0-alpha-6-linuxx86-64staticdebug.zip",
        sha256 = "d683ef366bf1daec65bc934ee2972d0b7ec132a1dec0e88d4f2c55ffa8e5e4b8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-6/hal-cpp-2027.0.0-alpha-6-osxuniversalstaticdebug.zip",
        sha256 = "dc089c2ab89af3794a74daaa00279b37e7b9fcde4131ac56a2cc65d48afa8227",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-6/hal-cpp-2027.0.0-alpha-6-windowsx86-64staticdebug.zip",
        sha256 = "59ba6a986160b9e123d91fe67a185d1eff2a8cd12915f839f575ad8031e6b7ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-6/hal-cpp-2027.0.0-alpha-6-windowsarm64staticdebug.zip",
        sha256 = "cd673d19b752b04d1d62fd50a9d09d0d2e77275cfafefb0756ee1b45aab13479",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-6/hal-cpp-2027.0.0-alpha-6-linuxsystemcore.zip",
        sha256 = "ca4bdac72fdc1038162a69a20809c348e92136d7a13245544587cc42171729a9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-6/hal-cpp-2027.0.0-alpha-6-linuxsystemcorestatic.zip",
        sha256 = "daa1fe64f31d95d6477adfcdd6a9fb6d2212963a62e1fb3234b0a6eccc988494",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-6/hal-cpp-2027.0.0-alpha-6-linuxsystemcoredebug.zip",
        sha256 = "4dd1956de0566d66f2bd2b7935bad4fe0c27875bd0be8d86ef0b31dbeb7f03af",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_hal_hal-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/hal/hal-cpp/2027.0.0-alpha-6/hal-cpp-2027.0.0-alpha-6-linuxsystemcorestaticdebug.zip",
        sha256 = "ccc4fc6aaf919b378e2c48a4ca149076eda5aa6e8a48aac97b43d5bdb3d07a96",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-6/cscore-cpp-2027.0.0-alpha-6-headers.zip",
        sha256 = "fc85cf0b186bd61a4dd2aefa2b28595e1a35f2aa4fc3764b2d51a17c6f1a762b",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-6/cscore-cpp-2027.0.0-alpha-6-sources.zip",
        sha256 = "e7b0ad60114fd396ac4c212deeeeddfcf36b161685cc03a73cf287f67c44461b",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-6/cscore-cpp-2027.0.0-alpha-6-linuxarm64.zip",
        sha256 = "a073d046beeddad7726315347008fd7a3e3167900a37baab76cc8eec03e82f37",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-6/cscore-cpp-2027.0.0-alpha-6-linuxx86-64.zip",
        sha256 = "513e1e762e3c5e24372af2eff27356f298b5728739d8e791e157927d2c6be6e2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-6/cscore-cpp-2027.0.0-alpha-6-osxuniversal.zip",
        sha256 = "d32a9592c924b755c357f445d361be1c0533363a430d6416a163b634bb8bc819",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libcscore.dylib osx/universal/shared/libcscore.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcscore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcscore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-6/cscore-cpp-2027.0.0-alpha-6-windowsx86-64.zip",
        sha256 = "c4a77b4ddd707f7d6ea0c6a07c191900bbd09664ad7a011737c21ec0569eb384",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-6/cscore-cpp-2027.0.0-alpha-6-windowsarm64.zip",
        sha256 = "22fc47ff2a5b1e482dcdc46bda873ef421b659f3ba8399522dd92dc8f064d171",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-6/cscore-cpp-2027.0.0-alpha-6-linuxarm64static.zip",
        sha256 = "774cff2f85111d8d806ccbdee3a79373a659b6de1733c3029d271d644c7bac46",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-6/cscore-cpp-2027.0.0-alpha-6-linuxx86-64static.zip",
        sha256 = "35026b5f1fa68e1b63b6301030c1923bf2e8ecdf588436b066b89e4c8528da68",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-6/cscore-cpp-2027.0.0-alpha-6-osxuniversalstatic.zip",
        sha256 = "ee9b090323c7ae67c9d0ddf90c1c5cd32a7370ffff1f01b471560e0104753696",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-6/cscore-cpp-2027.0.0-alpha-6-windowsx86-64static.zip",
        sha256 = "49739d42f9f9916286ffa7d8c0035d8af64eb73945eb657453c7204061817d37",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-6/cscore-cpp-2027.0.0-alpha-6-windowsarm64static.zip",
        sha256 = "67eba4fc056dce8e10dc9b189980d426423a71e2148d12be87c14a565a9bae89",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-6/cscore-cpp-2027.0.0-alpha-6-linuxarm64debug.zip",
        sha256 = "881daa0f0c65c36c7703d82656461ddcc078c4bd8bfb4b1e6b4dccb82b643202",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-6/cscore-cpp-2027.0.0-alpha-6-linuxx86-64debug.zip",
        sha256 = "872e5d9bcacde104c402def1bd3e76efde2125ad16a9737e4d642205d7391f0b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-6/cscore-cpp-2027.0.0-alpha-6-osxuniversaldebug.zip",
        sha256 = "7dc17fd3fca742a2223d6ef3065d3525d3e13f2e8be19006a9ff156a25eb9e89",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libcscore.dylib osx/universal/shared/libcscore.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcscore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcscore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-6/cscore-cpp-2027.0.0-alpha-6-windowsx86-64debug.zip",
        sha256 = "5f75c22bd734808628b2f78b6626cf208a5931c635b856b59b651ec3dde0bff9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-6/cscore-cpp-2027.0.0-alpha-6-windowsarm64debug.zip",
        sha256 = "304d52a5e368ef453b2beb4aef58a4f62d4bf0b4038acd70e30920c2e1879da4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-6/cscore-cpp-2027.0.0-alpha-6-linuxarm64staticdebug.zip",
        sha256 = "b0d167eb2c89a21657d4c03b534dc9d63f8d5836da53784c2a5e25f13119d272",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-6/cscore-cpp-2027.0.0-alpha-6-linuxx86-64staticdebug.zip",
        sha256 = "404e33e315f89347c18ec4ae6095abfbabd18c5b49a1ad3d19fa7da59662bb14",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-6/cscore-cpp-2027.0.0-alpha-6-osxuniversalstaticdebug.zip",
        sha256 = "0a33b8508d9c7b7689cf18631c6b4f3055dcf1067d6120070beaa110f9fd4d1c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-6/cscore-cpp-2027.0.0-alpha-6-windowsx86-64staticdebug.zip",
        sha256 = "5b0cb145962e36a16cedf792ceb6dda88e56c02db9b516e1a177116b2019e919",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-6/cscore-cpp-2027.0.0-alpha-6-windowsarm64staticdebug.zip",
        sha256 = "3de2a17b2c97fd65b0b5bb7d993c38e176f09984c06a426c1f63c9fba478730e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-6/cscore-cpp-2027.0.0-alpha-6-linuxsystemcore.zip",
        sha256 = "5d7c5401a0f904c713a687e396ab2a3e9acdaa252da30e45ae5e04b703c7e457",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-6/cscore-cpp-2027.0.0-alpha-6-linuxsystemcorestatic.zip",
        sha256 = "cabeccfd302d7500bb779e686c963c1397bda6a612ca94f6f5a1a04786531e90",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-6/cscore-cpp-2027.0.0-alpha-6-linuxsystemcoredebug.zip",
        sha256 = "58e729731e5da084e42928b724f04180c101491ed9dc732f2a95539b5df9cda4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cscore_cscore-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cscore/cscore-cpp/2027.0.0-alpha-6/cscore-cpp-2027.0.0-alpha-6-linuxsystemcorestaticdebug.zip",
        sha256 = "a0f7dc10090e870d9b39d032ad0f2ff1c8518d95e76c85f4ce4c2bf916b35273",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-6/cameraserver-cpp-2027.0.0-alpha-6-headers.zip",
        sha256 = "04f0585c111a8e2e3d1bae63ad7a87eb2cabb47ffa17849af31068234d112b2c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-6/cameraserver-cpp-2027.0.0-alpha-6-sources.zip",
        sha256 = "5687d03ae50d4d80c058b60f5d77b8e6d267b1c5d16c21d23d4b38eada509800",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-6/cameraserver-cpp-2027.0.0-alpha-6-linuxarm64.zip",
        sha256 = "908a2639494ca9eef504c273479ff9fc1897705a936cefa924aa9040c7960061",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-6/cameraserver-cpp-2027.0.0-alpha-6-linuxx86-64.zip",
        sha256 = "a4266a8c1ca6883aaf73cfea8ffd465379f606dc8a13587ff664a4383a3e8814",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-6/cameraserver-cpp-2027.0.0-alpha-6-osxuniversal.zip",
        sha256 = "5e6751eeeb38c26c966e07722639b68ce70a89e090f7ce3da65424c933a79ee8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libcameraserver.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcameraserver.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-6/cameraserver-cpp-2027.0.0-alpha-6-windowsx86-64.zip",
        sha256 = "372c06849574231eb9b29ff4c6ae02def98f44abc49010ae32a31ff8c230addb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-6/cameraserver-cpp-2027.0.0-alpha-6-windowsarm64.zip",
        sha256 = "1658900516abfb41a269974e79f09b5e1478e0bce8c4b4eb4a9befd84323d3f8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-6/cameraserver-cpp-2027.0.0-alpha-6-linuxarm64static.zip",
        sha256 = "dafdebd85e0bfbb197c10d730954ce1ce538d57dfa97dfbf1475fa1274e5470b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-6/cameraserver-cpp-2027.0.0-alpha-6-linuxx86-64static.zip",
        sha256 = "01b3f5da23302a30957474a39fa81eba29b3b1060cde09ba3d40ff19e48e2f90",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-6/cameraserver-cpp-2027.0.0-alpha-6-osxuniversalstatic.zip",
        sha256 = "69e61ae9f59fbc0347090f88e9ca138888692d0b2c9b63484f34502abb4e1af6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-6/cameraserver-cpp-2027.0.0-alpha-6-windowsx86-64static.zip",
        sha256 = "99b699986c584f759f76dfc5f7d818abcaa5bc66bdbda445c74674630c33940e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-6/cameraserver-cpp-2027.0.0-alpha-6-windowsarm64static.zip",
        sha256 = "c581f9243eab1834a1e5b83a9427a9c9d21b2391935b0107f9297917d5acc2ca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-6/cameraserver-cpp-2027.0.0-alpha-6-linuxarm64debug.zip",
        sha256 = "5e1fd33c93741aa1c432cc9614e90e4d6758e7ea224408a2da52c246619e7a2b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-6/cameraserver-cpp-2027.0.0-alpha-6-linuxx86-64debug.zip",
        sha256 = "c92324348b96d42830fec972cd661ff26a19bb93011d043e7fe2a12efc1b035b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-6/cameraserver-cpp-2027.0.0-alpha-6-osxuniversaldebug.zip",
        sha256 = "67e4f6955d0d5e86b5368d665910cf67d748aa8af16b295054e687a6fa4888e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libcameraserver.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcameraserver.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-6/cameraserver-cpp-2027.0.0-alpha-6-windowsx86-64debug.zip",
        sha256 = "16e05b71c101b1da8e28f6d30e60c22085067003d03dac6bb9649136098a782a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-6/cameraserver-cpp-2027.0.0-alpha-6-windowsarm64debug.zip",
        sha256 = "4fb7122cf2993bd214c8ab53331f9fd80707e43f0458ac2bb919670485efd89f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-6/cameraserver-cpp-2027.0.0-alpha-6-linuxarm64staticdebug.zip",
        sha256 = "ebf8fce5c58bec7ffd72b32565b3ea6a0771f4215e519a7650051861ec46b1fe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-6/cameraserver-cpp-2027.0.0-alpha-6-linuxx86-64staticdebug.zip",
        sha256 = "f44629d6d4401a0f3f77f5a1033d3072eb6cdfc90fbcece93e746d9ed2e0f8a6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-6/cameraserver-cpp-2027.0.0-alpha-6-osxuniversalstaticdebug.zip",
        sha256 = "574e694ddd97d3496016db4d27adbc592651d4dc9fefdf9223cafe5d200cdea4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-6/cameraserver-cpp-2027.0.0-alpha-6-windowsx86-64staticdebug.zip",
        sha256 = "809a80b07e468f75efde6c0aebec88d0b9e02bc745fa4f7af4bb0b189fa85bf9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-6/cameraserver-cpp-2027.0.0-alpha-6-windowsarm64staticdebug.zip",
        sha256 = "f2d5f528a7d44fadea91ef1109dda5def38b2439e2b47e0c319163f613c2e707",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-6/cameraserver-cpp-2027.0.0-alpha-6-linuxsystemcore.zip",
        sha256 = "6a636acf38e12701b4d72e71560d4b36cb9219271b4da5148bdeac8debbac89c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-6/cameraserver-cpp-2027.0.0-alpha-6-linuxsystemcorestatic.zip",
        sha256 = "efb3b7748de5d4ed3def76ea9de1d573a85875fc95dab3468c9d1b7a781b6d32",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-6/cameraserver-cpp-2027.0.0-alpha-6-linuxsystemcoredebug.zip",
        sha256 = "13a461fac9e472cc415ecaf56c5bce263aef054416673c6c3e110cfed22c0e60",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_cameraserver_cameraserver-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/cameraserver/cameraserver-cpp/2027.0.0-alpha-6/cameraserver-cpp-2027.0.0-alpha-6-linuxsystemcorestaticdebug.zip",
        sha256 = "784d559c93d85f8a186863121f1c91cb023fe692d3025e4a0c261769786c5b5a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-6/wpilibc-cpp-2027.0.0-alpha-6-headers.zip",
        sha256 = "7c3e93902dbcac6eec39636e2670625857629fb1242d6929996815e7ad818920",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-6/wpilibc-cpp-2027.0.0-alpha-6-sources.zip",
        sha256 = "d09fc58eb153a899aefb0429ab8b7e8cd60ff278db633dab0b1e492965c230dc",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-6/wpilibc-cpp-2027.0.0-alpha-6-linuxarm64.zip",
        sha256 = "28a01e24e2e365deaec0d5fd78c1fc6127b0897d33770098e22e0f7141133407",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-6/wpilibc-cpp-2027.0.0-alpha-6-linuxx86-64.zip",
        sha256 = "741c6161d0688134697cb4a4b26fc42168e609772aa2376b8d0ded22e3799620",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-6/wpilibc-cpp-2027.0.0-alpha-6-osxuniversal.zip",
        sha256 = "1bbdeb8f4dc93204e0cf9a1ac7a906e72a7d1d52269d68529e382be74a094850",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpilibc.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpilibc.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-6/wpilibc-cpp-2027.0.0-alpha-6-windowsx86-64.zip",
        sha256 = "edf7cf4391dafd2068e4deb4394b36bb70486233436da7d6cd968928fed5c8f2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-6/wpilibc-cpp-2027.0.0-alpha-6-windowsarm64.zip",
        sha256 = "ecf77c7314de210d307079f72cc9f7d887d49d8c8929465a944845846605462c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-6/wpilibc-cpp-2027.0.0-alpha-6-linuxarm64static.zip",
        sha256 = "9ddb02e25c46fb8eff0891b9556968739c71c52d880caf32d5db6bd9eadd6fee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-6/wpilibc-cpp-2027.0.0-alpha-6-linuxx86-64static.zip",
        sha256 = "d5177894a0ea54e47734504a42f680c39defd401a07764ac543407713e846132",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-6/wpilibc-cpp-2027.0.0-alpha-6-osxuniversalstatic.zip",
        sha256 = "3fb9724bbc143583bfa704d8f1baa5435731bdcc7af620a88dad1060a557859f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-6/wpilibc-cpp-2027.0.0-alpha-6-windowsx86-64static.zip",
        sha256 = "2acc779d230a6770f6e65183bdd567ca0e9dad10227262b39a2453c07f79f55a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-6/wpilibc-cpp-2027.0.0-alpha-6-windowsarm64static.zip",
        sha256 = "48200430da3d923f43703662bf9709764eb0f12e3eb65980554846add017bdde",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-6/wpilibc-cpp-2027.0.0-alpha-6-linuxarm64debug.zip",
        sha256 = "a68a568f90ca357a7e959fdb32a433c1b1e888c785450905a6cdacd1b4a06464",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-6/wpilibc-cpp-2027.0.0-alpha-6-linuxx86-64debug.zip",
        sha256 = "ccf5d5467eb85977f530c9e38617975b60277df69a0297034aaebb3e05de7b45",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-6/wpilibc-cpp-2027.0.0-alpha-6-osxuniversaldebug.zip",
        sha256 = "3ad497b6c04bb70100aed73ab5b0132bf3350d392fa1635d727b0fd9c0df47c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpilibc.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libwpilibc.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpilibc.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-6/wpilibc-cpp-2027.0.0-alpha-6-windowsx86-64debug.zip",
        sha256 = "e861120aed87386de62bef42d28020fb7139c9aa0110b1a372e428cc53a5c8d5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-6/wpilibc-cpp-2027.0.0-alpha-6-windowsarm64debug.zip",
        sha256 = "759b5a43cfb5b4d82c13cf0a131ff49bc8f90a19c998b7614cb6fccc32026f65",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-6/wpilibc-cpp-2027.0.0-alpha-6-linuxarm64staticdebug.zip",
        sha256 = "5ec7c9739d0e9ebb7c8a89cc1bd54547f07a02582b1a1d65f00cdfd17519ab43",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-6/wpilibc-cpp-2027.0.0-alpha-6-linuxx86-64staticdebug.zip",
        sha256 = "9353a0de294ce25dd601009c325aa859a36b25f5e54aae708bd922e7466155e1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-6/wpilibc-cpp-2027.0.0-alpha-6-osxuniversalstaticdebug.zip",
        sha256 = "98d184f0836811540758373b725a7f5c63660180ffe6ae42fc419e0e48cdfd35",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-6/wpilibc-cpp-2027.0.0-alpha-6-windowsx86-64staticdebug.zip",
        sha256 = "fdd8b93b7bcc64291df55bb32bfbede7b53875613267c13163c81aad7f89849e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-6/wpilibc-cpp-2027.0.0-alpha-6-windowsarm64staticdebug.zip",
        sha256 = "2efe297be4b48ca21ed3119178cdaa56acee1680371f09eb39863073241fae4d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-6/wpilibc-cpp-2027.0.0-alpha-6-linuxsystemcore.zip",
        sha256 = "90b8f85e11e1d69b7f464f8d337851e2d56390d638adacac1d9aef77e4dc0867",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-6/wpilibc-cpp-2027.0.0-alpha-6-linuxsystemcorestatic.zip",
        sha256 = "dad0d3a7e9396dd735ce0a1a268705ed283002a553eab89c9cdcc4eea05391f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-6/wpilibc-cpp-2027.0.0-alpha-6-linuxsystemcoredebug.zip",
        sha256 = "07eceaa53d0f57d72473c0b51b062b8959a30085aa3360216180da6bf3eed436",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_wpilibc_wpilibc-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/wpilibc/wpilibc-cpp/2027.0.0-alpha-6/wpilibc-cpp-2027.0.0-alpha-6-linuxsystemcorestaticdebug.zip",
        sha256 = "3e9632f79e3e4b14a431c0c7b2c58a0ee7f197ad34157acc258ce574182b8394",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-6/commandsv2-cpp-2027.0.0-alpha-6-headers.zip",
        sha256 = "de76446f7e5224dbc8df0bad7f61eb2f327fbc835d2e0bbad4e45bfddf35b737",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-6/commandsv2-cpp-2027.0.0-alpha-6-sources.zip",
        sha256 = "ab23a9787cc2643480a0e095f07d107853c4749dbdce03f852d6fd30672c230e",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-6/commandsv2-cpp-2027.0.0-alpha-6-linuxarm64.zip",
        sha256 = "e02b0ee0210ca7cef2b151863ad0121bec86ea4361ce011d73c715138152968d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-6/commandsv2-cpp-2027.0.0-alpha-6-linuxx86-64.zip",
        sha256 = "c57aaa0ff525f05c84b33c3155ee76c070b9f03cb9c8d515d0bcbc5dadae7b01",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-6/commandsv2-cpp-2027.0.0-alpha-6-osxuniversal.zip",
        sha256 = "9bfb918ad4b149cc2231d864fc2b0112be17b345bdac8f3d45902666de79cb90",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libcommandsv2.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libcameraserver.dylib @rpath/libcameraserver.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libwpilibc.dylib @rpath/libwpilibc.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcommandsv2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-6/commandsv2-cpp-2027.0.0-alpha-6-windowsx86-64.zip",
        sha256 = "34d869128ecbb2e76c3fd4bad07ea60a2d638b029e653cebaba383f5fa01898d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-6/commandsv2-cpp-2027.0.0-alpha-6-windowsarm64.zip",
        sha256 = "cedccbdbf3ce2e9b696fdd05de23487a12018d0a6c01381850f0387fae0c3c67",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-6/commandsv2-cpp-2027.0.0-alpha-6-linuxarm64static.zip",
        sha256 = "36c25e4739ceefdac32ef828c56e833ed5015f0694e679c76ff219a4039b1663",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-6/commandsv2-cpp-2027.0.0-alpha-6-linuxx86-64static.zip",
        sha256 = "650f1d6e09a2d95cbb4d02f8933389c3489ccc7c53c4032ac2af19900da68cc5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-6/commandsv2-cpp-2027.0.0-alpha-6-osxuniversalstatic.zip",
        sha256 = "08e6787d3212b68c87c14a9f5fbce2406ddb2702fd16a6ba9f36945666f6a822",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-6/commandsv2-cpp-2027.0.0-alpha-6-windowsx86-64static.zip",
        sha256 = "cc56cf53ea9931684da2486681c19715ffe51d41a48cf797d43effbbeedbf89e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-6/commandsv2-cpp-2027.0.0-alpha-6-windowsarm64static.zip",
        sha256 = "fdfbb17e9e5e694a5c1d6046118538c3239d4d060279dcedc705d8f29f53f29c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-6/commandsv2-cpp-2027.0.0-alpha-6-linuxarm64debug.zip",
        sha256 = "4e5efad0a65fa3f9d891e322296edb1d4078395835db2b0905d67c10e9e3b042",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-6/commandsv2-cpp-2027.0.0-alpha-6-linuxx86-64debug.zip",
        sha256 = "9d9aefe8190787b3aab2e177e942b2ba10445651fa0ea0b4a038cfab49e5780c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-6/commandsv2-cpp-2027.0.0-alpha-6-osxuniversaldebug.zip",
        sha256 = "c7a58b12328b63e9d4c00cf410fda64e5439f8ec6334ed7c528f79271e3d0234",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libcommandsv2.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libcameraserver.dylib @rpath/libcameraserver.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libwpilibc.dylib @rpath/libwpilibc.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcommandsv2.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcommandsv2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-6/commandsv2-cpp-2027.0.0-alpha-6-windowsx86-64debug.zip",
        sha256 = "7419a79b224ff7ec937e0f1acfbfc6a201a60d852c5a6ac8896097bd7cad853c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-6/commandsv2-cpp-2027.0.0-alpha-6-windowsarm64debug.zip",
        sha256 = "7c3f9d09799b74e246dcdc216db4d9c61e02c8eacb9cfe1f37d741a100be152f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-6/commandsv2-cpp-2027.0.0-alpha-6-linuxarm64staticdebug.zip",
        sha256 = "481eaab99934283a6981fb227e90ac1b028907387a64505a1530d06f86e13cdf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-6/commandsv2-cpp-2027.0.0-alpha-6-linuxx86-64staticdebug.zip",
        sha256 = "781d67347f7ff2887fd8d43a139c46b4663cfa19c1e3380a2b4f4484a42ee004",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-6/commandsv2-cpp-2027.0.0-alpha-6-osxuniversalstaticdebug.zip",
        sha256 = "ea90790ae629e1b920f67d6086a5de599a1868e3417dedbd8278ce4cb1250475",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-6/commandsv2-cpp-2027.0.0-alpha-6-windowsx86-64staticdebug.zip",
        sha256 = "bf41953c1011b294a0c2d69f5f91f6394c2fb52eeff868ed914a8c7bfd447da7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-6/commandsv2-cpp-2027.0.0-alpha-6-windowsarm64staticdebug.zip",
        sha256 = "eed697db8ac507f67abf0cc95bf4b2c28e1918bd04adb834e2b8003c1584cd35",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-6/commandsv2-cpp-2027.0.0-alpha-6-linuxsystemcore.zip",
        sha256 = "498b12ac33f314921e7fcb9df728a3699716012c1221f09b9d349c9f1a6d7207",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-6/commandsv2-cpp-2027.0.0-alpha-6-linuxsystemcorestatic.zip",
        sha256 = "db3203963ad46ed081a8ee56ad19598bd77f40c6910c9db48fba394f073c9382",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-6/commandsv2-cpp-2027.0.0-alpha-6-linuxsystemcoredebug.zip",
        sha256 = "51926b29316d54c7cbba5c2e9ae442508ce1653edef146a6c5f3c009025c02ca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_commandsv2_commandsv2-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/commandsv2/commandsv2-cpp/2027.0.0-alpha-6/commandsv2-cpp-2027.0.0-alpha-6-linuxsystemcorestaticdebug.zip",
        sha256 = "4bcb66192f0eb5c80dbfd1b9c4a0ac34879dba3eaf732b774f1381deec84e79d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/commandsv2:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-6/romiVendordep-cpp-2027.0.0-alpha-6-headers.zip",
        sha256 = "c87b747f55d18fa385778113b207f7e8aa1e84911c7c0a69497337f0225db049",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-6/romiVendordep-cpp-2027.0.0-alpha-6-sources.zip",
        sha256 = "241a77e7d5657869bd206902feedfc5c28f11c3818e20901d2a1beb928a2fea2",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-6/romiVendordep-cpp-2027.0.0-alpha-6-linuxarm64.zip",
        sha256 = "580660d6fc5318ebfedb3901d21abfed23a99418afd45008699015bab72603c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-6/romiVendordep-cpp-2027.0.0-alpha-6-linuxx86-64.zip",
        sha256 = "fb0b2358ec1a5947a6f9e256425b80ac3fb911d15cbda1664b83d84c22810cc5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-6/romiVendordep-cpp-2027.0.0-alpha-6-osxuniversal.zip",
        sha256 = "3ca278b974f122c5d7a46c9783b9bab14371f8ffebb68415a523b77b04571f5c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libromiVendordep.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libromiVendordep.dylib",
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
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-6/romiVendordep-cpp-2027.0.0-alpha-6-windowsx86-64.zip",
        sha256 = "5f744ebd8e028368173e0b7a48901bcba30e46e841a3e16f8c47b46ea86ba62d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-6/romiVendordep-cpp-2027.0.0-alpha-6-windowsarm64.zip",
        sha256 = "ae97c983419cc728149cba4354e35e5ce7be9a3ee57dc6f3314761467f94a101",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-6/romiVendordep-cpp-2027.0.0-alpha-6-linuxarm64static.zip",
        sha256 = "6f98ea25d2e460669db4284d9443eee9b473e10b0ff09a0532fd063a9a7df26f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-6/romiVendordep-cpp-2027.0.0-alpha-6-linuxx86-64static.zip",
        sha256 = "c4270b93c0a391ce7e9fa057d62e7e91c6b7768fe42f63ed15b335a14bcd285e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-6/romiVendordep-cpp-2027.0.0-alpha-6-osxuniversalstatic.zip",
        sha256 = "ca02484106912fa4e3152b36d29759a74e91ed563599f770fb558c7211da576a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-6/romiVendordep-cpp-2027.0.0-alpha-6-windowsx86-64static.zip",
        sha256 = "b2b6a84e51758f2e3678dc0867a6517ab0f2400994c8b4ff1a94725d11f041c0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-6/romiVendordep-cpp-2027.0.0-alpha-6-windowsarm64static.zip",
        sha256 = "0bd12293f972a01ecbffa90893f84bf2ca21b182bb9889bdef3b472e7d7264a2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-6/romiVendordep-cpp-2027.0.0-alpha-6-linuxarm64debug.zip",
        sha256 = "e9de4c5397e7cfee6295c6ed023dc2ccfbbb5ac5158403fed50fc2badd31d69f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-6/romiVendordep-cpp-2027.0.0-alpha-6-linuxx86-64debug.zip",
        sha256 = "83e5ba18442eb0118c0935abdd9c8780df8e47b62dfa72d0637f66ff374b41d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-6/romiVendordep-cpp-2027.0.0-alpha-6-osxuniversaldebug.zip",
        sha256 = "e9004dae98ccaba4509f0965203950282adb0608b45f16dbfc65a912b752af48",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libromiVendordep.dylib osx/universal/shared/libromiVendordep.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libromiVendordep.dylib",
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
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-6/romiVendordep-cpp-2027.0.0-alpha-6-windowsx86-64debug.zip",
        sha256 = "52568e539609f829efd9950652996c57ade370ac828479e9df9c2580a22421ef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-6/romiVendordep-cpp-2027.0.0-alpha-6-windowsarm64debug.zip",
        sha256 = "f70ddecdca70ee9784f3a5780e4d169cabc21dad96857fa3cb7c1b4d9ee67fc0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-6/romiVendordep-cpp-2027.0.0-alpha-6-linuxarm64staticdebug.zip",
        sha256 = "e6466c24dea5bb2e6a9baf22346296b3e90dc2e4368ddb7b0361d974bcfaab5d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-6/romiVendordep-cpp-2027.0.0-alpha-6-linuxx86-64staticdebug.zip",
        sha256 = "c1301508f690a56ffabb0a70e852adfdcea2eec8a6cedfd8ecaab40da8f98353",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-6/romiVendordep-cpp-2027.0.0-alpha-6-osxuniversalstaticdebug.zip",
        sha256 = "92afac4957c0b64d7be1a80b5cdaf534c70aac46cfb06f6f06fecfd6b3e78f8b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-6/romiVendordep-cpp-2027.0.0-alpha-6-windowsx86-64staticdebug.zip",
        sha256 = "c2eacb01f4ce24bd33e534dc7c7d2e0db7ddc1e7eaaef9e1a02b3f73d52f868f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-6/romiVendordep-cpp-2027.0.0-alpha-6-windowsarm64staticdebug.zip",
        sha256 = "9a9233b9af19bfcd4ab7df23d4a11533544d2a8d6471852ba3ba2fe493b2781e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-6/romiVendordep-cpp-2027.0.0-alpha-6-linuxsystemcore.zip",
        sha256 = "257523e855ad2c9cd785adbfe753ae00c85eb07daeb3bfb991c6b95c6b92f984",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-6/romiVendordep-cpp-2027.0.0-alpha-6-linuxsystemcorestatic.zip",
        sha256 = "bd596f41aa9a0658f03e7b371cae9266bb8ef5ff1a12a41ccdb76f6ffc879164",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-6/romiVendordep-cpp-2027.0.0-alpha-6-linuxsystemcoredebug.zip",
        sha256 = "11af2da3d723c50808d5fb08d560163ad20a8f4281d46e0d3ec9acea046648e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_romivendordep_romivendordep-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-6/romiVendordep-cpp-2027.0.0-alpha-6-linuxsystemcorestaticdebug.zip",
        sha256 = "0fb83019a090d2e195426922a94729989d216e4afa6d6103038befc604fe1cec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-6/xrpVendordep-cpp-2027.0.0-alpha-6-headers.zip",
        sha256 = "8481849936320dbdd2ba0dc226c8be98ff7ca21c2f83af8d3248ef20bbe08929",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-6/xrpVendordep-cpp-2027.0.0-alpha-6-sources.zip",
        sha256 = "7e12daa3d24351217cdfe444c9effb45a5ad31020e93dce1957129c3f484f15e",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-6/xrpVendordep-cpp-2027.0.0-alpha-6-linuxarm64.zip",
        sha256 = "63f7ba00cf3bb9aa18a7aa5f670f590fabf7348532816aec97ecec3d7a6ed3f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-6/xrpVendordep-cpp-2027.0.0-alpha-6-linuxx86-64.zip",
        sha256 = "f381756adbca802497d5421bcd7f0147d8a0c5152e819af8d31256fe4107e187",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-6/xrpVendordep-cpp-2027.0.0-alpha-6-osxuniversal.zip",
        sha256 = "7ae4fd6497c710b3880e4f05af2f8387177d051687f9787f5292b40ae7120d21",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libxrpVendordep.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libxrpVendordep.dylib",
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
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-6/xrpVendordep-cpp-2027.0.0-alpha-6-windowsx86-64.zip",
        sha256 = "af4d5fc165aa788755fc38071c236b1438849355e2a7e83ce10ab63a6407257b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-6/xrpVendordep-cpp-2027.0.0-alpha-6-windowsarm64.zip",
        sha256 = "7230066981785a8e0328a26e984c41a4ea38e0cc5ea34f911117732422907b43",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-6/xrpVendordep-cpp-2027.0.0-alpha-6-linuxarm64static.zip",
        sha256 = "48a049b8478d9fbe4d41bcd49f3a943d2e56a8b4e380742582515d07b4623396",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-6/xrpVendordep-cpp-2027.0.0-alpha-6-linuxx86-64static.zip",
        sha256 = "7e437ba735558fd7a51b9b75355c2fc73dee00d2929c3c9d20f4e47ba52d25e2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-6/xrpVendordep-cpp-2027.0.0-alpha-6-osxuniversalstatic.zip",
        sha256 = "3cbed58adb5387948c143ea4151f8f3317d933580166e6611682430544ff10be",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-6/xrpVendordep-cpp-2027.0.0-alpha-6-windowsx86-64static.zip",
        sha256 = "40f33ac7eee6c13b9fa694f8d9fe7b2beca04bf4327f6da83e8cb3f9f405577c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-6/xrpVendordep-cpp-2027.0.0-alpha-6-windowsarm64static.zip",
        sha256 = "429c253aff134b289019d0f062192f653cba8646ad423da2b9eaf9ec90cefa9c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-6/xrpVendordep-cpp-2027.0.0-alpha-6-linuxarm64debug.zip",
        sha256 = "3c7f0f14556c11753cf2173bb555e3fe9db356eb804ca0d5736b08268808ae6c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-6/xrpVendordep-cpp-2027.0.0-alpha-6-linuxx86-64debug.zip",
        sha256 = "57822a20970a929d0ff50e7a0ac493912dd6260f33fd180be44f5ab41e774694",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-6/xrpVendordep-cpp-2027.0.0-alpha-6-osxuniversaldebug.zip",
        sha256 = "234b7a0bac8a82fa7e903bdf1997a20d384179090f582a6877f946c7a92f80f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libxrpVendordep.dylib osx/universal/shared/libxrpVendordep.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libxrpVendordep.dylib",
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
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-6/xrpVendordep-cpp-2027.0.0-alpha-6-windowsx86-64debug.zip",
        sha256 = "0c18d81ca3fac4afbc135968c2c34e362f1b8a7bd3fcdb805379572ddb5ea959",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-6/xrpVendordep-cpp-2027.0.0-alpha-6-windowsarm64debug.zip",
        sha256 = "d5477061dbfa2d764b322789b0669296aa29a7a65ad46a0be3f8478d7bb7e835",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-6/xrpVendordep-cpp-2027.0.0-alpha-6-linuxarm64staticdebug.zip",
        sha256 = "4b94899ae0ae706357ee143faaa5971dc2b3500ef9f659d3667627c6dd8aa2ba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-6/xrpVendordep-cpp-2027.0.0-alpha-6-linuxx86-64staticdebug.zip",
        sha256 = "395f37bed2de3908f79c17bd6eef3332066785eadac0f93a95aa15acbef6a8cf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-6/xrpVendordep-cpp-2027.0.0-alpha-6-osxuniversalstaticdebug.zip",
        sha256 = "688a62a32416fb74008d4eff5b5934fe93dad8b755a7e6d5a653d2c52b8f95ae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-6/xrpVendordep-cpp-2027.0.0-alpha-6-windowsx86-64staticdebug.zip",
        sha256 = "ffff11146f2b9c18456af975af040c6b5db52c5719061c9e8aafcdf4ba9db115",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-6/xrpVendordep-cpp-2027.0.0-alpha-6-windowsarm64staticdebug.zip",
        sha256 = "b7cd7b72a7cad575cd3e2440ee53ed525ce52c9c6bc6489bddd5af08c6d93ef6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-6/xrpVendordep-cpp-2027.0.0-alpha-6-linuxsystemcore.zip",
        sha256 = "9b9dff944c299a1f197672b4bbeaccb0ea58356365b3b9b41fb9ff0912130af9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-6/xrpVendordep-cpp-2027.0.0-alpha-6-linuxsystemcorestatic.zip",
        sha256 = "4528f60fbd7fb1071758e259bdc213104e3dd546a93d7855c0446fa5beb7aafe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-6/xrpVendordep-cpp-2027.0.0-alpha-6-linuxsystemcoredebug.zip",
        sha256 = "08ae8c965819011ac5e34b253e9c98c9610cdf12b3e4c280abc2c592df7f5b85",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_xrpvendordep_xrpvendordep-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-6/xrpVendordep-cpp-2027.0.0-alpha-6-linuxsystemcorestaticdebug.zip",
        sha256 = "d3f4cdf2dd57293154de2211a45d9ebca594adbc7ccf99711a489c188561ce88",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-6/halsim_ds_socket-2027.0.0-alpha-6-headers.zip",
        sha256 = "739057465417659c47784ebe1c10f05eba5668b0bd9f081cf3faad3c193dbd5c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-6/halsim_ds_socket-2027.0.0-alpha-6-sources.zip",
        sha256 = "a74671ff0eea0004df38e0291dbc99d4debbadfbef9e1adc450fb9e07c2abad7",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-6/halsim_ds_socket-2027.0.0-alpha-6-linuxarm64.zip",
        sha256 = "bee630a17832dceb7044407197cd4ed6d0b509cb5bb0f288c97190fa0a3365df",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-6/halsim_ds_socket-2027.0.0-alpha-6-linuxx86-64.zip",
        sha256 = "bc4ddd189fa38a1aad57c227781730b08815a0efb98612ee89eea326548f99fa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-6/halsim_ds_socket-2027.0.0-alpha-6-osxuniversal.zip",
        sha256 = "03bd1d9c55cbfd1caecf9e6257f2387a92982c5098d3e589927a5ba4900481ca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_ds_socket.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-6/halsim_ds_socket-2027.0.0-alpha-6-windowsx86-64.zip",
        sha256 = "230d0a9227400692ca3d9f621cafe839d77bcac1ceaf1a201ba43719ee139dc3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-6/halsim_ds_socket-2027.0.0-alpha-6-windowsarm64.zip",
        sha256 = "f45472e201b8cf94491af38e884dfd79d1c2257508e146321af84ecb920d293e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-6/halsim_ds_socket-2027.0.0-alpha-6-linuxarm64static.zip",
        sha256 = "a18c15628cfece95f1854b89d93260fcfff3cbd99d87a892aea0710ec6c4061a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-6/halsim_ds_socket-2027.0.0-alpha-6-linuxx86-64static.zip",
        sha256 = "c3496880a8ad7edc829e3ecec4739447f0e23c6438a13688fb925df35667c9f8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-6/halsim_ds_socket-2027.0.0-alpha-6-osxuniversalstatic.zip",
        sha256 = "45fca9ccd521a4eabbe43a3264b9d17c72584ebe5a7750a10a779c8031b598be",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-6/halsim_ds_socket-2027.0.0-alpha-6-windowsx86-64static.zip",
        sha256 = "6679e68446c85ce38350a61eaa46fbd8d9322cdaace568be0cd0998b2a2d82ea",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-6/halsim_ds_socket-2027.0.0-alpha-6-windowsarm64static.zip",
        sha256 = "74de448af233620fc7b2cb99c8f801cb3a724fbee10c152ec56afa4dfb0a748f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-6/halsim_ds_socket-2027.0.0-alpha-6-linuxarm64debug.zip",
        sha256 = "f27ff9d4d5469ba7df6fd81466b5114e818298f5fe22f4791d5e23e12251476c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-6/halsim_ds_socket-2027.0.0-alpha-6-linuxx86-64debug.zip",
        sha256 = "2a5ba065808243e144f0c9ad9095561e22472d634a64c10e09789531ae3f5d5f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-6/halsim_ds_socket-2027.0.0-alpha-6-osxuniversaldebug.zip",
        sha256 = "3765b2d32cdc8c3d805ab5872d475a6f015bf930a1d74e09296e301aa90ff7bf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_ds_socket.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-6/halsim_ds_socket-2027.0.0-alpha-6-windowsx86-64debug.zip",
        sha256 = "b7aa600e740ed2e56f239e55544e1b8110f59f7169ac1cd5bff149484d587072",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-6/halsim_ds_socket-2027.0.0-alpha-6-windowsarm64debug.zip",
        sha256 = "1debf1436afa59c477a417c8c7a8688e96201f41e2c2928ddcfb124c2d3ab8c2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-6/halsim_ds_socket-2027.0.0-alpha-6-linuxarm64staticdebug.zip",
        sha256 = "deafd056a52ed2769b7e3efe21025b4ec80567c8fb70107fd3a69e83adbaccd1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-6/halsim_ds_socket-2027.0.0-alpha-6-linuxx86-64staticdebug.zip",
        sha256 = "ea8ae19d8cb402e2bd6c43b29de2653d2c7f1d70f96f815abfc9f9f2f07f4819",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-6/halsim_ds_socket-2027.0.0-alpha-6-osxuniversalstaticdebug.zip",
        sha256 = "b8ff9ee364be4a521789031c260d958258a7f0afef512e7a156156580729a6c9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-6/halsim_ds_socket-2027.0.0-alpha-6-windowsx86-64staticdebug.zip",
        sha256 = "359c50869564c869d26db786cd2a842e755d93fcc76eda908c2d203754da1d57",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ds_socket/2027.0.0-alpha-6/halsim_ds_socket-2027.0.0-alpha-6-windowsarm64staticdebug.zip",
        sha256 = "06a97d5bcbebda85fee1f73c0b244f7c1a3129461171561b01037841170dbcce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-6/halsim_gui-2027.0.0-alpha-6-headers.zip",
        sha256 = "55ebb325d976a03e24c0ef179aec885d477d776879dd658a873db21e177ed3a1",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-6/halsim_gui-2027.0.0-alpha-6-sources.zip",
        sha256 = "6498a6ee0bcfb37de5350d701b18f91079c3f3806ab599ebba014de48de4163e",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-6/halsim_gui-2027.0.0-alpha-6-linuxarm64.zip",
        sha256 = "5dc596214c397bfc0c59e165e9f4e7d5640be3e7a8e7f7761a7beb4ff5c0e4f6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-6/halsim_gui-2027.0.0-alpha-6-linuxx86-64.zip",
        sha256 = "e3a3a46498a84a7433fe1eefe7149dfe92aa683ae025e932b66f0e25e6554d36",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-6/halsim_gui-2027.0.0-alpha-6-osxuniversal.zip",
        sha256 = "a000bc5c2ef852ea04b0fdfa16edc059b9afb1987f1fe35a18eed5ed28136a79",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_gui.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_gui.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-6/halsim_gui-2027.0.0-alpha-6-windowsx86-64.zip",
        sha256 = "adbed01e31f18df71c0e3d681742abd728f3ddd83c6786062907c8e66d30dc81",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-6/halsim_gui-2027.0.0-alpha-6-windowsarm64.zip",
        sha256 = "3f2309191d4486c647493c4f80090de282fafbea2f58a077956334520bbe392c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-6/halsim_gui-2027.0.0-alpha-6-linuxarm64static.zip",
        sha256 = "cb497eb1b6b9142f0146bcedefda4a37b51251fa899c22217f5d23c9e2b00227",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-6/halsim_gui-2027.0.0-alpha-6-linuxx86-64static.zip",
        sha256 = "c5ed6b599cb725f3f77c6ffce3abdfb8fff7a39983d363cfac39e0bcdce6ce7e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-6/halsim_gui-2027.0.0-alpha-6-osxuniversalstatic.zip",
        sha256 = "a44a5afd636b0e86db9c719a328b0141e912e1d47345e3ef152ef5915ee3a96e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-6/halsim_gui-2027.0.0-alpha-6-windowsx86-64static.zip",
        sha256 = "3b6f83e41b7725ad5f04fff2e5aeed65925ab7d504501bd8dd946f780997d0a5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-6/halsim_gui-2027.0.0-alpha-6-windowsarm64static.zip",
        sha256 = "66aece6d4dbb47fbefe82d0cd5f4058c5a34cebc4c612967158b0030a329c603",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-6/halsim_gui-2027.0.0-alpha-6-linuxarm64debug.zip",
        sha256 = "6ce74134b91a7460cf3a66683b2af7a6bf57ed3d1cbde5dfbc23e5b7fc4b173d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-6/halsim_gui-2027.0.0-alpha-6-linuxx86-64debug.zip",
        sha256 = "aab3e2f07a56ad1ca71868684ec9e58b608e391faec937c7bc41171796127787",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-6/halsim_gui-2027.0.0-alpha-6-osxuniversaldebug.zip",
        sha256 = "0fad7adbcd60ddf3d239a8a549cebee6d291c1e4c11c7a4b454ac8e438dcbd49",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_gui.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_gui.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_gui.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-6/halsim_gui-2027.0.0-alpha-6-windowsx86-64debug.zip",
        sha256 = "b8431762ac1bae391ee44a45534e2ba2a49598bb5d6cbad0e39096928ef86dca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-6/halsim_gui-2027.0.0-alpha-6-windowsarm64debug.zip",
        sha256 = "6a1e8331fbba7be499e22102bde7f9083ee44ed4b7bedbc0e5aa5b9b23250e9b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-6/halsim_gui-2027.0.0-alpha-6-linuxarm64staticdebug.zip",
        sha256 = "39777ac05bcb542c7036b3ae24409505f65fb4e3e3c4cb00aba3f3b4f5f13a0e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-6/halsim_gui-2027.0.0-alpha-6-linuxx86-64staticdebug.zip",
        sha256 = "53d74f9dc4538f457f04b5b8d5789ba060c189c9ecc4b6867f3404147c990e77",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-6/halsim_gui-2027.0.0-alpha-6-osxuniversalstaticdebug.zip",
        sha256 = "9c32c8d1b379a562e7aeb0769459a8e792c07685c20e1e776b6ec439ebd0b03a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-6/halsim_gui-2027.0.0-alpha-6-windowsx86-64staticdebug.zip",
        sha256 = "2af4bdf967fca356af8f3dea5303c95525892f2084c3339a12a074c486c4fbc5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_gui/2027.0.0-alpha-6/halsim_gui-2027.0.0-alpha-6-windowsarm64staticdebug.zip",
        sha256 = "58e9c5bd25d90100f108f4d8e73a3f45cf640a99bd77818b623998ae55d9bf1b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-6/halsim_ws_client-2027.0.0-alpha-6-headers.zip",
        sha256 = "6f4576b0c635490c0f73e8137e3bc90c4613684773d26a1da4d2d61317ca1bbd",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-6/halsim_ws_client-2027.0.0-alpha-6-sources.zip",
        sha256 = "85c6f4192cb5e5aa3bab661cb669ae4d82e52f70ad927fd0dbc45d817e1f344c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-6/halsim_ws_client-2027.0.0-alpha-6-linuxarm64.zip",
        sha256 = "b50beadbd1a594afcad8c4f3ad08e149d562f8662f44a4b7cb2ed4a1d1641578",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-6/halsim_ws_client-2027.0.0-alpha-6-linuxx86-64.zip",
        sha256 = "64a9ea4d13b5daf1d9c09bfc46fe36a3015f5ae660e62122c76eee57df575aba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-6/halsim_ws_client-2027.0.0-alpha-6-osxuniversal.zip",
        sha256 = "af2e2b32fc7508216fe9ff2622248af3ad17d96ffb068d093c9d5189e37a860d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_ws_client.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_ws_client.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-6/halsim_ws_client-2027.0.0-alpha-6-windowsx86-64.zip",
        sha256 = "0084593cfa5220e459fbb512d0ecdfc8ce54bf238cb820248dd3158c2e1197ba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-6/halsim_ws_client-2027.0.0-alpha-6-windowsarm64.zip",
        sha256 = "6b5a8f68d77d1528af1e2aa98be07e93b679ef42771effe9e86da36e606fd555",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-6/halsim_ws_client-2027.0.0-alpha-6-linuxarm64static.zip",
        sha256 = "09d4d19e92f50fcd1861ac70807f4607bd77512da1ead28f6f7486097ba5dc8a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-6/halsim_ws_client-2027.0.0-alpha-6-linuxx86-64static.zip",
        sha256 = "4e6e374121c89d9f121e4756fbef9e3607f4e70e02dad49eca4d4aa2617951dd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-6/halsim_ws_client-2027.0.0-alpha-6-osxuniversalstatic.zip",
        sha256 = "667198d33216a9592a98603e6b513a3f2324d7f565dd41da0275280ee81d9070",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-6/halsim_ws_client-2027.0.0-alpha-6-windowsx86-64static.zip",
        sha256 = "5f487f63f493aa9b30bb510ee8c6571ae352b0e9d10fb55d4522d6cd188a4cd2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-6/halsim_ws_client-2027.0.0-alpha-6-windowsarm64static.zip",
        sha256 = "159deaad2579cbb2ea3c5197cc7af2506d302731ada277803c3c34e691f6bf4a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-6/halsim_ws_client-2027.0.0-alpha-6-linuxarm64debug.zip",
        sha256 = "766e906ed64ac16743c5e265435dbf93056726b0e9c19f40d6379b1a424a1a6a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-6/halsim_ws_client-2027.0.0-alpha-6-linuxx86-64debug.zip",
        sha256 = "b847c30e2ede0e91fb05096771d6703074ce4306a0529775d200f66f1d569e52",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-6/halsim_ws_client-2027.0.0-alpha-6-osxuniversaldebug.zip",
        sha256 = "3b9bb16602f2993f56e7f12526297826ada0a7561588ba48e7d05fd9ac0a764d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_ws_client.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_ws_client.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-6/halsim_ws_client-2027.0.0-alpha-6-windowsx86-64debug.zip",
        sha256 = "644f2097b40ace345605c7569b9e6262dd43eaf72f8fbc63e1e5c4e1b9217c09",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-6/halsim_ws_client-2027.0.0-alpha-6-windowsarm64debug.zip",
        sha256 = "af235f91e27b8ded31437079f900cc55cab79b9ae5d58e9c04e40a34f546a17d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-6/halsim_ws_client-2027.0.0-alpha-6-linuxarm64staticdebug.zip",
        sha256 = "5801123606f544d519e80a48b17a376ac44158a04e2de56acb783f7e0d238c4a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-6/halsim_ws_client-2027.0.0-alpha-6-linuxx86-64staticdebug.zip",
        sha256 = "bc3d0d16ce840668fe4a524b656f9c296fff86cceb0d54dea8a6dee46e0fa486",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-6/halsim_ws_client-2027.0.0-alpha-6-osxuniversalstaticdebug.zip",
        sha256 = "061522ea18d9f2f620fb85405975904e57ea4a31b144f61ae2bcf9acc8a26198",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-6/halsim_ws_client-2027.0.0-alpha-6-windowsx86-64staticdebug.zip",
        sha256 = "f98f0607c61a81ac6938e98bacc4505c88db3e2ae7f697af5c35298785870714",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_client/2027.0.0-alpha-6/halsim_ws_client-2027.0.0-alpha-6-windowsarm64staticdebug.zip",
        sha256 = "cbc118374f7386557f45dcec85fa48f3b4d3eee5c7e1f1e6b4c1c61763a13c75",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-6/halsim_ws_server-2027.0.0-alpha-6-headers.zip",
        sha256 = "e0a6f9bf505b79d5f2958d74a56bb8262a4917f527ecd04fa98a7ec095364766",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-6/halsim_ws_server-2027.0.0-alpha-6-sources.zip",
        sha256 = "04b6cbd830f2a0297353fc20253c243856ce22f6b5cd96c18928ce10689f535f",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-6/halsim_ws_server-2027.0.0-alpha-6-linuxarm64.zip",
        sha256 = "7c9bb87867cb62da823dfc0d19a6d69432d5657b76a710485a0014db7889d7c5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-6/halsim_ws_server-2027.0.0-alpha-6-linuxx86-64.zip",
        sha256 = "a6c8247c99c15b9c6ffb259d30547ecb703db5920b85fb887f5025e5b3c818a3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-6/halsim_ws_server-2027.0.0-alpha-6-osxuniversal.zip",
        sha256 = "dd0146a6eaf5be1bf94bd075f88b7271d0a3612c0706cd357521b5fbfcbca741",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_ws_server.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_ws_server.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-6/halsim_ws_server-2027.0.0-alpha-6-windowsx86-64.zip",
        sha256 = "bb927b268987312a981b3a8d93792aa3b143b3006c02c630e88c2f4db358ca89",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-6/halsim_ws_server-2027.0.0-alpha-6-windowsarm64.zip",
        sha256 = "1d1053b324ac668a1254fd58c5330ff9e6885c22c5c6c369decf9443392133c9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-6/halsim_ws_server-2027.0.0-alpha-6-linuxarm64static.zip",
        sha256 = "4796787f0973493124527d34e20dcf757d2770bab8fa8c7a7a937e950ed10fb7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-6/halsim_ws_server-2027.0.0-alpha-6-linuxx86-64static.zip",
        sha256 = "ce9d3ce7dd48902babfc78e0fcd0bb85f72f34527cda0545590029d243fc3598",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-6/halsim_ws_server-2027.0.0-alpha-6-osxuniversalstatic.zip",
        sha256 = "f0eb0a17feadb65bb063cdab62109841f4cb84547e2b0f3659557dda2bc52536",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-6/halsim_ws_server-2027.0.0-alpha-6-windowsx86-64static.zip",
        sha256 = "9c2a6ef7ffff34401de23bd88e3cdb50a8fc10cf7b2e3625942575df9f61ad99",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-6/halsim_ws_server-2027.0.0-alpha-6-windowsarm64static.zip",
        sha256 = "06c341beb6f0699c32fba8eafeab8d1576967e9affb608ebe804563b2c3f7c33",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-6/halsim_ws_server-2027.0.0-alpha-6-linuxarm64debug.zip",
        sha256 = "7d072143cf04cb41b44e48169f62b81bbe78789eff7c54121f1c4b91e5645777",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-6/halsim_ws_server-2027.0.0-alpha-6-linuxx86-64debug.zip",
        sha256 = "ef0c673b7b7f237a0f92dbe848a946ed7a673e4e5974585e37ca77d8fa0f89b9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-6/halsim_ws_server-2027.0.0-alpha-6-osxuniversaldebug.zip",
        sha256 = "40a0fc2921b104be212f030b29f845975058d98557c6fc01352a26aa28f3aced",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libhalsim_ws_server.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_ws_server.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-6/halsim_ws_server-2027.0.0-alpha-6-windowsx86-64debug.zip",
        sha256 = "5694ea702dc0dde399fd0e722a5c6fb61517b1e34701992732564274607a8ebd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-6/halsim_ws_server-2027.0.0-alpha-6-windowsarm64debug.zip",
        sha256 = "a9e3813134bb9d26b8b54c50ebb459bec134ef40c15f9a4db02d109fa879f770",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-6/halsim_ws_server-2027.0.0-alpha-6-linuxarm64staticdebug.zip",
        sha256 = "10eeee574b4162c1fc92420390e96c79d288ca4df8d4a0e6d160e1f45efe3936",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-6/halsim_ws_server-2027.0.0-alpha-6-linuxx86-64staticdebug.zip",
        sha256 = "fe1d75833fbffbe1b722d7502ee3dd66b701d5c1eee08324ea87af66ca818248",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-6/halsim_ws_server-2027.0.0-alpha-6-osxuniversalstaticdebug.zip",
        sha256 = "d0f0f2121f9d7e1d477281f687beadc69391e4fb2d2e7319600158e64b5fbfbb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-6/halsim_ws_server-2027.0.0-alpha-6-windowsx86-64staticdebug.zip",
        sha256 = "bdb69a973c3b80352cbc538c4168787edff194c0b9ccb22f1edb07a36d19e738",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/halsim/halsim_ws_server/2027.0.0-alpha-6/halsim_ws_server-2027.0.0-alpha-6-windowsarm64staticdebug.zip",
        sha256 = "9f6939a3118be689827b96f46c7d22c00095e72eda759d599ebfe0ecbcba527f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/DataLogTool/2027.0.0-alpha-6/DataLogTool-2027.0.0-alpha-6-linuxarm64.zip",
        sha256 = "f7de1a13ee8603749b0804a178e04a2de56343371dc06857fa79b506422a40a1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/DataLogTool/2027.0.0-alpha-6/DataLogTool-2027.0.0-alpha-6-linuxx86-64.zip",
        sha256 = "d04ff948be6898cf650a4aacc8deedea9b7d769ad9f7a719f0f56acb7a4adb42",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/DataLogTool/2027.0.0-alpha-6/DataLogTool-2027.0.0-alpha-6-osxuniversal.zip",
        sha256 = "38e3ef5c2c226782e4480ceb965c56e4b4be9e5f61eaf67f3e2ef5a691fbfc60",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/DataLogTool/2027.0.0-alpha-6/DataLogTool-2027.0.0-alpha-6-windowsx86-64.zip",
        sha256 = "006b2009913b29fc0daee2531c0e2fca60b6507d765f2fdc958a28aeada7b5d1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/DataLogTool/2027.0.0-alpha-6/DataLogTool-2027.0.0-alpha-6-windowsarm64.zip",
        sha256 = "25d4d056240de0b981b62a4d7c4df2a6cba6dea9911e71262239f20f080f40fd",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/Glass/2027.0.0-alpha-6/Glass-2027.0.0-alpha-6-linuxarm64.zip",
        sha256 = "40e8111e17cb49eeb74c09936a4745d2e8ff3f791035fec4e6700d926fdec1f8",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/Glass/2027.0.0-alpha-6/Glass-2027.0.0-alpha-6-linuxx86-64.zip",
        sha256 = "3d479ab9f9df621813304cdd0f92e81238c115a7660b00517b9114a1911a2a5c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/Glass/2027.0.0-alpha-6/Glass-2027.0.0-alpha-6-osxuniversal.zip",
        sha256 = "68a5f3553db8caa2ac02aeaf45f7be3690ac119792b73126853e16e1deb96410",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/Glass/2027.0.0-alpha-6/Glass-2027.0.0-alpha-6-windowsx86-64.zip",
        sha256 = "07cdc0d85f7d049599b4ffc63a3b8ef219460b2354072b53f7fc14e9f76d4d65",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/Glass/2027.0.0-alpha-6/Glass-2027.0.0-alpha-6-windowsarm64.zip",
        sha256 = "86f1b3fd89045558235b3462fcdd4bf86a935378c7a233c3d09e6078370f95c8",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/OutlineViewer/2027.0.0-alpha-6/OutlineViewer-2027.0.0-alpha-6-linuxarm64.zip",
        sha256 = "982000d4d8e5e6b09ba993fd8c6fc2858a94e335087f628f92db1c240531c27f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/OutlineViewer/2027.0.0-alpha-6/OutlineViewer-2027.0.0-alpha-6-linuxx86-64.zip",
        sha256 = "cba4c812be0afd90ff9ae935d14214ba24a3d979f0f0cf228547ab69fe9d4b5b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/OutlineViewer/2027.0.0-alpha-6/OutlineViewer-2027.0.0-alpha-6-osxuniversal.zip",
        sha256 = "1e1d1ddcdcaea248de728393d3b6a64655a84a7083a1d7d5e40b6b60d44fa33b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/OutlineViewer/2027.0.0-alpha-6/OutlineViewer-2027.0.0-alpha-6-windowsx86-64.zip",
        sha256 = "b59b427d8fb3a16cd7f7bae0d4af4c8c24b7837fc52f4c2dc056c4ee04e4f0cd",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/OutlineViewer/2027.0.0-alpha-6/OutlineViewer-2027.0.0-alpha-6-windowsarm64.zip",
        sha256 = "1633e4a1a1e90f8b2e3f660cd09306f901df0950f3681bc524431f847f624a1f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_processstarter_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/processstarter/2027.0.0-alpha-6/processstarter-2027.0.0-alpha-6-linuxarm64.zip",
        sha256 = "03d4731fc27f4d67e56ec37dd60418a504f69a092a5ba5dfd231bfed91a47211",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_processstarter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/processstarter/2027.0.0-alpha-6/processstarter-2027.0.0-alpha-6-linuxx86-64.zip",
        sha256 = "4eb93f8fe03e6cafece44b6ed2855efb789322aceca2a9275e08da8779243520",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_processstarter_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/processstarter/2027.0.0-alpha-6/processstarter-2027.0.0-alpha-6-osxuniversal.zip",
        sha256 = "6c7dbe853055dd3abf0be81e1bf00a1e68f0c120eae1d4ecc684c2a68fad7518",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_processstarter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/processstarter/2027.0.0-alpha-6/processstarter-2027.0.0-alpha-6-windowsx86-64.zip",
        sha256 = "e17255d6c2e3cc4f034396451b88ac94d38e8acf88ed2f5553641471baea9739",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_processstarter_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/processstarter/2027.0.0-alpha-6/processstarter-2027.0.0-alpha-6-windowsarm64.zip",
        sha256 = "6f9e3fe5f4983974906537f099147ef5261d94b679f2253b9da4a7d6b26b1d13",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/SysId/2027.0.0-alpha-6/SysId-2027.0.0-alpha-6-linuxx86-64.zip",
        sha256 = "b887cf8a3674ea25fed314a78517dad9d8e6f05c23d4d79e63b18f51149e1692",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/SysId/2027.0.0-alpha-6/SysId-2027.0.0-alpha-6-osxuniversal.zip",
        sha256 = "b997806061d7ff122bcf98f7dc825b0d6897971e9de014ca71f3203fd54faf1d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/SysId/2027.0.0-alpha-6/SysId-2027.0.0-alpha-6-windowsx86-64.zip",
        sha256 = "2c6a85d45b3d147ab348f2503ce6d4ff6a83325ac5b533529d3b85afb0101647",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/SysId/2027.0.0-alpha-6/SysId-2027.0.0-alpha-6-windowsarm64.zip",
        sha256 = "1730cc169ff0865a956099024701f4e2f74db21e7b798c78070f0a66634ec4aa",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_wpical_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/wpical/2027.0.0-alpha-6/wpical-2027.0.0-alpha-6-linuxarm64.zip",
        sha256 = "9ed5c92d8b2a4601a96041481b78add4a5b23045755e7068521cbafa65ece52b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_wpical_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/wpical/2027.0.0-alpha-6/wpical-2027.0.0-alpha-6-linuxx86-64.zip",
        sha256 = "5eb5af1259c771a049d250aa28e9852cb00a6486b3f3c9780a589bad2355c4c2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_wpical_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/wpical/2027.0.0-alpha-6/wpical-2027.0.0-alpha-6-osxuniversal.zip",
        sha256 = "a0fffbb8b909e820d6b495118a5f6ec1b3e1285dfbd61460a2a4a1df66183e13",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_wpical_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/wpical/2027.0.0-alpha-6/wpical-2027.0.0-alpha-6-windowsx86-64.zip",
        sha256 = "733afcc0c60f0d963cfcb701fcbafc20c22904ad4b1ec86f889c740c96ed59d2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_org_wpilib_tools_wpical_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/org/wpilib/tools/wpical/2027.0.0-alpha-6/wpical-2027.0.0-alpha-6-windowsarm64.zip",
        sha256 = "8f2202d8f20f4e844a7239645fede8bd28bea139775d02a335883a903342ffbb",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

deps = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
