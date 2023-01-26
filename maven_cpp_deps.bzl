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
static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

cc_library(
    name = "static_libs",
    srcs = static_srcs,
    visibility = ["//visibility:public"],
)

cc_library(
    name = "shared_libs",
    srcs = shared_srcs,
    visibility = ["//visibility:public"],
    deps = [
        ":static_libs",
    ]
)

cc_library(
    name = "shared_jni_libs",
    srcs = shared_jni_srcs,
    visibility = ["//visibility:public"],
)
"""

def __setup_bzlmodrio_allwpilib_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-headers.zip",
        sha256 = "49f6565ace351fe7cb3e591e8a391d8c515214135ab84f516e17293e0cb28764",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-sources.zip",
        sha256 = "9d4c76af759e70cf2063958c4d856e7e1b0ea60551bbc245fe0edb041bc0a37d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-linuxx86-64.zip",
        sha256 = "c50f2b002ce2a19bde9a394683d08daba441cd8bc4ae469186df4cd814de42a6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-osxx86-64.zip",
        sha256 = "4d0e5d86b6d285682971ad1dc0c350350862fd9adb10db26ae910c38e523a18d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-windowsx86-64.zip",
        sha256 = "8ebadc5f2b7c6962ed1d3df945806087404212899bcf81ecfbd8dd4f7d5d1302",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-windowsx86.zip",
        sha256 = "f8dae7885b1c8844e997f075bed6b20abf7ed023049254f0cacd43de377a0964",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-linuxx86-64static.zip",
        sha256 = "bf2bc6a7df448c405786ef877e3b8095ebe0677944c4cf2a927fbbbed0c5c3b8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-osxx86-64static.zip",
        sha256 = "8431c1981baf3d20d072ed03624f999f3dc02a0f619dd61dae8c4d05d546207a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-windowsx86-64static.zip",
        sha256 = "3331a4fd37e7c05fc409c17992293957de6119fac14a7fae3cf1e0abee3b85cf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-windowsx86static.zip",
        sha256 = "292fd80d3c8441da31aa66b8aebc3b0b430535705ccbad9c12195adad13a6318",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-linuxx86-64debug.zip",
        sha256 = "f87250691db545c0246716c14fb504e4a934a3d1e54fdef8ce842d22b2ef5667",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-osxx86-64debug.zip",
        sha256 = "604e96860a2f7042f435d2d02005bebc04feacbe783fdaf307861ca6a804f8dd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-windowsx86-64debug.zip",
        sha256 = "00c98d737cad860ca0f3b0dfa0b5709bae79f9c697cf3d422c41524aff3d10b1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-windowsx86debug.zip",
        sha256 = "bc0c2ae8ca472a08ccd2e461583b62de35e06b3f539de2245ff9c175f89d6a2b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-linuxx86-64staticdebug.zip",
        sha256 = "77b7dae2f3aa99930dc6f178e1358751de362032e41fad4853adf255d45a2489",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-osxx86-64staticdebug.zip",
        sha256 = "033e09caa4dac98c0c6fefdc080db283d8f6c05c1172785f164be41570194f6f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-windowsx86-64staticdebug.zip",
        sha256 = "38f30d44a4e112fa0619593c85ab2d2c17c3b8fc93ecdc285207665a75846ccd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-windowsx86staticdebug.zip",
        sha256 = "bbe910179cb45b4187df1f5057291d0a86d44e8708602e1d5d40ed81471a5804",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-linuxathena.zip",
        sha256 = "5d12b4de347ebffe1c7783b01389c11906f17917bd32539c216c5fa6d1ad63e7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxaarch64bionic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-linuxaarch64bionic.zip",
        sha256 = "5ced02b3a40aed684a1c84b4a588649b086e8c59bc1e3ecd5eb4285a10101c85",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxraspbian",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-linuxraspbian.zip",
        sha256 = "7cfb3c1aa29cfed8e6c68a216a21a0152eb3d0e13617ee050132905cc02d1736",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-linuxathenastatic.zip",
        sha256 = "501ea6a79d24837292b063293dc2230522484b5eb424406f6efd7443484e2058",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxaarch64bionicstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-linuxaarch64bionicstatic.zip",
        sha256 = "e6c258914fe157cee864de64be61309ac228666555c6f074e9afa6e12bcb892d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxraspbianstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-linuxraspbianstatic.zip",
        sha256 = "30ca6919aadcda49003c16bdec99e66885338a75d23400b59081334c99dd1396",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-linuxathenadebug.zip",
        sha256 = "96aabc84ae7e331437ecc3485f0c99c7434491cb02cdec3a21d92a98c99fd67e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxaarch64bionicdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-linuxaarch64bionicdebug.zip",
        sha256 = "83fcd003d97b3a46fc0b9107a6b6e0de0ebfc811b2e40e01581ee3743a010abc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxraspbiandebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-linuxraspbiandebug.zip",
        sha256 = "66aa0abb06ec5ba2e08eebdda23a5649ce151842a31ecd20ba44759f6ecf19e6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-linuxathenastaticdebug.zip",
        sha256 = "6766380ac92f1450e52a30e4911ca0ae7e059016d19a7f1432433065e0688665",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxaarch64bionicstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-linuxaarch64bionicstaticdebug.zip",
        sha256 = "c3abc401bb3c9b7c53988cde00044059a9923a64a1a8d88d935b2032f72460d4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxraspbianstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.1.1/wpiutil-cpp-2022.1.1-linuxraspbianstaticdebug.zip",
        sha256 = "3f8beea8dcb8c60c136a8804053cec84809c579333889a752135b7f2f30d4e99",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-headers.zip",
        sha256 = "db0cd454cdcfa592248cdfa6703ff5361a84a754e3530e91652aa41078ea0dd0",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-sources.zip",
        sha256 = "f120bd9f2e60d1da313017ec72630844fe3cd2232d927caa843053f232b6bd67",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-linuxx86-64.zip",
        sha256 = "63378c9ca80ced1c5f69619c75ac6f230d0962a510131cfb0a898dc3ca0cda78",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-osxx86-64.zip",
        sha256 = "c9750d902aec05b007e030c50553bec33c5ed70874671f9d7cdb9180890704c5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-windowsx86-64.zip",
        sha256 = "511945f5988e9c3196f706243e5542f8ef0223878a74878104c44ff73ad5fc9b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-windowsx86.zip",
        sha256 = "e179467db7588893220718b762ac854bc902fb1365a70ad366f6d4d6abd913e4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-linuxx86-64static.zip",
        sha256 = "984e6e32fdb80ffbe0b88faa9e88246690309aebf92e27de1d6d4ba7024206f7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-osxx86-64static.zip",
        sha256 = "e96b718fb95b4e14b0b0db4d0ba9de996b95d4c111317237ba4696d8b698e36b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-windowsx86-64static.zip",
        sha256 = "e3276046c92fe815364bab523c4719053bedf1df8eb79f62b89875a4f133490a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-windowsx86static.zip",
        sha256 = "d02417c084003cfa459385beb454678cef624f7762176c20b2d11951176cd775",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-linuxx86-64debug.zip",
        sha256 = "c70c88f1d4a492f3167da9d193a831c815e7975e8ba3d5ab52fdd3be9ab8b6c6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-osxx86-64debug.zip",
        sha256 = "e38b5f1669f54f0d3d374a07e2b95365f699d1d28ec44f5d41a160a6140dbe0a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-windowsx86-64debug.zip",
        sha256 = "93db323e2cfa6e5a6e437ab8d22fc0c2023ec9b4e723b362c5add0419dcccad3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-windowsx86debug.zip",
        sha256 = "d8c55fff1d672610252aa585b79ea02316ad0df0f4a6b196b2ba23465c52e816",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-linuxx86-64staticdebug.zip",
        sha256 = "7971be2826af4526fb2c5e8abeb7ec1cf95f782675ac82b0fe0c678c61e74c25",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-osxx86-64staticdebug.zip",
        sha256 = "53448c64ffc9b42eb8292ef319662f0a3107108931fb2049aa26521c32f8e71b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-windowsx86-64staticdebug.zip",
        sha256 = "cc6e1f6a80f0fcad0c1f58900131739ffc98dab87f40fa4b52b5d82c308d5ebb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-windowsx86staticdebug.zip",
        sha256 = "cf472966026bd922444564aab563775633035e4b3ea64e9f1d681a762b071959",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-linuxathena.zip",
        sha256 = "895bbf531fe2bcec0b9ad87311779abbb862c73b74016763990eaea46e207246",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxaarch64bionic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-linuxaarch64bionic.zip",
        sha256 = "17215fc06530f3aa9f6a68d2e81431e448e91df8210780a587af10d74565188c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxraspbian",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-linuxraspbian.zip",
        sha256 = "17842793a5e3602be8461951e33f690b022eccad3e0c467c7a2532c00141c60f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-linuxathenastatic.zip",
        sha256 = "a39dc62b2f96c3c17c69c44356a4980b8789334640b2a43f0a43bfebd8554c2a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxaarch64bionicstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-linuxaarch64bionicstatic.zip",
        sha256 = "1c9cab10d01276010f4ab1b06005e286e3714b0d0eac5814586d780c45f5c39a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxraspbianstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-linuxraspbianstatic.zip",
        sha256 = "2b3e5f3c476a89ab8ae8e95fc81031de82d304504699e15a2ab726f8552da51d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-linuxathenadebug.zip",
        sha256 = "94f05d010824cf4279ba8ed98dce7333d9a04cf8d34ce07bef47bf550efaa69f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxaarch64bionicdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-linuxaarch64bionicdebug.zip",
        sha256 = "a20ee8bda153054d44f83bed7e3f7d14ee13794c0e5c287324e0d30f239f5371",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxraspbiandebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-linuxraspbiandebug.zip",
        sha256 = "47fbedb9aeb8510acc9a60e3b3ceab2359417ad4fb514972b2205fa1944b30ec",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-linuxathenastaticdebug.zip",
        sha256 = "3d6a3f72283c88ff47189eefc1ab382c390f85a60e53e107529fd5b9c45ee1f5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxaarch64bionicstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-linuxaarch64bionicstaticdebug.zip",
        sha256 = "90b874eb3803cbf5bca80dbab524bb2f51d340b41a6f853fe719c8cd295e0102",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxraspbianstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.1.1/wpimath-cpp-2022.1.1-linuxraspbianstaticdebug.zip",
        sha256 = "2ccc8979f29e57709ed3737ac99eab5d91862eece2469fa27b80fd904bba20d7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-headers.zip",
        sha256 = "893734817fcbb8b9758d94a972bb5f22da3da628c5ed5da86490ac2d31756051",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-sources.zip",
        sha256 = "273cfdeb7750ec220c5b09d7da46e5b402a1a56edc01af3f5b614f5e20795bf2",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-linuxx86-64.zip",
        sha256 = "7d18a354244ed9b31952389c53e9f3f566e97566f8957d3433b16066018cee06",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-osxx86-64.zip",
        sha256 = "741b792ad34367ce3315aec8e1ae8f7a7618a3fa33779fbd2f0e5507b56b7d8b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-windowsx86-64.zip",
        sha256 = "01d7a62ccb613e27a84766116c4821409306821d2e49f26d5a86977b57bb6566",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-windowsx86.zip",
        sha256 = "f0d278ecabd4d1441c1fd30e02d3e1a07c793a42a90ee836e1e5ab2c8419ce98",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-linuxx86-64static.zip",
        sha256 = "ef02ccabb119bcfcdaabd3d443933b5749767e8810b774948387a798d99fa9b1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-osxx86-64static.zip",
        sha256 = "81dc7f890417b43f636df556d86087e8c08a983cf50f8d280ec3b4e0000a2ee8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-windowsx86-64static.zip",
        sha256 = "40a76101beadb6d6163f86f1c5ea0f1fd4a2c5de32813a67908f17dc6963fa64",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-windowsx86static.zip",
        sha256 = "0c8ecb2e1f74d3c459ee4398ba5ae050fb62288b916a39bf8cfb7c04c76ae6d6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-linuxx86-64debug.zip",
        sha256 = "5f63998f48e03c3b712504e014a7c2108bfebe1e73720ee30c2e63472bcb0c79",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-osxx86-64debug.zip",
        sha256 = "8b872f37d00c892eda98e52f97e87d63762966fba9e12870d2d60218292a304d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-windowsx86-64debug.zip",
        sha256 = "b775415964997a86138cce3d64be4ee5e97062ffda90e45552a915d15e8bbd7b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-windowsx86debug.zip",
        sha256 = "9c02601adde7b20ff5ebf07dbee86c01d25caaf2d975ef07f225b40409e7fefc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-linuxx86-64staticdebug.zip",
        sha256 = "ed77aa03142f0c90d6d4826fba70e9cd68306b05e133b96d162ba2d0d9380175",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-osxx86-64staticdebug.zip",
        sha256 = "f5d125ea1d9a99d4eb956bfcb3078baad213bbc89c2d82d4dd96d1cf1b3ea80c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-windowsx86-64staticdebug.zip",
        sha256 = "79053e27e2389573aff141e95b2d2be9bb794d34a6ba5373946f680f1b428591",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-windowsx86staticdebug.zip",
        sha256 = "23cc2db0a6913138c44f7f85555ff0b700cf5c7d013837c094aaaa94dee0bbdc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-linuxathena.zip",
        sha256 = "f84fe5162cedce9a938d0bf2a0074aa76887e164be681f0d8ca29ddee1df346f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxaarch64bionic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-linuxaarch64bionic.zip",
        sha256 = "4bd9f5432f61cb7ffb4283d9f9a1bbea2e631a3811516ce6db4aee2882d2b16c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxraspbian",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-linuxraspbian.zip",
        sha256 = "bd6c08d6fdccf705c7b265753537bdb8bb1c10466e0ae3d7cc146b1551e69d25",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-linuxathenastatic.zip",
        sha256 = "c70b6a599f0f4676c39e14784619f1138b9a4ecdf8a4514ebbb8e56de0d34f47",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxaarch64bionicstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-linuxaarch64bionicstatic.zip",
        sha256 = "68f2e177ccbcf62919ec87608cfee88a43e42971e05efd2a9f745e5ad0bee11a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxraspbianstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-linuxraspbianstatic.zip",
        sha256 = "b921ed3e34ed67fb62bf90153fd28beec12a3d69b8e341979d0b404bbde51b2e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-linuxathenadebug.zip",
        sha256 = "2021212e1514cee671993b10c444a6e2f35865dbfcc7d55a9f0458eb0f9cf2f9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxaarch64bionicdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-linuxaarch64bionicdebug.zip",
        sha256 = "d56b0410c6d2a43c443e90b1be80ce883cfa8805f67e83ab5de4423c9ad453bb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxraspbiandebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-linuxraspbiandebug.zip",
        sha256 = "e2cf71f59d6b35f000704c3b7493a67d07a5819d6229eb0196bb7644e39c2239",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-linuxathenastaticdebug.zip",
        sha256 = "dcc89c5e0d6aa1089dce0b75783a64f7aff4ca49172d3c7a2a489b4c82486b16",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxaarch64bionicstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-linuxaarch64bionicstaticdebug.zip",
        sha256 = "12356392f85bcd765af5b207fb5932e9edc89dcd90ba6fd6112e2de7d617c90b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxraspbianstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.1.1/hal-cpp-2022.1.1-linuxraspbianstaticdebug.zip",
        sha256 = "a296b9352d100434a40cf406fd7754d57db98f96eea74b330fce50ae9321bd97",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-headers.zip",
        sha256 = "2df197a2301478c32a37634c61b7dd93676e668939eeeab4820a780b29b559c4",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-sources.zip",
        sha256 = "f546244b35875f64c9d37e570f098f9977c5cca6d3d7ccc91615b88c8713fe69",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-linuxx86-64.zip",
        sha256 = "216bcc5c4e00dae92a6a470ba8920a7b0429a63472277565de7f2b03956f3edd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-osxx86-64.zip",
        sha256 = "aba23c0225830808c359497afd61b650fe2a469420862f7ed275478932374dbb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-windowsx86-64.zip",
        sha256 = "d71ef6b5ce0817474e4d0c4ab92f1c44800516d3a6978c5f33b47eaa7e081a5b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-windowsx86.zip",
        sha256 = "544e2d1e57824d84781c873be90c8db74cb898d48d7997317b79d17590ff1859",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-linuxx86-64static.zip",
        sha256 = "9494d27ca80a6a9bbc892e929da97e5c7d37f3788417ec03907169af28b5e815",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-osxx86-64static.zip",
        sha256 = "ce070898bd5bad7f48974bbb9bfc5eccbd4b450d0f6dffb8d42d93e13dbd850d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-windowsx86-64static.zip",
        sha256 = "39e62c37d97bf90077eedaf78ca5e18cc62db322695fbf5de9bed0b27c2f370a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-windowsx86static.zip",
        sha256 = "c76ca3d446c510c86bf7130168131654becb6e9b3459c98e43a72280d635ac0d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-linuxx86-64debug.zip",
        sha256 = "5585745aa36b6f78e1f493a364ba992ebcfef0be3c78c47dc19abd6daf8c8a59",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-osxx86-64debug.zip",
        sha256 = "b3bbdaec4054a7981662dae67b290489426ce1decfb79ec9813ea9ebfd692987",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-windowsx86-64debug.zip",
        sha256 = "5bbbb4592b05ede359737345ea0181c44a426f9cc27b8de6f354c8ce79604453",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-windowsx86debug.zip",
        sha256 = "de2aeaba878e8e5236a1f76f0bf903fea7e74f511b948d123813bc5a19e68a8b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-linuxx86-64staticdebug.zip",
        sha256 = "733c3998aebb499acbf350c8265c6f230e8fc3051bad0c650c29a690778424d0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-osxx86-64staticdebug.zip",
        sha256 = "55ca955eca2a055cd9f8fe0893e1994da6dd9640d021e135e1b8e8d5956eb050",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-windowsx86-64staticdebug.zip",
        sha256 = "a03a4d344f9c457d15877682a23c9a12c7654818a77e716caa3f4d16f7e1ecdd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-windowsx86staticdebug.zip",
        sha256 = "c2263f4bb7f5aa03afcee2ecb73f47cd7267ee191f0448d15ed1e36709d489c6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-linuxathena.zip",
        sha256 = "7b8dc317151aa66c0f787f09e49acb9d7aa1dd9f66b2021e9aebb79f3b78b507",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxaarch64bionic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-linuxaarch64bionic.zip",
        sha256 = "c43653aba01a516805d3fd7fca7f731110867619eed0fae1a29f7061788b8079",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxraspbian",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-linuxraspbian.zip",
        sha256 = "509f4343d02f0aa37d6bf7cbd4eafa4665c3baeebcd60215de36dc7d0d32eacd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-linuxathenastatic.zip",
        sha256 = "45b64d7f8801dca368b89a025b94fd564bed7def1786ead44042b187060db054",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxaarch64bionicstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-linuxaarch64bionicstatic.zip",
        sha256 = "0536496454d283d4bcf4defda4fd4a129e6de5a27ca7481d14512b2f56ecdbe1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxraspbianstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-linuxraspbianstatic.zip",
        sha256 = "a22f7cf2ff7cfa9a449dedd2246c1b7ffe8b2be80a8b2ca8225f639b930d70b2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-linuxathenadebug.zip",
        sha256 = "699135f725a6e852e390dd348ec3beaf558a45c51188dccf9be34a958bcd313b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxaarch64bionicdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-linuxaarch64bionicdebug.zip",
        sha256 = "bbf712cca1c4178e4b483cc351f9b11fa42915ec9b49a3225aa36b30db0ab4c2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxraspbiandebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-linuxraspbiandebug.zip",
        sha256 = "dde7be5ab6c04bb38624551037af28177e90f4a9f6fff134d70f0bfc951eeca9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-linuxathenastaticdebug.zip",
        sha256 = "8e09e5613badab23706b31b5ad113b80e51b43e03be416d6640c9a36f7a772ff",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxaarch64bionicstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-linuxaarch64bionicstaticdebug.zip",
        sha256 = "c085b43710dce0bfa1e1ae32eee53b46c23204f0681c961a7973292ae66f7cbb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxraspbianstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.1.1/ntcore-cpp-2022.1.1-linuxraspbianstaticdebug.zip",
        sha256 = "9466e170d9f2fa381f0a7fdf86a8aa0b6cc66c432790a1041a25467ac779698b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-headers.zip",
        sha256 = "4e91cd9114e0498fcdda69e73aa323f2178fee4c17d78582c220f058f4999905",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-sources.zip",
        sha256 = "46740462856ba6e7804ff5dd5353e946910cfdf802ae80bc306c47aa26c6923e",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-linuxx86-64.zip",
        sha256 = "c2bb50b94194a910c4cadad287dad7656ac1c6a81b2f19c64f6ec0625747ee8d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-osxx86-64.zip",
        sha256 = "8b87c660408614111d6c83f38c8c13d05c362ae8549cd47bc5f562a0ce6c8401",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-windowsx86-64.zip",
        sha256 = "857c24ed73c6b11d062e0bd233e8834397ce8ed3986917bb39e90e009a18ff48",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-windowsx86.zip",
        sha256 = "4fa42291f9d26107463b250faa5669d5a78d9df0f34e711a399ce4abf97d65a0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-linuxx86-64static.zip",
        sha256 = "d425c9796b20da2f87ff1c2947a05667e1808c49263698f89c02f6f3b5fcbefe",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-osxx86-64static.zip",
        sha256 = "1b3ca858c86428c4c6258c4dcec5fb27c5ef9161fe7ab263224aea186205256d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-windowsx86-64static.zip",
        sha256 = "3518ef84638323b9c90445b1115eec0b2b856fae2ab029083d647f2dee2097e1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-windowsx86static.zip",
        sha256 = "31602d89e55c8c65164b3c1223d05bc35983152fa8469a34718e82690fe4e5a2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-linuxx86-64debug.zip",
        sha256 = "731f410e6cd00e1575e53ad24afbe41f76c2d55a5f42ad6a7d1896c1cb8711de",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-osxx86-64debug.zip",
        sha256 = "d08a9ad6980628b1967da52ea591ea88c0d3c3a01d4cfc696dd9ec06a7dad5f0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-windowsx86-64debug.zip",
        sha256 = "71f5b5e8372a9dfd3ab3a4bd4cce47d894704fb2eb84e8ad6187784b682acc7e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-windowsx86debug.zip",
        sha256 = "cc037b65f78071ba1f0bd2c5f93b677467cd7ef473146d336711e4b5c0d7f277",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-linuxx86-64staticdebug.zip",
        sha256 = "4402c9bf40f937c37b99d2f2f5b482ca5f06204066311ec64cb9329bf36c4f04",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-osxx86-64staticdebug.zip",
        sha256 = "9d6b7967624bb163a3f23527a6672e1f74d6c688c00e16290efda504e1886912",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-windowsx86-64staticdebug.zip",
        sha256 = "1421cf61f7749530090ac15b8e0cc9496ee965c53136ae5fa3b544d775439af2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-windowsx86staticdebug.zip",
        sha256 = "a2036f594be8969191e1067ac02b617a18c65c407acf595b7285aef4fa1f8dab",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-linuxathena.zip",
        sha256 = "b660c4dafbb5b30255fce165e857ecc84ebf1e8e588fba0135447232b9cbf2e9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxaarch64bionic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-linuxaarch64bionic.zip",
        sha256 = "2b64cb03b2d64e1274a6654baf56ae8a7acbfbec8d083066e7757df54065dbce",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxraspbian",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-linuxraspbian.zip",
        sha256 = "2ccae91892a8e0ab4ca8291ba715b40053f38b7f55991ac00481fd34cc311f67",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-linuxathenastatic.zip",
        sha256 = "fc21cd4f72b04f8e6ede40eea2a8bfc5bc0c5c540ffbce4a3370b993fce6fa39",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxaarch64bionicstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-linuxaarch64bionicstatic.zip",
        sha256 = "47f473ff046117e70446937c632aadc7294438a8cf72962c1b9e76a5dab7f9d6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxraspbianstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-linuxraspbianstatic.zip",
        sha256 = "c9daac1489225900137a170c965c7811f8456ec2f256d4b6a98f3b3a4b8d5caa",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-linuxathenadebug.zip",
        sha256 = "0b3b5d7684fc2095fccf6ff8546963d9bf3c8b8fbb342a076deb2bb990fa0929",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxaarch64bionicdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-linuxaarch64bionicdebug.zip",
        sha256 = "120a66159007d520b8483a7de62c65f3b27ac5718c835d3757001ad8fff45506",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxraspbiandebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-linuxraspbiandebug.zip",
        sha256 = "50fa60d07649e09f6935da29698f8c741747d70b20bbf82b40867c975a5ed77b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-linuxathenastaticdebug.zip",
        sha256 = "96dbebd1ff948ea3be7ad5df12eb86498b106a9033b37895f2f5ae79adeed18b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxaarch64bionicstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-linuxaarch64bionicstaticdebug.zip",
        sha256 = "15266770ea8b97d1584486c3c8b2a04e695df7a24036fd3af5e0065c7130cf2a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxraspbianstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.1.1/cscore-cpp-2022.1.1-linuxraspbianstaticdebug.zip",
        sha256 = "a3af81a55b63d6e69960e8cb28846feec35210843696b24d73502f88e9b47685",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-headers.zip",
        sha256 = "603adee3cf0cb0dde90d530d29cfdb6f4cc239f3c64c93d0d07867bf2b54e672",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-sources.zip",
        sha256 = "bb585c808b383eae4ef1b24e4c879ed8b6a0c1a1e6c040f2b4c1bd0e17adf82b",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-linuxx86-64.zip",
        sha256 = "e4655a46c792013675d42d11506f86d5f6f5bf1d814db6f2aac43e8aa1fdae68",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-osxx86-64.zip",
        sha256 = "afc4b26a4e6f4a7456ac3002f681ecb6179c919e11f22b81cfa0581bb0ffe284",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-windowsx86-64.zip",
        sha256 = "fda5b67cf934647c493e4ae7ebc76fd1801f1ced107e58771af2d6658527d547",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-windowsx86.zip",
        sha256 = "3016cd13decf9c5de07c89cc05cc4bd477853c6c5e6debf9d5abcb08cadf8c24",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-linuxx86-64static.zip",
        sha256 = "5edf5f8bfdc88302ea0fb64127f1d13899f2627c51cff5efc5da8fa65e9d4697",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-osxx86-64static.zip",
        sha256 = "404d9819c42e071577d27d6e6775958b630047c5ec3591a18781df2bb42e5ac0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-windowsx86-64static.zip",
        sha256 = "bcb92cddf2d66ea0a6d86b9dd75b10bdf7dd9c2b219fc4af106a335211e79cfd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-windowsx86static.zip",
        sha256 = "2a7c699ebe4e86ab5d947a5d57c081d421b3f3bf742ab5f5283a4449de6fb83f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-linuxx86-64debug.zip",
        sha256 = "3d5de4f1c1c2247a6693cdcacef275cf95508cd8229822b5558b1daef6cc1304",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-osxx86-64debug.zip",
        sha256 = "16d57ca835592acf10ef9ed151e487d251faf4fd94b052c5c0a9e4fcf3e21ec5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-windowsx86-64debug.zip",
        sha256 = "fbb95feb5ac94acd66ca7c4f539eda9d4f3414566397b67826fc31206732c378",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-windowsx86debug.zip",
        sha256 = "0f09ace349075b1f11041731a2d4db46e1f9711d0779a5bce6cc10fb01e4cbd3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-linuxx86-64staticdebug.zip",
        sha256 = "11da02a80a2184d3f4b4b2758652f2b2eb51af727278f77251753b125fc84508",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-osxx86-64staticdebug.zip",
        sha256 = "91783ea9f9ac3adbc51b07f18f075c970714a4d2ac3a6ca933072959319754dd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-windowsx86-64staticdebug.zip",
        sha256 = "efee5102773603c9ed7fde0c640bff0a30de12da9c7df35891493c168a7a625e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-windowsx86staticdebug.zip",
        sha256 = "96a57a9243eb44f07c81da7050f88f8718de8cf1db2bd494541e6e513e71344d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-linuxathena.zip",
        sha256 = "2c96983902d1caef823e38f314939d4f192c795541bda0c263af65b0cadd8cb0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxaarch64bionic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-linuxaarch64bionic.zip",
        sha256 = "0d58465b159377e1a94f68fc98fd33d3fedd65092afc3cd6277d86d76451ca5e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxraspbian",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-linuxraspbian.zip",
        sha256 = "2f55d6e17436dc2b5cc4d60faa534092aa5492143f305e59b41e567067513e97",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-linuxathenastatic.zip",
        sha256 = "0129b2e3079852f26b2272a7e91a824194f2f6ba345f0c400611fe4888bff03a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxaarch64bionicstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-linuxaarch64bionicstatic.zip",
        sha256 = "d9c5da24ea0d81a39193998901b565aaf8f05d35289fbe3542e9363d6859c6d8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxraspbianstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-linuxraspbianstatic.zip",
        sha256 = "56955536cc077903748c824278ae5eb33d9d59899b524cd2109efe8907b22598",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-linuxathenadebug.zip",
        sha256 = "6b9365b82c13a0c1565832da30cc811f72c992e06450a32f57c324621d01ae49",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxaarch64bionicdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-linuxaarch64bionicdebug.zip",
        sha256 = "636a448884ddf4fb7ee326432203876a5f253dff63cf25a08c841805c5b375a4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxraspbiandebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-linuxraspbiandebug.zip",
        sha256 = "16ed33ea89cc1a11ce125535f849d04eba4ae9251f678d6e6d7ca728b67a8005",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-linuxathenastaticdebug.zip",
        sha256 = "4b7daa345bd2182b6158d111bbb8ee3f125056b4bdda60bb788ddf37c73772fe",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxaarch64bionicstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-linuxaarch64bionicstaticdebug.zip",
        sha256 = "62d451f21ab8fad915138950a4cbccdd1392639f1b8c4934398547a3eb482cf3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxraspbianstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.1.1/cameraserver-cpp-2022.1.1-linuxraspbianstaticdebug.zip",
        sha256 = "6d42c9b9c20c4b7d07331c71b9dec7c01720e8435076bc0a7a8257f19e9951c0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-headers.zip",
        sha256 = "29d9fa0496bf299ec8dc58347fd772230d51ce4f6a85f10951bcc18b20230dde",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-sources.zip",
        sha256 = "06b71a61100ba3822aa2fbfa1f6d3d7e796f2c16df82bc8e0f82818f0422b418",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-linuxx86-64.zip",
        sha256 = "b9428d9b41e5c56ebabec8f29739125c39fd07706ac5dc941648ddfa5cac6be3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-osxx86-64.zip",
        sha256 = "04a10cccf42b863dd8c220ba26fc96a0692242453424c103b67eab89181bec3d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-windowsx86-64.zip",
        sha256 = "69e3bc8e316e483c728221d90d621acdae4741d027f8638ab375a4b1a9ca21cd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-windowsx86.zip",
        sha256 = "6f108673f3da5aea4b1c18109084d5c7566d4ab4b935221b4b26a7f7e36823e4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-linuxx86-64static.zip",
        sha256 = "f7dddf967e3aea536bf6c0f907984c2df20f0cc921d1023297a30cf553765868",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-osxx86-64static.zip",
        sha256 = "b854025344262eb6a9b35e271d4de3fbb76ec317eb3f30143b6be55c16424963",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-windowsx86-64static.zip",
        sha256 = "96abb44cf19fe7703618432bea13b7398f8240c8da334c35af11536dcb15ff26",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-windowsx86static.zip",
        sha256 = "72854271450599ab6a3917c70383be70be54340611df383bd9be6add2ef667c4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-linuxx86-64debug.zip",
        sha256 = "8102649a77541d907b5263608473db92f1d7565ce6240d87ce1d10e98216dbc0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-osxx86-64debug.zip",
        sha256 = "23991fd2b6718ec343f9b0835339da8d2d4dfec60bec4c06441eef0e448fa0db",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-windowsx86-64debug.zip",
        sha256 = "0ad2b786060ed1ea233647837478440533f6d5665756a9d2bd50d371c7dcb618",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-windowsx86debug.zip",
        sha256 = "852bda05fc631b087fffeb4d12f9ece935c4b0f0b4d9f04e47b91aa1686ca9a4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-linuxx86-64staticdebug.zip",
        sha256 = "a50bb30fa142ff5c4e8899594638b33839bc50a3c3f44e71c48feffc648fff8b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-osxx86-64staticdebug.zip",
        sha256 = "5545149ec30c8bc8363a8c686733b8f7384399a15d65e5ff85a441ee0776677a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-windowsx86-64staticdebug.zip",
        sha256 = "877cf70ba0d15d1e434f9046a1de20b89a75c4e171dc49a8f13a8434f92fce2c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-windowsx86staticdebug.zip",
        sha256 = "945c6cba51df4e3620836b35f9285aa3cd09c1cc66b1c19195a021a44b92a56e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-linuxathena.zip",
        sha256 = "3570c0a2a91e3547aae2234479b6f13528685abb5225c140e291cd73418441d5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxaarch64bionic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-linuxaarch64bionic.zip",
        sha256 = "a6fc7885d5df77d82429cf6021d15a52b8c2ed3a81be40eeccc51989561ec691",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxraspbian",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-linuxraspbian.zip",
        sha256 = "5d12df43810822ca988c2efeba5be37d3901f4c3cb865db4733067ceabbac054",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-linuxathenastatic.zip",
        sha256 = "475e890fd43367b851d013aff5ffcfcefae7db33656aee3c6a1367708eafe170",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxaarch64bionicstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-linuxaarch64bionicstatic.zip",
        sha256 = "7a5165d1b3ab10de3c8d9a7a3914484bdd6bbe91b739dd264a5aacb5ec830680",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxraspbianstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-linuxraspbianstatic.zip",
        sha256 = "2e0eda891db818abf9ccc4ac10df1de98708dc5f03cc023e7990b8a0697f6906",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-linuxathenadebug.zip",
        sha256 = "d6dd702fec40b196392205b1ef5f56be08f499c6a3d49728573acd78cbfd8bc7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxaarch64bionicdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-linuxaarch64bionicdebug.zip",
        sha256 = "49059ca853a2f39c8c4d550aa785a37c4cdb90dc754c61a1f418e1702ee506b1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxraspbiandebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-linuxraspbiandebug.zip",
        sha256 = "9cd0e798b90bce4f95d85ba2823d45766b1541e5d48bf281f8de8cebb575b306",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-linuxathenastaticdebug.zip",
        sha256 = "5157fe8d08c87f78d0bf29a96dc1ff005105ad4fe60299b43554568359c97207",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxaarch64bionicstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-linuxaarch64bionicstaticdebug.zip",
        sha256 = "8b9d02dada01e1b79f156e5da5a93ce04b7e72ed18b4a6db1dfbb10a79976dbc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxraspbianstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.1.1/wpilibc-cpp-2022.1.1-linuxraspbianstaticdebug.zip",
        sha256 = "ff7e19fd5c470645a8003cc92eb7e70bee0b7027321168060ee30f3652a09c53",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-headers.zip",
        sha256 = "2a36b62c3bd764974d23b507de6ea0356e17f46cd8dc67dd6b33acc7afa32708",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-sources.zip",
        sha256 = "61e980c42f0cf7991c4d0578751241cdf7c9a6fea9241b7d5fa631479ae4d719",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-linuxx86-64.zip",
        sha256 = "2389cecb8b86adf7d4323aa86dc7f64d5c566e6b0d0e099a123618efd3b4c76b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-osxx86-64.zip",
        sha256 = "d56cbcbc6e656b27d8be5a4238a5758d699b24eca7195fca952b38df1db8e099",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-windowsx86-64.zip",
        sha256 = "bac67e8854fc88fb14d905556ba9cc953d00ebf01c39c4ab517826e8ce5cd4b4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-windowsx86.zip",
        sha256 = "818d66f85a7e98e73ed49fdaaa6015ac4e02199d1b69a99fd257799c0716d70f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-linuxx86-64static.zip",
        sha256 = "5132ce51cf48260d82d3bd8fb239fd516675cb1abe3339086ebdb13f1d50beb0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-osxx86-64static.zip",
        sha256 = "86fa73e93a21aa676312875b8483a9f55e12e9c2885a28065ed3429e7b4efbb3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-windowsx86-64static.zip",
        sha256 = "e59495ceb36f6e113dfd8154ac0f7478f59e5b8e1879f912eb9e4423fc7b6f12",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-windowsx86static.zip",
        sha256 = "3acf335f1b24e0dafd1879a90a3ab6f5066a8fe32da25ae3123cb522c438cf00",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-linuxx86-64debug.zip",
        sha256 = "f902293d5e9f9085191afa68e44e8024a860d4ef6d3b30511b137b4e3c1cfcf9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-osxx86-64debug.zip",
        sha256 = "ddad56d2eff4bbbdae911a7f503fbc21a48b2465dc05a5384dd9f6737fe35130",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-windowsx86-64debug.zip",
        sha256 = "777cbccab3f6b8a8f7885955af2f68218aa6d966c9b67beb675f7b16e426aa78",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-windowsx86debug.zip",
        sha256 = "efe806450328fab983373f77b715d9b384c37dbc3941eabf1d0cb09fb222e3d8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-linuxx86-64staticdebug.zip",
        sha256 = "52a1408530c289109f40a33ea756a7a1df5a9f2f966ad313078e7576cc06a93d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-osxx86-64staticdebug.zip",
        sha256 = "25dc462c58f1f42e83320be9825f399a7a0d19843cecfc9749c8fae71116bfdf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-windowsx86-64staticdebug.zip",
        sha256 = "2d706085bc5e173fc293124a66a2d90b019ac98a944e14876791f8847222d346",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-windowsx86staticdebug.zip",
        sha256 = "86c1d7fd0c302e3adceb9c74fc63c32b7a87be46f090fdff5f76448dc4cce3f9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-linuxathena.zip",
        sha256 = "f64fbdfdf82f358463eb1d8333d73990d83bec8396a982e6d2d00f9dccee3144",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxaarch64bionic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-linuxaarch64bionic.zip",
        sha256 = "5f2c8e66c58176057c807996ca06cfea719be713ca3a19939a5d40a616ba2f9c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxraspbian",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-linuxraspbian.zip",
        sha256 = "4af3da58e72e9fca69684033f47a34b6f7be7ce9cec494c4e9d3dc701a823984",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-linuxathenastatic.zip",
        sha256 = "64adf9dd211fdcfa092fb350d37a8c673d24dd7ddd20d99482008683ee1c6991",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxaarch64bionicstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-linuxaarch64bionicstatic.zip",
        sha256 = "cada62f5f23885d4f66702cd3a26514e1e815ae2e7cac9390ce527bddfb7eb2b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxraspbianstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-linuxraspbianstatic.zip",
        sha256 = "8e4aa2323d7d8b0ea250a9c4954bbfaaad0ba39eb99333517907fc169d61fbd3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-linuxathenadebug.zip",
        sha256 = "e7a986023b6437740649ae78fb93248d69dd9d216eb48d6fdc362bf4a23c3c23",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxaarch64bionicdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-linuxaarch64bionicdebug.zip",
        sha256 = "10ba03127dd0951bad99e07cf1f713433b4e79b90e317f15f346d15c9d611555",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxraspbiandebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-linuxraspbiandebug.zip",
        sha256 = "46906ac8f938f44c75a4ebba6801ee982d0323e4edddd7f56434c9b6e4ad3a9b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-linuxathenastaticdebug.zip",
        sha256 = "9419d014c4a9a27db1482164aab15d9312d165c78b2d9312884570fe4fd3d96a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxaarch64bionicstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-linuxaarch64bionicstaticdebug.zip",
        sha256 = "fc656174975fd0345dcdd74fb56a00f797cc4d739e081b2441f9bd4226273217",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxraspbianstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.1.1/wpilibNewCommands-cpp-2022.1.1-linuxraspbianstaticdebug.zip",
        sha256 = "952cfc5447793508c8c8d9a683892945373e0ff83f4c28c8b35e854d8377f67b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-headers.zip",
        sha256 = "fd11c98f1b9242e80e6fc864f8e2cc41a001ad464498c6cc95ccb26ec84fd6a9",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-sources.zip",
        sha256 = "eacf13f19c3940ccd35f24aaaffc378bf41779e9072a4ed416374689b0a8ccf2",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-linuxx86-64.zip",
        sha256 = "653b1ed5802e531377af85bad7e42f5dfc50dcae66350bf853c0498e1cf941f1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-osxx86-64.zip",
        sha256 = "c49e989b3730f6ad8b98d3b30edff0e85dd9da08d47b91d4dbbe0829ef9cd29e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-windowsx86-64.zip",
        sha256 = "98b640dfb2e1b0282d851022e7119b37686f4c47f951a95ea0854664f5cb45b4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-windowsx86.zip",
        sha256 = "b2ebd9e950a240047417d2299ae31d235240f3d6091d0cff2c72f2bb6ed4b825",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-linuxx86-64static.zip",
        sha256 = "c312941aafb9bd74e3f4c629a15bc131b51ba11e5d6fba560eb97355dc6349fd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-osxx86-64static.zip",
        sha256 = "050aec1e42262aa3e6d8e3c7c7580749f8a1eedd594dd013d448828716b3d239",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-windowsx86-64static.zip",
        sha256 = "e33becf456e85a7c6484f2a8cf86253b9a31bdca9eeb954a522461bc006bdac8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-windowsx86static.zip",
        sha256 = "590e1334f5e1ad6aafa157d04bd1cae84545d2c583f3f4241052e17fed8257d5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-linuxx86-64debug.zip",
        sha256 = "62ae725d2cf46cb9f483715405d5c5b92b95801d75a995d55afe703c9e049fff",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-osxx86-64debug.zip",
        sha256 = "c278d880315d7b8cbb0d56719257720a5975ea45a2b76eb679f42def63803d01",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-windowsx86-64debug.zip",
        sha256 = "9e470264d964336f2482ffc6cb76a58a365a04d27460acb692ccbbe303d6e669",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-windowsx86debug.zip",
        sha256 = "4fcb3f88b29fd49d3180f261248021692631cb7ff6c6f1316b79afa9309852fc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-linuxx86-64staticdebug.zip",
        sha256 = "ea75f4186fd756c0e53e2179efe3acd3f8e1ee21f4df01f38fff5a9ec0395814",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-osxx86-64staticdebug.zip",
        sha256 = "59ef237359ccbd7fc430694463cbaedbf65dad4781a93e569b7f3b254a5d6045",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-windowsx86-64staticdebug.zip",
        sha256 = "d4e70b64095afcaa5bfb22ad8c41091c527054ff8a82c19b559a06d50e64f68e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-windowsx86staticdebug.zip",
        sha256 = "73e99709001ca956d68cf1537421d67b525e11e66454a3d8a00cf6c4d4cc1642",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-linuxathena.zip",
        sha256 = "a0875ce8e545c99a809126e79ffdc3faccc5ed08aaf7822dd1b2f4c288d17fcd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxaarch64bionic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-linuxaarch64bionic.zip",
        sha256 = "41624b7f61dcb52c3e6f7ce81394c3a57bc251ff7aa0f025948986f93cae239f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxraspbian",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-linuxraspbian.zip",
        sha256 = "354fbfd4336a1db81be3dd504ac175be20dab199cc2f4fe82839c6b13d1e915e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-linuxathenastatic.zip",
        sha256 = "cf0c6ac0ef86872b7dca198fc1091547d104c8ec853b6569f7677563b97038bb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxaarch64bionicstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-linuxaarch64bionicstatic.zip",
        sha256 = "ca9bf18e6de1d5594bfd417f8a41195f13f13ecb4e3f6d6212100df7bf5a8f4e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxraspbianstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-linuxraspbianstatic.zip",
        sha256 = "01c1f34f4bf8a0fb0f3414796a70def361c6079ca869ca6deda6d7e96c635462",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-linuxathenadebug.zip",
        sha256 = "77aad74cf4b8cd6e556201257c52266fc91bcb1a87ee35ae0d1dce3849842ab1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxaarch64bionicdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-linuxaarch64bionicdebug.zip",
        sha256 = "b25baafe48b1138f80dcd69696731125c6e1ed4daa290770073ea73f90077290",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxraspbiandebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-linuxraspbiandebug.zip",
        sha256 = "d47e32cb5a6e2e0f3ce0903bbf8522669e0697eaa1ce4f7691f070a24d47c578",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-linuxathenastaticdebug.zip",
        sha256 = "92a9e5947f8333c630c35c437c144250d9aa61e950f744d3347f1b0b50a1c478",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxaarch64bionicstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-linuxaarch64bionicstaticdebug.zip",
        sha256 = "7d3cfcb377016528c5509b8ffcfee5053e26ead596573b00d8ec7b080c8a829f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxraspbianstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.1.1/wpilibOldCommands-cpp-2022.1.1-linuxraspbianstaticdebug.zip",
        sha256 = "5724a3f919dd6ea7afa9ec96ba26663fe8187c20f98565343d2062cdfb8d1bcf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.1.1/halsim_ds_socket-2022.1.1-sources.zip",
        sha256 = "9777e72cdcf3d2584dc3b3d7cf0d08d90200aae72ca79afbbaf6839a16ea3ba5",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.1.1/halsim_ds_socket-2022.1.1-linuxx86-64.zip",
        sha256 = "99ed1a95e84f6fdcfdf9f052c8f303ac096a77865ee0fe4cd651d7b73fafe75e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.1.1/halsim_ds_socket-2022.1.1-osxx86-64.zip",
        sha256 = "13b0aa8a8d579d4983ecdee33d89cdd720d266e5a6edcc57b2c5fef59b0ac943",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.1.1/halsim_ds_socket-2022.1.1-windowsx86-64.zip",
        sha256 = "aa53a0537813eb8092b6052adfe8f8b4ed7b237ae3541f29001dcc5bbcad9fcc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.1.1/halsim_ds_socket-2022.1.1-windowsx86.zip",
        sha256 = "2078989551ab0f7c13d46e79ca9b639d587a6d992c7080e29562438c8883b68a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.1.1/halsim_ds_socket-2022.1.1-linuxx86-64static.zip",
        sha256 = "fab4114abe09e30889f829290d5fa51f6b929ac40cd98ca79e19589fcb2f3ee6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.1.1/halsim_ds_socket-2022.1.1-osxx86-64static.zip",
        sha256 = "43ef3b847154215182ea64fe372c6d85269d7e8db0960d267310d8cac1bf4507",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.1.1/halsim_ds_socket-2022.1.1-windowsx86-64static.zip",
        sha256 = "1235b44a5d064531aa8dd6eb8e344146dacb4dcec76681682d95fb4f39292245",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.1.1/halsim_ds_socket-2022.1.1-windowsx86static.zip",
        sha256 = "76ae2e1d30b33f90386c5a4e4069dcece24261157641a273cdd70b56243e96ba",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.1.1/halsim_ds_socket-2022.1.1-linuxx86-64debug.zip",
        sha256 = "8fb74a03d48910f7bbe6b0fe5bcf36acac5bbe5c9d3503e645cfcbdfe0b13a86",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.1.1/halsim_ds_socket-2022.1.1-osxx86-64debug.zip",
        sha256 = "a38020cfede8d75325152b2967257f256fa13974590fbc3aada22b262dad8539",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.1.1/halsim_ds_socket-2022.1.1-windowsx86-64debug.zip",
        sha256 = "a7da9ef1f5aed8619003020bcbc6f4208c1c76be2ff25f50c6fa1289ceeb1d69",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.1.1/halsim_ds_socket-2022.1.1-windowsx86debug.zip",
        sha256 = "f018ab08b892cfab682ba961d50064440cbba7d4b088657aa9aae314ad563dc4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.1.1/halsim_ds_socket-2022.1.1-linuxx86-64staticdebug.zip",
        sha256 = "0d21d603017a556427275231b089cce5f82504b76cded1d56fd0ce8dca24bad4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.1.1/halsim_ds_socket-2022.1.1-osxx86-64staticdebug.zip",
        sha256 = "46c011f77bc6bff5cf6b7385f7d7def183ed3496c32089716d06da27a8935192",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.1.1/halsim_ds_socket-2022.1.1-windowsx86-64staticdebug.zip",
        sha256 = "9e6cc61193ce25d2351046e25c520b243391bf7c4984ea3dfe26cc32362c7575",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.1.1/halsim_ds_socket-2022.1.1-windowsx86staticdebug.zip",
        sha256 = "e78ac8859206e316c942a0671682e1050fea82265233dade0fe8fa6806da2e6c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.1.1/halsim_gui-2022.1.1-sources.zip",
        sha256 = "9445a81dbe5e748e6dc20b555cd76d33ff510fd7ae5be39eeeac61342127677f",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.1.1/halsim_gui-2022.1.1-linuxx86-64.zip",
        sha256 = "d7c233f44c19d6775a42ab9d5ae0be7ad9644d5edffa74fe017ff4356db3a058",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.1.1/halsim_gui-2022.1.1-osxx86-64.zip",
        sha256 = "9d8e2a1d71ab7b7e2db75a261665aa994e84e4505caf86ab055d2b39c40c16d3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.1.1/halsim_gui-2022.1.1-windowsx86-64.zip",
        sha256 = "1cbc198e1ed610614ca24449367007178452a1c2073536b307030d69cc7a4f3c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.1.1/halsim_gui-2022.1.1-windowsx86.zip",
        sha256 = "c669b7475bf47b9237ec522290d07e112d087af7b4aa758821e8ad06b72e1db4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.1.1/halsim_gui-2022.1.1-linuxx86-64static.zip",
        sha256 = "c799d5287e48140c714242f6ecb77bd9665dba603de0d12ef8c5d257e1f35ac5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.1.1/halsim_gui-2022.1.1-osxx86-64static.zip",
        sha256 = "94125f6edc5b07451b8e310e79adb2ec344b8e56e095577ac26c065b72feb835",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.1.1/halsim_gui-2022.1.1-windowsx86-64static.zip",
        sha256 = "4efc37b4f8b83dbd1d9029eefd3f8537987107bb60ecc15bd4134b5f4e747bfe",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.1.1/halsim_gui-2022.1.1-windowsx86static.zip",
        sha256 = "30daea94bd5df54e992a6d3d604f8715caa4a4b185ef06a1d427145fd815d64a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.1.1/halsim_gui-2022.1.1-linuxx86-64debug.zip",
        sha256 = "e484478ab484ea0b3a09e63f1a7001936f4dc83cd5aa5bbab62d6bb88a2a87c8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.1.1/halsim_gui-2022.1.1-osxx86-64debug.zip",
        sha256 = "67b6ce2192d0d5f7c434f254266654130d4e8e9d048ba4bedb3f7f33a7f45b61",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.1.1/halsim_gui-2022.1.1-windowsx86-64debug.zip",
        sha256 = "053e2e45bf344b0d4a908321b2ce31d02df370008aa9439b75c2eb53c40a19cc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.1.1/halsim_gui-2022.1.1-windowsx86debug.zip",
        sha256 = "2ffb275151a5ae90b5037e4a1c8e9daea7f225d9cea9c8fa5913a80f32157190",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.1.1/halsim_gui-2022.1.1-linuxx86-64staticdebug.zip",
        sha256 = "6fd360158bc9d3e93c3b887d9189ed7377cdd46fb26406136c7e15c19bc90726",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.1.1/halsim_gui-2022.1.1-osxx86-64staticdebug.zip",
        sha256 = "654b48d14a354b3262bc436e0b4efb539b4df5e88d9a3999792b544b628ad770",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.1.1/halsim_gui-2022.1.1-windowsx86-64staticdebug.zip",
        sha256 = "31b82982e2bcf27f879b25a5d280c1929fcd16544cf060798fb6c77a2af64922",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.1.1/halsim_gui-2022.1.1-windowsx86staticdebug.zip",
        sha256 = "6ffcc5f933021167f491bf09131dfe8a85a3a7c0a51b6bed5f2c751516511197",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.1.1/halsim_ws_client-2022.1.1-sources.zip",
        sha256 = "2b99afbfb0f2f6b31935978b832a04dc10b608d9a901d1800b767477294d573d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.1.1/halsim_ws_client-2022.1.1-linuxx86-64.zip",
        sha256 = "317d98639060c5174cedfe9a18b8f81db85ef193a60ecc938ff76e2529be7ee6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.1.1/halsim_ws_client-2022.1.1-osxx86-64.zip",
        sha256 = "a600f4fc60598f42acb52c7b17fcfa42255e48033507cd2ad9e00b985594ca85",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.1.1/halsim_ws_client-2022.1.1-windowsx86-64.zip",
        sha256 = "3b56a59a07cb44dd169fa986c4c39a4cef8c8d9b69a9b35e0975bd6530fdc067",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.1.1/halsim_ws_client-2022.1.1-windowsx86.zip",
        sha256 = "3ea741e9689e45ba2f37cfef7f49049c9de3d838b29d1040202b655ea7294d0e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.1.1/halsim_ws_client-2022.1.1-linuxx86-64static.zip",
        sha256 = "99bf8cb079c81afd74648256a582f42f2ac7ba179e073f53c97e0f4df731cecd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.1.1/halsim_ws_client-2022.1.1-osxx86-64static.zip",
        sha256 = "d7d26108f7f49dbbb599b9c7e1a48b5e964898e721b941e4ea8475665f0cb0e4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.1.1/halsim_ws_client-2022.1.1-windowsx86-64static.zip",
        sha256 = "343e7cc2ddcb8c83812d82d2cf8459ef690e5ccacc0e2ff913b7af4009948f07",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.1.1/halsim_ws_client-2022.1.1-windowsx86static.zip",
        sha256 = "a3a3fc03aeff3a4c40bb5d00a1bf5a9381b4d1804e0f47e00c0b59a50fceb117",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.1.1/halsim_ws_client-2022.1.1-linuxx86-64debug.zip",
        sha256 = "ebaef4dd0328de47fc9bf0caf4aa95e4066192bc8157f632fc26c343094606c1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.1.1/halsim_ws_client-2022.1.1-osxx86-64debug.zip",
        sha256 = "859f1c96ea7433a9bd5f0131a5eba68251eb05cc990b7a5f5323208cfda7a5cf",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.1.1/halsim_ws_client-2022.1.1-windowsx86-64debug.zip",
        sha256 = "f3291ee982ec9eeae058f0e123e8ceed191b16a9c4f10e2a5ae261a35948711d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.1.1/halsim_ws_client-2022.1.1-windowsx86debug.zip",
        sha256 = "3e96ad250d773dbe6bc22b074fcb1e7c6ec19cc22a65868254793ff01205b9fc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.1.1/halsim_ws_client-2022.1.1-linuxx86-64staticdebug.zip",
        sha256 = "887beaa3bfd4f0e6bda4a2ddc243e40b6d43ecdd71cc60bd9afd20231cfc9cb3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.1.1/halsim_ws_client-2022.1.1-osxx86-64staticdebug.zip",
        sha256 = "5a4009b67541e6d6058ad29b9456cc6ad47d530f673e6443680d42aafc27be51",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.1.1/halsim_ws_client-2022.1.1-windowsx86-64staticdebug.zip",
        sha256 = "f96416b99882b0916755702f022428083cdf9657958a89c7adf5e79116ca6229",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.1.1/halsim_ws_client-2022.1.1-windowsx86staticdebug.zip",
        sha256 = "57a58fdd019ed52c8f3f8c4cd8dc59f9edc36241131c9fd200284d9647002f03",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.1.1/halsim_ws_server-2022.1.1-sources.zip",
        sha256 = "4bc3b5e0fd0452b3ff74737d3b8c5d62294048ff98e3320078742700e06d47a1",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.1.1/halsim_ws_server-2022.1.1-linuxx86-64.zip",
        sha256 = "daab49d464cd0e18ab911470abccc7b70d1e77b4afe0874a80e765a99c93b988",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.1.1/halsim_ws_server-2022.1.1-osxx86-64.zip",
        sha256 = "848464ca9a3d494de18e8f269d771bda55fa73e62cda6a1563e3d7c33ba07c7e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.1.1/halsim_ws_server-2022.1.1-windowsx86-64.zip",
        sha256 = "77e2066636643b61fdc2febe643f4dc5cfdd01f71680c17d6268db20c67921c0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.1.1/halsim_ws_server-2022.1.1-windowsx86.zip",
        sha256 = "059e8f777bb1662e6be27bb09b75d96370758b1a4d5fcd2fd300a244c38f8fab",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.1.1/halsim_ws_server-2022.1.1-linuxx86-64static.zip",
        sha256 = "1f08c121126323acaf05064f5a51ea6f30b77af3b23c15878a073cd35d874a7c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.1.1/halsim_ws_server-2022.1.1-osxx86-64static.zip",
        sha256 = "1f3752c958276e01d6a72f3205f6d867b81cb19d0e74e63cbed48238a080bf7e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.1.1/halsim_ws_server-2022.1.1-windowsx86-64static.zip",
        sha256 = "38e3d9b19de37ead2f47ba8f4c62ee98bc5611b68bae242a2b7ba848a091c934",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.1.1/halsim_ws_server-2022.1.1-windowsx86static.zip",
        sha256 = "1f15fc83a224a09ecbb57ac0a9596cfe7eeeb4f8c34ba2e04f71c2289b56a2a6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.1.1/halsim_ws_server-2022.1.1-linuxx86-64debug.zip",
        sha256 = "997d0ce65084ccb5728b6e7d7590ed561561ebd677afe6f5a2126e581a7535b0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.1.1/halsim_ws_server-2022.1.1-osxx86-64debug.zip",
        sha256 = "f4544cc56faed22e5f1dd0b3a26642d5d58ce734b20d7a0819de715ef4733689",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.1.1/halsim_ws_server-2022.1.1-windowsx86-64debug.zip",
        sha256 = "fe5911aca1438b044b533a82dd53dd62f356d7ffe8fb0ee2be50cf45a28c0aeb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.1.1/halsim_ws_server-2022.1.1-windowsx86debug.zip",
        sha256 = "bfdf0e80714795a1d9a64ba4b9a81c92b1820d217573dcec66830cad97f0ddd4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.1.1/halsim_ws_server-2022.1.1-linuxx86-64staticdebug.zip",
        sha256 = "157cff8d538bd30194ed533d9f15713988c1bd0c5c918fc24a65f6b39ce8e27b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.1.1/halsim_ws_server-2022.1.1-osxx86-64staticdebug.zip",
        sha256 = "35a2a3b1cffc8392a05d471957f910fe7be884b613f738136ddf9f4b94f668ae",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.1.1/halsim_ws_server-2022.1.1-windowsx86-64staticdebug.zip",
        sha256 = "801eee2573ea2885821028f0890ca33e577a5d79601733b5ba0a4aae9e6eb606",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.1.1/halsim_ws_server-2022.1.1-windowsx86staticdebug.zip",
        sha256 = "88761cee8ef03d68908e351d26793c00330a9c006f5ef14244aa51630b3975a2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linux64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2022.1.1/SmartDashboard-2022.1.1-linux64.jar",
        sha256 = "6bfeeb5a2f28506565f80636a04d234a52e3789081356dee5de00827983125f5",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_mac64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2022.1.1/SmartDashboard-2022.1.1-mac64.jar",
        sha256 = "d7b153f095de363a2d7a391dbbd3708903837032dabbe97943ab9225b1cfe5fd",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_win64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2022.1.1/SmartDashboard-2022.1.1-win64.jar",
        sha256 = "ddaaae6bbccc1e1ea67e3e93dfc4227af37026b19bd54b2b53677d65b2189877",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linux64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2022.1.1/PathWeaver-2022.1.1-linux64.jar",
        sha256 = "de5630b5f9a049a84a213123add1242feff072ce8ccba09e1fc822c7b497e8f7",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_mac64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2022.1.1/PathWeaver-2022.1.1-mac64.jar",
        sha256 = "35e6d0f5758cf46b01f446431f7ed4490708bfdb45281038d01c6f781c1229a3",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_win64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2022.1.1/PathWeaver-2022.1.1-win64.jar",
        sha256 = "56a6cba57c2ce816ee6ebbb8dd34b7b7cd61c549d8863a3f43c504c354a0e979",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2022.1.1/RobotBuilder-2022.1.1.jar",
        sha256 = "db8c22764d8c1f7bbe1550f85ed64358197dbe7b7d605607a79f91ef6465eb62",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_shuffleboard_shuffleboard_linux64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/shuffleboard/shuffleboard/2022.1.1/shuffleboard-2022.1.1-linux64.jar",
        sha256 = "028ce82032dade135b2a409f87616807c5df0465e31d68ea05c115570c42fd9f",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_shuffleboard_shuffleboard_mac64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/shuffleboard/shuffleboard/2022.1.1/shuffleboard-2022.1.1-mac64.jar",
        sha256 = "a2f8dab93fd56d7a16d4aeccadbb0bf72a77a933255ed44c2465f27bcab3527a",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_shuffleboard_shuffleboard_win64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/shuffleboard/shuffleboard/2022.1.1/shuffleboard-2022.1.1-win64.jar",
        sha256 = "ada1cf7175f2e2a0fc19179193a4ab79b570f9b79dea603828e43c75e7f70785",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2022.1.1/Glass-2022.1.1-linuxx86-64.zip",
        sha256 = "9b5f47ce127d3ed057e2196537c7c2e2551fe0ca2f86b3b8634400a651c65d80",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2022.1.1/Glass-2022.1.1-osxx86-64.zip",
        sha256 = "e323e82116571fee1f58b18445c9eafc4158fafd8bb09fde44ae975987a91eb1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2022.1.1/Glass-2022.1.1-windowsx86-64.zip",
        sha256 = "ffebb339b6db52878d56bc2cdf63efddd36e20a6bc9dd47ca3b326386f715a6f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2022.1.1/Glass-2022.1.1-windowsx86.zip",
        sha256 = "e151ab723430f9efbbd1f0ca7da0a93e5fbf3b0b8f50dfc99e837f928d60f43b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2022.1.1/OutlineViewer-2022.1.1-linuxx86-64.zip",
        sha256 = "df80f8ff7666ab98ab358193f1f7d8f851c6cc0e9ed8d435bc06ccdf9385946b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2022.1.1/OutlineViewer-2022.1.1-osxx86-64.zip",
        sha256 = "b41c91ff3db5fee9181e9ece4234675e7eb4eaa7d7ee9976ad61c599d74b21b7",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2022.1.1/OutlineViewer-2022.1.1-windowsx86-64.zip",
        sha256 = "76da23b24141864d5024f9fe54133eb4a92e7d5ba13fcbb3de8848f51b84189b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2022.1.1/OutlineViewer-2022.1.1-windowsx86.zip",
        sha256 = "1d1b3635cbe498b4053ea51af47443050e8c17a530f7a81c6e9bbebe14374e93",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2022.1.1/SysId-2022.1.1-linuxx86-64.zip",
        sha256 = "29264caec4d730e27a042bdb569333a757189a62c639d10713d62295bc176dc9",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2022.1.1/SysId-2022.1.1-osxx86-64.zip",
        sha256 = "d1f3f2d55154cc0644fba15d8c42a6aae33068f6e698cb6e9c6da0264a817f3c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2022.1.1/SysId-2022.1.1-windowsx86-64.zip",
        sha256 = "ef09ba600f83ea4afffbc826c54e4d0d80747a50082cea7ed44252061833cc7f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2022.1.1/SysId-2022.1.1-windowsx86.zip",
        sha256 = "20569ac533d5b9472fa610951f686f7c358c1fd9a82b2ba5b8b1d3c924d39352",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
