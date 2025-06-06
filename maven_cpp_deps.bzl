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
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "de677e943496a6624c73dd85cff0b68dc4c170b698c5663b1a7609a557f09cbb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpiutil/wpiutil-cpp/2025.3.2-123-g22d12d2/wpiutil-cpp-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "638f04a09c99a08f6fe6873423141c15b9f0166e8b9695da0df263e6c41053a5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "a7c3e97aacd6cdc965160a28f5e8fce7e8ed6022a2ffb8da5d805fe5f14b43cd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpinet/wpinet-cpp/2025.3.2-123-g22d12d2/wpinet-cpp-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "8e17f858cd7e53a2e58ea7df6ae3c31fa6b34d8d8f4fed9d1ec245e6ed63214d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "67f91022a0281395851342cb9d3a30f9ce04ff8005453d2a68e0f3a5473d3778",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpimath/wpimath-cpp/2025.3.2-123-g22d12d2/wpimath-cpp-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "cce90388f6df31a031906aace28d4a52bee6ca44c44d707cad786bef24d7f7a9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "54f3ddbea63993389245fe5dcb3ee109de9517c7f3e57227b5585dd6a0aa1324",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/apriltag/apriltag-cpp/2025.3.2-123-g22d12d2/apriltag-cpp-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "76b364d22055777012adc81345fc32aa19bd315125ddfa4ad37ee802df14e151",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "acc24c2e93f9b342ef2835bb05c21bcbfd2285d0ebd45442e3bc5182c6887152",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/hal/hal-cpp/2025.3.2-123-g22d12d2/hal-cpp-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "ef054ee06dc34f5207305cad29c8c72d0288cf1833689ade8c48a8a3fee6767c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "448f1596c80be744713557d378ed62f1eefe8ac7624c344293c350e5b54cd684",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/ntcore/ntcore-cpp/2025.3.2-123-g22d12d2/ntcore-cpp-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "42cb9e24fe756d537b681ac5a6fd21f2c3c2dd99bbad88e50bfe8c0ed6df0a5b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "7c044e56cd21fc70ac4e251a4567556df190370cc08c30aeeaf6ef33be6b72d6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cscore/cscore-cpp/2025.3.2-123-g22d12d2/cscore-cpp-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "534890253a631a5a2c729391e3b7472d2a2c4c6571d09009846493771a0ca6aa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "3ec5cc4f2ac2993528f94c829bba946218ee4e0893457baf1b1f30a1c9747893",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/cameraserver/cameraserver-cpp/2025.3.2-123-g22d12d2/cameraserver-cpp-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "9bfa9f4f9c68e8afabb3d956c7c2c3988a07e7857262c7538da906f0812febf4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "cd64f84bdea176710dde286fcda9175d67f40763e608f69c08eff5965511b2c5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibc/wpilibc-cpp/2025.3.2-123-g22d12d2/wpilibc-cpp-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "fee066018da07efd312e041c7ba190fa8102a60d3f9e33b3b5c997512e924997",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "8748779ff41fd185359ffaf5e6006e5f1e535540a613bb07eafaad0f4c67017c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.3.2-123-g22d12d2/wpilibNewCommands-cpp-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "6390bf21ea1fd0edef39de733acb70292bd4e6b04e6e801c86a563e4f19b3732",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "5ef2c8e283f9f4d60e34117f1ebd74445096ed244868bbdf0c37c158faee7d6c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/romiVendordep/romiVendordep-cpp/2025.3.2-123-g22d12d2/romiVendordep-cpp-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "abd67f8e8aff25126f5578110c45d141a4afd7fb7db6bc7fedf85950bc075272",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "eff8db446f97dc9b703eec261865ada4ba2ae0816f101bc612914e7e383e97d5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2025.3.2-123-g22d12d2/xrpVendordep-cpp-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "b898393e889e7909d5d857fe16beaeb5ac7ca5cd5b50652bce9d2d63cfb314e7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "36f0b91466b16d662db07f1ace016fa498f4259322aa11612e89784157bf3190",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ds_socket/2025.3.2-123-g22d12d2/halsim_ds_socket-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "653a0879dd4484ee8a0acf67a5f3850f72ed248f067c91b129edc79e96cede99",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "d163a9517d667f2536ea5adfcfeebadd6a044c8ec6e067d44470a505525131f4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_gui/2025.3.2-123-g22d12d2/halsim_gui-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "5643a6650c6e38973ad86389cb729a97b5b778eaabba9134b1a1c8c4bc8d1144",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "49117e56f610f2d2ffc17774d466cbe3990a1b8619ed3238c7b321c444fb8bd9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_client/2025.3.2-123-g22d12d2/halsim_ws_client-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "e450cc68ee025e1ba1e4a695f91cb53ec69c893f2e2333ff5e12230fb4aca166",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "6134860a0e43eef2e28787aa37c78f39387289763c61d25a3b9f9cc66e3fa383",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
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
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/halsim/halsim_ws_server/2025.3.2-123-g22d12d2/halsim_ws_server-2025.3.2-123-g22d12d2-linuxx86-64debug.zip",
        sha256 = "02e75895d35749c9a31e6b2a12de1974b86439a71866d0db5a2194aa66d0f986",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
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
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/tools/Glass/2025.3.2-123-g22d12d2/Glass-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "7a45a029bf6507d4627f98d8d4c3a1f04c3885d1d2aa547561c33bd4f1ee3caf",
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
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/development-2027/edu/wpi/first/tools/DataLogTool/2025.3.2-123-g22d12d2/DataLogTool-2025.3.2-123-g22d12d2-linuxx86-64.zip",
        sha256 = "c0f1c293413a27db9fefac780b8952fb6d444a44394a169e704846d7d00b29a8",
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
