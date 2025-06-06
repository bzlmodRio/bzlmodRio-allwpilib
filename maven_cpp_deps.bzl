load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")
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
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-headers.zip",
        sha256 = "e28fe6ed1efacb640e7163f44cc081adf7f51f53d7455c9cbd6f2c0616a0e2ec",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-sources.zip",
        sha256 = "968f2403eafc87b5d9e951ca2d4386c35c97443ac2e185e312827efe8815a047",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-linuxarm32.zip",
        sha256 = "2f86407647153f91477e9f4c1b05ba4e937afe75d53c2300b252893cfa32ee54",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-linuxarm64.zip",
        sha256 = "84bb73b262cdb3bda63fc379e36caa6e28c8f359b1b80fc6e357551d1b107b17",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "de677e943496a6624c73dd85cff0b68dc4c170b698c5663b1a7609a557f09cbb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-osxuniversal.zip",
        sha256 = "b5b51ab60138647edb2e88b16cd1453527ece66f0a21817f1dd675a6fe2dd831",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [

        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-windowsx86-64.zip",
        sha256 = "56de183a034505c7d744c1548f227df366a7e4979d58c021738feab4429b8759",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-windowsarm64.zip",
        sha256 = "b6cf1bac43660c825478c64e66ec3d5e2a7ac1f0248b5cafd8ac09b803769ab9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-linuxarm32static.zip",
        sha256 = "c213ebbdd09f7509a532e2a3a8358960b6565eeb82c4700448b0a2eec912845d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-linuxarm64static.zip",
        sha256 = "43c3db158e094ecba11d4985d79d333a48abeff05bbf2c9b1452e8327fdf708f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-linuxx86-64static.zip",
        sha256 = "0e1a0a6696f8d129dc06fbbd3516cde9fc4a41484320f1a45db38dff2aa74d5a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-osxuniversalstatic.zip",
        sha256 = "13b65d7802e4c0819c277d554e74898c907b209888011d49437e0d9e72b35152",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-windowsx86-64static.zip",
        sha256 = "52fcbdff125cd23bd2f8e410ea31ba7e1345a45600bb29a2555106de8c347dd7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-windowsarm64static.zip",
        sha256 = "656f8d8b821d162fb5fbbadfcd84f215f57b611be783f881f0565ece3896907c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-linuxarm32debug.zip",
        sha256 = "f531dcbe935c434c29fa92b186388bd5550573f5922a791a5b4f81d892c27c1c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-linuxarm64debug.zip",
        sha256 = "2e73541b44e7de112607e63d3f067486454a7d8398c959d1564cd29cd2eee556",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "638f04a09c99a08f6fe6873423141c15b9f0166e8b9695da0df263e6c41053a5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-osxuniversaldebug.zip",
        sha256 = "1f0f3d37a3569d8156bcfc2dddef131f195db814ee812386830b8986d9e9d5ae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [

        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-windowsx86-64debug.zip",
        sha256 = "84275bb015f6d3ef5eca64deb78d2123eabd19d03d658632f0d657e1468a6d6a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-windowsarm64debug.zip",
        sha256 = "79601f51c36e74707c87a15583524a60621e838048e6e29da24798bbc293a0f2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-linuxarm32staticdebug.zip",
        sha256 = "7e64240f887227265b4edc3c69f4b19b96dff05f4379aa819fc576a87af8b35e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-linuxarm64staticdebug.zip",
        sha256 = "c5dfa8df45c73f6c573b4795c2a8fa3ecf61009c30c2eb8f4af1b1936f2beddd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-linuxx86-64staticdebug.zip",
        sha256 = "c7a1c85a28f85d5db6e93f813841ad990069cfa566e824bfdeb01958197e976d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-osxuniversalstaticdebug.zip",
        sha256 = "39ae0bed734ce71992d68c72fde8f31ac045c598a19e7f5b7173147d5ed239a7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-windowsx86-64staticdebug.zip",
        sha256 = "3d04d09ee7fbe9e162723b84aa1e9a4ecb299a39c5eb088544c8f42f952448f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-windowsarm64staticdebug.zip",
        sha256 = "15c5d6b18bcda2785cbc0a25dce8f3cf66995d75139ec43003fcba69b5c63cd2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-linuxsystemcore.zip",
        sha256 = "917fda04652a5e050af3e949d0bdd81a6e6a2cb89df8094dbe773a88dcf75055",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-linuxsystemcorestatic.zip",
        sha256 = "27a1a9d3b8ce84fc38d3c85ba70afc20095d3e24801675fcc5808dbd45623e65",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-linuxsystemcoredebug.zip",
        sha256 = "ecaafb4aa8d455b68d36238b0e65ac847365e756350ffcb426e9fa6eddb79fc5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-linuxsystemcorestaticdebug.zip",
        sha256 = "b303e7f85f30808ca4368f36131a925b6e2ec3535ab0016c2d97a4f7f14391d5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_headers",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-headers.zip",
        sha256 = "d5fc9f23528a347e6bff42d3f4077cacc08076b6dde5ba9cf50dd7ac58305c50",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_sources",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-sources.zip",
        sha256 = "e6c02c13caf1ac30289f331e50215474cb1f8ac95f4c89f9010602f225569e96",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-linuxarm32.zip",
        sha256 = "236e5effdc35c0271be02b484c247edfaa8f8b7304e820253159ffbec857bdd3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-linuxarm64.zip",
        sha256 = "3b86bd202b14058dc2a2ee54a2e0fe32d8ec481edd64e265c09dbe44e699babb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "84e90b2a82d1e460cae41ede56a2298e54fb1c0b39861365e5f59a7b7e0c8cd3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-osxuniversal.zip",
        sha256 = "050f60143e961c07886c60c200d23d4d2099680fa39a7bcecedd0d7803f38e32",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
        patch_cmds = [

        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-windowsx86-64.zip",
        sha256 = "5a58552b37ffac91c0626cb930f37eb794ccd3d4b84f319f3b8d4f5338ead5c9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-windowsarm64.zip",
        sha256 = "27893c37e354fae2b8c1fca7c0f8f57a1da01607fc4018bcc952c161f3174d76",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-linuxarm32static.zip",
        sha256 = "59ab1e634866fbe1ad516ca536b30a0fab82c149ec11b5e48c0b6301eb471326",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-linuxarm64static.zip",
        sha256 = "d6554ffc4c44130dd78aeffed3d08df2b3d1447dc430406d2baa20792ed046c5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-linuxx86-64static.zip",
        sha256 = "1ce574d3e78ceba6ec270804b5585f6f1f4567f3e740a1b8d87dffe44c1d68fd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-osxuniversalstatic.zip",
        sha256 = "a86d89b21b190f925bc0f8f8bbf2b9fc36a95cf829efd6bc6d7cecf357ee3841",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-windowsx86-64static.zip",
        sha256 = "5b9f918e7e864b91d3baafe1316f7b04976a057e3159c61aec445b6e11a80fc6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-windowsarm64static.zip",
        sha256 = "e64c1bf495c6bcae93d7ee5a6a04ea9ba83414d03fecbeab245d41ceeca5709b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-linuxarm32debug.zip",
        sha256 = "6e17d3016737a1b3ec8ebb24093ea1952b3ada9a5d43faa3a5cd43ff40610586",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-linuxarm64debug.zip",
        sha256 = "9d4418891587af5ca2a13626065a671aaa864de6b0e77d90dc0d141422c6d02f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "565edf5e1fc136c6192cf667b2e5e2d0ac386458bd7c8075f5ec0b8c8d1e0ad6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-osxuniversaldebug.zip",
        sha256 = "dfc31d9be86b5c37974e562567fc1478ead02319e1b195f80f68b24578ca1b6e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
        patch_cmds = [

        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-windowsx86-64debug.zip",
        sha256 = "0791c961429d31261b1405e1824a64bf5d6941ebe50540d5dcf419266e43ee48",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-windowsarm64debug.zip",
        sha256 = "5cedf920b9db46048cd8683cc076d15510a200277fab8df3c4c40a64545cd0a0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-linuxarm32staticdebug.zip",
        sha256 = "4b630914087ce8ee7d33e5bb131bf9bee68808aba85add6ad0c65349d894fa60",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-linuxarm64staticdebug.zip",
        sha256 = "d3e9f1a0de9a100e8e2adb300ebbd5ac6983c8382a800b60688beedd1de8562c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-linuxx86-64staticdebug.zip",
        sha256 = "5a675fe46d89984e9e5fc0675dd975ce6ab3cad1a582e96d55b02fc98e3647b7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-osxuniversalstaticdebug.zip",
        sha256 = "6afb318dfd3010e1c1e39ea9d1b4ac2aaf7f6087273ade51da425b44de52d2f9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-windowsx86-64staticdebug.zip",
        sha256 = "62a501de8c29669e4f867a3b1a760773b653c1772d922653fc8c6d924fa5d854",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-windowsarm64staticdebug.zip",
        sha256 = "2e51a92362732f757e9ac515bfcf156163b98edafd10add036a8b76833c20f8f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-linuxsystemcore.zip",
        sha256 = "cae79252c697536ce33d8bf9d6b458e06fa60a22b62882898707a7a127a4f31d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-linuxsystemcorestatic.zip",
        sha256 = "0acd5217e295eb515522a0fa333b3192e1602d9ad1f29521f8c5ea2c0c3f696d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-linuxsystemcoredebug.zip",
        sha256 = "339d3c5e81b8c58ba1034d8bd7334d1401a607533e77143fdc852d92e9050c65",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_datalog_datalog-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/datalog/datalog-cpp/2025.3.2-123-g22d12d2/datalog-cpp-2025.3.2-123-g22d12d2-linuxsystemcorestaticdebug.zip",
        sha256 = "beac3798724443f3d730c23e4c2ac78bfd3c996486fc11befd4144e7c5ac26c0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/datalog:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-headers.zip",
        sha256 = "75135169a96f6ba0289609152f47fc2734071ed1e9b2e147c9872b0f13508f8e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-sources.zip",
        sha256 = "1f7e1faa9cec0ab7ab56182293b01840a42dfebe7b8dfc471700278b2cb4ec51",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-linuxarm32.zip",
        sha256 = "cf6a729b16b6f45f453d42a581d9077ec1edcd056d5ffb3cb4c2336df87627b8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-linuxarm64.zip",
        sha256 = "1bed05e61ee2be322ebce2adfd8a7e5ce2aa89a4d9251e9da5dd051706e519fc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "a7c3e97aacd6cdc965160a28f5e8fce7e8ed6022a2ffb8da5d805fe5f14b43cd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-osxuniversal.zip",
        sha256 = "63a27cb97772eec03c3c8e49e995a1624391755acb9f56994be33a3479b405de",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [

            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-windowsx86-64.zip",
        sha256 = "cf7af2c1d7413e4ab46960c5d19e5b7f68b144bdad5665e705f448db707858dd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-windowsarm64.zip",
        sha256 = "7aa49f9bbee7a53c70d4b23cf688ff5d4b6edb694504a23fb82042db966afca6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-linuxarm32static.zip",
        sha256 = "903f7788db2e9568d01504be13ed12cca09c30bfe6713b92579004d31e15b946",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-linuxarm64static.zip",
        sha256 = "4844526b57be04666373e62c078fa11035f9e5eb2862ef5f2ef38206a549891a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-linuxx86-64static.zip",
        sha256 = "cf12dd49c95d4c252b1be23af1b0dfac2ee58bf63810fb505095acafb34f99c5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-osxuniversalstatic.zip",
        sha256 = "32ab03b5203fbf6b08bf3efc98c6f33ad397361762b5e64582fb3e00b82b4836",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-windowsx86-64static.zip",
        sha256 = "d913d52e4eea0e3eb976412398cb52f10c310f9c7ed212a957a945af32dfa3bb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-windowsarm64static.zip",
        sha256 = "e8365eb653df9fb505a37f5c7bc9b32b7523d9bad3161354136bdf153c003b45",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-linuxarm32debug.zip",
        sha256 = "30e0a453f625016ac3e4b3e2ec0b377ed2635ff63810f8f49df189b60b4e541b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-linuxarm64debug.zip",
        sha256 = "188b0cbf180b578268cf426659c5b4f333c8e6185ee6d5f49bbb9ad08a5df5f0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "8e17f858cd7e53a2e58ea7df6ae3c31fa6b34d8d8f4fed9d1ec245e6ed63214d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-osxuniversaldebug.zip",
        sha256 = "dca213c009853b09d3aa28db644059cb2b7452e0f1e97a12090e552f93929020",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [

            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-windowsx86-64debug.zip",
        sha256 = "586c08339fdc4333d0c2c120d09a2edb77e784e9b24dbb42e902324099ddb70d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-windowsarm64debug.zip",
        sha256 = "3348434f5f28ca7fd6e454521abcb7d6adaa3220a059817e3cfaa3041b110f22",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-linuxarm32staticdebug.zip",
        sha256 = "a0477ff10de607fb2c168eed4a0922c80ea978e085e5e20879a48679e804e8cc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-linuxarm64staticdebug.zip",
        sha256 = "903037bebd1c12b56adefb73c57854782f15ce5d52fe4db9ace7f49a990c0893",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-linuxx86-64staticdebug.zip",
        sha256 = "0b1fe861cea0729a009fc2f81827b974d37eb14506f01bbf536955f5c0cbf477",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-osxuniversalstaticdebug.zip",
        sha256 = "25b8dbeadb1132fa024ed672f141fdf1420a74e3e310d600f614329f242ad222",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-windowsx86-64staticdebug.zip",
        sha256 = "5393a905050186695e564ba9d17294530e23c334348f35f24c0eb4b34cf3b9fd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-windowsarm64staticdebug.zip",
        sha256 = "19f69ad2c49a33e97e4303732abb940b0148fae83fe633f90915dcb3f7f2e6dc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-linuxsystemcore.zip",
        sha256 = "e767955f656a3236eeb7047d9b5f43aecc9f95095111eb7899468c0e453f05b3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-linuxsystemcorestatic.zip",
        sha256 = "0713ca926ec20bb24b7c57bb75bc08a936847c3a88120d12bec9d7ea7462f450",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-linuxsystemcoredebug.zip",
        sha256 = "12bdb568c8ce54291674936976b88f34b68641289f7ad6ab10f55fa645a921b2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-linuxsystemcorestaticdebug.zip",
        sha256 = "d60a1af64387278b9e8afd70c39bffcc6e1286c45fcd584dd9787a906845f564",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-headers.zip",
        sha256 = "ba2c858fc764a674aa6186c0bbc11ee1f1d4ba070ab5febd1e577faad0dd7280",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-sources.zip",
        sha256 = "d66ec7b0e101fcbf7b3ca6c79ea0b7c32940863cecee548209c48c7feb915d83",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-linuxarm32.zip",
        sha256 = "fc5b461e3a55ca7fe2b7f19a01ccc601f52e899de24e5a1ed9ed52bdab37092a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-linuxarm64.zip",
        sha256 = "71b8a4e965585290fbbd09dc3859c013d91b94ec273cc9fa92a3316536dc5327",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "67f91022a0281395851342cb9d3a30f9ce04ff8005453d2a68e0f3a5473d3778",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-osxuniversal.zip",
        sha256 = "10941f13d8dea2ab4fe2967ea03d2113e5c991d5f4a85412a4a58f1d68e4be2f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [

            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-windowsx86-64.zip",
        sha256 = "dafe2c5bff09a48b149c5dd1b5a7d3c94961025c870f779d95b9098d01305ebb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-windowsarm64.zip",
        sha256 = "f3ec67f7ff2c529dca6b5d4934325d32e11ec5dd172dfb508ef0ea7dc6b412d5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-linuxarm32static.zip",
        sha256 = "48198278d7ae050ddae27e741809343396dbde63e26e88ce4747a2f3cac22277",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-linuxarm64static.zip",
        sha256 = "ae468715819ce9e6473cf71b89ac4573bc221a19e43e14a66c8f8d95b4c255d4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-linuxx86-64static.zip",
        sha256 = "2ca1c65d4e3769e4bb609fcf69d1946924aeca112ce2c9c95f2b1872a60f4195",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-osxuniversalstatic.zip",
        sha256 = "609faee52e9aeaf2da736e1e09aee8e3c219727858141a901733b594666dd185",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-windowsx86-64static.zip",
        sha256 = "4be4efba1cf61ceae5f56345f34b4195f5682389fb98561111ad3966fcb2fc67",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-windowsarm64static.zip",
        sha256 = "90efb8dfab6a638af3bcfaa1611b14761dddc9da742ac8716be6aaf02b2d455a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-linuxarm32debug.zip",
        sha256 = "47594b262a15126a1057a382e7338c9dcc0fca6a3b245ff2b205a0980c9ef835",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-linuxarm64debug.zip",
        sha256 = "e2de1c3c61c992375665b2b3f4eb0602972ddff42da097a88ca9f268e67c9ad3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "cce90388f6df31a031906aace28d4a52bee6ca44c44d707cad786bef24d7f7a9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-osxuniversaldebug.zip",
        sha256 = "3d12726a5c579db49a34e0e1f6a8f84d967b706d319f9b5bb435b57477481500",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [

            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-windowsx86-64debug.zip",
        sha256 = "41ca6fcd13d530da7aeef6fa0fdd5fbd2dfc7942dc36358fa38fa568f3f859cc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-windowsarm64debug.zip",
        sha256 = "6c370b0963a3237b5ca26e1997ae263ef19ef3673cff3731ded7cabe49472f87",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-linuxarm32staticdebug.zip",
        sha256 = "ade8fc17b9307e388ee24a78d61edaa6d715be0109f206ea480e4b1d33757567",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-linuxarm64staticdebug.zip",
        sha256 = "31491effe8e300f6a98ccad10c8ecdf459730a8b1500d7c57c0e590ecf7e72da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-linuxx86-64staticdebug.zip",
        sha256 = "e2a221ee594e740c2ffc74e081a8dd88b269ae03a62b74bf4047bc0d042a5ad0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-osxuniversalstaticdebug.zip",
        sha256 = "a3190f1ad1a74bd47984db194f05ce20a980606654793d29cc3ab3b8046b309d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-windowsx86-64staticdebug.zip",
        sha256 = "ed52fa622ea8222e3ddfa76a1996cc282d95395ccf6e1700cefbafcf3705fd20",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-windowsarm64staticdebug.zip",
        sha256 = "67c746f9d34c6fe3ef1309a7e16149b16e11b266c8ae2ce0c241162f93966e9a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-linuxsystemcore.zip",
        sha256 = "f2f69e9b345968d62d45a496946ebd6e6bddcddb91adc48e818778d96305cba6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-linuxsystemcorestatic.zip",
        sha256 = "3c38d1a59c6427da78f5f494cb7588b93200d13682af2884b14c4ce28944d8a1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-linuxsystemcoredebug.zip",
        sha256 = "dc7e1f0e2e720a893803711107b88f6da61176d2ed4a2088d15dcffe90c68fe3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-linuxsystemcorestaticdebug.zip",
        sha256 = "117ef56f64fc8b47cd4597966f51d283790b0d4bf9fb3844e17364fc2fccc375",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-headers.zip",
        sha256 = "886fd34317397142eb97d94aace65baaee992e8030d4dbf7870eded0d1e05292",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-sources.zip",
        sha256 = "5108f0e13557591cd24a05d2176b04d4d6b8a32f4360e6e918f14dc4173795c8",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-linuxarm32.zip",
        sha256 = "e0f267583cdf57a28772fff34eba3c7bdd4865b9f52e956a00263f5ca70f3640",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-linuxarm64.zip",
        sha256 = "c8d48f0fee3b5896901b1c51664c1e0f631d49c06eb203d8407af3dd00ce5fa8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "54f3ddbea63993389245fe5dcb3ee109de9517c7f3e57227b5585dd6a0aa1324",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-osxuniversal.zip",
        sha256 = "f127ba630b553e70294e124f6a430009b12bafbd54460f1a23f69a040a8980d2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
        patch_cmds = [

            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libapriltag.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-windowsx86-64.zip",
        sha256 = "6587ebb9670e899119f8e6a69084ecc1f2c9860b01b87836c911ae1373177ac5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-windowsarm64.zip",
        sha256 = "1408d610d467594ad4f8ff96c74e9e2bb6c713c3c0f77b4b47ca596bb4ee1e34",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-linuxarm32static.zip",
        sha256 = "8b12dc4e80c0a2e5c2b87de29e75feb80d9143673e9699110de12d9020679538",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-linuxarm64static.zip",
        sha256 = "0a19e932b5cdc0a3edd43a2d9a3e674dd5f988e43dd8f2950a3a841b9b66ef3d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-linuxx86-64static.zip",
        sha256 = "b3c40d3ba14baa9f5c8b10a78dce90bb68798761d4b708b5148db17555bad11c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-osxuniversalstatic.zip",
        sha256 = "9851006c4852213d81d103772ba78972e807b40ad13c941a7ce49948b1662266",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-windowsx86-64static.zip",
        sha256 = "66b14cfdfaaef13e22994b88e6c978bba06dad873f3361d5f0874891e46359a1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-windowsarm64static.zip",
        sha256 = "8784cf60eca7d0a4379911225c9b018380bce5531bcd7019ac1f536f1d595b9d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-linuxarm32debug.zip",
        sha256 = "8d91574975302ada81846a581ad88bbe8d12c23a45d1801eb96fdc4a20320840",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-linuxarm64debug.zip",
        sha256 = "8f797f0f00875b9056f59eb4034e9d1d961e3cfdf4101dffecc76006bb82ed51",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "76b364d22055777012adc81345fc32aa19bd315125ddfa4ad37ee802df14e151",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-osxuniversaldebug.zip",
        sha256 = "d8a209b7110e9ec0929a157e3a85f2a0e7f64aed9bab3b816d9a01ca31b51d1d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
        patch_cmds = [

            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libapriltag.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-windowsx86-64debug.zip",
        sha256 = "6163fea8858d2b585a92cdc0ee9676c73cf4f062e3114339700a1e0b09a7ffc9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-windowsarm64debug.zip",
        sha256 = "5e621ec839c4ecc92dbfb1a1aa9116700d76d0b8351469c89edb126df15e953a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-linuxarm32staticdebug.zip",
        sha256 = "282a8f5b4ab96366466d1b59cf370baaf4e6b00ddf33be2f36047b1e716440cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-linuxarm64staticdebug.zip",
        sha256 = "25e013837f838717b182350b4c9878c90784f47cf8869408a70e9bf1c5ee4609",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-linuxx86-64staticdebug.zip",
        sha256 = "1558340c1a14c6cfaec8957809086064b08512247368c7145bb7f97d798d5eca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-osxuniversalstaticdebug.zip",
        sha256 = "b3fced2e5d940cbe324c307e40d6ad9e7e4c4dad9d9be8562e2d8003d5fec157",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-windowsx86-64staticdebug.zip",
        sha256 = "e222dbfd7257d0f33b96683024e1f6910ae00c83f173bcf7fb0989f7306409db",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-windowsarm64staticdebug.zip",
        sha256 = "a50b5fb8eada469191d0f633365f1682689dfabd226b95a1b3f3f65dc9d23d5f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-linuxsystemcore.zip",
        sha256 = "89fd09e12d2f46c53e16004f2ae7d3fbfdcd26c090e25062d681af65e8ec05af",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-linuxsystemcorestatic.zip",
        sha256 = "a42c4d63b22bf51bb85480c80f6a15f2f2764997a79f925a95df201377c591eb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-linuxsystemcoredebug.zip",
        sha256 = "8bb28be9c39d4a86269fed6ae3f3ed3878458519e776be08dcaaaa064f074261",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-linuxsystemcorestaticdebug.zip",
        sha256 = "27e8c7c70f43f0e72e05dac5fc87faeb4d8a0bc660010de7aa61c7b3d06227c7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-headers.zip",
        sha256 = "7ef801c8a9b051988bd6720bad54943113f768b9ce63ffeb604f9ec9cabff582",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-sources.zip",
        sha256 = "8b9777256727160aab3a0dbd51b7b89522c1f546f7ca65f551023c330bdebd38",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-linuxarm32.zip",
        sha256 = "2ada9b78621690f4df9aa8a753721f12471569659844623a3ea976b363c1f4f3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-linuxarm64.zip",
        sha256 = "509494cab2a6f8b15cc0696445f538026203f9560651e18ba3dc7d53bf346ef6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "acc24c2e93f9b342ef2835bb05c21bcbfd2285d0ebd45442e3bc5182c6887152",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-osxuniversal.zip",
        sha256 = "f68c5e6e6c83e119ffff0a708628a80d7f716a752b30b5520b88ab16ff9c7525",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [

            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-windowsx86-64.zip",
        sha256 = "caa1d10d024ad4c5efd0edf1c7b60436d0e23a080e6ea0e4e22d6ae9647310fa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-windowsarm64.zip",
        sha256 = "9f8d7af253d13b504ad426650b46d8ace53feafd4ca081b59df6d5202b94beed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-linuxarm32static.zip",
        sha256 = "b4b4be936fa08fbfb5a02fa48c4854492d7029ec0a5ea8210c076ce2628c2069",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-linuxarm64static.zip",
        sha256 = "1cbebe31e7527199ea6976e111cda16e0a548dd6aa1b09a0ccebac91d1c0158d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-linuxx86-64static.zip",
        sha256 = "95158d4cea17a1f6eac26bbdec6a861aba8cfad3af1cb2993e01e7c807bdbb15",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-osxuniversalstatic.zip",
        sha256 = "4051a545327d5f15c73f2435802ce0de5fd7b9462ae25ad6215ebfae72ce14f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-windowsx86-64static.zip",
        sha256 = "7183bb9a0f388793e3e59c49349c3a156fdd250cbc52128b64ddf8ecdb5675f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-windowsarm64static.zip",
        sha256 = "e1254ddf8b6e4053b7b2a7363e62f136c26f3505823d7cd6704961722471710c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-linuxarm32debug.zip",
        sha256 = "5e23f18ee4a1437fc06e45103f6189c7ce45069821aa338c89430da723664194",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-linuxarm64debug.zip",
        sha256 = "481f693f88924bbe8e663236145bb5ad75bed3e35bc047c4f6551658abb44963",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "ef054ee06dc34f5207305cad29c8c72d0288cf1833689ade8c48a8a3fee6767c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-osxuniversaldebug.zip",
        sha256 = "826a2b8e1ec242f82cc6d82ba3ad44eebcfde1bb17e0a55cf1538223b73e12a2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [

            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-windowsx86-64debug.zip",
        sha256 = "71a517857a361968e7100d74f96c0ba905537e6d38accf485f49618a95e4e5cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-windowsarm64debug.zip",
        sha256 = "d45338a1530843f5d76247bb94d6f39297d4a44091a0af8af0d2171503e935ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-linuxarm32staticdebug.zip",
        sha256 = "b5e2ef5dcf4de91b6ab73ef2fe0a7b99962f4b967f9952c78f4f1b6660a8d302",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-linuxarm64staticdebug.zip",
        sha256 = "7100ffdf8aeaed9804390952bd82dfcf6a6d74b1b5fc9ed0fff79a176e43d516",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-linuxx86-64staticdebug.zip",
        sha256 = "91be5a1af9c6b1af957bc05cd44204cab62f63658dbe9a4f5dd6d938cd1dfbe6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-osxuniversalstaticdebug.zip",
        sha256 = "151b478d8ab4f315478ef3d2f57ee0adf2d5559c35029c2524ff39a21695f4ca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-windowsx86-64staticdebug.zip",
        sha256 = "72eaa3cc6344a61ea0ae530ddc52004ad130afa84a2bc8faee0adc68c888909f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-windowsarm64staticdebug.zip",
        sha256 = "843a2dc5090671d4b75b39882082f26b710614edbcea953bb7967937e8a239d2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-linuxsystemcore.zip",
        sha256 = "0a92d1f7e1a2c4544dd0a156fa9d7940237541c5f35e0830a060ea68a4633207",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-linuxsystemcorestatic.zip",
        sha256 = "4cb78909564b190928b22870bc473bd45dd65b71f8aea0368867b81ecbe5b2ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-linuxsystemcoredebug.zip",
        sha256 = "8bdc7453260bd957d46647a9d7ddc8d63a77c411f62aabf699a4d8713eda6df9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-linuxsystemcorestaticdebug.zip",
        sha256 = "b79db21533200c3d1402af294a2f55c50a2b41683a8b95c78e3fffcbb12968d0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-headers.zip",
        sha256 = "e2ce6c9ab565a43b5ff37f224b83310575c8237b753b3356d730f358b8de44f3",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-sources.zip",
        sha256 = "f6b5de7811fc6ca819965c8eac2ce9d965f50f7c10b2da6c42a547f70e347674",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-linuxarm32.zip",
        sha256 = "3c1ce77ba1caaf7af328eaffcbd747fc168a162e6cf7bedc199d2cea58bd21e9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-linuxarm64.zip",
        sha256 = "17961ffcd7822c414e5bfa4b160488e51f27e6dcd565925714c703221cbb651f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "448f1596c80be744713557d378ed62f1eefe8ac7624c344293c350e5b54cd684",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-osxuniversal.zip",
        sha256 = "d349c9e1687c00f5447b92f3ab092cf8e77c136d066a911cad5dabf9975bd53b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
        patch_cmds = [

            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libntcore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-windowsx86-64.zip",
        sha256 = "c9dfe929299e826acde7d2f5cf3622fc178a1bed0c7b1bd96374294ee73a01a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-windowsarm64.zip",
        sha256 = "56ac2aef7a32589ccac06331c9608007996942ecf35117ed0dfc4acf70435547",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-linuxarm32static.zip",
        sha256 = "da822d99fe89b3d2284fd0f8f487764573cf11083c4fa4b05848915347abe753",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-linuxarm64static.zip",
        sha256 = "b0ea188364e468e45310d2c1d09d0fa24e2548df9cf5434ca3e7b0e301e0f537",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-linuxx86-64static.zip",
        sha256 = "71a9dc06e6f7e403b39ad91ec70dcef03a972e51182b386455ec30fbbeb4a4b4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-osxuniversalstatic.zip",
        sha256 = "e60d001b132a181b0e5a9ef68dfc7ee4c8b47b038e7bdd471e965eacf347175b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-windowsx86-64static.zip",
        sha256 = "d7ad8d064776d19074c89013294c120b58843672e715241504ca507192797837",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-windowsarm64static.zip",
        sha256 = "002c380ec14361ed241928013cfd6821515757fe9791dd2f51b610e48543c5af",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-linuxarm32debug.zip",
        sha256 = "de1272f2448bc58378f454663d18137d34c3f6328bf2229149e9452bd08bf9f0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-linuxarm64debug.zip",
        sha256 = "7574ccb39c7c2074f31921cee248ba4ccee01affe39e88dcd1ac570bd542e4c4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "42cb9e24fe756d537b681ac5a6fd21f2c3c2dd99bbad88e50bfe8c0ed6df0a5b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-osxuniversaldebug.zip",
        sha256 = "8116de7f859cd7db94a277bf8f337b100587e48a47f554247f19338d68f8fe9d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
        patch_cmds = [

            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libntcore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-windowsx86-64debug.zip",
        sha256 = "e353c0151e0903797ef890d2da16994fbb4843714884ae306d308101f7e3ab1a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-windowsarm64debug.zip",
        sha256 = "68f1faf10beaeb5771310e70e9a0e5e97b3ee21f969b67be36861e69f344c304",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-linuxarm32staticdebug.zip",
        sha256 = "b6da8ea690d56bcf4b3ff8c5d9a08c426d99f44cb08230b5111c01fe18e3d696",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-linuxarm64staticdebug.zip",
        sha256 = "9f2a082a6f78d7a8e5713fec8d943b0022156051c66e4599a12198f103228ba9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-linuxx86-64staticdebug.zip",
        sha256 = "aa3f4771d77f0eb676b175631066084849b1751c23e32d3b6a417a4439cd7348",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-osxuniversalstaticdebug.zip",
        sha256 = "b0e8f79cdbf8ecc2114b86d28808871f0bb477c198116dbbb25fd0dcaaeb363d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-windowsx86-64staticdebug.zip",
        sha256 = "4a3d3acd660cc979514dea5a65d4c658bd77489d0bec3e3c18b32a5aa23cf744",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-windowsarm64staticdebug.zip",
        sha256 = "5cbf8ea3281bcfbbd6da421c431b7d522d741ec553172a27f1a24e3d2042e3d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-linuxsystemcore.zip",
        sha256 = "0135ed5e5b45c3fd7b2046567113dd22352cedbe4939378210182e0648769299",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-linuxsystemcorestatic.zip",
        sha256 = "941b26b0f3afbcfc988c335c507eeaff29aa6927abb9452296f4b2945424fa3d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-linuxsystemcoredebug.zip",
        sha256 = "bdaf2b0f5f2db9ace2a272217d4228b81f106a91584632edf2c539a79a550260",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-linuxsystemcorestaticdebug.zip",
        sha256 = "3f1d771ad1d7b8be9b8ba3e0d34848e68584c7f00aab3bcabad44ab82ec025d0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-headers.zip",
        sha256 = "7ca9d48f1c5f19a85277ee789d67ae700ea722a47ae685c540f61fc94918a2e9",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-sources.zip",
        sha256 = "92f1e55d76e10b3375bbc7bfcc220ff92f71d2347e1114cd9f1e55437ab0bc25",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-linuxarm32.zip",
        sha256 = "7da55c3493220a73241fd4191bc5735f04dbd219e194cd94ca313261a9016625",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-linuxarm64.zip",
        sha256 = "6bcc2fbea6283af8f6f894c23408b54fc381eb5950ade8f3c985f94532e3015e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "7c044e56cd21fc70ac4e251a4567556df190370cc08c30aeeaf6ef33be6b72d6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-osxuniversal.zip",
        sha256 = "4e83910fe1fe852b5827631e42a4bfe7b02b1310bcb42d7811651406b898e58c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
        patch_cmds = [

            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcscore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcscore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-windowsx86-64.zip",
        sha256 = "2b0a59de154877165f48dfe01b5964900e2bf2a31f056024d845a0cfc1b8d11c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-windowsarm64.zip",
        sha256 = "996a7c2b631e101e674848e52c1aab81100a0f0d8d2afd854da4a7f4313d1d8e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-linuxarm32static.zip",
        sha256 = "ece7ff5b96e622ed35e9dc9b41763cde05902abf0c029e4f69e59bd847ecd804",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-linuxarm64static.zip",
        sha256 = "44c8264d760a35f1a32fe0971ad4ed4bed9b88d72aabe865aa2472e59f3bf96c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-linuxx86-64static.zip",
        sha256 = "f2c162ddae909d06d0ebcad4d40a69a38d2bba7e3b56d09f150f0c13750eefae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-osxuniversalstatic.zip",
        sha256 = "d80a2fe6682af00275f40f73e6966da99c7c6d5a904b8a8377c0f907da509259",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-windowsx86-64static.zip",
        sha256 = "f25183d4856b192167a48ccd455d9e1472d8acab17eb6fb7ed68a9638f41de0c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-windowsarm64static.zip",
        sha256 = "3ecec117ab1ebf78691f8d495b91382128bbbeebd0569595f02615fa006e0d8f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-linuxarm32debug.zip",
        sha256 = "df42bebff79f32153b5ca425d7957a5776d0c09fc6bc5cb0d16301bd0c6c0f03",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-linuxarm64debug.zip",
        sha256 = "0a436136c03dc579768c0f413cfaa682854868e860d4406dc73b2999c280a6e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "534890253a631a5a2c729391e3b7472d2a2c4c6571d09009846493771a0ca6aa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-osxuniversaldebug.zip",
        sha256 = "02203a6a7a34604e8820663c81b691efa8eab9d0816e6f0ec3185303df38c8e5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
        patch_cmds = [

            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcscore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcscore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-windowsx86-64debug.zip",
        sha256 = "854dbc5d4ccaea26d48d6eb80b5f69bbedf74406ec694422169e4fee72a46e13",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-windowsarm64debug.zip",
        sha256 = "0299185f40f4755e58a08e25ce3d44ad30db6a4bbc03485619b5d8a22fe0cc50",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-linuxarm32staticdebug.zip",
        sha256 = "37657c48e45f4e03773d1bf20f404a99520e8b96eb6022a4701891d4f6601109",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-linuxarm64staticdebug.zip",
        sha256 = "100ec2c168d27c26f3290474e05da00f0986e004d9fe7bf9af96cc780903ae8b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-linuxx86-64staticdebug.zip",
        sha256 = "a5bd3bacc81e522a16b63f8173a52d4c6eff19195785ab57d6f96cd44074f545",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-osxuniversalstaticdebug.zip",
        sha256 = "7dab522b744bee0d0de3db83ebc684896406187e66d1131bdfd9a5c0429f4c84",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-windowsx86-64staticdebug.zip",
        sha256 = "3cc05672a0dad28e074782c596eb3a5049531c713708bb2ee80cafe259057b86",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-windowsarm64staticdebug.zip",
        sha256 = "d57785ca692c0e4e50f6e4e664f8c2f449370f04f65a7dbcc3af582e4900feae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-linuxsystemcore.zip",
        sha256 = "9c0509e9ba9629351049d33256162ef65de769678297428fc809dd7e53256963",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-linuxsystemcorestatic.zip",
        sha256 = "2e48009ec69edb059103c4da1b9893fe5b7d27f6fec1559ecd04cb2e22f828fc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-linuxsystemcoredebug.zip",
        sha256 = "f0b196cc4ef4810e96c374f05a03c7d07407dd9260742acc8604d165cc507759",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-linuxsystemcorestaticdebug.zip",
        sha256 = "076d5b955bf5eb6922f63585cbd1b9ca7fb4f04d4d0643304807d485f98510ea",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-headers.zip",
        sha256 = "98bc28bc8d4bad3a3f6ff800bec06c28dd986bfa98e5f5c3739bc81d163bf753",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-sources.zip",
        sha256 = "a4d7c855d4716e85a3e45bbd7218230305f7abed949a14b7c97ab004a59cf723",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-linuxarm32.zip",
        sha256 = "c1e8f2c5961f0d90d00bbb6f8fc9e59ae235104cd0429a62a3a4de70ed14c31b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-linuxarm64.zip",
        sha256 = "d9b262a86b5b79f54ec599c4ae0590ad919b58e7147be52a585c02853f984ce3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "3ec5cc4f2ac2993528f94c829bba946218ee4e0893457baf1b1f30a1c9747893",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-osxuniversal.zip",
        sha256 = "3070e4043e018b648e1b0596dce8be9466db7646a589af2de962d6231eded46a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
        patch_cmds = [

            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcameraserver.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-windowsx86-64.zip",
        sha256 = "883e03efafe5842c2002c3c1e925920c1282a3191c4b09bec5db23c2096115e5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-windowsarm64.zip",
        sha256 = "cc38b42b03eef9f51fd1514be2c16936b58d19dafae7c3e3f4ba98895f121f24",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-linuxarm32static.zip",
        sha256 = "807c47ad7bdc224d20b4cd6df6406f36575e190d2d56c1754a319a4ef5196b72",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-linuxarm64static.zip",
        sha256 = "e0b4d8710db1619ffcacacd5480fdba0a8ac75f6bd8239d4df18b1fddb96d07e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-linuxx86-64static.zip",
        sha256 = "91bcc47b4eca479f25f2c0003b929934bac3f87e193f5f1cff2bbc428964d694",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-osxuniversalstatic.zip",
        sha256 = "7f442b7e22982d37ca84d7ec71e3def8ab2fd356df5da9aef97ab15fe18f3c0f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-windowsx86-64static.zip",
        sha256 = "df236381b1b2249b6227a31c293445a8149bb15e4b893325d1919e5f4b993959",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-windowsarm64static.zip",
        sha256 = "78317e021366fe3e6a96547ebfa33d343defee3a44d48a6b218473dc36316ccb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-linuxarm32debug.zip",
        sha256 = "45fcb6aafc17d908c2282d4b745a5da806c4a5c483e59e20da450b5944099f1c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-linuxarm64debug.zip",
        sha256 = "aa577bf50149545ecfdf6c754105e1d5bae4576df5886613d9a6e1c00a2d91da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "9bfa9f4f9c68e8afabb3d956c7c2c3988a07e7857262c7538da906f0812febf4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-osxuniversaldebug.zip",
        sha256 = "8b70fa56796e6d9ac25fa69adb7c8a9661dd0d837ef7b8b1a58c6aac6c998f7c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
        patch_cmds = [

            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcameraserver.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcameraserver.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-windowsx86-64debug.zip",
        sha256 = "e6d8cc346e2f4b472907a263644898b37d973f40f898fe15cf33b6d23f92a8b6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-windowsarm64debug.zip",
        sha256 = "d552013d002f07d4a95ed3a765a6c8afce2f81fdf60b846cf60008366c3f152b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-linuxarm32staticdebug.zip",
        sha256 = "4fe131337a9c1060a3bf951b88455653d1b2a52c79d7c8709b28dde57613a089",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-linuxarm64staticdebug.zip",
        sha256 = "df2d1a99fccf4edba540d9384f648544b2ca00d013faabd6a7feaff8ce938c4e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-linuxx86-64staticdebug.zip",
        sha256 = "c48e1975e8cd7b4c730a5d720d950bf3aa584f7abaccd41eefb3f87d6a2e7679",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-osxuniversalstaticdebug.zip",
        sha256 = "6b2f5bce29f95ebf324f6615f95dd5778a950d5009d7cb39b2f531fd60f60223",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-windowsx86-64staticdebug.zip",
        sha256 = "59d4d9194b15e5be7e253465be62d50026df0b8a381be0a32e77356aace8875c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-windowsarm64staticdebug.zip",
        sha256 = "bec1ec26170f81120b24e25bfd0331239d9268da36fe2919f72df52fadf77d6d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-linuxsystemcore.zip",
        sha256 = "159b391ff4b47d42b7a65bf347e2b0df1ad6ebf7d27996a34cbf24e65bc4909d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-linuxsystemcorestatic.zip",
        sha256 = "ba85278d563172d894ca94cb3bd5b167cfd8a3b7de1c90a947de5d95ffab1877",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-linuxsystemcoredebug.zip",
        sha256 = "7eba8ce7280905b2e9898755c125cf85ac9bf1fbcb01fe59295518a9988d75fa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-linuxsystemcorestaticdebug.zip",
        sha256 = "1ed0547e4b0f3b6061c07e6d652fac88ab7896a1e4a63ea4dc535643a42bcd0f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-headers.zip",
        sha256 = "6dbe740d46a3d30ea0f88d4b184c3a97f3cc1df0e756e504149f6271dd1f1da4",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-sources.zip",
        sha256 = "cc4b074e0bb7fc7f113d665205a369753fb1356c3e25bc9eb4f8e03f07cd2d6d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-linuxarm32.zip",
        sha256 = "3a6e8d8cc718868cf5b8f1be66ff415d24f5ff80872610a79c6ab53266b5b992",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-linuxarm64.zip",
        sha256 = "bd2695d30bcf8eaff99e3cce04b988e7df90f3b8af95eac2b7059bf88608c24f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "cd64f84bdea176710dde286fcda9175d67f40763e608f69c08eff5965511b2c5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-osxuniversal.zip",
        sha256 = "d884d6b1089ddcdabf20cd272b9311661ed26601c0f086c81e86966874922638",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
        patch_cmds = [

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
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-windowsx86-64.zip",
        sha256 = "5403099422eee5c5110edf3096c3d04c47d580ca06a52c37d2624bd623a84811",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-windowsarm64.zip",
        sha256 = "040fa1d13b8717a766d76db6cf05f257e52b1ce8c56892a4d9822c781110bdb0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-linuxarm32static.zip",
        sha256 = "c872ab1db8628e195c67a280972ae1be7a1b66d4847fe722f5ddf3c42c2bd8e0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-linuxarm64static.zip",
        sha256 = "a8ea757f96da2f0c62ca8c9ec0064d231083a4ab0fea016b0c9709ea6b2a2750",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-linuxx86-64static.zip",
        sha256 = "12f4c28833d6463137426aeae4d2c493931e4457cda4a8794b7f05b42c0e5167",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-osxuniversalstatic.zip",
        sha256 = "133274be3f3d11c2b0c62414052c0372536ca715a03bf3b78d9c26d53b04b761",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-windowsx86-64static.zip",
        sha256 = "79c55f2a79a29ae5353e1048e4f6378e64c4826f1ea2b656eaa19550976a9ddd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-windowsarm64static.zip",
        sha256 = "f3c596452a573fd29751be5f0e7f9fb4e381f4f63037d5c754b2b0b6c89b7021",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-linuxarm32debug.zip",
        sha256 = "a970ef050c7f5a60499216e8012e4f2e33b66fcba384e2e119125a4f43ee4019",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-linuxarm64debug.zip",
        sha256 = "f64a50ec3252ec9a90966219c167d9a896bd737e84e7a47280dcce70ada90d1a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "fee066018da07efd312e041c7ba190fa8102a60d3f9e33b3b5c997512e924997",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-osxuniversaldebug.zip",
        sha256 = "6810d22d3ed776fd85a874028858bfd8e246736e030e3fa180069a9c88fb6259",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
        patch_cmds = [

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
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-windowsx86-64debug.zip",
        sha256 = "5ffb0efc64353f09776f9f2c2d1ed8476f3c3f8c346a96b17d368948661cec03",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-windowsarm64debug.zip",
        sha256 = "9c37148daef9a06b6c11617613536406f201ea0b330b4ad9468041f22e60c530",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-linuxarm32staticdebug.zip",
        sha256 = "736c838fc00a8931242cda58ed9d8c3356a230be30988385c661d573a26972c5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-linuxarm64staticdebug.zip",
        sha256 = "073b20d28810fa903f22af77d93876575c0318e060026c6778b302a5f462643a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-linuxx86-64staticdebug.zip",
        sha256 = "2f2859f8333e313ddecef079fe542aeb0715f427c27ac5176d9bcde7dc6c796b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-osxuniversalstaticdebug.zip",
        sha256 = "ef90d6953cbacb9a0ded4c76fe0d81dfd2ec8436efa048e246f5ad96865fb0eb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-windowsx86-64staticdebug.zip",
        sha256 = "4c00a898e8ed2a7f147476fd798c5f4cd91fb9ec1b2d35f4783c52171c69d215",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-windowsarm64staticdebug.zip",
        sha256 = "aa958b434087e6e01b050a8cb48fbb1c8b9b70450b8ff9e9b8d1e08048141a2a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-linuxsystemcore.zip",
        sha256 = "868a44fcd5f893bc3602d16f3abf9f8340da3cac4633a0820b006ce25afc54f8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-linuxsystemcorestatic.zip",
        sha256 = "7f0dd02b3a6cab9b6a7be9e8e701a583c46fb65afa7acd096885f5cc96eeac1f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-linuxsystemcoredebug.zip",
        sha256 = "47b8effdb383bb09cf2ad0f2e5065f042ed591e65197cde1b1f3749a81837e45",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-linuxsystemcorestaticdebug.zip",
        sha256 = "74b726f728ec173373cb3e5b4d6baf8378769ddec462fe9369f7a98048ae695a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-headers.zip",
        sha256 = "0cec520a6191d18e25117d62536833adb2a5752079b3f75f95700b744ca9dba3",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-sources.zip",
        sha256 = "7a0d123b231d9aba85e6fbc5ca1e6aaf7397e2f72a4244ff1a6784d88f22ff93",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-linuxarm32.zip",
        sha256 = "bfc93f9f60838ea199409ac7a4e0327409f7ff82167050d6a327ab3b81101107",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-linuxarm64.zip",
        sha256 = "5f77a4d4bd39a341fa82b516bdaf51ea91f93340f782306f8d22fedf0bd25740",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "8748779ff41fd185359ffaf5e6006e5f1e535540a613bb07eafaad0f4c67017c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-osxuniversal.zip",
        sha256 = "dfbd161225272f64a8f6c282fd14ee4bfe7a37067355bc474894167a24d02820",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
        patch_cmds = [

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
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-windowsx86-64.zip",
        sha256 = "f7d3f6ab56caae349c06d440532cc0fd7b979f86cffe7dd8c10fea2149fa3099",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-windowsarm64.zip",
        sha256 = "46abf081146b16f160c5280c544531d883c28a8ae5afebde3575d4293e315f2d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-linuxarm32static.zip",
        sha256 = "afcd054c68677f1ead06ed960cdae4fbbe9c2822e4189daf6a31097dc16e8e1d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-linuxarm64static.zip",
        sha256 = "78ffc71740cb84c929b740b102ffef1036f9d9425fb589317d7a2dda57cb5cea",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-linuxx86-64static.zip",
        sha256 = "c6693953cc79d133ab6c2a0abd9b7db617a26d60d68e9c5c23b88d304a1a0d7c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-osxuniversalstatic.zip",
        sha256 = "26c49fed1d83127b6ac2ed75106946179ac5f864aa3ba9395a896914d4d1dabb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-windowsx86-64static.zip",
        sha256 = "e7a896f122ff8a82a2bf9ff71eda1b0ad14e461edb97a189da511214483d8766",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-windowsarm64static.zip",
        sha256 = "1c0e5c5c36ccfefa50d7ff2fda4bc5e339c1ef54a66990ca6c04f3ad4bd4d8e9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-linuxarm32debug.zip",
        sha256 = "60e9731665696e5d2c51f16de0ee3173e9e0f0e615d4fc6d34eaf1a000ed18c1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-linuxarm64debug.zip",
        sha256 = "dc6c4c908a274a885624b923a1fe62ef37a4ab3d8270910bb8d0317129b78e87",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "6390bf21ea1fd0edef39de733acb70292bd4e6b04e6e801c86a563e4f19b3732",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-osxuniversaldebug.zip",
        sha256 = "2072e38846b18025c0f22b9670d3dae64f2e8d47cc1156b33d081d489a32c19e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
        patch_cmds = [

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
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-windowsx86-64debug.zip",
        sha256 = "c12310eab205499eb8dc0d40714f133babacfd690622f471269c61cc40a2e88a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-windowsarm64debug.zip",
        sha256 = "5cf2b7f63cbf749ae2c199be9c7731599a81255cf54e8043d9f6ef90c6febd25",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-linuxarm32staticdebug.zip",
        sha256 = "a00ba2203c102318329a98883abf48d9a13e984ce8ac84215343ac3907aad7e2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-linuxarm64staticdebug.zip",
        sha256 = "8376799966e82e8e356fe7296d48be73ba73032de24f4475233192a553b3bda2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-linuxx86-64staticdebug.zip",
        sha256 = "b30dfa8ab8bacdfc92273292d5b65f70a7ef783b8db04662dc5973e94ef493a3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-osxuniversalstaticdebug.zip",
        sha256 = "574bfeea07f853636d5f16c2ad054570b773229306c8e6663d8fd54bf7214b65",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-windowsx86-64staticdebug.zip",
        sha256 = "e8e5f96728b473b9a7293d778f4605c71cf70754bd985f32ee081ccb0661f643",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-windowsarm64staticdebug.zip",
        sha256 = "f73b66d8ce808b0ebb44808a6e09833216cbf7ba478ccfbc08fb22cb0444b088",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-linuxsystemcore.zip",
        sha256 = "7ed845af449d8a7cde15e27ccad34dffd4a0d05e7009a15a9f1f4f222145857f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-linuxsystemcorestatic.zip",
        sha256 = "0bad8e0ee19a2e5b2ae45dd58656d59075c40067a56c806b04109d668260c083",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-linuxsystemcoredebug.zip",
        sha256 = "6da558ef84f1aa0433cee25bb9e78a83a6d4823a12011e5537afd4f550694511",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-linuxsystemcorestaticdebug.zip",
        sha256 = "a93f222bcd8bdb2ac080c641f9540809f8f67022b05cbd6821d56c579dbb7eb6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_headers",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-headers.zip",
        sha256 = "393ad0f4134944dcda8cdd0096a394efe6e890c2721b200ee5d00b74222029e9",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_sources",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-sources.zip",
        sha256 = "a1644e268d4243603b2a892975e2742de7c854ad733665df7260a2b3e77908bb",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-linuxarm32.zip",
        sha256 = "d36eebba2ad459210336133f7e7b02ca093eb60c470e13bfc32ad251cf6b7af2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-linuxarm64.zip",
        sha256 = "54abfc9607fca257c1ca9d2749fa33f5cab51a83854c5db968ac10faf1ea4458",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "5ef2c8e283f9f4d60e34117f1ebd74445096ed244868bbdf0c37c158faee7d6c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-osxuniversal.zip",
        sha256 = "d7315e934c5884a894f2aa34c822591f4910ce9ec337032d4903f4d05d508bf7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
        patch_cmds = [

        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-windowsx86-64.zip",
        sha256 = "732ad5c66a900555ec1b04348784e856c075ccb45bdb2dbfab41521ce7558f17",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-windowsarm64.zip",
        sha256 = "33fcbc0d11b0afd895943c694a2230bec1b5b5db04a589afd6722c977f9eff68",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-linuxarm32static.zip",
        sha256 = "1f3cb4fdd41d0df68b6f43ca166ffb56016142888e2f7bf93073f99e6273df1e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-linuxarm64static.zip",
        sha256 = "1dc3674c1674bf8afa57abf9276cb2211f97fc380daafd92926507f32b5e090d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-linuxx86-64static.zip",
        sha256 = "b88bdb69b5d2fca078d73ec8129f59c787f6cdf2b9d69e3acf21af797e1a4832",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-osxuniversalstatic.zip",
        sha256 = "975a718cd5f66001af8edf1d33aef51e692fb1c79d0a0a7a6e3c6e4e8856ceeb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-windowsx86-64static.zip",
        sha256 = "5c42ed28a3ae5412f1257c432db312663ffaf82c10ad2148b0f8df2e9a3a2029",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-windowsarm64static.zip",
        sha256 = "5812f235a7200cc90ed76d2c67b574f114c657f6929dff3e53ab43238c820f32",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-linuxarm32debug.zip",
        sha256 = "f3b50ba61e3058f39d87cc1966b6d2e09cc2976cefc45b49e957cc240d454399",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-linuxarm64debug.zip",
        sha256 = "9b10e83d24dea03862d3c723144068fff7fced0edf4ca29aef8459705f2932c1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "abd67f8e8aff25126f5578110c45d141a4afd7fb7db6bc7fedf85950bc075272",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-osxuniversaldebug.zip",
        sha256 = "db1bf3ec41e51d9ed9d28662f6861ea0363cf880aa669b7b0e18067230519815",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
        patch_cmds = [

        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-windowsx86-64debug.zip",
        sha256 = "f5cd58107d1fb66480a7232a288ecfac5e5906842681ec504f9156782162c48c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-windowsarm64debug.zip",
        sha256 = "f616aa218e01839ad010e4d7afc407a5cb982bc1e3de867325e6351ffabb5520",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-linuxarm32staticdebug.zip",
        sha256 = "a79561e2673c82f248569127dc0e4a62087e6662074f4d82842eb21de58ae682",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-linuxarm64staticdebug.zip",
        sha256 = "402630a7b6ed86804f87f658a9b94d5f648ec3ebf87927d75ac2695162f6912b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-linuxx86-64staticdebug.zip",
        sha256 = "b59769d33a6f0d1b53bf75c65840516622543cba4888e9769f7beeea3252e1ca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-osxuniversalstaticdebug.zip",
        sha256 = "d67958d9b1a6bf8988b549266bdda2b166d61d013b0f39abe5e200ec15e46b43",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-windowsx86-64staticdebug.zip",
        sha256 = "40a4739e9b46b0a14b957eb08eb47594e2feab2aa774a48abd04dba51f0e428b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-windowsarm64staticdebug.zip",
        sha256 = "54d45ec76c8a28ae4e9482a2209e448751fc95e83120e3878ca5bca80ed21824",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-linuxsystemcore.zip",
        sha256 = "aa4f6c6fe8b44463edb57480827b83baf32653d641c55c86198ac7c760b53580",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-linuxsystemcorestatic.zip",
        sha256 = "012715cf37dc7f75c74fdd75e5bf16d8e88785530e06a25920f3d00c078ba0aa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-linuxsystemcoredebug.zip",
        sha256 = "58a7a80e869e237410368c39e8d321c8759cd7bf15eb93525c67e51fb4538d0f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-linuxsystemcorestaticdebug.zip",
        sha256 = "e9cf63b7147e667b6b5ce801be49a4b02806ad49a4c5e725609e1daee81b6201",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_headers",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-headers.zip",
        sha256 = "298b94473bf1800facb3ffcd3fc9e5f4e21e276808eb6d3adcda0ba7aafe7134",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_sources",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-sources.zip",
        sha256 = "d1c8826c0a3b3cbe3ad6d48fa5739fc32f6ce148730b851ceb25952a7df6cda0",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-linuxarm32.zip",
        sha256 = "1fba2ed0d5bf40f542c8fe998e49aae079b269590bbc9f979c667904bb5e3383",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-linuxarm64.zip",
        sha256 = "900d6f5df193ec513ca2dc0f1fb7e6d090ca6602cf4ae379e7441b8a05af8181",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "eff8db446f97dc9b703eec261865ada4ba2ae0816f101bc612914e7e383e97d5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-osxuniversal.zip",
        sha256 = "6f25874417eb23e229fa8d30d74cb97ebdd7780df209bf6d6387b48131a05b54",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
        patch_cmds = [

        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-windowsx86-64.zip",
        sha256 = "860fb95aabbe6e52bd11686a3c6e5d519f281232d747a49caa788943d71dbc33",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-windowsarm64.zip",
        sha256 = "dc750d827d1bde18df74ecceccbd3772e76491a28b628161066a06b35609070e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-linuxarm32static.zip",
        sha256 = "f116590373f604a15ac76b131d6851edc6ae1b5459856b736f86acf25afb9d66",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-linuxarm64static.zip",
        sha256 = "2c4beba9b62b23d23dff3eb6860c896fe1f53943a78e0b73f91b7c5ccbf918e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-linuxx86-64static.zip",
        sha256 = "c1e43516dcb3dfded8e379dc1859c3b1246ff2121349c06f975a4752480d0a54",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-osxuniversalstatic.zip",
        sha256 = "3f6144ce479e5d9831c5385e48a7fe9125680d18255c6e1e4246ba5a1d442e86",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-windowsx86-64static.zip",
        sha256 = "27cf9bc733b9e5cfce6319854d86f851d5fe638d60f074b19e882b9363804bdf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-windowsarm64static.zip",
        sha256 = "9c091d791d8a210a6746398867bdc5ddce9cc26a316cda090beb4cd40fc4af23",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-linuxarm32debug.zip",
        sha256 = "2a1bfe2b1d09e0cadbcc5b6002cf62d2345a8d13f03748f4fd0c9b7c9f038562",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-linuxarm64debug.zip",
        sha256 = "e312d31954e2887abb5e84c9b099447e268159d77b3240ed5bdc0d0925079722",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "b898393e889e7909d5d857fe16beaeb5ac7ca5cd5b50652bce9d2d63cfb314e7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-osxuniversaldebug.zip",
        sha256 = "e1cf63eef14b899f77301d69964da2b264968643c8b4ebf8f0aaf143c1f34e6b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
        patch_cmds = [

        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-windowsx86-64debug.zip",
        sha256 = "1c8295d2eb748f5e2cf66229d7919a874c2d50e33aa150b2d25c876807b34f17",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-windowsarm64debug.zip",
        sha256 = "d0a5ca38b2e3a6a13852b0dd7b64b72b7cdc7074ffa56a8f4ab24bf12bc457dd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-linuxarm32staticdebug.zip",
        sha256 = "dc6c5501db228890643de3d9cfd31a8dd25a1345d71cb3270a2b38e527c8df47",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-linuxarm64staticdebug.zip",
        sha256 = "ada2a65ffc982395a521b0b7ddf6170763e4b63a6a9e8b24d7d9fc24c51278f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-linuxx86-64staticdebug.zip",
        sha256 = "49961c575968762541996977c6a26f87419279a494f83881044999bcd74eb93b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-osxuniversalstaticdebug.zip",
        sha256 = "72fbc2133dd495af95eb21016055635c319af9b308d1c441a13c4d23247408e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-windowsx86-64staticdebug.zip",
        sha256 = "5fe30634c0d2667c4c98e1d820dd8cf0d89f0bd47fcc6055e5265ac34c335fe4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-windowsarm64staticdebug.zip",
        sha256 = "b1cee7a7057bfecbd6949399895196787baa4816577a279c977d0f0ab30eb7e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxsystemcore",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-linuxsystemcore.zip",
        sha256 = "12ddb2890e78442230d67c85e8768e483f0345185950866742a7dfc81ef9d8dc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxsystemcorestatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-linuxsystemcorestatic.zip",
        sha256 = "cebe003fe19791fa9afae65591c9b6d16e54b4b8f1d59a172c9ae42f3dbc976a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxsystemcoredebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-linuxsystemcoredebug.zip",
        sha256 = "afd4021f5180e14240ecb18cdf1adc6f52451d41f2cc32957cb2f99eec7ebb04",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxsystemcorestaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-linuxsystemcorestaticdebug.zip",
        sha256 = "07a133ffbe9f1d44d12ec4376205b95b163aec7d49c3959697440a3f2948b305",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_headers",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-headers.zip",
        sha256 = "f8e81703a99bb6b639e76e690dbde36e536c0e24efacaf6d6794d4f98656be00",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-sources.zip",
        sha256 = "a65ea65db684ac8875544c941b59835f0c5eb248d5719eb2b8dcada4cf9194d3",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-linuxarm32.zip",
        sha256 = "ffbfa8d8c0983a7572d2c4f77ed23e133bb7952656154c92e3daf3f358b7114e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-linuxarm64.zip",
        sha256 = "7a17affee1ab76d6eb40b2fb42137e7885c77a740df7348b18a636d9a06f063a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "36f0b91466b16d662db07f1ace016fa498f4259322aa11612e89784157bf3190",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-osxuniversal.zip",
        sha256 = "46befd785684ef1635a7fb75ec8a7f3f7f9c6930ba49aa97a664c09a8c17c095",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
        patch_cmds = [

            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-windowsx86-64.zip",
        sha256 = "7b83f52b2e9aac8df1490952791f76ad2edf2f13b06c26027bcc42684f5ba848",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-windowsarm64.zip",
        sha256 = "0634c9ead55d1335dc639d375b1ac6a9c20832b77f6c71b0a950006357f7065e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-linuxarm32static.zip",
        sha256 = "babeb81f5315ecd65f80f76146cf25e5f4353734395c37e5c39d0c299c10db95",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-linuxarm64static.zip",
        sha256 = "0b81950c7cdb790e37f1d25fa371c3f8d1a1f796446ed57f8c2e424184795896",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-linuxx86-64static.zip",
        sha256 = "14c474f053255dd54e1a38dcb0c58afdeb092494c83c276766a6bf416a6cff9d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-osxuniversalstatic.zip",
        sha256 = "f004a426f572233af366411249df454a2060462339d2d14642330972af31e384",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-windowsx86-64static.zip",
        sha256 = "f9d0677d9d53c927b24d8bd52703f5ee89909575d981a2493063f10a6a1f296a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-windowsarm64static.zip",
        sha256 = "6ea51d2ea6ab993de025751523af0d630d1132cbcda4de2669dc8c5a5e7269e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-linuxarm32debug.zip",
        sha256 = "1dca284743e8c2e5567fea695d4992fa72c08f9c9e53e238fc735e281a927d42",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-linuxarm64debug.zip",
        sha256 = "c949309eabf6877fa983530f03f7f7e33878c9d17b83967bf3c4c916909d4dc8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "653a0879dd4484ee8a0acf67a5f3850f72ed248f067c91b129edc79e96cede99",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-osxuniversaldebug.zip",
        sha256 = "eff68453eead08df432db7aa71e595b6da8b4c4251ac8e8b13a829c43ddb69cd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
        patch_cmds = [

            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_ds_socket.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-windowsx86-64debug.zip",
        sha256 = "65fced6bf4530b6c122be11174e8cdd933a0633874a23c5a33e7279b3fbbc76f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-windowsarm64debug.zip",
        sha256 = "d1711afcaecee2401cae2588810c0410dc20a51204d4838ff0beda0a12f89880",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-linuxarm32staticdebug.zip",
        sha256 = "4a92ff2d6f7b4c4bfca8996a4e0c7671d46a9d8fee62a460f3acad6ecffe3a8e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-linuxarm64staticdebug.zip",
        sha256 = "d680a0fcb8cded13b25a5fcf1564616dd5658fa3c58d9937d53db842fecda8bf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-linuxx86-64staticdebug.zip",
        sha256 = "100decef6e1cfc9a875c1eee25fe969e4b2dbdf4a3580b26c7df7ba9e697e629",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-osxuniversalstaticdebug.zip",
        sha256 = "9bf32f6675aedd33d58c2b12344b1eb2e6b339864143844c77823ec1f294166c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-windowsx86-64staticdebug.zip",
        sha256 = "adea4181485f08b7ed2686a71e91ded38e7832c575d28082ea2c770f05765464",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-windowsarm64staticdebug.zip",
        sha256 = "4bd3fb4c0b4dfef0308e31c52b59aba6c6ccbaf90c0f23def797227e9faef5c0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_headers",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-headers.zip",
        sha256 = "9ae647175b9e48181718daad4c73609edb8ebf4eafae401528db9c84a6129737",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-sources.zip",
        sha256 = "ddb3b7d0dfba73d0f72f8948691561d65cb59597a9816608aad5744939dd6d68",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-linuxarm32.zip",
        sha256 = "964ab24a120da870ea42e685be4153bd5a85cb8a331386d81e5912d13d4a0b8f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-linuxarm64.zip",
        sha256 = "2e31e532127618118c4b81c289657cf091bbda3d98467d70d09779445f2c5702",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "d163a9517d667f2536ea5adfcfeebadd6a044c8ec6e067d44470a505525131f4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-osxuniversal.zip",
        sha256 = "86514f1406444420b7a57cfbc791984681c27a088765f9029e2b3c84336b25f9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
        patch_cmds = [

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
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-windowsx86-64.zip",
        sha256 = "243cef98ccebcc2000cff19a1c75a3f52212a3df8d204a9c57350571fe999b11",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-windowsarm64.zip",
        sha256 = "dcc450c803e9ce94d090352ad77694efcac410e4a6ebe1e300a208814a010c6b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-linuxarm32static.zip",
        sha256 = "fbe28ff1439564c7eb9c5ce7d676334584df3b999549bdf3bbcbc21df4b82c1f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-linuxarm64static.zip",
        sha256 = "91c9e654aef4844cab08babce7b874b7f3202c0759fa840db4d5fddb34412409",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-linuxx86-64static.zip",
        sha256 = "55dd0776d99da9941c3e15cbb86997b53c0553dd6746a2a6b0d450ddcc44a2dd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-osxuniversalstatic.zip",
        sha256 = "a0a85ed45895270485f42411f470dab8d5cdc72b503b0461c0ce9024fae70c39",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-windowsx86-64static.zip",
        sha256 = "928f237560d194ae0b9890d011e8a350673d3e1bdc4651af81e6d8d5367f8dbd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-windowsarm64static.zip",
        sha256 = "1f8022dd6f550981f6a495e832920f08ec5b59109762b96582ce443bece6497a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-linuxarm32debug.zip",
        sha256 = "5e82d58fa61462c241c19f390c17a663415154cebec6973a2616ae9f63e2c7b8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-linuxarm64debug.zip",
        sha256 = "5b3471c8a0c67215edef313cd214660fae9c6ea721b05f76b0909560f82a8a0b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "5643a6650c6e38973ad86389cb729a97b5b778eaabba9134b1a1c8c4bc8d1144",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-osxuniversaldebug.zip",
        sha256 = "32e3827a4b67b84064058c2db838bd4ee627e393126bd815a83c46635333e028",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
        patch_cmds = [

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
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-windowsx86-64debug.zip",
        sha256 = "4fded82c6723413259d3c68b701c4dbae891f8e2e673a68a20f9dc8f08c9936d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-windowsarm64debug.zip",
        sha256 = "5355e90d283bba032c8e375ebebbea8fbebdf13466be0e931cb62baa1829cb34",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-linuxarm32staticdebug.zip",
        sha256 = "1302fb069c0af0d9f33ba36ff9700f418921fb2aa87c04d61b6a7d543b3a20e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-linuxarm64staticdebug.zip",
        sha256 = "8da0a47a5b8e1854779f981d1f492a14c3673df36a92a822be7e7005baada61c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-linuxx86-64staticdebug.zip",
        sha256 = "65591841b7020d6e64784d86ecbf5a78bc18a44cd740c2a4b35c272be3b1e4b1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-osxuniversalstaticdebug.zip",
        sha256 = "64b50e7224f2ae36df307a84b22ce968e7f3926860fe814668e14d8055d731a6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-windowsx86-64staticdebug.zip",
        sha256 = "f9af814bd4a9da41a7462c6e82cfe35a4900584c9b4c07154c29ae6540e44b5b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-windowsarm64staticdebug.zip",
        sha256 = "ed007f14fc48472afd72ac64938ffbc68670b7245413bedbd62bbb7eeec2f5d5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_headers",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-headers.zip",
        sha256 = "fc30d7fd43b5787b7e22c816273903005fabe88a93c12f6167f2b1d0ba0d7ce0",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-sources.zip",
        sha256 = "d44c0ca8a09e3ab455655d09c57c1e4016cb3305cea699495eec9df5014951fc",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-linuxarm32.zip",
        sha256 = "addee8249a9c9346817cc6ed83aa363725a608206c54be16df9011860783e40b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-linuxarm64.zip",
        sha256 = "1fbf84ae2df242be87125c39c9ab37c5a09a76ac91ed6846b208bfcfc78aef7a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "49117e56f610f2d2ffc17774d466cbe3990a1b8619ed3238c7b321c444fb8bd9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-osxuniversal.zip",
        sha256 = "72b2d8cd4b9e501bfc151ca18a950f752b8ab3c3c892be266eec1038296bb923",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
        patch_cmds = [

            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_ws_client.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-windowsx86-64.zip",
        sha256 = "653eeeb37281590a07c70a14a9b1145393f6ab8fac4d427b2f882032ba253498",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-windowsarm64.zip",
        sha256 = "f85734c9f6a31253f893949f5303a2b2057a16cc3a8d4ee84ca9bf4db22bae1f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-linuxarm32static.zip",
        sha256 = "4ebb3e83592cc851b6f7eecde94884d4677bd6ed144391bbc7bb44195cc831e6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-linuxarm64static.zip",
        sha256 = "993c0bc38cb4e089c46f8c6a8fa8f2d0785f7007f134c4f4bb46f7be5c0880e1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-linuxx86-64static.zip",
        sha256 = "8ccaf1369a98a249e831c23d1164685750bac7e3d5961fd6048f59518039f04f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-osxuniversalstatic.zip",
        sha256 = "3639b825de245e2a0bf75cbd70b3212eb09d0c9d41d4a5dd6f53824063409c12",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-windowsx86-64static.zip",
        sha256 = "46ea81c8a64f98de0ace3509024137ce3aa5a89d62e0e473704524022dbc794c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-windowsarm64static.zip",
        sha256 = "94fc74301fd8572cafa77767651132cd0758365c1d3c461d4c4c7eaebe53fd12",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-linuxarm32debug.zip",
        sha256 = "2043cf8bd2f017dcb6253d050095fc90e0b8ac166eca4f3a7ab3ceaf7e12d5c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-linuxarm64debug.zip",
        sha256 = "78dd6b20a5da5ce3012449288f2dd5f8f6de5175d94e52f895ac5468618543c7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "e450cc68ee025e1ba1e4a695f91cb53ec69c893f2e2333ff5e12230fb4aca166",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-osxuniversaldebug.zip",
        sha256 = "cdce37fb6c1abfd43fc6a5ca54b763bd2c2492909952e604af006172233b1876",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
        patch_cmds = [

            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_ws_client.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_ws_client.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-windowsx86-64debug.zip",
        sha256 = "4c1942aedba0c5c92c6fa3967ed0c80538d0e4fe78af509ae0700db9100ec8ce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-windowsarm64debug.zip",
        sha256 = "fe6b9467230d89a49b4f0a2be61f82d87f1548bdcb55a3483833e97d0dbde6bf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-linuxarm32staticdebug.zip",
        sha256 = "ed9f92e53921b7cb92e8e54799dce8317a970c840cef8220f8111ed0fda5a2d6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-linuxarm64staticdebug.zip",
        sha256 = "05f7bdf510e8d43f9e693dad89784bc434b79031ee015e93e521138953693fcf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-linuxx86-64staticdebug.zip",
        sha256 = "22be25a45890577a81526fec1545b2c3f34377fdc03be147c59788d3a1eb3e63",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-osxuniversalstaticdebug.zip",
        sha256 = "a54d4a67ec369fd3b878223c63889ddc403a2e07278ff4f1848f323abf42ba87",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-windowsx86-64staticdebug.zip",
        sha256 = "724e047fbf61241722fbfd77375f546147fa03df65a99a8c1285b99649a66051",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-windowsarm64staticdebug.zip",
        sha256 = "9cdb79a01aa63d766e9c24917a21aa1924bf8c41c55cc95f4cd333c9365a1749",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_headers",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-headers.zip",
        sha256 = "e0b59752a2addfddbf57067bedfe70ed3963216c7900cabbd82a4a92265fb4c6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-sources.zip",
        sha256 = "dcdda87d50f9f5297153d82d3a4583c747326e4e935ca03899f3e04abba80090",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-linuxarm32.zip",
        sha256 = "08e9bdc37d6a77e78a3a67e69094f4ca2ed5972827e4408e55ea9bb22446a3c1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-linuxarm64.zip",
        sha256 = "7aec4cf40ec20a13450576bb6d7693c2785f52b386f9dcc6d0d413f3be7b29b1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "6134860a0e43eef2e28787aa37c78f39387289763c61d25a3b9f9cc66e3fa383",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-osxuniversal.zip",
        sha256 = "a672b57ca212600a8bf13b73f7cbe46496d2b505c183412553778fde73a2ba2e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
        patch_cmds = [

            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_ws_server.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-windowsx86-64.zip",
        sha256 = "47de785bc8575f628e0665934d50796cb0f06646fc3ab56a5b3d24e5fc8570a3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-windowsarm64.zip",
        sha256 = "175333e4b5bab6617c49c46ae9d0e41f416ff61ec6e3cb376cab45c16880b47e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-linuxarm32static.zip",
        sha256 = "d7a1971106ab4e91e0f2e0572b635c7264e53b3d9868caf36626d82783b7ca42",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-linuxarm64static.zip",
        sha256 = "89247476911124ea6ea475a24b09e21af268a17f9cf865a640408da1e1db43ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-linuxx86-64static.zip",
        sha256 = "27a46a9bc08429c7247ea2a2f8aac5e2a7493fa331ea0eddca05405d64dd39c1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-osxuniversalstatic.zip",
        sha256 = "dc349d65683d3cdd4fa4cc4e535998d7fc87700d2f351580356d4774e6e3f26b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-windowsx86-64static.zip",
        sha256 = "ad5c8c160def64d7a3ffe0db8c394b1ed42c9ff8ed02ff4e49baf342f274c717",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-windowsarm64static.zip",
        sha256 = "9c377ba8d9e0a9f4410a13118ddaf2fdb12f40fc77256919400cb369b050da08",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-linuxarm32debug.zip",
        sha256 = "65966cddad81168c8744c6b3e1704c30e2ee11428ab94be207d54b3364f8fd72",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-linuxarm64debug.zip",
        sha256 = "0faf6e8b2f3de00c7f26b868e520a6fc5a6a633572e86da643c000c50f3fb500",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "02e75895d35749c9a31e6b2a12de1974b86439a71866d0db5a2194aa66d0f986",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-osxuniversaldebug.zip",
        sha256 = "826d81ba519439f9296ade6f6acf61f1a840b3e5a8cf97315d6a13a5a1229ae6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
        patch_cmds = [

            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libhalsim_ws_server.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libhalsim_ws_server.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-windowsx86-64debug.zip",
        sha256 = "0a59775733297bd3bcc46e373d890cb3a4a4e10be881739b56df19aa23b88bfa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-windowsarm64debug.zip",
        sha256 = "3ee3bba3629cf85ab66dcbe1149cd9df2403650c83ad09cf1129e43a2f694612",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-linuxarm32staticdebug.zip",
        sha256 = "137bedb8c9bb3461e57ad5a09568c5433913d62e663b94d7e17099b716d1c448",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-linuxarm64staticdebug.zip",
        sha256 = "929d381fd6d112dbb39dd467ba28a10035d9d82670ab5ca2546c53b5e39559f0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-linuxx86-64staticdebug.zip",
        sha256 = "07de657d3d4415aa7e903801a3f909dc95c823b3e57f4f1d74b147fee9504c66",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-osxuniversalstaticdebug.zip",
        sha256 = "531282eac632707c76c1e7a7a185dda6182e0efa0f8bc414e5a4f517785e1518",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-windowsx86-64staticdebug.zip",
        sha256 = "57ccd87e64b2e820531c8673e888d0e4e131699740a2de9e08af7fe086406dfc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-windowsarm64staticdebug.zip",
        sha256 = "9c9c5abc99fbdf48da5db3ccc3b8e924b8fd867b480ba0ec3307eaa8c22e2c82",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/tools/Glass/2025.3.2-123-g22d12d2/Glass-2025.3.2-123-g22d12d2-linuxarm32.zip",
        sha256 = "6534fd4f6c53caef9576271414507e3074fab93645816260d47b9a0710424403",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/tools/Glass/2025.3.2-123-g22d12d2/Glass-2025.3.2-123-g22d12d2-linuxarm64.zip",
        sha256 = "93262250e964c48f621710585d35d374580630df59c6ad85608629fbbf22e014",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/tools/Glass/2025.3.2-123-g22d12d2/Glass-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "7a45a029bf6507d4627f98d8d4c3a1f04c3885d1d2aa547561c33bd4f1ee3caf",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/tools/Glass/2025.3.2-123-g22d12d2/Glass-2025.3.2-123-g22d12d2-osxuniversal.zip",
        sha256 = "388cbe69dbd3fc283fb8a6e4364b8add37bc54ac92eecae33aa490a2bff8465f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/tools/Glass/2025.3.2-123-g22d12d2/Glass-2025.3.2-123-g22d12d2-windowsx86-64.zip",
        sha256 = "6721fa98b04d18c7eee92df687d1e3a08658eaf0cf6f286f9881939283c144a6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/tools/Glass/2025.3.2-123-g22d12d2/Glass-2025.3.2-123-g22d12d2-windowsarm64.zip",
        sha256 = "da5a05008a3a6a549523ba00b650a59ca597e9ddb199b0746a5c9b6db5927c3a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/tools/OutlineViewer/2025.3.2-123-g22d12d2/OutlineViewer-2025.3.2-123-g22d12d2-linuxarm32.zip",
        sha256 = "5dbfbe1c7d994dd98a5669916809a3b2036d32f9e7eef4e9407a688f1cd03b9a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/tools/OutlineViewer/2025.3.2-123-g22d12d2/OutlineViewer-2025.3.2-123-g22d12d2-linuxarm64.zip",
        sha256 = "13c81d14c6a1d21bc68129da3e8148bccdc54ea2eece20b579bac9e163b14eff",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/tools/OutlineViewer/2025.3.2-123-g22d12d2/OutlineViewer-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "17391ed4eb8ba0dfc2e2641e8a98d3cdfc0e5199cd5f54c103a2a8cbb6082787",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/tools/OutlineViewer/2025.3.2-123-g22d12d2/OutlineViewer-2025.3.2-123-g22d12d2-osxuniversal.zip",
        sha256 = "4ce446bf223160d027acace2b3ca572a90c0bf142846813f478340c1fee74ac0",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/tools/OutlineViewer/2025.3.2-123-g22d12d2/OutlineViewer-2025.3.2-123-g22d12d2-windowsx86-64.zip",
        sha256 = "7ecf5eeece652e2837eee0bae6c4de6464708153692f9d0b5ef2a0813f92c723",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/tools/OutlineViewer/2025.3.2-123-g22d12d2/OutlineViewer-2025.3.2-123-g22d12d2-windowsarm64.zip",
        sha256 = "1ddbcb1af5602d0a2d97b991d5268627416afb04ef7f4327ab200ddb09184f06",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/tools/DataLogTool/2025.3.2-123-g22d12d2/DataLogTool-2025.3.2-123-g22d12d2-linuxarm32.zip",
        sha256 = "6602906ab586773481d05f8302de2954bd735ad47049cd294280d89dfe19c9d6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/tools/DataLogTool/2025.3.2-123-g22d12d2/DataLogTool-2025.3.2-123-g22d12d2-linuxarm64.zip",
        sha256 = "427775124510fb67933a8c1ebf27fecd34e076e09ba85dfaf55c0dfa75680116",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/tools/DataLogTool/2025.3.2-123-g22d12d2/DataLogTool-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "c0f1c293413a27db9fefac780b8952fb6d444a44394a169e704846d7d00b29a8",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/tools/DataLogTool/2025.3.2-123-g22d12d2/DataLogTool-2025.3.2-123-g22d12d2-osxuniversal.zip",
        sha256 = "6945a32e15953d4d8bd9a71f694432f0e405bf5526b05c6745712ecf76761fa3",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/tools/DataLogTool/2025.3.2-123-g22d12d2/DataLogTool-2025.3.2-123-g22d12d2-windowsx86-64.zip",
        sha256 = "99f09406c14a9cf799e36a4c230e1dd86beb7c70f9d276288acaf11ac46b439d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/tools/DataLogTool/2025.3.2-123-g22d12d2/DataLogTool-2025.3.2-123-g22d12d2-windowsarm64.zip",
        sha256 = "51162b752067c219ef04b73acfe14515d17eed986e29c8fac093773516f28b2a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/tools/SysId/2025.3.2-123-g22d12d2/SysId-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "92cbcfd407ee342d0cbf0171f61b7c0d098686f43816ed0db03f1fe232d7f3b4",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/tools/SysId/2025.3.2-123-g22d12d2/SysId-2025.3.2-123-g22d12d2-osxuniversal.zip",
        sha256 = "c196fcdbc523b1d81b2245ed48f2c377c456c17e86e23f683158506fa4018f51",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/tools/SysId/2025.3.2-123-g22d12d2/SysId-2025.3.2-123-g22d12d2-windowsx86-64.zip",
        sha256 = "6f7d98076ad3847956f38575879cbb7eaa610ae8d27c2f585712ee78101706f0",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/tools/SysId/2025.3.2-123-g22d12d2/SysId-2025.3.2-123-g22d12d2-windowsarm64.zip",
        sha256 = "2d99ac7ac44eec850d26ae7fc0cee8a83e837b08effcbcfcdbcd509b06e9e3e3",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
