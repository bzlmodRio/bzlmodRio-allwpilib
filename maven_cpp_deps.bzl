load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_jar")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

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

def __setup_bzlmodrio_allwpilib_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-headers.zip",
        sha256 = "f9c940b90b22ca2a1cdefd8545547331aedee916c0f4857781290f59fd743515",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-sources.zip",
        sha256 = "de10898bbcde8368619efa4eaaa25d5fc4781a99e0f17b3965826c9d47253ea5",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-linuxarm32.zip",
        sha256 = "a708e395d4ad0881f65afd477cb287dbd0adacf60d5b2714ed30a5532bf44862",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-linuxarm64.zip",
        sha256 = "a50fe1d710d26c430b76fbac61f4b3b764f47208875775c766e10f228031e40f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "96ccb08d379c5e46a13a5e5dbe7bafc62a91965b10069e3dbccec74e7553cb0c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-osxuniversal.zip",
        sha256 = "5b91f7f8be9f6900b7730b9ecad66211fa655933d72eaaafd4ed119740060428",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "b7db5cc8ab3d0742404e341357ab73d710ca0fb13039429afb4fe1b65ad77557",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-windowsarm64.zip",
        sha256 = "306ae6dd1b1c6e777424d97aee04011dfc984bc972e396a71677e16d8a84397a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "33df83f1c2135a61f7941b130b309e09000334e5ba4796a7eedad80d32683db3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "0519244da972f73ac1ee7d0ad2fe3636faeb90cfa26f7d20213944b8f34e4f47",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "0fcf1ea367f6a067658938def2176815c14dc9da65bfc4352c07b7f64ae6021c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "48a14fb92f90d317a6da54f24b984a907e418fdd4248c0d1c672cb7b7c3b2555",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "4b2c56d734225b48e0ee320a86aaa6e2f64b6063a8ed8aa4873669c040bb3643",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "2954e1d01aca27063b460dca9ba7ff75e83a046386b586d917e2dc52439fcbb8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "8b425f2871bb621eaba698bae3f6db9f5a26ac55004e73444b7dc4db63ef29c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "839e20f459e2b0a4f759427776fc5b7d85274f6f198005891c2ce7a6073b7d7a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "ebb8a3fe84588fee415081cdcc6eceff561be05a074505652d5877807e3eec83",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "1cd57e12fd3c7dcb92682fe4f50d5fa9c66a4369bf06c3dbb5e4ba980e43be06",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "3933d4e96082cb038e1e78be2dcc4cbce9a9feaa4a8f5f463efd2a62735247a7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "350db998967796875e1b64d48c1e1fc7d017f2984e864cfe03c6590ef3072752",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "7365ff30bfc859e1fafa6a7531c98992421139912d0c2b60793f181b7f73c8d9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "321738364a3633484b42d2cbecf1497b29c51301dc6422f3a5408678e3529fff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "377c7a77985f4534bede415a7163d874d2b54245918685475a0562b87f708cd4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "2ca5ca30056d0dfd95d7a0703fbfa140f0d3588e575b0f2f2196e9005ee2e19f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "5fa09e02b27a0c2b664ac8cb8249f66c764c4ebcc5c970e0a2a1667a6a04bf7b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "bcaa081e059a65921ae4f3510e92b4825fe70ab471aada0c26c0ac4e32d30d04",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-linuxathena.zip",
        sha256 = "6da31e0d078aaccf8b9ac55bf252b76067a81b288131961e0d97fd4ee878427e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-linuxathenastatic.zip",
        sha256 = "3efb589919f756dd63c78eed5c7b4200c5aa146626612240e8d4aec4bd65cd47",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-linuxathenadebug.zip",
        sha256 = "19f8b228c3c9cfce142a708bd6805fc619e9c7c076352b2675ef454b56fd9fae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-1/wpiutil-cpp-2025.0.0-alpha-1-linuxathenastaticdebug.zip",
        sha256 = "0edc1396f15f2c1c2483dc3204f5ae975db2b24bba37a8787ec47423309aab52",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-headers.zip",
        sha256 = "ff5669adddde6fb29699e1b9fa5dbb1c56ac7bd9658c93ae74b1f41e03524fcf",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-sources.zip",
        sha256 = "5fc479785ac648d2a1a6f919b8699e742da9578615dc080cc699136bb5ddd8cc",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-linuxarm32.zip",
        sha256 = "6f790daf00b050ea72c012f46791b8b6167e1c9b096d50b8c27c4526cf662284",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-linuxarm64.zip",
        sha256 = "53a100ad0a93e0234be4c222e653b3370c46da372ab8c040b83a6268f92f7a17",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "0bd9bf6cbb46938257a5637b2fbabe778f9763c150a91c8fc9fd9518f009bc16",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-osxuniversal.zip",
        sha256 = "a4d0d201570034cd112d239950e717b58a4bfc818faa035d2d33b6a1ba83fbbd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "65b2b8055ba9dca5fbca74a6cd7a0bb6064c24a3b74d6846031c36252263070b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-windowsarm64.zip",
        sha256 = "06783b0c3dae483b78b0c883d2563d736c89c4f50fbbfc96014e0d0bf0654b22",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "b0af8373015b284e33cfecca42fed4f569bf3c8b6eb5824a365f38f38ff8c5e5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "86ebf1a76f276d99a1064d9166917798db4b63b83f8a8aab68330157cfff7ae4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "666ea26ca9ea60e4886d2aa6ecc89c162342c0a0bc8e05bd897e0ee769244bfb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "33569643ef1e531a178d1d76ed2cd579ba74381567526760cf5b45989ee43da4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "7239a84b4f18295ec23b268d403f025cd90c07a37a0a40d9e9ebacd22c3f3ba1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "e8e014faba4db17a57d8f7135900744ad8f402e659ff9ada1e5b821238883a50",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "6846a336080f4d96bf260a6996bfadc6dcf106f9643115ed48e19245c75acb50",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "a4e71ca282d72cc34b40bda45f4d442111160b58e86491dc7f6113c0ab3717d4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "0bd43527f0bdb10ad24309480b9b75656a364a2b1bfa1175d5c6b81358f09611",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "ff2d8b4183e02a196ef498db3d7191d44fe5b260934f5aff7a66fe4aa9c0c1b4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "03536979337a81c5aceab4833f1449a80579340ea962488a92a0e6df379fdf49",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "00c6d28a3c3e85eb6a1c24f3c2cf6cac3bfb8cab93a67fc5cfaaa54e69951400",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "0f843a1980df292dd555814a868297a8c8292a65192f3e5f295c519bd92f3dbe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "769f597206e98ace97d00a9135c389be4fcd4ec62b6f33327fa7c4a5108fb65a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "972a39870ef695b9dcc9b83f850d10fd1bd968ba98ec54eee23f6c3f478a8e52",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "c1f89f4a06521796d1d7a1636d94837ea861160b5a87df016a117a9ad67f440b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "62826ec5615d00ba4ee4987885a89f7544845516de0fe4c746688cc25c4d270e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "3cb4e7de201300fcf599be190c6baf2003e1f74907e53c991ec0d74dc6a3a0f4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-linuxathena.zip",
        sha256 = "315ef10c20d03275cd425cc5f08c738b76d7314d035e749054383b95b14f3b27",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-linuxathenastatic.zip",
        sha256 = "e6da3d49e1e941a84bb2d5c7ffe4068ac54a73444a4d07e719886b9b20409021",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-linuxathenadebug.zip",
        sha256 = "1662140d364f9a1aa0257deecd8b2df670b862cd065a039a4a8e0c8137731116",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-1/wpinet-cpp-2025.0.0-alpha-1-linuxathenastaticdebug.zip",
        sha256 = "800e5f39ad691c10e5af40e003cb92d90a2f317a48cb8f847e125902f5f7bf85",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-headers.zip",
        sha256 = "23df1e5ef84e06815cb85c34081a1c3a38d0e8d0220f6e495fce1b75da5a9254",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-sources.zip",
        sha256 = "deacac604eab251bfa374a70e2423e60d5cc1d12a6185d727c6debfed9ec8f1c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-linuxarm32.zip",
        sha256 = "552f115c0f5fda039c7c3e98fa47e53921f1a836c1fd4ea6cf56ddb62bfc3254",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-linuxarm64.zip",
        sha256 = "c40fb2526eb05d980b995f915cb1c4743167e793cc704435705751597c6e0bb5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "d02c13a4b88b03c0029e82f05df53d310d120d990bf209ec14ce702d491da1e9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-osxuniversal.zip",
        sha256 = "500ef3f7925b52d22e1d2460cc20a645928166ea8485ee74ef706f2cca3146aa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "6177151d8bdd30d530da5dffc3b8691a9625dee4988ecc236b2a106dcf47fb09",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-windowsarm64.zip",
        sha256 = "8f0099c1066973f026225f0a5571397bf63caeec2727f2980ea4fcbf049bf918",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "aed2f15b0933c82dc7dbeb3510a9a6675f5e2997b169418bd20c6a24ea8425e5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "39554ead2717466d002d019d437a8a449988c0d42a1f2b0b3715a705baf63064",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "76206918fbdd56acdfe6dec6350bfc893d0cc49220ff68597793b95f2fcf046f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "ba71203087bcd2a183af844dfa10a8d9dc08d4d3ee5836bd95cca31e9be79bc0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "80109bd4b18752558415a8215e870c750435aa77702618cb6d99a6931acd9533",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "eab976eccc4a218c86ee8d754254a2a1677b3c300f86a92a8288180af89d4b2f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "d9a2604cb830f34dd046f597fb73b911058c0e8e47ecf8f9f636c11b5677d90d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "45f06293ad9dd1f381d8ad6b382602ae198a167d29642db93a161ad8cc607908",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "d96e7437af62883e70acf103bdf3e596bd5242e7deb710d5e5ee47f155b0c091",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "9084c2910fdba5e538d7ce5636e9b922f207378ee4695b0ddfa2c8edc64ffff8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "7bc2982648a3042e690aef81b4a79bc2685c2c1772d0990d3a6f776f94511f34",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "fca7defaace0493dceb8c55a42acb48afc41fd5c2b76d32cb4a397a45bfdf800",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "b1663932fcc223df37939f72f0335030ec0a1601f92a4c812ca358b6c478b912",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "69270b468430ad8795277b6741a811e0df7dd1e01d342964de6c2c392218ef04",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "1bc1069478a4707c11844e1944d4381bf10e003fd2b8f1371c9c79b6585d3531",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "aae05fb8a8ab9579e3e16e08dc8afcfa795413a6be780ee7a4b3174f0950c8ea",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "64371e027f84ff05c76172cfc16c89e221178548f4d85135b04628f8fc3a94be",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "6c63e5a71f45d301651b082575fecb424eb2a09c176e918a49de547eaf96f110",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-linuxathena.zip",
        sha256 = "81bb8b5fbd78fe5ddf96468445ef75c5b44c400ef0867077d81538823623cc91",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-linuxathenastatic.zip",
        sha256 = "d27f56f94c403efd7e3ae72bd51ead92864a439b3621920c3cdb19e4dee15f8f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-linuxathenadebug.zip",
        sha256 = "9dabca56650607fb4c6c383a2bfbe34440f4736c829ca6c0d2c282856e3757f2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-1/wpimath-cpp-2025.0.0-alpha-1-linuxathenastaticdebug.zip",
        sha256 = "4381a45470604aaf7de72c297c817a712c8bcc58a43609ee003bc9510448fab9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-headers.zip",
        sha256 = "5155eca84f4d301353c87e1f8e24cf6d41b50609c4d6816020a067b0587b30dd",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-sources.zip",
        sha256 = "63fecd31d115281d58617fc442e770f9cef8f4c18b4d6504ceabe159664896de",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-linuxarm32.zip",
        sha256 = "f761cce4b590eb0ce99a7e4aa8fdd173d463bb1f35513ca150775173baab0b41",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-linuxarm64.zip",
        sha256 = "9c3cd5ab0e10dbba10d9d66b71ad8eeabddfbd61e4dbed11b575e8b03cd470cd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "55ed0c0087b4d563bfcb53c699516c3435a38f9c638b0c18f101b4635fcbf078",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-osxuniversal.zip",
        sha256 = "28cc09649ace15a65e724cbab9d09dd8467c3d7d708d9f85a05cd53af436bdf3",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "373abf36775c2f6f52f994a2a808dbe99d73cfa874f20c628dde920983f26ddc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-windowsarm64.zip",
        sha256 = "bdf08a55afd14fd42bdfb601680d61ec00291059d7753032ae341a163ae3b080",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "367c42978854e174d6d07906fb4a7f12144392677ba0e1d78bca18b01a7a18c9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "136097378eab148439c077f3916ad6bc84208ec8b51894eca9de1a0d1531958b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "68040cb7c0d5bab68025c04897f183e39b7ad1daddc5c32f013637412e96165b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "93ee8c3538f86a665ca602c4f77b50688a0e93bf87d83f6f06381927203e0da7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "d516b2df91d6d4747d84f68589a59299d780db15f71f63cedff8c14aaa3f862f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "4ddc52fef5857de8ce08ffded31dcfa931c89e24a31158eb40ee4e00f4fb02aa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "eeebfeb91342f0c50d5fc9c32379596b831a3aa6c963b3eb981a720a5598f427",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "973b08e9fb4727ad4d07b0297d7b91f684bd518d3a5810dc5c1114142e9b326e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "135e44a9f1f61ad69ebfe7cf59d8e7fb77501f5e8ac07961c680960ed322bfcd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "716c4b9cf31b8a993eceafc16112947006af8c7e287c021d9e73f81b009bb6d4",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "236676b39bc8985a1eeed4d140c2813c1fa50191f8720f03a2a045749b0da2f8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "ada03734eb53c77bb01a4fde1e0a5463143209ae474c0b2f837bf153e737c4dd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "51f06535194c636328727b6cca07d6f063d3592e08966e93144ede8106afdaae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "d03f05e737a4196c1cd1a78f42984532ac8208c8ae45a5e45f290670b7e67ecd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "363bb5ef2e88d3a322f21a6c625d316a79b0935ab37f23be6b86e4c4b4cf7a96",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "49d32fd13c562a3c5c5401cad501c94b9199118c804299172a4a98526e77d520",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "258364723a9e56fc01855e6556938baf0dce86e006cc5a1403abd301c8ab3c69",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "548a6bebe5b434f9c5e86031f6ff238496fddac19bfbbae41bd57ac05bd18301",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-linuxathena.zip",
        sha256 = "370452017ebaa3c5531b226cd9b133390ca1bd2f8ca8ff51de8ddde1f9d167e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-linuxathenastatic.zip",
        sha256 = "1793e2ca32bd5887a2cf7055c0a263dc613b832d293140b93750011e3b67638f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-linuxathenadebug.zip",
        sha256 = "e820e4744da3ae58b36e4eb259feb2d3b4eb8c3638d9a1649151b2038c559011",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-1/apriltag-cpp-2025.0.0-alpha-1-linuxathenastaticdebug.zip",
        sha256 = "136ae8dc6ee5846bfacb3c38a8db4da552e3e5392af87f6662e9c46cf11affa7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-headers.zip",
        sha256 = "432532edb4f8376f5d05f95c7286418fa4314b3ec1323b7c1167ac80c68553d3",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-sources.zip",
        sha256 = "4d99187b29895b6cca98384f6148a60007483a5a0867eafc4ba9c7d6687cbce0",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-linuxarm32.zip",
        sha256 = "3769d2a684562727c0e16f734910375d6832505f70f56458f542a6fc7b39dedc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-linuxarm64.zip",
        sha256 = "5aaeae48358dde1d4e397f251fb9a36fa08ba5705df005a1a66d8233e96aeb67",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "75e1315b32c8f52ec5418a37a5c7aa231d9389852540f1ed30c062c294b34b8a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-osxuniversal.zip",
        sha256 = "185502dc558615b8d5b4e387c3da26c873533a8d72494526a06025ba7c0ce4ad",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "9263bf819eda503475483fc1dc498ad68bf8dfee4e520029840a98286bcec9e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-windowsarm64.zip",
        sha256 = "a71ef964e869494a2bb959868c49e674884652762cb8b5ccb4a5c23fe043ec14",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "884549b612c07abdb8bf659fcd5b5fcca30b123d1132eee6b1cf2faef7613697",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "146038f22a1e8aab226b98f69e8fa20ac7d41b70414ce80c582d801b66421c18",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "f076ebeddc6b5b12854d114f94a72478ac7e11e5c9d3d9cce993fe602871e680",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "e5f0bd15940f2e34ae4a0eee0dc081cc6d06dc90aa74669a1f5c79dcea381e61",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "e0d6005d7e6b012850d93ac2ff538b3a87c19a88066fa0a6389c91a675d09911",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "74c02c8fd151c288c9f8a08d34a3d724c38ffaacee5625a838aa0b2f02eb83aa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "b6283e9b4f75009d31022aeb992ded49678b8748c85015f086c3826545a82c32",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "575aa601b0cd01d6dd9e0da9e06b9c17df7f5706bd30e3870e0d8a2702c8f46d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "c0e8c99aedeebb67d107e70e7a028839e896e085e2b27a4fc102a099cac1d7b9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "f75cf07038e008048725bcf25a993208c964a5519189a7d9c36f36529eda3522",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "b93174c00dc47b436550b7ce000f684618694de94cdf66ae4661ed86531ae1ef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "b375d9066a4d30484d3fb8f6141662f6c09baabc3ff152951d0c8c5d3f0181bb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "5c41a375e7aeadfbe857bd0bed79b73969b92c58f6c60597582b4e5f40fe45ca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "1fe6473048dbca2feea9132883ae626498355de6d21859b469841b1148156882",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "6a39c85736faf5e7bc78567a9cef1838e470b3f728d02e33d80c787d733f7322",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "6379abe1f0aadbe675306c9066783e8906d0a5ea023191a668653421ea4897e7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "59c2649dd869241c09040da2d99b35f394846184901f1ff87182cb241f726236",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "c90b3766312235ed6118885f4e081abc8c05fb4c5616986815e6b4e4f66ca51e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-linuxathena.zip",
        sha256 = "592da8e4e0216de45a379ef3efec4a146149795c2dea55a72a8eeada246c0305",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-linuxathenastatic.zip",
        sha256 = "79530566ea4399492f2bb290739659628b1d9055f196b5c82f1fc5efe96d834a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-linuxathenadebug.zip",
        sha256 = "cd0a12f4bfaa11cadd1dbfa6d6d20c5b89edb3d07f7a3e84f4aaeda3dca4f5d0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-1/hal-cpp-2025.0.0-alpha-1-linuxathenastaticdebug.zip",
        sha256 = "913c2960847fa7d84abd5bab787d4111b31f0d51415f283c75457940b85bf68c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-headers.zip",
        sha256 = "a46f87b9a43ecf4c2396c817cc469ce19a3af6065271ef76894ce71d55df9216",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-sources.zip",
        sha256 = "21b0b1b31e54f8e2aedaa8162322da22dd12af6131808d165c4b4a1e4829dfe7",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-linuxarm32.zip",
        sha256 = "7864e577cadb8063bc58f414e59b8c58d4c24bf4f6cd8c4dcf07c91dabf85965",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-linuxarm64.zip",
        sha256 = "e64241663bdcba6b61a6c8667ca15b51ae5d210bb39c7158bdb64b565bac6954",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "13c74f5fc00f37cce677c2d9a0c4a37cbde0b7b8b188bab9b0be614f92ea2c3b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-osxuniversal.zip",
        sha256 = "13ce0009665f3d8225abf458b85138d04744bb1d4a620003c5286499e26bfb4d",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "55994fbd42e4d2fb633883df167dfad7337a35701101aef15ffdef933cf4899a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-windowsarm64.zip",
        sha256 = "55ca76aadafbbd067a46d57b2ad9d1404e86df8ba4ff15444a68cb9d44945bc8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "69e621da9373db5274ef1a287e51257d92075fac5781cf06b2310c17596e0a14",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "02af1c0eabf2cd107e28cb493a28e645fd7e6ab7d12c0073b11b0f30807875aa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "d5cb83eeec4ec8ccace2d479ed553b48b45d7d27fc82aa559ced4267bc7fd9a2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "77f7ce65800ce39ede0152a4b0d6b1342263ad9f85800ced048f83917c2182f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "de38badb9b27e4ce3b47f13ecec4a1431879e2167b3d7f3a6b3e147d66be67ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "0261c8e06408041e46fe18c64625bfeb92d20646d02f358fe0511641a2a9183d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "7cc649824833178b5444c0748780723e09b5a343f9413238e3f298cccda58520",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "daeea4629f94047bf599e98f515b72cac5ed91c3c8b35fa45f34e9ea3d1b9e72",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "b267aeba65bd8989b3d043de799335f119ebb1a5b66cc4a974a1b5ba8ade1be5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "322cee763a983f872b427c1da495dc092230ed7b5a643b923605ad40264f1424",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "d1075188018aaec85b0a75f00946ddfbeb1ea560f48f5da1b8d6c85079163de4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "1ab6444272748c01a2066b072a5498c883b4e9126c52d53451b1f1adc7fd94ce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "5cff0c8226946079248459c919c7062af33a90cd581c42acee4f54ee5220b14b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "d052e3710969c1e577059ba48567a5985acb398b61be6b3ac5490b556f6ca356",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "37bd481935e3f673e1a20d94bcb8981e203db09872268c76961861be936e56cd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "e37aa720ce1e4ea4188240568683975a7e99612156823d33783e97ad076676c4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "07745054336defdafbeb565af629bab820a85844c4eac20d888c2f824900c0cd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "d8b10964885ffd2cb78ab4fe7f45c0cc7f7b9ee7394bab0b33a05777f70317b2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-linuxathena.zip",
        sha256 = "2a49cef83c3822bb5509391082932be667626d653f005aae7d0dfd1263992523",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-linuxathenastatic.zip",
        sha256 = "80d0e27a017b2439de057d7f7e4f7c92e34d3e466a8a82b5cc3aeeb4f9ddf3bf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-linuxathenadebug.zip",
        sha256 = "019c373e8436c4429cfa9a08e22387788863a8296a8d5568d769f46ce7a33fc8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-1/ntcore-cpp-2025.0.0-alpha-1-linuxathenastaticdebug.zip",
        sha256 = "3a5405c96b04668841080625d600e525b5ae61c87c2c0b05db4662991af20ff2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-headers.zip",
        sha256 = "03f1f373657021e0775239e3b9fc8452ff15000fa61e26af868fe52a57de0e49",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-sources.zip",
        sha256 = "2b953b749170b50309c0720b60022debb1cae60ccc796ea4fc076b95483a417c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-linuxarm32.zip",
        sha256 = "fd9bc5cd08a9f0b6017375a72937b3768e1b55a4f8994dda1323de5c4a2b07d8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-linuxarm64.zip",
        sha256 = "d0b3afa883fddc4e392a04fd66db55c1539b790beaeef59c6a9b660a22638845",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "21c1753d8f57ae56bef9d0109218f71504af306798973b9f86ae83b817738be5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-osxuniversal.zip",
        sha256 = "ed9b88127ccbc17303af76ab429d8c1285c17426d284c4728935d6a33802f2b8",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "8989ad09fec65c08664a7fd8538351c0631c29113df29e944032297d938ea62e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-windowsarm64.zip",
        sha256 = "c205826d0958760586465aa8d61f8cadc4e8ad91e0693eaac41b4bc8343e48b7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "9268cbd6992565e7605e5ec749431df719ca4f34ab7c341fefbcaca484eee08e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "07ac11042a6b35c467783869e138d2c5615fcf220cd184a14a09d6f6225a6bd7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "4cb9cbb8f2e87fcb77d21ba7d8653b5b19b997beb50ba36857586da136c34601",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "6bb1a49a414929e65ba1f445f84d2201b1edec088a1b6dae968794f7504b597a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "b4df49c4723148fe824361506e6a0705585b88cf040c005564e77399d49e3d74",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "d42d688f9b7ec008f31eecdcc2d6dfe99c74f2d3e36502e90f8a20f10bdc6fd8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "6dde796d89a40f7cde90932240564f783806f171a74c30ddd3ee55a2b1acb86f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "ff7cee526d209d7ffaca588b2d626dd4e21754cb08472a4a24fbe69cdede2d1f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "9d02fee7a9dd57695b758fd9802f145f96a0d734657584320773be116ab58066",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "ad3bad9abdc5b68f5d23909bfa02a9f0f74acbdc36736b969c25e6cb0d66e75d",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "118805de6422b82956b3b05e779b3a5e8bfcbc9f9bd106218039c63bed752115",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "709473730811d2655e46e5b02af8d417e65c41ad8f3b1f6e85990d7ce4f21bff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "1c6d6a2a59e4a5a160dd676c2914c61720824a445b0df436978874aaee0d0651",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "87cbaf30f1ad73ed5a3c369f21e0a0623416a10f9590a8d943a89d655ed5b210",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "aa31b220a90dd732e3c7d9f18adedde1b554fecd9dfd86df225f70dd5cdd3161",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "2dcc2b28b4ebb8b0e3f6cd5b544e3f3557ee251b21381ebe7bf7e3cdff747223",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "0187617ec4834c9c607203ebe48d33bbf68c905a5fddc754a02f4bbf68f2ab76",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "f2da21e250db24965cf5ffd195fe6332079345c26cfaed4fb238b62e33046fa6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-linuxathena.zip",
        sha256 = "30ca73edc8284c8236c076a19591d57ad5870cfb589a0cf6bf067990b7f23165",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-linuxathenastatic.zip",
        sha256 = "ff02ca8f2506db5d6a44ab301238d6b6cae223f094a8b485d2b5cc03c8481059",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-linuxathenadebug.zip",
        sha256 = "0040d3af61512b03435ebe4205dea7d567cdc7894bfc777d7c17984270ce30af",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-1/cscore-cpp-2025.0.0-alpha-1-linuxathenastaticdebug.zip",
        sha256 = "1917f5bf9ef9224b357153bfb7648348ddc4df6544cfa3027df63bc89cd29010",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-headers.zip",
        sha256 = "f2d1c71545005d8c730a507edad385cd30df101b7bb8857e6680b8e9b7476a44",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-sources.zip",
        sha256 = "3943a730a61e27b78ea9980c2bf4163460b01d8b43a70136569d6782689638a0",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-linuxarm32.zip",
        sha256 = "cfa66b084f5ede2642b8723db42b0f2701b12dd21d253dda0d3014226e8b933a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-linuxarm64.zip",
        sha256 = "8ee72729d6b000119b8276c764def40d4ba4501ca5dc26ae03e32904092f1398",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "36fdb6d4d5e6c7f7ad761868f6751613ae736d6eba9f969d154259c656818a12",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-osxuniversal.zip",
        sha256 = "c1406a50890c54d78f9c7bbd3455ea5cbe3a5b1fd4d97e72a2a4cf39754c324d",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "3e383ad10271d310e7bbcc962aeb92caf5f836e71dc80f6834b00b74d981773a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-windowsarm64.zip",
        sha256 = "938e0f615a8d273b4627ee018d4882e8bd0abc8c2af82f4e15fb4540e2f47976",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "e2b948793df03ca92ec8d03c1c40fa2e922024bfcb6a8ceebfe17472d4309cc6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "da40f2674050cfca9a51a06740974ce9eaeffa3c0145c846cdc3e6340ca694b8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "3bdfcb3182df5b6cf5448363fe928b752fb54ef1d1a945a96f55635c038510b4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "3aaa5379a17190ed44be3fc34a1665547dfcef44ec266903ae6c27766286a77f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "e8f89765820c2342e71d0ebcd62bfb75d61bfacc1bebe8a802679186d9f8245a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "b3ffedd7baf55817b374bd6f8792e53e85bfde9f5774fa40b0e44d320030501f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "f13916c7ae0fe906994a11c42b156e5e5afc2f298f6b5303d9b16889702fd629",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "503a7bdc9f252d78d08d5952856523c560087e041f9adfb6aed435ce01f8f29d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "0d36268b1a66d744b92417e52dbfe30171a965322593825c49a5b9c2235e1c25",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "ee4ef0604071bd3f92b42f6cabd9a97185a2a1366cc0e77525e64e388d4476a9",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "42735d24c826ccedb597b7b0f2cf284e6c861c66b9f6e080be605387fa8feb9d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "88731b5c0ad2fcfc94b2cdab8b05efa8da21864eec99a5473c70d0ea3ae24a95",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "ae5c92f501dba2b300bdfcf1badfb1c738a13b265beec3d84778f7abf08a26ce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "27746445f14c7e4e1205ccaaf28b45def45dd7a5352942035e039abe9a406b8b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "905e8bcf8a08fc98994fafc90dd87e5ea0c214f4742935db1037b0724cbe8da0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "b439fbbf07fb91ebe92a5f1cef6daf13c1bc859b14155aa2c53819d0388975b4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "fb62f50b0aaf314537dd383ec1568663d1b6ea00c468ceefc682d59297af04c8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "e7143383738201b47248320e14c0cbc179ca83a314d70ef18bba0abc74af4fef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-linuxathena.zip",
        sha256 = "fdf059c15a323aa6ba3bba938e2397c2894c1a896ee0fda57202d875661d2b8f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-linuxathenastatic.zip",
        sha256 = "6837b65043f958ab5882825cff882171f216b5f4ca6e0df8dd4b513268365cf4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-linuxathenadebug.zip",
        sha256 = "e3ff230f61f54397b2322cebd9e52100d71cd5f9ed5bc06c6b9fc5dce9142e59",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-1/cameraserver-cpp-2025.0.0-alpha-1-linuxathenastaticdebug.zip",
        sha256 = "6df2db3a7703f32490525431cc1488ac057926fdf1dd7b7023e7be91391fa2e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-headers.zip",
        sha256 = "9d22012f79b7f95c3a3f6017ae99bf18aede486f4d70d9ea6ea7afba2ddb0fef",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-sources.zip",
        sha256 = "4cfca5f94837684d78b0883d57e3fab06b6e5d380beed71217dbec0ed44a4976",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-linuxarm32.zip",
        sha256 = "8f7f488900bbac951dc296d270b8455babd1bd81adc8daf4975efff7e5f72ead",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-linuxarm64.zip",
        sha256 = "9fba76b8d02754a09728eb57d2ab54f401fce1f46ec19ed9ab3d31543272a0c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "f9e3abc2d181e96a08ace64c6f7baa555002d5dfec5fcdba887db29aca534244",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-osxuniversal.zip",
        sha256 = "56c49126c3faa707cb886202ea4dd31765a6e5e7e9a24752123c65d2ce4bfa78",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "6191fed67291160cf177cf7059bfd7052c8098cd52e52352d11e0e6abd6452f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-windowsarm64.zip",
        sha256 = "91c2dbc46dc40fffb7cb73fab0e177cbc2bd635903f160d6e2edca6b06f354f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "b20ddd744f79a7216a5b8ef59bba756fe9304c2827dfff8bd12126c5a3ac16e0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "31f51dd35a5bd924ff62bf8b364eb5fbf7d370ee6ab82da8c879372626c51606",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "c348de34548c161d3af66765c6cca4c6db1b892ae15e1edb283183cacbccc4a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "8d43b1408d1ee220cf73de53a90ca25db091189d7b462f44c82323744de87bfb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "c8520b0e099ce33f1b19dba058750a95ac33d157bd2ffc4213bea45c9ad93762",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "3c77efe43194e66fb2a0dea1dfd2a52af614ca0fdfc40ae0400bab59da5cbe92",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "55a7ce082887bfd217c9effaf461a43eebcb63c9f9fe93f7f54b12e6ef7c303c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "578db75f7b29c178f9edac4c13d39ed7067dca9e9e8b07d54199e7f26f1f8115",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "3fe9dbc97ef1899c914c4f250961cc28555051a06577b318fbfb402dcea33ef8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "df07a543485e2dd19dbbdfbdb8194556a7e674c06bf25ec22382880e2b28762c",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "3c015ce9cbe913833cb02027bb897690c51015d61894d229a3ad8da23d253229",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "80aa45f8ed5e34c408a0baf54c52f3e2a55d90831d7636eb303ff665de0d3087",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "c690144625e2120b4d4803b5bb0a03f6af03b932b76e273b9365be3941206546",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "61b9a4513af8c328d8f24001a67cae5a733d89866a8267996d06d12e277b73f2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "4222a20691383840d9e92a16b9aeaf0cdcbadab173414385817b805c2b0f0d98",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "254225aa8ad930c7337f3e7a58f681040ebe01466acf7f259df664f753696d97",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "bd6a5f7a6ca76809b6a102033881927bc8fd35df7ecccd1d163d3c3d0d6e2773",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "9f06a1241932d7537c2d10529ee2a3cdf7eb444e16d4a1cd5af4f9686fd46e56",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-linuxathena.zip",
        sha256 = "c695a9dee1f3fc5a3731e16d90859c92a1a0fc63404ecb739fa86e87c38f79ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-linuxathenastatic.zip",
        sha256 = "3074430f058518feb858db3ef5d8e6407d1bbcfbcc40f10e25abbd970bd2075d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-linuxathenadebug.zip",
        sha256 = "cbc939a3e970939aca0b01939dd1f3e4c64fcf597a34a8e97a631ba2017482f3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-1/wpilibc-cpp-2025.0.0-alpha-1-linuxathenastaticdebug.zip",
        sha256 = "43a46d770bb369758b78b3584c5101430527f885d9eb44a2996ef827db504f78",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-headers.zip",
        sha256 = "bf7cb4d60f2491b025974c96e4c807d23dd72c5f4472493969adbb78f89f8e6f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-sources.zip",
        sha256 = "110ae46c76a7bdd6b9c683cbc48c654ed43d99609574a6ebe266d395667630be",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-linuxarm32.zip",
        sha256 = "e1b2593941ddaea7709bf537bfdc4b4255d8ffeb5d7cf0ba8a559f6bea98dbee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-linuxarm64.zip",
        sha256 = "9fa8397e1cc37c10fd7db6e549b9d13f8e55a70bf37e25e57117306dc1ada9ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "21517a491cdc78f73e8b8ed195c74d9353874f659ce183904ec40aeb05620a74",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-osxuniversal.zip",
        sha256 = "6f264f10e012e442eb9eec666f084fa708a83e0f7c5875bf9dae0dbeab7cda29",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "68fb204c45aa18da55b76934ab17dde9bbca1d1498d3c44ffe5f36f0c7a1fad1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-windowsarm64.zip",
        sha256 = "39fbf7f34206b49b08440f3db41d5420c4e9034a95b1917bb43d75f51d419648",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "c90a8c7f986671be7563379ce396953b920d01e49e9204c9561347e49cf4f239",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "7145d0cf96e90ef04d790aee92e8f3801b1f976d07f52ebfbf858dbe0b6fcd29",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "2750e4c2fd470378ed6e8d400ed3845382286ddcab34f392ba6581a1af03da9a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "0d3eae0cbb180c102ac10c9c5301609bdf3878389a7fcb676939e112522445f0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "c86fca71323de0a1da96885f535bf488d17fa1c99d41159071e20cc737fe08ad",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "a6cda651e587c030b826a25f35d30c4f748b40cdc8cf8398304dd504d881a478",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "69c15f264ba9154e958fba8d0dcfa33edc5173758d004698785462b0611c543d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "042498063f5007885bd1e3b92ab49b47ffb44f0f4c5b4fc264e85ee4007b5c06",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "8bd7577c4e20a3dc5c6db714cb5e2935d3a50b29db6aa1c30503e9d29e157dc6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "7ed20908afc8f279eb10f1fc0cb9a402520005bd2d037c84ce1872c2a34734e2",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "196c8a7391a5af56806710059fe19c959869b7acdce76b232b481e628acc5630",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "75693089108d1aae138aede85eb552048c32bee11d9348f0c3009c78b44844a5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "c99abe665fee1ffaaed57416cebabf97b9134a61c21a9be0978725376561017e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "57ad0a3a215ded557798838f7b6918053d170d2b8fcd8b3d49cb29e1c4a34a5f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "8aafe222c20f66f41384b836bb7eca7794598bb17478da1ca6485b19319bf426",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "fc1ce16f461b98bc066a74d313cd2ea4f0d3a7d2d381d2a28c6d5d6dd78493b1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "26cf89c2e584b31dc0e254c6d4d2a25b7505ab5b0174d62ba7441d2d372e2a0b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "ceddc87df8287a9a2be6569dab952d7a8210ac812f9ea83b8cb81549dfa9d7bc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-linuxathena.zip",
        sha256 = "2a63a941d16beb89319fd6ec2d1d8320ce7fa48c0f78d3534accf741e2f11bdc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-linuxathenastatic.zip",
        sha256 = "aeecfa8510d4679dd7b15c914340f89e7799d4a170ff8b86a42bdc0885756787",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-linuxathenadebug.zip",
        sha256 = "b3e50cb35d2c53e5458955491b80cdf2408fd5a4eaa71dba91ec96619e1be398",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-1/wpilibNewCommands-cpp-2025.0.0-alpha-1-linuxathenastaticdebug.zip",
        sha256 = "c651b7c734daa0acf1076bf2641fa8583ef7eda8a1b4d0ba33894ef4214f2615",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-1/halsim_ds_socket-2025.0.0-alpha-1-sources.zip",
        sha256 = "f83ee2f487872c8b53edcbb7f4d9594b83495a7e5255c675096e676358a25d6b",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-1/halsim_ds_socket-2025.0.0-alpha-1-linuxarm32.zip",
        sha256 = "6eb34151ba8d8187491f8f02c7fe60b1ac7175f3eab51cbccc9ee9cb58eeab83",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-1/halsim_ds_socket-2025.0.0-alpha-1-linuxarm64.zip",
        sha256 = "ac0987adf410c39e4eaebb21a2c93a2c31f947140b304895a280eb89e1378685",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-1/halsim_ds_socket-2025.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "5ec2c6b2028b57933d398012a760c81111ac93e9084d2ef56549f15d66ce0b99",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-1/halsim_ds_socket-2025.0.0-alpha-1-osxuniversal.zip",
        sha256 = "7985c48f717b85ca134c71c1040a7db70427e578ba1793e42347b6269121ae98",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-1/halsim_ds_socket-2025.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "07024f55289eafda5db8875491d88a2454b31ce448e83f55871b373177eb0c9f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-1/halsim_ds_socket-2025.0.0-alpha-1-windowsarm64.zip",
        sha256 = "0623b9776ca85e4a224bfbf63187ea1c3070d35c5d2f0d6f960054e34c512859",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-1/halsim_ds_socket-2025.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "d28f6441b86a02665c68c8610eeb87f07b23f6e9117e561f6bbbd26f473fcbe1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-1/halsim_ds_socket-2025.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "34f878de88927ccaa0dfcc936aaacf2565d08aa8e5293d44a79b5136e0ef37a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-1/halsim_ds_socket-2025.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "8258aa66f7ce12436265394ef7b18fab6f76af39a87e0f1eb32dd8fc85453c9e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-1/halsim_ds_socket-2025.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "f7fc2042026942eed5c59cc0586ab813b328ee75cbdfb3dfa8214eb2331090b0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-1/halsim_ds_socket-2025.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "916071c65846ecd8fc8a5a2277a099314ace9cc51597dd85b8b7fb1cbc3162ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-1/halsim_ds_socket-2025.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "6a52d99356176afb543605e40b4c7458280eb4c8e4533b64eb11184bfeb1ac33",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-1/halsim_ds_socket-2025.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "5ca986a44073bdaf31f72213f149b73e188e8724c26ce575390b9491edd321a4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-1/halsim_ds_socket-2025.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "d6b3652c366a1154801128108e032eb344fef1994fef3d32d7061a7357a7b47c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-1/halsim_ds_socket-2025.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "4c02efbd7937f4d045f856e8aa6de7109a6e88ae53bd9b6d48986fa21371861d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-1/halsim_ds_socket-2025.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "e0e2c24318f43ecc04a8b48ad25f158e7c34ec587675ee7bc5e39e7145cd1e8d",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-1/halsim_ds_socket-2025.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "59372f8473a518281636d3b730e1a193ae83967405a38b5615b4d3ba46cf8dbe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-1/halsim_ds_socket-2025.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "f6eadbbf74e993f50deb8e1c81a2a97999bc668074116eb1f21d8b38d8594ce0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-1/halsim_ds_socket-2025.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "36e50c6acb838b6fb7c5ac4065ea17c86f10574fd8f7238f30ff0ee06f012c7d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-1/halsim_ds_socket-2025.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "985569d3eb79b9cd4564b769fe54434fe53891e80b1bd249a24222e04faee853",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-1/halsim_ds_socket-2025.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "3a28f68958800caeba29e36702d3247ef1599fb3b2ba2aafa029b1325a9d8bbf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-1/halsim_ds_socket-2025.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "69a9f6121303402a4f238c8a8e30b9d0db92698b83bf21de158c3a4647cfe2d9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-1/halsim_ds_socket-2025.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "6579b80da00ad60624239a1b9451798b48b05cda9bdcfeeb2eaaaedc1a2e4113",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-1/halsim_ds_socket-2025.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "9d2b28fcbb3234554a63b7cea366d6fa72d496cb55e4378292df6aa76652b93b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-1/halsim_gui-2025.0.0-alpha-1-sources.zip",
        sha256 = "a4d72e98100d95ef7d40b85e4fac62c7aa47000164687fcc8fd67bfa31caef14",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-1/halsim_gui-2025.0.0-alpha-1-linuxarm32.zip",
        sha256 = "c925528448c0cf0b95bce278af4b1f14bee7338f8a55805b990df6be0171519c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-1/halsim_gui-2025.0.0-alpha-1-linuxarm64.zip",
        sha256 = "06a89b8a43e36243aca8a6caad80c7e0c874076c2f282f52e5196ab7ea034150",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-1/halsim_gui-2025.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "54391af445228321304468dfc1a0963e5675c3713160781bc89d519d4623f346",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-1/halsim_gui-2025.0.0-alpha-1-osxuniversal.zip",
        sha256 = "7a3c281880a9a3a6a9378f9565083a326fbef4cd8301ca6bd6cc55abd453df87",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-1/halsim_gui-2025.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "6db07e3a1913854f0b46cf0e3206f621b162fc475e592802323c1c03d7bfa15e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-1/halsim_gui-2025.0.0-alpha-1-windowsarm64.zip",
        sha256 = "0c5e6ccb641dbd4f916aa681e5483b2530e4bb435b519081f47d05c9cf01f112",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-1/halsim_gui-2025.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "2259d0fac73eb1ae0b25ec106bc0e8fb166e93b0b5c4f53c704e6d86e07dc962",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-1/halsim_gui-2025.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "2e27988ceaf9ea96548c2e429caaceafde79bec05f260ce2dcd61f8582cdacd4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-1/halsim_gui-2025.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "824e5a08a6f40c9b71cf263932ab8f89071baa5b3e4f5cba1b5843b8ac506c86",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-1/halsim_gui-2025.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "b1afc14de2cef6ed2adea6cdbc280320bacd927709f3ef8682f7f60caaf12832",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-1/halsim_gui-2025.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "a7ca094d5bf3c96077842ea214aacc5cd61484d72dc3b3231248b933cbe1bada",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-1/halsim_gui-2025.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "66ccf267b4949600f1fbd5cb395a1025a9b26436a66ce38fd64a807557f51150",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-1/halsim_gui-2025.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "ca40671ce1fc04d036ed45e0deedc799ab99c7dd93f48986a41622ef8a6ecc79",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-1/halsim_gui-2025.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "2808ace1c3d6b44c892a4dcd8b90d09dbdb2094105508f6a1df293c8b833a217",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-1/halsim_gui-2025.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "21364773f799e5ed5e3fd4af92805e1fc582af16ec44f5eb1c0fe709be42da33",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-1/halsim_gui-2025.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "1e6c6f081c691d1ae2016308f4603e111342ef4c6493991202e6c508d3c79b40",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-1/halsim_gui-2025.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "f654ef00a06f1c0facb7914a924c9291397942df231a1f194d384480b8224674",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-1/halsim_gui-2025.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "31fff1dcaa3f860a3f6f5ff3872d62bf770fdf81851bb6191562c4f2ee5cbf1f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-1/halsim_gui-2025.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "e57b518bd424a3161951cc409a460f045a50b773cfd50b1999b051d73be5d8a3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-1/halsim_gui-2025.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "59ebc0bf482f0c88f6488b3022cc9aa9e3c44a3665d2cedb4183a3c8af999d72",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-1/halsim_gui-2025.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "43341a55ef7bb320ae159d3ce2e9802e093448664ba2237157f4084801970af3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-1/halsim_gui-2025.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "c68e541cda77987b576ecd4a0934e984824d905881057361575a2eb14a7d17db",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-1/halsim_gui-2025.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "4f69dd75a42f7aff1a1594e9fd17df936dc67223c0f3d3e47561f115f63cd950",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-1/halsim_gui-2025.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "2ba21ae2a912803262f3919912de55049749b983219074aaa032b4a9cb2c65e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-1/halsim_ws_client-2025.0.0-alpha-1-sources.zip",
        sha256 = "e9c4a861a5a559118aaa80370e43a30bda08ea67cce17407ad0190ff1175ee9c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-1/halsim_ws_client-2025.0.0-alpha-1-linuxarm32.zip",
        sha256 = "529c1a2f9c140e3a41aed86059aac1e2bca9819cc7e995a65b2591b5fc7bb6d6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-1/halsim_ws_client-2025.0.0-alpha-1-linuxarm64.zip",
        sha256 = "f4eb65edda8a6ca4e94bc7ee4afc221effc312819515396a491cc3c1a53c989f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-1/halsim_ws_client-2025.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "43f8242bce9938e4065e3e118eb43dc2e884fb893bdf89d9db1bac8bb40f46df",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-1/halsim_ws_client-2025.0.0-alpha-1-osxuniversal.zip",
        sha256 = "d427982a4d027f26510dc19bc707b886e9db8de58d1eb02f3f2ef998e40c6589",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-1/halsim_ws_client-2025.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "38f0694549ed3b5385c356cd8533546133c60ca24b9fab845fcb0ebe7c57e2de",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-1/halsim_ws_client-2025.0.0-alpha-1-windowsarm64.zip",
        sha256 = "0c92a858c53ffca11084f4778318163f9ec790a8763be50425e4955ba32ef0ae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-1/halsim_ws_client-2025.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "02640d2e3713a1af30a55916ad9e647f7ee6af1f292fff201c95517566cb5e17",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-1/halsim_ws_client-2025.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "1eb6cd5120bfe96501b0cb5ada3ce6fb212c8176b721b5e2fadde06ae350b9ea",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-1/halsim_ws_client-2025.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "de159f0b0717625d1df5d7b492f49b126088e283e197464db7c8f0ad96b583a9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-1/halsim_ws_client-2025.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "0fbedd149b4fff64061b41913585b975dd09fde900126e750c02ed972c8d3a97",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-1/halsim_ws_client-2025.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "8bf3c682e031cfed879939b37c9a210cd6cbb202431d3893b74967615f55c5e7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-1/halsim_ws_client-2025.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "da1035ffbcf6ce5221a78037309640445a383a2d04b6e5723967b66c6afe4f90",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-1/halsim_ws_client-2025.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "84a30d5228d8bcef9c31cdac920ae5727171a34ff86ad00d663a94b5e25dbd11",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-1/halsim_ws_client-2025.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "2e85dfebe985a23ca97df929d9b459324d60589b5d0bfeae42de315acf49256f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-1/halsim_ws_client-2025.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "0605fa5548c0bc5991db0dc68c5acccaaafe758a76f7ce25bea6989dc4d8e855",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-1/halsim_ws_client-2025.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "8203bb977a29078ff2bee1767f27c77d9a5af87c43786b28f51f72104c0243de",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-1/halsim_ws_client-2025.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "25c38dfa688a8f8ebb14863f9801152bb75eeac7c4ba3e20af14c9998aec1948",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-1/halsim_ws_client-2025.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "d7338769ab7eae8186156121f18f1510df0865b7a6c466987f1ec9ec60440a1b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-1/halsim_ws_client-2025.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "5248249c29af68601cff11d7f5a2053e4e281d9941f2b399416692777ce67bd1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-1/halsim_ws_client-2025.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "dfdd844b019e10a40e1f6126c35d6168c17f252d4db62c09436fcdf90a520406",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-1/halsim_ws_client-2025.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "98362b5a0325a96872b381a36dccbb3a51619d2234164be96bf188aad32289d9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-1/halsim_ws_client-2025.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "7e35304d24023bbd3e3c9b909fac7a7c956c261fe735694004d441c4bc5d74d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-1/halsim_ws_client-2025.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "c8760dc2f044d97d0bb6c1fc2a042663f168721f8e535c5699d5b682c1389578",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-1/halsim_ws_client-2025.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "a55a5ac62f8265ff1505845f1c329cc5bdbe4ef1757658bc7d79ed17a3fbe28e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-1/halsim_ws_server-2025.0.0-alpha-1-sources.zip",
        sha256 = "451c4cdeba7bc1d749e59bfbcb413810ad8433ade03462343e69dedc5ec855c5",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-1/halsim_ws_server-2025.0.0-alpha-1-linuxarm32.zip",
        sha256 = "b8eb6c4da9d30d917ec81bd29e55e6e8ff3b4942ee7101eaa5fdc50ade4b2da4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-1/halsim_ws_server-2025.0.0-alpha-1-linuxarm64.zip",
        sha256 = "6eccaeb9ab0b7f4c2b0fcd74e2b926cd00433dff27bb24741c5efad5335a5507",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-1/halsim_ws_server-2025.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "afeb16b27c92b8e7858ed488de7ef43d5e89248bf116cc4afe6448d41bf51958",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-1/halsim_ws_server-2025.0.0-alpha-1-osxuniversal.zip",
        sha256 = "d4c0fcc51fb6ea1ba5fe83d3e8cd9fdb7c3e2f90c68452e601cf3dc7420021d7",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-1/halsim_ws_server-2025.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "3da2be19a6f86b07bef03624175580532c7407870f24a18abffc31b9f2b0040f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-1/halsim_ws_server-2025.0.0-alpha-1-windowsarm64.zip",
        sha256 = "9d79fed4e9a91b3ca412474d9ae3d51c5b1377d574a105e7b6ad55a5b0c5cbeb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-1/halsim_ws_server-2025.0.0-alpha-1-linuxarm32static.zip",
        sha256 = "90e6a5520030bfe57228f9465c6c98b9b02e5b5cd04ab5ad2ccf91ab57b7a415",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-1/halsim_ws_server-2025.0.0-alpha-1-linuxarm64static.zip",
        sha256 = "d9b857e23baa298b6bd8b8e4368717b1bcd3e46838caead05dd8e8c039b5cfe6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-1/halsim_ws_server-2025.0.0-alpha-1-linuxx86-64static.zip",
        sha256 = "3d64a27dd43b51130b072e210260a6a5e15f92fd4b948ebceb72a12e6d5fc6d9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-1/halsim_ws_server-2025.0.0-alpha-1-osxuniversalstatic.zip",
        sha256 = "64730a105bd0508f06c5bd15adb48d07f19f836e14886c0105078732180420e2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-1/halsim_ws_server-2025.0.0-alpha-1-windowsx86-64static.zip",
        sha256 = "f0b51d10fd4dbcd8ca4ed453901cc5d2f8a72bf112e3fadb5dd38cb770f11fc9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-1/halsim_ws_server-2025.0.0-alpha-1-windowsarm64static.zip",
        sha256 = "05db463f280789fafddd11d4b82946009646b35095e3536a6f7bd4d7cfd0097b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-1/halsim_ws_server-2025.0.0-alpha-1-linuxarm32debug.zip",
        sha256 = "ac27d77afdbbbfd8b3506a9b0522f862d4fc19522c97607879e804e026f518df",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-1/halsim_ws_server-2025.0.0-alpha-1-linuxarm64debug.zip",
        sha256 = "71a76e9ff6786b66e12c9bac9026afb084f7dbefc867e783f0e32e89fbc025fe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-1/halsim_ws_server-2025.0.0-alpha-1-linuxx86-64debug.zip",
        sha256 = "e0c3a2ef218ebd427d00ee9aaae55501c3b915cac88cb6d56d143a98b6fe7541",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-1/halsim_ws_server-2025.0.0-alpha-1-osxuniversaldebug.zip",
        sha256 = "c19cb81f10704f23a7a1efb3bd48d5249a80c337140832a013bb10f97bfe4ddf",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-1/halsim_ws_server-2025.0.0-alpha-1-windowsx86-64debug.zip",
        sha256 = "91f5c5c05390b72f87dfbc8871835cf5548a1d910205793577aea2ecad19878b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-1/halsim_ws_server-2025.0.0-alpha-1-windowsarm64debug.zip",
        sha256 = "7a8d9f1c579c55b964e3002527d981c90ccdf71876c5bdce25f2527d3ee8fc6f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-1/halsim_ws_server-2025.0.0-alpha-1-linuxarm32staticdebug.zip",
        sha256 = "193c19d97d1cfedc9b98408ef895893ea89c0221141fe2d65ccf563402176cd9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-1/halsim_ws_server-2025.0.0-alpha-1-linuxarm64staticdebug.zip",
        sha256 = "0762554c883086f073d9d5771ca2d7f9202d4c355134fabcc968e017c962a893",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-1/halsim_ws_server-2025.0.0-alpha-1-linuxx86-64staticdebug.zip",
        sha256 = "c02b5c58226a9fcb50c4b40b5effa35820e9437fdf86ace9ab42903606685c49",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-1/halsim_ws_server-2025.0.0-alpha-1-osxuniversalstaticdebug.zip",
        sha256 = "e8e7a49a257a38078d543414db46613a575bd5c3bee7807e448cdaf98684d402",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-1/halsim_ws_server-2025.0.0-alpha-1-windowsx86-64staticdebug.zip",
        sha256 = "204120425a9ac9d5c0fe81f28114ea8de9bdefd4adaaafe811367d3281631675",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-1/halsim_ws_server-2025.0.0-alpha-1-windowsarm64staticdebug.zip",
        sha256 = "c7a8f8272dc7cd38d4105929d8b2c8872ad62ed98fd63a7470c533725286639f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2025.0.0-alpha-1/SmartDashboard-2025.0.0-alpha-1-linuxx64.jar",
        sha256 = "1513573f88827156169eaf54365a0814890d45c154841f549f7b38f3bee63c02",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2025.0.0-alpha-1/SmartDashboard-2025.0.0-alpha-1-macx64.jar",
        sha256 = "e6874c99d087aa961888ff6783bab201048c692663636e4df640c6c12ca74da7",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2025.0.0-alpha-1/SmartDashboard-2025.0.0-alpha-1-winx64.jar",
        sha256 = "ec525365cf366379e69d8fe35c063e25f0793028e5a28cd472749e35bbf2f546",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.0.0-alpha-1/Glass-2025.0.0-alpha-1-linuxarm32.zip",
        sha256 = "6c9324a29af92b99582922ce87da83266fe8246576f9fbc88f949c83bd197836",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.0.0-alpha-1/Glass-2025.0.0-alpha-1-linuxarm64.zip",
        sha256 = "dc095c12a3be75d49697cf8f8c2b098bfcf9dcd7c98291bc7d83c12288f38940",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.0.0-alpha-1/Glass-2025.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "f0c1b559474d3fbef14717b9909b8366705d81697d424d8ceb0eb45afebe81d3",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.0.0-alpha-1/Glass-2025.0.0-alpha-1-osxuniversal.zip",
        sha256 = "7aa86b62e09d2f2ee690931ec236a3dc7ed3f29a9d21db63f13764449d73a126",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.0.0-alpha-1/Glass-2025.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "0758172d21186b5a131762297852aad706651567870dad58022907202e61bcaf",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.0.0-alpha-1/Glass-2025.0.0-alpha-1-windowsarm64.zip",
        sha256 = "9fefcaa2ddac11a2ab95b8c08550d98defcb586bcb14b6943dde4c6ccf6db7bb",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.0.0-alpha-1/OutlineViewer-2025.0.0-alpha-1-linuxarm32.zip",
        sha256 = "79f035a78ee0b09be7c8757e23a85396143c799a37b87a62785e2efee4469c78",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.0.0-alpha-1/OutlineViewer-2025.0.0-alpha-1-linuxarm64.zip",
        sha256 = "ed55320ace0e6805b34bdc9b45c73ff7b585a0978bfa0c648f87222c689d462b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.0.0-alpha-1/OutlineViewer-2025.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "81c638ec1930b9860ade5944fc69fb925bf306c282d2e071fa47eddd10147270",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.0.0-alpha-1/OutlineViewer-2025.0.0-alpha-1-osxuniversal.zip",
        sha256 = "7db5a1a091ef45f83122da5621eaccadd913b88bcc6401576718bc744c64c369",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.0.0-alpha-1/OutlineViewer-2025.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "877174dd5d358e6a1e54f98438081111e5460186c3481d64d6994a896b8a4e48",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.0.0-alpha-1/OutlineViewer-2025.0.0-alpha-1-windowsarm64.zip",
        sha256 = "16cd3678b10ea3a04f12e94ae35f40b30912556f803e2fea7ddc93fb332579ab",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.0.0-alpha-1/roboRIOTeamNumberSetter-2025.0.0-alpha-1-linuxarm32.zip",
        sha256 = "0a121bc890927b018f793012eeec4800814ff1cec1cf7831a1e1abf5bdc3a1ed",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.0.0-alpha-1/roboRIOTeamNumberSetter-2025.0.0-alpha-1-linuxarm64.zip",
        sha256 = "511993e2d30dcbda234f16c7acdb3dad0d049158701ddc4a9a36c858035a1543",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.0.0-alpha-1/roboRIOTeamNumberSetter-2025.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "d4a9f372b68e4c577a9536fedf33062cdd74c536ca3948ce97d8cd34df3efd30",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.0.0-alpha-1/roboRIOTeamNumberSetter-2025.0.0-alpha-1-osxuniversal.zip",
        sha256 = "5bf978d0229f6bed2fe51afba01f14b945d871c211914f5dd8a98a69d6d67e33",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.0.0-alpha-1/roboRIOTeamNumberSetter-2025.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "53a4f1b22cff4203115147af97cb4f8b22eabdc315cc85388b2a191c91e62be6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.0.0-alpha-1/roboRIOTeamNumberSetter-2025.0.0-alpha-1-windowsarm64.zip",
        sha256 = "ce51d87142b859894c0fb1ad248954f02bbce19fad9f58eb7950c3fa4536af1d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.0.0-alpha-1/DataLogTool-2025.0.0-alpha-1-linuxarm32.zip",
        sha256 = "4ef903be4b53f0acdf8dcc1be70496bce8c6b8d4cc30bdac292e919e952892ff",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.0.0-alpha-1/DataLogTool-2025.0.0-alpha-1-linuxarm64.zip",
        sha256 = "86aa2213580991d42e6c8f78fed9373744c2e60c97e43c4a708dbb1100371b7f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.0.0-alpha-1/DataLogTool-2025.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "ab54ae38926066ae2d5a620475907862a882eea52e48d1b266b38c72bf6f0ab7",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.0.0-alpha-1/DataLogTool-2025.0.0-alpha-1-osxuniversal.zip",
        sha256 = "5009ff46d97ec0f8a38d538d4ae5b0afea6f11760382240bb53441beef099a66",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.0.0-alpha-1/DataLogTool-2025.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "feca8c9dd56dcc9097507036c4a1b15e93f5eac0aef2f8e9b53bd081e925d75b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.0.0-alpha-1/DataLogTool-2025.0.0-alpha-1-windowsarm64.zip",
        sha256 = "673e35be4f0e8109ffe12b96312da931201c87b073492380539b0aa463177015",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.0.0-alpha-1/SysId-2025.0.0-alpha-1-linuxx86-64.zip",
        sha256 = "d0b2046a73db1997487c63baf3d4ae4eca637a5f0a8c42e006313429f7a0a270",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.0.0-alpha-1/SysId-2025.0.0-alpha-1-osxuniversal.zip",
        sha256 = "0a3b1721a0f6f56520edbdbfdef51f6793a8eb73f299d491ccfe23f831557d43",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.0.0-alpha-1/SysId-2025.0.0-alpha-1-windowsx86-64.zip",
        sha256 = "3ba8b4f08e67c25d994e376fd3b25512cd081d5017eff29f5bc285a92bf51ec0",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.0.0-alpha-1/SysId-2025.0.0-alpha-1-windowsarm64.zip",
        sha256 = "1bc9cd995e57adb8cd695ed10dd9e0ee86c6fe142c1e71a4440851c3c415f4c2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
