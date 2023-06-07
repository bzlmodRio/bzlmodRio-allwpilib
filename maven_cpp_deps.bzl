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

def __setup_bzlmodrio_allwpilib_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.3.2/wpiutil-cpp-2023.3.2-headers.zip",
        sha256 = "4fb3ccb42fe750ccbacb7bf1d8d39ddee60e87b801d0ffb3c4a44ba32924d131",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.3.2/wpiutil-cpp-2023.3.2-sources.zip",
        sha256 = "6b32dab48a7ec963041eb2d234fad7f645d213f3123beb3050e25229a40d4453",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.3.2/wpiutil-cpp-2023.3.2-linuxarm32.zip",
        sha256 = "61092799518b0bdd890eeee08ae8fe40efa628824dc0ab4d5f78a9ccafd6e160",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.3.2/wpiutil-cpp-2023.3.2-linuxarm64.zip",
        sha256 = "a878040c8fd8ddd20ac55389335f9dd5964927d6d18ccab1477a0fde8b075c3f",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.3.2/wpiutil-cpp-2023.3.2-linuxx86-64.zip",
        sha256 = "1bb33b1d081c7be991bd874e3c9154a16dd0f55501bd33ad0aef638529af8f97",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.3.2/wpiutil-cpp-2023.3.2-osxuniversal.zip",
        sha256 = "1f7568fdbeb0cd00940f0e15b051095811ce7db4e2a46a4bc2ef652b81bea463",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.3.2/wpiutil-cpp-2023.3.2-windowsx86-64.zip",
        sha256 = "64c24d71bca5c88dd3017f2b85c3c696d07b24cab9d7e9f3d2e81e4fccf5396e",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.3.2/wpiutil-cpp-2023.3.2-linuxarm32static.zip",
        sha256 = "590b67f0ff9a5a981101d72ed1dab85c6987020bc05e5354fa72e7182c4ae767",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.3.2/wpiutil-cpp-2023.3.2-linuxarm64static.zip",
        sha256 = "5b67a9ff883d48ca713df91a88151f08ea51a65d2feafea509e1d5f71cccc139",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.3.2/wpiutil-cpp-2023.3.2-linuxx86-64static.zip",
        sha256 = "43cca85101a69bf7d7cb43c0a5613d2816489ac39ea1bfa2e403c4fc327e4c18",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.3.2/wpiutil-cpp-2023.3.2-osxuniversalstatic.zip",
        sha256 = "c1c5b08921fada3c035c60877e7aa5c4a490977a1524f4ad052fd104a96c0f5c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.3.2/wpiutil-cpp-2023.3.2-windowsx86-64static.zip",
        sha256 = "ef9b229aebdd9e957b9c2a69439cd8da9bc94424bb7aa269a1c99e4a1f84722d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.3.2/wpiutil-cpp-2023.3.2-linuxarm32debug.zip",
        sha256 = "e371ea074e336a2d292cd6c60b0935335549b2135f4f0a24ced0b498d122a64d",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.3.2/wpiutil-cpp-2023.3.2-linuxarm64debug.zip",
        sha256 = "db565110c493dae8ab9f24bc54d59bbc19e0583f497bf065402da6448864d693",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.3.2/wpiutil-cpp-2023.3.2-linuxx86-64debug.zip",
        sha256 = "58978289d09b53b4ce313a6183b034e357e1c20aa93f760d82064638643844d4",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.3.2/wpiutil-cpp-2023.3.2-osxuniversaldebug.zip",
        sha256 = "d4366d1af6b9360b2778752655398815d4d6c2b338f3049b3eac0161131cbf76",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.3.2/wpiutil-cpp-2023.3.2-windowsx86-64debug.zip",
        sha256 = "6bfe8a1227c1a2df1f8c609e6a37c420d46c4eef8c869583020571202efd4373",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.3.2/wpiutil-cpp-2023.3.2-linuxarm32staticdebug.zip",
        sha256 = "90a33a4f95a0569e618015e423001d4a5cc6feb48c35b46c36314543b9bc19d6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.3.2/wpiutil-cpp-2023.3.2-linuxarm64staticdebug.zip",
        sha256 = "d7781c2fee66be30cd9868d3fac5bf2c0e3a8e90b4eb0c4dc460a41f83b9ef89",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.3.2/wpiutil-cpp-2023.3.2-linuxx86-64staticdebug.zip",
        sha256 = "b9bfa3679bdb3bd0f70810065e65d0c2078a2988a0e679c8f11fb4852e96320c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.3.2/wpiutil-cpp-2023.3.2-osxuniversalstaticdebug.zip",
        sha256 = "755881949255c900c95ad91a97ea20b19c520f5c2ba093ea74a34fda9f4684bf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.3.2/wpiutil-cpp-2023.3.2-windowsx86-64staticdebug.zip",
        sha256 = "d08e860f9b028c63d13436519913426d23f7cfb1b3c6cf524cf2e32ac14752aa",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.3.2/wpiutil-cpp-2023.3.2-linuxathena.zip",
        sha256 = "2e756f3cbda5898921a881f29222ec244abdeb174e93b6f1702511a866cfd6d6",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.3.2/wpiutil-cpp-2023.3.2-linuxathenastatic.zip",
        sha256 = "21ee4bb984e591cdaeb999c72c9ed3c37cea32b7b531beaf7cc66c4984109e02",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.3.2/wpiutil-cpp-2023.3.2-linuxathenadebug.zip",
        sha256 = "7fe3ec53110b9693ef4fe4d6651a5fa92a40d1f3cb104d8b41481ca86128caca",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.3.2/wpiutil-cpp-2023.3.2-linuxathenastaticdebug.zip",
        sha256 = "de9b32081b473aee9ae06cdff1945233bd3ff6e86ad84ff9a5bc7fa0ae03fb02",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.3.2/wpinet-cpp-2023.3.2-headers.zip",
        sha256 = "11ad8426b0a01090fe8a1db127c8c476714e35df369f95f494d2178a28e9310d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.3.2/wpinet-cpp-2023.3.2-sources.zip",
        sha256 = "a01f2a714eb4f75d6d3d5bce30101bf3200ba7c47b4a87391b3eb24e5a28709a",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.3.2/wpinet-cpp-2023.3.2-linuxarm32.zip",
        sha256 = "62c8d9ef02183e453a8629b97aff4dc094abfef4486b717ab01616287ea7da73",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.3.2/wpinet-cpp-2023.3.2-linuxarm64.zip",
        sha256 = "8b191c8538f1798812b244772d523e179dbcf3c81b10fdd2b8ee37d7d463df9b",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.3.2/wpinet-cpp-2023.3.2-linuxx86-64.zip",
        sha256 = "dcbc06a4a2fa5385aed0a8c7af43a7775654e0aa699642984a9d1465b7be5959",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.3.2/wpinet-cpp-2023.3.2-osxuniversal.zip",
        sha256 = "a327ee0e4b084d8d59bde460cc4edcd210a15264a9c50737515599ebec51e6bd",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.3.2/wpinet-cpp-2023.3.2-windowsx86-64.zip",
        sha256 = "39da09b824404e9904472680fbedb5e076923ed410382d34a28c90d7fc5328a4",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.3.2/wpinet-cpp-2023.3.2-linuxarm32static.zip",
        sha256 = "bce846f7207f09c6b6dc04f5f233d6ca3e46003b7c8d79473c55557e774fbf0f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.3.2/wpinet-cpp-2023.3.2-linuxarm64static.zip",
        sha256 = "a29e155869223f87c04773204e19377a15d08d5b30c58135873c9b95d8ddc305",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.3.2/wpinet-cpp-2023.3.2-linuxx86-64static.zip",
        sha256 = "6cfebf47989925686d5858539d3063f7603ff91f11da9bb8a18e0d43895049d5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.3.2/wpinet-cpp-2023.3.2-osxuniversalstatic.zip",
        sha256 = "2b6801355c65faef02436bd699a06d04647d69fc1f95a26dc4a2c650770961b9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.3.2/wpinet-cpp-2023.3.2-windowsx86-64static.zip",
        sha256 = "76b84313031186b253873b72f77a79c3ba8ce5bc295b2d1e0a40b448be7a09a9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.3.2/wpinet-cpp-2023.3.2-linuxarm32debug.zip",
        sha256 = "405624660327817a38514fa912cd6581bc5ce1a3b22422d6e224916d8e9a1c01",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.3.2/wpinet-cpp-2023.3.2-linuxarm64debug.zip",
        sha256 = "0b382bea724921248ae53421176073623f0207752c2956931da5b8ae4bd05cb4",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.3.2/wpinet-cpp-2023.3.2-linuxx86-64debug.zip",
        sha256 = "ffa4ac8ca68cc80dcf04114eb3f348f4a47bf8642dedb79ae09a34606313c030",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.3.2/wpinet-cpp-2023.3.2-osxuniversaldebug.zip",
        sha256 = "b66c18a99537baf4c40c4bc2ccac06ed691cb9eb58c8f5c2f853862dbfe0954f",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.3.2/wpinet-cpp-2023.3.2-windowsx86-64debug.zip",
        sha256 = "163334835d377443794e2d90fa286d6abcd4124e1f7218960fa2ed6521167814",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.3.2/wpinet-cpp-2023.3.2-linuxarm32staticdebug.zip",
        sha256 = "a14f198d2552b6445833cb7f7f16fcbf465438409ab182448f05f01be4328ce2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.3.2/wpinet-cpp-2023.3.2-linuxarm64staticdebug.zip",
        sha256 = "eefe003381914fcaa430d14e64124c1ae51803c6211c0fdefba8dfd21ba42951",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.3.2/wpinet-cpp-2023.3.2-linuxx86-64staticdebug.zip",
        sha256 = "e2fc445c676eddf6d0e2956dcf6f12aaac3d896141d484fff9f7256570014d94",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.3.2/wpinet-cpp-2023.3.2-osxuniversalstaticdebug.zip",
        sha256 = "ba57ba6b7bc10bb8ffdbcca8eb2f412c2c0dc13ad24e2fb1e380b1c79862027a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.3.2/wpinet-cpp-2023.3.2-windowsx86-64staticdebug.zip",
        sha256 = "cd73b78bcd1aa2406229bbdef98d57ea9836f891efc92117160d33fd1c52b768",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.3.2/wpinet-cpp-2023.3.2-linuxathena.zip",
        sha256 = "cb47d6cb4ac886b133f9f9bded33af22461d910f7f0085d83fa0f4a3e26ffa0b",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.3.2/wpinet-cpp-2023.3.2-linuxathenastatic.zip",
        sha256 = "ed29f1b666b406b346133497c9f635036f9ce88367e55b8aaa30df82b596a450",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.3.2/wpinet-cpp-2023.3.2-linuxathenadebug.zip",
        sha256 = "0e4d975e446f967aa42c456d52c78c7f4c1516255423466899a37eb6e729fcaa",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.3.2/wpinet-cpp-2023.3.2-linuxathenastaticdebug.zip",
        sha256 = "8221ef12adb994c0c23dcface0b12a9ead9680287c567dd4baf73d505a27009c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.3.2/wpimath-cpp-2023.3.2-headers.zip",
        sha256 = "2dc1835fd9c784d4d0572f7eb76135b65c8c04b2aa4273d87ee7678c8c5877e7",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.3.2/wpimath-cpp-2023.3.2-sources.zip",
        sha256 = "73aa7d16be9929e4b230fe8843137aa6421b3436bba46806449ebce4d34223c2",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.3.2/wpimath-cpp-2023.3.2-linuxarm32.zip",
        sha256 = "0af745c2a0b7322f28b7b8346825a6beb30ccc97f708e90a220e1e08b205713d",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.3.2/wpimath-cpp-2023.3.2-linuxarm64.zip",
        sha256 = "37cf340addb947536ce283b0ef0370422ec7aaf1b1ecd6a5e622d1f7e9b6c89c",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.3.2/wpimath-cpp-2023.3.2-linuxx86-64.zip",
        sha256 = "bd165c34ad1f9d35cced4f0bf3c528406595e228806badc977801b87f982cd25",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.3.2/wpimath-cpp-2023.3.2-osxuniversal.zip",
        sha256 = "f5ce48e97b65b80d74629832a1c98d32b07734550f6f21786a4bc29864ce03e9",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.3.2/wpimath-cpp-2023.3.2-windowsx86-64.zip",
        sha256 = "3ccd74ba2fc065d8543c3dc56d592312aefd3bb29d78f16fb38d294fcac1dbbb",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.3.2/wpimath-cpp-2023.3.2-linuxarm32static.zip",
        sha256 = "146122094615f900e98593958e02d62c81cbe0cf555d508b3dcdbb2c0951f3a6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.3.2/wpimath-cpp-2023.3.2-linuxarm64static.zip",
        sha256 = "7928cfa0288c021fd86c0ca1bc156f66db084862785545cda866918d10f8f0ff",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.3.2/wpimath-cpp-2023.3.2-linuxx86-64static.zip",
        sha256 = "e570eb1f7d6573cfd83c46a7bf1bc96ff32bdc45bb6bf523e84663a9b5ec7d5e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.3.2/wpimath-cpp-2023.3.2-osxuniversalstatic.zip",
        sha256 = "130cb4644e86294e5b004ff7be9d06e6abd8da143f0f5382f73d2bf29e402615",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.3.2/wpimath-cpp-2023.3.2-windowsx86-64static.zip",
        sha256 = "185788d7696f03f77b249eb0aad3fd97d13d9329615d16bf90720b21929072df",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.3.2/wpimath-cpp-2023.3.2-linuxarm32debug.zip",
        sha256 = "3e3c41d1aa42cc68c3336e35dd77f2b4b91f326b348636156e4a5c4fb0b088f5",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.3.2/wpimath-cpp-2023.3.2-linuxarm64debug.zip",
        sha256 = "e1c3d9af83cda74f019d0b54f4046e5649fa2da1fc2c4cb4baf85c1e35458aa8",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.3.2/wpimath-cpp-2023.3.2-linuxx86-64debug.zip",
        sha256 = "d2685c367c9178006a9490bd0c1dc0c44d68544ae197ec8117ad979c4a576f68",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.3.2/wpimath-cpp-2023.3.2-osxuniversaldebug.zip",
        sha256 = "d46b6398c5cf4ba4d6d684e257d0febf0e1d5c2e16f21d7a46b27730ae70d852",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.3.2/wpimath-cpp-2023.3.2-windowsx86-64debug.zip",
        sha256 = "a5dd48ad652701b95afb9edf120145391c812e1cff45a9d24b1163da8444ddad",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.3.2/wpimath-cpp-2023.3.2-linuxarm32staticdebug.zip",
        sha256 = "1e045bc13c3ab9e164d4aa23c5594bf8db09d21b07b09f7d143eed600e5c51df",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.3.2/wpimath-cpp-2023.3.2-linuxarm64staticdebug.zip",
        sha256 = "b5a7ff91f485b14869fad73048b79e4d3f6ca1da9814df5b10d6776523b92358",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.3.2/wpimath-cpp-2023.3.2-linuxx86-64staticdebug.zip",
        sha256 = "b0228e3585eec595326be5e94ffdc51dba4799bee9a7d00d525df2a3827daf17",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.3.2/wpimath-cpp-2023.3.2-osxuniversalstaticdebug.zip",
        sha256 = "364b20c7fa30b60f9d88778f8ea67c462dcc36165425ecfc41be152e3acf2a09",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.3.2/wpimath-cpp-2023.3.2-windowsx86-64staticdebug.zip",
        sha256 = "aed7f0f0225b01d60d4811c280110a4e2d97d369ee19f90c2afb743981d13c61",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.3.2/wpimath-cpp-2023.3.2-linuxathena.zip",
        sha256 = "7cb445de735ab8bce5591105a299ec4f6bce9376f4909edfa13bc84d04cdbfb2",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.3.2/wpimath-cpp-2023.3.2-linuxathenastatic.zip",
        sha256 = "a623b217850e7b74184c676a7e1bd379d315572f8e94112cdccc35e0a25e9baa",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.3.2/wpimath-cpp-2023.3.2-linuxathenadebug.zip",
        sha256 = "058ce6c50121f52000277a85ae464911b23b94f629b82a6e91b857c9831124d5",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.3.2/wpimath-cpp-2023.3.2-linuxathenastaticdebug.zip",
        sha256 = "6e96a947daccdad86ab2fe17f44cf8fd0451c102f6301a472ec7b9741befa771",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.3.2/apriltag-cpp-2023.3.2-headers.zip",
        sha256 = "f34dd55f56600bbc6cd5175ae330213a14e4dcaa211dd436c0799c99730b0ee3",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.3.2/apriltag-cpp-2023.3.2-sources.zip",
        sha256 = "dfab7907d70666b9fc0ac7fee571f5a0ae06e54341dc4325246653ddbeba7b8e",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.3.2/apriltag-cpp-2023.3.2-linuxarm32.zip",
        sha256 = "87054e7abb4d3099a0aff0027b1a679ee466dc56dc2f9b99b3d1ee73939051a3",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.3.2/apriltag-cpp-2023.3.2-linuxarm64.zip",
        sha256 = "60233eafcda6713e4feee3caeab5134ddb0126a83ea1d64bc78d31ccf30560f9",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.3.2/apriltag-cpp-2023.3.2-linuxx86-64.zip",
        sha256 = "3d001b858611fea6060b2d313bdd9eb8d7b5438200315dba175e24c6cbe8301c",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.3.2/apriltag-cpp-2023.3.2-osxuniversal.zip",
        sha256 = "84d145c5ff7ccd3c0ff35f929e0817c883f8f415681a13e7eb8e4893e144c385",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.3.2/apriltag-cpp-2023.3.2-windowsx86-64.zip",
        sha256 = "629ae1a92cce440944d041c3082d4aceb262714be8d0db15e0cb0dc539f59aee",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.3.2/apriltag-cpp-2023.3.2-linuxarm32static.zip",
        sha256 = "5b96ed00567227621b3db089f1527ac96dfd51237c9d4f4173195221a41445e1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.3.2/apriltag-cpp-2023.3.2-linuxarm64static.zip",
        sha256 = "c36e06f6f57b874096040a5bac3f228aba5f4b2ac686230eeb8feb9b849cce5b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.3.2/apriltag-cpp-2023.3.2-linuxx86-64static.zip",
        sha256 = "9e8d1cb92c71ebb89cba89eda26b82ccc78140bdcab5831f7818d0db37e37216",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.3.2/apriltag-cpp-2023.3.2-osxuniversalstatic.zip",
        sha256 = "d49cdeb6f30d306b79bab0a9dc4b07454d36ee0a1a8962a64c4e441a6e5a4485",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.3.2/apriltag-cpp-2023.3.2-windowsx86-64static.zip",
        sha256 = "1c5a26532689f6bb56be3fa71509f1ecdab7563ec0ebab489220b7ec5acb8a8e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.3.2/apriltag-cpp-2023.3.2-linuxarm32debug.zip",
        sha256 = "e419e7e0c0a5d261d19b7704382a9a962622ac59a1d0609d6d60398b921d848a",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.3.2/apriltag-cpp-2023.3.2-linuxarm64debug.zip",
        sha256 = "ce948e727481b8e587c810cc5eefc687812a5c68b62a73cf3ab4a136f7ef7083",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.3.2/apriltag-cpp-2023.3.2-linuxx86-64debug.zip",
        sha256 = "df29977e70115e5cbf857b9067f4d1269c7c6318da0f80fb6341a1b0e03527e1",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.3.2/apriltag-cpp-2023.3.2-osxuniversaldebug.zip",
        sha256 = "15de2bf1b2c60b5c471afc9e9605043a6cc27849940593590e943068a2241b0f",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.3.2/apriltag-cpp-2023.3.2-windowsx86-64debug.zip",
        sha256 = "005ebd51b492fed8f920b09a83ca036bcc4e0f1912dacfd784443701355f6387",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.3.2/apriltag-cpp-2023.3.2-linuxarm32staticdebug.zip",
        sha256 = "deb9701657a050ae41e8c548c0e89fe4d1570b2d42b3835b434464068e358fa2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.3.2/apriltag-cpp-2023.3.2-linuxarm64staticdebug.zip",
        sha256 = "762b0c1c24d5a061b4898d20d0a67fa5825f7f44d0c203d7498f2c27b390f5d8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.3.2/apriltag-cpp-2023.3.2-linuxx86-64staticdebug.zip",
        sha256 = "0b370a702462dff84a9abbaa6f1db1eaa335a0c4c451f29329e8e0fb096acf2b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.3.2/apriltag-cpp-2023.3.2-osxuniversalstaticdebug.zip",
        sha256 = "dc9aebc994bc32af665f4de5da755cedd34c565b876ccdf7e920ce7b6ba91cdd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.3.2/apriltag-cpp-2023.3.2-windowsx86-64staticdebug.zip",
        sha256 = "e8d3f3a25816e6556096d4a40748f9b12f11678ffed459d97b15a6a357796ec5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.3.2/apriltag-cpp-2023.3.2-linuxathena.zip",
        sha256 = "2671726b97e1da07f057445751c517cf43ec827820db1d9aea1771284432dd6d",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.3.2/apriltag-cpp-2023.3.2-linuxathenastatic.zip",
        sha256 = "514eabd055cf1aa0c0c50abc0d45b3e3573283aa33eff80a9ddf4e32b7060504",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.3.2/apriltag-cpp-2023.3.2-linuxathenadebug.zip",
        sha256 = "e09f1ac53daeb940490c59113526e8a2418b6cf73be43d0ce0506d5eaefa05f7",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.3.2/apriltag-cpp-2023.3.2-linuxathenastaticdebug.zip",
        sha256 = "641706df432ef3e9eafb0318e06566987ee5331184a12856d086261c4b55c937",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.3.2/hal-cpp-2023.3.2-headers.zip",
        sha256 = "37c3db2b0ec3b7a52adef0ee1ee502b2215cbe93c8fd6baaf34745bb43b44315",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.3.2/hal-cpp-2023.3.2-sources.zip",
        sha256 = "f58202a307174458f0dddebca0ef507c98d2b17fb7bbbd8fa902bffb0f0f88d6",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.3.2/hal-cpp-2023.3.2-linuxarm32.zip",
        sha256 = "9242d4371b6ae0755c9aab519ec4ba3131cd87e6c84968b876f74a758f2efe35",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_hal_hal-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.3.2/hal-cpp-2023.3.2-linuxarm64.zip",
        sha256 = "4b4059a9308fc48294bf2384da8dc44bd816e9dd5fc2d792fe74a995673092ee",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_hal_hal-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.3.2/hal-cpp-2023.3.2-linuxx86-64.zip",
        sha256 = "c12dca0e8c7615f5c97dc2b59be1a8244099d8299d19a13da47ff9eec4ecbe21",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_hal_hal-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.3.2/hal-cpp-2023.3.2-osxuniversal.zip",
        sha256 = "50935904f5d79df525635d466fcce281e43f2d931191e41497b3eb5d8d2675a2",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_hal_hal-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.3.2/hal-cpp-2023.3.2-windowsx86-64.zip",
        sha256 = "6b19cd0755ae7990037c61f9a7760a65bb421d81a356d4c4c5950a8b74f7241c",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_hal_hal-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.3.2/hal-cpp-2023.3.2-linuxarm32static.zip",
        sha256 = "2d427d7b5007de0f15bb25f8ded79e4dfe172b3fc243989f9c4298e31f0e7a77",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.3.2/hal-cpp-2023.3.2-linuxarm64static.zip",
        sha256 = "608a167e96a851bc8392530da2a163f1fc152ec8f68e2d75daa5701dce0168e2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.3.2/hal-cpp-2023.3.2-linuxx86-64static.zip",
        sha256 = "cb55d20b579e917376e2e2172e66c91c8ca82a0a1a445adf4b4016f0a7175488",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.3.2/hal-cpp-2023.3.2-osxuniversalstatic.zip",
        sha256 = "5d97ac0ba3cbf1ae9cdd08812f2a3216ad0aab071c0ea2fda6114538588e81d4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.3.2/hal-cpp-2023.3.2-windowsx86-64static.zip",
        sha256 = "8f3dbcdb0cb7425db56e78b9cf526a0ccc3822c5faa714fc0c17dfbb1373beae",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.3.2/hal-cpp-2023.3.2-linuxarm32debug.zip",
        sha256 = "9c65d706a6e09a0e23c17f3affc11c96e8ef0e6349865982a946b985ced9e477",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_hal_hal-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.3.2/hal-cpp-2023.3.2-linuxarm64debug.zip",
        sha256 = "db58a06a256c937a3f56b6c2a340c2246e46e1ca57204f89c4f74cf5e5fba94e",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_hal_hal-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.3.2/hal-cpp-2023.3.2-linuxx86-64debug.zip",
        sha256 = "46c99e48a0f185763c086b75bc24176e392afc80eb5381ea5f5b2033dd30b904",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_hal_hal-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.3.2/hal-cpp-2023.3.2-osxuniversaldebug.zip",
        sha256 = "2f12ebd40ea73f1a6f7438774425d428a86fa4b95af0e1f462de956d5db7ee3c",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_hal_hal-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.3.2/hal-cpp-2023.3.2-windowsx86-64debug.zip",
        sha256 = "325a2591cb0c1549648c39ddd46897ce36b250bb6ca34aded70e59a209ce8756",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_hal_hal-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.3.2/hal-cpp-2023.3.2-linuxarm32staticdebug.zip",
        sha256 = "785f544da9365d52a115f562223542bcc364bff9aa947e7db80aa844bb5bd862",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.3.2/hal-cpp-2023.3.2-linuxarm64staticdebug.zip",
        sha256 = "c1b3a632c764667a88b6699cc0f320ebfcd002ed808b04fa6cc806fee94bac5d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.3.2/hal-cpp-2023.3.2-linuxx86-64staticdebug.zip",
        sha256 = "4c1e598f0eb3e909b4b7bbbb047b8252b043f9a3bad2404c45f9d0d9c8e7b52e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.3.2/hal-cpp-2023.3.2-osxuniversalstaticdebug.zip",
        sha256 = "df43bcb471a968f2b98291bb6af90f954440b59c4da849e8508972544a936eb3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.3.2/hal-cpp-2023.3.2-windowsx86-64staticdebug.zip",
        sha256 = "2e3075e9338f767071ff2f97cd51b4a79bd4a8d87490f172a9437bc27f83b7bd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.3.2/hal-cpp-2023.3.2-linuxathena.zip",
        sha256 = "e36b1d6a351ace18ed2f7cd352c9ec1fec068b65ee70f23b5f7afe9a474bc5f8",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_hal_hal-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.3.2/hal-cpp-2023.3.2-linuxathenastatic.zip",
        sha256 = "fdee6821186126cd12c8482cd1c0454233438efac7596987aaab188cc92461d5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.3.2/hal-cpp-2023.3.2-linuxathenadebug.zip",
        sha256 = "4affc21e8d2b0e984cd805fb5149b11ab7554b180a9127344f411fcd58d4f507",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_hal_hal-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.3.2/hal-cpp-2023.3.2-linuxathenastaticdebug.zip",
        sha256 = "6ee5e3642169cbce3eaf651dbe0da110acdec5c30dd0f324026172c1ea8b4ffd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.3.2/ntcore-cpp-2023.3.2-headers.zip",
        sha256 = "71eafe0ff922b1f089c815d3769ffdf7ac338d0c135589860009a9fbcd53b85d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.3.2/ntcore-cpp-2023.3.2-sources.zip",
        sha256 = "63633c0c4bdcca32ee2cf8b28e5142158483b6d4fe9676cb8e00c2987ad71232",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.3.2/ntcore-cpp-2023.3.2-linuxarm32.zip",
        sha256 = "55f1961e19b35c110735fa8b389cbce09d75e931bda80fa254aa808ceea1f032",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.3.2/ntcore-cpp-2023.3.2-linuxarm64.zip",
        sha256 = "3c3f18f4482b878d66a36881065da92585d3afac4667add6fde42859942311f1",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.3.2/ntcore-cpp-2023.3.2-linuxx86-64.zip",
        sha256 = "31b1f01abeee1be55b511a3cac897ab7c85a64a048813a39b97916ca9eba9e88",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.3.2/ntcore-cpp-2023.3.2-osxuniversal.zip",
        sha256 = "734474eff040e64ffa518eb5a04776e93101580639b1339d58d1754360f0954f",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.3.2/ntcore-cpp-2023.3.2-windowsx86-64.zip",
        sha256 = "7fb9da919250ae877100cf8dae469e3407fe94e604ae75a8d52bf99d90bfc3b9",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.3.2/ntcore-cpp-2023.3.2-linuxarm32static.zip",
        sha256 = "de33376957c20a7d13b7d45a9990348a9fb14c93a8c0d771f170217da44f75c8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.3.2/ntcore-cpp-2023.3.2-linuxarm64static.zip",
        sha256 = "95d3ab344437cc2e2bb7c7ac92aaea294e4d92617eaa17f6789898a9fc5938af",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.3.2/ntcore-cpp-2023.3.2-linuxx86-64static.zip",
        sha256 = "4fbb61c55cba35175364272eed2149aa040479ab1c3c729bd6fa8d3fc77a5bf6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.3.2/ntcore-cpp-2023.3.2-osxuniversalstatic.zip",
        sha256 = "3066fffe217ac13866c59cdad2455641bce67d2068443393b5f62d793b5bce7d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.3.2/ntcore-cpp-2023.3.2-windowsx86-64static.zip",
        sha256 = "602f15b2cbf6597a3f115e6a9afbda99bed3c17abac97699804e395d0019188f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.3.2/ntcore-cpp-2023.3.2-linuxarm32debug.zip",
        sha256 = "967e12a22f6f1dbc152ab0e47035c0fd6c41197da0d21d7ec10de940a3610670",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.3.2/ntcore-cpp-2023.3.2-linuxarm64debug.zip",
        sha256 = "39be6da98729ee8bc9c2a28adab9dc2c1cf95b1937046c14fdeed1e1d15bd950",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.3.2/ntcore-cpp-2023.3.2-linuxx86-64debug.zip",
        sha256 = "66a52114fe0317016753cf423b5ac6ed1c262156391cf97cb0e50619d1e60cf0",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.3.2/ntcore-cpp-2023.3.2-osxuniversaldebug.zip",
        sha256 = "a4bdb475519489f789639e50cd79492451c3d077d236e600d0555bc2d86c23a2",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.3.2/ntcore-cpp-2023.3.2-windowsx86-64debug.zip",
        sha256 = "6b235a5fa2c21dbacc586bcb75ab84ca800ed5bab6bdadcd0dc083c0dbfd58d8",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.3.2/ntcore-cpp-2023.3.2-linuxarm32staticdebug.zip",
        sha256 = "d9d25ab5fbe4907d73239a57f43ca159b5f27697a17fa4a4b592bcc129be8f39",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.3.2/ntcore-cpp-2023.3.2-linuxarm64staticdebug.zip",
        sha256 = "5fbb477f099ea64feaea8767a6affb2f90eb1f5cf7643619a58b5bf27eac4283",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.3.2/ntcore-cpp-2023.3.2-linuxx86-64staticdebug.zip",
        sha256 = "e0d297d29e645de6094f7eaa9b2f402e2c3b93556d06367e19999f6abcd9db72",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.3.2/ntcore-cpp-2023.3.2-osxuniversalstaticdebug.zip",
        sha256 = "f46a19514939692f589a909385a3691ecfbf71ca7bb452f9dbfc68c8941ef733",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.3.2/ntcore-cpp-2023.3.2-windowsx86-64staticdebug.zip",
        sha256 = "378c2567dc555dd7b2a92233a234d2f826f78bbfe65003a52dc1359a49a8cb45",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.3.2/ntcore-cpp-2023.3.2-linuxathena.zip",
        sha256 = "1c91cff67331f72e95fc658fa38f68d5d69dd0471d591b0bbff0a116f1796f25",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.3.2/ntcore-cpp-2023.3.2-linuxathenastatic.zip",
        sha256 = "3ab2db79a1dc131d0cd521c5bbd6399b8d5f633ca10332461fb5d5d22dc13d7d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.3.2/ntcore-cpp-2023.3.2-linuxathenadebug.zip",
        sha256 = "f0c5ee0c5e3fa67d1872d8e3104a0842e1e92a21a8c6f005bf67cf3dfc9bec6d",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.3.2/ntcore-cpp-2023.3.2-linuxathenastaticdebug.zip",
        sha256 = "a9ed9fb98f2c2e01c00bf32b625ce0c5a1f628415d5158d8a7807ad3a5a30fd9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.3.2/cscore-cpp-2023.3.2-headers.zip",
        sha256 = "a4dea9c946ec147c5d9b302757406fa84e8b717311bab03861228f0d596905d7",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.3.2/cscore-cpp-2023.3.2-sources.zip",
        sha256 = "b8fade05d9fa7f944e825adcb114108697cd5302988419626421e25d3f871b75",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.3.2/cscore-cpp-2023.3.2-linuxarm32.zip",
        sha256 = "a1310aa894700ae18ebe9bdee0f12255c6c38714f94afc5b4f99bbfa9403e225",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_cscore_cscore-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.3.2/cscore-cpp-2023.3.2-linuxarm64.zip",
        sha256 = "8c7ad595d4a9a3f3e46e12d716aa6a7ca4de9de0e81dcfb167a0acbc7415cf89",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_cscore_cscore-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.3.2/cscore-cpp-2023.3.2-linuxx86-64.zip",
        sha256 = "c47bcb4b5bb1268e3c1e08f843da09ba14c47e2905ada5cd6bc83eadb1c19643",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_cscore_cscore-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.3.2/cscore-cpp-2023.3.2-osxuniversal.zip",
        sha256 = "341309f15d97913b33a1a3789203488b8806810f4ad3d035486b6cc6b540e4d0",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_cscore_cscore-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.3.2/cscore-cpp-2023.3.2-windowsx86-64.zip",
        sha256 = "dcd259d02537ba4f5afd957d6eedfb49e25c56dc7e765cf1d1ef6266068ff021",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_cscore_cscore-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.3.2/cscore-cpp-2023.3.2-linuxarm32static.zip",
        sha256 = "84d0631afa551b99767490b0700513d4ac55fdd1452b0bc5c4ffe1af3f6f4889",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.3.2/cscore-cpp-2023.3.2-linuxarm64static.zip",
        sha256 = "f5a37bc682a9a6027fc07d93d42f82c8eda45497ab8a1d71b78c9f46102df7ee",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.3.2/cscore-cpp-2023.3.2-linuxx86-64static.zip",
        sha256 = "9723d78c0f113987cce312284831ad1dcd4758f65e1d2f58bc39fc7266b85519",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.3.2/cscore-cpp-2023.3.2-osxuniversalstatic.zip",
        sha256 = "7ee8a48c9c522b7e3bbe3f6f3a3a3d349c97f60bd697738609e8aa7d9a973945",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.3.2/cscore-cpp-2023.3.2-windowsx86-64static.zip",
        sha256 = "00f2f1ec63f76f69ee6f9773341991d663352ab356c076759d44833700fc62c3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.3.2/cscore-cpp-2023.3.2-linuxarm32debug.zip",
        sha256 = "29ca7dbe46d2396a4347509184bdfd67ca42894ce62176f187b7c384b6cfcb59",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_cscore_cscore-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.3.2/cscore-cpp-2023.3.2-linuxarm64debug.zip",
        sha256 = "6b4a47466921b37d7eca66aeb4f2e1b787372ec2c2d6f139f14f9d54d194d2bf",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_cscore_cscore-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.3.2/cscore-cpp-2023.3.2-linuxx86-64debug.zip",
        sha256 = "f238cecbd278bba77a7b882b07cbdfc594a7bf52ee19b026fb808bbd335c57a4",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_cscore_cscore-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.3.2/cscore-cpp-2023.3.2-osxuniversaldebug.zip",
        sha256 = "a5d1bc2d420ff07d829c4fbc4a9339f64acb4c6105906983500b2509ba86fb8c",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_cscore_cscore-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.3.2/cscore-cpp-2023.3.2-windowsx86-64debug.zip",
        sha256 = "d0fd650530312f0b839ba2ef61d70f5d49de1b19807bad9499736121bb69bf99",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_cscore_cscore-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.3.2/cscore-cpp-2023.3.2-linuxarm32staticdebug.zip",
        sha256 = "795c8a800c5324e6630dc09dd41e0e8d864605cdb1d1408c04b4c5b200b38eed",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.3.2/cscore-cpp-2023.3.2-linuxarm64staticdebug.zip",
        sha256 = "718a0913bed0b53ce4267673d012293fe3f5d5beffc79e42a352d7277ec4fd33",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.3.2/cscore-cpp-2023.3.2-linuxx86-64staticdebug.zip",
        sha256 = "3d9aa667218a081749c51cf12f1918d7c4313eda478ddf8411631af21beb6980",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.3.2/cscore-cpp-2023.3.2-osxuniversalstaticdebug.zip",
        sha256 = "43257d414d19e9b34b75163018ccd6c17fb3f010ecc5b5fd266395adeb0e5a01",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.3.2/cscore-cpp-2023.3.2-windowsx86-64staticdebug.zip",
        sha256 = "af3948b861cf54e66bc771fc76522121631d5d56c2498098e19f9743971d6659",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.3.2/cscore-cpp-2023.3.2-linuxathena.zip",
        sha256 = "03c3a6c1afbcd9110d11fd45e5e74cab60e57cb4eca1c281e39fc27fabaa303b",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_cscore_cscore-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.3.2/cscore-cpp-2023.3.2-linuxathenastatic.zip",
        sha256 = "8447c6188540b96f4a43f8188d370944460a550291e077e5315d8a36bf54e20e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.3.2/cscore-cpp-2023.3.2-linuxathenadebug.zip",
        sha256 = "76e0a02e95550e323b72416c0e4ef48a23bfa240f380a1a4b6c3e31e6db12285",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_cscore_cscore-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.3.2/cscore-cpp-2023.3.2-linuxathenastaticdebug.zip",
        sha256 = "2e1a7f2dcc1711e7198f280823d947f3a88949dfef3a8ebf63eb11a878ed326f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.3.2/cameraserver-cpp-2023.3.2-headers.zip",
        sha256 = "35c176e75ac7fe15aea217919406bcdddac8bbaa67f5a387bbf5605524d52e7f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.3.2/cameraserver-cpp-2023.3.2-sources.zip",
        sha256 = "4c9dc66ec5323a8bd048f67b151a3b875f69f43ce6baf18d5e8fe7f75e7e90be",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.3.2/cameraserver-cpp-2023.3.2-linuxarm32.zip",
        sha256 = "fc2becc38650de5b540eb45e290fd4187d398da155d1d6e4a463cf72938e01bb",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.3.2/cameraserver-cpp-2023.3.2-linuxarm64.zip",
        sha256 = "5cb39315528732ab4f47deecdc289200b9c8bb9bb9b18a00ff67fe565603a248",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.3.2/cameraserver-cpp-2023.3.2-linuxx86-64.zip",
        sha256 = "08d0f13bf704e8247e8f56535b85ea829a0ed4826f2caa6732eb1e59de5ab3ad",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.3.2/cameraserver-cpp-2023.3.2-osxuniversal.zip",
        sha256 = "b1ab10ef453fd9c7e1f0a10f88dfa72371e3a73764523cee978170b5d058d23d",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.3.2/cameraserver-cpp-2023.3.2-windowsx86-64.zip",
        sha256 = "3582ab3b1bc0e3e12b25ee6c3efd25bc9ce17cb33f1a85b5c2f34830e8f85d71",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.3.2/cameraserver-cpp-2023.3.2-linuxarm32static.zip",
        sha256 = "ed81501463dc60e257e3a4037ef6a56c96bceb8b975c73f7103c117e9e19ace0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.3.2/cameraserver-cpp-2023.3.2-linuxarm64static.zip",
        sha256 = "a0c85ed842094791ac3434f1f95fc9a7acb5a3630466016eb179f6793e51f23b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.3.2/cameraserver-cpp-2023.3.2-linuxx86-64static.zip",
        sha256 = "beae59b0aaa876aa03e4d32b6b09bfb546ab56f0d41cd6452edd708677dfd910",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.3.2/cameraserver-cpp-2023.3.2-osxuniversalstatic.zip",
        sha256 = "0fe0f1cd52da0ea85d1509c51b202c202d7c8f5c7e3fd2b2d17ece6a50af3d5b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.3.2/cameraserver-cpp-2023.3.2-windowsx86-64static.zip",
        sha256 = "6847d5e6acede6c162d9ee9b6446e078993efaea3483e419321e048c21d7e65e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.3.2/cameraserver-cpp-2023.3.2-linuxarm32debug.zip",
        sha256 = "5c9fef57f7cb80272298ce769199b349ff51457f883c7d957a403c719b7d55b7",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.3.2/cameraserver-cpp-2023.3.2-linuxarm64debug.zip",
        sha256 = "ad08c0976a6b4d1766c841333d3894f04eaa06bcc4025185b52ca4f71b372615",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.3.2/cameraserver-cpp-2023.3.2-linuxx86-64debug.zip",
        sha256 = "c7541bed71bda3d7845e40d102e3d13804a812a7ba888956c9b5d4cb49527ad4",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.3.2/cameraserver-cpp-2023.3.2-osxuniversaldebug.zip",
        sha256 = "3556c5d5efffc6694b7c200102b6a904e667842f93b203ac79278c39d32b82d5",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.3.2/cameraserver-cpp-2023.3.2-windowsx86-64debug.zip",
        sha256 = "0e06f8cb5de267e0b27ea8b2be8c75013ed41201f4a2d6c48fef69b31c9c46df",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.3.2/cameraserver-cpp-2023.3.2-linuxarm32staticdebug.zip",
        sha256 = "9e98f0a38dfd5411accb8d9b42c61b3a29afb58a21d3913b8ffd6ec4d7a740f7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.3.2/cameraserver-cpp-2023.3.2-linuxarm64staticdebug.zip",
        sha256 = "6bcda2b4e16246cc518c21090a143cf504efaa30567cf25be4c3af1fa74fa66c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.3.2/cameraserver-cpp-2023.3.2-linuxx86-64staticdebug.zip",
        sha256 = "ed0d5f593bf25834d7dbe9852c7ee9fd33c0fc520cd8cb8730ebc7c7afe1a5dc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.3.2/cameraserver-cpp-2023.3.2-osxuniversalstaticdebug.zip",
        sha256 = "a02d2c4b06b95d16adf0ab1d71388cdca1580ef53ed742c56294a1dcea279037",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.3.2/cameraserver-cpp-2023.3.2-windowsx86-64staticdebug.zip",
        sha256 = "4787dba1f4b74d87ae71ee47a877a89b77f1d250b9eab5b3734bb2b0afd5b854",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.3.2/cameraserver-cpp-2023.3.2-linuxathena.zip",
        sha256 = "d91ea8f0a28ee75e154b60f9a3a271f68a36c252c5640d07b2435bd9b8c84d3d",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.3.2/cameraserver-cpp-2023.3.2-linuxathenastatic.zip",
        sha256 = "e82838e7fe6ea289aa5c4436c99903290010aa3954eeae37dd6417e8a031f91f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.3.2/cameraserver-cpp-2023.3.2-linuxathenadebug.zip",
        sha256 = "5825049eda0886825e167c8403d788d79ddae5d715ea9a096872879fbf21bc27",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.3.2/cameraserver-cpp-2023.3.2-linuxathenastaticdebug.zip",
        sha256 = "592d01e0f354dd2d8f0697619fc56cf04344b48e3d7105177617c9974c796d2a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.3.2/wpilibc-cpp-2023.3.2-headers.zip",
        sha256 = "1786d372102ec429b3b04d8cc348d1ed16a6c72e216cc0c0da68ec9dcd3a92b0",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.3.2/wpilibc-cpp-2023.3.2-sources.zip",
        sha256 = "ef0a0811dd855e857041991421302995b8fab4f9238f3a16c327e02d227eeec6",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.3.2/wpilibc-cpp-2023.3.2-linuxarm32.zip",
        sha256 = "a3a6bc7c37391b4d070144478273b3eafabeb358636ba69faab7f6d11cb1d969",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.3.2/wpilibc-cpp-2023.3.2-linuxarm64.zip",
        sha256 = "d46bb3d7b6a807f567fcbbe07d3d10010d98abbb5d7c6cb5cf6c206d1c84da47",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.3.2/wpilibc-cpp-2023.3.2-linuxx86-64.zip",
        sha256 = "1b5c98495ab1cca127b3af906660fa6bb27f6a5aedda22b2693043c3932b7589",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.3.2/wpilibc-cpp-2023.3.2-osxuniversal.zip",
        sha256 = "5aeb964bcd48c89a040cbf00adaa90a99e71e61f986989f08807de4df7be1c97",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.3.2/wpilibc-cpp-2023.3.2-windowsx86-64.zip",
        sha256 = "da062f5ab583d3c8207781d076e53d0507d40ef3b7b6d140bef51c01b6e66320",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.3.2/wpilibc-cpp-2023.3.2-linuxarm32static.zip",
        sha256 = "a167623a6778729ceafb149e7df758ba06f86220f4bd2170c2c5a0b2b4dfcab0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.3.2/wpilibc-cpp-2023.3.2-linuxarm64static.zip",
        sha256 = "46c553adfa28272f5264568ea54118598346d86df16c8defb99dc0ff6eb1b951",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.3.2/wpilibc-cpp-2023.3.2-linuxx86-64static.zip",
        sha256 = "87c643d48a9d2eb2068395f30b1d749a827624f3ccebcaae1c74ccbc68a3601d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.3.2/wpilibc-cpp-2023.3.2-osxuniversalstatic.zip",
        sha256 = "93e84a083a0917ceea963c349bfc6646e5531572c09bfcc54c0105ebfff9105b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.3.2/wpilibc-cpp-2023.3.2-windowsx86-64static.zip",
        sha256 = "8ac5a020dee07fdb65237a4336e1940e1f8a5d67d8fd265e6ffe2c1dcef7214a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.3.2/wpilibc-cpp-2023.3.2-linuxarm32debug.zip",
        sha256 = "854c07cb5edc98f19e3e009a70e88a01c7e61c6082381fe1fa4246f3d3f905af",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.3.2/wpilibc-cpp-2023.3.2-linuxarm64debug.zip",
        sha256 = "1a030f9c2617d02dce56bb8312f83c0605c94e2e5fd68d0e344b8b805b247629",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.3.2/wpilibc-cpp-2023.3.2-linuxx86-64debug.zip",
        sha256 = "c3e7c395a894ce32fe724fe717f3f2a0c9f557f732bbc47fea21761a6282a39a",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.3.2/wpilibc-cpp-2023.3.2-osxuniversaldebug.zip",
        sha256 = "4c53feec48caf7e2dfa3125713600711f65cb4bdbe92bec4bd6295c1eac13ed1",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.3.2/wpilibc-cpp-2023.3.2-windowsx86-64debug.zip",
        sha256 = "87e694fc86a514f0838720c1dce5be8f617d81a1fd4186c48ea0ce1be6b5beda",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.3.2/wpilibc-cpp-2023.3.2-linuxarm32staticdebug.zip",
        sha256 = "cbbc43347ca3a2c7e11c11ca76516e187e9ebe8dda5db59788920b8adcaad05b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.3.2/wpilibc-cpp-2023.3.2-linuxarm64staticdebug.zip",
        sha256 = "811e355f26ccd8f64942c5524745f6ddd82c8ee277f2679634b39c537344dcc1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.3.2/wpilibc-cpp-2023.3.2-linuxx86-64staticdebug.zip",
        sha256 = "241d980f07bfe942fbcb15e4e58774cbad6cee6c8e1f8c15247d1ff62ba8c72b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.3.2/wpilibc-cpp-2023.3.2-osxuniversalstaticdebug.zip",
        sha256 = "25cce0438a992da42f8a87db2bd64de833589dca30c1b0d23983aeb518938ba8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.3.2/wpilibc-cpp-2023.3.2-windowsx86-64staticdebug.zip",
        sha256 = "0936f985876996a97f31e698ec1caae77640a044a0cdf4930efff272fcceee00",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.3.2/wpilibc-cpp-2023.3.2-linuxathena.zip",
        sha256 = "30184fd937ec2c4d3ea286afee3c4b53c68eca07124117ffbf1ed7e683c1ab4e",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.3.2/wpilibc-cpp-2023.3.2-linuxathenastatic.zip",
        sha256 = "b1daf6a7b449c5dab3368fd85ad4faea3c5c40d1be7f1f54e44e12caea93cbb1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.3.2/wpilibc-cpp-2023.3.2-linuxathenadebug.zip",
        sha256 = "6371e15a6096eebe0876b5e906ba43320468a920d24bfbe8a107ac1c2594ecdb",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.3.2/wpilibc-cpp-2023.3.2-linuxathenastaticdebug.zip",
        sha256 = "711d7aa618913f46f4f84f5a2641ef23ac6fdaafd8e076fbfd1d3ac9b80e5dbc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.3.2/wpilibNewCommands-cpp-2023.3.2-headers.zip",
        sha256 = "2ebfc2242cba5f1495c81c0aa411c17b620afff916b39c86f394e0046fc9067f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.3.2/wpilibNewCommands-cpp-2023.3.2-sources.zip",
        sha256 = "b224aa43ae78a8700451a32e001c8e5620dc5afdd46f23910a6549f558ee18db",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.3.2/wpilibNewCommands-cpp-2023.3.2-linuxarm32.zip",
        sha256 = "6d218bea93a3dbf8d595a967422f4e22d8811969fae9dc373ba45de130c1d615",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.3.2/wpilibNewCommands-cpp-2023.3.2-linuxarm64.zip",
        sha256 = "6bdf0e834907ca4b7145b2e1d08c6367445a05a6fda82800ad2655dd068e5538",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.3.2/wpilibNewCommands-cpp-2023.3.2-linuxx86-64.zip",
        sha256 = "05d7f7e8fe9ba9da6dcfee0c668f4e823e39b9c288124f48b81f37bfb1942fcf",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.3.2/wpilibNewCommands-cpp-2023.3.2-osxuniversal.zip",
        sha256 = "c7d6fb689d1cb5ae6cd882b6e40db52c614f56ce60e1595d0ae3f38411ad6492",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.3.2/wpilibNewCommands-cpp-2023.3.2-windowsx86-64.zip",
        sha256 = "b245a1cb1c9ceb0a1165fd6175cbc7d6012fa823cd21c417133ba98ba323ba62",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.3.2/wpilibNewCommands-cpp-2023.3.2-linuxarm32static.zip",
        sha256 = "42fbcf9c46257b64a19cc1a5abbe83b90f030ca96a2bacb2f1715158ee48d156",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.3.2/wpilibNewCommands-cpp-2023.3.2-linuxarm64static.zip",
        sha256 = "b1e85d75306eef67c0658444ac57ccba46a6165b0ee18b39e3f4b580fe8524f4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.3.2/wpilibNewCommands-cpp-2023.3.2-linuxx86-64static.zip",
        sha256 = "b20fcdcde7810929c704c1dcb97f97c783c933b42fbd6839b612f1bbe7076815",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.3.2/wpilibNewCommands-cpp-2023.3.2-osxuniversalstatic.zip",
        sha256 = "80580d4c7f096f1f8fa098788a7c46195173d2a1a389ac5ee015612c86fe569a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.3.2/wpilibNewCommands-cpp-2023.3.2-windowsx86-64static.zip",
        sha256 = "d4fcda9553b3d2d51c25a267b29dc0c4a7248217daeb87e061760c6ce0ad9ae7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.3.2/wpilibNewCommands-cpp-2023.3.2-linuxarm32debug.zip",
        sha256 = "5e8fb584e9f449107e9f00b8607184c0b44c3214605c85cea0626a2c7397160d",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.3.2/wpilibNewCommands-cpp-2023.3.2-linuxarm64debug.zip",
        sha256 = "0e0e4dc7cc7533d99f714017bb2985d2b19aac77a270a2f3fd47edc3e323c59b",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.3.2/wpilibNewCommands-cpp-2023.3.2-linuxx86-64debug.zip",
        sha256 = "5cb4c10cf0570052e41f6daf52e8c1bc2aa8260bbf9670a14ef054b34cda4fcb",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.3.2/wpilibNewCommands-cpp-2023.3.2-osxuniversaldebug.zip",
        sha256 = "49ce2ada53560d61c512091d56e3a37425c2a723f0e042a91c16ff5bcc263487",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.3.2/wpilibNewCommands-cpp-2023.3.2-windowsx86-64debug.zip",
        sha256 = "142f37b9212e31fba6adf370cfc989e836be0ec059f133a41caa29313eb7032e",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.3.2/wpilibNewCommands-cpp-2023.3.2-linuxarm32staticdebug.zip",
        sha256 = "02aa27c3619b29e369f7e59b6b052c0534294bb03888b93147aa5b2781106840",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.3.2/wpilibNewCommands-cpp-2023.3.2-linuxarm64staticdebug.zip",
        sha256 = "0bdd95a912133e9370a4e06c29265e5469b1f6a6ca08af2580d0c05819d8375b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.3.2/wpilibNewCommands-cpp-2023.3.2-linuxx86-64staticdebug.zip",
        sha256 = "c91731b8e796ed92781ae89b8c7ddb4e2f95e16cbaf988f28a6b545ebc327983",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.3.2/wpilibNewCommands-cpp-2023.3.2-osxuniversalstaticdebug.zip",
        sha256 = "2a5a01c1258e8120f9367ff190bcd933d245b652cfbb82655772fd6cddeab624",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.3.2/wpilibNewCommands-cpp-2023.3.2-windowsx86-64staticdebug.zip",
        sha256 = "bcdbeeb1acd0228c99d3a773b6707ce705c5dd968d8690aceced6aba797c4b61",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.3.2/wpilibNewCommands-cpp-2023.3.2-linuxathena.zip",
        sha256 = "684643b1df8f8a961dbfd76b1445058cb24bc7be296b9a10591d54f1398e5ae1",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.3.2/wpilibNewCommands-cpp-2023.3.2-linuxathenastatic.zip",
        sha256 = "91a59b870a6cef0e26566e4a5c7f95bb283ef06002b7fcdf272cb69da6b1d7f0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.3.2/wpilibNewCommands-cpp-2023.3.2-linuxathenadebug.zip",
        sha256 = "f1b482ea0b186cfc42f333ecda87b3360a19ad3109c32ee25c40fd211c7f1e0d",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.3.2/wpilibNewCommands-cpp-2023.3.2-linuxathenastaticdebug.zip",
        sha256 = "10652db7f958bc40c44524933bc9ad22f6beabab87af78efae686346923ce1f2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.3.2/halsim_ds_socket-2023.3.2-sources.zip",
        sha256 = "b542edc604321a73e7049b8cbe84651df4a9aa0a331a90baf0e1b4a5c78053ae",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.3.2/halsim_ds_socket-2023.3.2-linuxarm32.zip",
        sha256 = "c9037a81ebab0031c975e8448bc8d93202c350ab0f92b2d7c1e4c0bce6dc6c10",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ds_socket_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.3.2/halsim_ds_socket-2023.3.2-linuxarm64.zip",
        sha256 = "e1a0b716cab0a185cd4d072d0c3db4b2308038e76fac82f3eb8ac68c5e154865",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ds_socket_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.3.2/halsim_ds_socket-2023.3.2-linuxx86-64.zip",
        sha256 = "180dcadb97af1344828382f10cfcb568d8ce6e2f41ef9ad7748cde0ded1e9f45",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ds_socket_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.3.2/halsim_ds_socket-2023.3.2-osxuniversal.zip",
        sha256 = "e7bb2c5849a78f80eb8bc7648f2b0b9b1afeff2a25f12e7a61ac9042725528a7",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ds_socket_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.3.2/halsim_ds_socket-2023.3.2-windowsx86-64.zip",
        sha256 = "312138ef4f927f4fbdcd134a0246533f13de343c302be9293a6249a10adbd5de",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ds_socket_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.3.2/halsim_ds_socket-2023.3.2-linuxarm32static.zip",
        sha256 = "100e0441ebe8aa5950cbf419fc539558209099f0cd8b7868333c639e17e54469",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.3.2/halsim_ds_socket-2023.3.2-linuxarm64static.zip",
        sha256 = "b5912846a83262dd1fb2061862b6505a8278a1a0ca8adf14537d275acaeff386",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.3.2/halsim_ds_socket-2023.3.2-linuxx86-64static.zip",
        sha256 = "c0103c9ca3ef5fd21d913cc62a872d6de7f37ef13ebf6cab8796e660a53cc602",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.3.2/halsim_ds_socket-2023.3.2-osxuniversalstatic.zip",
        sha256 = "51fd3cc70f7a7704a38e87aedbd22db5a5e3a6e488a263e57918d959b84944ad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.3.2/halsim_ds_socket-2023.3.2-windowsx86-64static.zip",
        sha256 = "d2f1da6f00edd4b05fad5b0256b9a1b69ed8f4c1df98ae5dd53457532cc7fcd8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.3.2/halsim_ds_socket-2023.3.2-linuxarm32debug.zip",
        sha256 = "f43df42f4f526ac6e1649b8afaaa0eb681251735d8ef69e0bcc510ff94324ea1",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ds_socket_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.3.2/halsim_ds_socket-2023.3.2-linuxarm64debug.zip",
        sha256 = "fd1e74c73826a3d039e8fd23ae4f3689caede81c55ce248c6984390e4a6c6746",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ds_socket_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.3.2/halsim_ds_socket-2023.3.2-linuxx86-64debug.zip",
        sha256 = "b8c4c945cc177b22e482ffcccade2acae13933232102ea0b1c82dd80cb5989fa",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ds_socket_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.3.2/halsim_ds_socket-2023.3.2-osxuniversaldebug.zip",
        sha256 = "32e84e3318d2f8801e9e80f71bf13671b128a952b2c2e643035fa17ca770597d",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ds_socket_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.3.2/halsim_ds_socket-2023.3.2-windowsx86-64debug.zip",
        sha256 = "08ae81eaaa9b59983bcb7463d71918eff5337604aa3e96bbdabd77bbda23b35a",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ds_socket_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.3.2/halsim_ds_socket-2023.3.2-linuxarm32staticdebug.zip",
        sha256 = "c599132dd4f43bcd6d158935e13320194f83c0f5cd16873b01acc4cc695fd9d0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.3.2/halsim_ds_socket-2023.3.2-linuxarm64staticdebug.zip",
        sha256 = "c95668a948388f8dc3c83026d9dd70032c59e6f66b951b5610024ffc8a141742",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.3.2/halsim_ds_socket-2023.3.2-linuxx86-64staticdebug.zip",
        sha256 = "c56923e92fe38813e5f037a55cc7bd42552b38d95d86b5f31e61590a21a87dae",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.3.2/halsim_ds_socket-2023.3.2-osxuniversalstaticdebug.zip",
        sha256 = "b80b691da49e06753a37773ab017337ce2e28181a750128b7a91d5bf06c43131",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.3.2/halsim_ds_socket-2023.3.2-windowsx86-64staticdebug.zip",
        sha256 = "619ee86f0fe161dafe607147d29937dd79eb444ed7adbed08944024d585b22a7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.3.2/halsim_gui-2023.3.2-sources.zip",
        sha256 = "a0d1230788fa422dc9c588c3f17a4c5745c47d9bb9c3407bf9193d57282a7522",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.3.2/halsim_gui-2023.3.2-linuxarm32.zip",
        sha256 = "f64ef3ef0d29bd10b5e4587abb738b032fef6bdf9bb64b38557ceda0fec582f0",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_gui_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.3.2/halsim_gui-2023.3.2-linuxarm64.zip",
        sha256 = "f89028cf57cd98ace6a7f6fecc1f93f822432ce6610f71d3a8e795637d8feffe",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_gui_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.3.2/halsim_gui-2023.3.2-linuxx86-64.zip",
        sha256 = "84bf53cab55cae5b31fde931623502523f5b2fd17acba5d02a3bfd51052e2a0b",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_gui_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.3.2/halsim_gui-2023.3.2-osxuniversal.zip",
        sha256 = "d8bc71e87afd0b1d5359efd5d1e101a85debb50a91bcc33d04faacb0f4144635",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_gui_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.3.2/halsim_gui-2023.3.2-windowsx86-64.zip",
        sha256 = "f0cff333c28b36201711e6ed8979ba0b10e8226b689d4c583e092cae7c7279b9",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_gui_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.3.2/halsim_gui-2023.3.2-linuxarm32static.zip",
        sha256 = "cde9a40f9b629f0018dcf1bcecde06e87fc891dff80a1fd83d8f505227a6c51f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.3.2/halsim_gui-2023.3.2-linuxarm64static.zip",
        sha256 = "439fcf461f4a0f078f16b5bf28b7ab0af9774938298ae0deb8958ae73da0df34",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.3.2/halsim_gui-2023.3.2-linuxx86-64static.zip",
        sha256 = "7b4896a58fc37c5886d4f2ff77f39c19cef3e1f704c25c026c737e36ad82f462",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.3.2/halsim_gui-2023.3.2-osxuniversalstatic.zip",
        sha256 = "5cbcff46eaf940e397c7825c357381393d445d7b24b2c71af0685cd440686930",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.3.2/halsim_gui-2023.3.2-windowsx86-64static.zip",
        sha256 = "5563933e82c471eb5e97701fe964f1adbda320b804bb54199aef4a1c1134e431",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.3.2/halsim_gui-2023.3.2-linuxarm32debug.zip",
        sha256 = "4b7a9df89a3e6b07d191271f789fa93621c6c6649d90459c0852c59e64a52313",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_gui_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.3.2/halsim_gui-2023.3.2-linuxarm64debug.zip",
        sha256 = "705449eca2979f3e09a95990f3a2949197f03a9d8ecfc322854a9a44cc50d8ec",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_gui_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.3.2/halsim_gui-2023.3.2-linuxx86-64debug.zip",
        sha256 = "6d2e55ebbece07c16d4a9c7a1d6bb388be6eca1a08e56fd6a296550bb8f8750f",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_gui_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.3.2/halsim_gui-2023.3.2-osxuniversaldebug.zip",
        sha256 = "8d169a4e8fb11d38cd54e23ee2d7d5c8d9db91f14cccb72ee5cd2c35b5f79b08",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_gui_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.3.2/halsim_gui-2023.3.2-windowsx86-64debug.zip",
        sha256 = "d11efba6bc58e5c8d06b1893575240954cd7859260c13523cb87a798a485eed6",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_gui_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.3.2/halsim_gui-2023.3.2-linuxarm32staticdebug.zip",
        sha256 = "2bf71bb719db22c8bce4f20c356f345055080f2f18bb2cb15736ab74bf6a9bf9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.3.2/halsim_gui-2023.3.2-linuxarm64staticdebug.zip",
        sha256 = "22b9c5be1cc285343323aa6e4c59c8076973e5294dff8854a301c675faf663e3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.3.2/halsim_gui-2023.3.2-linuxx86-64staticdebug.zip",
        sha256 = "bd4d790c782e2077950dfa38f568bafa5201f5a85d274fd84d75f4e6047ce134",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.3.2/halsim_gui-2023.3.2-osxuniversalstaticdebug.zip",
        sha256 = "e2c2024faacdff929313150a55ac2b5892d14ef0ae363f1b001df7ac1fc17f55",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.3.2/halsim_gui-2023.3.2-windowsx86-64staticdebug.zip",
        sha256 = "a7e78770a4591f402990f846237c7c97dd9790fa2d71047dc09244b6943d182b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.3.2/halsim_ws_client-2023.3.2-sources.zip",
        sha256 = "a232fdab64e67a5c3f1617cc590f0fe988f51fd235483952e507f0547b95fd2f",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.3.2/halsim_ws_client-2023.3.2-linuxarm32.zip",
        sha256 = "c0210080b9f5b47b1bd7514863d94e4ba3c96421e5b12342534e3c6db37d4def",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ws_client_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.3.2/halsim_ws_client-2023.3.2-linuxarm64.zip",
        sha256 = "a8862308f9cd04eb9bfe6fca91eda3f33c893555d28f1cb21f93b5948bf97d00",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ws_client_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.3.2/halsim_ws_client-2023.3.2-linuxx86-64.zip",
        sha256 = "fa6dfc94807d551b1f2b43b2a024a2b4eed2d13f86b965773ee41fd24330d32f",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ws_client_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.3.2/halsim_ws_client-2023.3.2-osxuniversal.zip",
        sha256 = "4c14f0beeee507eb193e333491b0f1df31bd84428c23baf608aa84f93c8a6be6",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ws_client_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.3.2/halsim_ws_client-2023.3.2-windowsx86-64.zip",
        sha256 = "176f352cbcfa980d2474c9479a7f4cb99bd342fd2cae002ffa712f043a258f88",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ws_client_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.3.2/halsim_ws_client-2023.3.2-linuxarm32static.zip",
        sha256 = "3745147e286ad9f6df8d50495ab21d6f7623f1257809dcab124efc278b88d339",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.3.2/halsim_ws_client-2023.3.2-linuxarm64static.zip",
        sha256 = "e87d71636833e4f646315cc14089b8f6731a0df961d6a85f529b7af187e0cd97",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.3.2/halsim_ws_client-2023.3.2-linuxx86-64static.zip",
        sha256 = "7619a9937afa4c55e6788ddc12c038ad9ea9e8863fc3b9d6a01c7d120ce5cf75",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.3.2/halsim_ws_client-2023.3.2-osxuniversalstatic.zip",
        sha256 = "6cb755e92fcdfb287d9cc0cc557bde9206dda1b42be8706c73c83e7cc36bafd7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.3.2/halsim_ws_client-2023.3.2-windowsx86-64static.zip",
        sha256 = "58d2bd3b8b81bc2ff9a9a96a83d1bbbc968074cf293e4b04fba9b6433304ff60",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.3.2/halsim_ws_client-2023.3.2-linuxarm32debug.zip",
        sha256 = "2b64435ac78ed759abec2cd499663f9e128a80eb79542fc90860766bcb78cb41",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ws_client_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.3.2/halsim_ws_client-2023.3.2-linuxarm64debug.zip",
        sha256 = "8d05675597e86da3c239d28cfbb01608e7ab7e2d450b7266218d2cd905894cc5",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ws_client_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.3.2/halsim_ws_client-2023.3.2-linuxx86-64debug.zip",
        sha256 = "0d122f7316fbf4ef474a8ce497d054569d9e926b5f4cbf6ca1a33a4362cc03e5",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ws_client_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.3.2/halsim_ws_client-2023.3.2-osxuniversaldebug.zip",
        sha256 = "4473a9f9496d38b1495da0a61c4e1ee326b0ffef63ccf92a887f985db3efc6c2",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ws_client_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.3.2/halsim_ws_client-2023.3.2-windowsx86-64debug.zip",
        sha256 = "e4b56da6e0ccd51dca8700ba0db400b1196676d1b9d54c30b5fbfad5efc9a2ec",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ws_client_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.3.2/halsim_ws_client-2023.3.2-linuxarm32staticdebug.zip",
        sha256 = "3890e92ee25abec8676c55880265e11b74db7dfd816bb898a01c272e66ef08d6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.3.2/halsim_ws_client-2023.3.2-linuxarm64staticdebug.zip",
        sha256 = "581f7fa474d0f1ce84b3ff2a5f9b828c87a9c7a7cc17a3198cb597a3541c6bcc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.3.2/halsim_ws_client-2023.3.2-linuxx86-64staticdebug.zip",
        sha256 = "b8018658cfa15c63eaa8f95cec6e1b6aba622001431555cd1f83370ac355125a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.3.2/halsim_ws_client-2023.3.2-osxuniversalstaticdebug.zip",
        sha256 = "b6cece9303b2677ac481af5f67f7bbf838ffac08cb5ca30540e86b8364e15319",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.3.2/halsim_ws_client-2023.3.2-windowsx86-64staticdebug.zip",
        sha256 = "859d5489c2cc4de07a3409366ed8cb59b8346519e26306f654eccd6e92e4a35d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.3.2/halsim_ws_server-2023.3.2-sources.zip",
        sha256 = "fbf1055a1911f7fbd1c342f022784721d8e86b5c54ab0e8c47b76dbcdb462a02",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.3.2/halsim_ws_server-2023.3.2-linuxarm32.zip",
        sha256 = "bbf810d2940b67b6dc9f0b471705a778f1b3228c575ab4705d25b41dfce77ad6",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ws_server_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.3.2/halsim_ws_server-2023.3.2-linuxarm64.zip",
        sha256 = "8dba53017b25131a503a803b5f91bd39d5a42c16f777f7393507ba9388e800db",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ws_server_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.3.2/halsim_ws_server-2023.3.2-linuxx86-64.zip",
        sha256 = "fa6cc770c644aa40745355de18e5ac2d019abdfe95a4eed9066634887a3eba5a",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ws_server_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.3.2/halsim_ws_server-2023.3.2-osxuniversal.zip",
        sha256 = "aed7582ea137ea580cc1c3676f5f01b6e2cb692a80d7d690c82fafce6cdcbcbc",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ws_server_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.3.2/halsim_ws_server-2023.3.2-windowsx86-64.zip",
        sha256 = "e01b2df14a47b0daab48a7b7e621c6456c29464fefb491f3af9720e74ca8f228",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ws_server_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.3.2/halsim_ws_server-2023.3.2-linuxarm32static.zip",
        sha256 = "f3db0598537d33eac9d8b93b91d59fdaf13d0ebeb1bb7c9021d84fe266e41f00",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.3.2/halsim_ws_server-2023.3.2-linuxarm64static.zip",
        sha256 = "234d09d55aa7f8c98bbc016b9d8fc72a0907367cebba08d6175917264ab3f2b3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.3.2/halsim_ws_server-2023.3.2-linuxx86-64static.zip",
        sha256 = "3f810c3aac829319149ea65d871038e981f9766ec2e6cede1ec37a6c805229ba",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.3.2/halsim_ws_server-2023.3.2-osxuniversalstatic.zip",
        sha256 = "52ab256204765ee36cabc2136144e1d7e3400acf7d980c108f5683ea9c8ecc56",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.3.2/halsim_ws_server-2023.3.2-windowsx86-64static.zip",
        sha256 = "00c8f3fa0350409cf8f4ba4d3d045c28d38496e9850cced2e6470e7f3a074fd1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.3.2/halsim_ws_server-2023.3.2-linuxarm32debug.zip",
        sha256 = "367b4858560b93a7a079ffd464a01e141ca0e1e679588178e5496f7827c0f57e",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ws_server_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.3.2/halsim_ws_server-2023.3.2-linuxarm64debug.zip",
        sha256 = "86062a762ec310fcd8a78294f724c542dfdf38bc1a88292106ab74db8fbe9cf4",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ws_server_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.3.2/halsim_ws_server-2023.3.2-linuxx86-64debug.zip",
        sha256 = "c37205bd50ed00c1bd257be76c93f8856e042f36a78f14f01b942836f0a139d6",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ws_server_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.3.2/halsim_ws_server-2023.3.2-osxuniversaldebug.zip",
        sha256 = "cf110a35afadc438132ecb4fd112d0a0f1a1cf23c2e26a1ee99027bc6a003800",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ws_server_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.3.2/halsim_ws_server-2023.3.2-windowsx86-64debug.zip",
        sha256 = "5b8ca092a615a84133edde5b7140a2df38f7f969294c431748ff2834a6942995",
        build_file_content =
            """
#static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
_shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*jni.dylib", "**/*.so.debug", "**/libopencv_java*.dylib"])
_shared_srcs2 = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
#shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

print(_shared_srcs)
print(_shared_srcs2)

cc_import(
  name = "shared_libs",
  # shared_library = "linux/x86-64/shared/libwpiutil.so",
  shared_library = "osx/universal/shared/libwpiutil.dylib",
  deps = ["@bazelrio_edu_wpi_first_halsim_halsim_ws_server_headers//:headers"],
    visibility = ["//visibility:public"],
)
""",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.3.2/halsim_ws_server-2023.3.2-linuxarm32staticdebug.zip",
        sha256 = "80aac887961264c5b45722f7a180f4b07e24e09dd643dab50769a23d0b4218fc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.3.2/halsim_ws_server-2023.3.2-linuxarm64staticdebug.zip",
        sha256 = "5253665d59b5e8708df3db91052acb8c740f1328cd851bdaad5f79288491cb0c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.3.2/halsim_ws_server-2023.3.2-linuxx86-64staticdebug.zip",
        sha256 = "2eb4995a129ed63195fa7638f65a7e8709abc4f0f6b7c64b5a43a37070a569e1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.3.2/halsim_ws_server-2023.3.2-osxuniversalstaticdebug.zip",
        sha256 = "0af9af7dc7cc09bdede72eae5e531e6cf37f83de95db8434674c1859865c3096",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.3.2/halsim_ws_server-2023.3.2-windowsx86-64staticdebug.zip",
        sha256 = "375fc2e5e9df0f79cdfc12861f6a3acd10ac40e22374b524d1646c47bb52600b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2023.3.2/SmartDashboard-2023.3.2-linuxx64.jar",
        sha256 = "62868b8f1c01e29686cfeec05f1c3499cfbac8ecd604aab61602b007903ad169",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2023.3.2/SmartDashboard-2023.3.2-macx64.jar",
        sha256 = "003ac9992cc69c80a73d1a14f379c9b44c2753456b457966dd3fc1a76ef445f2",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2023.3.2/SmartDashboard-2023.3.2-winx64.jar",
        sha256 = "9a74951d8b9bed9fdf3d938f01791a27f4dcf604fc0600266fca51885da2f3f1",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.3.2/PathWeaver-2023.3.2-linuxarm32.jar",
        sha256 = "7ab73a0d6739b7fd116c6e310a532c9fbc35ba13a90b490ad5c8eb481f87a721",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.3.2/PathWeaver-2023.3.2-linuxarm64.jar",
        sha256 = "613b6608d8d1b63831f6952ff3c080ce03cd132decbe659335f022720e2dfe6a",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.3.2/PathWeaver-2023.3.2-linuxx64.jar",
        sha256 = "f61ac447d87ec9b89778399da01bc5ce3475608a48c33f20800275aeee302de0",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.3.2/PathWeaver-2023.3.2-macx64.jar",
        sha256 = "f215ebb1e6b11a4416f6b125ae60a7f0ba25f913cf8f11000da2518281ec5d03",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.3.2/PathWeaver-2023.3.2-winx64.jar",
        sha256 = "42b6ac66312fa65082e4c995683d464102c04e444a24a778051c9b7c43a5c942",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2023.3.2/RobotBuilder-2023.3.2.jar",
        sha256 = "44ed48d428b9eebb10613b07715adbf420705c69f2978d2591fa52a367cd2d99",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.3.2/Shuffleboard-2023.3.2-linuxarm32.jar",
        sha256 = "6e9b6541d60cb401c22109e77884e433fb5b6262cde2055010867cba2c62ec0f",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.3.2/Shuffleboard-2023.3.2-linuxarm64.jar",
        sha256 = "93ba7d2b41a89bc1ac26f07e1429b68f9626862291706552edd27512d066bc91",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.3.2/Shuffleboard-2023.3.2-linuxx64.jar",
        sha256 = "6fb9922d5849f1e009cab329b08816e6785d06d8e7c46af038ffe518cffb8675",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.3.2/Shuffleboard-2023.3.2-macarm64.jar",
        sha256 = "1b4aac58ff88e6ce99632bcb3d481998c152099c16f1dde2624bafc91f3050b6",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.3.2/Shuffleboard-2023.3.2-macx64.jar",
        sha256 = "6b5f4053f10678a5f2fb79e980732f35964b2b92b491bb338f1ca63da28395a9",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.3.2/Shuffleboard-2023.3.2-winx64.jar",
        sha256 = "a8fe4a65dc7d4f58ad9af32aff78af9ad1ae4726027045fc219efb0df0aaa106",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.3.2/Glass-2023.3.2-linuxarm32.zip",
        sha256 = "a7f91910c70494011d9422aa0e51b966ab5f56cc4aaf35ca653548aaed678b11",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.3.2/Glass-2023.3.2-linuxarm64.zip",
        sha256 = "d324228cd6179c97740937b1a22b03857716c4688228aa098190f8257482d58a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.3.2/Glass-2023.3.2-linuxx86-64.zip",
        sha256 = "42546204c635364f19013081c6b3af6580d884e9bb07c1753c2b7383a8b84a7f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.3.2/Glass-2023.3.2-osxuniversal.zip",
        sha256 = "d11308eead554233a435aa68d78124e5a7964751432ef52b3beb33e25138a89e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.3.2/Glass-2023.3.2-windowsx86-64.zip",
        sha256 = "f374b0361d582dc40aa58f37eac526c74eb356c3dabe136174527caebaaccf3d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.3.2/OutlineViewer-2023.3.2-linuxarm32.zip",
        sha256 = "e691ce192bc7f626d7969ba5472f37a12d49382da5d5fe30ca642ff6376a5ae6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.3.2/OutlineViewer-2023.3.2-linuxarm64.zip",
        sha256 = "87f075c4dee9f2e1b5d6cca4e348d41465c5b183c15fffc82ed8a9bd94f662d5",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.3.2/OutlineViewer-2023.3.2-linuxx86-64.zip",
        sha256 = "4d99e8da4a91e8eac3b946b0c43584f4d637d6424376b49aed858ce3709b74bd",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.3.2/OutlineViewer-2023.3.2-osxuniversal.zip",
        sha256 = "a8b28027d13694d6e0f1be968ae18b0a627eee23822a66c16276cf3060d1f623",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.3.2/OutlineViewer-2023.3.2-windowsx86-64.zip",
        sha256 = "dd63a18b4c8162a9496144cf321ae86a84d08e0c1692685bfb62452781052525",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.3.2/roboRIOTeamNumberSetter-2023.3.2-linuxarm32.zip",
        sha256 = "5ed971dcac956ebd4f0bf4eeca544962c9dbb1974a50c406068e31632da3eec6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.3.2/roboRIOTeamNumberSetter-2023.3.2-linuxarm64.zip",
        sha256 = "c3d14c9b81e92ea245b18c04ed7c01d4f46f3a12310fda6f4f9af5e2e531731d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.3.2/roboRIOTeamNumberSetter-2023.3.2-linuxx86-64.zip",
        sha256 = "0e2b988c3e400712237a7a2a24f72a5fd03c7aa93a55d55f7037d30e9f8fe3f6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.3.2/roboRIOTeamNumberSetter-2023.3.2-osxuniversal.zip",
        sha256 = "2077cd91625ab80df867cb5c945e2db3db40bbfa089c3c57694e8310c6963cab",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.3.2/roboRIOTeamNumberSetter-2023.3.2-windowsx86-64.zip",
        sha256 = "2ff51c2368edf67453a8ad7d18d14e3cc45138e5d354982a8149eee6ec48c666",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.3.2/DataLogTool-2023.3.2-linuxarm32.zip",
        sha256 = "77cc8bc1daeba596c149d3230e5f149939e176745ec6bd063d4429c334c4f7f2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.3.2/DataLogTool-2023.3.2-linuxarm64.zip",
        sha256 = "c624dcdc098aee3d4d212fedd2379ad19c7f15b06f2a4ee58e5ebf3cdd3b75e5",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.3.2/DataLogTool-2023.3.2-linuxx86-64.zip",
        sha256 = "f56601ff2018f78604842d0c638526b591ae9459819edca8c4b322cdfa5ec98c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.3.2/DataLogTool-2023.3.2-osxuniversal.zip",
        sha256 = "7efd8fa8f64e5cc5d7fd53fead158d51259c6fcdba2975716b3d860253b02cb7",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.3.2/DataLogTool-2023.3.2-windowsx86-64.zip",
        sha256 = "38f7212e130405b72b25b5a5d45cd86d77d5d1500024fea209eef46cae3f3fbe",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2023.3.2/SysId-2023.3.2-linuxx86-64.zip",
        sha256 = "99e38db84aa8938d6f4874e5f6223dfc11815398b7866a2b004496441e1c6ed1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2023.3.2/SysId-2023.3.2-osxuniversal.zip",
        sha256 = "949c0811160104f19442baea3cdb330fe1065b40fc0fc1855468fcf68c1dd3f0",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2023.3.2/SysId-2023.3.2-windowsx86-64.zip",
        sha256 = "6bab93594aa86015e701fbd4fb8f5f44f3021c99c3eb3dc6872de813625c210d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
