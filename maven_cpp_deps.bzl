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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.2.1/wpiutil-cpp-2023.2.1-headers.zip",
        sha256 = "03e638547ee692b5cc36581ebbdac3d204f6933fb64ca6aca32d2eba66da34cc",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.2.1/wpiutil-cpp-2023.2.1-sources.zip",
        sha256 = "25fac83d113073df234ac22575f22107de7757abc231ffffa4dce16f80454aa6",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.2.1/wpiutil-cpp-2023.2.1-linuxarm32.zip",
        sha256 = "63d9f9cd6f2a672012ce7247545c676985366fd71432a27570f93bbf9b39f8ac",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.2.1/wpiutil-cpp-2023.2.1-linuxarm64.zip",
        sha256 = "6b0ee78eca94beddb25a19dea81f69d43c4d533464db86fed0d04dc9f85c3aaa",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.2.1/wpiutil-cpp-2023.2.1-linuxx86-64.zip",
        sha256 = "1332d47fb90cd579da07831b9bbbdf1a02989019f551b5e15aa6e00a95867c64",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.2.1/wpiutil-cpp-2023.2.1-osxuniversal.zip",
        sha256 = "7e4212b77f0b8d5438ee31f1f58fee0570833268b2b0d5871f594087be0b68d7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.2.1/wpiutil-cpp-2023.2.1-windowsx86-64.zip",
        sha256 = "cb47c1f91958b5be32c68e75728e981e3fb5fc083cf6e729df4bb7cb1653f82f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.2.1/wpiutil-cpp-2023.2.1-linuxarm32static.zip",
        sha256 = "0d4e4da8066e2c677d30cd33344379ed31ebc9d081ae15ef149896684be70d6b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.2.1/wpiutil-cpp-2023.2.1-linuxarm64static.zip",
        sha256 = "10f5c3b9cbbe425b1ebab5a63e7003133793b56c95680aef4134129faca9b853",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.2.1/wpiutil-cpp-2023.2.1-linuxx86-64static.zip",
        sha256 = "34d7322062e99e06d83cc3844eae2458cd0bcab397fcf905a526b90ccc5583d4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.2.1/wpiutil-cpp-2023.2.1-osxuniversalstatic.zip",
        sha256 = "e05baf3dfe4d4dc3503f440b6db1dbc66d7632c118e7454ed802c20096001982",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.2.1/wpiutil-cpp-2023.2.1-windowsx86-64static.zip",
        sha256 = "58c81522365b72f1d743c001276482cd39985d02f0066df1e4500226a07458a2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.2.1/wpiutil-cpp-2023.2.1-linuxarm32debug.zip",
        sha256 = "f7260a0897e99c2c5b1fdc6a0e9d14ceac6a14aa9859d88191da8c85b06174cd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.2.1/wpiutil-cpp-2023.2.1-linuxarm64debug.zip",
        sha256 = "9d3836214dc59174489d9653414923d81e3078b2b02bf2af74980d6b9eaa9f7b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.2.1/wpiutil-cpp-2023.2.1-linuxx86-64debug.zip",
        sha256 = "259efe0aff1681fb91bc274bb9388e03936f895a40428849e9cb8e364d368110",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.2.1/wpiutil-cpp-2023.2.1-osxuniversaldebug.zip",
        sha256 = "54637d41b85330ad0f5404efa2c87f48deb80fcbb8909a30201d231db79c92d5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.2.1/wpiutil-cpp-2023.2.1-windowsx86-64debug.zip",
        sha256 = "f67875c27abfc6fce68ab298a49a57ee3e52fb56355fbafb4d4dbf6ccd4a239a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.2.1/wpiutil-cpp-2023.2.1-linuxarm32staticdebug.zip",
        sha256 = "a58fcb16e1a667f53bc205a82be5d481fa7d555d8ee11ce9e776351fd5df0efa",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.2.1/wpiutil-cpp-2023.2.1-linuxarm64staticdebug.zip",
        sha256 = "962d2d037496ec3282856b07d9bc065b316fbbfd4261d4bcbc2b12b6a00a64f9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.2.1/wpiutil-cpp-2023.2.1-linuxx86-64staticdebug.zip",
        sha256 = "25d8c695b320114d535a42aaa3cfddf51255301c598bcbf927570565c89a613d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.2.1/wpiutil-cpp-2023.2.1-osxuniversalstaticdebug.zip",
        sha256 = "63098cbd74e0c731c165ce99f6285e526d23489e753a4157f0e4b96253843c85",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.2.1/wpiutil-cpp-2023.2.1-windowsx86-64staticdebug.zip",
        sha256 = "db3c716dbc1cc6a857a41e8a6dc93df43087352ff023dab14df5ada03fb3e85e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.2.1/wpiutil-cpp-2023.2.1-linuxathena.zip",
        sha256 = "c29aaf6d07ac8bcf8a468846d94ba50a1f858546af741eb78c381e1b1e9fa4ce",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.2.1/wpiutil-cpp-2023.2.1-linuxathenastatic.zip",
        sha256 = "98cfb2ea5473578ef9f85e1ca671dfda4c941aae72ed665f9719191f158f29d9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.2.1/wpiutil-cpp-2023.2.1-linuxathenadebug.zip",
        sha256 = "aaaa90fb65f2a5681b23f9117d36ba7f41e5a587e3aa6abd4b06ea9ef0f85756",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.2.1/wpiutil-cpp-2023.2.1-linuxathenastaticdebug.zip",
        sha256 = "9efe136f2a55de6154f6022ace26da3177d93e1f32ba387603d9c840e0ffa9b3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.2.1/wpinet-cpp-2023.2.1-headers.zip",
        sha256 = "29abca6f47ec3344c69bdcebd9b46694b251091228e13d86a38f8e41881f34af",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.2.1/wpinet-cpp-2023.2.1-sources.zip",
        sha256 = "f4a46ac4235a3927adba44eab9e71c9533b5a0e88c675d29bd843826063c67a8",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.2.1/wpinet-cpp-2023.2.1-linuxarm32.zip",
        sha256 = "4d11cff61c0bf7cccf9f1600f6afa38b68fae96326c52cd8fee27b464cbd285c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.2.1/wpinet-cpp-2023.2.1-linuxarm64.zip",
        sha256 = "e23638c709d0a4cc7ff86bdcf3a28b7a27070af04a81e20b97197bee52dcd2f7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.2.1/wpinet-cpp-2023.2.1-linuxx86-64.zip",
        sha256 = "b7cade9bc6d917554d2e59f7a8250c6b4ac8f86e9b8fa63996c7f3038c4148ab",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.2.1/wpinet-cpp-2023.2.1-osxuniversal.zip",
        sha256 = "d3bf05cb4db9b3823a9ce0781717a3289b0bae525b2e2f48850416fda1ec1f32",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.2.1/wpinet-cpp-2023.2.1-windowsx86-64.zip",
        sha256 = "8dff23b12e1886a6c73f9eebabc67b0f494de61a5148ed33c39dfa5fbbbcc013",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.2.1/wpinet-cpp-2023.2.1-linuxarm32static.zip",
        sha256 = "8f0a341253a47ed24576917a72ba115680d5450b1220589144d6c27da4d86a90",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.2.1/wpinet-cpp-2023.2.1-linuxarm64static.zip",
        sha256 = "5619a31e7bde7488a55525fd5e0b74a242ccea8d249f7e7eabfd22628e2dc44c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.2.1/wpinet-cpp-2023.2.1-linuxx86-64static.zip",
        sha256 = "af3a3ab81d83b8348d9c41705c7be75949be67464d724b79cda4a17f764c8ce2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.2.1/wpinet-cpp-2023.2.1-osxuniversalstatic.zip",
        sha256 = "d7ecc29dcd924a866b84d9da2dddf4c1c2eba8027b378c63664a6b21c036def7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.2.1/wpinet-cpp-2023.2.1-windowsx86-64static.zip",
        sha256 = "f6fac21d9aaa13414c6728939032ad62704ac4e47a6bcf490116bdf6907f67bc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.2.1/wpinet-cpp-2023.2.1-linuxarm32debug.zip",
        sha256 = "c96c91abfd348fc35da98a952a5e89ebd4d15704dfbeca25ae8f29f7ca35286f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.2.1/wpinet-cpp-2023.2.1-linuxarm64debug.zip",
        sha256 = "a894e6434f85931520f06cd848d25fe8e5d6ca4a4626bb66284f193d0bf98060",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.2.1/wpinet-cpp-2023.2.1-linuxx86-64debug.zip",
        sha256 = "70102e51f6b4c0eee5df98f747bbd0b081c65f67c570ac66c166be80a65765cc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.2.1/wpinet-cpp-2023.2.1-osxuniversaldebug.zip",
        sha256 = "2aa7c0b508801261a75254cfac31775ad341ba15ab168a974a804a0f1ccf3441",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.2.1/wpinet-cpp-2023.2.1-windowsx86-64debug.zip",
        sha256 = "f497b002469bfbb2398713770cff8f392d9461e75ec2b293b0b8c7fadfb76064",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.2.1/wpinet-cpp-2023.2.1-linuxarm32staticdebug.zip",
        sha256 = "fa45b6f15458c588bcb795e697141dab5b22ebb3310608e5caf7e843e30e6134",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.2.1/wpinet-cpp-2023.2.1-linuxarm64staticdebug.zip",
        sha256 = "c29792e7595acac1f9d91c97432acba6415f28dbd90a7cc966a25a3959316ed5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.2.1/wpinet-cpp-2023.2.1-linuxx86-64staticdebug.zip",
        sha256 = "41304865cc1f03961caf371168e876e990b1292e622367a2e5695d581aa1ef32",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.2.1/wpinet-cpp-2023.2.1-osxuniversalstaticdebug.zip",
        sha256 = "d258ea082f88fc34fd44f80d6377863c8935291422f0644edad232c3fc0a2bcb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.2.1/wpinet-cpp-2023.2.1-windowsx86-64staticdebug.zip",
        sha256 = "5be55c376660dc8ba2f9875bd17a5d426ea9f4d09fda31fa5c4285beb74fa522",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.2.1/wpinet-cpp-2023.2.1-linuxathena.zip",
        sha256 = "399ccf2f337c07dcd45d249532aa9327084ff45a38b448aae6dcc9020ac8835b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.2.1/wpinet-cpp-2023.2.1-linuxathenastatic.zip",
        sha256 = "5eff9c138ab0e4b9c2ccae5f65d91b2496ddbe9b48e9e9cffc662479ac046b27",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.2.1/wpinet-cpp-2023.2.1-linuxathenadebug.zip",
        sha256 = "ad828ca652044aacfb2df39175cf5615b1db52fe9760d13a28dae94d7d765c38",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.2.1/wpinet-cpp-2023.2.1-linuxathenastaticdebug.zip",
        sha256 = "f58b8d4667772a8b822174c01997ca2556f198a232d423eab7f98991466549a6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.2.1/wpimath-cpp-2023.2.1-headers.zip",
        sha256 = "707192001c0684479e10d741e9678ca47019e70e12d5c3c1ad478e34df71f9de",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.2.1/wpimath-cpp-2023.2.1-sources.zip",
        sha256 = "ddac37d1c5bc89aee76745e2ed386d927683f98e29aa81d6fdecc6d28f14b5d0",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.2.1/wpimath-cpp-2023.2.1-linuxarm32.zip",
        sha256 = "bb29dc0418002e17134ed80dda19990747b827cfd874abb4e0ec93e5e93e6920",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.2.1/wpimath-cpp-2023.2.1-linuxarm64.zip",
        sha256 = "42c94e21309dea3903e22198a1e02d77689282b477729d21053d59b64ee259e6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.2.1/wpimath-cpp-2023.2.1-linuxx86-64.zip",
        sha256 = "42bb20147dc6b6fc7c670eb075d827452a654f49722220ac6b703ff74e18595b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.2.1/wpimath-cpp-2023.2.1-osxuniversal.zip",
        sha256 = "9b219388717a04a74e5476ed5d19b5551c059b67d02feff058882949e0fb3949",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.2.1/wpimath-cpp-2023.2.1-windowsx86-64.zip",
        sha256 = "37b8173a1e10121a729787679ea9a2331299bdf80c92928e60b4653c824c9607",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.2.1/wpimath-cpp-2023.2.1-linuxarm32static.zip",
        sha256 = "5308c38a8e1cf83f0c8b98d17f5c0bdd58c4289482761bd5a4dd30b81dac051d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.2.1/wpimath-cpp-2023.2.1-linuxarm64static.zip",
        sha256 = "9c53d726cea91c8e6b0a00a992f997d6effe20076e78b9c9d8d99b9a5c4d4175",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.2.1/wpimath-cpp-2023.2.1-linuxx86-64static.zip",
        sha256 = "ab1b82757a053e335d7e2e55304d19435646683bf84447c426436861746944cc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.2.1/wpimath-cpp-2023.2.1-osxuniversalstatic.zip",
        sha256 = "632b684a0bf124fa26e347a6d007df7ce2a63609a57f467d1707e69f64ce6062",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.2.1/wpimath-cpp-2023.2.1-windowsx86-64static.zip",
        sha256 = "f4746983c27fb911bdaaeb5d31883bf54994f4964fb25483bb9bdee8dc2b410e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.2.1/wpimath-cpp-2023.2.1-linuxarm32debug.zip",
        sha256 = "827d5ec5b8336d62e665a09f481627929edf72a90e398395604fb130aebce044",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.2.1/wpimath-cpp-2023.2.1-linuxarm64debug.zip",
        sha256 = "46d9189b49e51b2e251ad65d5cee8d013d42792cccb6de94bbc7f5fe5f0cb05a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.2.1/wpimath-cpp-2023.2.1-linuxx86-64debug.zip",
        sha256 = "dd98ade7ee7a104d4cb0c14bcf17ed0c2eccd7846a7bfa21918d985b493fde99",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.2.1/wpimath-cpp-2023.2.1-osxuniversaldebug.zip",
        sha256 = "5cce9e9d4238ab16260f07cf6da8e953acd12a66d2db03bdb07abdeacf5b4cd1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.2.1/wpimath-cpp-2023.2.1-windowsx86-64debug.zip",
        sha256 = "66d31d894021370da4250c86b87dd69981b972fea8cbb8ee08c21d5e4aa2d9d8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.2.1/wpimath-cpp-2023.2.1-linuxarm32staticdebug.zip",
        sha256 = "6b2c9ad430dd7708b08c48f5f1397e010fe7c11f45e096e7ebc28c310c70d3a6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.2.1/wpimath-cpp-2023.2.1-linuxarm64staticdebug.zip",
        sha256 = "50d7628d6f329cc206543f16e47c3b1583a290570260e98238ab9b3bfc4b52ac",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.2.1/wpimath-cpp-2023.2.1-linuxx86-64staticdebug.zip",
        sha256 = "c74092e752049d15ccb8bba20fc0a9deaf49cafd4a07132239c46d78b957596d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.2.1/wpimath-cpp-2023.2.1-osxuniversalstaticdebug.zip",
        sha256 = "5f09ebbd5b28f400a7701ebd2f8ead2fd1f92c0f72d8cbea64d10e6a184eb31f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.2.1/wpimath-cpp-2023.2.1-windowsx86-64staticdebug.zip",
        sha256 = "1e12c953d817004dcc58cec484a9227cd4418975efe0ebee51e19a980416e080",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.2.1/wpimath-cpp-2023.2.1-linuxathena.zip",
        sha256 = "4d2b0a7048e70f9625454ddb600446de97e33da577258c1e7b67abaa911393f3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.2.1/wpimath-cpp-2023.2.1-linuxathenastatic.zip",
        sha256 = "031ec3a76d328406f1a762141a2d2fdb16fc0c2c34b8b02224cb27b3ebfc7832",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.2.1/wpimath-cpp-2023.2.1-linuxathenadebug.zip",
        sha256 = "44f4da84d2bcf4dfa9ad219a83e8b55f11ec5552572118c4a62757d3858ecd91",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.2.1/wpimath-cpp-2023.2.1-linuxathenastaticdebug.zip",
        sha256 = "0ceaeb15f500d29d6e46ab56e4a0b30fdc7ef669db57359d6f6b2a970d819fec",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.2.1/apriltag-cpp-2023.2.1-headers.zip",
        sha256 = "2a4a4cdb6cec52147f6395e40a4da013a72a2765dc3c0ccf4c890d0f2f945152",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.2.1/apriltag-cpp-2023.2.1-sources.zip",
        sha256 = "e1a327a5a198d15d38458215d12d60afc19cb33bfa2f6f7ae8d16b5cbe4d1ce8",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.2.1/apriltag-cpp-2023.2.1-linuxarm32.zip",
        sha256 = "6a7519d1f1847cfb32819ba167b6ab07020d729b4ce8cb91bb9a6e4e43fc1eb1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.2.1/apriltag-cpp-2023.2.1-linuxarm64.zip",
        sha256 = "55c6eed92c1f2d9e3ffe687d671096ff6de5ef6ad5fc632c7880b3c5ff60b85d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.2.1/apriltag-cpp-2023.2.1-linuxx86-64.zip",
        sha256 = "2da56f8e3eaa618353e7145946e80a12821e438e4bd9dcf6f29db8f12adcdde3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.2.1/apriltag-cpp-2023.2.1-osxuniversal.zip",
        sha256 = "0fae56a4355e99389a9f83e33d2ff8e41ee9778bc5f77f1cbac7b7dd8f562d65",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.2.1/apriltag-cpp-2023.2.1-windowsx86-64.zip",
        sha256 = "ebbf9e10950080ed670ef78db6a7c48a9f0bf50a3dfc540f7eef01858fc132e5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.2.1/apriltag-cpp-2023.2.1-linuxarm32static.zip",
        sha256 = "6153eb3ca114e138e632e8233e6a3fb0721e40d4350b3e64a7f392789d3e0b11",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.2.1/apriltag-cpp-2023.2.1-linuxarm64static.zip",
        sha256 = "24a933d4c20226c0280368706e4acb72b9e2e164ef0fef29d98bfb0492f50129",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.2.1/apriltag-cpp-2023.2.1-linuxx86-64static.zip",
        sha256 = "3abec4a4bf9c193a138cec415ed5a813aac6c5145deff30c0d626c123e2a93f7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.2.1/apriltag-cpp-2023.2.1-osxuniversalstatic.zip",
        sha256 = "c329182bfbe174c36a3149ee9a44e07128185d259b99b6841c04bb0127c7877d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.2.1/apriltag-cpp-2023.2.1-windowsx86-64static.zip",
        sha256 = "cbd633de0f2dbfd199097f55fb9d71551e2b9b6beb31e5c2483fa5b97dc4f853",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.2.1/apriltag-cpp-2023.2.1-linuxarm32debug.zip",
        sha256 = "a5510feb83fe2c48f0b1500e4d1e8df9dba4e41f3cb51b41cb352207e71ab42a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.2.1/apriltag-cpp-2023.2.1-linuxarm64debug.zip",
        sha256 = "defb8aecb87ab652a428b7e98764173e9899c4c87b4557ff20b1729d9bd139bb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.2.1/apriltag-cpp-2023.2.1-linuxx86-64debug.zip",
        sha256 = "684ff12fb5d1182164505c8197542d3538dcfbe324d74656809b4dc20d3aa351",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.2.1/apriltag-cpp-2023.2.1-osxuniversaldebug.zip",
        sha256 = "02f04c89de556ea303a72877315206f75b66c1e97b857e27d34d389b141fe281",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.2.1/apriltag-cpp-2023.2.1-windowsx86-64debug.zip",
        sha256 = "18156b4a8f26a8a648b0167a36bb2ba2c818c03477673bbc004c8bf39a91fab5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.2.1/apriltag-cpp-2023.2.1-linuxarm32staticdebug.zip",
        sha256 = "971d0bb1aac0d97e5d6bc4a4aec2fc45d9f9aae3fc517db6d1738a6011b8e6d0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.2.1/apriltag-cpp-2023.2.1-linuxarm64staticdebug.zip",
        sha256 = "a873809d84d062a1b9e70fc29acf9ddf6f2479bdc1c6dedbf19c35881c564695",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.2.1/apriltag-cpp-2023.2.1-linuxx86-64staticdebug.zip",
        sha256 = "89dd6530b13200c79f657d000a6bb32c2744de4326a8fdcb94afe1e4719e5121",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.2.1/apriltag-cpp-2023.2.1-osxuniversalstaticdebug.zip",
        sha256 = "4af80de5979b16296d15d217c805e9166c747e6f9c944d5a169935c0cc998d90",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.2.1/apriltag-cpp-2023.2.1-windowsx86-64staticdebug.zip",
        sha256 = "16d53c003c2c24ae2975b19af71a6911f7fafa5f99a4351cec336357a49d4ba1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.2.1/apriltag-cpp-2023.2.1-linuxathena.zip",
        sha256 = "93cd030867d79cf90df89cc0e9e70246af52df99be482f41031b12eb6659653a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.2.1/apriltag-cpp-2023.2.1-linuxathenastatic.zip",
        sha256 = "6c80cad3f412efb1bbd1371925c5bbf57279c5ff239a79dafddd8fa29a72018a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.2.1/apriltag-cpp-2023.2.1-linuxathenadebug.zip",
        sha256 = "b13592233d6e504528c69204d05f4845753cd05191298869f103f2d8595a3684",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.2.1/apriltag-cpp-2023.2.1-linuxathenastaticdebug.zip",
        sha256 = "19dfbe23755e0c58df677ce78fc259e0ad83ce6e7a4f9eae1b436f7d5d7e0d84",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.2.1/hal-cpp-2023.2.1-headers.zip",
        sha256 = "82ed32e473e6d5dff927634aea2a7ecd6d54617d746d6343b9cb203d049995cb",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.2.1/hal-cpp-2023.2.1-sources.zip",
        sha256 = "d5f902dba39fbee3bcc98a3d164c26957ef7127339f185dd85db582206bb4b0f",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.2.1/hal-cpp-2023.2.1-linuxarm32.zip",
        sha256 = "20612b3538ee10c744fe6fa17747b89489965696dc86bd85683cdaea2a4c2bc3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.2.1/hal-cpp-2023.2.1-linuxarm64.zip",
        sha256 = "1d2789fc05a62445d7032f8996b4fdda00fa1230dac7257190b6d525eb5fb383",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.2.1/hal-cpp-2023.2.1-linuxx86-64.zip",
        sha256 = "87ca1d0be49cea39d3ef1cc3ba621418312b1ec9dd056c11d077b993466449d1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.2.1/hal-cpp-2023.2.1-osxuniversal.zip",
        sha256 = "e05457001475cf36af537391d51c4fc3fdd6fa9db49e5c75df455b1a31cab894",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.2.1/hal-cpp-2023.2.1-windowsx86-64.zip",
        sha256 = "cd37843d27a105de752446db88981c764c0bf10d41c26458f061f54dda12dcf8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.2.1/hal-cpp-2023.2.1-linuxarm32static.zip",
        sha256 = "f526328c564945f6ea4971c7751246c7dc9634e4d2bb61f8028d2d2743477d3d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.2.1/hal-cpp-2023.2.1-linuxarm64static.zip",
        sha256 = "a045dd37345884e33803289802ec3db4e9c8b53ee8131c028352e794f80dec27",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.2.1/hal-cpp-2023.2.1-linuxx86-64static.zip",
        sha256 = "8e389d7e6e58f9cd219042e65c4477722a17d1ec4b2d065d4c7f61f45a2ea116",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.2.1/hal-cpp-2023.2.1-osxuniversalstatic.zip",
        sha256 = "282d1a0e8c17b7a6bcbddf477dc6917615221b90607b2cce7a6db3f6f51b211f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.2.1/hal-cpp-2023.2.1-windowsx86-64static.zip",
        sha256 = "39ba49fbdbc7303506e26cf1aaa5e23976e6a37bdad1b4971e206b68e7e96f62",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.2.1/hal-cpp-2023.2.1-linuxarm32debug.zip",
        sha256 = "fe659814aa56cbc6ae5d841e6c2868e6d3fc1439d7b135204a241dd4e08f984d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.2.1/hal-cpp-2023.2.1-linuxarm64debug.zip",
        sha256 = "968fe8c4e9c6c0478944f6acc7769501ae18a2a14efa6398dd68a6f5ddeaf3b4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.2.1/hal-cpp-2023.2.1-linuxx86-64debug.zip",
        sha256 = "603c79d254f348853818a62020cb047b6de143444c06fc82e5d4933c2dbf232c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.2.1/hal-cpp-2023.2.1-osxuniversaldebug.zip",
        sha256 = "0fda207f8f7ed6d8e9ac1918e6d407ec0cd075c2549034726e275361d69a86ca",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.2.1/hal-cpp-2023.2.1-windowsx86-64debug.zip",
        sha256 = "6359a856881b01d38dd13da24b89030aa6410f10f47fb58c4c633d7e6c123050",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.2.1/hal-cpp-2023.2.1-linuxarm32staticdebug.zip",
        sha256 = "6fe7ed5035748a47e72e31498b07ba033576b94302dca5fa5283f1d0ffc49b2e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.2.1/hal-cpp-2023.2.1-linuxarm64staticdebug.zip",
        sha256 = "0251c8fb1064129983fbb82a96ba33b562cb46d6e03f7b2971dda385d5557b91",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.2.1/hal-cpp-2023.2.1-linuxx86-64staticdebug.zip",
        sha256 = "ddff98fea2dab798bd264f917d0008a8c99bd41d92acdcdf415f76532b1cb499",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.2.1/hal-cpp-2023.2.1-osxuniversalstaticdebug.zip",
        sha256 = "9b5f9dacc51423256d16c2fba2b56a2605cba694c3cbf087124273c50f8ba46f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.2.1/hal-cpp-2023.2.1-windowsx86-64staticdebug.zip",
        sha256 = "3a3d030fb15e91a00f5e3f97308754aba2cfc027ab9c6ca1754e426ace3f6dc8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.2.1/hal-cpp-2023.2.1-linuxathena.zip",
        sha256 = "d595685215548e409a6624a3a74f7c83cb37a777e1c17fc3efa1a1ce7920beb7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.2.1/hal-cpp-2023.2.1-linuxathenastatic.zip",
        sha256 = "f76935861c4de14dbe97986be70bedcdd17e2a48f63c32300b050ac8c2c93257",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.2.1/hal-cpp-2023.2.1-linuxathenadebug.zip",
        sha256 = "e2fbf79579fa669dc3d5bab04aa9d9dc4123b3ac4aeca830cd1063a419824ac5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.2.1/hal-cpp-2023.2.1-linuxathenastaticdebug.zip",
        sha256 = "0ffe4386ae9fe0461ea355be894326717cee83f00c58d1b557753df17a619ccd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.2.1/ntcore-cpp-2023.2.1-headers.zip",
        sha256 = "c88c136575bca8a6820f44f1875210a9a145c953861a52a94d3f8d10f1b2e432",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.2.1/ntcore-cpp-2023.2.1-sources.zip",
        sha256 = "0e51cd466bfa446b198cb16491ceee932944bd83797643cd2a7fcac522d1fdfc",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.2.1/ntcore-cpp-2023.2.1-linuxarm32.zip",
        sha256 = "865e599ded10cb309377e93f3c6f80d43b9cff17812f754068664837f04c7d49",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.2.1/ntcore-cpp-2023.2.1-linuxarm64.zip",
        sha256 = "3658e1b27fdf8e4a35fe4370eeaf7980e262d27039199d63a321590e0df4bab8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.2.1/ntcore-cpp-2023.2.1-linuxx86-64.zip",
        sha256 = "3187c5e6dffb22690bd58904e83a82db51715b09ee8132cbc9b4b9627431e2ff",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.2.1/ntcore-cpp-2023.2.1-osxuniversal.zip",
        sha256 = "e6975257d7002a5a1962b6bcfb41d576de5d1abc447a8ed481ad5b3979c34517",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.2.1/ntcore-cpp-2023.2.1-windowsx86-64.zip",
        sha256 = "6660760e6a59b5fe81770529515bd15867c9b92cda21f040e4b303d33f286cc2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.2.1/ntcore-cpp-2023.2.1-linuxarm32static.zip",
        sha256 = "16cdc0005c9460a0eb66f2076aeedad0697516c43856d5d5e2c566c319ded471",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.2.1/ntcore-cpp-2023.2.1-linuxarm64static.zip",
        sha256 = "b7aabdcaa3c7971c1ba716fa06f8c04e3489e36d6af00403a0de4adc555c6109",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.2.1/ntcore-cpp-2023.2.1-linuxx86-64static.zip",
        sha256 = "3b777c0c24f5defdc7440361a086fec28dac2aa459aa88089908a422a85c7434",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.2.1/ntcore-cpp-2023.2.1-osxuniversalstatic.zip",
        sha256 = "0b10e032af48305cc079c6bf9e018d9f2102bc565d38429c1271e7f0288cdaf6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.2.1/ntcore-cpp-2023.2.1-windowsx86-64static.zip",
        sha256 = "9e076c27d9ad27db2ce10e876a93d65b7c4e838f095159d19da544e5d5ae4b10",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.2.1/ntcore-cpp-2023.2.1-linuxarm32debug.zip",
        sha256 = "5938971f2a68ea8946d506755f1f8738962f0212e96179d593aabebb6a62634c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.2.1/ntcore-cpp-2023.2.1-linuxarm64debug.zip",
        sha256 = "59790339f8492d526df6fbbd2b738f52a98107de5931c7cc0f47fb43184b572a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.2.1/ntcore-cpp-2023.2.1-linuxx86-64debug.zip",
        sha256 = "f1c15ad5704e3853429628c51d5c86e24a5e849e2856213809fb1c8a1b3801cf",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.2.1/ntcore-cpp-2023.2.1-osxuniversaldebug.zip",
        sha256 = "44f39dd4c3051fcb7a1c5089415bff5c2fd836f79010612335b87b92c6e59397",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.2.1/ntcore-cpp-2023.2.1-windowsx86-64debug.zip",
        sha256 = "2704732123f3923e5176fd4095e5ee44c3937cf0f2dfe430dbee17d2801235e3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.2.1/ntcore-cpp-2023.2.1-linuxarm32staticdebug.zip",
        sha256 = "247487ed52069cfc601c0962d7afda7ff5d78469cdd987b6e897a14cc74edeac",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.2.1/ntcore-cpp-2023.2.1-linuxarm64staticdebug.zip",
        sha256 = "9a9935333fa0abde22bf7d7b13b00ffc3ac4aa6ea6538ea7056696f2c1d00a5f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.2.1/ntcore-cpp-2023.2.1-linuxx86-64staticdebug.zip",
        sha256 = "9085d06329d4426b329cbf06436d3925a79c3832f54d672ad7fdf125e298ee68",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.2.1/ntcore-cpp-2023.2.1-osxuniversalstaticdebug.zip",
        sha256 = "3dbf127bd719ae968c40ddc504371848664b65f67c070ddb3e3ed6fded914b5b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.2.1/ntcore-cpp-2023.2.1-windowsx86-64staticdebug.zip",
        sha256 = "353da2dd8e289b19513bd09d20ce8885c611b74550762e6d938a0a79393b1794",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.2.1/ntcore-cpp-2023.2.1-linuxathena.zip",
        sha256 = "1a78954cc4de31322fa38b5b9a53252aa375f0825b5fb2829419546d276a2b89",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.2.1/ntcore-cpp-2023.2.1-linuxathenastatic.zip",
        sha256 = "1d5612dd30a6075f3c901d9513191506e7657170efa437bb3fd427b9c9d1cf85",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.2.1/ntcore-cpp-2023.2.1-linuxathenadebug.zip",
        sha256 = "050b941fb67f1191456756ffb6d15fd0d3e3b216d86f74b1d983f6a60eedf130",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.2.1/ntcore-cpp-2023.2.1-linuxathenastaticdebug.zip",
        sha256 = "34f80431c53e82d40b51e73450fa0ef537ae33aa0b124750fe9eb00a57c66955",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.2.1/cscore-cpp-2023.2.1-headers.zip",
        sha256 = "4a470f9235a0b3b75fde844ea637ff876b319f073be1008890335fa5995d7424",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.2.1/cscore-cpp-2023.2.1-sources.zip",
        sha256 = "b40154b2c4f9689f976c10c8bf32a963fee784a6670e31b24be0ee84020d8510",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.2.1/cscore-cpp-2023.2.1-linuxarm32.zip",
        sha256 = "3da50c7b432c2e2d1de0801afac08e2bfc75035a452f0bbd71b0f88ab45a8b4e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.2.1/cscore-cpp-2023.2.1-linuxarm64.zip",
        sha256 = "1f67efedba3a634653790ee67c9c866b44bbb98f52aaabf7c96c885c303654ab",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.2.1/cscore-cpp-2023.2.1-linuxx86-64.zip",
        sha256 = "79b981d9042427da4393f9d084dcdb5c2282a9b4ac588c5d6af584730af63f8e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.2.1/cscore-cpp-2023.2.1-osxuniversal.zip",
        sha256 = "d84df28ac1be53b61db93e0a2dfc95f18a7052c94b0b257deb00141c79c6ad3a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.2.1/cscore-cpp-2023.2.1-windowsx86-64.zip",
        sha256 = "601ba82f8044cefbb62a57e39318104b8d0d68d09f045c14e885cf46ca3175c2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.2.1/cscore-cpp-2023.2.1-linuxarm32static.zip",
        sha256 = "0bb9d272f075f0fa98e61b04407cc8fb62753a1c43f0f76c74cf096748c6d807",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.2.1/cscore-cpp-2023.2.1-linuxarm64static.zip",
        sha256 = "34ab780b0a1e734df87500af112520873ce9886bd657988f371539bfdc7dd7a5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.2.1/cscore-cpp-2023.2.1-linuxx86-64static.zip",
        sha256 = "da8b00ce01d017216c259c2c1c5ca29b065989ae02ff8d67dd44c4ade02c2bac",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.2.1/cscore-cpp-2023.2.1-osxuniversalstatic.zip",
        sha256 = "08970cc9173b56642d661a90b3fa7446bad2f503c60bc98c67b23d91da9d90fd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.2.1/cscore-cpp-2023.2.1-windowsx86-64static.zip",
        sha256 = "0b458e2d564162698e75621fa8921c9518e0fa0897ad59d4a5925f4a0d888e02",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.2.1/cscore-cpp-2023.2.1-linuxarm32debug.zip",
        sha256 = "17af2bf8d6ebc6f45188734332d994804312228873ac1c2d93561b6493c9ecb6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.2.1/cscore-cpp-2023.2.1-linuxarm64debug.zip",
        sha256 = "706fa8e910460d6b745898d221aa431c138a5c63c96846f0e69793bd87718577",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.2.1/cscore-cpp-2023.2.1-linuxx86-64debug.zip",
        sha256 = "bd4fc7a13ff0fe4e031e3dd18352028753f0456cf27ab741607556a76f43d60b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.2.1/cscore-cpp-2023.2.1-osxuniversaldebug.zip",
        sha256 = "07f9a66a66760ee6eb993dee47ecb89cbacb0cf36f4c8bf9fbaa721506989bf2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.2.1/cscore-cpp-2023.2.1-windowsx86-64debug.zip",
        sha256 = "862e82fa09e11148d8647e53bdef316f9ea002fc351bb65ae998e2c53616f3df",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.2.1/cscore-cpp-2023.2.1-linuxarm32staticdebug.zip",
        sha256 = "a86eece13b3f87f9fc4bfd1fd17c2c759e01017a658f5202a46faed32c17102b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.2.1/cscore-cpp-2023.2.1-linuxarm64staticdebug.zip",
        sha256 = "6836431ca1556873b9f7dc8ea767d120b1d6ed834fb4daf97a2063838560b121",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.2.1/cscore-cpp-2023.2.1-linuxx86-64staticdebug.zip",
        sha256 = "dbdd695b9481dcb9fb23c9ebe444addc3d5e953ff6e551f8316962c53362774b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.2.1/cscore-cpp-2023.2.1-osxuniversalstaticdebug.zip",
        sha256 = "0a4d4cc81aa801f6f044a7aefe3c5245fbf83045ea683bce44ccaf322c273a07",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.2.1/cscore-cpp-2023.2.1-windowsx86-64staticdebug.zip",
        sha256 = "90887a7dcdbe61a26f3099306e101b58dd691b18cc61e3f86cabb018f77c4580",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.2.1/cscore-cpp-2023.2.1-linuxathena.zip",
        sha256 = "3fc05c54919959efcbef822a0591aef25250b5397341e4d0015deb4693737ee4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.2.1/cscore-cpp-2023.2.1-linuxathenastatic.zip",
        sha256 = "b0ccee2c511b716300d74ec3823e0a1c49ca9ae5e590bb7678bf9a08e549f6bf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.2.1/cscore-cpp-2023.2.1-linuxathenadebug.zip",
        sha256 = "01b66e6bb8b96a59cd73bbd75f65f45c9a934a6adb0c6398f7b307b019784d6d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.2.1/cscore-cpp-2023.2.1-linuxathenastaticdebug.zip",
        sha256 = "9c9f75a66ed994bac1fb267ae5d9f5a963f777f050377ae1edfd97dcd3ca6c05",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.2.1/cameraserver-cpp-2023.2.1-headers.zip",
        sha256 = "e7f11d5ba3860e0168e554c27778285eb0a375dc17d12925d7070325facafb16",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.2.1/cameraserver-cpp-2023.2.1-sources.zip",
        sha256 = "95f9fa81e3101c401e8ff55b49260edaa232738f848f4a0c1f966c352450bdd0",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.2.1/cameraserver-cpp-2023.2.1-linuxarm32.zip",
        sha256 = "b1be967f13501f97ded35618df213ea58aee5e060bb01caf450c64897f9eae7a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.2.1/cameraserver-cpp-2023.2.1-linuxarm64.zip",
        sha256 = "60e0db43b3db2066980e4dec589aad0a4219a19dd67c69fc2672f159530151ec",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.2.1/cameraserver-cpp-2023.2.1-linuxx86-64.zip",
        sha256 = "3fa82824adc35714284728ccda8c176769a5be7cdb0c55a8184a60a15b962a92",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.2.1/cameraserver-cpp-2023.2.1-osxuniversal.zip",
        sha256 = "77b784eef30324176d2f087d026371f59b985637ec551960b0e8649beef2deac",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.2.1/cameraserver-cpp-2023.2.1-windowsx86-64.zip",
        sha256 = "5424b94e40e578c322860e3e20c0d768c45d8e94de8ce2bd364478a9a81e8cd5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.2.1/cameraserver-cpp-2023.2.1-linuxarm32static.zip",
        sha256 = "c6d6ede11ad88a7007a1fda9e017f2b97fe7c3e706952b578d00678114c87bd6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.2.1/cameraserver-cpp-2023.2.1-linuxarm64static.zip",
        sha256 = "4dce8ad24bc766bef5a60fe72aa0f4f0fc920ebda36cb9390da4c2993dd79b27",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.2.1/cameraserver-cpp-2023.2.1-linuxx86-64static.zip",
        sha256 = "e8b9f4070040361b05a682ef7e48914024db82eb21c14bdba72408283dc445f0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.2.1/cameraserver-cpp-2023.2.1-osxuniversalstatic.zip",
        sha256 = "b4f329acc1841235776056f3e2d49f6dd1d2d1903cd37adfc37b741e44f56a5e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.2.1/cameraserver-cpp-2023.2.1-windowsx86-64static.zip",
        sha256 = "d192a0a844a8f691f6a7888c0ae87e7026fbfcc4be43e3d2b0350aa71abe570b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.2.1/cameraserver-cpp-2023.2.1-linuxarm32debug.zip",
        sha256 = "1160d821ae44105e40f7940e2e99fc31f45ad1589b8b3ea12e6151e79f7e7c8e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.2.1/cameraserver-cpp-2023.2.1-linuxarm64debug.zip",
        sha256 = "436e42523719035acff589ac2bd2efb639b6ecb0c8316841a2d20f7c748f64b8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.2.1/cameraserver-cpp-2023.2.1-linuxx86-64debug.zip",
        sha256 = "78a2b13ec133e03a1937a18774e4fbf7f95a9c3adadb87e2c5589990840da135",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.2.1/cameraserver-cpp-2023.2.1-osxuniversaldebug.zip",
        sha256 = "9af475b64e068bd97fd8e186af5f467533c9fe8fb2c4b7a4e851aa902633087f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.2.1/cameraserver-cpp-2023.2.1-windowsx86-64debug.zip",
        sha256 = "3b0b3e655d493f0562682cfd2444c42678cd80f1ca0431e9bf488eeaf4af6f1e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.2.1/cameraserver-cpp-2023.2.1-linuxarm32staticdebug.zip",
        sha256 = "86fb8be39958b53e6e166da248d3826a376acd65774fda08dbfea886e21944b9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.2.1/cameraserver-cpp-2023.2.1-linuxarm64staticdebug.zip",
        sha256 = "7c2c1de2d8fbedeff900d6f3b65b3d47c645ef7161fa4282bd059bb9a881eb87",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.2.1/cameraserver-cpp-2023.2.1-linuxx86-64staticdebug.zip",
        sha256 = "e7f3fdbe74687b679dd9469cad179fbf942a94b45dcd83244f763cb4f0490e18",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.2.1/cameraserver-cpp-2023.2.1-osxuniversalstaticdebug.zip",
        sha256 = "44c0ba7ba038fb7cefb40fb4db49f463cf0172d5338577d54117f1c582a26470",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.2.1/cameraserver-cpp-2023.2.1-windowsx86-64staticdebug.zip",
        sha256 = "a3b3418329e9085e3bcc0fc030c52f42330140afa4013c0bab7dc3c58b5f605e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.2.1/cameraserver-cpp-2023.2.1-linuxathena.zip",
        sha256 = "c98b34f8e05142d3eeb18af64e35a8fa26f15d98fb2f5b620c269fbaa354d8c4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.2.1/cameraserver-cpp-2023.2.1-linuxathenastatic.zip",
        sha256 = "275e0545ad1a68f53c68299f1df086b95b8bb21990a9c988c0d1e6606568d3b0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.2.1/cameraserver-cpp-2023.2.1-linuxathenadebug.zip",
        sha256 = "8c2d869c6ad0e04722cc5b5f4e4be5e094f0aaa69b09d6e402a09e7156686f72",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.2.1/cameraserver-cpp-2023.2.1-linuxathenastaticdebug.zip",
        sha256 = "a04cc2837397c31e8caa095710850996bd0651b63bb02966b4e2d74c08547eb2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.2.1/wpilibc-cpp-2023.2.1-headers.zip",
        sha256 = "6e8a13ec031b66201432cb3d7dac8c90841acc3b3ff329b14cf08038c5f7d4f3",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.2.1/wpilibc-cpp-2023.2.1-sources.zip",
        sha256 = "ccfe78f62ff4d775ae1fca1315483e44a2ff650fd58ca6ab5a5039017fc4514b",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.2.1/wpilibc-cpp-2023.2.1-linuxarm32.zip",
        sha256 = "b66e97179dec8fa4308c1ff352464e3a4fedca32ad7ba6d870665c7e185fc76e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.2.1/wpilibc-cpp-2023.2.1-linuxarm64.zip",
        sha256 = "39332700d4c6f2bb0861b475d93e72e5648fcd25f87e96457ebc81d66d0930c7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.2.1/wpilibc-cpp-2023.2.1-linuxx86-64.zip",
        sha256 = "432e69e486ffc4fd8eca24b262f252ea1f87fb356cf0876ad35cdebdc52c780f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.2.1/wpilibc-cpp-2023.2.1-osxuniversal.zip",
        sha256 = "9f5bae02d778482a2c62e0cd8afd1aece7da84cc119cf30a515c09fcd84c8734",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.2.1/wpilibc-cpp-2023.2.1-windowsx86-64.zip",
        sha256 = "1e401441e59729277ffb61b829278e9247b1907fa871a25482048b300e38913e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.2.1/wpilibc-cpp-2023.2.1-linuxarm32static.zip",
        sha256 = "e9ee1c0b11137bb374dc3d200d22467ef7fde2c65b8179f0a3bf10b33fbcae2d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.2.1/wpilibc-cpp-2023.2.1-linuxarm64static.zip",
        sha256 = "f764a337d9bdfd22beb198bd6dd31ac0c970ae7f9f54a0ca0cfcf1b06b6c2fc7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.2.1/wpilibc-cpp-2023.2.1-linuxx86-64static.zip",
        sha256 = "8432a9df9f411ce292b6100bd73003eb0432550afb425ae99c694b9030793bfb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.2.1/wpilibc-cpp-2023.2.1-osxuniversalstatic.zip",
        sha256 = "be271eb185ef6b735b22ee8f019e9ebe8f64498219e5d75cb0f7dfccfb76178d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.2.1/wpilibc-cpp-2023.2.1-windowsx86-64static.zip",
        sha256 = "ae5da309aa654244b75621dfeede7c60f92e2d295abd76899be763afc1e0f6bf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.2.1/wpilibc-cpp-2023.2.1-linuxarm32debug.zip",
        sha256 = "8b6753a39996a599c96281d7a88fe33285179c3bf7bce4f15da53f1da587f04e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.2.1/wpilibc-cpp-2023.2.1-linuxarm64debug.zip",
        sha256 = "a778b16c19ad67617b174c0597815e1ac9c399fca1dbf8aabf6fa9e6e8f6c88d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.2.1/wpilibc-cpp-2023.2.1-linuxx86-64debug.zip",
        sha256 = "d03b9c2821a3ef7ffdec8ad4eecb12fce66fd58f878996221cd6684f1b8b1993",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.2.1/wpilibc-cpp-2023.2.1-osxuniversaldebug.zip",
        sha256 = "376b56b5cff14f5fffd5eff10b8486cae209a298e685b458f8e7ec0673604a1d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.2.1/wpilibc-cpp-2023.2.1-windowsx86-64debug.zip",
        sha256 = "ca1287cf1f6f12841899de874461ae18a65a6bb9c2d55cf0ea2064e73cb57f83",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.2.1/wpilibc-cpp-2023.2.1-linuxarm32staticdebug.zip",
        sha256 = "8a5657714f80a3b6f03a8dde5dca4e98870e4ffff55ceb89a3c0da3bd6ecdea5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.2.1/wpilibc-cpp-2023.2.1-linuxarm64staticdebug.zip",
        sha256 = "40217a0a4de6104c6a4dad5649c2d7fa60c4fe6c3c509fea30f2130a40f73cad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.2.1/wpilibc-cpp-2023.2.1-linuxx86-64staticdebug.zip",
        sha256 = "5ce61cf64122ee9c2a3399ed287fb60513332453f19806fe5694c1938992e409",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.2.1/wpilibc-cpp-2023.2.1-osxuniversalstaticdebug.zip",
        sha256 = "58bf8f740955a74dd51d5ab1cc7e570b2f7780bbbb98f050de92cda3c095c89e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.2.1/wpilibc-cpp-2023.2.1-windowsx86-64staticdebug.zip",
        sha256 = "371ef2d993ce70eae4f29090aa18c697c96d9669300ae7d3e8e4814729427547",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.2.1/wpilibc-cpp-2023.2.1-linuxathena.zip",
        sha256 = "5b446eea2652538c6e4c7c2080ba74a201436774929c1a817f3ce959c3c9c4c8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.2.1/wpilibc-cpp-2023.2.1-linuxathenastatic.zip",
        sha256 = "9cb06f18cceb178259a7e29657bcee9bb938d70ada503093d8dad136d2335bfd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.2.1/wpilibc-cpp-2023.2.1-linuxathenadebug.zip",
        sha256 = "3c201f062f555c0fc6a878b1678e6046e4fb28bb0f90a74f7be03edc5161d546",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.2.1/wpilibc-cpp-2023.2.1-linuxathenastaticdebug.zip",
        sha256 = "f83a58a6623ef307f084aee2b6b8fb8bfb50816dcf86eee3a98729d1ccf882e1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.2.1/wpilibNewCommands-cpp-2023.2.1-headers.zip",
        sha256 = "da51f1e32b708f305131c57eb5aac3aa0ba746e141206b19ec8a28ce1afbfaec",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.2.1/wpilibNewCommands-cpp-2023.2.1-sources.zip",
        sha256 = "f8777a80e67126fa41c7492b88027640c4fc2d5409c04a5213b42e099285a87a",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.2.1/wpilibNewCommands-cpp-2023.2.1-linuxarm32.zip",
        sha256 = "5f43953d2b75b83db58cef43aec834707278504597f7577f2eac83f01420a084",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.2.1/wpilibNewCommands-cpp-2023.2.1-linuxarm64.zip",
        sha256 = "8cea2263ac2f9ac1a268abb630e8dcf3b5b0b44808135e3c8bdc63d09de8dbfb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.2.1/wpilibNewCommands-cpp-2023.2.1-linuxx86-64.zip",
        sha256 = "8d432c59959883ee4e7e2811ba2d3702b35966cf8899004bf73f4436531e8978",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.2.1/wpilibNewCommands-cpp-2023.2.1-osxuniversal.zip",
        sha256 = "d767e9e669639396ef5f37e318c3996144a61c578702e889d82df6629b1469c8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.2.1/wpilibNewCommands-cpp-2023.2.1-windowsx86-64.zip",
        sha256 = "282790119b58012eedcca61ce42c5ec8c3809cd156baeb5e9bf3b87fc834da9e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.2.1/wpilibNewCommands-cpp-2023.2.1-linuxarm32static.zip",
        sha256 = "c0d84bbbae369d9e88e5edbefc5e986d6b5da7dba3e929c4b973615c1b3b52f9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.2.1/wpilibNewCommands-cpp-2023.2.1-linuxarm64static.zip",
        sha256 = "63af00c7705f37dc83be416b50ea31612e1a34840eee058356500f803b52ef39",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.2.1/wpilibNewCommands-cpp-2023.2.1-linuxx86-64static.zip",
        sha256 = "3e46a5d7e19c5b916f5be58a2a845459150230dc7faccda9f51f3f901440505b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.2.1/wpilibNewCommands-cpp-2023.2.1-osxuniversalstatic.zip",
        sha256 = "1e07b702263c9ac228e55fe096c6bdb6fa7954f3453186733a6a7e545dba36b2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.2.1/wpilibNewCommands-cpp-2023.2.1-windowsx86-64static.zip",
        sha256 = "43e3f1fa7d6b2f3fd5c74e7923814959bcf76af720e6fcd310f649455bfedf68",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.2.1/wpilibNewCommands-cpp-2023.2.1-linuxarm32debug.zip",
        sha256 = "49a1937df1bd3fd30dd0f147fa160fd526b301a425db412a626ad89e9c317d28",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.2.1/wpilibNewCommands-cpp-2023.2.1-linuxarm64debug.zip",
        sha256 = "59302d680fbad118135149abca42f686eb33565c3a95dc010c27cdef8f62617b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.2.1/wpilibNewCommands-cpp-2023.2.1-linuxx86-64debug.zip",
        sha256 = "b410fcfc3999ae53b6c8814b88940b7a54b5777d657abe27ee89ffc039f84600",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.2.1/wpilibNewCommands-cpp-2023.2.1-osxuniversaldebug.zip",
        sha256 = "9720073bacbbff0885bed137b89947ee420a24c63d80e800642d574f21a7cc78",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.2.1/wpilibNewCommands-cpp-2023.2.1-windowsx86-64debug.zip",
        sha256 = "1779b940686bb06b452eba2846391365574c43aeb6f40cd19c12fe51b92b89d6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.2.1/wpilibNewCommands-cpp-2023.2.1-linuxarm32staticdebug.zip",
        sha256 = "0310808569d3099aa93be604165c94b3deca29dcedcaddeb479aae32356d033a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.2.1/wpilibNewCommands-cpp-2023.2.1-linuxarm64staticdebug.zip",
        sha256 = "a3b11fc2a26b7ad129721406b5bc5d42b0fdcbffd0c2da48ec64c7b9dd27b062",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.2.1/wpilibNewCommands-cpp-2023.2.1-linuxx86-64staticdebug.zip",
        sha256 = "c54adbc9276b926d663e8a13b47a88bc329b266f06a8d308d2a5bdff85cc96d2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.2.1/wpilibNewCommands-cpp-2023.2.1-osxuniversalstaticdebug.zip",
        sha256 = "4d5ba5b3fd4eda47115c023986fb2d78b6835e412e2e23f85921bf3263114298",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.2.1/wpilibNewCommands-cpp-2023.2.1-windowsx86-64staticdebug.zip",
        sha256 = "2b442398e81dfb963588e11d39af4854389f88beb39ad5096d9f19b0912dd7f7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.2.1/wpilibNewCommands-cpp-2023.2.1-linuxathena.zip",
        sha256 = "bbe3c9c00dfbf7eaef3d613ff2320b300e3440d8aab935f2f41934c88f36a3b0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.2.1/wpilibNewCommands-cpp-2023.2.1-linuxathenastatic.zip",
        sha256 = "86292d944cf78875af10f092d897802236259b5d840887c3c1daa0de18bd479c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.2.1/wpilibNewCommands-cpp-2023.2.1-linuxathenadebug.zip",
        sha256 = "40a01451e6942e7a9da31340cd0b2e53c12142944ad2f90f54b14d50f4e5c017",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.2.1/wpilibNewCommands-cpp-2023.2.1-linuxathenastaticdebug.zip",
        sha256 = "d95cefe4e73672e553d36c29ad6597ccc6e34bac4765580955ed730a55cdf40a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.2.1/halsim_ds_socket-2023.2.1-sources.zip",
        sha256 = "f43db122327f7c7c6f6c188e36a6acba5f79d4fd63fdd921ce398e1d91051002",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.2.1/halsim_ds_socket-2023.2.1-linuxarm32.zip",
        sha256 = "848fde487e1d65894f6ae8c8dad74bda94a266ce0ac5f4c6563bbd3dc1399785",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.2.1/halsim_ds_socket-2023.2.1-linuxarm64.zip",
        sha256 = "da5f3a160ea4600c69ff3d4bc803dde118ebfa8a9037274ad6d770e812e95300",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.2.1/halsim_ds_socket-2023.2.1-linuxx86-64.zip",
        sha256 = "ddf639835d5b857039417927f0d88638affaa6d62046c2cb13f4372e223dcaaa",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.2.1/halsim_ds_socket-2023.2.1-osxuniversal.zip",
        sha256 = "20c16dd77ead1ced0dc1786d10e6dc8c745210be7a7b8b521079014e38e01a35",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.2.1/halsim_ds_socket-2023.2.1-windowsx86-64.zip",
        sha256 = "2ec9b0323dec4338faef90732d64fb04ed9ac0cc98881cdf8405a63fc1e2df31",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.2.1/halsim_ds_socket-2023.2.1-linuxarm32static.zip",
        sha256 = "57db5ab56f06a9a74e5bb5b89bf8376f4b5006b72c07524c2b60c612974eb3ad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.2.1/halsim_ds_socket-2023.2.1-linuxarm64static.zip",
        sha256 = "8bead44ecda3351121cb506be2ca5acc23597b08bc342c7d1dfd472da9a8ec7a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.2.1/halsim_ds_socket-2023.2.1-linuxx86-64static.zip",
        sha256 = "9dad1ada2e6d7f2b2ac5d0daa614244a39e559c64759a3764daf0cf6746e37e1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.2.1/halsim_ds_socket-2023.2.1-osxuniversalstatic.zip",
        sha256 = "9bce18db550210e2ff5a4b890734f11f9b4195bc9c9db1fa21329dde01541e3d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.2.1/halsim_ds_socket-2023.2.1-windowsx86-64static.zip",
        sha256 = "1a373ddbf36ac15ae6aa9bf0f6457da54d78c210d8c85af4e4fb2f7559300485",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.2.1/halsim_ds_socket-2023.2.1-linuxarm32debug.zip",
        sha256 = "680ce746e937e13a4dd491ad8bd086d6f4fa2990b34806d811acd9168b26b1f6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.2.1/halsim_ds_socket-2023.2.1-linuxarm64debug.zip",
        sha256 = "86088f3e6e7ab97aa5a88de49a8b87f76b50bf0b566bcb639d2c1d4ba5b810f6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.2.1/halsim_ds_socket-2023.2.1-linuxx86-64debug.zip",
        sha256 = "08ed1fd949e45a1e9c17a770588b422b98f4b8ef661c4c66380177b9d4b83cfa",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.2.1/halsim_ds_socket-2023.2.1-osxuniversaldebug.zip",
        sha256 = "4ab64a2d811afd7fea658ac7e1fe9f7960654eaeba6d663ad68bcd1446b5bcb3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.2.1/halsim_ds_socket-2023.2.1-windowsx86-64debug.zip",
        sha256 = "a12f5382c7bf1c78e00cb8a6fefb7f91ab2255d0a567f57ff08d0d091d429e3f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.2.1/halsim_ds_socket-2023.2.1-linuxarm32staticdebug.zip",
        sha256 = "4708a2666b5e2324b4c5028493c1932ee551588da98ef1bf9cde7a28c076154d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.2.1/halsim_ds_socket-2023.2.1-linuxarm64staticdebug.zip",
        sha256 = "b38259224067951392598386809ac74e63258783efb41552deb50903ef32133d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.2.1/halsim_ds_socket-2023.2.1-linuxx86-64staticdebug.zip",
        sha256 = "a4791bcf014787d35f3db79cadfe37254abe245801114932f91d0d4118cf4fa9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.2.1/halsim_ds_socket-2023.2.1-osxuniversalstaticdebug.zip",
        sha256 = "2495c554c282f1be424da030ffed93a9a76eaae4087df6246290e385b24ec692",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.2.1/halsim_ds_socket-2023.2.1-windowsx86-64staticdebug.zip",
        sha256 = "b9df1e1690a42cc2c358a1b9b8d2c558df83b920a78dcac8fee6fd381a07e9c9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.2.1/halsim_gui-2023.2.1-sources.zip",
        sha256 = "bad1ac5f248c5c50cecc4a9b7447b90343e316de2a1e3de4412d432363aa72ac",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.2.1/halsim_gui-2023.2.1-linuxarm32.zip",
        sha256 = "73b7713ce1eeb85845b4421743c338bf93edc4d932743ae0f6d4bd9199a47a5c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.2.1/halsim_gui-2023.2.1-linuxarm64.zip",
        sha256 = "fa72bc5d975b15772f1ff5b587f02a91d836e72a7a1de65d7288b2e4beee530f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.2.1/halsim_gui-2023.2.1-linuxx86-64.zip",
        sha256 = "1d08ac0fda3c0bddbbc8a202f90273809e7c2899109a71d835f13491d179e51a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.2.1/halsim_gui-2023.2.1-osxuniversal.zip",
        sha256 = "30cad1cccc61ce4eccc8230d66be6daf2af623a7bb60db11851171c1d2f38c4f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.2.1/halsim_gui-2023.2.1-windowsx86-64.zip",
        sha256 = "150b8d13458e771d6ac559a610052f0ce733b7c578eee331af23fac5fff03be8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.2.1/halsim_gui-2023.2.1-linuxarm32static.zip",
        sha256 = "c16484c56c0dcadb072e0d78b5e3be629167811d8caed66ccfe8a79c4deda796",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.2.1/halsim_gui-2023.2.1-linuxarm64static.zip",
        sha256 = "8ecfb4a25fcc4d24892a89e6a51b54aa5b586131a6e032c025c8425eaa23df61",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.2.1/halsim_gui-2023.2.1-linuxx86-64static.zip",
        sha256 = "2741118dcb4afe8fdea32cb889b5c8785304be0377368c35efa8b551080e950d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.2.1/halsim_gui-2023.2.1-osxuniversalstatic.zip",
        sha256 = "c2a1f37548123f56cf8f5fe8c5bdd709eb5a4bd90b739b8fe8f5ff17fe143495",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.2.1/halsim_gui-2023.2.1-windowsx86-64static.zip",
        sha256 = "f9f10d653c6a4b907a9a5a67d2b664d6acdfe9e7f8e1784a4aae3f60f4d28cf3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.2.1/halsim_gui-2023.2.1-linuxarm32debug.zip",
        sha256 = "e61e5998e4ef219aab310d029ca386997f17349ecfee93ac467e19b9e7922da7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.2.1/halsim_gui-2023.2.1-linuxarm64debug.zip",
        sha256 = "5eb22c61979ebbeded9ce31b60f1908536e9f92d1493b3c2beb6b62514e4bfac",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.2.1/halsim_gui-2023.2.1-linuxx86-64debug.zip",
        sha256 = "52fde94cace836b19800d3178d18ce0454ba7dd8e8d443ca22d0c7c918e358cd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.2.1/halsim_gui-2023.2.1-osxuniversaldebug.zip",
        sha256 = "c6efd245e5382755dd336525b1c52fee25b77fb857b118d9fca4bc00541bd35f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.2.1/halsim_gui-2023.2.1-windowsx86-64debug.zip",
        sha256 = "230500a5c3a40b4a56e00146ed4fbd4729d477071db3e63180fb817d16ca6ae0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.2.1/halsim_gui-2023.2.1-linuxarm32staticdebug.zip",
        sha256 = "5f458aa30881282dac357aa2dccb177627033948c4a08758bcadd3ec40a8ded6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.2.1/halsim_gui-2023.2.1-linuxarm64staticdebug.zip",
        sha256 = "909c8887df02cfd9585b095760c29e82103a8726047da04109903667f30c3e7d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.2.1/halsim_gui-2023.2.1-linuxx86-64staticdebug.zip",
        sha256 = "1527aef55561de146b61566e0665998fd3ea8f709718cedf0734decbe9673352",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.2.1/halsim_gui-2023.2.1-osxuniversalstaticdebug.zip",
        sha256 = "a1a7b1ccf2d20d56c2fd89cb844434d6669470010eb787e1c85f1df73e9ee6ed",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.2.1/halsim_gui-2023.2.1-windowsx86-64staticdebug.zip",
        sha256 = "9e4a1eff3502ff79443f782c52753774de54719b9cdbb25843ce5f58e066638f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.2.1/halsim_ws_client-2023.2.1-sources.zip",
        sha256 = "2eec747f46ce20bf543da074b4bbf0308a0a1f3d7ae7429d7c1e4ae60ace9706",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.2.1/halsim_ws_client-2023.2.1-linuxarm32.zip",
        sha256 = "077b74ec6bfc099ed5b6bae2bb9b09122e742980bd721c0f7db90a95512d68de",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.2.1/halsim_ws_client-2023.2.1-linuxarm64.zip",
        sha256 = "4328aa322682e1b9183839060864bb6157388698066902ed831a693e1b3a81bd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.2.1/halsim_ws_client-2023.2.1-linuxx86-64.zip",
        sha256 = "d98291804dd713b38866f3fe904bd64c0d2ca69bb60a86522b9feccfb57092b8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.2.1/halsim_ws_client-2023.2.1-osxuniversal.zip",
        sha256 = "ee87dbb062b65c40042b505227c21fe1b902bfef249d79b214ac57c38a2bd7e0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.2.1/halsim_ws_client-2023.2.1-windowsx86-64.zip",
        sha256 = "17048cee8f4f4bc982aad009c6a05f4e91ae9ef986801031fbd0663ec6d47aa8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.2.1/halsim_ws_client-2023.2.1-linuxarm32static.zip",
        sha256 = "25ef1fd314c4e53b93b73c2951bf7ca3884fda84cacfa87816f615d6bfb80830",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.2.1/halsim_ws_client-2023.2.1-linuxarm64static.zip",
        sha256 = "99a4a6828d3af465588c2152ffd36f87f0e974abb7da788a12689dfaef47c52d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.2.1/halsim_ws_client-2023.2.1-linuxx86-64static.zip",
        sha256 = "edd51f59e6ef21af1b41ce1870a0ef85b062a86e755a285f433a5c8ba004b7d3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.2.1/halsim_ws_client-2023.2.1-osxuniversalstatic.zip",
        sha256 = "55f67843e55f965fe147ad75e1ee72bb2fea824c3d374cac4b62dbadeee60f6a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.2.1/halsim_ws_client-2023.2.1-windowsx86-64static.zip",
        sha256 = "174dbbc1e4e1636280fbdb505eda0b33861ed54ef8477cdaa23aa3c6b0f75722",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.2.1/halsim_ws_client-2023.2.1-linuxarm32debug.zip",
        sha256 = "70c5f0e4b7f91d95d8c6ebd6bafd6798a2396985422051a8a4cda7487a2d02c8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.2.1/halsim_ws_client-2023.2.1-linuxarm64debug.zip",
        sha256 = "3c9519eb09f50a47714a614ea2333339e1ef67e3e28452bc22c601616109824b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.2.1/halsim_ws_client-2023.2.1-linuxx86-64debug.zip",
        sha256 = "668a482cd7191b034d45d1b9cb2b549c6e8890a9a79b9c57bda2f20f9dd91056",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.2.1/halsim_ws_client-2023.2.1-osxuniversaldebug.zip",
        sha256 = "8a3ed37f0568b64463b9f4ffa78b7ddd6db20c88e2a04079f056c6fc3a577c3f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.2.1/halsim_ws_client-2023.2.1-windowsx86-64debug.zip",
        sha256 = "9b193bd0ccc924de578cd5a196a9e71bcb860c5a2943ffa59b4cb3134e1068cc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.2.1/halsim_ws_client-2023.2.1-linuxarm32staticdebug.zip",
        sha256 = "1c09f8a0343d41c45f4de4e77a038b4d47db9074c9ee41e210fe55fb6f3cc723",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.2.1/halsim_ws_client-2023.2.1-linuxarm64staticdebug.zip",
        sha256 = "aedd5e80c2f0cf308133f0f8ec2f20df446554fa7f8b2b5c26b4a2a186d270b5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.2.1/halsim_ws_client-2023.2.1-linuxx86-64staticdebug.zip",
        sha256 = "fa109ec677deaae0290111aea20a08827200a851fe6514e7debe71382878b0b0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.2.1/halsim_ws_client-2023.2.1-osxuniversalstaticdebug.zip",
        sha256 = "fe01ae9561b3985657a652435eecbabb093546496e0a27b54122810f30bd4bef",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.2.1/halsim_ws_client-2023.2.1-windowsx86-64staticdebug.zip",
        sha256 = "a12ecd7dba8be7ca9e068357baf050e0c68728443bb4e57a9f41824ca71e32c4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.2.1/halsim_ws_server-2023.2.1-sources.zip",
        sha256 = "0ee28ce56ed345097833f859b03923281856b377e43d1fe2cb71a3454aa38985",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.2.1/halsim_ws_server-2023.2.1-linuxarm32.zip",
        sha256 = "47879813967ce06801a4607bd34226c6691ec40ae4d2623d12cb3b7d8c6e2f78",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.2.1/halsim_ws_server-2023.2.1-linuxarm64.zip",
        sha256 = "6c83110e8649c8233ba7db3672e1b57846981dae9bcf3a13cd70858563f22b17",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.2.1/halsim_ws_server-2023.2.1-linuxx86-64.zip",
        sha256 = "68b2eb63a65281892fd2a24d814409e718f5336d3385a52f7311f79fb160be37",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.2.1/halsim_ws_server-2023.2.1-osxuniversal.zip",
        sha256 = "dd3d699f6d6a2a759eda895f8ef1601fe51ae24b7a8975369cf72dbc66d98ea2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.2.1/halsim_ws_server-2023.2.1-windowsx86-64.zip",
        sha256 = "97aca5b6d3ddae0ca83fed4e7e35eb4b7ed4368906f6e8703d2ced04296d3fd1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.2.1/halsim_ws_server-2023.2.1-linuxarm32static.zip",
        sha256 = "b48ab2a140deddb337f13a0fecf96bb2feb63b7b44146eeb855885b14687b843",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.2.1/halsim_ws_server-2023.2.1-linuxarm64static.zip",
        sha256 = "de642a57ee43c898027bc291e84091816e785fac4b1842b795d2f88517ab599b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.2.1/halsim_ws_server-2023.2.1-linuxx86-64static.zip",
        sha256 = "4793f4df2f69195ffe5e827a8936094ac43644f82b7d743ac49a3f4a4ab9b5ce",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.2.1/halsim_ws_server-2023.2.1-osxuniversalstatic.zip",
        sha256 = "79ca3a6aeab3acdbbd9823993d6f27d65c34ab37e00f92cb7b7ee71bf74479d6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.2.1/halsim_ws_server-2023.2.1-windowsx86-64static.zip",
        sha256 = "8154ad9df63001a7bee4de567aced964209ca4b6f150c1a0d334518d3463ea96",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.2.1/halsim_ws_server-2023.2.1-linuxarm32debug.zip",
        sha256 = "64c0109fcba5843a6d4483f891bdcff0eb3d79478bbf4e9a3c04ddf4488c3982",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.2.1/halsim_ws_server-2023.2.1-linuxarm64debug.zip",
        sha256 = "6ab6b7fd0e72678db4099d2ad7b9642f9a553be4d8b6dc73a34085e9c98ee7f3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.2.1/halsim_ws_server-2023.2.1-linuxx86-64debug.zip",
        sha256 = "8ca3bbb0ebdb3a175826887f9940875f05201472f5d09edceea0dfbe06ee1332",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.2.1/halsim_ws_server-2023.2.1-osxuniversaldebug.zip",
        sha256 = "4b15d405441336fb79d30ba1ed57bfa2fd28489e42f99db0dee2fd560a2c0f2d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.2.1/halsim_ws_server-2023.2.1-windowsx86-64debug.zip",
        sha256 = "10a2484341a9765e7ae292fc2ee10991965f01eeedb6bb4e1022ab81c802c6d0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.2.1/halsim_ws_server-2023.2.1-linuxarm32staticdebug.zip",
        sha256 = "168a46ef2ba0eda8c5ae879683f5839bc924c61e776d2bbd5f5d282479d2373f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.2.1/halsim_ws_server-2023.2.1-linuxarm64staticdebug.zip",
        sha256 = "7c1646f786d01a31a124aad07420481b2686a9210fd875e7c37994aec473813c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.2.1/halsim_ws_server-2023.2.1-linuxx86-64staticdebug.zip",
        sha256 = "f33399fa54cedb338fb92e05bf77c15a1fd226befc49be251a0cfa36e41128da",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.2.1/halsim_ws_server-2023.2.1-osxuniversalstaticdebug.zip",
        sha256 = "0171aea5bc40cffa6d35319ebc414b5893ca1e187bb60fe85805d37d49d5aaed",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.2.1/halsim_ws_server-2023.2.1-windowsx86-64staticdebug.zip",
        sha256 = "f479022b5f2bfa962763f4bb27209a4adf3b0a7aacdb71b566a4ee27e0f0fa0d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2023.2.1/SmartDashboard-2023.2.1-linuxx64.jar",
        sha256 = "bb3486a506117538194ea0575bc7dc7f97bbb588800ebc9e7ff76617c2714678",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2023.2.1/SmartDashboard-2023.2.1-macx64.jar",
        sha256 = "1394c44503a65ecaf9be19884e12c2031b4535c6def2a6b25d1c6af8290af7fa",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2023.2.1/SmartDashboard-2023.2.1-winx64.jar",
        sha256 = "89357181d04199f453fa4d2d89579aa18c5cc70b69f8aab734e21ea88cbeb166",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.2.1/PathWeaver-2023.2.1-linuxarm32.jar",
        sha256 = "5c2790299056f767fc219653028b496b5e324196faf7f5d10d6341b4da2772da",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.2.1/PathWeaver-2023.2.1-linuxarm64.jar",
        sha256 = "05b4339bf1732bd545c77e219c05f6cde873ada8376f74113cf87b1aa41fea5d",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.2.1/PathWeaver-2023.2.1-linuxx64.jar",
        sha256 = "e26946dbfe860b4cea1c1ca2c6a14c29d603dc968689853fb85e4e7403232515",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.2.1/PathWeaver-2023.2.1-macx64.jar",
        sha256 = "0b5ce764ceac315e2e6ee571ec49c468dcd4a876dcec8677b870f4a35c88c51d",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.2.1/PathWeaver-2023.2.1-winx64.jar",
        sha256 = "c6d7e7cddb6bfb6634fa6764708a86108d2f374ca554aeb28ff47782875a962c",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2023.2.1/RobotBuilder-2023.2.1.jar",
        sha256 = "be8c26da1683a3a3b7dee1b010f537753d9e369ccd6fdf8295aab8a89d37aa06",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.2.1/Shuffleboard-2023.2.1-linuxarm32.jar",
        sha256 = "50c91bef8e3a0eb70ed5528b86c6809e67f25a49ce512507075d76c10b01b5fc",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.2.1/Shuffleboard-2023.2.1-linuxarm64.jar",
        sha256 = "6e792c26a1f89022b1c7bb9afbab8bce759173f6a2f02d5258bb5791f39f27b4",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.2.1/Shuffleboard-2023.2.1-linuxx64.jar",
        sha256 = "a0397452d8e7aa46857ba2511ff0cac12b837707fb0c4c846496a02fb7e3a6dc",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.2.1/Shuffleboard-2023.2.1-macarm64.jar",
        sha256 = "372c13d0bdc0f5599fd2396021f93b1f3c4cf5501a4b65c20d1385db982ea114",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.2.1/Shuffleboard-2023.2.1-macx64.jar",
        sha256 = "8f788f36a55754cbb95a94c8142dec83ad1559958aaf4840fa38dc51db8c9704",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.2.1/Shuffleboard-2023.2.1-winx64.jar",
        sha256 = "01fd4d994f25544e545e8e530d88ac8f148ea8fd0e0510ada89285ebdcfd4f2a",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.2.1/Glass-2023.2.1-linuxarm32.zip",
        sha256 = "79c5fed8cbb04750408625102cba4ca5ca42f9ee8bb2ec6ead9452653eb865f1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.2.1/Glass-2023.2.1-linuxarm64.zip",
        sha256 = "8db8e9d9c0eb7e5933a931a8451abf4809181c785bcf23d36c4a11137b46f3e7",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.2.1/Glass-2023.2.1-linuxx86-64.zip",
        sha256 = "0ed31595e11a04d05b850073a46fa0c531db5ac9b7645b133e6b8107503e7106",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.2.1/Glass-2023.2.1-osxuniversal.zip",
        sha256 = "c7207971e99ce12065a19bdf429d1b39fdcae33bd36b1b314abc3fc04b51f001",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.2.1/Glass-2023.2.1-windowsx86-64.zip",
        sha256 = "3f375a2abd94279fd1363770a8b4ee6a1851a5d92fe7663d9f06deee271e85bd",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.2.1/OutlineViewer-2023.2.1-linuxarm32.zip",
        sha256 = "4dd153414e23428757bf2d69ca6c88e18ee9581a8a8090ba4bdedc4b91b82848",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.2.1/OutlineViewer-2023.2.1-linuxarm64.zip",
        sha256 = "332120fb1cbff60402b805c63e5f756908830c348e9be4695ef486662b8d5745",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.2.1/OutlineViewer-2023.2.1-linuxx86-64.zip",
        sha256 = "fcd98ead7e47909f3e9165b278fafc704c77d5f594fbf6c7d30f29081d5334ff",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.2.1/OutlineViewer-2023.2.1-osxuniversal.zip",
        sha256 = "e26035b67f51e6a1ac50ef68a61585e8a64b7150eab2a0c077c4cfa60f0cc98f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.2.1/OutlineViewer-2023.2.1-windowsx86-64.zip",
        sha256 = "3319b8f9a71725cd0a056023414a6b8da56be36fd06f24edc2c990a3b9021d56",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.2.1/roboRIOTeamNumberSetter-2023.2.1-linuxarm32.zip",
        sha256 = "8b81c1d8cf63faf487be3c21010cd3e64641b69d970974b075027d57289ca5db",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.2.1/roboRIOTeamNumberSetter-2023.2.1-linuxarm64.zip",
        sha256 = "594d33b8952d0ae7973557189fcf2cdda16567b0f4bd606e75626f13bbb8fd3e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.2.1/roboRIOTeamNumberSetter-2023.2.1-linuxx86-64.zip",
        sha256 = "73d27db456d6dfccce80981b1d9e0f2e7631acf5a97fd7ed723d66676e0ef96e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.2.1/roboRIOTeamNumberSetter-2023.2.1-osxuniversal.zip",
        sha256 = "9d01bf90fe7ef54a438218dcaa098b1b0a7e281dc6af727b4f30d0aa1ed270a2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.2.1/roboRIOTeamNumberSetter-2023.2.1-windowsx86-64.zip",
        sha256 = "2ee5e54dc9161f7e5cfa2030a89e308418eb3de883080def66fe923b5a31f5fe",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.2.1/DataLogTool-2023.2.1-linuxarm32.zip",
        sha256 = "fc76c0941c40698c29d5d18eff6918d2d67678a349dbe7eccd62a8ccaca93ee6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.2.1/DataLogTool-2023.2.1-linuxarm64.zip",
        sha256 = "d69bbd53c168ea1b6716bb1007365fd765b3f3bc8967881cc32a5936d303ebd1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.2.1/DataLogTool-2023.2.1-linuxx86-64.zip",
        sha256 = "abf01a796dc2c49e6709a441ef440bf26bf8f2d654e8670c1db755b4467e8c8b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.2.1/DataLogTool-2023.2.1-osxuniversal.zip",
        sha256 = "8b6d3024a0d236c53fb08cf11bbaceea8a9cd3ecc4a4bae0bda03165d5c35cf9",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.2.1/DataLogTool-2023.2.1-windowsx86-64.zip",
        sha256 = "90048a8dfd5267ea7cb9cd053f3ec3b27ea158b9565d0248baab266a51bc09ce",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2023.2.1/SysId-2023.2.1-linuxx86-64.zip",
        sha256 = "7cdfc0d1b0e9cac08a0c89391330fd149ecafe4a36974a791865b1d22be097be",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2023.2.1/SysId-2023.2.1-osxuniversal.zip",
        sha256 = "1a7e610d95c5ff14b3b4b575c02dceb92255568fb961012026a4ec3df238e48e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2023.2.1/SysId-2023.2.1-windowsx86-64.zip",
        sha256 = "8361147364bef1df5606ab3dd7267b4e4cc116776bc6db73864409e5e46939ec",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
