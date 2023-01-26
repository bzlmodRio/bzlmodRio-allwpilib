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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-headers.zip",
        sha256 = "519eaac8a91663b142d811a199fe8abf46a086dbc9f82317887322008473cca1",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-sources.zip",
        sha256 = "2a66e761d025bacdce90337e96a33d11f7a31ded69c4addbfc69e8e1c4b4945a",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-linuxx86-64.zip",
        sha256 = "56cc57f4e0252c122a77843ff244025bb39ad36229104e6a9c6a47a51d913bc7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-osxx86-64.zip",
        sha256 = "e5481f51dec5fcf2ee912acfd24bcc6705c3e08e4cd38072dda88188329a7b72",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-windowsx86-64.zip",
        sha256 = "a3c99c0ba61c6f215a3efa37249f21b67c60ee3c051a88796eabf3c91edd6a69",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-windowsx86.zip",
        sha256 = "0f446540802ac6953850f46120a8a1fe877f8032567bf2e4ea788c73db6fe015",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-linuxx86-64static.zip",
        sha256 = "5fbfafc0c6018398f1fb45005d26154595bc4e56287c4c3d2faedd70e4d7f197",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-osxx86-64static.zip",
        sha256 = "919399b4f25f419e4f132b5a3206a71854d8097adcfffb9ff904ec7c1569653b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-windowsx86-64static.zip",
        sha256 = "3085ed9ae8ae5bcc570f23e47c0679a402d06afc826ac9159c4f89c3d1d9add0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-windowsx86static.zip",
        sha256 = "07c7941bfcd59a79300720737ea3d61857fedb53aa16cd27c621c5f9d4c32c52",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-linuxx86-64debug.zip",
        sha256 = "d0ee46eddc323ec35ff7cd3000a15c28beb0246d5325e546abfee1add2bf8098",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-osxx86-64debug.zip",
        sha256 = "8fee5e8dab433290dc4030819b20ce358a932ecb16605ec1745fb9c39f359782",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-windowsx86-64debug.zip",
        sha256 = "56a441c6acc8e0b250656aba07a04e8698614392ec5791785c96ed1dfb9c73ea",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-windowsx86debug.zip",
        sha256 = "d1e18a8975000437d871082c9143724f89dec2f806b1280364f5eb0149ea639d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-linuxx86-64staticdebug.zip",
        sha256 = "ce889b317cdb75b35e486297a1dba250a0f6df4a74f4c7628ab4904d31f77972",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-osxx86-64staticdebug.zip",
        sha256 = "08a13e800a321ca1e395985c74aeb4a7cc77e982491c046ed3dc82da0bd7a398",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-windowsx86-64staticdebug.zip",
        sha256 = "81814c564bcc352059f90ebaa9c96abadb8aa5a4208837019ba5b246c5eba5cc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-windowsx86staticdebug.zip",
        sha256 = "f91fe9fb86c0e236728b28868d53cbd8c0b3f396af8de2d211ff648a4ec3c955",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-linuxathena.zip",
        sha256 = "9cdbe79da2555a6fa6dd0dbc8fd01d534dd51bdce939627bf0e1881566f1aba7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxaarch64bionic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-linuxaarch64bionic.zip",
        sha256 = "ff1aa832e2072e5bfa2644a7538ff7208761236f4ce73d6b11f67b88bf7f0279",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxraspbian",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-linuxraspbian.zip",
        sha256 = "fa8e2b132dfcb5b2d73359bf8b19aaf423819b2fb40acd5824f92b6d0bafc360",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-linuxathenastatic.zip",
        sha256 = "97ffe2f8836392732f3fe361e72dd19634464f07a3b7e89359e50ce8f2f7498d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxaarch64bionicstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-linuxaarch64bionicstatic.zip",
        sha256 = "7e4c645b244a64273a68939352c54581ec1ef8bbf98dd9ee49f2599d9a61273a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxraspbianstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-linuxraspbianstatic.zip",
        sha256 = "a6a0a2b67b2dd1dec26dcca94a94a0cb0925a39196175e6ee95c4d28839cfbb6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-linuxathenadebug.zip",
        sha256 = "0e960495d908badf3b0971419ab2e009382a90530d6b9a73f5a68d0cd37bbddb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxaarch64bionicdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-linuxaarch64bionicdebug.zip",
        sha256 = "687d8c46dc08be1bf3080b9750af69a5cdcecf0a3701791bc3ecd060dec7a10c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxraspbiandebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-linuxraspbiandebug.zip",
        sha256 = "a1f8c9d832b583dc9358f9e0fafe0171069b364c21111103cd489fdea7389485",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-linuxathenastaticdebug.zip",
        sha256 = "64cd16fe30c5be93a090d258c42f1ca2ff3555ecc84343220df4fd8586e781ce",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxaarch64bionicstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-linuxaarch64bionicstaticdebug.zip",
        sha256 = "e3f493bbd2e8019ddfa4d87c9ace22986ea2c92bdeb33e5b24683e60823ad675",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxraspbianstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2022.3.1/wpiutil-cpp-2022.3.1-linuxraspbianstaticdebug.zip",
        sha256 = "6202c1d7cd8308d68c869258eb62f5412595ffa57220c353d289126c8682f120",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-headers.zip",
        sha256 = "1a2165cf8127a2a45cc673517eb0af5e7e92fee377b35e4e83195538a024d65a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-sources.zip",
        sha256 = "62f04d5f47f42a507864c6c451b27076384041fbac0bcf4fa57b47baf09d8b37",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-linuxx86-64.zip",
        sha256 = "aff716f9a6b5d830fe3c90a1ea0e5e8e4ad86fbfc2f4f8d7f9090e1517685c9c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-osxx86-64.zip",
        sha256 = "2dd218696838eb57999a0ce0d8ae4c6969d37a48bbdc0fa26dc8e60fbee6783b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-windowsx86-64.zip",
        sha256 = "aa166dabcfdd92e89ffce0aab62b8898d11f8072c456892627a14f18ffed8f73",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-windowsx86.zip",
        sha256 = "3851f5f27d9814180c9fb05fad12dd1502c1af677261b71986c514475dd7454f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-linuxx86-64static.zip",
        sha256 = "eee5db885c3863f2c1cb49cf4b058c0b2d5e4ee046262d59912143bd8bbfa022",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-osxx86-64static.zip",
        sha256 = "b786242ff0364dd0aa881565c42be10e57a1bc0c1346eedbb054e15f9508d575",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-windowsx86-64static.zip",
        sha256 = "ebb21c86c0d9aae86dec1a697705078dbfe7832e329ac828658b4389f85a5717",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-windowsx86static.zip",
        sha256 = "1b6130f23dda795138395e8b06c47ad177998a9fa3adcdf99d788706fe5c550b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-linuxx86-64debug.zip",
        sha256 = "db57d8ea3761ca66134a3f401cb3edea1d68e00d1ac2fe2241e8573e5fad8a06",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-osxx86-64debug.zip",
        sha256 = "68d9d31c7eb7b03eba8edf2eb1c287c58fa0c8c0ef2e622fe4c62e928e34f5db",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-windowsx86-64debug.zip",
        sha256 = "7adb2d9e659a6a6bdd0ed942d3cba91143ee2db488ca8bf91bc45927569b7f80",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-windowsx86debug.zip",
        sha256 = "86497f1aa79625ad7098c9a3e4d84d080bdee6e9a59c39b1eb864525e3656e33",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-linuxx86-64staticdebug.zip",
        sha256 = "58780b05c6b71df514adb047296c6ab037ec75994ac1bea78b8812e14db8df1c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-osxx86-64staticdebug.zip",
        sha256 = "510b556d57ec6c43495b6306a9ce17c6c4b87bdcbb71c1d1250b6fe5d7ac7d6c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-windowsx86-64staticdebug.zip",
        sha256 = "971224ce33a8a8251162461f976b3fad8ee299b6e07b3494b378bf5996e0ca02",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-windowsx86staticdebug.zip",
        sha256 = "49cbaf9f2cfa338d9437d69d34f5ca4124df38c55dd3cc6a86d924249c961912",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-linuxathena.zip",
        sha256 = "316fac1af3cc3932d7364e487f109d31abc37cc2ed950e49d598f044d87d16d0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxaarch64bionic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-linuxaarch64bionic.zip",
        sha256 = "92f2d0d18f06fdf26201fd99157c8fd49528ad76dff81553ed697d1f28f3cd1f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxraspbian",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-linuxraspbian.zip",
        sha256 = "fd4683a8f9c509fe0d303502b1a23fb5813c9499c9121f4c04564e1888555628",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-linuxathenastatic.zip",
        sha256 = "e7e32ed9d8fcc3fc069d9a0da68dd3ed9c36b10ef258bc21028cdab89b63edc1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxaarch64bionicstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-linuxaarch64bionicstatic.zip",
        sha256 = "64e059a47f5d65d83d1a136abffba3684170681a60a5f9315f6ad6c1bfd0c575",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxraspbianstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-linuxraspbianstatic.zip",
        sha256 = "d795ee1eebef91e82592cefd6e8baf2c7a8a0c4bdd458d20d47568a192d33afd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-linuxathenadebug.zip",
        sha256 = "1893c659bbb2b39c8410be24612702e5b216d8177378ef25e98b5740c318d46d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxaarch64bionicdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-linuxaarch64bionicdebug.zip",
        sha256 = "ff226cf63aba9bfa2a069576c0a6362b96050b8430dca09b339e2800f1fbd838",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxraspbiandebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-linuxraspbiandebug.zip",
        sha256 = "2a162970933126288f685ca29ed9f49b653a8a67926422b9a6a2147d1a0d09bd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-linuxathenastaticdebug.zip",
        sha256 = "b102b35c35ad7f5874ed8baf55fe5a06d386d011d9fe2221c0994c7af5d9420c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxaarch64bionicstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-linuxaarch64bionicstaticdebug.zip",
        sha256 = "5a5f59da3dab51b85cfbf29f66f4c909e4f0edfbd73d85353bd52d6097322411",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxraspbianstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2022.3.1/wpimath-cpp-2022.3.1-linuxraspbianstaticdebug.zip",
        sha256 = "efd2f7f2cd47630f963201f42fc332ce1f8957049e779d4ae2964cf253e39a2b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-headers.zip",
        sha256 = "30538817968f6f905008fa3e4b9cb034ab7a896307fedd9568b0df5412941c2d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-sources.zip",
        sha256 = "6ef1b513452a7abb1894af3013623e097e17d7adce9197a956206e903adb8ac7",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-linuxx86-64.zip",
        sha256 = "11b477e7e8f398265e9a5cec16f8fdf85dd9ac96aedd4ea43b5088f496061a01",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-osxx86-64.zip",
        sha256 = "085445d4df4b17f2284dfac64ed57e1a2de5be9be4ef517f016a75663de6b2de",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-windowsx86-64.zip",
        sha256 = "2871c88c0d7ebc6d13005d698d641f23653d6de446fb630815470d38adab17b5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-windowsx86.zip",
        sha256 = "e5c4851ddab8d6eb57934c8e9dc578b812404dac99dda6dd3dd90d53e5c2a048",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-linuxx86-64static.zip",
        sha256 = "60d1f330888b0529a3605dd8c50d171a8f91ddfd23f5747f2d818a346c8adf94",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-osxx86-64static.zip",
        sha256 = "1a818074ccd054daa258b1f909e84c7078b8bb4a464e0af4ac4fa0d26f8aeff9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-windowsx86-64static.zip",
        sha256 = "507f520d94cc655abed8beb30c4a8920917877ae60133a632d40fa5f349842e3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-windowsx86static.zip",
        sha256 = "7866e20f8e072814d41bb65d7e43735aa1571374341ea59eac172d99b848bb58",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-linuxx86-64debug.zip",
        sha256 = "49df8a88e0d8b94babb13d2012119f463cba45d9baf4d1eed3d36c779ae5c29f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-osxx86-64debug.zip",
        sha256 = "c77ed323d42a53d3a1c19862f36840ca838b4b73c427cd18af2c9f87302d4e8c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-windowsx86-64debug.zip",
        sha256 = "2af4a2909cf500cd9e7509a0110c0c1c734a72640e33bb9bf2aab0ec6fdab484",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-windowsx86debug.zip",
        sha256 = "ce815b53fb267c54c053be6cd439c58e94fffbeb3427e82ee3071d6b3d876670",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-linuxx86-64staticdebug.zip",
        sha256 = "726ab1892f6ccdf182a173ba24007aac0dab1cca4a09fc58a36319d1df6c06b9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-osxx86-64staticdebug.zip",
        sha256 = "8987d9f55793918604c4647075b9f80038d1c9160ad5e7034e7a94beaafb63b8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-windowsx86-64staticdebug.zip",
        sha256 = "285926cbcc5ea3355dbace475da1f1ba46c47d2bfc7bc365ae592bf20c3cf12e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-windowsx86staticdebug.zip",
        sha256 = "8a00e222916ff67708557aacdebea7c14370ea01f3010b0ae5a0ff531f504f4a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-linuxathena.zip",
        sha256 = "d0cd66dd6d1f15e4ed98dd45cb9d1145f18a627937245bf2a2695ffa5ee21c32",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxaarch64bionic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-linuxaarch64bionic.zip",
        sha256 = "4c15d7bdf6e395b65eedfca0e01a1a9b66e86e056b992c502eb8a85301bea7c1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxraspbian",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-linuxraspbian.zip",
        sha256 = "46bbd8a8e597d22d696ebc7f50f31a1d74e2f77cc56b9a7aa6433613fc93d9cd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-linuxathenastatic.zip",
        sha256 = "3aa91c3fc731ff4cd0b86a615de54bab108b52fd9045c56520ecccca006b8aa2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxaarch64bionicstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-linuxaarch64bionicstatic.zip",
        sha256 = "34afe4e91a53c10ee55aba58caae28a9de20b13bf0a2d76406a5f2d9fa328982",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxraspbianstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-linuxraspbianstatic.zip",
        sha256 = "f796cf29c331977d4853a735a4f66d453f309559de3b87e988756fbfe072f586",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-linuxathenadebug.zip",
        sha256 = "21638a39d3117166c9a2a21a70bb7fa32e531ad8d6011c3223e5bc2b6327321b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxaarch64bionicdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-linuxaarch64bionicdebug.zip",
        sha256 = "8182e67c8419fd13a20dd5cc84f37687e95778d95a84cbe4c82ece8c57f98562",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxraspbiandebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-linuxraspbiandebug.zip",
        sha256 = "cdbe15d3812dca591540b88fe1adb2959279eff3c7c33e02b8fca19c80623544",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-linuxathenastaticdebug.zip",
        sha256 = "4edc287ad51e71f7bb211b547fb0dfc6a8253e72e8126eae05fff00c7e26da0f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxaarch64bionicstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-linuxaarch64bionicstaticdebug.zip",
        sha256 = "58eca0069bb3e59d942012bb0e184c8d85ad810e3a743c9de1b03dc5a3315585",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxraspbianstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2022.3.1/hal-cpp-2022.3.1-linuxraspbianstaticdebug.zip",
        sha256 = "08175b1c0d47b65f0f30b431a575327a100f71dbd018a83fe7deffdd1bad6c68",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-headers.zip",
        sha256 = "144431c4aeb28d9fd4ddd44614ca7b6f9fc0b87b8488394175b66d76979beb83",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-sources.zip",
        sha256 = "16df84376424a7e94b1944bbed31c62f8289548046a077b9c7e62f43d8350142",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-linuxx86-64.zip",
        sha256 = "af7de76b24702c30504ccd6d92d2265eb5f1402cbf08b418217e8643adca78b5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-osxx86-64.zip",
        sha256 = "2d7eaf19f375c98cc37f5f6efd8ea428fd142f4e422233a22db60f452b15a746",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-windowsx86-64.zip",
        sha256 = "60f5aa44a9dbc4465302a3086f4932a48e2e6cf6f06d9e544182395c95982c1b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-windowsx86.zip",
        sha256 = "74a915e8265fd5d99a703e7384736937dfb154e83095d47989ca744f2436b0ea",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-linuxx86-64static.zip",
        sha256 = "d9c337fde542608aa37c407b16f22d28a54f62b5b4d819417d6aa4e4f422975b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-osxx86-64static.zip",
        sha256 = "64bc000d76f5511e74cd48f3fa8eb7859d55b9686e61b2413c04d53bca461f96",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-windowsx86-64static.zip",
        sha256 = "c328e2aa1394addac9863159d920daf48f12a353836853c4cd17dcf131e18f25",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-windowsx86static.zip",
        sha256 = "fa1ed16fb061a3b14744d193363e5a3338a0f92ef93bc8b435e77f6a7a5164b1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-linuxx86-64debug.zip",
        sha256 = "95a4c47352fdb1c7f619d085a3828780c4b6c3ffb0bce3724b6fd92d25fa904e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-osxx86-64debug.zip",
        sha256 = "5640021011bf18d8e7d7675dce25dc51a900842f4d08db5f563b02efb0b8ef91",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-windowsx86-64debug.zip",
        sha256 = "81f037df06d74c56d4a5fb89e0862ce89644c4d77a3891c7161816b124a6cd26",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-windowsx86debug.zip",
        sha256 = "525bf358f9805cbdc4b0bd5d4ebf9c96c96c2e565dedcb4440c5511a1b1727ac",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-linuxx86-64staticdebug.zip",
        sha256 = "95624b75b752fca611c8f1f37ab96b603021d3ed02a5123870052983dcf92a6f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-osxx86-64staticdebug.zip",
        sha256 = "bf91674d9f258dda392b63dccc4405316b25f3973cd95249915db19be98eb823",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-windowsx86-64staticdebug.zip",
        sha256 = "f0e51490a0c4a06aa12915364d989d68cc38fd2a14edc4c225d3b11fce4eb1eb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-windowsx86staticdebug.zip",
        sha256 = "d9d0c174d06d5a1121dfbb0f0179ddbf02ea71a148abd6a93e44c0bbee0ba25f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-linuxathena.zip",
        sha256 = "e2330da4c4a424416fb4f1cfd670ca55aa86e4ea1f397718f0fcaf013230fc4b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxaarch64bionic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-linuxaarch64bionic.zip",
        sha256 = "bd5fd176aa1de17355aec532db4b2dc1c9ca71f2af2e313420a3a2b3af156c5b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxraspbian",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-linuxraspbian.zip",
        sha256 = "2c2faac8563353644fd379d3fc4e4b2ec08ac3901ed1dafd44dc53c0ef8c7667",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-linuxathenastatic.zip",
        sha256 = "ebaf4a815d5bb1c4c4624ff1f437e9c1649b717096f153e8f2923995b93e71ac",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxaarch64bionicstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-linuxaarch64bionicstatic.zip",
        sha256 = "0d122fcffd79d1549ad1c60dc855165b3e5cd4ed99006d3a046ec5f87bc47237",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxraspbianstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-linuxraspbianstatic.zip",
        sha256 = "755ff3a9b6925b2029b8d5e6050749bcb8211b5bd62376c326a66e549cdc5409",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-linuxathenadebug.zip",
        sha256 = "991572fbe617c97d5677fc5d1b0c91cb4b7a90ff24a7320606d3c0b1a9015444",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxaarch64bionicdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-linuxaarch64bionicdebug.zip",
        sha256 = "7e97aba6069eb49c993e256c4268913a536f973149acdb1ea1ce771e79847a5f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxraspbiandebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-linuxraspbiandebug.zip",
        sha256 = "9b183a590a781ca32e53a9482c07929fbdebc4006b91d52881d8fde065eb3565",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-linuxathenastaticdebug.zip",
        sha256 = "69297219a219fff3e1f8e7a1baeafbcc7bba8271b79b3eddc80e143d2091be4c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxaarch64bionicstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-linuxaarch64bionicstaticdebug.zip",
        sha256 = "d0a19c292b559bd453a0d36445d0c7dd94016046f406968b8e61694f29ed9a2f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxraspbianstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2022.3.1/ntcore-cpp-2022.3.1-linuxraspbianstaticdebug.zip",
        sha256 = "0e0dfcd61ad6a1a36652be8dfd6a5d726a575ce250961da58e3e0495fc6064ae",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-headers.zip",
        sha256 = "8dedb7e250ef85dc295af3acfa28dacd50b8e401315f5876efe0bdc7b07e9a6b",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-sources.zip",
        sha256 = "8f66f029af1d0b184cadb7ce1ae0d06d35a570765a65e13a1878d12553e01993",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-linuxx86-64.zip",
        sha256 = "26d7e0f89b0a6db8089263906d19b055b27126651513e64a010c4090a52a3e2e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-osxx86-64.zip",
        sha256 = "fd6fc22e5e64a71128269e87e0ed78905dc6dd7adf242a52b0b8d668d045e4e6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-windowsx86-64.zip",
        sha256 = "b226bb259ef9bdf8809537da72c5f99e586e8f5b1c841043d52778dba4dbf97c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-windowsx86.zip",
        sha256 = "791530a994d9eb6fd9f7e2677874076e1837e45c0937af1b1295bddd71ca18d5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-linuxx86-64static.zip",
        sha256 = "7dcb9949831cdbeff08d2a5fa4978c04cb95684b23dacb2e19bde8c401049279",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-osxx86-64static.zip",
        sha256 = "a8ceea0e2afcc07a32ffe5b5311244aa74e94355699f05e597b09bd99670d81f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-windowsx86-64static.zip",
        sha256 = "09a998ee72499fa54e75d92ab8e7f71c6fba18f7c7ec97b2c225fa5c441cad5d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-windowsx86static.zip",
        sha256 = "a83ea711e0dcdaf5fe51e6ea285bf91921f681477abaecd4da6b70b36bcae867",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-linuxx86-64debug.zip",
        sha256 = "f9c02e8e9fdc5decf347b7a78e45de71465c42a9041faeedd713a9c8acb9e05a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-osxx86-64debug.zip",
        sha256 = "a87fae3656f2ab97482cb174302662e56e80688ff7faadd37100781b98db47fe",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-windowsx86-64debug.zip",
        sha256 = "17429ea928c90a046bbfce4237466f8733d19a4d8a1a77c1d1e5ab539cb69c24",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-windowsx86debug.zip",
        sha256 = "dd3e7342a6a10cfe3c3dc2f8a13a2168127f3f9e53b8f98e126f9f4aef7f6c2d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-linuxx86-64staticdebug.zip",
        sha256 = "ad742d63a195ded98fe698cd8505681d314fde5befecb2744788f27d4da8c216",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-osxx86-64staticdebug.zip",
        sha256 = "4c2ec55b537759e3e06337bce26ab109ba8ad70069588a3e30c082e4a6203dd8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-windowsx86-64staticdebug.zip",
        sha256 = "ccc7507eee6c5f3804b79a00badead4250396f98b7e3731e6d7b8329bf63c753",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-windowsx86staticdebug.zip",
        sha256 = "9dd0ac5d84d7999edccd3456496cde3d133b2ae8e34fcf2834355a5ab16f0fd6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-linuxathena.zip",
        sha256 = "2138ac93b6d201233587e9a1012fbc0cda44a7598525f1ae947362e0012d4a52",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxaarch64bionic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-linuxaarch64bionic.zip",
        sha256 = "ba35d2fbdd4ceecc86ac0f5ce41444c7151cd0d5c6c25a669e9d5fbbabb406dc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxraspbian",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-linuxraspbian.zip",
        sha256 = "1d5ba0e2cbb5e08fa22c1b15fc6b3cedbd27a5d1be79b568ecb285d9a14cb7b5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-linuxathenastatic.zip",
        sha256 = "c98593fd661d93a8d63e4a34e60c3c19688b552b815177c5178a0b2aaf490d7c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxaarch64bionicstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-linuxaarch64bionicstatic.zip",
        sha256 = "61c805a23179f5ff2c19dc2a28c46aa2b05b67fd9a016d327b3bce543314cab9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxraspbianstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-linuxraspbianstatic.zip",
        sha256 = "ba49a8879fc3bf6455b937fd46edab28c85e83113d4c817d903dbc9834e2a323",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-linuxathenadebug.zip",
        sha256 = "b26f6c4369866f367fb5422fdcac83f6c32a739f818dbcb9f9032046ce508620",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxaarch64bionicdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-linuxaarch64bionicdebug.zip",
        sha256 = "8b9461e94b5b9b30c0a133de555d6baf3a04cd73fded14e3cc4782bafdcbd439",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxraspbiandebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-linuxraspbiandebug.zip",
        sha256 = "0723fa0545277343df31fe9d23bb3e26a1eb0f3416086ba5a05796e6f6bc3042",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-linuxathenastaticdebug.zip",
        sha256 = "f1cb3813f5201fdcc07fe533208408c86c83a8100fbfc7f00a4f91c24364c7d7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxaarch64bionicstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-linuxaarch64bionicstaticdebug.zip",
        sha256 = "2e6e71b8b405e6be21335e0061af3b0a8072cd31d2c2909e2073b9adeb554c4e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxraspbianstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2022.3.1/cscore-cpp-2022.3.1-linuxraspbianstaticdebug.zip",
        sha256 = "dd564aba2f2f318999ee1ebdc00b3d70e4add6ad32307b65e784af159d647a24",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-headers.zip",
        sha256 = "cd5b6fe228e47fbfe5a5afefb421b19f9ca43f616340a0a7588bdf366b7bae82",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-sources.zip",
        sha256 = "cafc35d1109bc449520d12117f9b9b44e01d2e92eb0bf286f7bdd1649ff6b3ca",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-linuxx86-64.zip",
        sha256 = "baa1b09e3449e44a6d8bb7897ab681d9a4dce0ac02a25bc692bc6ee5bb8f0fbd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-osxx86-64.zip",
        sha256 = "fee7ca8766d0fcbfebf47ca61e846efde5b65ca337135817f3e68a073cdbbea2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-windowsx86-64.zip",
        sha256 = "ae15e43bff434134ec9fc91b93099a35bd15589ad33c20edcaacb64d42e4aed1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-windowsx86.zip",
        sha256 = "54933aeb524a8b86eb666da7df1cf6b22f1cb65d5da2da4895383e3cbf28bcb0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-linuxx86-64static.zip",
        sha256 = "5958825828e28638b0e134c6b715850474d516d550078e7d6b33027545a1d6cf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-osxx86-64static.zip",
        sha256 = "106f411e1ad77f9550d0e283b90295df078546094d2bff68afb2ff9aad85d0b0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-windowsx86-64static.zip",
        sha256 = "28f0c2cb631a262784a45090b5614d487cc0c97dd4f8ac939d8117c5bf9bab36",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-windowsx86static.zip",
        sha256 = "52edf6b8e7772b15fcebde2a5e36953b3cc41c0a7c34ac4789e23f4157c2cf93",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-linuxx86-64debug.zip",
        sha256 = "e5c27c7e6af3e59aec25123bf5bac5cde90e03f027b617311ebea79842d18327",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-osxx86-64debug.zip",
        sha256 = "e3f0e6d2a43cb389c3d4f512a15a76322a65cffffc8f00e023a612f24f0cd30b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-windowsx86-64debug.zip",
        sha256 = "0b4faa945f93281659416531fcaa86c06da05e506a530d7d2f9bc1da342800f5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-windowsx86debug.zip",
        sha256 = "84d6a24de5f2ad2e506b1e0494831b815642e6799f1fb3620a744243ff0a2c45",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-linuxx86-64staticdebug.zip",
        sha256 = "894c438ca82d64fe55a614cde6e99c05513576a29b3dcefbcb7ae2a5d634fb6b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-osxx86-64staticdebug.zip",
        sha256 = "4f52d9eea9a326f11bd00e336cc265938f547c6135a976ec0ed8f6ff985e23aa",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-windowsx86-64staticdebug.zip",
        sha256 = "87e0f9480562d77530ef59c3d818f8cd382a3ccbda011b653694c4a2eca5ecaa",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-windowsx86staticdebug.zip",
        sha256 = "943472aaf1604d1c64c45925dddcf384bd91886a067a4480d91f06a390ae2f71",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-linuxathena.zip",
        sha256 = "a320c34a5269affe3edacbe21233fad4f8f84f2820a2a0fabeed776b3f234bcf",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxaarch64bionic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-linuxaarch64bionic.zip",
        sha256 = "8938e5403edd405afb7a66af9c7fead1d4406b476acd1997f4b5fd2d4182c7af",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxraspbian",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-linuxraspbian.zip",
        sha256 = "0c4168a9f2c1c75d4acfb7990cbe07f1c9ce9e9cf68041c6791bc9d47bf1223a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-linuxathenastatic.zip",
        sha256 = "e312a1705f51e565873d43257779426ea14dfe7a14d49f5c595979ff7d85f603",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxaarch64bionicstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-linuxaarch64bionicstatic.zip",
        sha256 = "8ad53d12b438b455bbe515014686305b57fa1829463d10ed084047f6fa7854f2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxraspbianstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-linuxraspbianstatic.zip",
        sha256 = "b500cf800954fece5108ca7d201de88f73c4398a725ee485b900978e3078a624",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-linuxathenadebug.zip",
        sha256 = "8ffb890b7dc3d922c3e2e554e1159158d2f0270784a9a3e39b59dc243019398f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxaarch64bionicdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-linuxaarch64bionicdebug.zip",
        sha256 = "eb0c60851317240627353083c8be2f4403c99f22e0d78c858d42333dfba93f70",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxraspbiandebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-linuxraspbiandebug.zip",
        sha256 = "8de4423093dd8e1b8e58e7b68e4cadfe518593df794cd068096111c447403997",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-linuxathenastaticdebug.zip",
        sha256 = "41152da30e5a22a03562797f154c8c051910963550a36bf364ba2d00dc967c33",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxaarch64bionicstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-linuxaarch64bionicstaticdebug.zip",
        sha256 = "564df3e69239cae68b6ce5bdfeae8c77f14d812759cb80be6896705932ee9bfd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxraspbianstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2022.3.1/cameraserver-cpp-2022.3.1-linuxraspbianstaticdebug.zip",
        sha256 = "6cadaa6b30288698e7e2ccfcb6334bf332f79607fe0c4db6c7cc5ecd7ac00157",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-headers.zip",
        sha256 = "08d44dbb083e1fa78cb368f40008dac1ce0657e085efb6e638cf57bed1cc0ccb",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-sources.zip",
        sha256 = "a40ae7128ff5ef97987e9a210818dd777265083f085b05f20fd377dbf157ef1e",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-linuxx86-64.zip",
        sha256 = "8a40480db72768416d827c053a7345d3148247b76de73518fd5d419c417b6555",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-osxx86-64.zip",
        sha256 = "ec7d4804ae45676cf4f8aa23c3745b479b15792864dcbfef9c220ae82c92dc00",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-windowsx86-64.zip",
        sha256 = "0831a9a74cc5e55ce1485a3e9d58528a0495d01f72297cfaff7da962cbbe645e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-windowsx86.zip",
        sha256 = "4b5c60303f8cb2263f01d99318900be0727d28a98a4599cefe57308fb6a1235d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-linuxx86-64static.zip",
        sha256 = "8635df216d0170daff2750052d8959865660e9c147e183d451f9215b14510b71",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-osxx86-64static.zip",
        sha256 = "b00fd2a8dc536ea774113c4a2269ecd6c3dcfd04f7f8255d86219a94e5eaa76f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-windowsx86-64static.zip",
        sha256 = "4a252231dd3fa0e8409ba0f2365402f91d2eb64278be56f1fb72e94967ea93f6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-windowsx86static.zip",
        sha256 = "f61c5dd888fe9d69a5e2835ef44d14c7534c9ddc7f730cf44cf93e0e16bb59a1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-linuxx86-64debug.zip",
        sha256 = "e2a0ea47ed730d0908cef36098ccf2148ba5916647fc1b342cf008905de8a016",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-osxx86-64debug.zip",
        sha256 = "315f76eae4d457c498947ac373070af4c23af918911e449051680e9f58917a7a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-windowsx86-64debug.zip",
        sha256 = "b8e92769c3951868c023604506e8293e77491fc714a60ae6e6ebe1f9de48dd06",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-windowsx86debug.zip",
        sha256 = "f86f68b418607f83cd7ea306a605497bb1249e379c9ee3166f621352036f2ec1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-linuxx86-64staticdebug.zip",
        sha256 = "b747d109be9de20b18649a4c68c3a7db6a69e2b98787316eceb1aee094100f08",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-osxx86-64staticdebug.zip",
        sha256 = "098754fc462d05d778690514da430e31cf83d28d0c3a03d8a0b1f6b69731e58d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-windowsx86-64staticdebug.zip",
        sha256 = "2a55c686b4ed1856087e4b61b769745f802a345015f8115fcb2cb4e5a676dd0b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-windowsx86staticdebug.zip",
        sha256 = "b25f522fe4b1c57e69adc978247a142cb8fbb4e49abf96c88802b81f822be6d7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-linuxathena.zip",
        sha256 = "03b59f53190c01df9069541dab1411301885904d5937dad47464ea23254fcc54",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxaarch64bionic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-linuxaarch64bionic.zip",
        sha256 = "1beadf25cd504ba4d5e00fe7315aff7a1c3f700d074ddb8b5ad1a225738eaa42",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxraspbian",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-linuxraspbian.zip",
        sha256 = "66298d4852d53a65cfc8aa3de04f65f649893a1f206ea2efcdf9b0fe2e85305a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-linuxathenastatic.zip",
        sha256 = "29e9c868c92120b811a8815d870f96378102a7d7621daf4551fbe8643e5803ad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxaarch64bionicstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-linuxaarch64bionicstatic.zip",
        sha256 = "a622c13bebf26fce9eef25812743ce8c982c484681c2c0d7d4aeb26a51ff3844",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxraspbianstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-linuxraspbianstatic.zip",
        sha256 = "d6800678032d72dead85e657533a70d9651a9646631ddfd8205b5c1dd656abc9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-linuxathenadebug.zip",
        sha256 = "c7bce106d2e2c4ac5fd6999db66e52cdf520f5953bff7649f1ebb6659560b3ed",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxaarch64bionicdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-linuxaarch64bionicdebug.zip",
        sha256 = "e31054732175b96ce9756a088d296fe6e09f55c3766e8e9a72e37e01ae312ab4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxraspbiandebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-linuxraspbiandebug.zip",
        sha256 = "c80ce5a6e7c2054cdf2938e434988280471e9123a82e3fa16f9f4efb45552d51",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-linuxathenastaticdebug.zip",
        sha256 = "5f4438e968b9c9967a25b92ee835c14ce63c8f96bc2798dd18fab6608e92f49e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxaarch64bionicstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-linuxaarch64bionicstaticdebug.zip",
        sha256 = "0cd0ba3936e5f5e7ed642bbfcf7989224047eedb5f797841e8822842601767c9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxraspbianstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2022.3.1/wpilibc-cpp-2022.3.1-linuxraspbianstaticdebug.zip",
        sha256 = "dcc7fbb075bd4362001504e7ddc6500cf5539d436049cfcf68f0b22680be2264",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-headers.zip",
        sha256 = "e09ac861c660167411cf2bf4e15d69ca2ee28743f50a57326a0a107fff6678f5",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-sources.zip",
        sha256 = "e60691c422da5bbabf46269815ca6507df4d038cc5302e4f75728af49d5ced91",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-linuxx86-64.zip",
        sha256 = "775a0f1fa6669f94e0e0eb748dfc4603501209d9237fc175e10f94234c56b276",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-osxx86-64.zip",
        sha256 = "6eeab13703d9470e6c8be8f7e54704f517539a76af51c4be94ab9ceee489dbfa",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-windowsx86-64.zip",
        sha256 = "a5aac1d6f953f635696073fc6912946f8a13559cfd3873d92fd226a8aace775a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-windowsx86.zip",
        sha256 = "e713c7012dda36490bd1c87ed1eafeb9d44119ced4f4b372813d2d66511b7026",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-linuxx86-64static.zip",
        sha256 = "b44d16cf68ef0a3798b9fc4559335350dcc8a37d8f211c5dc8e951b4da10bbc8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-osxx86-64static.zip",
        sha256 = "2f32558ec744239e7a2a9cda6eba328ff942a833b7fa9884a00fa55b572f3c77",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-windowsx86-64static.zip",
        sha256 = "4e576cb44428412c59971c1e40c8fb258776979784cc2086a29ce34e1521a71c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-windowsx86static.zip",
        sha256 = "cc27f37ea157c780adf3bdc4fd6c9bbabd8c19fc427b82286fd1ea41fe9b947a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-linuxx86-64debug.zip",
        sha256 = "566b185b36d6a9ff07e48d62d04ce089836e1214a1b8e7d0231879109de4cb63",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-osxx86-64debug.zip",
        sha256 = "6e5a209d166ac2cc90d26a7e155e79c3c20438775362a465f422fc103f6aa137",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-windowsx86-64debug.zip",
        sha256 = "a9a6e11351ca580b78a42d1c7040bc2cd5e5c0e5f489fd9b0077558726320407",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-windowsx86debug.zip",
        sha256 = "ff193e963ab229e773f921f2e5ead9b52894ea9d2f0c44d80c61c5d9965dd1c3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-linuxx86-64staticdebug.zip",
        sha256 = "58991dd631bdab8393c9895e429a3d6179884e8cb2e33d2eb986616714cfef93",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-osxx86-64staticdebug.zip",
        sha256 = "f0bf771789bbabbf0dfc88dd136977f48cb026eab342ec88d493e709c70cf492",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-windowsx86-64staticdebug.zip",
        sha256 = "64976fb0013f75185468b8b86b0772b2dca01034a966f2357a72a6d40e09fe93",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-windowsx86staticdebug.zip",
        sha256 = "e164974c4558e96435c844c892379df664a3390b177e23c526c330f82628a46d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-linuxathena.zip",
        sha256 = "b7897a83641f8e61be5151683293d7682748e17e8eefc149b2e4df1b7537f0d3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxaarch64bionic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-linuxaarch64bionic.zip",
        sha256 = "04875d61abba2653e798dd60a850213f3b070a55876195e6166bdbb419dfd638",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxraspbian",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-linuxraspbian.zip",
        sha256 = "3cbbe74176f440ee506bc8ef386691205c1fdf431adde5fa148faa7adc61af30",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-linuxathenastatic.zip",
        sha256 = "fd1ef74c0379b0a9d41fa39e480326cfcb63cfe56767eac747f4dd5c8c9deda7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxaarch64bionicstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-linuxaarch64bionicstatic.zip",
        sha256 = "678adfa05fd48b9632b81e62e8cc34860a96c462805485fb52aab7f8c617d692",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxraspbianstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-linuxraspbianstatic.zip",
        sha256 = "7ce1a69cc5334ff4fb2c4bac9d80758abe5298927942ad380f98234416d630a8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-linuxathenadebug.zip",
        sha256 = "c07427082a5ad37ff4bba638da6b13613691a12100ad95db10e394da2da89dcf",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxaarch64bionicdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-linuxaarch64bionicdebug.zip",
        sha256 = "9efeae3b66b3ce876f780c5387c0a4f7c5ca8b648135d386c108e2710cee9e33",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxraspbiandebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-linuxraspbiandebug.zip",
        sha256 = "171730bbc74b4347e45ef6df3243b4180024bd8fab49dc2a12ffbcd872ac1ae2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-linuxathenastaticdebug.zip",
        sha256 = "c022a71e44dbe5f91b5f73741d2e3ef59e546e859d4bb93d25543cd9e45c4a95",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxaarch64bionicstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-linuxaarch64bionicstaticdebug.zip",
        sha256 = "a8e195f42df8fcfc0a4b1b465bc03892ad5283275721daed61f1930fd34e2149",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxraspbianstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2022.3.1/wpilibNewCommands-cpp-2022.3.1-linuxraspbianstaticdebug.zip",
        sha256 = "f053f751522fd061614073bab1e777d92a66a4759b24ae1894df9ad059ab6fb5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-headers.zip",
        sha256 = "e58b114544eaf08954f390f94752ab250cc04142f10ea36d160b07e750601571",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-sources.zip",
        sha256 = "76f6a144ab47ec52b4957c57a0366a91221f0922a5112e1455ecee73eefcb659",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-linuxx86-64.zip",
        sha256 = "a78d92300ad6e9e188e9a0d8eac7cb27d5dfc3f47351af28dd47b2ea9fa971c2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-osxx86-64.zip",
        sha256 = "4b69de5a167206af3ae668a29cd5a423d46f8c02eed13df7bf9d1e7bafab7f50",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-windowsx86-64.zip",
        sha256 = "4cbb4a0de241d67f5797fff3d87748e11c1beb2034b2ec026b677d067c28d74c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-windowsx86.zip",
        sha256 = "faedddbe825c26f969382a6b6c4efda5ca83f54236aef53da2e2136761f70e0b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-linuxx86-64static.zip",
        sha256 = "899fab875b68ea42a81676381838d5f8bb4dca9f30f30dec5999621da72ec6bf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-osxx86-64static.zip",
        sha256 = "5af4e9bfb789d321f671651ceebc6e0a77fddb162ac8c4f1165247166923b4a3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-windowsx86-64static.zip",
        sha256 = "b8ee5b3afcb60b674fd6215feafd8853e2538536e5a8513ece64f3351a1fd9fe",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-windowsx86static.zip",
        sha256 = "1fa65e271a4948df8c9dd56e39b95ec38bbbf028d1a794f4cba9c08c6377725d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-linuxx86-64debug.zip",
        sha256 = "a3c4a3a6bcd579bc4f32a2c377e28838a6fffcba74a5e88b6302ab53f4e5ea8a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-osxx86-64debug.zip",
        sha256 = "4f934f781ed91a6e1ab9408f2a4b009d75aea846bf259f903f9c61e08dd2ef0f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-windowsx86-64debug.zip",
        sha256 = "e419f83f43da9776d9785addcfd1cc1ebd7caa6de656daed2ba3ce0fccffaac4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-windowsx86debug.zip",
        sha256 = "605f9f3b643c88f17bfced5a224a99d82e9c21e0d3710d0c1b9406d9f1128cb1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-linuxx86-64staticdebug.zip",
        sha256 = "a7b3e76de9ab3a00f4dfd4c6ab6ecbe5c6e89163574dc01d68501d0e29421ea9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-osxx86-64staticdebug.zip",
        sha256 = "43af96fc72f48bb56d3143baaad0aaf2644a3ba3efc2df261026645f733e2ec3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-windowsx86-64staticdebug.zip",
        sha256 = "a8b4ce84c030683f8f7a6ed5793c57ff7f334050e8151c4215fc8fec5ec79df7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-windowsx86staticdebug.zip",
        sha256 = "2d5cb69bcd3d239679070c4e353c3679e09a23c708957302fb1f86197d7ce74d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-linuxathena.zip",
        sha256 = "f9e715c9c66fd6e4e244476cbcfa69c4e7ed99e1b0a9a24ffcc8e66c8a00b4f0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxaarch64bionic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-linuxaarch64bionic.zip",
        sha256 = "0341fe10b9e9922280646e67c6c657a4090d955f693e8b147072af0add3aef06",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxraspbian",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-linuxraspbian.zip",
        sha256 = "e0e688eb896c7f9d305c0089a58ef41cafc700721dee8bcea9745582203dd19b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-linuxathenastatic.zip",
        sha256 = "3dedb00896df19f260c8277bb05456661c3c0dabbd0b0bf9a0b270e6c90615f1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxaarch64bionicstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-linuxaarch64bionicstatic.zip",
        sha256 = "bccb3ec925f9be19f01d1fd68cdb72a52b50ebd86bfad873ddbdf85908eabee6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxraspbianstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-linuxraspbianstatic.zip",
        sha256 = "04b0772278e40deca104fa35af9f35c216ce962a9cc8385dac21d214f278e84d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-linuxathenadebug.zip",
        sha256 = "8e564acf9d1327e6c0671d23eba3bb21c80621a5e4baf508115d79ef573fc677",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxaarch64bionicdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-linuxaarch64bionicdebug.zip",
        sha256 = "5175964ffa80c04c4e56a102a65e1df4885f71b23872137fb262b24ecbb54482",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxraspbiandebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-linuxraspbiandebug.zip",
        sha256 = "e21169559b28447c6fb4767ba701a4dd245e9d3d4657b7c5894a7986d1e6cf71",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-linuxathenastaticdebug.zip",
        sha256 = "26109c9945a98f722cd9fef8a1051ece341cb6ea87947802d356de24890352ef",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxaarch64bionicstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-linuxaarch64bionicstaticdebug.zip",
        sha256 = "1645f7ff8b7c7e0d79f03a1e1aaf0d8494ad4e5048c70720eda1305bdb70d250",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiliboldcommands_wpiliboldcommands-cpp_linuxraspbianstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibOldCommands/wpilibOldCommands-cpp/2022.3.1/wpilibOldCommands-cpp-2022.3.1-linuxraspbianstaticdebug.zip",
        sha256 = "0a8ebcb18e64b0dc29bc956fe924999186cda210f8d827e57480d76eccc0a63d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.3.1/halsim_ds_socket-2022.3.1-sources.zip",
        sha256 = "f1d8fd0e639569bb8e7c0cc22a81965852bdd0e83c0ad1cd87adc1b9acc62b2c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.3.1/halsim_ds_socket-2022.3.1-linuxx86-64.zip",
        sha256 = "6144ae22f597d9ca21ef9309a7c7da3cce95aef629d3a2ac953a20c940939ba1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.3.1/halsim_ds_socket-2022.3.1-osxx86-64.zip",
        sha256 = "19347c9919a4b06e0fbddc8cd66e5501d29a4e29a9f352f39d195be8800ec130",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.3.1/halsim_ds_socket-2022.3.1-windowsx86-64.zip",
        sha256 = "e7ec80af722ab3a8c99d6bf393f95e32dd6e09994d07b52190aad9a4c42440a2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.3.1/halsim_ds_socket-2022.3.1-windowsx86.zip",
        sha256 = "c29cbdedf3cc86a0ac1ecf92ec35700556bd26bedf8a3cdae05b23f13933b665",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.3.1/halsim_ds_socket-2022.3.1-linuxx86-64static.zip",
        sha256 = "92f7b0a955d1eeb3c63202023dda05f9119c0aa598b4e211e99074ae19c08c1f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.3.1/halsim_ds_socket-2022.3.1-osxx86-64static.zip",
        sha256 = "6d21749576015131e0b88b39cedaa87b9a67a38867229396c28d84047ca26b98",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.3.1/halsim_ds_socket-2022.3.1-windowsx86-64static.zip",
        sha256 = "13d2a664dc97b6fa2fe851febc4a0eb75d91726b3fb285968f1ac98708f892e8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.3.1/halsim_ds_socket-2022.3.1-windowsx86static.zip",
        sha256 = "9a319341f0eed274d183fdf2246388e60b988fea3a545bd4f1b8d6ac3cf00ee9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.3.1/halsim_ds_socket-2022.3.1-linuxx86-64debug.zip",
        sha256 = "dca7f0c63311273a863b4ed298b5c1f41c73705859f05981a7b97bd179dec93d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.3.1/halsim_ds_socket-2022.3.1-osxx86-64debug.zip",
        sha256 = "b3295364fd371a7256a01e8b3d0c74313ad72706f91c554c2c04bcc8a28a6f38",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.3.1/halsim_ds_socket-2022.3.1-windowsx86-64debug.zip",
        sha256 = "33bdd5f3be10f5be72269042bd648ac995f9c50144616b0b892a8715371f0117",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.3.1/halsim_ds_socket-2022.3.1-windowsx86debug.zip",
        sha256 = "e6908eb83562ac962596cd8d413915ef05666b4efd75207ade4e2ef6e88fb1c2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.3.1/halsim_ds_socket-2022.3.1-linuxx86-64staticdebug.zip",
        sha256 = "77925f540b92056f98d2b91da9d500399d8ac3820ad7c1133b28b6e8de7ec992",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.3.1/halsim_ds_socket-2022.3.1-osxx86-64staticdebug.zip",
        sha256 = "d3912442a261014688caec858a0821ab8650614cceffc66c92c69f1afef8d35e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.3.1/halsim_ds_socket-2022.3.1-windowsx86-64staticdebug.zip",
        sha256 = "dbec05fe555496e7bd9f76185aa5a017f42cedaa468de0d077f34ef8661414e5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2022.3.1/halsim_ds_socket-2022.3.1-windowsx86staticdebug.zip",
        sha256 = "2928cfec59d11cd345d677e1136f8aaeca67577c642075f86321f79976baf5c9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.3.1/halsim_gui-2022.3.1-sources.zip",
        sha256 = "c4bf777464215581d99e208bceb77c0e6daeb7047b0e22dd399904e3b5cf4a58",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.3.1/halsim_gui-2022.3.1-linuxx86-64.zip",
        sha256 = "182d81197bde187737131802e9df0e4aa32eac6a925e8d9fbddbc29fe107fc3e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.3.1/halsim_gui-2022.3.1-osxx86-64.zip",
        sha256 = "3dc1ea448b05985882f4bf356d8ba8f34abded52303c62312ee39235e1c9fd5d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.3.1/halsim_gui-2022.3.1-windowsx86-64.zip",
        sha256 = "4ff4c97108467f8d08986f6cf64bbd82b4a117e367d04394dcf18286ae95fd80",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.3.1/halsim_gui-2022.3.1-windowsx86.zip",
        sha256 = "2859ba8b42aee1ebc9cee4841c564840135d9e533a52b9d6b541d1ca6b77aeee",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.3.1/halsim_gui-2022.3.1-linuxx86-64static.zip",
        sha256 = "4e4ae249eec0ecbcae9d81a2374d19ded2d3e49da284d7e6457f12fa467878fe",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.3.1/halsim_gui-2022.3.1-osxx86-64static.zip",
        sha256 = "b5191d62d6bbf42b56fdcf007b1107b0b8aa981f319091a39475e865257c9e98",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.3.1/halsim_gui-2022.3.1-windowsx86-64static.zip",
        sha256 = "0e8edf901204d7e54f4898f4949a3fcba6e21f9ba8f7a1142b643a25f8bcc446",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.3.1/halsim_gui-2022.3.1-windowsx86static.zip",
        sha256 = "565e0b24772cb021293053e313f5fb36cd93983d508a553519981d8c625ccf11",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.3.1/halsim_gui-2022.3.1-linuxx86-64debug.zip",
        sha256 = "e46b3465c55effffe5082d9db28f661deff7508f13d67113c9363e8a86a6741d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.3.1/halsim_gui-2022.3.1-osxx86-64debug.zip",
        sha256 = "016d9fe7bc10c018653b6d40e7e8266ccbeef95c741e51befb2363fbba6132f4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.3.1/halsim_gui-2022.3.1-windowsx86-64debug.zip",
        sha256 = "3d90de01423999eedc8b12e0913563a328bde899e3eccf4307008e683b7840c2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.3.1/halsim_gui-2022.3.1-windowsx86debug.zip",
        sha256 = "de684223966ea1a20ced3b19afb136a6dc3dc7a339b6d967fa166de661c034ea",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.3.1/halsim_gui-2022.3.1-linuxx86-64staticdebug.zip",
        sha256 = "54bb7291fcbb8b6f2b80cd31df99c57d56fb33e00c57aff3a513bf7fc1e1a452",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.3.1/halsim_gui-2022.3.1-osxx86-64staticdebug.zip",
        sha256 = "241d02e4c42e922639e6b6236e70f0eead648c89b62000461f87271673421f8b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.3.1/halsim_gui-2022.3.1-windowsx86-64staticdebug.zip",
        sha256 = "232d96ac6c6515269470fe41087f3b284df39b74cafe5da35fa48fca6198ebc0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2022.3.1/halsim_gui-2022.3.1-windowsx86staticdebug.zip",
        sha256 = "28310b65abc4261c6bf60adefad748bcdd3161371434120dadd752441c2440a2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.3.1/halsim_ws_client-2022.3.1-sources.zip",
        sha256 = "dd4c890d83c1420937aa2279d1d6b0f5827b2186fb49064acd626c97f65f9695",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.3.1/halsim_ws_client-2022.3.1-linuxx86-64.zip",
        sha256 = "5d868a19aa9141da24b5e7851e537de18012f0cd530d7e3488b062877d64fcae",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.3.1/halsim_ws_client-2022.3.1-osxx86-64.zip",
        sha256 = "7de5347216d218bb5ca229a0a974592586f342543911138f0165cfe07bb54200",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.3.1/halsim_ws_client-2022.3.1-windowsx86-64.zip",
        sha256 = "9770c4de069a23c96fec1dbc08cf5fe4af8d71c43be919e57248a2d3aded29e1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.3.1/halsim_ws_client-2022.3.1-windowsx86.zip",
        sha256 = "98c8a60ff89fadeb152e869eb4094ac3222301070640fffbf28355fee43c7c6d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.3.1/halsim_ws_client-2022.3.1-linuxx86-64static.zip",
        sha256 = "c5c9914f4d26479a65cc9700b0eafda03653ced8e87e0a3f3ae143ea4843918e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.3.1/halsim_ws_client-2022.3.1-osxx86-64static.zip",
        sha256 = "2fe557ed36730855760d1dca0de3d8c5801799feaf1c1bb5df6862b2aeed3fc3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.3.1/halsim_ws_client-2022.3.1-windowsx86-64static.zip",
        sha256 = "2ece2588d4755c31ac9ec95835990b53c88f8ae64d4d133c2d7333d9516b59dc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.3.1/halsim_ws_client-2022.3.1-windowsx86static.zip",
        sha256 = "c8ead9f537c5d83568bf7d4e5392384ad0da545da0d36aefabbc51dc3bfa5041",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.3.1/halsim_ws_client-2022.3.1-linuxx86-64debug.zip",
        sha256 = "e5ee028a275fef00d5f440fa20750f1329b1b115b68b66d17f2fa7c88be5a879",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.3.1/halsim_ws_client-2022.3.1-osxx86-64debug.zip",
        sha256 = "e2d8e7c31d1ff9a6877c568978bc0b2a5d678645a8bf1a9ba230e66fcbe48af4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.3.1/halsim_ws_client-2022.3.1-windowsx86-64debug.zip",
        sha256 = "d88cd5ddce56f842fb3879592042fdd46eb754d47e09334e8c633991d3df7acc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.3.1/halsim_ws_client-2022.3.1-windowsx86debug.zip",
        sha256 = "065d7d7076cca553aa663c63e5206ec592282b9554815ac67971d3ac6897245b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.3.1/halsim_ws_client-2022.3.1-linuxx86-64staticdebug.zip",
        sha256 = "e6b40353e31ee072cbc37d1cf72e5225fc44a86940b8a2dfbbf833ca5cf014fb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.3.1/halsim_ws_client-2022.3.1-osxx86-64staticdebug.zip",
        sha256 = "ca5298b3fd4930aaa55e92d1162bca21e955ccce70709e9c8d1993e09c28c872",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.3.1/halsim_ws_client-2022.3.1-windowsx86-64staticdebug.zip",
        sha256 = "f71a6a02b69d59643829c8ba0079a8c3df6ba81cd1347a0e036a909d7bef98a1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2022.3.1/halsim_ws_client-2022.3.1-windowsx86staticdebug.zip",
        sha256 = "178e2083df708adfba785a91fb037388b2b7149ec5292d7b70a7cfc9ecc00308",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.3.1/halsim_ws_server-2022.3.1-sources.zip",
        sha256 = "8e4a53e8769b58456a76d1e13e7b4db56c0b615810e65f9cc72a72917cc9e4d7",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.3.1/halsim_ws_server-2022.3.1-linuxx86-64.zip",
        sha256 = "7b53fae1648fe6ef693db94c57999dda6b4c8eef8e0969fdc1715a42ef90105d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.3.1/halsim_ws_server-2022.3.1-osxx86-64.zip",
        sha256 = "638680ce16a2e401cba08afe58218de85aaa5681d70a8a88276e4d9f86409837",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.3.1/halsim_ws_server-2022.3.1-windowsx86-64.zip",
        sha256 = "2d02091165ef1215861acf028e231eb0d58e7dc322878d3e5d6d10f2bfd6b2ee",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.3.1/halsim_ws_server-2022.3.1-windowsx86.zip",
        sha256 = "0726d211100adefc8301441c859e8a3c078ce8e213e6dcccca20c2e435872723",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.3.1/halsim_ws_server-2022.3.1-linuxx86-64static.zip",
        sha256 = "42dcdedb842033c6f0780f293b1c3d3d2e935c97418356a2f962ab3f64f20d30",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.3.1/halsim_ws_server-2022.3.1-osxx86-64static.zip",
        sha256 = "3f2f7ac87668a8dd5ccdede01a0473a5e2b7772a969def929cbe35e1a76c7904",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.3.1/halsim_ws_server-2022.3.1-windowsx86-64static.zip",
        sha256 = "070bff1fbbe0d837ac856150e81c93744bce0c270568122ca8fef091e39abb92",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.3.1/halsim_ws_server-2022.3.1-windowsx86static.zip",
        sha256 = "069f6b39ece2d3793b0158467f1c68ec0a5949067b15fbd451264b03771a383f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.3.1/halsim_ws_server-2022.3.1-linuxx86-64debug.zip",
        sha256 = "1788bd5b6821764a29a64aaa31cec1220a269fee477cee0063e24d0796ffbea6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.3.1/halsim_ws_server-2022.3.1-osxx86-64debug.zip",
        sha256 = "b4905cbfa29eba2411e62bdd7a266a3a6da3349c4356851cd9f97109cc04594d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.3.1/halsim_ws_server-2022.3.1-windowsx86-64debug.zip",
        sha256 = "d0490739f47ab40b0d265c4eaaccfc48bd35a4a190a2e5f7c4e61d9d1f63c64f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.3.1/halsim_ws_server-2022.3.1-windowsx86debug.zip",
        sha256 = "a234e0b157c4bd05b087b5206453376e8254d4a104d6fff8ae162f1626846502",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.3.1/halsim_ws_server-2022.3.1-linuxx86-64staticdebug.zip",
        sha256 = "dd705d2065873e2b4d73db5c4823c59a54cc3c85d6d3a47bcdfd41f765827c90",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.3.1/halsim_ws_server-2022.3.1-osxx86-64staticdebug.zip",
        sha256 = "3efa73ac60f907d16ca6c71b27bc3538eae252c2a178fca953a98a7b7a45e8ad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.3.1/halsim_ws_server-2022.3.1-windowsx86-64staticdebug.zip",
        sha256 = "d24874cf8b8817241cb17397eb4c1d7bcaa1b7e8a96627e7437eb25fb90c3877",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2022.3.1/halsim_ws_server-2022.3.1-windowsx86staticdebug.zip",
        sha256 = "09ef635ace28364875d722658dfe053345ef20195272f982b7dfd56f42919565",
        build_file_content = cc_library_static,
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linux64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2022.3.1/SmartDashboard-2022.3.1-linux64.jar",
        sha256 = "3b465c5ab6c7e818a34a7b7290ae47ccf8371ccbc22bc8564c9e548eafed9bea",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_mac64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2022.3.1/SmartDashboard-2022.3.1-mac64.jar",
        sha256 = "18d62bcb38dc3a19a3e442469868a61fddd237d98eb677cf601bc789d8f99a72",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_win64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2022.3.1/SmartDashboard-2022.3.1-win64.jar",
        sha256 = "6ff95ee11d0200a2afccf0eaf6baae97d7d9c10daeb5abb4a44b0543ddb427b6",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linux64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2022.3.1/PathWeaver-2022.3.1-linux64.jar",
        sha256 = "721872bc9b8632b3ac81f142130b0bbc0dae92d6412c92bfc0fbca9831820d0c",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_mac64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2022.3.1/PathWeaver-2022.3.1-mac64.jar",
        sha256 = "8e50b96a70589016bb06959ffbe93ca8730c7fc15ad85a17a7e0f3698527c286",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_win64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2022.3.1/PathWeaver-2022.3.1-win64.jar",
        sha256 = "c91eff2453da0aa43c87d65ef11867b59cf0569c0574a1be6c8816be84585687",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2022.3.1/RobotBuilder-2022.3.1.jar",
        sha256 = "90798f631e72021cb923fc48e33a5034c979486ada2dcc3e46f584def30a8982",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_shuffleboard_shuffleboard_linux64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/shuffleboard/shuffleboard/2022.3.1/shuffleboard-2022.3.1-linux64.jar",
        sha256 = "bbacdf55546afe376e5502dd42e55f8f3f4261ca198b1d36e28ec40eba7b40a4",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_shuffleboard_shuffleboard_mac64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/shuffleboard/shuffleboard/2022.3.1/shuffleboard-2022.3.1-mac64.jar",
        sha256 = "1e55b4687f4d2a658ec9e16b8525a6ac10a7f2d61dc41b9875f93ae5bd2c1246",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_shuffleboard_shuffleboard_win64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/shuffleboard/shuffleboard/2022.3.1/shuffleboard-2022.3.1-win64.jar",
        sha256 = "15764849f38f86dac4e5627d463c5e864a366f117cf24fcccd5953fdc45353d4",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2022.3.1/Glass-2022.3.1-linuxx86-64.zip",
        sha256 = "9117a6652981e2081ff4b8c9c92a04c8d627a06138e5c423abe4baf14f95c4ef",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2022.3.1/Glass-2022.3.1-osxx86-64.zip",
        sha256 = "d5d6ea6137865e6ce5237c3cae05a21b48e300528c8a6fc29e81856f5d45e045",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2022.3.1/Glass-2022.3.1-windowsx86-64.zip",
        sha256 = "a96ed69635ded9db44e38b2548bcae22bd2740a127ac423dc6e183802fa28d1d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2022.3.1/Glass-2022.3.1-windowsx86.zip",
        sha256 = "3da56f75e17ab1d60f8b7680de1f6a5321dd95201a263766e68aaa421c19783a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2022.3.1/OutlineViewer-2022.3.1-linuxx86-64.zip",
        sha256 = "8d45cfa3165cab3fef4230cf6a4838d2ed88e155995e6194f326ae44da776d3a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2022.3.1/OutlineViewer-2022.3.1-osxx86-64.zip",
        sha256 = "e9ed22b76a3968a7d5a03dfbf0548a31e4f13bab55e3ffdb3cab0aa7ab04c7b2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2022.3.1/OutlineViewer-2022.3.1-windowsx86-64.zip",
        sha256 = "12c6f2e09ee6df47c03f7810a0100626636634ad47043acb4cda8c5dca649843",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2022.3.1/OutlineViewer-2022.3.1-windowsx86.zip",
        sha256 = "303584938894d3ae82e70525e1ede28f8f8ba9582ba390bbe947f10fa6223044",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2022.3.1/SysId-2022.3.1-linuxx86-64.zip",
        sha256 = "cd8fec2af0c641434557c4d962f27c2f3a85984750dddd36015a79e0f302474b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2022.3.1/SysId-2022.3.1-osxx86-64.zip",
        sha256 = "8ded568e703e3450bc84e7dc95002a7fdf4897b8d02546a8c2a4aadc0be22e19",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2022.3.1/SysId-2022.3.1-windowsx86-64.zip",
        sha256 = "65c023a592b4175f62b29c815bd71413ca402e4b0200493f597256d2a1b14324",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2022.3.1/SysId-2022.3.1-windowsx86.zip",
        sha256 = "18a6d81accca08b93d643ee8a819660b19f8185fca1f80278a99f684e2248dbd",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
