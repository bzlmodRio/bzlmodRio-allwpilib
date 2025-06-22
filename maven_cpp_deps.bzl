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
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-headers.zip",
        sha256 = "3b0301f09bf9fd7bccf17ed673cee816c41c4515d8d56f4c02bc5b22712cfb5e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-sources.zip",
        sha256 = "3bb2a9f0958abea87044b4182d176aa86d0bf9ac5be0b102ff30feb9087da911",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-linuxarm32.zip",
        sha256 = "227b3eedb95f084d4f127fb97075bb75ee1883f7a674aae933d18132da94e836",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-linuxarm64.zip",
        sha256 = "d09302f0f55b6ebdc3c8cf4c0d5941b0faf026eafd91c918f3dadd017173f45c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "bcdabf7959f370e9827b5d029d46bcdac9520167cdd3fb4c2a56e08df2e970dc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-osxuniversal.zip",
        sha256 = "4819160deb6fd1db594a5ebe3f5bd0f80e63f87453209a813be98c6ed8080b51",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "b801aadd3ccc690236956aad7466eb6f5dbdb5448ac9cb22f938b619eaf605eb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-windowsarm64.zip",
        sha256 = "560f8b2bf852c24c378acce8aeb7e8593f8a8020e944e0b9cea55214a1cdf709",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "8f940c0128558a3506adcd448feb7934c59dd0a472fb928dc28d3005415fd1bb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "8db40a184d758f00b8df7d7ccef4c4423406735b7c1df8cc0c648ec604bb990d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "a478d4036e163a7647a3cb053249551e1e1435cf178658f1753713a4bb5800fb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "8c62b1fe9164938776b81b0dd604451e2a3fdedebcedbe1606d17fb38b7df61b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "75d972824b81433401438182e0b0ffe815e3e37f52f8221c67a0add6c2a47d7e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "f0c0b9f2c113801e09913ef6a57de34b78474d440ca591ebacb9742438e95ba0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "316d9b4d9a21e0b270a7da8d23436f30c03af58721250ea56ebe0abd5e9c9706",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "e6d8b24164a0589ae2495342378c45067574efdc0935c3696469830d123001ec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "17df6bb69b966ef9a23b601a863de493bd7b77f3ca43b84b7cf62ddccfaa3fd8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "d428a64082b81a7765a41e79f46dbdfbc2e99cbbee368c8097f11739da1601cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "1701cd576026dad2fe8ab3106f1cfeb846817ddd440f819c52bc983228f1b2e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "f234c8033be9de9b9d3b8a4408247ffa16578ccc57fe605bf8153b4dcb0dde9d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "e8df49b09fcc8f8c37f6081ff34cc1f59151d402a776cf0d32ee09b06879a54f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "44867107920d35bb34b554d93e596e9575e55cbac1d591e4207d315796deb9c1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "30b4984600116b6dd2b9e8c5e61a88e25da82672c0a798001aac37502955f9c9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "79492b51e11dad89ddce684f222d6eabc92dda97dbfe21d1f2aa4e7bde98a358",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "9da2fbaf4ee4456d0b9c847b5e5ddcc0c50b8e5a2e21dca440e560ac12d2ae42",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "d566bb8ac351f7b9fe886f4fb87ac20816b03b2d1fc21e5195194a86f030e0a6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-linuxsystemcore.zip",
        sha256 = "266e18c419e5b459685253487ead79311d7d3c60d868ee01cef28eb61e4a79da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-linuxsystemcorestatic.zip",
        sha256 = "5e12a6fa94f891b03f2c7d0bba6bb72ec71ef2fa14cfe0ba6a6fba54d431891c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-linuxsystemcoredebug.zip",
        sha256 = "02c872f13c8d87e13ada01ffbe1190088241b8dbda057e3a159c0e1a256b7125",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2027.0.0-alpha-1/wpiutil-cpp-2027.0.0-alpha-1-linuxsystemcorestaticdebug.zip",
        sha256 = "c88a87e361d1c48af91e16f0f297d7835d7e5bb9cb54d19651693b445ea068dd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-headers.zip",
        sha256 = "215d55fae5720f74b94597d7a7966854fcfdd18c4ffd018ba1466e9e192db7a2",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-sources.zip",
        sha256 = "3683a0b586e71c332f64574abcfb1e680977eceefe9149a260cfe59791170b37",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-linuxarm32.zip",
        sha256 = "a61fe731256e356b3cf464f561c7938590ac716d137608d3b78112fa3a97ed8c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-linuxarm64.zip",
        sha256 = "5e852cb70c1616af2a2131d145f012703275b75867c8d60ccd0ff58277aadbdf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "b1753d9a53e75384e6da9eb0823d63a4fc6b1240e580b56dc597a6067f93585f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-osxuniversal.zip",
        sha256 = "2df448c27a4e8bdd2da360a788ed5d006cc612487285f25592909d4d51113622",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libdatalog.dylib osx/universal/shared/libdatalog.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libdatalog.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "eef142b3d20f71e4be62d10e1b16878aaef96e931f4f2b32a1c428db91c205e2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-windowsarm64.zip",
        sha256 = "9ef90023bfc27492171ca37d75590df413784f3bf5a3d3f56a28e18333eb6d6b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "cc92f8053b57fee61c77994e4113c95cc89ced1b37abce3d4e4d7125bdfcedda",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "edc75180ed7c34bccebf4bd64c2f7bf7599b653a26ed4b1d03fe0d19f982b5c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "60f72db7cb3804445fcb223db24bb2d6ff7e236567d0d6a48c821257b8041ca7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "73f23399fa4b32f2db0a4a871ce1b644b439b4ea9afe98e94f9209a146888941",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "3ea3a41183b2438ccc3b26ad6c86569e594e7f2daf9eedd03c5dc9f08a1358d8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "d6843c7c4dc55ed5ee31cbe2d8a99428c94d29a5ace460277901d2535068cda9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "cba077d96499076a72bc9477ef3cdf6ec119e702185ef9f81451ef5c071e3c9c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "d054a2360d4e5922773161f1945641a6ec4c9c86b4a6e0ee9a84464bb5326c53",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "6e1ea1dfc383695abebf288f5170d1bb04d950e0ab14685938222f7396c2e6da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "23dbe3e83d172f8bd381eb4d9a0666c2cb445cc9aaa87686b2a28bb43a62deb3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libdatalog.dylib osx/universal/shared/libdatalog.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libdatalog.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "e216d02d54d005443d6732ae445adcf6720fb70eda96f9d47272ca7eec22e780",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "d5e4c35c5237acb6e4924655338342d61141b637634d63eca9539ac56c4ee2a5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "bc55a7aafbd1efbff2187addc100ff9cf02472303ff2e54be9f61302de9df443",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "ffea34369db5cbead326dcf746bdcf8e756c518c818a34f12d1a3e188ac90e75",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "7cfba612c60265127c593aff43325787470104d518ffd4ef0df3362f64d7185d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "ccdbf5cab5f3110d7f4e4e260a981c6c4e9efa01e757f2004015f52dfd5247ec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "4e44393afac33202a18c7d72be486345dad41d14f425eb9cc542a3215818fe8e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "624163e15b7378bbd85624e88c984c8fed7cc28c8b38b4cf102235afcca6f7b6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-linuxsystemcore.zip",
        sha256 = "1d0a8fc23fca73d44efbbd45f2438b8509bc2b9f4afc6359d11f7ab2e3bfc9b2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-linuxsystemcorestatic.zip",
        sha256 = "887163ad80342bda5541934675e09310763b56bd67f4db511bb59747a9df74f2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-linuxsystemcoredebug.zip",
        sha256 = "cd09a0b30bc69d77292b93657114d7893fbfe0d2e10b6c3d75115949a8bb6e0d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/datalog/datalog-cpp/2027.0.0-alpha-1/datalog-cpp-2027.0.0-alpha-1-linuxsystemcorestaticdebug.zip",
        sha256 = "c764c28f5dcfb94c7f0c7103cd5b3410c088a02225e5bf3f6b07b1ac3d3629ba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-headers.zip",
        sha256 = "1c8f8b16bc75d4685075a6793e11582263a8f7add770a4bdcd791ceafde2b23f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-sources.zip",
        sha256 = "c45d3e92c0584a4e63573fde3c9a72d3deb13aae85ccd949fcc78d53df426217",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-linuxarm32.zip",
        sha256 = "0da3d72eacacb9dca69ae073f73b0e8a664b10ba764ad5cead8ad5f8aa9e6ee2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-linuxarm64.zip",
        sha256 = "a393455c5c80031c46c99c310a8332344e78d9d6698edc8ad19a0f0fa027a24c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "6f65985ae74942375be9c5f3bc510245ef3016c5ec8a14b1560af026ed6939d9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-osxuniversal.zip",
        sha256 = "fa124ec49f1bb1820940d12db16937cc96ce42c6cf34eecd6ff40e4062004d8e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "37d6a185e1da7a100f7db954f830687286f0ba4fd851f5799047ee537402e419",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-windowsarm64.zip",
        sha256 = "0855de7dd574d6b08b82da08595283c3232d8b3bfe6a2ceb6932f88f24eb501f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "726155f05953a4a97f0b0ca76ff86cb4c7ff2e166425255276561fffc16f1144",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "34d22ecd50b2d0109fb0506e56e5cb37146404d02c5e58e209d429ca02db489b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "12990b9e7bff22bacc8c04ed63a49658c40d3f53ced1beb6fd33000d390bcd2e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "e7ae5312aa2d5e5f41485a40bd2dd40e13af109fa1a4ff8ca4fa5b8005dc8530",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "4efdd8030d3b50b9f944a0e0584cea451d4297be72425d95ce70792c1ea4fda0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "e8e9cf54f4db91cc506f5ab4f52d1e7187fa3e31ba249f11d014812c48cb8ca2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "1af0f6f8339c888d19ff9e390c60978a50f29bd162581bfe3e59999d363747ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "3e3a698753d257f72eb46f3691d68867db10d62a183fa020c0a094c462636522",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "27d057343a0f54d3f3a875fdd69ceae3a3c4e6ff04f407da746060592de93ec9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "c9a021bd111487e160a629cc83ce349e8174f018c6ba0c62f33f7edcce2377a7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "889d84ae16ab9d681eff24898ed62f383c77337aa0181888879852ccbbb549c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "6bcf45f9d86a9b82da6daf1a675d340fc55e2e2a24ab375ef482c3e845898b67",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "3c7de1eb5a30970d02826996c392befaa3c793df44d7e91ec4be2f52d6311914",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "0fd13814184a391f743be6ba769aad3bf7b66b41e2f9707aed39f70d5ba5df68",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "1d65542b7c7de0ed788a4a5304412bb9eedcd13d6cfe49a03fded50cb746ef99",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "369143ec019289f57f8dfdb18c6ae9ee5435d081c528bc777a07f96d0ebb0c70",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "1b2061857e23423d5f590267ebf43a2a232f81926b9dac831a01da2e77bf3fa4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "1d1fe1177c32c04828559a1a4ffd9b7b7a115aab0940391d7a073ebd4d842709",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-linuxsystemcore.zip",
        sha256 = "78782a00dbda4b9b02bb0f9ad3bd7d014027d0d52bc1065a6b5b88429504a049",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-linuxsystemcorestatic.zip",
        sha256 = "44b8f868c22a8abaa43d7ac60ef36e12ef527885c11c021914efc623f3c57d9d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-linuxsystemcoredebug.zip",
        sha256 = "814fe85be7fe07e241b5ec0d8bc416ed71d9ef2bbb050109718f4c25c3e9f18c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpinet/wpinet-cpp/2027.0.0-alpha-1/wpinet-cpp-2027.0.0-alpha-1-linuxsystemcorestaticdebug.zip",
        sha256 = "e42be7053cf738b7fb1e99c70c23942ffb501e4f1b9dfb25f86514084c00e118",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-headers.zip",
        sha256 = "6f1b72abeca050c4a0ff1615774692bdc320836a8b90715344d0dac3a9da42b4",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-sources.zip",
        sha256 = "2d35bed53b106a49f2988eaaa85d2978d8a1aa8e43d5927130768096785df4ea",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-linuxarm32.zip",
        sha256 = "fe4024431871bf53ea8339abbb9075bb2f4f6f866ee90023cb6337e210e10834",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-linuxarm64.zip",
        sha256 = "9d983762f5659dca738e28cc66d7c21f1d427f43395b154e5e29d90fdd298277",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "86bbb749a2ecd87c101fa262a4ece43fa378a0f768986fb3892233e53f59b742",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-osxuniversal.zip",
        sha256 = "fcc1b4c54321b0c5b92959354530f1b37cde78f2e01a5e04e7d6b0e1ad74ce40",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "6e4aea2b13acdcc2f16d47cc4dee0f9b27c7bf926042da298ad99a80fa5c2f35",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-windowsarm64.zip",
        sha256 = "8ba5e4703222d8da561777c3317158cf5bd0b10aba33dfea6d7db08f166be041",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "59242d07612cd20b9f6ab381c4a5b06c7030f0465be8eb3e56108250e886392a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "ab4d7b9490eeaeb7e2099225f52354815730a700d755016cfa0815d27a91ad77",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "a1bf163a393a4b6b9e5ab1bca8338601d64b4faf566d9b3a15875ef57cc68e1e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "84486a315da05b248f5582b219ca37a019c7386ac609693ad86b9f13f32c5c38",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "f6a4e40d42675323c816920018fb7c818c9a473bf9aab59273f852a3c47f2ac4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "ba2ebf05c8200060ecbca91435cade39d5800338b6a5342af32fdba3d1be618c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "0031d58ac3a933c8f0ef129082f91334a64daf9f1d901f85890a20d76fd1ef66",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "8495900176fe48c9c4e5831f991ffe542478a92f3f493e7f24c466d6bb8b2125",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "b166d1ccac88188d0b57e3da6fb9caeb90e060ebb99a42074770a7306258ac22",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "725acf458d4fed02fd07c3bbf5c156b42c0e1ed5ef21785954b37ea39d5e71d6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "f6bfbd34b497854ceed02ff29d99244f2855f3e16d6067f4fe74eadc40884ced",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "5be7a9e0b01bc2e494d30d25621acd35d06f8848077100d6f6b230b033f1832e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "c7e5e7176fc5c73db0394389f925591757467408adb7529b91df53f8bf740894",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "b72d2135658daa75250d4288201bf5695c32a52b5718c4cd16c5d65359abca09",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "5c55807101894df3ccea952b6ac8c5eac1ab41ed7d1696faf602e3cedd928c29",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "e473b8a3db2dfa2397acd7ddaf8d00b9c37619524865e921ba0357f4d69eee17",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "a3440b37b94acea67e86c35afbe23db57b033637bea5a5f0aeb5cceec85f1d7a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "8b78373d4c1f6100d68b9ce602231a1fa25e49ef5665327d107631f12c3aadb4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-linuxsystemcore.zip",
        sha256 = "d49bfeaf55824a0c5448cc17fce0479af4b0b107dcc35cef21c605e0b0844228",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-linuxsystemcorestatic.zip",
        sha256 = "b9ed7058fbe7aff76cb038cb62775e2c1a9f040704502131eaaadf9de1bccbaa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-linuxsystemcoredebug.zip",
        sha256 = "e37608f4aed27beec31a6bf422c798f14536ef9f1ccb10d795c187a5c8ce9551",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpimath/wpimath-cpp/2027.0.0-alpha-1/wpimath-cpp-2027.0.0-alpha-1-linuxsystemcorestaticdebug.zip",
        sha256 = "1a654b45c224d1fb64022433f0b93616c867dd6b7b1ff5a649d9153edc8967bb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-headers.zip",
        sha256 = "683789dec491399f5d32a2d3e6c7b121cbb3ad0556b62bea959666761006ddc3",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-sources.zip",
        sha256 = "91eb4b52955703614e1f85532c374623d3160b893c65a98e1a901a6ca45461d7",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-linuxarm32.zip",
        sha256 = "2fbf85933fb5be9cc3787458e4f556ee7a2c716b01ad781f78fa17dae5d3384f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-linuxarm64.zip",
        sha256 = "40c4a848fcd57280a51aa599c1f1aa6dc22704eaf04c2450dd5db3d7b3fba328",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "ddf201ff8a7547abcb90a04bbf0f182ca4891309d2c47f80fa919f57e97825d9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-osxuniversal.zip",
        sha256 = "18c218240f14a08af0cf5d0a2750d364e59b164d7f7d900f6595b1b74edffc84",
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
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "c0bc83f1cd03ea9bca77c22eeff0b5b08642b1099f023f5a32e1cd65383cec16",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-windowsarm64.zip",
        sha256 = "34fa67ea8695734d203b6c741a23d14a0fdd0969d040140711e834388f6e0bfa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "754b5a3b4e4e66e2c3294412c2416c8854ad48cbf406913b46b4082191a364e7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "62c10ec037ed3afb75219b81cf338e0bb348905110fd98f87daf7b07f32f68fe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "88a0decf750e152ba89534c0f7f18285b79f5762b45b47c2a09b9f07d170c175",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "4aa37114a28246adce31d55b4db31a584563d8aa3acffab6c4ae07fedc4d75f2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "5041feb105a275fdd697a8a49fc5fbf642a94649081126de59ebdc963271869f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "d4aaef46e7ab29f55ef100fcf0c53cbac357e09efebab15acb9e4b43f52ebf66",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "9ce6121737e1f63e159d1d1abda6803ea31fe2310fc495c39c98c7f846df56fa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "af1746ab718ffd3b245289098bce2d58309a4012d9be7b739d7b8581a0741f5c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "039b522e53420c4d53cd0e8430c381aa1285f267c4d5d860a4cb8bd9a2cc9265",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "74ad3df0dc2871fd29cdaa556766ac2d2a365892a1e6dfae03ab170cad87b2db",
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
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "db328d10b8a58c2643125154c77d5fba906ac1e54d5e078e485a2edfd0f0a7c2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "f13bd570f903e8598fd0e5b008bee61d5ccd921ae1bf622e047518f33f18cd3f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "0095c9837a6fbe52bcd70da48509e83b4437b0447c9ed985c2902166abe348ab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "ac6ea09cefef67e2359bcf6c93d445e50e0d1ac4ad787c845983bb998bddc599",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "62ac6554bca2d385fa9e505b027a38ad512ab81e00dc3fb94386f7a28f0ebb0e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "6b67bc41ac6d2f6f6cb22027c33d398e3525d69123904a5fb7dadd5419cd036d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "c16c48dd1745388c4604e5c95b88bed3a2dc899410f87a745a4c06115d4f3bcf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "7a9742d7d3c08e3037ec0e49989458bb3f14655da9f2b4c31db2eaee532130b6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-linuxsystemcore.zip",
        sha256 = "b836f6946ffef2f42caa77c15ece6c98a05e517c264c705ac4a409fec9a6bc6b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-linuxsystemcorestatic.zip",
        sha256 = "396b0ae27a0f78b1fb2504b0b84904bd1df7ac3e9982e82db7f3ae1d76b65666",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-linuxsystemcoredebug.zip",
        sha256 = "ca67c5688126240b9973512d469418f05ffc4e4dd42aaddafb3abe127af6a9cc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/apriltag/apriltag-cpp/2027.0.0-alpha-1/apriltag-cpp-2027.0.0-alpha-1-linuxsystemcorestaticdebug.zip",
        sha256 = "5145276a4763cba4b20daeff5bac70ce97ad97ada63c50a2a52908441397e87d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-headers.zip",
        sha256 = "5c0d421bccb58d3102787546ecb50b6e920dbf1e48490743ec0ed5ec3eb378d3",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-sources.zip",
        sha256 = "ad21ada789cae0c9724e567e1dee950ca60179a23dc87721a16a5a2620be0b32",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-linuxarm32.zip",
        sha256 = "0a37e2f8146dcb65ee1e46652024c7309ae4e2490752f8338b42ad6504951706",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-linuxarm64.zip",
        sha256 = "e063b499ad64c79ea7cfd9afcf96c28962d33f76be8235c2c51bc9e7b3971f07",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "927db410b741d462b4884ebd60d4ec23a5c1e7eec7808b1490821bcbd160a73b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-osxuniversal.zip",
        sha256 = "97d8ab61fc8d19e4300cacc511c775548b0ae79eae9d541c5a9c35efc5a3ff2c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "77f7008d969b13ab522984476c4408e7e5f9e0877534a2c3ae960780b859c4f9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-windowsarm64.zip",
        sha256 = "15d1438d2613f64ff514bffee737ccbe3dcb96857a87e2bd3b3b9ee6beed2781",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "f0d321cc0e3e7f00b37ba69a0e78631cdda9258572efbf46b425bc922643e9fc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "b80090c7e874f9654e975ce481a2c75c68e8ea04786fef1419e8fa0b1a7f83bc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "1704571eb13dd470d61c35ae89d7a9d93aa9051c94a70a1a457590269c0a536f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "3d1cd50021fefbfe0f836d1b8316e6a8fafcbe3551537a5515d1c3d6c9529bf5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "b76390df5b01e1d313b10f65fc560739b3dfff94dd31be65a53e3c6392de4c2e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "5f03c046f51fbaba730bc8be1c591dccbfab497799623f44bc9955b49a58ac1e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "7452959d9fdded313705528bff0794cd9839fed7801da3e6b7068cccb731d1a1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "190d91d87be251c0e47a833daa83f47a3b2c3f5720abaf2a97611902112b86ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "d098cebc1f9bc86418b5d846d1609672f211714bf2a1bdb5e3c1589865f1c7c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "3a9f99d6734a124f2abceb74dbb0e370e95a0786d6adafa1f2b1a0c7e439ec3b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "becec6b8609211c0da52d7752370b127bf3220014984e707134834b5bef4b414",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "8a2a4dbcadfcc0e111054021e9c549a1e607d1ed93a1072e509c4f7e2adbb01d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "38b88a6ff5ded8ed07d8a754e39c9fdc75558b7a3f0b21537ea05311d5c7d18d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "9a5e43c5c985bc27ca2c790cf0ff96d276550dd8c9817bb9ce55f88c002863d2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "4d925f2c577a3f61ee051d772a9a88af6d42fed529b0215b12715fee37b2f64a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "b853807c9a49904518bc9473481ddf8ada497f2aaee627c24c6288cb75c30dc4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "b8a72c4a407ba54655922357e9f1fa9fc56e8819074f79e594cfa9ae37cbcd26",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "4a23b45d17819a0340999f13ba5afe0426279eff24fd85e369c9c2543e51cca6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-linuxsystemcore.zip",
        sha256 = "4700837861b3f6516384fb6c866ad94792f51fd123e8c89d223844c291147f9d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-linuxsystemcorestatic.zip",
        sha256 = "30b479fdd19155c2925f6e7937dfc9d2666ce3878e99ff1dc0c1067098539cfc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-linuxsystemcoredebug.zip",
        sha256 = "5a3a457f46ae06b0934b70950f7b3a00fab3e1f185ac452173176be479e81a9d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/hal/hal-cpp/2027.0.0-alpha-1/hal-cpp-2027.0.0-alpha-1-linuxsystemcorestaticdebug.zip",
        sha256 = "e6558294898db8b06eae751ba69e59ac8364af49c956750bc92a319052574b24",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-headers.zip",
        sha256 = "2d8a997626f0f96472acecd2d1eff1fdc4b0d61968ab0dd70e9bc50e3f98122c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-sources.zip",
        sha256 = "16be902876dedc8887f8593a549c46af44984101f5f5b3d8269ca0ead683c7df",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-linuxarm32.zip",
        sha256 = "497733b902829d65871378b249b87f5da44f4ab53c7b254ee57f07ce85f8ffb9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-linuxarm64.zip",
        sha256 = "45f3cb52931bcea8a838004d0b8e4b8f744cb8fc34670e93fafa17234293f390",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "67fe9aed81291925410e52208f32a364df9d6273271b412d655e989975d24348",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-osxuniversal.zip",
        sha256 = "6103987b5489d4482140ce36f216128b151184e1738fb2145fc781b0a866b76c",
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
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "a74cec6b648e14bdf4da32db9d9b74d9a0c7ad4400be675e9c8012a0c8a36c9b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-windowsarm64.zip",
        sha256 = "de16257ab9642077fc0c37efb0f5960a906f054e1e59c695c1da9c70a4e73ff3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "687142be2b69da9e230453ed09870f38649e27c6f99f0094f8afe8f0518b55dd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "7bf88b09568ec24149e1e264cc4052c1b1dbf958fe51711d95901f64490321e7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "3e935f10245c1c25952be621ec0e015332859704ed15715412785401d4d01afb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "1ce89fe9b0b2b1af74972754f734550ed823b72bc810f5ff950c035043725de2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "f510dbccf3f88b2a948162c158f34ebc145a517390780cd22c1ee5887749f2e2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "fbb8a34aac75c54102534bf9758051e04b0f8bd434035643331ecd0b2efa49e0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "7ec82216394bef8906ca426e550bc443ae99fcd92aefe14277d91a23e1e832f6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "b502a74461e6371b181691e042eaadc6780356ddabfa438de1905cb6ad40bd77",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "5447f8816d734481dd3c2a10ec4e26ef2e0f0e136ea8ee57c1129d73dbddbbc7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "b3e2f4dc8f97c1ca1280b7d912848bdb00b3d81f364b9d6f43ac7322a838c6a9",
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
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "f71e19be49080cbb34144e1309888751f7e2fdb1fdbb2a0668f649c88831302a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "b75f2397a0047bf558f6477484618ad71052f5679ec27ad7dd724734fdb7fcfa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "18232eb966d967da03f71df35ce4a2a5c8ed432785cc3325fe2b8ec1fe1088be",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "279b936758630fe993975789f4df6e51cacfb3e487f81c9271830f290ced94e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "aeec0543694e0b6dca35dc101b78683f5e31e6a165ff67b0aed13f6cd784b5ef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "9487efe75a77a0015952083911c81f98b80a834aa5adc1caf3510c8ad17ea895",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "8c98a23832af576d1ebaaec4d56b321f3a4b399fa60ee5c0b5c2e11d1482870a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "8fcc140a27a0e5309c50c75b4b57cf81f8fe2e4953df4148f59164a35d3977cc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-linuxsystemcore.zip",
        sha256 = "a252aa0ef702cb8ceec183085eee122a423c70a8499da966f5fda7a6df74f534",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-linuxsystemcorestatic.zip",
        sha256 = "279e7bf799f0d71e74fc774281cdcc6cd61be95be79762ec0bc3ae976719e740",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-linuxsystemcoredebug.zip",
        sha256 = "b4daad0d2b7c37bece211b2c25ea56f8f34b26bef554bfe76eea53f5fde14133",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/ntcore/ntcore-cpp/2027.0.0-alpha-1/ntcore-cpp-2027.0.0-alpha-1-linuxsystemcorestaticdebug.zip",
        sha256 = "45a9c3077f7d9e4f6a1ee17a0b3a2a836d2ff22ae79c78625fbe4cdac89389ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-headers.zip",
        sha256 = "e49f6d4ca9a0a981a8b8e2ff0bb0afeec5c3a0b642ffbddd59766c69c5aa6e8e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-sources.zip",
        sha256 = "5380de1aae63d28b88e240f8035c26db5a8a27b58a718a343d779c6abc7e6162",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-linuxarm32.zip",
        sha256 = "8ff39ad7076d91542a0fff7078567c58461e30deb1c5444b407ecd859fed73d7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-linuxarm64.zip",
        sha256 = "f337dc23716252f50c7cc316d615bbd0ff41e19730514e7f8bedcd973df12912",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "92ac49d477938ab13e283b3190f2507f696ff73abb596be4148699e5cf5b537a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-osxuniversal.zip",
        sha256 = "86b13745963856d8769a4a4bdcd5b94cee1cf475996ca71cb94dcf8630b86b67",
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
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "f98c1695d78ad82c0a4128fcdd903084a80fd5e45de2fab703ebf74d63fd4d85",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-windowsarm64.zip",
        sha256 = "578d305a87acca4294cf15b2b62009a56465a0ffbe2dd4d7857573cb3bfef177",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "19eb431b0ba726d1cf9a4999bfb5ed1e02a726868e22b7800bc0785e90ff8344",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "1def0acc614af7f46115cae1c9548949bb0950450577db8abe90b72adcc4b6e7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "39581eee9b5e5486dcd33d1e252f63a7202bef4fb833efa4be5e816825b69084",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "06060a823b9f797b4c045d56dc21a470f4978ca09c9435bfd59ca619a9975a1a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "331786b49cf803ac05afd398319d9849948c3626e25eb1b798b91b97382f1a69",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "18d17fbf2de46a4cafe1d0ddb25a445518eeabd4b4d310f68ba55aee7301bd6b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "32b2f06c08c300b774f7e63628122c51f6d2f0abac826dc9bc7344b70f792afc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "bcbfd6d8b061193f3222732af20f70f53ec194d5f90ac6b78326fa4e5aed5cbc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "88cb157eafc487411fb62cea501caa9c5bf4609527e0d077612c5c512b54ec6f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "19d205bc658dd6ed90b30fc06969028d16fa6fc5f4a238d5d04cdb23a8afc3e6",
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
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "0b730ac48e992a9196a1a5f51e30c2f7a5930150c33f8926254325610f3405c4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "0ad9288f6e1cdb6563918ea00785eacb2183aad1e9d8ec00ee91fed21851369b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "e7008a1947b27ce0daaeb6b8ccd4361e169bd730ff6db8f38c8e10ba316c3f7f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "09ec85458d05133fdf17b7ad49feed35353262c014743939c03421c8cedfdb34",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "63b5645a6e62fb5e0ac4f50bf71d4affacbdae972b804e2dd2358125cacda47d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "88c372d81c66959734ff09cbd365397294e708f779c7bf97d6a960625971a76e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "b56c8629efb07896a304c31d35ab1b3cebddc5a4d7c9aeab7a435e43778f139b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "166b2031e083df6262d1fbc34cca2df27a83aa1565224d252d253e16e6e43b7e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-linuxsystemcore.zip",
        sha256 = "d34737fb4ad824766f11435234fdf0579a096d19421b18a10b3964e0a3cea5f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-linuxsystemcorestatic.zip",
        sha256 = "3c920801e75b105c9520235217a4d98ddac601a5c82abca689580f60c49878a3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-linuxsystemcoredebug.zip",
        sha256 = "a61f6190395b91b1b001a47bc815bca60f142647426c6c3ed74ae584923b2d54",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cscore/cscore-cpp/2027.0.0-alpha-1/cscore-cpp-2027.0.0-alpha-1-linuxsystemcorestaticdebug.zip",
        sha256 = "da0b857cf8a83343cefc719bcd318097a0aa2c306ca448aa1f5b07e94e0bfec1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-headers.zip",
        sha256 = "c219179d33a02eaa26f934d6fd2382c8f807b9fddfde04bf2ed0ba6c784d00e5",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-sources.zip",
        sha256 = "4fbb0c28dc920de7243e7b5fc0e1b4997c2c0125c5d4185e37ba29750e260973",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-linuxarm32.zip",
        sha256 = "32c4e7e6521f2a02b1f999f212969b8bd7c9bff5f6c14a4359c03ece1409af5e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-linuxarm64.zip",
        sha256 = "670b7fc8a9e72cafe65f94ef8c94602250cec18f45d7be77385d16f1abe62c7f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "615668342a005c80e249956a4db086739910cb18874c3aee6839cf55a30589a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-osxuniversal.zip",
        sha256 = "a9f3163406987fd656320c2c44de8ed47a0bbd1ced53788cb017b4c8801fdf1b",
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
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "a226d49d2b2afa2c423ec77c0cde499daeea5e09df26f2a4b05d2a4da35a6875",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-windowsarm64.zip",
        sha256 = "8f033f1dea390efe28f257c9355ef70b2871439e13c2a13f472bc0dabc28cc8c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "7deb8dd0d1cdd9fc87cb0998325e7cc6e3bddea28b5e22551825b69146f99dfd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "e50b13db395f9487de295be810e33c9eab6ea334bb345d13204d4dbd661cbdea",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "4a2d7897aa449ba697d0f4062c352427732f501c17597592e07dfdcb77de1f2d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "ffe77ac867dc0eef96bcfe40a6abf79e9a0df6c232acb4ed782996c67304b1c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "2aa1c6f5a12439edd6eac789e147eabd0d14045ff2c505a625ae1b6f44651245",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "74846dba407a6104ae770fcb84a7a60d96fb0d4df8d46b4a1e9ebfa2187ce9e5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "4e5d51f16c898cb9b9f7e1e79606618586c0258b1d0f05b518d2331f4139e23e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "d339217d80d1235b0191b1f26c979afdf2ec54a6df0a6ff57a10581af397879c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "aa770c406552ed5e2c33a994a57ec400c5767f04120e7fdbf358652506aca598",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "db92233d96b4291cbd6beadc8ee3f578b385729daf5a74f6494a8c7bbdc9da90",
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
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "7cb6caa78b18c5336da65516ce19d4e9dc76e64dc41950a7722a66559c8da962",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "552bea1e1aca14490263e964bfd6fc59a4dee28e3de98e8c2fa1b55acb7ab889",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "38d7e2a35b689225ab636508e32e03c291e9f688ee2d4ebd36f4ccb91170afa1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "dec9b065e89ab904a1404e4939e037e0766f93fc08a7212e9142d84f5faf7700",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "484a948fe84b57c631dd22d2cbd09d9af817e48fc66f49c9cf2501c2ad068450",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "358a52136ec0f9d814a2edee65b399b1a8280624a32ddaf1969ff121dda29dc2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "0b3f2ef585dccc810aa0b54a45a558ea8e0f6c34a579b478831013510ec4d0f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "cb56645217c810b9fcd89c8ec0fe1c5c73b750333966565e9d8b6f5aeb45c7b9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-linuxsystemcore.zip",
        sha256 = "932aef41d8e9c189ea2b273f362f633fcf67126e3eab692620c9f9cf97bd240a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-linuxsystemcorestatic.zip",
        sha256 = "c7ae520208cbce51f49a177db11d9e245043291a03af42bcd2f31134f639efdd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-linuxsystemcoredebug.zip",
        sha256 = "103ecd22de17a0c51e9744015af8ca3e1e4198bef77de3998552972190048053",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2027.0.0-alpha-1/cameraserver-cpp-2027.0.0-alpha-1-linuxsystemcorestaticdebug.zip",
        sha256 = "2b9c2bfc4d48d277f19ec59529f8ab0103e7e2c3d5342f09126dbed49460a8a6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-headers.zip",
        sha256 = "30a5b6ac20644b39e960f47c5f4ff050ca322114ab0738c95b609fbe4ee49f36",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-sources.zip",
        sha256 = "d0f38d67efcda4501d4afd6ea9b7137c6490acaa0dd3154dcf593f7fe0cdc750",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-linuxarm32.zip",
        sha256 = "a2c23d1b2a988525374c432049324dfdd81e842d730d1369b989d99972ae9f76",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-linuxarm64.zip",
        sha256 = "b9f014d1dd3cd01702a561a5b6fab4bd55f333067f51450ddf7135fab1e8ea5c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "804d22b18c329a93f5dad40c62860c5a5173ca6e1aa376a4950cbcb6f592e5be",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-osxuniversal.zip",
        sha256 = "158a2674c6586a7088fba8918abd3794bf866deec8729a47beef471ead9810e8",
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
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "5fb0ed286cabb504bd65d71ba3d61a282ce52e7bc77f9e4f5f8591a41e14be9a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-windowsarm64.zip",
        sha256 = "5c6848e22c2c4669c8cb182ea9dc63ad8d981d852d4675b082b6ad6fd4ad393c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "3dab2f8ee1b7aba983b6d3535e331d91e7612e807faff4bb1f244b234ba80832",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "2147457f01b0dd3324abed8127a0f6b24115df382ec30c46e44d69390a175b98",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "f5b5ae68b9f66e9f6f6a43b7037c1944f08fe75c9f11e74f6b7999a235d862c2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "f2928d88cb29a120244652a3e956aaf88e0ef70e71191e000e82bd81e0670313",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "8d1779140365d1abe7c1ccf8c84bcd7a6820eaebb8f281c66fd79af9b2dde28a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "54fcc34a67db0f3e2096eda7ea25cbf190c99d962eb2c7625616b374b62e5f6f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "2412c729a03dda58f7a1812557de57e2516760733afa59a04d69d9570b2c48b7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "50066691314b0f3f8dea1961aa13f89fb0cc75d8ba8a34b1c2c2a613d6e2c407",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "bdd6f1ffda6ff8e7fd36043dc3a4d292a7527d36880c3793a5d0408ff57ea2fc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "32e4bed69cc30f9379e2c9416dd06823ca06ee4679d443268f796b309edc3af9",
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
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "81c9c68670162a4fae811bda616cb484677be8531171174c9d938eadad2a3035",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "7687528fbecce3c2f05e868fde8b8172f6755aaf716252a7d39e1c1aa6888325",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "57a8df2fa017a104172bb07e11057622fb9ed62e673ca2e5a38cb7cef6ddbc52",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "e517ac1cbe50a58789c1195f5cb9e12b974f0016f7997a73639d198e6ca615f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "3cf4b94d2acc3a5a1eaabd28e74a44d99cfbccbdb534d1b67113373abb0becc8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "d96e47f568271fe38064672261faf45530c3fb1ca4973493d068bb58ec01bf64",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "ca82b4b01545ba13c7b4a2af8520bfdd2dc5722b1565761939363ca56ed2dc04",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "3bd876d7d73fac52843e18612686be1d10d6349514b45b17ece3c43d0d931250",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-linuxsystemcore.zip",
        sha256 = "137cd88b55c6edb276ebafa31ccf63dd127214dd6be754228a59578479f7c1db",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-linuxsystemcorestatic.zip",
        sha256 = "9f07930ff29aa568cba614292250cea1c28ba94f12b40c109bac1515fa681f92",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-linuxsystemcoredebug.zip",
        sha256 = "243f84a0f4862b0fd9e2ef5c1d52ee1abe0301d2ae165d78ab35d2c553989403",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2027.0.0-alpha-1/wpilibc-cpp-2027.0.0-alpha-1-linuxsystemcorestaticdebug.zip",
        sha256 = "d16298c5ea8f58295675d9532a33dc78e5cb72f8fb762b8632d58a0089dacb7e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-headers.zip",
        sha256 = "40efcb7d4ef7869d0ff5d30d9b8625474a24c9e22f11e757b61226b94e3e4012",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-sources.zip",
        sha256 = "59f10108292e45784cf2a40a40f12033391c38ae8bbfbb4451641df58f79dafc",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-linuxarm32.zip",
        sha256 = "3a1357fe24a322deff86786b7d7c96bc776e12befbd1ecb6b9fc16ec15781c45",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-linuxarm64.zip",
        sha256 = "4cee9067db0a964058fe9eacef97c206d9f8f49842a76bc53eeeddc8ff419a3b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "860accff2a505778aadeba52129585439b97ed54fba0324d364965301f709bcb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-osxuniversal.zip",
        sha256 = "31f8a87ab7a556aa2aaf8a9b46b872f6827a607c72a9accd53502072d61134a2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpilibNewCommands.dylib osx/universal/shared/libwpilibNewCommands.dylib",
            "install_name_tool -change libcameraserver.dylib @rpath/libcameraserver.dylib osx/universal/shared/libwpilibNewCommands.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libwpilibNewCommands.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libwpilibNewCommands.dylib",
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
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "1a1cd01ad4e89ee250be4536d4fc838d2ab68a11570326bc8b7b45f027b97a8c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-windowsarm64.zip",
        sha256 = "17bc8900cd08d87a4183d1649fa15fa20f4055f2f92ba0460f2d7039b62fcb91",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "7bba616e31d9f86d23ac897f6f542142366144b27c9e55d52f19ce3354eb4083",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "99aae98d0424f9a3b06b31b2b113e32f2771b9894ad1477df4fa350462037b1e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "451a7017628aa30d880e50c9f2dd89a97342a011c16d0fa144437497da0eb641",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "8f6cf8e0d47f1196d568be5596561f9fc35dc5da86e005a8022717d6af9bfdde",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "f0835ede49a96945cbaafafcb9ff500d242b6d06d39491a59ef950bdae3f7d73",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "f41773e0d81fac0e48eff36b8c7556380bd0f08484de2d7e4b18550f7bdc0b3d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "10d10fd6f1570943cc747ff15976f981e0e42c560ca4e181aa2414e39074a93d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "2ec7a2c1239a2f9f6f9f1bca2487b26763e336401dce94558307d3ea75ea3b86",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "587f7c00cf9ce22f78ddc13a1aa740c24d4c80069c296141ec49c24404dc9e51",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "8831bf5c345bc432283b49b6695e9193b8dfac45735d9b5b51621b4f1347542f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpilibNewCommands.dylib osx/universal/shared/libwpilibNewCommands.dylib",
            "install_name_tool -change libcameraserver.dylib @rpath/libcameraserver.dylib osx/universal/shared/libwpilibNewCommands.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libwpilibNewCommands.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libwpilibNewCommands.dylib",
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
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "0d0f324253c3ca45667df9340746f2b79299c573699e61ca5da0fe258a82703c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "5b3bbcdfe3ceba4592184a2f82e1056f1a66f50c325481279b87a8dbd87720ad",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "bba7db795d7f09f50df273d2b57a6c3cb81e552752a8c54c1595d3f65d827e73",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "4332c05a5053462d947c64ba6743ec3b0a3aa1152fcf74947823754a452b5445",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "ed57e895597a6f39d2f678036c0e1a7ba47005b2576a3f34b56e2ca76ff62d52",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "5459b50dabacbf394f7969b21ad5f0c6a1bd80c597c7bef4da65ab2a2e9e2a4f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "54edbbb49e5609f048f2017663eaa78e43b84025d8ebb1ca7d9fb7c95a378c25",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "b8d324bd6eae92187a42f245ea5b09ac00d9e6377d6d41cfa5842f87e47f4acb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-linuxsystemcore.zip",
        sha256 = "e0e7f665e0712defc8db7fc939e824457b9926e12e5ed329d64716e35c1b9605",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-linuxsystemcorestatic.zip",
        sha256 = "82733843492737d1c97bc038ef063a49ba5d20d5300d4899030c98fb19f0d788",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-linuxsystemcoredebug.zip",
        sha256 = "725a06ccc34ea5de6b294848eee74768259701142cdc78fcfcc00116cb88df95",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2027.0.0-alpha-1/wpilibNewCommands-cpp-2027.0.0-alpha-1-linuxsystemcorestaticdebug.zip",
        sha256 = "0ff08979d22af47c20c3fb94375088dc3870d5847b5c8bbfbb781eb92807ab28",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-headers.zip",
        sha256 = "fdae9d13b4ae88b68178426be1bed5da5b1362f15b030aafb354d3f9a3c9576e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-sources.zip",
        sha256 = "d64ca47dd53dc8e93b53ad38b08ce86e02198ba3e08a2470235d14ae80b32f2c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-linuxarm32.zip",
        sha256 = "da9fb5a547c8278d900ebc81c2af006c3e52967de50deaf21e6a8be4f9f07192",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-linuxarm64.zip",
        sha256 = "9f89a9e932faf799c3c0594cdf46f882bd84001d5658ed9ad8d30a6217afb5b4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "74be94286cc848e5d2598dba62245476d5bffb28bddfe45e3744852734d41c06",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-osxuniversal.zip",
        sha256 = "ba953ee17b0f30dddb818fa6b120732804b8f3b97c8914668a24edc420b7af8f",
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
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "46f7fc7da7bf99fd16b8344904be3d361ff3c5aa3e2b8027dddcead2d62bdca9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-windowsarm64.zip",
        sha256 = "1d97b0aed51f71a0d3a8fd1d5cf6264b27679270661f71e0663e80291a1c4147",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "7ad2b8fec3009ffac7eb026a461cdc560db77bc954c962b08a2aeb5789f351dc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "5cce79fcf83bde4bae881afa244e327c0b9eef28bfae1645eb8ef1b1c39756d5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "6f44481509ff83ba802443dd09587758a38c1af2523ccda59b5cc422191306d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "f490f6d7d1c71acb8d7597019c3bc434be08d37e60d7cefdf86f63d0b1de6a7f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "e7eb35501e37ce0dc5bf3f7075c40553d0e8d6071250391e6b4ccce1617f79d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "741f57997d30dd302e051af559a92947d52335063c0ad8e0f99a78af3147ff70",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "5a2f8f33a29c293804d72194d15f43fbbfd8c76af2a78ba8ffda0c7fb9c0bf01",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "cd8e7b687f71d55ec1911f92d32fe7cc99e911ed30958265b3ea4006a6eb4895",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "e2707e2bca252fb671808c1f290771e03dc5f2453131d3c549e39ab7ccd64140",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "a599e127f7bf4390c6efcd91a8a2281611e9dc2c584521b8b7bea8c23fb35e60",
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
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "0d3c7ded212f82424af86326cf61bf44a153f0d5a5a48a9674dbb35425965855",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "e15dac6971cd71e9868dcc788e9e5000996c3ad1cd9da68d0ddd2bff3dfc91bd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "26f882bcf93352ccf9df42c2784beba226ce105c6cc631becaf5ab55fae04c15",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "6537ebef0048ff0147ae90166537d95c10177d376e8a263a338c9dea965e7b69",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "6d81264be9bb54e860bd55a4d1ab0152ce8aa1829f82e6dfa3d27a084f7468b0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "c3633f31011d09a1700c0be315030091d049ba688c730d89245e0e146f5d8509",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "d995118643c2c8bb1639f7dcd0e06a3487967060bb86bc1df5dbadbab6a4f554",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "b0617dae3cb3b77ce3a810c4ce0272b5a6ba887f84991afcfa8c44af39641b08",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-linuxsystemcore.zip",
        sha256 = "501f7abbc798efee644d7ae44b97f3a465740fc656cb7cccaca434550cb92374",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-linuxsystemcorestatic.zip",
        sha256 = "c601bc0028c1017abf6d49ff1f952016e55d7edd23cc1654081a358463c2d909",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-linuxsystemcoredebug.zip",
        sha256 = "3844134110055ac7d71cc5ef6523da125d8032abe3a54278aa1d0a3c4dbef72e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2027.0.0-alpha-1/romiVendordep-cpp-2027.0.0-alpha-1-linuxsystemcorestaticdebug.zip",
        sha256 = "a574d0add2941920ed8cb7cab6838b0812b0d8a1ae371ddfb30b1e76d612de9e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-headers.zip",
        sha256 = "b4dff209cbdf4935548489f53b55a13dcf7c856f4ec008638280cfcb0ac44083",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-sources.zip",
        sha256 = "cb77c8b2c0c7f71ef09a482f7fefcb3c9a6cee8cee2b73688dfaabf6f0b7dc7c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-linuxarm32.zip",
        sha256 = "27815283cee9403c3334cd0557ea80cd2e4e9ceca80cda7afb98af83035d2e0d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-linuxarm64.zip",
        sha256 = "5ab64956d3446b75bb7048e477c9fce4aec145bd116fcc1788d04c8d53995748",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "8e21630514526e9bebe77881e83a5b6f870da3f8cdf43348c3cdb0789622baa0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-osxuniversal.zip",
        sha256 = "d06a9ec0ed5654e6f1e9df64efafc88d4c75206e2f15855585d57bc734c8a27e",
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
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "f42fdfdaf76c33a8c2a4eb44f62055db8f11f293f9693142a6dcc7b8e58e9905",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-windowsarm64.zip",
        sha256 = "ec96186617c318eeed8c014421016b0d67d27d5735e8e9428eb03b0f3391dd75",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "26f1a69cd87da3c151dd3f4e1868c50244a8c0aebb888e6db20c4727ed34d6db",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "c3c94eeec2b8fe62e7fddb0a6f93b6771caf53e9f48001d1c1af971fe2e51531",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "07b393b8fac38d2b601641768d14acf2f1d823260719808696cc71d248cb7ca9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "388aafa39a7c8bcfb0c78f25582171a6aff2c2ad47e7f1f028ab9da3cd7c6b2c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "bc37ccf2910620be52bcdcfeab75883580fea9755afcc43165186252d98678a0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "67674a67a36aad3cfb5fc7192c810f154728400720cbe229633e99b22a7baccf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "b58829ced2dca83e62c7d746cccdbef0a8df553ac9714393999f049f775f35bd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "74a1f42c44a23f4a36f01ad6fdf2b6ea1ec4075327086ab4b59fb1d6fc6a37a6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "bd817bc07b77f3367fae5c2d5dd250e6a9aed1fb9cd3428765ddf5b7a466d93a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "ae8c95fe45d2558ad9d076beeac313cc22db678638e9cf81e061015da5d98d4c",
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
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "3e86bf40416ae0c7621f147f43e79a7fac499aaac3558a3e48b94ed3665372dd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "7879cc802c91ca5100e5d431190c81c2fa4d29cf78ecccaabaa9a265aef7f847",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "befba6ecb699470a2530dd5610c85d15aaf869779cc7c0b562b15c5224aceaec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "937f6d8f1df3134f094d81a55e592c99fc8292a6adcdee8f74c35905bf613ecc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "69e3aa0cefa26693af0ec50f096d6ab9f4c388bb467cdb80d112dfa1fe258e32",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "c8800600fde327556682ab3a7d4ae36f9671535a34669d66bedeae159997911f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "1df0cb303852efc7c85de39b5df45cca269c429bedba9e9ffb564c2e763fe605",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "f61b8dc8fe6d270bdec26a8932e9914499e0d8a9905315be2f70c6baf15a43e5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-linuxsystemcore.zip",
        sha256 = "0a70ebca00800f40fdb9a54f037c4289d9ed1d263fe91c79f9b9962541679c85",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-linuxsystemcorestatic.zip",
        sha256 = "c16eebcd7d3dc6c9d1acf9aa00aca538edd4f242b5435fd29ffaef1d7589374a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-linuxsystemcoredebug.zip",
        sha256 = "5c2b2ecbc8f38e2c9faa23e2b44f7efb5a346f773614b602b6550b12e425ced4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2027.0.0-alpha-1/xrpVendordep-cpp-2027.0.0-alpha-1-linuxsystemcorestaticdebug.zip",
        sha256 = "6df7cba11f023c2b1c14fc4323d91e523d6257d439704af34bddfa2335d7765e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ds_socket/2027.0.0-alpha-1/halsim_ds_socket-2027.0.0-alpha-1-headers.zip",
        sha256 = "f30acd0e68afa16e39c4b98d7b5220afffc00a4fffd39dfe4ce7be51193f6ee8",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ds_socket/2027.0.0-alpha-1/halsim_ds_socket-2027.0.0-alpha-1-sources.zip",
        sha256 = "70170a8016b185b4fa2443e2915e3b2d3ca477158c4b285dbc2d391faaf5bee6",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ds_socket/2027.0.0-alpha-1/halsim_ds_socket-2027.0.0-alpha-1-linuxarm32.zip",
        sha256 = "71926cba0f0b97390f6ce1f7b8b99adee82119d8c3524e0ac63afdffa6dacb73",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ds_socket/2027.0.0-alpha-1/halsim_ds_socket-2027.0.0-alpha-1-linuxarm64.zip",
        sha256 = "c4cceb857f75a3ab217ff79189e4880fe98fcf255309211be24d38afb7dddd48",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ds_socket/2027.0.0-alpha-1/halsim_ds_socket-2027.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "7acd2105471fb6c3f0de5e6125da97b11c36c8ecb053319a07ee1bf1e16a1072",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ds_socket/2027.0.0-alpha-1/halsim_ds_socket-2027.0.0-alpha-1-osxuniversal.zip",
        sha256 = "4f258264cd5ab3929e76a4f6f3107720d69489c646aaa6aa7c30bd5651f46ae3",
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
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ds_socket/2027.0.0-alpha-1/halsim_ds_socket-2027.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "64d338532e5531d88e4bf5c23d3fd046e732ec2b211eb717aa24f0bb4aea88b2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ds_socket/2027.0.0-alpha-1/halsim_ds_socket-2027.0.0-alpha-1-windowsarm64.zip",
        sha256 = "f03f7a2222c43484cbd2e6a360258641b0745bf209e8a518f064f3b6f42e8b6a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ds_socket/2027.0.0-alpha-1/halsim_ds_socket-2027.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "53e1a5f41fe4adaf613f735fee30635298cabd1e082bd352644639bcee37e581",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ds_socket/2027.0.0-alpha-1/halsim_ds_socket-2027.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "dee89c16d6d8385daafa27ed37f1c7ff58e0553cdb1e4fec35a7b3eadbef9937",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ds_socket/2027.0.0-alpha-1/halsim_ds_socket-2027.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "31eb2e75c7375a173fea965ccb686fba2edc5668f309ef17ed550b79374db286",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ds_socket/2027.0.0-alpha-1/halsim_ds_socket-2027.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "06c53dd6dc8d98087e9dac89712e94b27ce95990030da3dd6e356a351aecafde",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ds_socket/2027.0.0-alpha-1/halsim_ds_socket-2027.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "24b1825933a27078a910472c1f922ded01b046a3adc4a8ab83a4af47ba047489",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ds_socket/2027.0.0-alpha-1/halsim_ds_socket-2027.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "c2a3140e82e000e6285feeb40be8f7b229cba456b532233a0a46a2177e9de7a3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ds_socket/2027.0.0-alpha-1/halsim_ds_socket-2027.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "f0bb3ed681575fc223462ba2a5ff5ffe493de87ca91817717f7376bf37857173",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ds_socket/2027.0.0-alpha-1/halsim_ds_socket-2027.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "96a70a841a1ee78d2218f62fed943b3431c73e51fc08bf386275580d4f9e6935",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ds_socket/2027.0.0-alpha-1/halsim_ds_socket-2027.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "781041e3bd96f9d409fd803ac87fbdd72a4700d39d7c4c9eb47c7a30c6b96a21",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ds_socket/2027.0.0-alpha-1/halsim_ds_socket-2027.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "61e7132af21028cfdfb70de38547249eefa4f6318c5bcf037b33ea28ab259e12",
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
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ds_socket/2027.0.0-alpha-1/halsim_ds_socket-2027.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "f6bfcf7893042061a6feaabe27feb4f9aa9a04339f18342cd65248fd2991a157",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ds_socket/2027.0.0-alpha-1/halsim_ds_socket-2027.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "c9817c5d47f732e2269319feee07d89a2d45d5e1add00461047ebf4389b40e27",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ds_socket/2027.0.0-alpha-1/halsim_ds_socket-2027.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "2be41df4c7371c297045806eeb05d180a393ea1294583deea6a069dd9c4483e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ds_socket/2027.0.0-alpha-1/halsim_ds_socket-2027.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "b85d89f7315eed117cc3fafdfa9d614f492ac613d912ec25632cd0c0842579c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ds_socket/2027.0.0-alpha-1/halsim_ds_socket-2027.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "1517e8e54f169d78b4bbe0d912ffdcb41006ac0e9fbbafaad05e0ee0187c7883",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ds_socket/2027.0.0-alpha-1/halsim_ds_socket-2027.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "4b968164f69d446b0f60fc35d37439220dd145563cd1fa1cf393a014dde4ac42",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ds_socket/2027.0.0-alpha-1/halsim_ds_socket-2027.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "15fcf7c7e23f00927430dd6681099c01b23f5098ecaf001b9f9442b42368d963",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ds_socket/2027.0.0-alpha-1/halsim_ds_socket-2027.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "18483fd7b4501e0460af0da623e45948a9f16ccd313a59f38caa36050f1bec68",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_gui/2027.0.0-alpha-1/halsim_gui-2027.0.0-alpha-1-headers.zip",
        sha256 = "2e8cfcaf6c59d38eb4f2dd506e5895e6652916ed5e16b36d1956dfb918e38cdb",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_gui/2027.0.0-alpha-1/halsim_gui-2027.0.0-alpha-1-sources.zip",
        sha256 = "02ebf347ec5e2f43dae3a9258a797572aa81f79fb539730c439e89a8896b96ef",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_gui/2027.0.0-alpha-1/halsim_gui-2027.0.0-alpha-1-linuxarm32.zip",
        sha256 = "e7a68be4414cedf4f62ed455c24e4e2bf5c6462083851aca9394cc56df79befd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_gui/2027.0.0-alpha-1/halsim_gui-2027.0.0-alpha-1-linuxarm64.zip",
        sha256 = "8344ebb0ee84c18def1c0a6181260ce0c91700ab2251281acb8a41dfb5220044",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_gui/2027.0.0-alpha-1/halsim_gui-2027.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "a3a99e3d5a577c1fb4b1b2049382d9f183c753c9896eb9e144a7a174c346dcc1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_gui/2027.0.0-alpha-1/halsim_gui-2027.0.0-alpha-1-osxuniversal.zip",
        sha256 = "91272c45fb726a89e091d1be16035215818166c62ea369711b58b615c9ca9e24",
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
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_gui/2027.0.0-alpha-1/halsim_gui-2027.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "9443928bd58f2fadbe1941c2a0d8381fc5ed554e39e5e8f289efabe6957f7040",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_gui/2027.0.0-alpha-1/halsim_gui-2027.0.0-alpha-1-windowsarm64.zip",
        sha256 = "d1fc353064bdb8c5e8e45cb942d01d30be8c8ae2fc1fc36d0d7710c2675615da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_gui/2027.0.0-alpha-1/halsim_gui-2027.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "efb1867ed33300ddf59e40cbc0adbf8d5bd9fc1185b9f6de7535b63fe0a93633",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_gui/2027.0.0-alpha-1/halsim_gui-2027.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "f15c73df54fa8a7b27d8e8b9e6f217005171cde1a84c151b8b1c131dd1fa27c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_gui/2027.0.0-alpha-1/halsim_gui-2027.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "ebc41936df7da60c357cecfbf92fbf3291cec5c7a76fb80c372e055bc984005a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_gui/2027.0.0-alpha-1/halsim_gui-2027.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "91e5439380d6bba6c058c169796b8e931c0c1b86342571169617ff394aba4258",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_gui/2027.0.0-alpha-1/halsim_gui-2027.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "f484cc1c082651727bd3446803442bd3665dca3e25ce3b81ffe1977449d4e619",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_gui/2027.0.0-alpha-1/halsim_gui-2027.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "bf4c0e4273ad0c6a8f53e4492513f4b7c66174f5e4e26e857d8c65a5d1b36ced",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_gui/2027.0.0-alpha-1/halsim_gui-2027.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "35041fa9c86736e10e347df9843a9f0f4b7b5a2e9954d69775d7d18dad61a27f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_gui/2027.0.0-alpha-1/halsim_gui-2027.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "c02bc600ed5f0b525a2584ae9e385b4741458fb954429fb830a067091b1fa4e7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_gui/2027.0.0-alpha-1/halsim_gui-2027.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "e720368826740cb23668b2494441ba5af707a58a00d3fe8e2b8e1fcd276c0ea8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_gui/2027.0.0-alpha-1/halsim_gui-2027.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "10620d643a725079f988ef0c989d5bfe895b46b76c7bd796928e6862a75509f5",
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
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_gui/2027.0.0-alpha-1/halsim_gui-2027.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "39118df40d755f8430ad101dcb60033948a0976078efc9ed73ee134b8aadcc25",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_gui/2027.0.0-alpha-1/halsim_gui-2027.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "31dceda67147fba2a124f69798257381e03211ebdda637831c4cb8eaa6b20afc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_gui/2027.0.0-alpha-1/halsim_gui-2027.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "a14c13cacd64a25959851372c4ec5a3757c6fea7ba2022e0c9df1162d5e4a14e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_gui/2027.0.0-alpha-1/halsim_gui-2027.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "c40d0a383d430477688bf3627239fca1b84413fecd4b355c72b4107c238d52bb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_gui/2027.0.0-alpha-1/halsim_gui-2027.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "032fec30e093a7a99537c22665eb26fa0cb1a0dccc0674a7a93575fef6fdc182",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_gui/2027.0.0-alpha-1/halsim_gui-2027.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "c31e1a7118a66d3599ff4adc623c1dd700a1571236e9fdc11e6c242c92641edc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_gui/2027.0.0-alpha-1/halsim_gui-2027.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "1637e09560aaaeb57b93d52deacdf37ab5011e1f84f71e9af112e17c18d4884e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_gui/2027.0.0-alpha-1/halsim_gui-2027.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "8b896d70a44eece932981a00bcf04853ac4faca9c570b08527d940013594efdc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_client/2027.0.0-alpha-1/halsim_ws_client-2027.0.0-alpha-1-headers.zip",
        sha256 = "303b6baeb2a1c6f29f911c8adc8bc8be6a4ea5e980289f856eb569664b787b02",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_client/2027.0.0-alpha-1/halsim_ws_client-2027.0.0-alpha-1-sources.zip",
        sha256 = "368ccf5a6af1c0e7f8f1098e25ccf3369a41fa4768e9e1475e6434eb5ecd1912",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_client/2027.0.0-alpha-1/halsim_ws_client-2027.0.0-alpha-1-linuxarm32.zip",
        sha256 = "258585e098037a8435ec0e25bddd103048b79dfc0fc6b55e3441acf7f25b683a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_client/2027.0.0-alpha-1/halsim_ws_client-2027.0.0-alpha-1-linuxarm64.zip",
        sha256 = "1821f52d679543e51956e4cfaa43b74c46792ca46298e5efcb247ff625f31eb2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_client/2027.0.0-alpha-1/halsim_ws_client-2027.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "26344ae22d29b627d2603d8ae799fcb8161b528339e593784ea5bc8e8d3e7e91",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_client/2027.0.0-alpha-1/halsim_ws_client-2027.0.0-alpha-1-osxuniversal.zip",
        sha256 = "7eaf987bcc932e88855ba853c0efebae80b207bc6c298b368739014b6446a986",
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
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_client/2027.0.0-alpha-1/halsim_ws_client-2027.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "1e13ed61d57724b69fc5193a1a708ac100b010af510185831462efbc4aae9eab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_client/2027.0.0-alpha-1/halsim_ws_client-2027.0.0-alpha-1-windowsarm64.zip",
        sha256 = "ae6b26abf5779116cf4c68cf7b4700d21043f7c3bdfe92a2db1abeef9ad93d1a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_client/2027.0.0-alpha-1/halsim_ws_client-2027.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "252e992b954146e49b53f134c7aa3fa71ac956556b0cd5e3c16aab5d55523295",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_client/2027.0.0-alpha-1/halsim_ws_client-2027.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "033ac2bb5ffe63b9af800a40a6b188cf66d49bd73df777d1df43ca9d54d51480",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_client/2027.0.0-alpha-1/halsim_ws_client-2027.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "b2bf67ff2f172361de57b24bb746ffeda6147a625e0bb40ca4f19baed20f13e1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_client/2027.0.0-alpha-1/halsim_ws_client-2027.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "08c0f957d18cd7cf27f033172141ade21bf528d55f3a7461af37fbdf14ff81bb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_client/2027.0.0-alpha-1/halsim_ws_client-2027.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "76f3892538d810010f67e432b7d1c68cf1d162077c03c26431f58fc264aba1ca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_client/2027.0.0-alpha-1/halsim_ws_client-2027.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "c2844fe008b62b0c0b4669726381ceea46d339315049a7df5f7d0dd422923721",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_client/2027.0.0-alpha-1/halsim_ws_client-2027.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "1c4992148ebb6d9caa287d71bf6cec639d9316427f05a56378b16dcb6c58e825",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_client/2027.0.0-alpha-1/halsim_ws_client-2027.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "ec6f3323913f1c596afa12000658d933989f163faea976f7b529a8e997029875",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_client/2027.0.0-alpha-1/halsim_ws_client-2027.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "9325537b4ec40861abca4a75cf4f6f6440b06d7f13bc9a6c2679efa698967d1c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_client/2027.0.0-alpha-1/halsim_ws_client-2027.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "cf8613bb4e3970aab5226c841454e795ed0b3aa39dd9eb87ce07a255a26a4f33",
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
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_client/2027.0.0-alpha-1/halsim_ws_client-2027.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "7b8f5af219706879e5b2c577d201c9c279478c652e95fc7441b24f934be44c0b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_client/2027.0.0-alpha-1/halsim_ws_client-2027.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "8c98eae1efb0ab9fe0d2befc21957eade137415736ee9f106db0bd086b7bf80c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_client/2027.0.0-alpha-1/halsim_ws_client-2027.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "04c953bdf4f026318cea5804b934760d6eac1b1447be282ede18fc21675ed213",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_client/2027.0.0-alpha-1/halsim_ws_client-2027.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "97692cfdb8b119a8aca2cb2c01391aa23c38b80d800f6ada01901268e72c3aa0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_client/2027.0.0-alpha-1/halsim_ws_client-2027.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "3d4e4fe5979de521e09b66f5df302aa797dde0071335e58988b45db362ab7d0d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_client/2027.0.0-alpha-1/halsim_ws_client-2027.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "d11e99f56b98bfffd73730f5ceec41b3b41c7558811b2ce713c80b41427030ae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_client/2027.0.0-alpha-1/halsim_ws_client-2027.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "489501af9963a071fb20d8b9a5c735621a9b9da661be8772fcae7b38140b91af",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_client/2027.0.0-alpha-1/halsim_ws_client-2027.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "3f3851813c700e2fb0b1f439e26de2eadd888d4824acc832b6e917a5a043e2e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_headers",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_server/2027.0.0-alpha-1/halsim_ws_server-2027.0.0-alpha-1-headers.zip",
        sha256 = "20aef718f254adec009f035f2c436282b7e69230bcf5b3ac47b0551f9bbe92a0",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_server/2027.0.0-alpha-1/halsim_ws_server-2027.0.0-alpha-1-sources.zip",
        sha256 = "6e1f2b58431f480b974bed56b48943f9d84e57d5eb829b769053c780f57fe7ce",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_server/2027.0.0-alpha-1/halsim_ws_server-2027.0.0-alpha-1-linuxarm32.zip",
        sha256 = "3c9a589364662cfea1d96004d4f7cba723474e6fe4fec7ce591d92eadc8a5ce0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_server/2027.0.0-alpha-1/halsim_ws_server-2027.0.0-alpha-1-linuxarm64.zip",
        sha256 = "81627a3a1d07da39d853496fafb561c14e6e224e182d4cdc7858c79efe039b63",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_server/2027.0.0-alpha-1/halsim_ws_server-2027.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "cfbdc7c6a36aebab82fc1878450975614544f6825c2dd3ac7b991339f54b38f8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_server/2027.0.0-alpha-1/halsim_ws_server-2027.0.0-alpha-1-osxuniversal.zip",
        sha256 = "533efa9799ed4f18d7377f12288eccfe193c8a9cbf8d1afe8582740073a39269",
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
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_server/2027.0.0-alpha-1/halsim_ws_server-2027.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "3ca6595454fc67200da90eb279bc9ae44659fe627303cee949d7617e79222195",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_server/2027.0.0-alpha-1/halsim_ws_server-2027.0.0-alpha-1-windowsarm64.zip",
        sha256 = "66bb07fb74010fa231d8dab0b4345a6fff6a3600a45231759df64863ac0ad0df",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_server/2027.0.0-alpha-1/halsim_ws_server-2027.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "495ab4367de0f7c621b1cddb3afcf996d3ffb11bfc05589bc49868703d3a0f76",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_server/2027.0.0-alpha-1/halsim_ws_server-2027.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "a968ed4eb466a686859e9e39d6affaaa3f5f1baaf36091f1a718906625c16b77",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_server/2027.0.0-alpha-1/halsim_ws_server-2027.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "d71344cabf44cc24e4668f3fa998cb5b3a40c97805d4e36c84331642b2ca9fe1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_server/2027.0.0-alpha-1/halsim_ws_server-2027.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "6c227d49c78e7764d5920488864d436da5c1827e8133baca9bcc3c11e0870056",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_server/2027.0.0-alpha-1/halsim_ws_server-2027.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "757ad8634203aa72567c3c434bf5da0c6329e770e7e6ae7d4e38fe1726db3fb7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_server/2027.0.0-alpha-1/halsim_ws_server-2027.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "a708de08550adb06b61799d0741cfd928d46f347b0d1900cb8807cd48f154455",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_server/2027.0.0-alpha-1/halsim_ws_server-2027.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "36afcc613fd7afffd789246d1a446d3d207ef2c091e4205eb94216d4b5312b43",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_server/2027.0.0-alpha-1/halsim_ws_server-2027.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "d4d9db447070ff2685cc747dd8b0bac2babd881fae87d4480670206f6b9c1d2f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_server/2027.0.0-alpha-1/halsim_ws_server-2027.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "34c547a2a02ea9188a9125c54f55e3de92000a29af05a432b86cf0144855aa6c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_server/2027.0.0-alpha-1/halsim_ws_server-2027.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "ba593ca9ade091afb7919d0ad52ee14ae073ad07a30c597512332be4e501331d",
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
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_server/2027.0.0-alpha-1/halsim_ws_server-2027.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "c0c109bd18abf93c18f45413ad72e1c65495792bcbc9e54dbef5e7607c060895",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_server/2027.0.0-alpha-1/halsim_ws_server-2027.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "68d58b38b1a5ba0ddd85b54b0be32073df31b9d67446274e6b0495191cf00777",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_server/2027.0.0-alpha-1/halsim_ws_server-2027.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "9dc0fc75907de0f89d696cee75d80f851e1fc39dbe4df7fe23fe42718255c02a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_server/2027.0.0-alpha-1/halsim_ws_server-2027.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "5bb5c645997d77331d1207a6b4269e8c16674d4a289fe51f1f5ac70edf9d60a3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_server/2027.0.0-alpha-1/halsim_ws_server-2027.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "b24da7e4b779184c79663af79201b3f330b09ae5809754401bffcd6235c62859",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_server/2027.0.0-alpha-1/halsim_ws_server-2027.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "5c0c51490d3211440acf2077fd002016f601bf7cd282cfbcbaf76784a4015948",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_server/2027.0.0-alpha-1/halsim_ws_server-2027.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "c475e492d6e6b19b07aae379b31c8d6d5a15525d3f4018306c3a57f93b4ce265",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/halsim/halsim_ws_server/2027.0.0-alpha-1/halsim_ws_server-2027.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "12edb47c228ac0590fb0559a499f14c972214816dff489bdf48a21c18ee5c900",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/tools/Glass/2027.0.0-alpha-1/Glass-2027.0.0-alpha-1-linuxarm32.zip",
        sha256 = "3e6f9db2811beabe6495cd8766ac3bb363d3fbd148adc5e34b5f78661bb1ee92",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/tools/Glass/2027.0.0-alpha-1/Glass-2027.0.0-alpha-1-linuxarm64.zip",
        sha256 = "75b3e5af68befb61027f4698bbd21e6c35981b135d5618cf2aaf0ac47b95d0fa",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/tools/Glass/2027.0.0-alpha-1/Glass-2027.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "ce2259e2e87529b379f6cb24f6a82a544a55de1801d1ab162144c4c0b3dbbcc6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/tools/Glass/2027.0.0-alpha-1/Glass-2027.0.0-alpha-1-osxuniversal.zip",
        sha256 = "d416851f4e5dc9385b268f68fe32305853387b2f6a770603dba42dfa70ddea8e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/tools/Glass/2027.0.0-alpha-1/Glass-2027.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "560050f5998c3adcade2773901112718b01942b82e33af5eccddc8a151fa13ae",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/tools/Glass/2027.0.0-alpha-1/Glass-2027.0.0-alpha-1-windowsarm64.zip",
        sha256 = "83d420b6e7c63afe49165ae615c2bc78cb5b76e926a7784429d584faac103995",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/tools/OutlineViewer/2027.0.0-alpha-1/OutlineViewer-2027.0.0-alpha-1-linuxarm32.zip",
        sha256 = "a69156e81f00a8020f89070d0642d2c94584126205aa8f7fb169d523befb0dee",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/tools/OutlineViewer/2027.0.0-alpha-1/OutlineViewer-2027.0.0-alpha-1-linuxarm64.zip",
        sha256 = "c48e4a50f1ca517fd8a2cb1d791d74030742fe4f009fa49db93dc3e11c143502",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/tools/OutlineViewer/2027.0.0-alpha-1/OutlineViewer-2027.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "cd887495000165951aa125f2ee09e6994c7e6bff83801addfb0db2e4c067f95e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/tools/OutlineViewer/2027.0.0-alpha-1/OutlineViewer-2027.0.0-alpha-1-osxuniversal.zip",
        sha256 = "62c140bf474e048fc3bfc1bab43cfb864f7a19b7623e9710763b85d3c093f844",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/tools/OutlineViewer/2027.0.0-alpha-1/OutlineViewer-2027.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "f77c63029b346e6c5610714d431892b3ca5c456c8ac51185870649ae5c13e09c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/tools/OutlineViewer/2027.0.0-alpha-1/OutlineViewer-2027.0.0-alpha-1-windowsarm64.zip",
        sha256 = "b69638ae4542c9d5366097afd59873d1ccb0c0e3d363e217e4a59116e69c6f7a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/tools/DataLogTool/2027.0.0-alpha-1/DataLogTool-2027.0.0-alpha-1-linuxarm32.zip",
        sha256 = "6d13afd04eca48d5836b0dd4ea403305638f5e73f73f6102d78614559647929c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/tools/DataLogTool/2027.0.0-alpha-1/DataLogTool-2027.0.0-alpha-1-linuxarm64.zip",
        sha256 = "98dd1f20008d6025cffbb76f7a5175ca9420c81a30aa8eea39757f7a00a78b42",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/tools/DataLogTool/2027.0.0-alpha-1/DataLogTool-2027.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "9524d9f3b2059aa1be0586192b0b0351778011bfaff9cd968073503a36de56fd",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/tools/DataLogTool/2027.0.0-alpha-1/DataLogTool-2027.0.0-alpha-1-osxuniversal.zip",
        sha256 = "f18ade282546556143d7b89b4dc8541a9387ed57d92bd1a527822926a55e2fd3",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/tools/DataLogTool/2027.0.0-alpha-1/DataLogTool-2027.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "e264bc8b63c4f128dc0f5eafea21934285f4cdf514cd5b00c8a913eaa3bee580",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/tools/DataLogTool/2027.0.0-alpha-1/DataLogTool-2027.0.0-alpha-1-windowsarm64.zip",
        sha256 = "34a3372b329f6b9a38c32729138a6a8c23625fea32a67eb955fc76b57e2e11d8",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/tools/SysId/2027.0.0-alpha-1/SysId-2027.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "49af2a2d19908ab0289c669f4160b614238ee3d33613daf183a35ddf105aac0a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/tools/SysId/2027.0.0-alpha-1/SysId-2027.0.0-alpha-1-osxuniversal.zip",
        sha256 = "112024bf3ed5116f306cd0a41c4b796b9e8abf1bdb11ba917391b6c6990cdde2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/tools/SysId/2027.0.0-alpha-1/SysId-2027.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "453113f634eed9c829d1b728deeb3f90a26e48bfcaab86a5b86ef7d9078c4934",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/artifactory/release-2027/edu/wpi/first/tools/SysId/2027.0.0-alpha-1/SysId-2027.0.0-alpha-1-windowsarm64.zip",
        sha256 = "9a1b777db06f7db3aba96d9f4da2a97e57f3b354adeccc08cbb68a0095a4dd37",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
