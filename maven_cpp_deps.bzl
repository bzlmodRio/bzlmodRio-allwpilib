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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-headers.zip",
        sha256 = "5521d8135b13e32c769940ecd7ed643d6a55e12da0d518a1f553a79bfbdb05cd",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-sources.zip",
        sha256 = "36bf0d1f47072788bc8ba79df1f5f296cae4adbdbe0be1c375fadc6b0c890ce1",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-linuxarm32.zip",
        sha256 = "d2b9edc3de2184dce0da90318b0949ea25cb086111d59f7fa4c2625459874cc5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-linuxarm64.zip",
        sha256 = "fabf5e2aadef0a6104119f9156c5e088a20274f465898f37d98b45d5038ffa20",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-linuxx86-64.zip",
        sha256 = "0be9093da92a9603e2b2332640837007f9ab6ed86ec8a0f17275db1bda17fbbd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-osxuniversal.zip",
        sha256 = "7fbbf7dfe2d6e3852d0e193f3aa110a914b8a8bdc21e4f7fd2260a0f6a79d806",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-windowsx86-64.zip",
        sha256 = "d343f220a7bc9201548af065f504c3031d9259fd691d533492eca757b791cb19",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-windowsarm64.zip",
        sha256 = "9beab3def8e4e38286121f6a1e1afad605223c79f69cb3d442602843c9606926",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-linuxarm32static.zip",
        sha256 = "1fc0587cd747c4e5392fd8d52fb5fae78fa33412676a64d063a900145cdf496f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-linuxarm64static.zip",
        sha256 = "4ad5ddb5940c21ffca1a5329807e1dc9b77588b90f1128b91d1c02d10c7b0348",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-linuxx86-64static.zip",
        sha256 = "045d232887bd855afd450394187279eccf194bd6cd0e72a78e2ec4413477811e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-osxuniversalstatic.zip",
        sha256 = "dd59da5a934a2e13a6cc7ce1d74cb49d8e94694c059f2182a39a5749f9a982a2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-windowsx86-64static.zip",
        sha256 = "9fb4948e7c578828a26c94959157e942743ef31bd0c5ca0a90acfd92f333f1e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-windowsarm64static.zip",
        sha256 = "5fe57641c73d4f910cacd19296c87112bcb523ee7641284b80116f35f8396816",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-linuxarm32debug.zip",
        sha256 = "0fbf8d1bf211bd9ce2a28498eeb3c467ea3231625c9ba420bb5e26ddd2038ef1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-linuxarm64debug.zip",
        sha256 = "990a58d1a194e23f9e90a69ab16dbed0f870013c8ea62152316105f077aa1c62",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-linuxx86-64debug.zip",
        sha256 = "3d64c77fcbf361a9eaf88a5c135115a7fea170ef2d39c40b93abb52f34698d27",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-osxuniversaldebug.zip",
        sha256 = "9a8f98c79489ae2e7b856a5aa3437649a36b15dda95545e95c60c7ba8441cfd5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-windowsx86-64debug.zip",
        sha256 = "5bd900b191e775c7fce15c88a8c17192610222321a54ff79c87b5fb7d272db8e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-windowsarm64debug.zip",
        sha256 = "b366966ecd0f3617fad642f619bba642fe78642638314e988c8d3eda69874598",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-linuxarm32staticdebug.zip",
        sha256 = "cb3d24023db0b0dfd4865d7e66725f044d1d1c881161de8afc134b365baa6611",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-linuxarm64staticdebug.zip",
        sha256 = "e1fbfd4c50c7f345b2dfe7ef41f6d0011a41ef6e91a6cdc96362e02c88b74dec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-linuxx86-64staticdebug.zip",
        sha256 = "15dc7f98d995f207ec71a3623ed9ec820e426d4401c46ada445310fe789a7172",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-osxuniversalstaticdebug.zip",
        sha256 = "63d64ba690e0685cf3561b3227f38e490158411be4aa8a14f70c5efb384b2239",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-windowsx86-64staticdebug.zip",
        sha256 = "9c06d37a9e89f924d8fabc0dc040b2c97352a8060194414b4dbed912a7858dbf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-windowsarm64staticdebug.zip",
        sha256 = "f8bca1af761b8a205e6f45375c3172972bbc128a8eac46d21f96357759d54beb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-linuxathena.zip",
        sha256 = "0c42022db415b1d108519867e34702f8aa4b87e69486740a6b8b8ebe1c9b216e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-linuxathenastatic.zip",
        sha256 = "c0a703df5f14c62677ecc7fda9994e6b19a5e5d96dabb065f23d4cdc51e88af6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-linuxathenadebug.zip",
        sha256 = "49ba83ce6cdb815aeeff260c9dfd16767d0f967a9a99c3ad4d59ba888063bfda",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.2.1/wpiutil-cpp-2025.2.1-linuxathenastaticdebug.zip",
        sha256 = "53d78947e84644383eb2066b8102a6fa8a8848b28c717b437c340b0a1c38d223",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-headers.zip",
        sha256 = "90f228cfbe64a41146451c6ed9010564fdff3355bf627af47adb80176c9a10a4",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-sources.zip",
        sha256 = "cfbad5922e87b6577bff1648305bba7d021b2a7cad12f4dca73991dd2f006c23",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-linuxarm32.zip",
        sha256 = "8c55fe07d150a0ad0267d09319180160c532d337dc5d85bff42fe76c55bbd236",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-linuxarm64.zip",
        sha256 = "bed7f94d06afd6a0ae43b548ca96de4f30e452aa0db1410834f1f2848e4722b3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-linuxx86-64.zip",
        sha256 = "9cfe5936856855d05f15c0a71013c917533811f44a9391629bcee3f8ef3ca23d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-osxuniversal.zip",
        sha256 = "a97b98524377e02744f2407f992658fcda9332930e9087566bfd73f8ce128a8c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-windowsx86-64.zip",
        sha256 = "b39b68eb06d3423a06f479d0ecb7a5ad3d4db7c7e0b5078a688f02588dedcbfb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-windowsarm64.zip",
        sha256 = "cf48230577bcb4c66904f4bc887ad8039a9d9e362dd1b73cc299da133aad8d59",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-linuxarm32static.zip",
        sha256 = "03eb9a5039455e3d3c39e9c25cbd286c8ace092201211ffc6d43bcb34af9a36b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-linuxarm64static.zip",
        sha256 = "a3f7e8419b1ff8f89a4792074b78183e8471314b24fe6e32712d15ef5e41aca7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-linuxx86-64static.zip",
        sha256 = "1e2a92affa5ca299309b77624d80924b4052775b39a3d6e4316c49deca942480",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-osxuniversalstatic.zip",
        sha256 = "8ed2b60dd87544b1f1c8fb337ef680c1a167906afed46cb5cdf3793cbbd04428",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-windowsx86-64static.zip",
        sha256 = "dff57a5961710e9fa532a1dca382483ed24cf87c67bf55e2243fcfef89026b52",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-windowsarm64static.zip",
        sha256 = "1a83b352c47dda53643189dc079d4fc4fd9d6315ac552714c8de20c9c069c37f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-linuxarm32debug.zip",
        sha256 = "e49337a3fe72cab7279fa6da944f6756450473d92baf22a585ffb41458e0ae19",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-linuxarm64debug.zip",
        sha256 = "da547a14e56d025ffb566cda4bc9963dea6c9dfb47815d5df9e063708f5dac4f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-linuxx86-64debug.zip",
        sha256 = "0309ac54f3dccfa08588f0bb03344d8ecafe752509e968c8566cb366780c006b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-osxuniversaldebug.zip",
        sha256 = "c6ce3ca36ab0a36be50bc04bb0df4dedea72538b61ffb1b40ead0037b88912aa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-windowsx86-64debug.zip",
        sha256 = "b7324e7ead03c8c2c94fca2439979d318979004df8ccad2bf9744a56c0a6f387",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-windowsarm64debug.zip",
        sha256 = "f98e1b37b55a470a270c057a92a947f277e98574b4f7bd2e2385ff45b4891e80",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-linuxarm32staticdebug.zip",
        sha256 = "e8db0261b82dceb898178095db3dafc2d53fe4c8887e00178a17d3a713eff752",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-linuxarm64staticdebug.zip",
        sha256 = "e3e56752b7ce71d39ec519f03bcde8f079a4d357ad5fc029ff7cffe3b0ddc249",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-linuxx86-64staticdebug.zip",
        sha256 = "82bd76b64a86a1a407b02ccfedaf1a100b2aebe75c7c0049dd262e27dadb6226",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-osxuniversalstaticdebug.zip",
        sha256 = "57101ce9a6b1cffc20c133bcbf2075aecdff043a9b4facfb952485060911a822",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-windowsx86-64staticdebug.zip",
        sha256 = "56000662c8001ae148efb825c15a395c557b24f0c850be63d68c9e6bcb0ee9ef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-windowsarm64staticdebug.zip",
        sha256 = "571f72cd39d9c8eff2f990a4973f2f09134b1e0225638a2cc3ce4d22d3f4da50",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-linuxathena.zip",
        sha256 = "f6480959952d7c7102e172865bc49d599b1e9b3e7b4f3a78885df022de7f4827",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-linuxathenastatic.zip",
        sha256 = "768d29960120c3bc9754734c684d64a3cd45e9a7d2cad3aed355d3e00a1bebf5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-linuxathenadebug.zip",
        sha256 = "410f24bf2f4d8f1a135d929946f8bf7c2ec91feb1c16a74b4c4d0d0faf152d2c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.2.1/wpinet-cpp-2025.2.1-linuxathenastaticdebug.zip",
        sha256 = "e0ba236b367a58b4ba09a039170298e20ac940f5a8549675909c613fc611aec8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-headers.zip",
        sha256 = "4540caea66d501912c6c2c1ca70c164868aba08512845397fb20359418ae8ea9",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-sources.zip",
        sha256 = "da2226ca4c0ea2304f8c71b1f75d5e500609ac4311644ad2b5236d16ce5662c6",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-linuxarm32.zip",
        sha256 = "ec7d85a9680f939f1f6fd2ba8bf4ec6c19e044d75aafeb5492b52d4ab68795a9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-linuxarm64.zip",
        sha256 = "3ce11bc13aa0b52aa6ff7fa7523180473ccdc98e402f10bc4e5fdd1d1a145be6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-linuxx86-64.zip",
        sha256 = "e386b270014a8b20f4b07eabf0354f119fd350295982a0915ab0e355c7baba46",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-osxuniversal.zip",
        sha256 = "6930b735b1b142c61c79bb66ef94a56f9119d3fca5db084dcafd0f821d051fe1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-windowsx86-64.zip",
        sha256 = "35d9d779f01d9e9df9b73d80c200403bfaf3fb8a5b0a30c3bb36a3b7bd701a91",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-windowsarm64.zip",
        sha256 = "9cf23c3a685e6ba446845dff28a819b4428ec132bcee829d7121994dc47295c5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-linuxarm32static.zip",
        sha256 = "17345a4f059e83c5e76681b84883559a9f6e1338d164b0da9bc1b6cf98d835c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-linuxarm64static.zip",
        sha256 = "06d20da1472d089c1f08a0021a5801dc8e119ce5f379c6f78be10ed5dcd92446",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-linuxx86-64static.zip",
        sha256 = "86654d121fea5dfc534898af60114bb265db13cbdf824e314f0c6f91c566ca08",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-osxuniversalstatic.zip",
        sha256 = "eb0f48c3d6a3054648b390235344603e3c91f3d67c6749481af35879d3f7c5a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-windowsx86-64static.zip",
        sha256 = "ad211c8e363b6924495470d919c56cefacd79e68fbb3647ba20c41ceb2d05c4b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-windowsarm64static.zip",
        sha256 = "25832725542230ee5949cae660545186d595450b574baadb362fa00e5dbc815a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-linuxarm32debug.zip",
        sha256 = "9e5d253ea85b077ac8a50f4062fc8a9ccced1d2876abaa7df3b5bd0014967eb5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-linuxarm64debug.zip",
        sha256 = "27d0e83aaa57bd339f294073860ce42f2fa665565c32d746375a93c1539f4dfd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-linuxx86-64debug.zip",
        sha256 = "c93162bd6d568deb9d2a0085721469f9432d409e362cbaf1e267dcef0d390a3d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-osxuniversaldebug.zip",
        sha256 = "db7f59da03fc35bda0c72454e9ce57fae5c2d17e75f1275286b9daf068927a4a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-windowsx86-64debug.zip",
        sha256 = "bf85f4a985d5e92ae16617d5bd543ccc35883497dae04bfe8a08fdba6a6273d7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-windowsarm64debug.zip",
        sha256 = "fc5ed3ee8fea9b66878b33f43d2e3e3a2c4a5a953ab79e0996b3e4c67304637a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-linuxarm32staticdebug.zip",
        sha256 = "568610ab7f5d2174ac65851e7e58d037fe59a7cbe5a05d245ae43b265f6f6e33",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-linuxarm64staticdebug.zip",
        sha256 = "aa57995f68baa07f8beeee1ddd222712161b128e773d193f515f6882047efc65",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-linuxx86-64staticdebug.zip",
        sha256 = "bbdc4daf387a9d77bdf457fe9975d397d6373e52f699993a56b7890f599b5235",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-osxuniversalstaticdebug.zip",
        sha256 = "ad7fe1c60a604f7c56907f4c7052a42a45231478ad28fe502f72f8729e6b45b6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-windowsx86-64staticdebug.zip",
        sha256 = "22830377d6c009be32b559a97abd07ab148d9bf7dd00c52471362823078cc32d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-windowsarm64staticdebug.zip",
        sha256 = "2b54b894e992c1dd65291f88c4402ebee61bbc744d203ec233e770392f2f6639",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-linuxathena.zip",
        sha256 = "df1aa6c92cc0cbb15ce040526330e3eb28002bf2239a2fd55b32dd250a39cdcf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-linuxathenastatic.zip",
        sha256 = "dda7341e05f3c306d0f134bd7a10d7eaa650919f6dde9eebca62ed7ea5be5409",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-linuxathenadebug.zip",
        sha256 = "3a86dd187e9c223720f31da942fc228780a61790559ee79e6f508b7249a9c015",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.2.1/wpimath-cpp-2025.2.1-linuxathenastaticdebug.zip",
        sha256 = "04d033878a51ec63b1db779a86f837f35dbd54c6cfbd7e6bd0430b218eb1b927",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-headers.zip",
        sha256 = "271cd1e9c43c36f8abc2b3b78b4cef8a35020db92fa3bd82639ab4f56cbc9400",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-sources.zip",
        sha256 = "0b7c7e8e422fbaaa2460c8a94f34bbcea853d7f207f745420d0718a48f8a5749",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-linuxarm32.zip",
        sha256 = "421ad626a00576663623fcf53bac2d43375be6d8fbc8fca293a5d09455f013cf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-linuxarm64.zip",
        sha256 = "fffa7d306dc7ad05f562e3758b35d197413368e18acd716f417793bfd44d4ea1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-linuxx86-64.zip",
        sha256 = "81c73534ab7de52d2b6c062ea3af7afef8b6ca828c95ecdb60fa0cd9b6508ef2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-osxuniversal.zip",
        sha256 = "4ad1ee4b817770afa27b2c182fb11f3d65515807c7f6994862a2fd9ffd2f86d3",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-windowsx86-64.zip",
        sha256 = "98c5ac4086b2cece99b105dc282032e6048fd6724e17a8144e9a3a30ef7db905",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-windowsarm64.zip",
        sha256 = "e61ff52f17fe69492ea0677b53912db029ab8d1f9d047b29a71a29e45be8ef87",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-linuxarm32static.zip",
        sha256 = "e01d8e5eaf8d5a78b76033902bcd1208e7e7ee106f249bdc83cb2c4448ad4562",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-linuxarm64static.zip",
        sha256 = "8fbd5c54947b7b306631390dc09535b839eaa8002ea1cd44580195fcced6d9c5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-linuxx86-64static.zip",
        sha256 = "4675feaddc994a6dd8c2f3f0244314a3c0bb60f12fb7a71a572c1ceb3bf8199d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-osxuniversalstatic.zip",
        sha256 = "2a892a2366258a5abbe418f68267a1614f1575a0bd8c9a1ec4fa5af2260400bf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-windowsx86-64static.zip",
        sha256 = "1e9b17a1706af2398a98a2c804675af9c601b43a6c4eb98394419be432ce715b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-windowsarm64static.zip",
        sha256 = "e23c97a69ce399c1c512b7fd0f73310a093639338028c907b5f144a16273fa59",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-linuxarm32debug.zip",
        sha256 = "9c0cfb7ab41ca7d8b5e080b463bd9fe1cbb96e8787203bb9f16d323bc7238f17",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-linuxarm64debug.zip",
        sha256 = "ff5eabcc5cf624671097669b8ca8d4d71d97bbd40b029e700bc8c6ccc038eb84",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-linuxx86-64debug.zip",
        sha256 = "0d7d24c2fa1c2a85d8ad65ec08be616dcae6f4a039d291fa357241259e6cb2f8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-osxuniversaldebug.zip",
        sha256 = "86f694961e778f7aff6adb8637571bee8769dd7e800fd13d5fc96154e6dbba17",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-windowsx86-64debug.zip",
        sha256 = "b4458142c6e527c8bc74d360b1b20e9fc1605626e7cd7e0348b0d58da4e596be",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-windowsarm64debug.zip",
        sha256 = "005fbbdc95ce966f229a5c9535e54d8aa34003a12a3d093f703114911436958a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-linuxarm32staticdebug.zip",
        sha256 = "a0bdbf71ba31087ad7cbb98192e3516f984e295485d1e4e27364b6a0e9252ee2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-linuxarm64staticdebug.zip",
        sha256 = "72af8c3f4cd07f89f1d47966812dcde3583e4e1580d540d8650134eade74d3be",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-linuxx86-64staticdebug.zip",
        sha256 = "eee2bc72bf679ce2cf390b1060d291a962d7d1bb658c7b49fefef1d67b7904aa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-osxuniversalstaticdebug.zip",
        sha256 = "04479fc8079596689a93cceeb54c4e24f14848f34ab42d0905c3e04f3e448bbc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-windowsx86-64staticdebug.zip",
        sha256 = "1653dd9001cf7dbc8f14b04f53afb72bafd4e0bbde70e14a20725bb9d6a92bcc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-windowsarm64staticdebug.zip",
        sha256 = "466577d2eb84903f491f7fff085561641bfdfd7e2de2b84b1e4a2eb63491a0d3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-linuxathena.zip",
        sha256 = "774afff23eb83f6e4d1d47692b16f64d8c50d637bf8bb0591c04b8ed6e21abd9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-linuxathenastatic.zip",
        sha256 = "bd8a96e89f8be644688d1de8cc7bd9c916d7cc8a4133ec2a3102d24ff41729ae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-linuxathenadebug.zip",
        sha256 = "78c61bf507ce7985af78cc2a9ee03ba4f7eb1df64430c1e446a949d81d26b6e5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.2.1/apriltag-cpp-2025.2.1-linuxathenastaticdebug.zip",
        sha256 = "3fcf19e41a7cdcabbd5ca5668a0e8ec2a45e2f12874c100a52835beeb27059c7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-headers.zip",
        sha256 = "f76af83f58183151eab1bd5bbe15c0dbc9b63e7ff0b215b2ca0e252caa9cbb2f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-sources.zip",
        sha256 = "f0018aa47853d822dfdc3dac96fb431dec99c9cd368f67289f053f90a99b431b",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-linuxarm32.zip",
        sha256 = "e2739392f08112149b7ae8d967545c79df2d2a7d755d9748977afa617f16cccf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-linuxarm64.zip",
        sha256 = "80fd0e90fb9c6d9e9bf4b7bc8699393360f4a19bb26057c8859540601559d970",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-linuxx86-64.zip",
        sha256 = "8f7e002826bf7686742c46ed8dde985c66bd2e65fb3b2de6a154320365704421",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-osxuniversal.zip",
        sha256 = "15d8717fe83d53fc34ab32a480364c0c35112177d81597d3517f0b52e08e2492",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-windowsx86-64.zip",
        sha256 = "afb148e19596ae40eed3c54bfb6d543c4ff14d8b655b61d9add5c43e26ebbfcf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-windowsarm64.zip",
        sha256 = "72e6b65674188e399f50cd0724bad32fdd4ffe688d006082dcb4c7dcc4e2af1a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-linuxarm32static.zip",
        sha256 = "72f05e8faa39cde3b8fe6e4605030d99c37f718325bde84f514e2949f69160fb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-linuxarm64static.zip",
        sha256 = "4f6cabcf046a1b223acb8d88a4a84baf93a7dfb7128fbe810c836274a1f7b26f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-linuxx86-64static.zip",
        sha256 = "3e9247d2f08261952ce124eef86ce7d575a3b7e452cca9b5e5a5e216fffc15e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-osxuniversalstatic.zip",
        sha256 = "2adafcda50f730befe2a48f603e808541938bc1d72a0789402495c78d850c9cc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-windowsx86-64static.zip",
        sha256 = "4416882a008a7e42bfadcbbd2f0feae8e1edc417f84bdb37272c0d667ec6019b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-windowsarm64static.zip",
        sha256 = "9c3ff48ca2800c64a240c95a602527d6e8f770f0a8900b2362dfb26ad1ba4aa7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-linuxarm32debug.zip",
        sha256 = "18d13c76d56ff674fbaa65cb44b6b53b14ee04ddda1df19590a3820437d7867c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-linuxarm64debug.zip",
        sha256 = "f2438c7d5e67e5a407c806b81fbef8cc4dcd5a4366bf73a4263fdbe54d17f559",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-linuxx86-64debug.zip",
        sha256 = "979f99eb5eeae5b3a00f80179d475b3997c8b25d6cd46a9420b9fb567dac033d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-osxuniversaldebug.zip",
        sha256 = "2163ce4a0048c847d2dab3c74dacd970674a5e03860f68804942892bf8906bb1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-windowsx86-64debug.zip",
        sha256 = "fcee96c22a2a482593f912ada2b3bd7c609474776441366cbb4f3b3fc287b439",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-windowsarm64debug.zip",
        sha256 = "446b24c4908c05bb20e323c49ef74b5b7a5d2bf163698130f6cf2277e84f1176",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-linuxarm32staticdebug.zip",
        sha256 = "b2f2e6e333c833e23cea7d4389cb9e96e572149aea467a2ec4ebdca4b99fa1f6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-linuxarm64staticdebug.zip",
        sha256 = "d2e8aa9e30172f36903a6b2724ca2964299acb7369644291b79d1e00c640765d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-linuxx86-64staticdebug.zip",
        sha256 = "77be4aba36eeee8a1d38c3191ccb2b2678a3e6ef6387911aaf3d490feb46b99a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-osxuniversalstaticdebug.zip",
        sha256 = "448260519f99dc82eadce428ffab28b9120941a4ed440537f793c25d9cbff1d2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-windowsx86-64staticdebug.zip",
        sha256 = "bd9a08cd8529d6004cd01b67a06f96ab7954834c42ddd19f3a900cc430da8ff2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-windowsarm64staticdebug.zip",
        sha256 = "45c0fb598aa102995a9472d747a721d5b9f871348d4c3ad61b32a8f8b824bdb7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-linuxathena.zip",
        sha256 = "7c2fb741b8256f89996c7e502f3f86ac4c4a83c01e866bea80f11da0abe52885",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-linuxathenastatic.zip",
        sha256 = "3e6ed70438dc30a1a5e38bd51ea4bda25b4b85e86028f5735b7047a592a67b02",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-linuxathenadebug.zip",
        sha256 = "5f65d399fcbf4512609c898ff8875db7798ef9475807706ea6c698075aa6344c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.2.1/hal-cpp-2025.2.1-linuxathenastaticdebug.zip",
        sha256 = "732e6142f2f5b9f942d732b72fd8d752278cfbf4f126dfe3bea64301947f7bec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-headers.zip",
        sha256 = "e57a0d5c6407ea8814711405b66dbf08aaf31dc52706b03cf6000a3151712c89",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-sources.zip",
        sha256 = "8e1dd26aff38f23270f3467f215af00b0cbbcef6f91aec53cd7667a556f097a3",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-linuxarm32.zip",
        sha256 = "31ff22862531f150b1d7da897b2c362101aadf962e8507b59b663f4470194382",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-linuxarm64.zip",
        sha256 = "0bd98612d1b2836d9db537f74f6c6c32f893189218dae3de5974e70e3d1f1ad0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-linuxx86-64.zip",
        sha256 = "6b2d8cfa0761d6c16c9ca68ebc4af3abb500c8f16c24d5565c8fbb51db71f6fe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-osxuniversal.zip",
        sha256 = "653fc999b96c62b354c41a4214c07fedd7812c4aab02c0a92a34f1a7e86fa5df",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-windowsx86-64.zip",
        sha256 = "0a734e20037cd5b0e6e831587442d815fa2bf5ff3bc660d54e5e582fff567737",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-windowsarm64.zip",
        sha256 = "0b2dc3f82944612ad1e2d21939f79bb959eab3a3ded8fb9f53ed9af4b65a53cc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-linuxarm32static.zip",
        sha256 = "fdbb02b131e3e9f1be7681ea439dc311a3c02a3459b9722caba5d548c6d5aaea",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-linuxarm64static.zip",
        sha256 = "f55cb34c31e16284cae5b5aab2d8cb37bdd4435b7a8c0c7a500173113f8731da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-linuxx86-64static.zip",
        sha256 = "8ea2f4eba80f42a1c3ab2a658d6e8f90014ada1cfa575698a4598831d369bb74",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-osxuniversalstatic.zip",
        sha256 = "e1bb6befb1da0afb1c82ca9f6c059cbc394e6db5447f19ea24e6106a1799463a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-windowsx86-64static.zip",
        sha256 = "5ca6f4eb30243d81f4a3aef17b932ab5fe3429d47f907b08f192a2ad021bb0d5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-windowsarm64static.zip",
        sha256 = "cff6ea36d02df7027bb51bf60ac3b8128cde6eac82cd1b7b34f61ec135dfc6cf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-linuxarm32debug.zip",
        sha256 = "d78e06c3404d501cb77c754e0b5f4c8490d03298be1af9d964f53144a7d2ce14",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-linuxarm64debug.zip",
        sha256 = "a7b726fa8330f74e6d188c3eb9a8900175b1a5b9ff03ff9b3100940763dc8d3d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-linuxx86-64debug.zip",
        sha256 = "39ca7269699a306dced326fd938acb9083759c5b157a419a496f6c4e5704f836",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-osxuniversaldebug.zip",
        sha256 = "75e3fe8356a3009aa5a076990845ac9e7ee8265ca425173e611e751e6a238f28",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-windowsx86-64debug.zip",
        sha256 = "ec1f46010c6bf606fa4686445cdd9b166cb5d41f4e07959bff1344916c49a3ec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-windowsarm64debug.zip",
        sha256 = "be9f5233e5becdfcd1c553bddca3304844d1a60893ce46f0acfcd64f7b82eabc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-linuxarm32staticdebug.zip",
        sha256 = "adb2bb7aa59dd80b320dea0b8014989add152246b24826016fb1646a1a8f4a82",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-linuxarm64staticdebug.zip",
        sha256 = "e5368faa173ba43992286cf7c22defd529c7669fff6a556c48801facba27accb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-linuxx86-64staticdebug.zip",
        sha256 = "5651b246f80538ad4fa5a130e3a8de4c260f96d8c04a62367e63d97a541fb399",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-osxuniversalstaticdebug.zip",
        sha256 = "8edd1d59778dde7ab5c7b9c9bfb0916b2e21659ebfdb759f2887276904fd883c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-windowsx86-64staticdebug.zip",
        sha256 = "e3bab8acc27cb60bcd061b00022634c706c3a66ef1b72f42ca10a5d70a30eff6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-windowsarm64staticdebug.zip",
        sha256 = "5aebce398677306eeea39cbfc53c0a0cdbecee830baeb13ddd2176e03ec127cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-linuxathena.zip",
        sha256 = "cb1087ddc7c404b7af7c32f3f4248ba17d5f8cc70cf629a173c83d331b3aa552",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-linuxathenastatic.zip",
        sha256 = "ddbe9076a60fca25161229cf89f348277c1a174c58cf3db6446bac0bfd132d47",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-linuxathenadebug.zip",
        sha256 = "372350a1b87077e0fe7abf45e08d3c29378e5eac811fd2ed4cb50da1ac5a6883",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.2.1/ntcore-cpp-2025.2.1-linuxathenastaticdebug.zip",
        sha256 = "3207c3370370ce85214434e156bf36d921912eec99dfdc953d70eaed5e14a5f2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-headers.zip",
        sha256 = "fbdd5cd031a4c621631b6d33de276f0cdb4872ef9683ff9843f95ab174056dd8",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-sources.zip",
        sha256 = "1943857577163efb293382f2182460cc9156c7c82d2b906d2f68179b770bdef8",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-linuxarm32.zip",
        sha256 = "1e24c30176040fbfd782db7254cec2bc133fe1eb5717070bc954d12d75954dec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-linuxarm64.zip",
        sha256 = "0cba1cdd6edc5868544471963b02bcb8a315cfc45247ee10e60b8e35f248ca9f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-linuxx86-64.zip",
        sha256 = "9f73b6dfcba79ac1baee32ea126b7a8d18ce5ff6d9a392d254a8fdf9c69a86c4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-osxuniversal.zip",
        sha256 = "aeadecfc678db2cd8b2a64a680f8ee38f1e9cf79820f2d3760ef3a90eed73a05",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-windowsx86-64.zip",
        sha256 = "2ae8ed0e379ee44f6cf9912f5ac259fde1f3cbe24dd5c15cee56b2a66bab77f9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-windowsarm64.zip",
        sha256 = "f3b3d2e92bf502529dd9cfea027b9317f7111439d04e2c39200f1928ed69a9ea",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-linuxarm32static.zip",
        sha256 = "ade9306a4ede0251e5c186a1c4ad6127ee1a6ff23ce456e14afea1a660b7044d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-linuxarm64static.zip",
        sha256 = "3e8d6a3671538144e3c369f6b80e2ceda7962636701293f46e7dca66a2c3b279",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-linuxx86-64static.zip",
        sha256 = "c7332d746e1953f54f53a39efaa3b0afa361a8f2626d8f9797e85fb69dfb164f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-osxuniversalstatic.zip",
        sha256 = "a863e248e71a75ee573752e490c25f8679e8e90df90b1778e4dde8a54a0f4cd9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-windowsx86-64static.zip",
        sha256 = "40825128baf58ac9958c5c8eb060650378fe813d075f9adb2568fe587d2ab2ad",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-windowsarm64static.zip",
        sha256 = "4e1b167605cf5d3ab56539ad0e30645eaa9b82e0aca389409e0c228c50e16abf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-linuxarm32debug.zip",
        sha256 = "2687c006616f4957d6f65945788858b1779398e8d6c3c628cdece72bde3ec5c1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-linuxarm64debug.zip",
        sha256 = "b7f6b86ccb5e162b2ca7f9de7ffc534b23b0a343302363db2491433886c05fb5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-linuxx86-64debug.zip",
        sha256 = "eed8009acd7ce74e423bfbcf0edc422fd95e171aac0583c7731cbf55636ce33e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-osxuniversaldebug.zip",
        sha256 = "824e484f7e158cf4e8e9d33b78dccff043278c29732aeda425f1c9fa7a75382f",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-windowsx86-64debug.zip",
        sha256 = "1d5cc3ba8469d77bec72534491fac2930f0eda3eb7a58aa9cb9167915569eeb8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-windowsarm64debug.zip",
        sha256 = "8cf3ccfcb9b9eb06332a149d4fb3a4a81c27acb68f3ed2b9e835c1211ed3df2c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-linuxarm32staticdebug.zip",
        sha256 = "fe4d51bde6c056a0ca8c71bb17dd4372f6652b9b571f00ec0e8136292b5d1b44",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-linuxarm64staticdebug.zip",
        sha256 = "d216d8e685a04b4f8829b2012ddaa13ce818dea92f60cbd326fe160a4ff24c04",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-linuxx86-64staticdebug.zip",
        sha256 = "635d1d91e5e014cd686ad21569a8ca5530b4d90020d9a6f31d9dd358e4fdebea",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-osxuniversalstaticdebug.zip",
        sha256 = "ffe6e85176399724cbb2a74d5982ab43e0d97986a0397e278d98e9d34cca0d76",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-windowsx86-64staticdebug.zip",
        sha256 = "1646fe956ca2b24af480a6e96c1fd946a30b70ab4be3dbc8077d28ab9a35d749",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-windowsarm64staticdebug.zip",
        sha256 = "64b6cd8accc8221a5567559c91d8d844388f9a866afa29fb6ae858514ae13cde",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-linuxathena.zip",
        sha256 = "338816afe1b177c514bfdb5df8cab41e833eebe0264542045b94b86c36bb3080",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-linuxathenastatic.zip",
        sha256 = "e9f5388b90888f0d71669405117efc51a2819f7d57276fbf6adc827178e805d4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-linuxathenadebug.zip",
        sha256 = "fd18f5fdda74ab088da38421e4bcc65fe6662a0b636e621f59b0330f0a7a8321",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.2.1/cscore-cpp-2025.2.1-linuxathenastaticdebug.zip",
        sha256 = "1fc7009cec6791d37ecf260bf7468ff778a3923a8ee77f1ac0e2336a991b1069",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-headers.zip",
        sha256 = "84926267988117f5d92e1a73ec11772686bf4fe12fb76f021ec3511848480ee9",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-sources.zip",
        sha256 = "70ed40d9a2b491f266c5d7da1bc9a0d1f2a46fd2a01b73800fb69a359a694ad1",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-linuxarm32.zip",
        sha256 = "7ef9ed00792315f964704b1538ed67840506b100c77491321cf6396f58138000",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-linuxarm64.zip",
        sha256 = "ff31d4c784dcfb172346566c345562fa7f60adeadda0df2dfb2dd0dee8c91c50",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-linuxx86-64.zip",
        sha256 = "5c67adcd780f99d61a0875de4f18c6b98689ec9c3bc45c7e957e62aa875c785d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-osxuniversal.zip",
        sha256 = "2609cc49c6afc559a06a08b86fee2d65025a202261308eea47de7938c1d4f766",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-windowsx86-64.zip",
        sha256 = "e157508fdc69f8fa632b8d841bac6b09dc1e913fd65044a3a66fd807c81177ae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-windowsarm64.zip",
        sha256 = "3ebbe062206e71a67473138aad27ea5b6f442608f4d2a4df2724463a6029cbb8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-linuxarm32static.zip",
        sha256 = "4486593c6aaa038f384e72a7dbf297951add48f3bd1e0b19bf603b62a795f5be",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-linuxarm64static.zip",
        sha256 = "3e8d70464dc51d22f7f6c4077e8f79d9935ef9c54f9f6b465308617f4edef56d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-linuxx86-64static.zip",
        sha256 = "c48be99b8f61387fddf247cd0d06c3cbe37d53688f8af38e3363863bafc1c2bd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-osxuniversalstatic.zip",
        sha256 = "8717f455660ad4538a216c09515b743cf21551ab181e3ceca8a826cd3998513a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-windowsx86-64static.zip",
        sha256 = "95b87a1b80e3159b7c27c98d888cff3a7da7ec2de2482d832174c7ad6606bce8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-windowsarm64static.zip",
        sha256 = "ec5b6a62e7d831fd5c86992d493980840e485d4f6361292395860623529967af",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-linuxarm32debug.zip",
        sha256 = "d141d244e1a48f21c095ab825b082146151986882e246c9f609f871760210269",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-linuxarm64debug.zip",
        sha256 = "b499155c6ad40dffe772efe70294e5deb1fcb26993c254e44c562a2cf3d7dde1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-linuxx86-64debug.zip",
        sha256 = "ae976806bac9299cb12cbc76576ec4333dfd869ecabf2d5a5ad97b9dfc69956a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-osxuniversaldebug.zip",
        sha256 = "f8af8ce554693db11414a62a41de1080b520274e84ff64767a8633a4929d9e21",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-windowsx86-64debug.zip",
        sha256 = "60e3eb4720774325f53b06d0bec2c1b8b3cfd5343520c51ae76795aff907969a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-windowsarm64debug.zip",
        sha256 = "d328882c46cadbd263ba7fe8ef75678e92eb7b9858a55325fa178a28c684f738",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-linuxarm32staticdebug.zip",
        sha256 = "0713d83874bb4f1b60e14c11ea6ad2065058a00b7db920d613719c64690a7c35",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-linuxarm64staticdebug.zip",
        sha256 = "5e6d97da1a38608908882091e551c73d19175252bdb4f061ac43e43859d78a4b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-linuxx86-64staticdebug.zip",
        sha256 = "22bc135cae946cfe8a8edf0f79d789d6d68afc6779fe17b25ea9adeb3490c939",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-osxuniversalstaticdebug.zip",
        sha256 = "05469a97241f5fd7b552c4558ab2dcd172250f7c80edfe105d56666e218fd6f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-windowsx86-64staticdebug.zip",
        sha256 = "411fb775a75f27e20458885f61c0988298475ef79b63a0552420c966008eda4f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-windowsarm64staticdebug.zip",
        sha256 = "76bd90ee62d5b8bdf159e0ecb2b1052d35703845538004e26254bb35e77ce005",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-linuxathena.zip",
        sha256 = "a72f8ddc7d0a994253e7266a9a7cbf47c38b6db87a35ce25cc16a37fbc89830e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-linuxathenastatic.zip",
        sha256 = "13280eb788d84c146eb3d5b1e609025043be4291f6bf176722892186c7675584",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-linuxathenadebug.zip",
        sha256 = "80083b3da529dc237d08626a141b4db0067e943a1c33830c02926fb6a04e5a08",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.2.1/cameraserver-cpp-2025.2.1-linuxathenastaticdebug.zip",
        sha256 = "30563bc5123b78726318047db54a9ae283fe2bb4eca770d16dc384f4b5d751ef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-headers.zip",
        sha256 = "3055e43796fcc4d2a92eb359b97e2fa57c9c3a1c7007163a5afb8bba093ea4de",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-sources.zip",
        sha256 = "b702bb6a7b54d19e04415bf5e315a1b65d4c2372c702b75e1d85ef55b39bae1a",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-linuxarm32.zip",
        sha256 = "f451d538fb35d2d57ccdf4baac889b64890d1a4643f3863a9f57e1c4868030e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-linuxarm64.zip",
        sha256 = "c1a892b709c9029dc8951bfc18e5f28c7a611f0990f1c50b22a63dd97a00a8c2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-linuxx86-64.zip",
        sha256 = "9af47b1259da6ae6cd3ea0b766e39692137cd1362651f1bcf99aad9dc5899570",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-osxuniversal.zip",
        sha256 = "dd7c18b82aa48887cfc61794518a532484dc712f0300113ac1688c32cf8e76ca",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-windowsx86-64.zip",
        sha256 = "0797f1645fc92adcf76898134f3a3df394cc5bf86a913a4ba6462fbc034c1fb9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-windowsarm64.zip",
        sha256 = "502a544b8f51f839c81b9bb360a7c0aad8cf22c01a0e74bf19dca51ef0886e00",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-linuxarm32static.zip",
        sha256 = "d882b1a46f304998e1ab06fd5a5b04418d70342e41eea4e19fffaa414ec9ded7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-linuxarm64static.zip",
        sha256 = "452c3f53439b09594fbd4ea9388321eba010c0bde740b943449552728a50ab1f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-linuxx86-64static.zip",
        sha256 = "ace3ee184b81584ab69b64e2b72f9530d207031d02ae7e981b2cee21686cfbfb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-osxuniversalstatic.zip",
        sha256 = "af1a285cb0d3e8754a50a8271957bc6fcfb3e256e6920fec02d5a256bd8892e9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-windowsx86-64static.zip",
        sha256 = "a7b2586b91271dd18f312a72a60fb8f6a77e9b8c566305aef9129a2289dac00b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-windowsarm64static.zip",
        sha256 = "2c82f62fccc713029d65f84d61b56820609997d532c6aae58bbb287fbb86806c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-linuxarm32debug.zip",
        sha256 = "145a5607c2a448e849ec7511695cb12735d1b4b6e896438da690950cdf174a21",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-linuxarm64debug.zip",
        sha256 = "50766bdd6e6bb9209665f8bdaca75cb5a9e0cd3a7cb0dde09997b0d44a8601a4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-linuxx86-64debug.zip",
        sha256 = "046054da47a67540d6d2e5c8d4c40c718e3b84c1eb9d4c87c6e75e4754a4dc17",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-osxuniversaldebug.zip",
        sha256 = "3aa70e78d99633cab15f14c5e8515a7658f08e4a2744e5af9132fb3d932b0954",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-windowsx86-64debug.zip",
        sha256 = "7fca130cca8010e6a7276ec1862557f59e44971516ece087bfdd3f3ac99f1d01",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-windowsarm64debug.zip",
        sha256 = "0ab202de7126ea555306d155213a0aa1a2ffc1ffe5d2fe233607ee912ff34e6c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-linuxarm32staticdebug.zip",
        sha256 = "d992f172905d543fbde4f3e9bdfd79ec44712730cf82c7c8d853f2b253afdfc4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-linuxarm64staticdebug.zip",
        sha256 = "71320683cd5a0ff81a080eb9c32b523a088355e860ef51c6e399d22f6260b562",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-linuxx86-64staticdebug.zip",
        sha256 = "214f3b6d24c61d7815c937e1ab9fd9fd7be4bb653d14c23781d2f50ce1dea7b6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-osxuniversalstaticdebug.zip",
        sha256 = "fcc69f9028e1655e488fb990d38bb538c1986171c859f1e160023ebc380ac7de",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-windowsx86-64staticdebug.zip",
        sha256 = "b79af3a25305ef76173b5f668fd0af877264c8353658a678acb2f05eb3c497cc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-windowsarm64staticdebug.zip",
        sha256 = "a961edbc30b23f6635e64ad204fe0e3c76a269988b5f270b3ff37157a5fdb578",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-linuxathena.zip",
        sha256 = "07902b8255a9992563513258ead8e787901ce6ef1d81a4a9295d62f0b66a801d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-linuxathenastatic.zip",
        sha256 = "4b4e432c669e540ae13f8be131fd3d7e0e9a9c97f9c2b8c4a68883be212a0c4e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-linuxathenadebug.zip",
        sha256 = "c5a559bf73db409d1d4bad6a9395b1768d8c7d9a38dad3b11a1b7c71ac6d7b22",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.2.1/wpilibc-cpp-2025.2.1-linuxathenastaticdebug.zip",
        sha256 = "eb720c9ff2da28861c84e48a334e8687f790a9e688eee05e17f44cac03821e86",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-headers.zip",
        sha256 = "4bb85a4c07257d1748cebe74a1114ab7906309570cf7eac3f77f3f6c4d76872c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-sources.zip",
        sha256 = "dc4e219523867f582e614ee9adfc31297ccda2b83c35e32467a4ab6def9ed679",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-linuxarm32.zip",
        sha256 = "a7218000caca446a470ecfc1aa2aac7b39f8342c84a1a380f7703854027637b5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-linuxarm64.zip",
        sha256 = "f728751fe4d72dbe525bcead565d796d8dabae8305249c0337e6be43859f7aed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-linuxx86-64.zip",
        sha256 = "ba98e92ae6e3081dcf79ad288db090f544880f85890f5346f66d909e415fb0f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-osxuniversal.zip",
        sha256 = "39e5e6bfab9ca41af2883519cf2213e11fa2ff616c7ea1235720aca73a27185e",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-windowsx86-64.zip",
        sha256 = "77ff3d1fb6b36c282e79f135264f6d5ca53fcbb28580407132a68db430ccf62b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-windowsarm64.zip",
        sha256 = "9f5b432787d6e2d86cc1830f66bb0c6a1faf64a486fd1b84cf37e345a2bc042c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-linuxarm32static.zip",
        sha256 = "88b40e8a317b0e35e21d541ad531f259af22b6f0f63abe9e4d8eb6f4b9ee5880",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-linuxarm64static.zip",
        sha256 = "26a3739e8860a25ed3c297dab9c4bbc1c5ffd94afb88b53863bbc1660117a3b7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-linuxx86-64static.zip",
        sha256 = "73341cdbedf1e73eeae80195c08751eddc3763a3702e15e7e1907b37b5e9fc68",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-osxuniversalstatic.zip",
        sha256 = "8812597d6aa1e855c66cd3f8be960931946a08843f7f5308143fdb129756e023",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-windowsx86-64static.zip",
        sha256 = "88a998872ef95798f44d7f37bd25603dddf2a021b8c077610c861d9eada28d79",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-windowsarm64static.zip",
        sha256 = "e80536e02b5d56529361ab5f75eff27c82e79790e242aab2f368166d9f47df78",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-linuxarm32debug.zip",
        sha256 = "cf57c502272dbce29a73a02189e198c700cfe06f96e0a8308e25c941ca97ba82",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-linuxarm64debug.zip",
        sha256 = "7a90c6395e7eb211af8fa2f02ffe7c01acffe62bcf193271f0e2b620a4f0ca2c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-linuxx86-64debug.zip",
        sha256 = "d0a7fcbe72c9e35996954814f7d2482361430adacac1eb7773027ca1cbaebd3c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-osxuniversaldebug.zip",
        sha256 = "de26c3f26e03c2522c886884806f1ba2f756aa38817b9998fd08caed3cddcdd8",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-windowsx86-64debug.zip",
        sha256 = "460ee7a4803d598577b4d094a3e2d1a0affa8e8c3168ffaa62aedd0b351c1bdd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-windowsarm64debug.zip",
        sha256 = "41bd577f5ca0b480550e7fddb6666cbc636f8316c4700f40b8c34253b2a40e80",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-linuxarm32staticdebug.zip",
        sha256 = "d6e1271fdab4d02f3b9313b85ce95f1db1f30817bc0b00c32bbcfb352269b1d8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-linuxarm64staticdebug.zip",
        sha256 = "11688f60ea0881871a4ee0fc955991735ebbe1583601eae1d8eb13d973fe21d6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-linuxx86-64staticdebug.zip",
        sha256 = "650149f08a1f721ab6d1fa646b06a9d2b9f368c2e25e4e36b18a53f0d7341d60",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-osxuniversalstaticdebug.zip",
        sha256 = "95b383f5843083ce328e1e1f57eda7b1cafbe4555b6aa9d3e875268b94a5a4db",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-windowsx86-64staticdebug.zip",
        sha256 = "e5780c847f3e9d19ab957a527c86927ac4f2a9999d7e9baef17a09f3d5984216",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-windowsarm64staticdebug.zip",
        sha256 = "210c994b80fba969c8fa09f53e577cf09da5fb46b589246e28da9a5ee2ae98d2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-linuxathena.zip",
        sha256 = "2f6a0bb167fec2acaa5c207a231d416f39bb98b4648bb87caaa11689b9f14cff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-linuxathenastatic.zip",
        sha256 = "e2e363af87935939869204a3cadca84725938b31f5f8407156f972740db4b658",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-linuxathenadebug.zip",
        sha256 = "3d3e0e661fb913854ed494ec66575d3e7d334a6ae9a671dd491f7890daa9c870",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.2.1/wpilibNewCommands-cpp-2025.2.1-linuxathenastaticdebug.zip",
        sha256 = "9e61f6a857b71573c3a9630bee121bef062441958e3b0cf8a337325a6b2990f0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.2.1/halsim_ds_socket-2025.2.1-sources.zip",
        sha256 = "5560789e347433fb6144850bfb86c93140351201cc766b6ac8badf20e74bc6f5",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.2.1/halsim_ds_socket-2025.2.1-linuxarm32.zip",
        sha256 = "2fb4e6183db297926c5089beb5fa4a54e7e1dbd5ac9ad836868c5bdde1d09b05",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.2.1/halsim_ds_socket-2025.2.1-linuxarm64.zip",
        sha256 = "1391e52168578c1c4e5a796c27467606e13ea98723c796c8bea465a4be21bc00",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.2.1/halsim_ds_socket-2025.2.1-linuxx86-64.zip",
        sha256 = "1d47dda229850e9cc9aeefe3ccb0a2eae96bb720d0b87d28fcb83c58b6dede23",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.2.1/halsim_ds_socket-2025.2.1-osxuniversal.zip",
        sha256 = "c527dff4f9c5a2acd07b749f54c2061b39e60b22a9abd879e6a4191b3a3100cb",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.2.1/halsim_ds_socket-2025.2.1-windowsx86-64.zip",
        sha256 = "6b66bfd62daef69c8b49edb82baf9e5c2b6cca7ac7bc1014d61298818b3c6596",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.2.1/halsim_ds_socket-2025.2.1-windowsarm64.zip",
        sha256 = "9b7ff9318912e35f150bc5517e7f91d9f5148a718ee7195648f1ee2a2e881f64",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.2.1/halsim_ds_socket-2025.2.1-linuxarm32static.zip",
        sha256 = "a7b64bf9e4e61c458fd87b845885e158e5f6141dd896b6e11916912f7457c825",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.2.1/halsim_ds_socket-2025.2.1-linuxarm64static.zip",
        sha256 = "d6d914b32c40227e6d5f45f29647b28b0e3746adddfba64e40406759c400a501",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.2.1/halsim_ds_socket-2025.2.1-linuxx86-64static.zip",
        sha256 = "c0fd33afbd48b126e830da5f74bb9abc66b4b5a3353219d48f552c13e8929de1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.2.1/halsim_ds_socket-2025.2.1-osxuniversalstatic.zip",
        sha256 = "73425cac742429df1bbb1254289bc3b3eb97dfab7f3a0eb4e8d9f540d59a5299",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.2.1/halsim_ds_socket-2025.2.1-windowsx86-64static.zip",
        sha256 = "4884c8c547b0c255ed9dd6a4bfb5688ca5f98d021ffa3745d35453361a6fd51d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.2.1/halsim_ds_socket-2025.2.1-windowsarm64static.zip",
        sha256 = "60df3466e5c1b56fcd10421cac73de74f35474a941550217d2f4125b01e2af1b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.2.1/halsim_ds_socket-2025.2.1-linuxarm32debug.zip",
        sha256 = "8bb1471dd806285879cb4d1b1846bc1603834eb76c490d503cde115014313193",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.2.1/halsim_ds_socket-2025.2.1-linuxarm64debug.zip",
        sha256 = "c926f52935368608467ba3329b0c3296197b989f695db029aafdb340448c2df3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.2.1/halsim_ds_socket-2025.2.1-linuxx86-64debug.zip",
        sha256 = "72d4ea033455dd1c035f74a9a6ee9a820de2a50823ab4ae0ded81edea4c1bf67",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.2.1/halsim_ds_socket-2025.2.1-osxuniversaldebug.zip",
        sha256 = "2a53ecde644b5aea651d8c942c6f32bed2de5166976b168032240f9547ac14f6",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.2.1/halsim_ds_socket-2025.2.1-windowsx86-64debug.zip",
        sha256 = "306b5ddc017249873175bd33cc6973b3e4cd7e2d4bfd38790432e7a4e62e61d0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.2.1/halsim_ds_socket-2025.2.1-windowsarm64debug.zip",
        sha256 = "21efa0875bd95c2bf0f58d45b8610e3bd5bb3f449aa5544026955a963eb50132",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.2.1/halsim_ds_socket-2025.2.1-linuxarm32staticdebug.zip",
        sha256 = "542c5bd223751c7dc80ad033c96ff2ee701bf2bb0b26be9621b2b5bff2570c18",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.2.1/halsim_ds_socket-2025.2.1-linuxarm64staticdebug.zip",
        sha256 = "6c849d3b6c8938c3b494407815bfd9c96c024701d69d3253d6f0980664ebaf2e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.2.1/halsim_ds_socket-2025.2.1-linuxx86-64staticdebug.zip",
        sha256 = "70c1a2d8154dc492ce5088d18e4fe451c8432e710c132c9ee6c8550ede0d2521",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.2.1/halsim_ds_socket-2025.2.1-osxuniversalstaticdebug.zip",
        sha256 = "887781b02737671c6f8b37cffe4dd62961c2abc682bc38232fe32afa8f6a4890",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.2.1/halsim_ds_socket-2025.2.1-windowsx86-64staticdebug.zip",
        sha256 = "18737df489f0d0e10d9912d9bafdfd02b61e3148f84a2b7dbd9edced2eecf657",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.2.1/halsim_ds_socket-2025.2.1-windowsarm64staticdebug.zip",
        sha256 = "2f002afc048a2f82ce90be4ad970ea3f3779666dc0591da182fc7f758b50cf6d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.2.1/halsim_gui-2025.2.1-sources.zip",
        sha256 = "255b6f2d9ee8c000661dc826c154438e2d970233aa2cebaef11f8a0c92f96dea",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.2.1/halsim_gui-2025.2.1-linuxarm32.zip",
        sha256 = "c79df75bf1a7b95f5530bd5d4f2f45d447315d0d24bad4f526d9806e81f8ea86",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.2.1/halsim_gui-2025.2.1-linuxarm64.zip",
        sha256 = "d2aecf8b2a3c6b4ff890008501241f8327cfdf103b8de1d0b4cb66cb3ef7dcab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.2.1/halsim_gui-2025.2.1-linuxx86-64.zip",
        sha256 = "2b74eef95530c773cbf7f88fe6ecbd62878a60beb4fa67b635a5c1e567283d72",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.2.1/halsim_gui-2025.2.1-osxuniversal.zip",
        sha256 = "69e08869e8e52400c5c21a220b6830a30be0a5b24250e1db9a03b0fe7dd009a4",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.2.1/halsim_gui-2025.2.1-windowsx86-64.zip",
        sha256 = "2a2f141c4cbb585d031f48630164ace2b153b7fd7e358eb0cf7c35abaadf078c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.2.1/halsim_gui-2025.2.1-windowsarm64.zip",
        sha256 = "2d673f2d4c9e1efd2cd1dbca75ea4560d6bb782162b8c36a0d0b302cebf0be09",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.2.1/halsim_gui-2025.2.1-linuxarm32static.zip",
        sha256 = "b639c3371316ad1c5e8e65f51ccd58936c693ba36c2f4471032ea60e8c7fb39b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.2.1/halsim_gui-2025.2.1-linuxarm64static.zip",
        sha256 = "7f808651d903ebb6c3b30bb95fd922ffefe205fcb5b0d7ab80d461470aae0251",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.2.1/halsim_gui-2025.2.1-linuxx86-64static.zip",
        sha256 = "c60f1d089a322f95c226cc8e9636c4d9274a095f2b49dc1483aa72a45cb5dbfb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.2.1/halsim_gui-2025.2.1-osxuniversalstatic.zip",
        sha256 = "fc0f564353b419a37d579195a7a19f0db3843a650a18f57bc16839772c81d021",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.2.1/halsim_gui-2025.2.1-windowsx86-64static.zip",
        sha256 = "27aa282fe011af67fbb1113011738817226b3218c54704b0cf6942502c94aace",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.2.1/halsim_gui-2025.2.1-windowsarm64static.zip",
        sha256 = "5cda558e5c7eb4b6004f06f3b51143c9c4203292749bef26618dbc1649af4c04",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.2.1/halsim_gui-2025.2.1-linuxarm32debug.zip",
        sha256 = "2b554ebabca7d4603eb71b0584170da495c404985bcfada00733c732e216248a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.2.1/halsim_gui-2025.2.1-linuxarm64debug.zip",
        sha256 = "1426dea119bb5ab5b5bb7c1878ac02cfaf331dd4c92e50fa1b79c45cc96adea7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.2.1/halsim_gui-2025.2.1-linuxx86-64debug.zip",
        sha256 = "b6809e22534d68315207549cd4439faaa88f072045e728f23bf51366f21dfffa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.2.1/halsim_gui-2025.2.1-osxuniversaldebug.zip",
        sha256 = "0f3109dcf5be581809081183d582a94fa4cb12bf8d0073a7984ee78029deff92",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.2.1/halsim_gui-2025.2.1-windowsx86-64debug.zip",
        sha256 = "c097ed186de155febbd285bc2061554ba9b192b62c8d812dff59e01d0b9b061a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.2.1/halsim_gui-2025.2.1-windowsarm64debug.zip",
        sha256 = "0f5bad9b44e1ccfd36f513dc1251e1bc841c47439d634f56ced28ce90b416db4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.2.1/halsim_gui-2025.2.1-linuxarm32staticdebug.zip",
        sha256 = "ad21ba803c5cbb8bb8d1ec94aaaa8b3dae4fc2303db0f548e4aec62091b72a70",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.2.1/halsim_gui-2025.2.1-linuxarm64staticdebug.zip",
        sha256 = "47a5fdaabc5f51051da28c1c15b4e56c1b4961908db5385e860cc16b87ce88b9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.2.1/halsim_gui-2025.2.1-linuxx86-64staticdebug.zip",
        sha256 = "5551ba7035637332fd34a7a09896052b2904c50ea2d630b5cee364846ea13289",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.2.1/halsim_gui-2025.2.1-osxuniversalstaticdebug.zip",
        sha256 = "c4c1870b4cc5fd6e4a29fecb732159c9f2987685927543c7d6e16d0e6106107b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.2.1/halsim_gui-2025.2.1-windowsx86-64staticdebug.zip",
        sha256 = "a46e565ee9ca6829199e91892107a8e1c12ba6ad31b4cc94e50b6e5e9c0e09b0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.2.1/halsim_gui-2025.2.1-windowsarm64staticdebug.zip",
        sha256 = "8fcf2b6f6630bd29baea0e25788f3603eced536d788189a84a11b3587c3afe13",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.2.1/halsim_ws_client-2025.2.1-sources.zip",
        sha256 = "58dd8ed231eeb309833ae212a5acf5547af5ec0fdbe3d76b7bbb35294e14017b",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.2.1/halsim_ws_client-2025.2.1-linuxarm32.zip",
        sha256 = "6a86cab09a36ea56c2b66d44a6201fb0cb2733bf941ea363899d2b4816f82a04",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.2.1/halsim_ws_client-2025.2.1-linuxarm64.zip",
        sha256 = "7d6476885dc0356f368050bc50806b92dcc0b689c15089a2b333b21634c9b15c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.2.1/halsim_ws_client-2025.2.1-linuxx86-64.zip",
        sha256 = "80eb566266205a30e70ee52663916bb3aa740c102d54b5557b6a0dbcff976c3d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.2.1/halsim_ws_client-2025.2.1-osxuniversal.zip",
        sha256 = "1778d027d5c043ca865314a1cb299ffa2fabb732cb4e4e904d6c542ac7660231",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.2.1/halsim_ws_client-2025.2.1-windowsx86-64.zip",
        sha256 = "8188491821ae965522e16a88ae5cf27bfab3de2d816ead8eff49e3ce3d872ab0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.2.1/halsim_ws_client-2025.2.1-windowsarm64.zip",
        sha256 = "bfbe017b9b8bfa6ae2aa67d89b6ee98f8ab95c47fdbf84f868851d73405bbe04",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.2.1/halsim_ws_client-2025.2.1-linuxarm32static.zip",
        sha256 = "568ef6ceaefea6ea1a45b3777e61a32f6821ca131bb35b5bb90fc5c9d2f44223",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.2.1/halsim_ws_client-2025.2.1-linuxarm64static.zip",
        sha256 = "14457b38b1889f8cffcc0e010a44267ae42a3d7e3e89c616ebec1826adb4b1f8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.2.1/halsim_ws_client-2025.2.1-linuxx86-64static.zip",
        sha256 = "73af9ee6a16e99a5151968ea0b3387f7d20f0c2aeecc920c878ab9ba35222aec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.2.1/halsim_ws_client-2025.2.1-osxuniversalstatic.zip",
        sha256 = "eb2758f1502f88352fe3cdf6582384f4b1d353a19a7958f4c3ea2b065a182232",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.2.1/halsim_ws_client-2025.2.1-windowsx86-64static.zip",
        sha256 = "e4e8ab157b28b451ce66e4f307e88c139b5947e54caaecf050e1b5b463e924b0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.2.1/halsim_ws_client-2025.2.1-windowsarm64static.zip",
        sha256 = "a4f295b2648ac5262cf399336edee4e001b3a1c9927b16301a4893f5c1a58a6b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.2.1/halsim_ws_client-2025.2.1-linuxarm32debug.zip",
        sha256 = "a5615c2094b16ea728c389df7653deceb7f7e14d9984662c8c6025457947699e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.2.1/halsim_ws_client-2025.2.1-linuxarm64debug.zip",
        sha256 = "ee5ae4ab2dfc04d94483cbdcabbc99178fe381a7719d96943f8348427479e738",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.2.1/halsim_ws_client-2025.2.1-linuxx86-64debug.zip",
        sha256 = "92136c23249fd24d830bb68c6c28760c949997cf758e162e639e18f4cbcd08b0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.2.1/halsim_ws_client-2025.2.1-osxuniversaldebug.zip",
        sha256 = "739e84c655a32c2607fae4841c0e5232e99525460662a655de653afe07aeea81",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.2.1/halsim_ws_client-2025.2.1-windowsx86-64debug.zip",
        sha256 = "d644561d3fcd35a962f042856fb9c31a00a1ab7e8f6cc278de55289117143b46",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.2.1/halsim_ws_client-2025.2.1-windowsarm64debug.zip",
        sha256 = "74b28eec2091612db34b18f4821cb1611ba99bfb2042f4ca3995262c6972a607",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.2.1/halsim_ws_client-2025.2.1-linuxarm32staticdebug.zip",
        sha256 = "1b8d31b0d32296be79d8cd719b6e8b169b98b7268b90acba7fa569b11c63fec5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.2.1/halsim_ws_client-2025.2.1-linuxarm64staticdebug.zip",
        sha256 = "a8103f56d5910e362e51c2ac8669cd02e981dc58657eca54e455c542af265520",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.2.1/halsim_ws_client-2025.2.1-linuxx86-64staticdebug.zip",
        sha256 = "7327a6fb0445eecceec8abe5d0e31ee90c0f0c37ba94762aba6be647608b84ce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.2.1/halsim_ws_client-2025.2.1-osxuniversalstaticdebug.zip",
        sha256 = "8fa5e80443f394980656bc7d841de01c1e3bd21689859b3fdd0e1bb259df06f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.2.1/halsim_ws_client-2025.2.1-windowsx86-64staticdebug.zip",
        sha256 = "a15f4df58b7c34588937b2690e1a7f26269e916f26b228c3f1db2f6b9808de2c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.2.1/halsim_ws_client-2025.2.1-windowsarm64staticdebug.zip",
        sha256 = "8cf630061a15f3e61be51df066b716072e5fba48414afbe5883184c18a608d7f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.2.1/halsim_ws_server-2025.2.1-sources.zip",
        sha256 = "ba79c009d8085fac1a1f17709c6a9ee1d4003a828816ea259af82151765177b9",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.2.1/halsim_ws_server-2025.2.1-linuxarm32.zip",
        sha256 = "9e549690d995cd8c901ba6048049d1d02324ba12c080fe01488291f4166b0206",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.2.1/halsim_ws_server-2025.2.1-linuxarm64.zip",
        sha256 = "69cc7a4f34e2ffc93380392b4a7d6edc123798abb51b73288672a02b0fa13c4b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.2.1/halsim_ws_server-2025.2.1-linuxx86-64.zip",
        sha256 = "b58025aea09e85256116eb625d24f0a70afb72c076209e0947ae8f36f641881c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.2.1/halsim_ws_server-2025.2.1-osxuniversal.zip",
        sha256 = "133ba0317a11604762fc45048afce732390fae0f91f394e85e955ecc80ef27f1",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.2.1/halsim_ws_server-2025.2.1-windowsx86-64.zip",
        sha256 = "bc061ceac0dcd0f465fc801cf6c302811f0e151f5ab6ae89e1dc985f5adb079c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.2.1/halsim_ws_server-2025.2.1-windowsarm64.zip",
        sha256 = "a507baf7a5455bb8659a34fd7a825747cd34c43acaa5535d7148dec4626e984d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.2.1/halsim_ws_server-2025.2.1-linuxarm32static.zip",
        sha256 = "b466734ebf0536f1b41da62ac43bcfb8aabc0469f0cb212cad79f29becc4d390",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.2.1/halsim_ws_server-2025.2.1-linuxarm64static.zip",
        sha256 = "84c483ac9d602d78613ce8e94223f2458ec3026776b40467e7b54072ee84f5c4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.2.1/halsim_ws_server-2025.2.1-linuxx86-64static.zip",
        sha256 = "040b6f18243c03dd106b71bbef4f06a63ccf612077699cb3ac4494a8c7c7355c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.2.1/halsim_ws_server-2025.2.1-osxuniversalstatic.zip",
        sha256 = "83967f44e84b384562c2b69353bd7675a62305e8f9912218b7aaab7111621389",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.2.1/halsim_ws_server-2025.2.1-windowsx86-64static.zip",
        sha256 = "3f86c3ca8259f2da5e3e0b18030d159172e444669d5ea77d02931e11f3bd5d26",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.2.1/halsim_ws_server-2025.2.1-windowsarm64static.zip",
        sha256 = "f00621a6282af7f21e416f77b65e27ef5a0aab108584c808be2298b071edd533",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.2.1/halsim_ws_server-2025.2.1-linuxarm32debug.zip",
        sha256 = "f9fd31a7a46efb79ea644d9c9ccecd7fb913db700959614fe5682050a1daf0de",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.2.1/halsim_ws_server-2025.2.1-linuxarm64debug.zip",
        sha256 = "23dfca0cc051fd35ea3e0ffc3ef0269dd8b2029753065374cd5e9a918e7181c5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.2.1/halsim_ws_server-2025.2.1-linuxx86-64debug.zip",
        sha256 = "3f6e3728273be5ec38a6b9f307ec51a0f28418b7947328b6fc66bba04d8f596b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.2.1/halsim_ws_server-2025.2.1-osxuniversaldebug.zip",
        sha256 = "b2682896cfba5ab433e2bb57ce628485f36c96c2d3b44f0490e60f9b40db8687",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.2.1/halsim_ws_server-2025.2.1-windowsx86-64debug.zip",
        sha256 = "9061f151fd41dd7b18476de68c4b20f4a9911c84983d63a8bdddcf9476018922",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.2.1/halsim_ws_server-2025.2.1-windowsarm64debug.zip",
        sha256 = "42004d85c45dbcc2ea567740a8f0df7821d7d4334525ebea81957c07065f5512",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.2.1/halsim_ws_server-2025.2.1-linuxarm32staticdebug.zip",
        sha256 = "03b1ebd3d7333709fb2bf35639d6a2497e4363599fb03ed913a1b7c0448cc3ba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.2.1/halsim_ws_server-2025.2.1-linuxarm64staticdebug.zip",
        sha256 = "e1cf0dc0a998c5f7a93838329f89356398bcec9f1d3e1b19fac4069ae4634408",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.2.1/halsim_ws_server-2025.2.1-linuxx86-64staticdebug.zip",
        sha256 = "c907a698eccee93bf80aa078f82265d99977b121d0ca0bd6179ce0269b51ba1c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.2.1/halsim_ws_server-2025.2.1-osxuniversalstaticdebug.zip",
        sha256 = "e87d40633af49d42d5628660e2109c3aab84b15a2146b411649606564b5d6066",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.2.1/halsim_ws_server-2025.2.1-windowsx86-64staticdebug.zip",
        sha256 = "b7af29e04b66218f7deefc8e69e20cc61efb2bbd45755706de4fc726f6caa7a1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.2.1/halsim_ws_server-2025.2.1-windowsarm64staticdebug.zip",
        sha256 = "a3c745d7e4f40d7c8cc9cd27ae12f0bb9dfcebb59ac43910a3cb334e65e925f9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2025.2.1/SmartDashboard-2025.2.1-linuxx64.jar",
        sha256 = "33a3888564d0eb1b19dcd36b61a485ad11e9f193e41cc118d6a6b725c899a6ee",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2025.2.1/SmartDashboard-2025.2.1-macx64.jar",
        sha256 = "ae4eea6bdf016c93a089c0f481112198735d6a6392ef3213c1ce15d4b98806d1",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2025.2.1/SmartDashboard-2025.2.1-winx64.jar",
        sha256 = "7d7651be270d7bc82298a4e8f54fd91a979bad879c908d1f7a19708a0082e57a",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.2.1/PathWeaver-2025.2.1-linuxarm32.jar",
        sha256 = "b54fe2121f72ba3b7bc0538d5ddeb9dc1770eafb04c9c601d0844a348e4d24db",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.2.1/PathWeaver-2025.2.1-linuxarm64.jar",
        sha256 = "7d3475d123c6eac227db9a4c525793de197b07b9ffab0096cdbe29a8ad06b784",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.2.1/PathWeaver-2025.2.1-linuxx64.jar",
        sha256 = "1cdc1e2634d138b53a9b4812496eb357008863f7d6ee7c8e99026664d1ab0640",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.2.1/PathWeaver-2025.2.1-macx64.jar",
        sha256 = "6d35989edb275c8f8f8f2cc5ba416e2f9b24348814cb9c60ec576ab90a9c9bd9",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.2.1/PathWeaver-2025.2.1-winx64.jar",
        sha256 = "a9fdf69e10d567ec0d1121271e0d546236c159a5618931cd7d526ac37bda246a",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2025.2.1/RobotBuilder-2025.2.1.jar",
        sha256 = "d86faf7f8f60a9062a9264c39741a8402610757a3d3a7cde265599fae9d6edd0",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.2.1/Shuffleboard-2025.2.1-linuxarm32.jar",
        sha256 = "ade0ec8eaba8ee81d3d87749c0495d252aeb1fc01f6fe0d47057a959c49d60dc",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.2.1/Shuffleboard-2025.2.1-linuxarm64.jar",
        sha256 = "15ad9c641d46354b7ddab2ae937ffb59a3cafd068d092a0348749a41aed8c41b",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.2.1/Shuffleboard-2025.2.1-linuxx64.jar",
        sha256 = "97fad7f1788f75980284e376fe7fcbf8f826bd62eaa250b94d69a63d13d5dd77",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.2.1/Shuffleboard-2025.2.1-macarm64.jar",
        sha256 = "b02b1e63f94b51c6ca884177158ca37ce503429cac0b431f71e9eeee08e9435e",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.2.1/Shuffleboard-2025.2.1-macx64.jar",
        sha256 = "54f5a71e575c30dd4056b6762f78f9156d0384308120cb4d0f4a843f364b3711",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.2.1/Shuffleboard-2025.2.1-winx64.jar",
        sha256 = "d619e876e10d63b87fd19a3cc0d9cb5fc31ff917be20a2bac8939b542e34745e",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.2.1/Glass-2025.2.1-linuxarm32.zip",
        sha256 = "3bc5f0f5233dd73a0d53011b4e916bbcb352940c4c8dcbeb1a94c45c04b98ae4",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.2.1/Glass-2025.2.1-linuxarm64.zip",
        sha256 = "8d5cae4f0cf49b1da23aa660162979a429ee8e8f702aad8fc2a7e5055af97689",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.2.1/Glass-2025.2.1-linuxx86-64.zip",
        sha256 = "ce770e1a8de042e048ce7a03d2716b22cfe751ed1dc46eecbb0057b8e9914bc6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.2.1/Glass-2025.2.1-osxuniversal.zip",
        sha256 = "e27b48efa3f22f780a26a6473ca4d9ed2a3dbb6c63465dd617961f786be4133e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.2.1/Glass-2025.2.1-windowsx86-64.zip",
        sha256 = "9d1a29c11719a54e937d95bc59c9784cbf5a9a89250788caff6fa897da89dc3e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.2.1/Glass-2025.2.1-windowsarm64.zip",
        sha256 = "0ee79a2e79293019094766641006485e7944416dc3fc94d5b017d22efb9faf35",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.2.1/OutlineViewer-2025.2.1-linuxarm32.zip",
        sha256 = "f1133f55a7919ee0fdb6d604109327450f4d2836b933feddc8250854ec25fff1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.2.1/OutlineViewer-2025.2.1-linuxarm64.zip",
        sha256 = "65387cfe1ce12b0c80ce7b102bf42104078c3e806ea7205072ab0f70ef2d7e5d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.2.1/OutlineViewer-2025.2.1-linuxx86-64.zip",
        sha256 = "6522cd686f981402d81dcb1217df6f5c689a04d2edc11d8eea6b80c148fabeb7",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.2.1/OutlineViewer-2025.2.1-osxuniversal.zip",
        sha256 = "3f68c2d3fdbb41ef5b6208f7d827b4b6b8ec6d1c6fc5d1fae365c976c51b221d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.2.1/OutlineViewer-2025.2.1-windowsx86-64.zip",
        sha256 = "78d995fa23067d8e90cb9d6aac9dd2fc332ff37f3c36a6c2d59d295450a04038",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.2.1/OutlineViewer-2025.2.1-windowsarm64.zip",
        sha256 = "748ecf7e587268bee10a8c756910c96afaecd822b60fe7c8c81a0332fd9ad901",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.2.1/roboRIOTeamNumberSetter-2025.2.1-linuxarm32.zip",
        sha256 = "522e759028924c602ac4dd277096e460cf0c45d75dcc1223fe0827b95616eb7d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.2.1/roboRIOTeamNumberSetter-2025.2.1-linuxarm64.zip",
        sha256 = "e8b029d0ffed6e48ddd0577d6e9c125f45f6d97319fd88048e851b896f390f2d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.2.1/roboRIOTeamNumberSetter-2025.2.1-linuxx86-64.zip",
        sha256 = "cf38c2fb0e094cb41ed76329802e3e5a86a4af7de1f464b30ad53731d8836c9a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.2.1/roboRIOTeamNumberSetter-2025.2.1-osxuniversal.zip",
        sha256 = "9c918f64f93336df69e06dba61020ee7d5b015d184164330d87373dc9f6f2f4b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.2.1/roboRIOTeamNumberSetter-2025.2.1-windowsx86-64.zip",
        sha256 = "96dee8ed028179b45067283182e7c9cb8c5d01ff996abb0f724c43e09f4dd796",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.2.1/roboRIOTeamNumberSetter-2025.2.1-windowsarm64.zip",
        sha256 = "59cc75452356db49f9985eaf79790fae0522ed2eef7287ea6306edf7a6eae03b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.2.1/DataLogTool-2025.2.1-linuxarm32.zip",
        sha256 = "a6ef9219f8defc2f1e01f63b1e2958752ef5f8704799e9dc4d528d0d2256644e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.2.1/DataLogTool-2025.2.1-linuxarm64.zip",
        sha256 = "933bacbceaa216ff2f68552d8a1e6daff69ed931fecadfef9a5d88203c9d1725",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.2.1/DataLogTool-2025.2.1-linuxx86-64.zip",
        sha256 = "f9c23c37ff194def580fad965ea66ed19d0ecc32f7c10d62b0508252ba06daf2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.2.1/DataLogTool-2025.2.1-osxuniversal.zip",
        sha256 = "a0b65e0d90f949703a81db7cb0755e5a41f6c70896cf08493b87575f961fa3fc",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.2.1/DataLogTool-2025.2.1-windowsx86-64.zip",
        sha256 = "ef844e7c85fda6d98dbcca143a488e95e758348a1a428cd7cc0274378313189f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.2.1/DataLogTool-2025.2.1-windowsarm64.zip",
        sha256 = "dee05f7cc9cbab58b93322f89d2777d23faee5e082c5ec9cae7d624cddb991e4",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.2.1/SysId-2025.2.1-linuxx86-64.zip",
        sha256 = "22a76c61bded2da579e555f5b6b8e9e7c68bb9731142b3878eb1ea575b4be8cf",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.2.1/SysId-2025.2.1-osxuniversal.zip",
        sha256 = "7b2961891b883458aacc4041486be28f05e6344ec242da785339ca076541bec3",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.2.1/SysId-2025.2.1-windowsx86-64.zip",
        sha256 = "0c8b58e1edd92f191ae209d4be4b194d5d8291025721f413454da325d8c8b013",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.2.1/SysId-2025.2.1-windowsarm64.zip",
        sha256 = "a92da2c3df1ea97fed8efa66da42d26a8cdba906cb589e13c3fa691cdc1adb25",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
