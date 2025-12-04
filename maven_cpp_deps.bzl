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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-headers.zip",
        sha256 = "d0da36d5d03f7743f15f5ef49bc0d87c81c0e6a468e2304429d6d33418ab4ff4",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-sources.zip",
        sha256 = "8ec9e8c61a95e151500b65df6f80d8aa1c4aeca63b831c3d8d0ca271d562847e",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-linuxarm32.zip",
        sha256 = "83336aee8a8ac0e0fe28699d0ee682d7a65e01ff7ed689cdb3f075e1c45b1254",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-linuxarm64.zip",
        sha256 = "8ddd81f99c7884b86749e9b3ac790ad2b9681fc740b71595cdd0786119ec4e58",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-linuxx86-64.zip",
        sha256 = "0b929d053231d02ff727a50d387e03240d1d1c4d6d04cb7ec0b9a9f597956fe1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-osxuniversal.zip",
        sha256 = "387f1ede944528abfe6f222c3afec1f18e93768c80cff4f28d0c6e94164a0181",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-windowsx86-64.zip",
        sha256 = "9bd4a7717b6bc1f6296a290d8f9e3999b7528419fe8692e0ba7602e35638a213",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-windowsarm64.zip",
        sha256 = "19be58a60e973b309f6d57798f43600c0ec607c81bb4c5401f629a8ed2db38fb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-linuxarm32static.zip",
        sha256 = "a7db6f1b20e5cb83037306e267c4cc75fcd5d58c5360182cc2a4a639be8b81a7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-linuxarm64static.zip",
        sha256 = "bafc4a29303cbe37d52b37ed5dcf41f6103f8042eea6ad9791f4ce98af5d65d8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "3e56fce19a052a1be97bd1cdc379ed71883da2b4b28fe13905c4f05b751b1ae0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "81b0a1afa5b6c6bfacc0eb59316c3de056153bb141232a9f5332806ca4578891",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "6c2268aaf079a1f4c5ec664d4be93a7e96374afcd33f1061add04492ef40088f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-windowsarm64static.zip",
        sha256 = "39dbfa788a1651eee9b1485fccb9450b82208d83d446b410793b5f234b3765f8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "faf252036f4bf6b62891e220ec5b3ffa0bfe617802028b03b909ba6d2ee1181f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "10bf31fc73a3ada2d9f8b71b40c26001189ff742efa6b768d33291e377658132",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "4b91c9029f32737e9c3619069c2320ee558ffa31210792d35aa90a05f6bb8b96",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "88ae22fc159667fc8e1c1ff1752cf607be50fdeaae1ea33c3b0bdc542652b452",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "0efd27efaf5edec8627635a52761687dd00e0060792648c53bce534c1120304e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "3c7d9492ab22747d95852fdd4ae7705c83edfa28c3a4a179f97b587e0dba3b53",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "493286b6a10a86f39b446108d8bbf182e209bd77e280b4bc57bff8eccefaf37a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "d66cf4252ac0d30606e9892831f1dda7b7370d665afd5312850464e9b0826e26",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "e6cb5dfb0a9ae03ed7ee5bf533a910110cc07cbb5ad2aa387daf189d835c1eb6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "4bf3b2af7656f9269346183a3e3b5febefc5e74d50dc50f68b606cd4e0adf0d8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "8b3300fdde46ab882fe913c50c10300572b4f62815dbb988bb78fd20c838b9e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "795a2ea958ce771c91cf86c2893c514970ed39f2b25dae2a2eac3e1d5c3a6de4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-linuxathena.zip",
        sha256 = "4481833c654573058f296ad31f3361bccd669cf1ad1226c41564250f07090b2d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "a78340c3b2e9d0efae26d832d2a80caf3581e3130d6fa482dfe4818e840e2b24",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "52e4d30d68919c41a44e8f62357886f38eaab17cd1757b02a8821015f92cc473",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2026.1.1-beta-1/wpiutil-cpp-2026.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "5af85c8521772d973150278d505854b75a774dc88bd4cd22229bb08846f205f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-headers.zip",
        sha256 = "651f304a7892f5c2545cdfe777fa8a4b3b98399476e32e3cb66119560828a449",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-sources.zip",
        sha256 = "b21a86a958216ddb4ce9d2dbf32896078b5806f2b7af8804665f52802ea1cc5f",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-linuxarm32.zip",
        sha256 = "065f3107a45ae660425dbfcdfbde1b0beb08a1c59a121836eeb6cb99f22b92f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-linuxarm64.zip",
        sha256 = "8e3f74e6eac8aff94fe69558a77b86bde83ef3d717b8ae418580ee97b575c70a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-linuxx86-64.zip",
        sha256 = "3d21f88cd31f4663033e0ce4c5edd210e488360f7e8edde0e76f15490d0d930a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-osxuniversal.zip",
        sha256 = "128b75d2209f50ffc651b92f236de852432bfcadf4b1ef03f69f84ec9bc1eac2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-windowsx86-64.zip",
        sha256 = "a01ada237b30fdf21822b62cda798221d872f696948b68c6d16e954f27d74032",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-windowsarm64.zip",
        sha256 = "7a7ec1b46cd7c43b829b2c85129e3665e4b1237119da7c753342e8f7a973fe7c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-linuxarm32static.zip",
        sha256 = "6406611086edec380e20312e03e3e64f842fcecc8b238d8d4e558380e6653c6a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-linuxarm64static.zip",
        sha256 = "b1c32720861c4aee1c1e9da88bb3db990ef58ae50c9cfd9f6dee48d34c856780",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "f5509de28fa6cabdcde44557211859133d45e1e2f7a1469115179274232f439e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "da7bbcc898347234bb3e12665cd54559c536be53c7ca8c615dffbb8f94ec6112",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "73edcf72ccbe98801ec0a384c8d9758f308bafbc3d2a283c2b4a0d373d784ed6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-windowsarm64static.zip",
        sha256 = "558b39da0ae8ea5404fef059991f64cd920059b0839504c40b75cc94fafbdcbc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "74f4080411e7bdc90041912220a8cf55d09a81ecd2a036efc228dff6ee4b13de",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "225343f62f508b8705341a7db5bd79dcad34aed29bf615a47bf88d99d07d45b0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "fbfe689ca9225adac6a6d90f1aec3158d90143ae38861701c8674ac3cc45496b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "0a2567b9f14e0227c101ded124d10b5c4a801e40816a45a3fc321b41b5d07d01",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "f5eec81d70904e900d6d2bfb16d75f305b004aa31c0348ec6d7530efd822537e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "019fbfca91f7db1bc3e4c0a1cd1a2eb561ab855a182c407cea565129fae78a8d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "c93f3339b67a6172dd4384e0cf84d86ae67ae81e6eabb3521f8d9efd50d89dda",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "2002456bac583d01e8e5b9b194dd59f2b43a0fbe1396f207ebebe8a051ee18b4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "e0d6ce10492e34fb299e8fd1e0e29044fd468df3849b56da0982fcf0fa2471e0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "d8b8931a5708227a5199b70abf28119366699bf260a41e7579ed50f5d313ba48",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "6fd034abe172d97f4f9a6ec5550445ff8d47d7d8380e43434d5966cf2f4d3dfa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "e1933b4c327438da1ee7bd45dd3279616e7fd9ae3fabd4da5bdd62c0e9c6ed73",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-linuxathena.zip",
        sha256 = "bc718a489330c702df872f0deef7b4ca3718f699fbf4e3c0d55b471b9e0c2ab0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "e4ec724a1b816a582c2fa03313e51a1936a7da36f0f57c43bf117a4e863fb782",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "12ba1cd01b91a8f9a630e0ce6a0668b226f04637188e85de0822e9fbcbe72f82",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2026.1.1-beta-1/wpinet-cpp-2026.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "7bd55e77c3590459089420778b171ec35563e6f7d384ae97aa70d72c2a5f33cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-headers.zip",
        sha256 = "571bd42afdffcb8f3e20d3b7c214e297a97fa8620004c8f65c2477d0da247693",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-sources.zip",
        sha256 = "38f583cc2e4b5d17d3f1dbf9d8dba354fcfa089fd1e487bde86875c1becd721c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-linuxarm32.zip",
        sha256 = "234267172eea791f1b2777cda7a2e841e632bed5d5c1fb06c25996da85ea1713",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-linuxarm64.zip",
        sha256 = "8e6451d199bfe0f2c6b7503a482edcb91868bd7ec794f182d4d940407b86c484",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-linuxx86-64.zip",
        sha256 = "6d2b3c482edd016e62e2df6167eee1220546c354dc7ce3cb590f1f381684920a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-osxuniversal.zip",
        sha256 = "605d0ad2faee95a2e790a4c97ccb10e75d980fe34500dd6f357c9793e95e285a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-windowsx86-64.zip",
        sha256 = "0c50e6390dcdd6df58c602c3fd71032b32a30aff4f0e64f0c1703965caf648a7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-windowsarm64.zip",
        sha256 = "0bded0007d7169a15c016df27ac643604393ef9094abbcd8ee547574fa3bacfa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-linuxarm32static.zip",
        sha256 = "99ed542ff8986a74f9ed9a4cfd39dd9ce25ce1cd57c97c2104792c3dd79961c2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-linuxarm64static.zip",
        sha256 = "23775a8e2e4b91dde84c2e967626a4de82f599e070d47d5a6d3894faf68ae05a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "1851f71b1271cf58f6103d46a9af6747d36cb44365335b0e704c4b6d1d16bd60",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "10d50f2697935ba290a1806b7e84e7c84920e452f2cc27456eaaaf04622c7784",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "bb0ab607fed31666a5c2675afb3d0160fd07ff4ccf4856fb7b94a985ea5a9c72",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-windowsarm64static.zip",
        sha256 = "1227df98b4acbadfc0c54caac4ef75629bffc67c8031b493062150aeb54ef555",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "56067c1fa037cfb21bbe4e70055dcdca27600ee0683db36eec35bebe07ce8880",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "4912d450a2347971e1eeb686d7d3896a3fc022fc7642af5ce273a44035e399d3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "54980ae54528f9afc56d94201d33f3072121dc95a9200520e0bf69f73e89235c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "92b3ad8c635e5504e3d0b0ac620c6b8937dacad9e82b957030d6b25b704364e0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "77ccd448d4aefdd5d8dbe28d0ce665b3c1e8bc221badcb72a32dec8a4b82d920",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "96e6678d28da455cf740c7fa430b6749d647e72e868259fc2f141f0be9342447",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "3519fe545d701a0093667c0fcc3fef1aca71b996bb03b3ff6c9f4b081ceb2bf6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "595271bf610c936a093dc3ee4aa4d565843eabb240bf1678359ea2c1e6299e63",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "63a6a71cd668d3a35150f408479decaa9676d32c2d732998749f7c05b94d6fc9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "63603e23885d68439fcc66051e7b108e9eda1e0d2a2d8d03794d96481243b443",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "15248376041bf230daf186e48f6a565d7976f7462e3559687bddb1cdb7dda320",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "644259c6a4574c56331eee92c15fb5784753f8968695bc4e8c871135ab132f72",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-linuxathena.zip",
        sha256 = "1b3e419c7e450431d0c59803918724da59e4cffe29da230e5b1c8b18799c4e0b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "cbaa60988f7e2355c2b7cc40fef7e24e00f1457d23acb77d82c131d52161a81f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "761970c2ebcee4642d82e41fdb07b0241df8037725c9721726c453895e21f5b8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2026.1.1-beta-1/wpimath-cpp-2026.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "19f73d2fbde785080f370357f5c6b77c7af0668b10ecb901880a8154cef338bb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-headers.zip",
        sha256 = "25e645d99ceab05bf4470ec43bd2079837ff0d6a425dbdc38de362dd0bdbe093",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-sources.zip",
        sha256 = "22ae66fb8a520ebdfd6579ad4dd2ba8dd742ee41e7b91e11d3b695c76a87f9f2",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-linuxarm32.zip",
        sha256 = "aaa2cfaf3081602789275f0b3b62f41249f294c5e839c4012a511b7f6edd69e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-linuxarm64.zip",
        sha256 = "d2f2852e6cc1fd9f1ae76dd93b9e88be18235a380c4bd1bb8b9160119b1eab3f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-linuxx86-64.zip",
        sha256 = "a7bf002643f97766774322797bc7c7e261a93bc847d6a4becbbcf2e396634f6c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-osxuniversal.zip",
        sha256 = "55414ba5e874e479328bbe67eeb56f208712c836dc958a0def968606db3a41b6",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-windowsx86-64.zip",
        sha256 = "63990a90681e70938169457e5e9ce3fd993d8389ed3e5836fbeae8d3951907d8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-windowsarm64.zip",
        sha256 = "18cfc79af9e4c661df0edcfb4d7c2d3573c64b4b3012b3b25a7b076954433fc5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-linuxarm32static.zip",
        sha256 = "965c212490802f2d625612afc5f004c08dc8a493bd475779775f7f3a8b784adf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-linuxarm64static.zip",
        sha256 = "9533c1f1c45d0b2d9fc1e2a83e6ce38734f79487247280691ded99c21a231ff5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "793adbe7d970818d343557b4808455aa1cfc7a41520decbc78772e442ef11691",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "1bc8b59067a6cf114a5d04dcaf34ea5885d1e3fc86ea76233f92202c4cc82a86",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "e2c67f072111db5ac5ea5dba08c4d77df8d1f422f8daf40340745ef802ad7e1a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-windowsarm64static.zip",
        sha256 = "2b4853a193c1de528612fc28d5778c317ae2994cb5691520b5267b2e04d04358",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "2352fca1989e606cf32940b0c32b799c5a7bbd5a82d146b79fb978ada0f396b1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "5c3c881d710103e3f45c5e9b7320c3bb389141ea7cc09f4e2dc1b2dd0de7e357",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "9d3941fd4fc52efdf434fdeb5f34073f6f7995717966a8727e4a5dd70a02f921",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "826ca5d3ed85aef7b640fc4b2c2ae6f22c94ff0acfbe2900c0d6fb2188cd1afb",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "b4ea8154c7d1dfd21d0048f48a14d97e0bc819e91a43cb1edfff82fa3eee264e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "46798090fe70c433678927006c22d24fcf82a390ca2ee80e230add388943ae7c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "7065e257c2fbce1556dd5d87fb5c16d46a9d940d2207f4adc618b5806299ce26",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "35fdc022bcc1d83563c22c4380851583982e52cbe32b59e707c03c83955d7477",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "464033f1eb57931ea7c5d319d4848f4b97c8c61fa92f5e18b33eb9ecd0e41277",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "f566d757658e5a52e96914afe0234de7bda557b0b561cd7cb223426b8eaf00e8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "01faba7ef53ce4fde67212305f80fa2846e798990f368efb2b844119449e83b6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "b295f7d6f9176170202ad8e6a0cf46ea0f10403ba7d06c95e72e056d2ca8f64e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-linuxathena.zip",
        sha256 = "89d758c2138a0103acf6acfda93e3d860397da7ecd09dc6385a5a0cbc97e1a43",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "2a2b6043f2bebb060c50337bd3c97d40c74b0b19f7736d5829ab1cca1e7e845e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "f4c0897d0ba39f2e4e763794c06b115146d2912f24175e328f3f1cc96911b2f3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2026.1.1-beta-1/apriltag-cpp-2026.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "92fa496278eb0c18d9e02693300c3a50ba490a4ac457cb0c14135b035ca2bb4f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-headers.zip",
        sha256 = "1ced61bc1aee09761f1edce3fd278a68fc92063be65271e1c21eacaddc48593b",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-sources.zip",
        sha256 = "d576a8dff3c6de8981293b91cf9a0ce33b142d17f377911c34aea7d32e514dd7",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-linuxarm32.zip",
        sha256 = "0f12404390665dd20434b3c9cbdf5a6d44d2abc2e9b9172ad34c43176c28a446",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-linuxarm64.zip",
        sha256 = "b03b24bb92b4190d3cfe3e03e26fbb67c80dcd3a3a706bf918ec498b1cf007e9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-linuxx86-64.zip",
        sha256 = "a9851750d95359237b36305ad1cef87d18e695b5b705e9af4baa28ed23836268",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-osxuniversal.zip",
        sha256 = "fd4ba398186409a2e3dc1f96472161402e63dfcddb78cf3d438b45bb82314eaa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-windowsx86-64.zip",
        sha256 = "a2c9b68481c83d6d3f83febdded78a5fc402b6e638fb19160e6daf7411c2be67",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-windowsarm64.zip",
        sha256 = "940559ed37c868de51fdc7f039c1cdccd95a6159c2eb7193ad0a69599511c2b6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-linuxarm32static.zip",
        sha256 = "954d4b1144720cfe7b73dc728c1aa6ca17c9057ac2a81896730c367006a28368",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-linuxarm64static.zip",
        sha256 = "7594294057c14c7af41562730a60d6ecd7cc0d507756f0952ed595cd7db42e36",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "b57bad874a95cc5cad8a0491c21b3cfd0d60679d92ff9216fc911801206bc2fb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "127b09150cdab8ed5d3022eaa9efbd0fb1e831679d14c27e294d30846c8296e2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "d972605fa5088ae84820162283bd7aac8f614bf56af6f347228320d670f85afb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-windowsarm64static.zip",
        sha256 = "37230dd8858b745e6944080ac50e5a2235ee79cf8de392f0880fbc000159ac6d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "7871613aa8ea70d22dc141849da8820e6d6d675078742f543b1dd5ac8df76a2b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "092bae2153be06dceef603bc5126ba018c9183da4d59ebfcb8806e1054f58b7d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "8ca376b11b3ef0598d7cbb74d3932ad2b16e757c50fe871d0892f92a2aae15c1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "3f2bef8672fd0daba5e259572f03d7290163efa027824d46147ca8cd12f5b7bb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "2df7077201683a06d6ce40054d118b14b64e451c3421adc23c234d9d54e386c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "d82b3d9651ab69dd0e1d1ba17fff522c158827dcb6fb7f16bbe730e7a8857f9c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "aa37f7b254b6ca16ecf49199524e230f228d16bacfde9f99373b9c83ac93abdc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "cecc2e3300ea3e8ee312a93144bead47f20d926048c7b7cbea9978fef56fc7b0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "2683f84ef662faa2fd4633b2bcb17fa68bdd0549990e58b14fc9b4718b3f0a32",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "9b346186581519f4425f1ce199ed7ca544a79cb882c315f9b1e40467142d0b93",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "dc8f8b44edf4c0b324f7c33dad79689c4719f37fec3fe54424230bb57ad7975c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "33e60658c3c3bfe70e3b4d46f53e807163752cd36968c20039277c73b448405c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-linuxathena.zip",
        sha256 = "a68dd2e8a0e4203a4bc234c00c20a37e26dc5243a883e9f2f6c83f3f7d09909a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "9c7b7af643e7439c6d5b0918870dc1c44cc9ae6dc624287e3a24ce2546196f79",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "21def931fc546965d02504aa68dfcf887c4003dcfe31f84ee404b2dbcb6c9010",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2026.1.1-beta-1/hal-cpp-2026.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "7a590fb7e6fad5f4747e462091266b146e398f8c6a85220ec1c3150a16c6c035",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-headers.zip",
        sha256 = "c20834f85e026c8094574cdee6fbc3eeee5d4ea7a8e7bfe818c3bc7ad5979a41",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-sources.zip",
        sha256 = "95e272ef8dbf6266869886db879a2f311f3c02265377ae59faf18548a0f7d306",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-linuxarm32.zip",
        sha256 = "cdb73c5055b161a65b10ede744b0c4c74c680819917e81b9d117b77b0d712cce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-linuxarm64.zip",
        sha256 = "81244d2b87d40514668da81de846b7d8a34189446571fd4f85e8062603e4f5cc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-linuxx86-64.zip",
        sha256 = "f5daf4f1524b1b09965823fa7310ca60450b0f393499e7d14acbe5641b379c98",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-osxuniversal.zip",
        sha256 = "3466e964c7890edf27728368aa0b666dbc2120e6b7c20e93af48289cf663a079",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-windowsx86-64.zip",
        sha256 = "b475815ad8d11176ae79dbcb143ea790de0c48084d558411704ba61eeb19d231",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-windowsarm64.zip",
        sha256 = "8625bc1d9e15cdac1f1ca6c93c5fd6c2c25c4352fbfe23593a2634af1fcc3e05",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-linuxarm32static.zip",
        sha256 = "786c5070648f9b79265a4cb82ccfb8f459d0cf5edd0310a5754489c15a9c3ffc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-linuxarm64static.zip",
        sha256 = "797e6270eeafa5d4511bad5b48c765a6ab6f8fc907cceed600f5cccbb7910a45",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "45bf35c62e6964cdb646ddb2175cdf365dc101fd499a3615d86542907a9f84ca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "aba93a0a2082cf2301b160e622d702181fa3a31f19637d625d2447f17134e9ba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "fc6d5b24bbbd60e0c983a8b2c33938683c16e9cb2786ca96412129008a0d9f68",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-windowsarm64static.zip",
        sha256 = "d000481865978b451fbed38048332749a700ce4f839c2fef15d9e8bcc8a78aaf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "30895c0cde429226abc59dd7e9ef7b07d2203d5730fcc1c1bed856122d461e59",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "611c96b8ce81ccad01bbe86aedad62d3b1960beadf27a42464e88792fa7689f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "82e36650cc8c7a94a9606d3310692ed4708acc65fcb7541fae582877da7a74f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "4ee70a605e9636c884f93b70b72f17a04fbbfd4fd26722cf98bdf8cc9467df46",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "6cad49214f87a94bf4deeb6d0d4ff971bbc8dd5ba09ce80abe92935a946d3ced",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "220f1f1982b60681dcc58ccb5c87e5932c0057fc477921922d8bfda10b49d566",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "a20141c0bc995401fef331277b5e7eac51430e5646ebc8c1bae96b06190da049",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "b67ddfec8350130e882e85ce235ac921126a67aea1ac54129551f5e2aa0f8e97",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "975dc7a9580683594c79e781b51fb8b7c5d2989b75eddb237c0387e1ba18f81a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "bf17f11babe97306693bd2f93a64b426927f9cf1b3e3b4679b3924e1fbd6d761",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "c378fafc6e4a63b97aff51fc3019a7039117030cd171b5382b6613ebec499695",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "2119d59da1bcfe995bcf42d2958d3f7847b4a39d62aee981a8aa39374aa37ac9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-linuxathena.zip",
        sha256 = "95a6dc74401b9f3f1b8423b7e72aa28c9eab45d5f85567f4793ec8f568ec3e49",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "8f8aa47b31cc73846c5ff839863ad3be8e21952dcc2121b14406eed3f2267cf5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "9c0f8285402294e461d0be5a4ef7573167cc14856d22f2521703effe2a989a07",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2026.1.1-beta-1/ntcore-cpp-2026.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "a46591b23f02266b4d590c5742446bee890bfe9318de949c130c4cecf3a97093",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-headers.zip",
        sha256 = "cd3d95cbce7025a2d77eaf0fbc67470fa0aed46a24c117cab0be86b23ddd9624",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-sources.zip",
        sha256 = "50ead97069f8601b07136e47e32a6d10defa74a613727a48eab95febaed074e5",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-linuxarm32.zip",
        sha256 = "db4532da8dca1844d2f82b64b1b001209b38ea03af7ed83d0f488caf1171d0a0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-linuxarm64.zip",
        sha256 = "12f464a41ad10a0e2db88a97421009d087eac4b688954e3d809fdc9418f9c36b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-linuxx86-64.zip",
        sha256 = "e4aa7c84d2d6646cecc23c699cf4a279f943c8823042d697bc9334711385091d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-osxuniversal.zip",
        sha256 = "9b3d2f3c6f9ddfe9c9795b4938897b3bb3c4d98dd1165b1391184bf808244a2e",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-windowsx86-64.zip",
        sha256 = "2eb51dba0f1d2ebf390623f3e21f295893432991a600f129ad01ab60576b4b11",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-windowsarm64.zip",
        sha256 = "52ecbf16d5d166e3f0e12e13f732fd4fbc5ee87fc34000b6f92b21d8e9d06ebe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-linuxarm32static.zip",
        sha256 = "c3879a039a9e7cc0fed17602cd19364c2825f914e4f823131bba9209a00a35f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-linuxarm64static.zip",
        sha256 = "55dc5f8b51a5fdf4c1fabcd135d071f35c18ea2203a52b733751df9fefce0a9d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "b0c951e9c4e5b283d89c3a77b8a959389c416ba3d64e95d5c8028d09e5469689",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "95e60dbdf63b974c4488c0625b60fc6e0c032d22b582272632d65324b9811461",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "378bb54917dce9cc296ab295fb0850b7b1575a33cd65833d03df62e1cfa23ce1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-windowsarm64static.zip",
        sha256 = "00965e66038f13d86e3284c90cf96935f45203ba186e07240cbc7a024d328eca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "0b6bf2619b81def89e583b01cd21e8601f5013162547530c32d0120161dec416",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "5e2064f97f22b163bd951326bbe8202b4313970bb48032892f16fd7aadcc27cf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "67d5023983cf85fd4f0ee30aa61e619968345508a17f7f75136825d271d62e4c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "fc46cbefcfc55a2f081c9371bca00238b189403e38ee87325f9e1a61625bee7f",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "67c38e1b68698bfbab4940ebdabb981e91e7d096dca0cb1295546a58fcf19a2d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "a6a90b75a981aa087791dcf2dae9198045ea828748ef8229e21babddfe6886d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "38c4e1b39eb8b4046047c838415c556fc5a6f6f6c74ca9bf57b72f7340e84fee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "63bba39f21f7b4589ec89dd49d1cbc57dc66f805465793d4871c8ef66c25b4ba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "f29e72f0df3f93988781c134f6cecc296937bef3ada5fa8cf39cc870931e8d68",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "5c2f35184654a7dcb6f35a7f5960973bcb9991896320259d362712ca8fc2435f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "edd65fc7e1d8fbdeab82f666ccda08d9d08e59c2dc5cc7e2801c407caf899e7e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "06d81316aef0f5f89d651f53a138405ac86facf9fedb23541752464c7c35d604",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-linuxathena.zip",
        sha256 = "ea4b79d3ad38a254ddeceaa6b243708768c9303e5e222e92c0df35e08422d0c9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "aeb2853d9b475c2c6b06bfcebe16589975fa65468603794681aacc4aaeb134e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "0ef48d264accda1d5d7ff07a2d0edae9aa59e6196654d00dfb5cbafd48985efb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2026.1.1-beta-1/cscore-cpp-2026.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "dba5f2acdea4e8d386aa8eadb2e8cb4adc49dec55828a9e73673804c3ef5a5c2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-headers.zip",
        sha256 = "07b1d575823cc68a7f7e23a0e2b9ed747eaecf064a5f063d9b6edb3e3515c784",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-sources.zip",
        sha256 = "3323cca1231efedbb07b9f9b077c1c9e0623273714008bcdda05fae7346f9173",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-linuxarm32.zip",
        sha256 = "e3fb190a02c13753fb3663d49b72d4a0756efd4d7419400d216408aca3067a6b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-linuxarm64.zip",
        sha256 = "83ef634b1bf0d1ac7763328bf4622b2621d8cf0c489b31e57a4f87d3c287022f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-linuxx86-64.zip",
        sha256 = "e8f5d808fb4e065ac6033d525e2f8e11534530d7880cee2860f96a9c966c6d6b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-osxuniversal.zip",
        sha256 = "5c605444fa7ad0e14d19e88d215ffacb1f1c22defca3306b9c2f405437941cfa",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-windowsx86-64.zip",
        sha256 = "890f36d378495a7628ceb0a9e503b0ec4008dd8c80c70cbe6085cd13fd3eb2cf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-windowsarm64.zip",
        sha256 = "31642d44957e78a27c8660dac125bca57e4051034b55265c066f85b800b14b50",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-linuxarm32static.zip",
        sha256 = "164102eceac82acf5c780335f32bdadc861ad32ee5864a456e5fb0f457b2fbbf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-linuxarm64static.zip",
        sha256 = "5c75f9e031ab8e15cbc1ba3aec026d35491d68ebc64004a01a5b6a99ef386266",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "d186996b066550d829a6342816b1fee7ccc1ac674feee5809f4e8d1de5050cb8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "f5af890db69e041515d26c78f1419c8e2f3d8c850616a9bf9f72b420fc476c07",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "239807ffd8ed066d83b07896faad0debb232a50be73ecbfeb7e152768aa1dbc2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-windowsarm64static.zip",
        sha256 = "76295dc217da63590ad526adf6107b84a101c687f78054d38edaa17dd7a8e3a4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "c732d0fe4bdd23d7183f110a6d677706aa80a7835e4b6796eee8a0eb2d93a5e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "3db07009396c5c141aa5a56ed3ed6e17ea57008efa046c427e160595f3f9d879",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "e93f1fa3e115c1688ac8f74cc9eb123b86d91a868dccec4ee0e9d406d456b90b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "770f9126518930e98c22a94c814e6ec4390e5fb6dc1d6e8a7eeedd8eb80ea010",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "47cec24b79e8e7cb96d3cdf0569433bda108fd1849f0138d04487dc0d7d67932",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "f15b5e976a70ebfb0596fd2ffc0d86fdf5a461f437de4df79e900dad632cc8fe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "c65ca169106604921b8d4217d03db3893709842f43fbe02de5a20742ab62b2d3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "3f12daa9b8f3bbc94940744673cc228eb4b1188c2f8c3d551e3b640bf53cd67b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "816d4ea76fc5206cb60cde7f814039b1625f7eccf46313c3363cdc75adda7c8e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "6ecca081064c8bfcfe8b0235fc20192527f3a9f8472ce7de57c21ac9c7df0c8c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "12cc7929a1def6c320b1c2e034e6914fc35b5b4f6261438e38c60113676c92a6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "08c2ad79534b4aa3ea333da62e5d5b7162d3c90ebd4b74edad89f33e1b949ab8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-linuxathena.zip",
        sha256 = "7a6d2467da28c1fe9b5d24ffc1fa16505ab3bf1e6c48755ddecf757cdadecc06",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "b8fa05bd0db7b9a85b84eaf385f567e5c4402c24ffc759a6cfbe5eda6936cea5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "aa0566698f222a960f3fdb65d0e06a0557856f762d781335582adc29b30e627e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2026.1.1-beta-1/cameraserver-cpp-2026.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "85f46376d1866a11a1663e01ce3df0cb302b7760d54d65199112d17b26a75c4b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-headers.zip",
        sha256 = "1016cbc67e544daa39623651f95167d432bb3e930b8119f6a68a479e89a72995",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-sources.zip",
        sha256 = "5fa29624e031c985081fa73d44b5b253a20b0102f3131eb8ffccf607cced1041",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-linuxarm32.zip",
        sha256 = "ee77b627da90b934c9330e9aa54f33abde7fa8898f43e76b29b3a1894d8c4c29",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-linuxarm64.zip",
        sha256 = "f5fac9dbbf6f28e7d9d98e4d0fd62292426d5e39b6f57680d910463a25e9e4ea",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-linuxx86-64.zip",
        sha256 = "a720920c21ed3b7133950a3b16c23da24aed543b064e50c9b38ee69b7fc80011",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-osxuniversal.zip",
        sha256 = "54b3fb10dfe33960c51c353b7302d91ef3abf7167fe00866ff177fa0ff8f43ef",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-windowsx86-64.zip",
        sha256 = "645829794601ca6190fa9c0e94b1e8a197f9c80a3235d7490e4e55baff7f44be",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-windowsarm64.zip",
        sha256 = "932d1e4d3b2a39b573b86932056d9fa7214c127670b594869d09a564e2616cff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-linuxarm32static.zip",
        sha256 = "ec610ff45214e9406a362becddd388d1577ac372cc2a692d3c3984341d63b4e0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-linuxarm64static.zip",
        sha256 = "2fc5206e96380389cde81d58856d6853fce5e590c7adbd54ab9d018803f0c924",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "6db6cca09c87f57ecf4db6d2dacee80d04e3ac8adc4a89500158cacb537b641b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "288bebfb5ea7cd1d13c88ca3809a33832bc6cb7d3f3de8b3d69395cacdf3ded7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "9c57d638d243f3206b83d331b747492597693021f936e0298b7dd438423ad7d7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-windowsarm64static.zip",
        sha256 = "d8f89911c601cceda473c9fff8de3ee5a49af85d1a99a5a843a82e7d4bd55682",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "71758414d8289096cc42a3122b3b20d950868c4404165a948448a8d04d2a2488",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "750f3dfc58b256ea1ccc39713560d3aaf1fef12c277757bb5b9d8c88f1c183bb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "346852e92c21c102b7fc41b6f1b2b70d2148dc3c4a9ad4f306beccee908b2721",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "95855bfc8f8b93073ff2d69be7c13b2addf1209c38538b42818d79a977c95b83",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "992725d39e06328c7d97c45dd194b77f05afc1f4f4e12adcdeceff13afd49474",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "837849e6900a7bd47925fa4e523f19e02d390b6e47be4a7006f499f313057967",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "7fa109ae9a001228cc8c1728608fe4b65fd58aa89e04f0aca8171aad8934c945",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "9f2ee164e115282596cbd2bf51c253d83dab26e970001177df3b4344d6581c90",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "eecfa0b484cdc902f53a02a14b1cf7a03f98a9b20bb6435c6750fe90e87363e2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "11e8af6816b01c40c5c8d60f77e3503c84bfef1d2fb76899d6040fd51ba0f405",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "d92b33a3315164f032ea43e1744ec82b12354a5b142e6f484b533f7fa9a7f88a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "b3843c8829937839014c1437de69513a946647221143725e054aa23e43015ebc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-linuxathena.zip",
        sha256 = "c21be183b6fe4a64cf224705d6ecbfbe116d8c90b25b253c538e435917fe150e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "bff02347bc5a7a27ea97179cfb5195faf324ae1288095db8a16e256cad5f589c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "45c203430df1b035fedc684201beb95c165b8e44c01d819f52055c3aead0192b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2026.1.1-beta-1/wpilibc-cpp-2026.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "467d2903f191c31a78fca66392e5e7c3cff70d6cbe8e587b9cbbde92d02ed2ce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-headers.zip",
        sha256 = "29e4c680d20555e094319ebd259100b283f40b2102adb6bf8decbadd09126ab4",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-sources.zip",
        sha256 = "1b901dcf6f23f1984eab5100bc1aca0fd157c3d236e6d33ad3a99a34eab39732",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-linuxarm32.zip",
        sha256 = "3b38ff404a097a105b7600921ebaabe6495f667c38e6d50c0632c77d0106a374",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-linuxarm64.zip",
        sha256 = "24eaa1bf65b19c2b9271b4e8d6710b1d536da563f2ae850e9cd2d6a5bf2e46ce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-linuxx86-64.zip",
        sha256 = "52348107bc5dd9ba521469f974d9b16d53a3d5e694f1fcdb4be31c62e1ecc8b2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-osxuniversal.zip",
        sha256 = "9fdff91a5f51e053edcf50250f6d3f88c48ec82fcfc934a35b8cf52aae3597f5",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-windowsx86-64.zip",
        sha256 = "5740bab2c9b69ae01873d80833f3ba34c480fa6f63c3a5ecb48af0820025d6d9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-windowsarm64.zip",
        sha256 = "29fd9b7aacbc0f14d70eda48e6b92a481f9329689c059379a933748ef96170e0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-linuxarm32static.zip",
        sha256 = "3c7f4f6b4ad8d1a65f8b9b33ed373cfd4c4f78037e33d858edae3745223617bd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-linuxarm64static.zip",
        sha256 = "d50715eb5624d1ce17d3302fbdf9da1395468b505f46e274938718502c128cf7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "96a52bcfce05f4bae10e4ac96a841866187552130bce94edda361ca87b24f9f7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "0256a6683978528469a3a144e6f31bf8be3b1d0febf8d8ace3a81d411eaf816d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "afa15a27d2dfd2387d6d3ad6467bbe2d09c63306e745227bed87ab4829992560",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-windowsarm64static.zip",
        sha256 = "8d7a26d0aa9369bc81efbaf3766d72ba2aff963c89269f5e081c69f73d0c2059",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "53b6137bd312a5b395d92d095e5341dff0a64b46b18fde16eca77f465c787e22",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "148b671761aec9b0d7f2abb0e878ca3288303d567661a5ea860dda0ee246ea13",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "af37e2915f933c2371b560b9e7a03f905fe73c15f53402341d66ea353cdcaf1f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "26f8a0b6b5d6c7ec0c52ebb7225c8785a0b20dc20b4a039f47d6c306c85e1b09",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "f9283150f667be394436017d0bf994734c30a1b65c18542e7dffd99632a64ee7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "ce613a4dcf6083962d67189d5517e12670a0680a5ec478066a7b01ae7b73c915",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "7b4bf33044e2efd8e111a0607d7d82a2c35ec18bdcab45607d96b6c69f10d3e9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "2fa3e92176138e61847ee034dbd74799ab8474a82efac10aea434177abac3f73",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "c29cd515ac66cf24227c84071261e76f1325bd0b141de67b5d740b3c6456e725",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "5f9c532d5cb1dcd1d992bbc12e55865eb3ec3d67c0dfb57643e2c70d624f06a0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "5bab66ef3663815ea5fddde0705758657a3ecfa8708a394f5990cd970228a8b1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "d16d66e77771168b19f5c026f0faee026ca7951fe4bb9791b6862f8d7e691208",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-linuxathena.zip",
        sha256 = "6362d558b4dcebefe4b989f34e87c1294b951a21df00ad61bca609681c28539c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "3f9be372f0d162bda1d653a95e0bdfe7d8708c937175a045c19fac4a2eb3eb1c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "d6351501ebad6ce87f5cc0eda0ee104d7d92a9a614736fe3b395f54a9a323702",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2026.1.1-beta-1/wpilibNewCommands-cpp-2026.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "feec4fde753de83baabf2f316e80f5f8297679e1af7bd1b537d9292b8ead04fb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-headers.zip",
        sha256 = "652c0849dfadcb7bca197595a5dd71d518690ef1b227bd6229c08b5af065ea44",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-sources.zip",
        sha256 = "2869e7f9aa4e8f03b740691f3cb1ca4b97ea18b7bd4a5f0fe346b9dfc0ad5099",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-linuxarm32.zip",
        sha256 = "ead3ea53a11fadbff6ad0840d70b6587075a15b14cd6f5dc176eb492fc67e8cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-linuxarm64.zip",
        sha256 = "f70afe25dba6cf900c4e65734be7144c51d556b26b3e73511138899a442a33e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-linuxx86-64.zip",
        sha256 = "429d03e35012ebe14f585563ded8acf48e58c83e355a01d448280bb541d8588f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-osxuniversal.zip",
        sha256 = "f25ed3fb31b5abe13438ec77ca96050d746bf36ad7c40050bdf7be0e744de699",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-windowsx86-64.zip",
        sha256 = "7d52ce2694431f811c9a14913e49ea75392ca1e37813f64adc5c261e75d78e34",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-windowsarm64.zip",
        sha256 = "eb571f185bf52f1acb1b64bf78f4e6edb4f0be2ae366852e03e3266d8af7af70",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-linuxarm32static.zip",
        sha256 = "dd91a36cf7bfa599799d02f19b4bdfe5a9deb535fe6f6c79b0c66c0e1d18627b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-linuxarm64static.zip",
        sha256 = "1c6930df8ff34a141e602fdd17abb6c78ba8ff749498f138ac3253391995626c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "493cbc09c7205fef07fde2e27fc55e750cfebeb40565883a2086dea2f6e8b74e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "12ea587b1cd68bd3e9755f1851486dc6f6c35645a13af291727521ecf7bf660d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "296aa69202b1eac83e4842131de71249799d8dc6ae251c301ec316a3bf60ee30",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-windowsarm64static.zip",
        sha256 = "8aa36a6127c498e911bd165c4eba42c4ceee921ff7a68838e2abe2c66a66610b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "64dc36af7562417dc0e6c1275f2412ed9430669f02efc9126a00928098f9904b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "90207c5b9f56da6fd2183dd20dbe821a166390fc004c32ae4c76f1599c3f727b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "1c7567853986cb4260a2638576fe00b72049a98f5727a5af4c592741d6e36105",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "8cc74490cc560afede91070a74f6dda528ce318c0634390ea83c8bb6de0d1e61",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "7e93fe67b92ad215818804f1ec4952f78e1e753b17a41a611103b40d54ebecb7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "cb9c12808626da733c16c9b9905c003584821a3493d6397f890355fda8447a6c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "d4f4d184f56479ecdf18026d873171ecaa589f3f8c1a1c51039740fbdcdb7d78",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "cd19cbdc6d7f3c36200c5d01dcd8cbd9c574e6a6a9be118ece4056ecd6255bc8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "3bf03a32b2bff5c8db9592d31a8a8d60acbcd9364ec22d0ece2afb65b5ab9009",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "9e368feeca507953ad616dae55c96eb193b6c657650a5c57e9b65f2f30ecc8fe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "13a2e5dbfadfe0a42bb124dff91d259a2af7e3c541050da01ad78daa1905baa3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "55aad7d5329a86f67f17040673557cba4516cd61c3d3c7acd035baca1eea2689",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-linuxathena.zip",
        sha256 = "1411cd39e0472f28a7803430922bb6fd70cdd955ba8cce7a401f79ab912ab1b8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "ca52d36567f67343305f97ae9c21ab449a11dd5d06deb1df6bd5548301777c49",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "aa0fb9378aa298c9fc011ee59ab88acd99f7dc08c6f23705c5342da1408f989b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_romivendordep_romivendordep-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/romiVendordep/romiVendordep-cpp/2026.1.1-beta-1/romiVendordep-cpp-2026.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "90d11cdc162e459bd5fcba5082d16ea5bf54f0768aa2d90e79d51f1fae5a22aa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/romiVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-headers.zip",
        sha256 = "50c5b0b395d3eaaf8290bce8c0e95e204cd8b804295694b5b45004a51d5d15ec",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-sources.zip",
        sha256 = "c4d06babbe2d087c3d872b5b1a7ef24829b63f0067379d7fb6603cb8c817b451",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-linuxarm32.zip",
        sha256 = "2fdc52e523790d063228e07460b9972cb01bea7cec89b3d12cdfd8cad9b13284",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-linuxarm64.zip",
        sha256 = "a6ec80fd62563aaf5155bcd017b55a4f40772233d0b83e561be0d436f2589407",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-linuxx86-64.zip",
        sha256 = "fb9dec58e4895321d47a31c810c78e003481a85bbf27764b957c880cd08b49b0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-osxuniversal.zip",
        sha256 = "1c7ecb7370d07ce0d84a39d6c0dfc4c433dfc9850d1f1e1cbd39ccf65d0430cc",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-windowsx86-64.zip",
        sha256 = "523d754e97d961c33e1b5492998c3101fcacd1f434f96c0edce063b41ad229c5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-windowsarm64.zip",
        sha256 = "bb697755eebddcb528171d40cddfd90ed8096ba7788dc386cb47edb1a5d46ed6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-linuxarm32static.zip",
        sha256 = "da97e863ff350df690e08abeaeea10206d025ca453181533d2d58aaff733c78f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-linuxarm64static.zip",
        sha256 = "951d14778b1e67a0cf5cc297b0fd490025600322362b664c126e1208725976fb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "4236b8c1095889e26175c4347e8e6b4fd9019eb18b21617b4a7b671c03cf3ccd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "b1b39efe2f3716580f150925193951369e4331a077870f8e280825806af24662",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "b9a36d920b82691509a38ad353cf976b804ae7b3001bf3c8048419e384c878dc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-windowsarm64static.zip",
        sha256 = "d8d9a86b8a8863293f007151eb5c78b639626cb2c5c2abeec90f4235aae59907",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "2ab6c73fefc4e8abb68e8cb9e0daaa142e36a437d6de3eed802849c4d770266d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "ef50a4a34a9e6f8d5e301d44e9f7acdd1cea3428e4ef100a538b46354d9069f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "f9e65a6ab59bf43e93577ffd5ed20e48fd683db9a66814fe7015c813ff44272a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "821e72bd95f602fc2c6021c91285fea758359bc30141c1b89378cc664c4c3a0e",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "f7321c58eb60481be9fb2f23eb8ccab75e5de06e567f60da371315f43a7eb0ac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "67ffdaf5da7c7ad22731b15abfe3824a0ae933468c291da9b01b74c68c888161",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "cb8a5e7e123cbf5f2243472fc227bb7d7117315dcba3531c9c9ca1dca968dc42",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "f25476aeb4e80ef707d25bb55de23ad7b4d55dadec95729e41857392da50e6aa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "47acba42c1c936297f0040180e14b3120027880d33f27de7abffeb0b3f38cdff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "d06e81940e0d9ebdfdd3fef8a4cca949964a323758da72ded7fa9f742a4b2d85",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "60a231cece107f5c0ec2c4e12d328940edaf65349c615eca19c4c4c7a2c29a8b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "6b17451d047c630ec9abdc84bf7352c323a5d03d92861510642a64f7546166b0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-linuxathena.zip",
        sha256 = "1c6d97c5abcd095e04f18d36a126d8c19165939a1c248b8ababff28b1bc6d229",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "8c60c438ccd1cfd7537cf69bf7b186e170079f2391fbe08e79994a7afba2738a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "4689b82c1d5f680c70d76c633b25772f1e22961d6cd5d7aa5ceb8c35d53e35ce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_xrpvendordep_xrpvendordep-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/xrpVendordep/xrpVendordep-cpp/2026.1.1-beta-1/xrpVendordep-cpp-2026.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "249871b3706d36fb1da0a2f8ff502e34ed6df415de99b891ccd4efc9d866b914",
        build_file = "@bzlmodrio-allwpilib//private/cpp/xrpVendordep:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1-beta-1/halsim_ds_socket-2026.1.1-beta-1-headers.zip",
        sha256 = "a45779a4a0e1f5198848aecc676897cc6a23fcd21af6d19361b934961bf37911",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1-beta-1/halsim_ds_socket-2026.1.1-beta-1-sources.zip",
        sha256 = "88fc53604e5ca39e978ffa9bb0fdd0fc3da792c8832d770a8b03706cfb2354de",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1-beta-1/halsim_ds_socket-2026.1.1-beta-1-linuxarm32.zip",
        sha256 = "db6018732e1f38618ee0d85f2f2642b060cf9d39e11bd55653da8c937d7f36da",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1-beta-1/halsim_ds_socket-2026.1.1-beta-1-linuxarm64.zip",
        sha256 = "5543dce21c700f4293dae633b516b8857950ca8050107d4e7cd87d39a8732481",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1-beta-1/halsim_ds_socket-2026.1.1-beta-1-linuxx86-64.zip",
        sha256 = "99c92873287e3265d9563fcc28aa93759e950052ad5318b74d3f80860d87ecdb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1-beta-1/halsim_ds_socket-2026.1.1-beta-1-osxuniversal.zip",
        sha256 = "4cbc06f572cd42793ca036f7e6a92971f3465a3a3a430fff3e73eb3ff55a30f7",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1-beta-1/halsim_ds_socket-2026.1.1-beta-1-windowsx86-64.zip",
        sha256 = "53e19c8f6ef5baa07e2efcc4a88bc39620b359f7fd77a4a92294c419cca85cba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1-beta-1/halsim_ds_socket-2026.1.1-beta-1-windowsarm64.zip",
        sha256 = "c04d3dcdef88b75ef077c206879b892edd81c47907f76515aa5f255f6f59a623",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1-beta-1/halsim_ds_socket-2026.1.1-beta-1-linuxarm32static.zip",
        sha256 = "382a8116d17244fec5ad180a58862ba0deb4cf43676cafaaa52b9c17b6a25255",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1-beta-1/halsim_ds_socket-2026.1.1-beta-1-linuxarm64static.zip",
        sha256 = "eda98bec389457c1b1db829eff9b302a07089fb51c0bffd8b42dab567d8d248a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1-beta-1/halsim_ds_socket-2026.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "f48c15f3be3707ec0754fdf84b9a7d2042b6e65015cd1aa0490fa3015173b7af",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1-beta-1/halsim_ds_socket-2026.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "b821a0f340926fcc01411dd1d83dc0178fb9b572fb2d04ef9b433d5ee9dcae37",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1-beta-1/halsim_ds_socket-2026.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "42daef3e31798c83bfff162817df9693719dc0181c7eb042ef25daebca5ccd4c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1-beta-1/halsim_ds_socket-2026.1.1-beta-1-windowsarm64static.zip",
        sha256 = "365f95b19935712a5de629df41c15773636e54cc8e52010f303e21696efecb5d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1-beta-1/halsim_ds_socket-2026.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "681c55792f0c89525314888ed413d5e2ecb36c85add00a5679ecab1dca103a98",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1-beta-1/halsim_ds_socket-2026.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "257044586d2d223d741860bb8cc9db7152b21bb088dcaa0f045354a21f314b03",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1-beta-1/halsim_ds_socket-2026.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "ab2d4374079bbc55a02228020ab9d143a0237dc1c48a536fa9f87df443e03ded",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1-beta-1/halsim_ds_socket-2026.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "dda14c0df4b9b4855f8a2b74ca5b55a27d7d0a9e90420f569574c7aa7ab96e85",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1-beta-1/halsim_ds_socket-2026.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "36b75112b04b77354c30cb1e56e0c8d4733a04b5ad4280cdf77485b99ac3e9f8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1-beta-1/halsim_ds_socket-2026.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "8dd926f24c1a44d0b277f1ad17a74e3f3cf601ab9590351b298a852020cc689e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1-beta-1/halsim_ds_socket-2026.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "6326637dc39e73ede29a9de03f98b283e7241954d7a7b01baf80d27b2dd5e071",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1-beta-1/halsim_ds_socket-2026.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "367a478571a840720800c01bc2b06e57f876839a12d7bc740787fdf6d5f75ab3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1-beta-1/halsim_ds_socket-2026.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "18c2de84030b3416149298e74af581976c16a6a4fd8fbb04a1ba71c2b00d5488",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1-beta-1/halsim_ds_socket-2026.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "2c05eb6aa5c41dad64782cb46c25a9c31056bd021a744cef4ea7a69ce2b80b0f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1-beta-1/halsim_ds_socket-2026.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "4697baf264bd9e30e5e18ecab2013e026a88d8cba2ed608504cc44d4b9fda829",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2026.1.1-beta-1/halsim_ds_socket-2026.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "8eec21727c093acff1db034a3881a2d13dfcef7dfe554c711ca67e4eb52d07ba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1-beta-1/halsim_gui-2026.1.1-beta-1-headers.zip",
        sha256 = "978e35b4509483bf8043a894d6e78699f0c42ee53ed7e9cb97087bcf89af3063",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1-beta-1/halsim_gui-2026.1.1-beta-1-sources.zip",
        sha256 = "b5592f294cabdf9e3843652fd451acb8408fd9995dc32c079d5a4f91c6b13032",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1-beta-1/halsim_gui-2026.1.1-beta-1-linuxarm32.zip",
        sha256 = "c49a5d592c1ba7bcd1849d5abcdd33afe6cca0b68060dfe7ac8709bc3e641d83",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1-beta-1/halsim_gui-2026.1.1-beta-1-linuxarm64.zip",
        sha256 = "bb7b5b0439e2babcf903669ddac23d9b626b444cb922ec82cf8b0229151539a7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1-beta-1/halsim_gui-2026.1.1-beta-1-linuxx86-64.zip",
        sha256 = "ea0c4b12a84aec51009ca7a3c57aae3312766ec48213c6ed014b5dd04439ef25",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1-beta-1/halsim_gui-2026.1.1-beta-1-osxuniversal.zip",
        sha256 = "2abed5b8ac4779b2ef65a58d98708837b05109dab909ae41e03913620c8160ab",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1-beta-1/halsim_gui-2026.1.1-beta-1-windowsx86-64.zip",
        sha256 = "3740d4ff938bc89bac6ae3d5909d6fe1f0f917511104e9ffb6f47a2b49afa9a5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1-beta-1/halsim_gui-2026.1.1-beta-1-windowsarm64.zip",
        sha256 = "264fb02c1232f2387ef9e03a16aa832d60548ae6bcd02f6abfd99db9b0c2daef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1-beta-1/halsim_gui-2026.1.1-beta-1-linuxarm32static.zip",
        sha256 = "6effc39d838cdb91b1c9a209c555fb15520ac58931f4e5ae6e8172b2851af59e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1-beta-1/halsim_gui-2026.1.1-beta-1-linuxarm64static.zip",
        sha256 = "a65bf5ccbd90635ad0d8b4eede77bc43baa6735a826a8c75316fa3b098620add",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1-beta-1/halsim_gui-2026.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "58515a635fdca55f7520e407c996c1fd44f523a9afe91619fa083f86ea27b2f4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1-beta-1/halsim_gui-2026.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "b0e50d1e2d53e730e2e4cfb3bc6dc931e700e75404002a9986e8c85ba76a3352",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1-beta-1/halsim_gui-2026.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "bef0d5cecca84ef0ebd6d6f7163bf4ff856eb428efbd385fe0530af27d0c6a11",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1-beta-1/halsim_gui-2026.1.1-beta-1-windowsarm64static.zip",
        sha256 = "10e383760e69852b3bf593d538d69afaee85a7bf5a9e6d170a2f59cec23a22ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1-beta-1/halsim_gui-2026.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "5165826781c36cfe53caf580494cae4936e9448a13cb92bf9e200219c7f5157b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1-beta-1/halsim_gui-2026.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "67677a25cd4eedcf50ae68fe22de2065ffd6ad7d207377737574c91205018889",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1-beta-1/halsim_gui-2026.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "ad3c0c728c60b6eca84f12d9bb7ce02f2711b36d97e38d827cde6a4324c5d868",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1-beta-1/halsim_gui-2026.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "49b2bd9d9d2a8105585eec5d0686a7fd49d40d86fb19a4fe43dd9b615a1ddd19",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1-beta-1/halsim_gui-2026.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "a01b0796948bf3ecb6ba44c171f295ab30d6c143c0285a13c2ffbedaf42e3ba3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1-beta-1/halsim_gui-2026.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "05656cc0a9c727c1245f6d7acd2246e6190fb7be8820c83356ee8f15e2d5a3e0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1-beta-1/halsim_gui-2026.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "b1affc46b79df4e6bf6bcbab5a235ff2e2c9f60aea00ba3c1e0ee868e9b511b7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1-beta-1/halsim_gui-2026.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "1316f6904a78a467dc631dd52f8a7fccb6f83da4506786b9f8f213917ab92a8f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1-beta-1/halsim_gui-2026.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "e2af4c87ce30d8852ee4c332d9a743c9f03a638e2f4794900ca0d8b6414cf694",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1-beta-1/halsim_gui-2026.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "0288abd3d28b89dfb933d6f63e2ac436f8f06c0d721489a8db87b2bcece5c32d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1-beta-1/halsim_gui-2026.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "d7904bd9820823d444e69ce4329179a3687cf24ea8e694b8231a783af0a169dd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2026.1.1-beta-1/halsim_gui-2026.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "e04e85b6c5c6ffcb81b3b315aeca9b44099a1c1c7e210a9776393aac2af9cb2c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1-beta-1/halsim_ws_client-2026.1.1-beta-1-headers.zip",
        sha256 = "b276252a338b6246944162de4d3412b1b39581e29ae32a062971fdf60f018793",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1-beta-1/halsim_ws_client-2026.1.1-beta-1-sources.zip",
        sha256 = "f2b047383d9555de4d1c366167c6a2c21ab115816ea9d736e37f7511abe34632",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1-beta-1/halsim_ws_client-2026.1.1-beta-1-linuxarm32.zip",
        sha256 = "61292ca83112a52b5442eb14ecd3c921b54b2b79cec10450a2b67ae4e9a2f8ab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1-beta-1/halsim_ws_client-2026.1.1-beta-1-linuxarm64.zip",
        sha256 = "bd3c9c6f8010ecbc481997102e90d9f72ef32a7875ee081e039bd1b7810e025b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1-beta-1/halsim_ws_client-2026.1.1-beta-1-linuxx86-64.zip",
        sha256 = "efd7733a5205fc5030fd0585a573192d4abd3c89cd97c297b7fa428ff974bd89",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1-beta-1/halsim_ws_client-2026.1.1-beta-1-osxuniversal.zip",
        sha256 = "61dfd8ef4ceeb86d6a727ebad1d2ca50e9a5cef09932eb6ea5b53c6334f4b583",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1-beta-1/halsim_ws_client-2026.1.1-beta-1-windowsx86-64.zip",
        sha256 = "2212b4048a858e1b359cf8437a97632617fbffd38510c074d4c67494849b5745",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1-beta-1/halsim_ws_client-2026.1.1-beta-1-windowsarm64.zip",
        sha256 = "88b875ac6e14235288907763fb9ed744341ad25244a1107ccd3053212e704618",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1-beta-1/halsim_ws_client-2026.1.1-beta-1-linuxarm32static.zip",
        sha256 = "57a21ef9b3e2441c4a55d77f86197953163a1526b5e19de5760bf1b50ed06996",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1-beta-1/halsim_ws_client-2026.1.1-beta-1-linuxarm64static.zip",
        sha256 = "885230ae9d81d489b4c6c7e53192a51ce009c18b4f6114faff74837ffa380832",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1-beta-1/halsim_ws_client-2026.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "461b2a486549767b2a77281690dfe8ef653a2e76cf4f7d7bb610766659d2c92d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1-beta-1/halsim_ws_client-2026.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "69d292c400f8c1fa9fa8f530fcbaa56b1a76f54a4e80f4c89ab1f26a4d17e1f9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1-beta-1/halsim_ws_client-2026.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "5a6d9d23b5908d0384140eed48bf468e71f4c8cb302be7f44c2d3086c8e119a9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1-beta-1/halsim_ws_client-2026.1.1-beta-1-windowsarm64static.zip",
        sha256 = "54bb2870b93a4b86727ed2c2721eb858b8b5963f34edf1ff082c4456de269af3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1-beta-1/halsim_ws_client-2026.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "330ff9615fce5e4d2ab2a045060200934231208c232c1b29038d0dfc3199c2a0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1-beta-1/halsim_ws_client-2026.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "8c4aae7d661abb80965176a741ecfe43da5d463c130591e99c03f7fb721dadf7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1-beta-1/halsim_ws_client-2026.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "03752c904b7f1798b4d05be9622b561642a567fc2a915aa57d7f40801240c41a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1-beta-1/halsim_ws_client-2026.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "09d77fa8251dc794ded55ff29809895ae22b5e1783008631706ecceb85976b12",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1-beta-1/halsim_ws_client-2026.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "b22e2fa0eea2cc74b8ddea0c5ea3e8b2a6b875d303f0a7c05fbf89d428054bb3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1-beta-1/halsim_ws_client-2026.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "85bd3aff4108beaf3ca3109e104b00fb8ac2bf5bb0f271efca07a1184f91568b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1-beta-1/halsim_ws_client-2026.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "a67250a6db344e016c0ca1b2e1cb9f0ba8e701647173f24c52d8ba934f477740",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1-beta-1/halsim_ws_client-2026.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "6af4bd516fe6513fcf80c3c25c67d6d7d5316a46f9f2ab5fd0f484b9766305cf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1-beta-1/halsim_ws_client-2026.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "a79846222305e2458158bedccd153faa8134f99c0d6f7a8d76e945cda0ae15ec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1-beta-1/halsim_ws_client-2026.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "f9a842bdb8046dd6c19dc1039bf8349f11bc5d507070ff6391d0c610b476fdac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1-beta-1/halsim_ws_client-2026.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "4f97220b03a3a2d7c700bcd57201ba091d7ad52decf269842e40677fc1b6ad88",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2026.1.1-beta-1/halsim_ws_client-2026.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "163edf826d2855e6eb00e02f2725db4c81ed404404b878e7096a9be43fd38bb4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1-beta-1/halsim_ws_server-2026.1.1-beta-1-headers.zip",
        sha256 = "849459a2253713ba5a069701d1496ae28c12ddb2082b069b17028c4e2915e9b1",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1-beta-1/halsim_ws_server-2026.1.1-beta-1-sources.zip",
        sha256 = "b7b2b9fabdb3005533f9229c8d18e0526dfcf1396f1d113e76c9d7ba08c2c17c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1-beta-1/halsim_ws_server-2026.1.1-beta-1-linuxarm32.zip",
        sha256 = "d4ea7842e0b4fe01b36d9358ee14308f420434a33b40bde66281735fe62eb221",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1-beta-1/halsim_ws_server-2026.1.1-beta-1-linuxarm64.zip",
        sha256 = "05f379ab2a5e799185a8cebd8defec1288033f5073d6579eb0f0d4ffbe4a79ef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1-beta-1/halsim_ws_server-2026.1.1-beta-1-linuxx86-64.zip",
        sha256 = "249631ec00fa85b5c2478979850266bdfdfc4b86877ca67f8dd7baaa4378a95e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1-beta-1/halsim_ws_server-2026.1.1-beta-1-osxuniversal.zip",
        sha256 = "5e60d546caf97eb8db2741746d43557b462ec9c02fbbd05d89d57e6ee1f57954",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1-beta-1/halsim_ws_server-2026.1.1-beta-1-windowsx86-64.zip",
        sha256 = "0f176c9f918a23bd06372bd90b744272f38153d159077f806924263872700ebd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1-beta-1/halsim_ws_server-2026.1.1-beta-1-windowsarm64.zip",
        sha256 = "6a794c02ee5cb445868212c2243d09162a0c44bc152d62feea6b7fdb92a16df0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1-beta-1/halsim_ws_server-2026.1.1-beta-1-linuxarm32static.zip",
        sha256 = "8861cac2a554e2d7b4e50a04c27402d75c97fd63de9fb25c6e1a990ddb2d7d5f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1-beta-1/halsim_ws_server-2026.1.1-beta-1-linuxarm64static.zip",
        sha256 = "e5572c6e369f7625c1e7f469f5d4616514f40c9a6aeb916c6e1255e9b3b48f5e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1-beta-1/halsim_ws_server-2026.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "e56e17ccf8474d531b0a84bdd1235257cd54d3fbb84166fa608886fca818164d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1-beta-1/halsim_ws_server-2026.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "2c8f8fe594acc4c533463167f283d8dc7bd144bd5987a46683235f17b056c7fb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1-beta-1/halsim_ws_server-2026.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "9d112c279cfc588f305d79a9517adbbdcc2275063589020bd41edcd04bc3c5a9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1-beta-1/halsim_ws_server-2026.1.1-beta-1-windowsarm64static.zip",
        sha256 = "56212dc350de3a8b740c4759023459ef1f4718a47a84ebb5381b7f217ba36b30",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1-beta-1/halsim_ws_server-2026.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "e6ec99e160da1a9f653d04c5b9618e1d8c36afe627b78f19872622cb9b0a3e9a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1-beta-1/halsim_ws_server-2026.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "31dacb97572dc6dab99a650a99b530ea3dee3ec1afc0b94e80a9d63139876bb8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1-beta-1/halsim_ws_server-2026.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "40f215fbb9ef03502d3e4f2aefccc62f6fb8a248d480f1af9ae596d2c68b8d74",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1-beta-1/halsim_ws_server-2026.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "e269f18b58152e2021b7966529909cc90a4e4b8dc9917d19fc9da62ff3842e56",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1-beta-1/halsim_ws_server-2026.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "ff977fafbaae96b6a37e90bcac0bf1fbbe4da14cd72419f76816a17eb2a78778",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1-beta-1/halsim_ws_server-2026.1.1-beta-1-windowsarm64debug.zip",
        sha256 = "11be24bcb789a670e14acc1485c577c950c9f2b27d04d0d2c9dd0e0d4e32c763",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1-beta-1/halsim_ws_server-2026.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "934daa81bedef21d2363be58abcb064791184a37aaaf5825c79894f567c9219f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1-beta-1/halsim_ws_server-2026.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "f26bf5d7e435b179e32a7b54060bdad705f1186f6fe2a078fe22bd5a365293b1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1-beta-1/halsim_ws_server-2026.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "53990ccbc556c7dd503ad12315ac1af55c1984509d7e50382007e31a46308654",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1-beta-1/halsim_ws_server-2026.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "7c3a9d5dad95916016d29e21eb57094d3e2de88bebc9499a9d18e7bc80e4659c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1-beta-1/halsim_ws_server-2026.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "4f70265912d832342d7f289af6324b6e5468aec9a1fd1a9667827c62e6811e6e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2026.1.1-beta-1/halsim_ws_server-2026.1.1-beta-1-windowsarm64staticdebug.zip",
        sha256 = "96b8e344417a24c55a6769f1d98b8f18c5da95f7ec7936de8f5c53309e6e5395",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2026.1.1-beta-1/SmartDashboard-2026.1.1-beta-1-linuxx64.jar",
        sha256 = "ce5940e0f95017912ec2bc9cea8d1e9e159794cff853d1f9422f1fb2fec458a8",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2026.1.1-beta-1/SmartDashboard-2026.1.1-beta-1-macx64.jar",
        sha256 = "38680279f5eb6df21e13217d1b6ce7f0ae60f5837f350e1754190f527055dd55",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2026.1.1-beta-1/SmartDashboard-2026.1.1-beta-1-winx64.jar",
        sha256 = "43d33e273c4cc563f792ac28041b9f0cdd8324e12e9983c6f1cecc1b4f310e40",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2026.1.1-beta-1/PathWeaver-2026.1.1-beta-1-linuxarm32.jar",
        sha256 = "e5a3088cce71045cc90b390f9b4f599f6fd03bdacab645f2ec322e6834892b42",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2026.1.1-beta-1/PathWeaver-2026.1.1-beta-1-linuxarm64.jar",
        sha256 = "3cfec3d2bb70db095fce194fe46dfd13ad1bc153faebb27563f592b4728c7b92",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2026.1.1-beta-1/PathWeaver-2026.1.1-beta-1-linuxx64.jar",
        sha256 = "483a25b60a465a42a2d820e8cd42bb915697e5a29d174d10dd78cbfc1a92ad42",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2026.1.1-beta-1/PathWeaver-2026.1.1-beta-1-macx64.jar",
        sha256 = "c9ec6ff6ef05d29719f920b8ea427e9ca23409b9ee59d655946d2944f1f8a605",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2026.1.1-beta-1/PathWeaver-2026.1.1-beta-1-winx64.jar",
        sha256 = "b5a520c21316413d40d9fc1196354a79bdec623a8da6b9f5108b04636ed1fcf5",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2026.1.1-beta-1/RobotBuilder-2026.1.1-beta-1.jar",
        sha256 = "a8cfb4ab4d9114aab1d429c83fb4060f61128006124bd58bd6d9337afd3edda6",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.1.1-beta-1/Shuffleboard-2026.1.1-beta-1-linuxarm32.jar",
        sha256 = "939b9a3984d34040115944b867c7cee728f8a3fd5d878148467f3a7fc201d888",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.1.1-beta-1/Shuffleboard-2026.1.1-beta-1-linuxarm64.jar",
        sha256 = "e301953d243c00e994423c62fead1f452750dadf4f8fb7237383f82ab304a063",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.1.1-beta-1/Shuffleboard-2026.1.1-beta-1-linuxx64.jar",
        sha256 = "1792285b573fa59a4e2a9d85d8b5b8790d64d3034b6852535271f0e19e38a0c6",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.1.1-beta-1/Shuffleboard-2026.1.1-beta-1-macarm64.jar",
        sha256 = "7ae2ee6382aab8fc0c8bcbba2c9d48fe63d344bc58e69b5d9f73fcaebf8467f2",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.1.1-beta-1/Shuffleboard-2026.1.1-beta-1-macx64.jar",
        sha256 = "42e9f9f1e820fa15703ad15fe9016d98a8d1340ba9dcf9bee4d5d3d3be072340",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2026.1.1-beta-1/Shuffleboard-2026.1.1-beta-1-winx64.jar",
        sha256 = "4d0e2af9d245d80277569df9bef9e0bbf6cfc29835fe3b7a92d1299684906c34",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.1.1-beta-1/Glass-2026.1.1-beta-1-linuxarm32.zip",
        sha256 = "d7b3732a736b66287f215417194f429d3eb6911254fe46e6f79d4c7023142e77",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.1.1-beta-1/Glass-2026.1.1-beta-1-linuxarm64.zip",
        sha256 = "79878485e7eb02d804047f338508fa3298a6b416bf3796fb717b4247fed4a135",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.1.1-beta-1/Glass-2026.1.1-beta-1-linuxx86-64.zip",
        sha256 = "4b29f8f9cbd69cfc1c753500e10dff7667cb04f75fe4faab6840007842a5f570",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.1.1-beta-1/Glass-2026.1.1-beta-1-osxuniversal.zip",
        sha256 = "ad8c035d217e41ca748fa35e83469aca3918eef97b41fc9bdb86157aec7d5fac",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.1.1-beta-1/Glass-2026.1.1-beta-1-windowsx86-64.zip",
        sha256 = "a536794cd03858183e11ba8196e42f49bd31e0444dfd374e7644d8f88ce3bdb5",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2026.1.1-beta-1/Glass-2026.1.1-beta-1-windowsarm64.zip",
        sha256 = "6c3a2807227ca149298112cfffed2a284d041a2ffce70045965064648b27f31f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.1.1-beta-1/OutlineViewer-2026.1.1-beta-1-linuxarm32.zip",
        sha256 = "ce5371803c63cd551928ce3631fc6fc51b95f79d0caed5cb234f04692c83f4ef",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.1.1-beta-1/OutlineViewer-2026.1.1-beta-1-linuxarm64.zip",
        sha256 = "9129784c19b94ed8b0c38ddb85a6f369b5f980e35df8af6c8e5fba759c20f01d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.1.1-beta-1/OutlineViewer-2026.1.1-beta-1-linuxx86-64.zip",
        sha256 = "20a8fb0aca02eb97ff1d8af3b7d218dcf417cd2e4c838c969626998a81e7eb65",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.1.1-beta-1/OutlineViewer-2026.1.1-beta-1-osxuniversal.zip",
        sha256 = "a51df9a901284d4d204c4f6c4461c284012fab75ee02226218a10be3648eb9a0",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.1.1-beta-1/OutlineViewer-2026.1.1-beta-1-windowsx86-64.zip",
        sha256 = "dae7c63c1e5a029f2290578c77fa7d14def8eed043525368afe9cf255781c5e0",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2026.1.1-beta-1/OutlineViewer-2026.1.1-beta-1-windowsarm64.zip",
        sha256 = "71a0b5115edef9496a88e3554841e0d07433b90ced9b1e9111ee49bda9897ba7",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.1.1-beta-1/roboRIOTeamNumberSetter-2026.1.1-beta-1-linuxarm32.zip",
        sha256 = "b9a2890c79b3656ffa0c1bb3a3c258c4b34d5562dd4ee7ffdb597b746b477353",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.1.1-beta-1/roboRIOTeamNumberSetter-2026.1.1-beta-1-linuxarm64.zip",
        sha256 = "28f35351a7b1affed24599c438a0223731cfc677b3f70677f38e7aa1ca9450ff",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.1.1-beta-1/roboRIOTeamNumberSetter-2026.1.1-beta-1-linuxx86-64.zip",
        sha256 = "ef3bd7fa0cda3fd638e2279ac7b5490e47143479880ed51043d04cf1cf179785",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.1.1-beta-1/roboRIOTeamNumberSetter-2026.1.1-beta-1-osxuniversal.zip",
        sha256 = "e9d41e496c8aaa6b2ab8d7371bc6bd5fb94c5f24046f5eec85eb3e32149a491e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.1.1-beta-1/roboRIOTeamNumberSetter-2026.1.1-beta-1-windowsx86-64.zip",
        sha256 = "e309cc16197fd484060883355ceb4a9bbd19f5c0ee245f52dec726b837d6bd0b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2026.1.1-beta-1/roboRIOTeamNumberSetter-2026.1.1-beta-1-windowsarm64.zip",
        sha256 = "b379bf2b13a97057a660862a52cd4452e3b6d021339a681907d87828ef9744cd",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.1.1-beta-1/DataLogTool-2026.1.1-beta-1-linuxarm32.zip",
        sha256 = "1db58e65e059f23e19bc50efd160b9c8c97f11f5ff2c1f2a2b5a1d91f1c501ec",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.1.1-beta-1/DataLogTool-2026.1.1-beta-1-linuxarm64.zip",
        sha256 = "fceb350c435e22cef59ce1f0d495d741351c05d8ce86c5bd9de9b866d34e346c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.1.1-beta-1/DataLogTool-2026.1.1-beta-1-linuxx86-64.zip",
        sha256 = "23c3d65f31b4c479d07c0d52df399a49aa1b51daf177c71d4fc7d1ffd86723b4",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.1.1-beta-1/DataLogTool-2026.1.1-beta-1-osxuniversal.zip",
        sha256 = "de2990a5ea843c954ebf5a69e922c9b0956062c0e2dc2ee12d2dfbd1ed44b1f9",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.1.1-beta-1/DataLogTool-2026.1.1-beta-1-windowsx86-64.zip",
        sha256 = "75e542fcda17af1f7362262745fc02f6e3ade6402ef83764dc70c5d8f38533a6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2026.1.1-beta-1/DataLogTool-2026.1.1-beta-1-windowsarm64.zip",
        sha256 = "026f01c535c5ddf25ccf65bbfd573a014c774386fe9f819b464c0116345592f4",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2026.1.1-beta-1/SysId-2026.1.1-beta-1-linuxx86-64.zip",
        sha256 = "480e38bc3b8ea833ab595ebc25a5153893b9af0a0b3db9cd474aa43a8f6b2a81",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2026.1.1-beta-1/SysId-2026.1.1-beta-1-osxuniversal.zip",
        sha256 = "251d18c8d3fed3834dae850bb63d48451764e5ac65ab40842b427741306aec84",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2026.1.1-beta-1/SysId-2026.1.1-beta-1-windowsx86-64.zip",
        sha256 = "8a88ecd1b55ae78e514a010c14d003a019dbff2a03583c6a78557a28c99b3437",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2026.1.1-beta-1/SysId-2026.1.1-beta-1-windowsarm64.zip",
        sha256 = "51b0fb405c0bd151a6f117af100f528c13e250f6ac1e4ee1d1b02f23fa78a4c9",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
