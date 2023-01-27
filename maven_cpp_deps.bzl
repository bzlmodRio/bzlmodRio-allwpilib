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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1/wpiutil-cpp-2023.1.1-headers.zip",
        sha256 = "4d6b2947c4a755eabf5008ae07c3a138cb4fd69ed6d826c2b254fe060b9ff912",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1/wpiutil-cpp-2023.1.1-sources.zip",
        sha256 = "3073273f7040dae7cfae046c8c56acbd17ce3022b372e5e72a7b478de0fcc7a0",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1/wpiutil-cpp-2023.1.1-linuxarm32.zip",
        sha256 = "894c763ecd2669a404ab5de0261d206497c94f7b80c502036b9274f4e1cc1a81",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1/wpiutil-cpp-2023.1.1-linuxarm64.zip",
        sha256 = "1ba44d3c0dfe2b9f9bf76cc4753d0988487a224d78ed740550b3dc40e876eb29",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1/wpiutil-cpp-2023.1.1-linuxx86-64.zip",
        sha256 = "2dd66e562d41fd4f06ab2067688ce1c5ac90db1d078c52da313cba76ed5f3a5c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1/wpiutil-cpp-2023.1.1-osxuniversal.zip",
        sha256 = "c506f7af2a85bdcfa214fda59c107a2d1adb846c93b719589f6e897c6a214eb1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1/wpiutil-cpp-2023.1.1-windowsx86-64.zip",
        sha256 = "20639b447d57af04ea3eb8b36c9e026c16380bfdbfb0fd2f4fe1f2754b11e794",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1/wpiutil-cpp-2023.1.1-linuxarm32static.zip",
        sha256 = "2f530e01b68193cbfa6d3c98608005b231b532dff249153213de3e1369ff77ff",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1/wpiutil-cpp-2023.1.1-linuxarm64static.zip",
        sha256 = "ada483ac27a8a68ddd46584b6f829e8b527d7085d45d2efe0194a9f84a7e7e90",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1/wpiutil-cpp-2023.1.1-linuxx86-64static.zip",
        sha256 = "4e87a27683a43630d837e3a7dccf638b96684ac747ac628674c4f813740dfcb3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1/wpiutil-cpp-2023.1.1-osxuniversalstatic.zip",
        sha256 = "8ae3cff6755f1dee6874e1346e1191813d5505976a8e65e1b21a0fd1c03eca94",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1/wpiutil-cpp-2023.1.1-windowsx86-64static.zip",
        sha256 = "2449df9a585568aee0a3ae926680c4aad6a5787177be7014ae6ca1d6e4353858",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1/wpiutil-cpp-2023.1.1-linuxarm32debug.zip",
        sha256 = "f942fd107a6d12f949b3e342994d1fb4e050069d693b7d6e2fbad143ffc34307",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1/wpiutil-cpp-2023.1.1-linuxarm64debug.zip",
        sha256 = "536814b8e7c0e571fb52ba8f0cf130a736ee36ab612652128dd4b9c8cc672c0e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1/wpiutil-cpp-2023.1.1-linuxx86-64debug.zip",
        sha256 = "723ec703cb95019ea962a5a26f370027ca0bcae26e85ea40132927e2387eb677",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1/wpiutil-cpp-2023.1.1-osxuniversaldebug.zip",
        sha256 = "bd958f16e81e2131856a79e8fd30284565eb540465450ff89e5047384e71cf49",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1/wpiutil-cpp-2023.1.1-windowsx86-64debug.zip",
        sha256 = "f87e2e0f506a67408a411aa2c0a114ee782d411473ce3f991d4054c840d34d29",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1/wpiutil-cpp-2023.1.1-linuxarm32staticdebug.zip",
        sha256 = "0d7a3e4ca97fb0dd357994854ed970ece26bf040af2f7767db2fd38ade260cce",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1/wpiutil-cpp-2023.1.1-linuxarm64staticdebug.zip",
        sha256 = "2b739cc7a979bce9f822070f472a91c938cd2e6834b14fe44dc48bd090311545",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1/wpiutil-cpp-2023.1.1-linuxx86-64staticdebug.zip",
        sha256 = "0eb20f2c81886de12834ee04ca8fd0195df94f09d1c73c0c24a3f528d31746f7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1/wpiutil-cpp-2023.1.1-osxuniversalstaticdebug.zip",
        sha256 = "9fdb1acd801e2a1f2cb4a88bbc142239b501f23634eedfcae20dd9b9eab942dd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1/wpiutil-cpp-2023.1.1-windowsx86-64staticdebug.zip",
        sha256 = "25ef2106dfecb88448cf76ca6ebaf547a90da2c54c3576a2146f3d9009ebf3b1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1/wpiutil-cpp-2023.1.1-linuxathena.zip",
        sha256 = "15da2298fb5074f8ab088795a35d7efab9f89c776ef1a682fcf35198b452eccd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1/wpiutil-cpp-2023.1.1-linuxathenastatic.zip",
        sha256 = "d38f6aaf981e87e719fb1b117e45ef02679c96701a255ec416887c6d2b3f6097",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1/wpiutil-cpp-2023.1.1-linuxathenadebug.zip",
        sha256 = "84818c462ade6278c49ffc59267e45f1aebcb5d7c3400c6c24162ba9af19ab0b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.1.1/wpiutil-cpp-2023.1.1-linuxathenastaticdebug.zip",
        sha256 = "54eab944084300f4be9f21a736ad39f0ab5c5661b98d3b382302883391a34e8b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1/wpinet-cpp-2023.1.1-headers.zip",
        sha256 = "0bf09dc97410df9ca472f630055d28081dbe5f0b56ff0e821f7d38911ccaf30d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1/wpinet-cpp-2023.1.1-sources.zip",
        sha256 = "5f34c57385203f412e7e391ee72d738a3609c16011f061f4a5b525dbbb835646",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1/wpinet-cpp-2023.1.1-linuxarm32.zip",
        sha256 = "5624271d1493f32dbce453c7d73daf678e791a62651901ade9b61aa51ed0feb6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1/wpinet-cpp-2023.1.1-linuxarm64.zip",
        sha256 = "4574e53433208a011920d6cb83b9a8d2683ede14331f8920130a7f663675c347",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1/wpinet-cpp-2023.1.1-linuxx86-64.zip",
        sha256 = "1d484d581a2c672f46273d65fa38839ad0f977f84a5b1d5b298b07604c8bef81",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1/wpinet-cpp-2023.1.1-osxuniversal.zip",
        sha256 = "b062b929f0c1950c83c714e897742f741e093db3beee86d831f47cfc65412cf6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1/wpinet-cpp-2023.1.1-windowsx86-64.zip",
        sha256 = "7d9300791ea3905ab26fc082985f2d2214f37674d97f0282696a673037791841",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1/wpinet-cpp-2023.1.1-linuxarm32static.zip",
        sha256 = "bf4fab5469a8ed832b86c37feba97c6543e4425c17635df173864bd85b615c47",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1/wpinet-cpp-2023.1.1-linuxarm64static.zip",
        sha256 = "3a0a996bbabf4636debc4eeed43c78e5b4532801e152a2790dfafb6dd4e79330",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1/wpinet-cpp-2023.1.1-linuxx86-64static.zip",
        sha256 = "dd0df5f6945d6c92991a1f668e8d9c975d99e94f3553923339e350eb74f4b905",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1/wpinet-cpp-2023.1.1-osxuniversalstatic.zip",
        sha256 = "e25ce3c028eb099e0ace08d34a6dc322ea164fdb6d6a8ab2ae2be08bfd0755da",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1/wpinet-cpp-2023.1.1-windowsx86-64static.zip",
        sha256 = "8529d20e9d1b71251035dfe1f3ba8558afdfddb44dce226f39300c00e39d7f29",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1/wpinet-cpp-2023.1.1-linuxarm32debug.zip",
        sha256 = "6c1d625f521f49885af9f90a4cfa4db0f88be1f974970304f73d1f7662139b09",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1/wpinet-cpp-2023.1.1-linuxarm64debug.zip",
        sha256 = "bfea3ca8ccbfce2bfcc2a764d1448a932581b888fe556809c61b7d73d4b2901a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1/wpinet-cpp-2023.1.1-linuxx86-64debug.zip",
        sha256 = "6459322e6b5d5523bf869c8c6c2c3ca6e9909e1fbb4c129fef599634ffabd2a0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1/wpinet-cpp-2023.1.1-osxuniversaldebug.zip",
        sha256 = "f59eb3904cacf3dd78de7ee27c858973c55b220dc9f771b5301a87427791cff8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1/wpinet-cpp-2023.1.1-windowsx86-64debug.zip",
        sha256 = "41d3ceaa8084cd43ff76dc00235ee149cdbe79c91c6bd6008760fc337f56ee95",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1/wpinet-cpp-2023.1.1-linuxarm32staticdebug.zip",
        sha256 = "465c0b5deffcc0bec878934a72d139c28bb1ceed22faf7576e1adaf0e2838170",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1/wpinet-cpp-2023.1.1-linuxarm64staticdebug.zip",
        sha256 = "dc3475f613d2ab39d1547ad99992ee56b51fd4bc109133a3bb713ab07c6a1921",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1/wpinet-cpp-2023.1.1-linuxx86-64staticdebug.zip",
        sha256 = "560d57eec20acdc20cb3aa93fe69da6403408a02fa5e9019e5ebd0a98cf27fa5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1/wpinet-cpp-2023.1.1-osxuniversalstaticdebug.zip",
        sha256 = "5d56b69068e7630a2f5e1b8a7485a4deb123b2484b5c6bad748a1fd61ded4587",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1/wpinet-cpp-2023.1.1-windowsx86-64staticdebug.zip",
        sha256 = "b2c705d96937a4f1d1822503cec83eb5f1149a236589f327a7c5bf6717bc5218",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1/wpinet-cpp-2023.1.1-linuxathena.zip",
        sha256 = "6365795ae497ab23cac3a7bb4ccb00d29d1bbf6bbb22ea350975986f6b53b350",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1/wpinet-cpp-2023.1.1-linuxathenastatic.zip",
        sha256 = "498f148554955eec0d3f236ae00e58c7c5ce461622b8bb5aeac99b3fc7945fb9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1/wpinet-cpp-2023.1.1-linuxathenadebug.zip",
        sha256 = "c6d75bcfa4974ab5ab37e84c1ccdbeb704fb82d70b2ed450fde879ba047a3a43",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.1.1/wpinet-cpp-2023.1.1-linuxathenastaticdebug.zip",
        sha256 = "9d0bb793f3322a750f1663dd00952f485510b61a6b539eeda3ea58a8e79bc5cd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1/wpimath-cpp-2023.1.1-headers.zip",
        sha256 = "0910593e36ba638c6d061b8be0144ff15c0b9c3bc3f8678f5b987cf69782d9e7",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1/wpimath-cpp-2023.1.1-sources.zip",
        sha256 = "1f53a70ea82ad28313f384f39bef0a78a62e1393458577ce26c6edb66c11ec75",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1/wpimath-cpp-2023.1.1-linuxarm32.zip",
        sha256 = "4fac6c3217a0ba5c48b4888ef7a449532294e104b0b037536145aeb48683a86a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1/wpimath-cpp-2023.1.1-linuxarm64.zip",
        sha256 = "44b41a506b038c1ae84290c161aa14c7f67a31f317d8bb5d50dc13aefd410f1f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1/wpimath-cpp-2023.1.1-linuxx86-64.zip",
        sha256 = "be80a6c8aa37637b44d861be08fe64efe3f06d8e202c5de09a1397fec647d302",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1/wpimath-cpp-2023.1.1-osxuniversal.zip",
        sha256 = "edeed8aba7d6b065f5af22a945c5e2e110a71cb90adfe10a193bfa6929379028",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1/wpimath-cpp-2023.1.1-windowsx86-64.zip",
        sha256 = "2705ee3edf5d4e3b6cc10710ae77a3f604529a7380d5453a316c4345f1f50b7c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1/wpimath-cpp-2023.1.1-linuxarm32static.zip",
        sha256 = "f3d6ee17bdecb5d099ee11fe6b624b7b9d529ade8da30772482a3f63beff3582",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1/wpimath-cpp-2023.1.1-linuxarm64static.zip",
        sha256 = "7c0615d18ccaba8a34b9ac50f7ce6e1bd7c0318cccaf95217ea82d860acf298c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1/wpimath-cpp-2023.1.1-linuxx86-64static.zip",
        sha256 = "a212a1e3134f2655cbce9756c0732d237f97085b47bf1d436bf4ef6676331eea",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1/wpimath-cpp-2023.1.1-osxuniversalstatic.zip",
        sha256 = "3e24ad0ac8dd40e24a705d954275fddbb64da5816f2375bc4073bddb323be4aa",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1/wpimath-cpp-2023.1.1-windowsx86-64static.zip",
        sha256 = "821fb0beb5029b7b04c5dbb1cd484a3b4d2779072134e1f624a91cfbb695a0c9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1/wpimath-cpp-2023.1.1-linuxarm32debug.zip",
        sha256 = "374e1dc54779b6cc519ab34307745c89010b472d6e24bf93a7df5886275f95e5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1/wpimath-cpp-2023.1.1-linuxarm64debug.zip",
        sha256 = "965ba123bac5a5d47b2ce3f0b51ad1f35ed9a43351fb956dbead1ecd75461994",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1/wpimath-cpp-2023.1.1-linuxx86-64debug.zip",
        sha256 = "bd10fd3f9564441c68a7eacdf469d59f75314818df2870b3f2e5725acb60d772",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1/wpimath-cpp-2023.1.1-osxuniversaldebug.zip",
        sha256 = "df6b3a1f1d58202afa17641fafcedef326b63439303334345fb4dfd08d01b30c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1/wpimath-cpp-2023.1.1-windowsx86-64debug.zip",
        sha256 = "477706efbc1c00d9f62c72cab2faa5fd59dc71241adc9e3104fee9be9629f99c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1/wpimath-cpp-2023.1.1-linuxarm32staticdebug.zip",
        sha256 = "1fcdf02ec95edcad490f2609ad3b077f293fe2ff6ab0f1f0c918755eb3c13e27",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1/wpimath-cpp-2023.1.1-linuxarm64staticdebug.zip",
        sha256 = "edc57bf7a6350e3d881553e68f8d04ba050b640c1719453df43996426033fe7b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1/wpimath-cpp-2023.1.1-linuxx86-64staticdebug.zip",
        sha256 = "84c1b45c680399f803612adde81a8e0600dc7e7a7f1453635206d4eac8d94c1c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1/wpimath-cpp-2023.1.1-osxuniversalstaticdebug.zip",
        sha256 = "20413a63d385d199a345e01857d7b82c1aadff711297030db0faeb406b9b415e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1/wpimath-cpp-2023.1.1-windowsx86-64staticdebug.zip",
        sha256 = "071f7236f0619d061781701805f49469118b6093290f62fcdbf1310a48c4a4f4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1/wpimath-cpp-2023.1.1-linuxathena.zip",
        sha256 = "baa93352a8c050f6e7a6dcf0399c6bdcff8242b5c813793392e478af22ab057b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1/wpimath-cpp-2023.1.1-linuxathenastatic.zip",
        sha256 = "4c257e609a41f8f97d949c95dae338f72f3160f8b48383e53234d9de49e78e1f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1/wpimath-cpp-2023.1.1-linuxathenadebug.zip",
        sha256 = "98f93e01cdf6774d98c5e90f9f37f9a885f965fd29492907ab5ce52a4f87b753",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.1.1/wpimath-cpp-2023.1.1-linuxathenastaticdebug.zip",
        sha256 = "419113054741f1d6fdec2a2b6f264ed7401d3dc5134fa55553ec82963e01b1fd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.1.1/apriltag-cpp-2023.1.1-headers.zip",
        sha256 = "07edca2980e8f59e9706ac5977434f1960b1b6a73c50dc01e0dd1ed1f9b82cef",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.1.1/apriltag-cpp-2023.1.1-sources.zip",
        sha256 = "f657e0154adbd93ecf6e7b204c9a759bfcbcb3835a644416d7d86349c632c717",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.1.1/apriltag-cpp-2023.1.1-linuxarm32.zip",
        sha256 = "2012da16d2e150f04d0c6f289134342679acff937baa5190e06c5893d01acfe4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.1.1/apriltag-cpp-2023.1.1-linuxarm64.zip",
        sha256 = "5db2c843038b08b83ee0c03337e627740f88758fb0d24c795750713c85d17f83",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.1.1/apriltag-cpp-2023.1.1-linuxx86-64.zip",
        sha256 = "da9d0b56de03a9e4cbfe8ba6cc1f7560b23ca8cc2ebf198f529e1eb95a1205af",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.1.1/apriltag-cpp-2023.1.1-osxuniversal.zip",
        sha256 = "b585f69d96ab4f42181d28daf1b1a0477b1ebc19688a3174eb3933617d303456",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.1.1/apriltag-cpp-2023.1.1-windowsx86-64.zip",
        sha256 = "a8996b6d341a78914d78536bc9af577c109c88d14bf31cc1351f63f43119589e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.1.1/apriltag-cpp-2023.1.1-linuxarm32static.zip",
        sha256 = "301104015024c7cc54307bbfbecd1768fcf5b3a857e94226cf5f7722c9f30889",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.1.1/apriltag-cpp-2023.1.1-linuxarm64static.zip",
        sha256 = "470aae0f827bc9ed676551406d36f1dfe6b22b6f8b7579bfb09986e955d9f20f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.1.1/apriltag-cpp-2023.1.1-linuxx86-64static.zip",
        sha256 = "282f5edada5b10eb0177cf3aeefb64754aeb56c9069107558af9e8f7d44970f0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.1.1/apriltag-cpp-2023.1.1-osxuniversalstatic.zip",
        sha256 = "660263c88cc657892dae37305dd0e723b40805079a9ca73d6bc12e6ad36f221c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.1.1/apriltag-cpp-2023.1.1-windowsx86-64static.zip",
        sha256 = "53c089d976fc4a6f59fb94d0a353e9b28cae7f6299bcdb1eef0eb5e834799e8a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.1.1/apriltag-cpp-2023.1.1-linuxarm32debug.zip",
        sha256 = "41108315128d68f17a7a33e4c9655040488789f8561c965835d608bdf178b57b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.1.1/apriltag-cpp-2023.1.1-linuxarm64debug.zip",
        sha256 = "0cf2f2d21a9399c3dbda75ab9388866bb8a3a91579d9f2b0e3d50874b6a386e9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.1.1/apriltag-cpp-2023.1.1-linuxx86-64debug.zip",
        sha256 = "8a3425716980d17ff51b48b9dcab8d931d941ceba552ec5bf4a16afe68e1d706",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.1.1/apriltag-cpp-2023.1.1-osxuniversaldebug.zip",
        sha256 = "3a6f734784d776c3c5e5aee0df03fef8aaf872d167579efe78eff73dbc475bb1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.1.1/apriltag-cpp-2023.1.1-windowsx86-64debug.zip",
        sha256 = "d2493fa1f47a88d16c71fec9872474b71d255463e93e185f9666c8efa5632896",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.1.1/apriltag-cpp-2023.1.1-linuxarm32staticdebug.zip",
        sha256 = "65abdfd6c33ad299329e3f3104fbe1cf7e3d624aeb2ac4a31588678b0826b00e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.1.1/apriltag-cpp-2023.1.1-linuxarm64staticdebug.zip",
        sha256 = "e43c5b0885eb716130fde10039ea5e06720c1f17f95844ff21b624635500c4ac",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.1.1/apriltag-cpp-2023.1.1-linuxx86-64staticdebug.zip",
        sha256 = "cd5a3ea6587f5b14d36d11ce135504552d7bcf08154b6997c011670c5c680f58",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.1.1/apriltag-cpp-2023.1.1-osxuniversalstaticdebug.zip",
        sha256 = "828c7a080ceab4f970cc3dd950e297d4afaa433657ebf84c23d552fd09dca1ef",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.1.1/apriltag-cpp-2023.1.1-windowsx86-64staticdebug.zip",
        sha256 = "ff5f5834d1eea4733253f1c3c30db8bbc8442dffcb0c203b844554ffc615dc57",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.1.1/apriltag-cpp-2023.1.1-linuxathena.zip",
        sha256 = "8bf79647e76881259233f2fc9e785397a53a9ffec89b961ea67d081b5d535682",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.1.1/apriltag-cpp-2023.1.1-linuxathenastatic.zip",
        sha256 = "bbe371a5d58482c545ba1eb537191a399f2545df6aeeb25d14a9dff6ea9d5e5e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.1.1/apriltag-cpp-2023.1.1-linuxathenadebug.zip",
        sha256 = "4f98633c032a31dd11be774a399fec4f3d482b72fb19a3fd458065cfde2620ce",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.1.1/apriltag-cpp-2023.1.1-linuxathenastaticdebug.zip",
        sha256 = "b956d45503e3611d5e7856c1d15257056c0714638bd1c32089bd48319172b64f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1/hal-cpp-2023.1.1-headers.zip",
        sha256 = "ddacddaa98a8335362ce58a184e43ec19555cdddb27e0830712da77199c85e17",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1/hal-cpp-2023.1.1-sources.zip",
        sha256 = "9d6a63402dd7e61271b3b00f30b50f2ee388cb46e83f3e2706216c6349a7cffe",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1/hal-cpp-2023.1.1-linuxarm32.zip",
        sha256 = "594782479a0192bc5c14127717fffa8f44cdbf4f410bb02b3d24c9b511b47c4c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1/hal-cpp-2023.1.1-linuxarm64.zip",
        sha256 = "0bb376f83ecdc09bae78540291fc01832a6a54865cd62584a371d29261a57b11",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1/hal-cpp-2023.1.1-linuxx86-64.zip",
        sha256 = "f19ba56c4443fd8a2006f532c8b27b78c5b91a5b447fb8ffde22f2c8b835cb5b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1/hal-cpp-2023.1.1-osxuniversal.zip",
        sha256 = "3690de2b80e776fdf949155cecafc15c2edf4168506e5b57b8bb2337885806af",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1/hal-cpp-2023.1.1-windowsx86-64.zip",
        sha256 = "de51fe0e777640c2ad2716ff43ef2713aa4211bce58e4c34fb092e389b417723",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1/hal-cpp-2023.1.1-linuxarm32static.zip",
        sha256 = "d3ed4fc7591b1bef29d4d81bafadf6af7b539d21d1257d107b4cfe8d7450f47e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1/hal-cpp-2023.1.1-linuxarm64static.zip",
        sha256 = "24d888f9b450e37157cd55daaeb6483af5417ed8357b5187af396c98a825a49c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1/hal-cpp-2023.1.1-linuxx86-64static.zip",
        sha256 = "523b93cd7d7bbb3ed9d974b99c9affe5765e2c93fc4468b81f7299c739b7cead",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1/hal-cpp-2023.1.1-osxuniversalstatic.zip",
        sha256 = "c47766fd8990200d71eadecea1e7e0c499c2cd7d6103f0ad956e4369fb94e3f2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1/hal-cpp-2023.1.1-windowsx86-64static.zip",
        sha256 = "b30875b22c75a2332c6ca7e5a2289ea497e7383abe8b761526a79ae4cc629093",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1/hal-cpp-2023.1.1-linuxarm32debug.zip",
        sha256 = "9e1fc98a98bf3c6eeb088ec2754f6bbe9a1c2f03df26f4483987a0cf3ba72d59",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1/hal-cpp-2023.1.1-linuxarm64debug.zip",
        sha256 = "89955fe62994fe34b432941f2cbc5e6afb64f783b08d2dcf16d73a6b35700ea5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1/hal-cpp-2023.1.1-linuxx86-64debug.zip",
        sha256 = "02246fe0a4b35e3fee0b72a434e88b0661ab8b755b747b71babb7d0286bdfd28",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1/hal-cpp-2023.1.1-osxuniversaldebug.zip",
        sha256 = "c440d1e5591429fb40151ec4f98831219e0403d90dbe4684345a8a24b2f430d9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1/hal-cpp-2023.1.1-windowsx86-64debug.zip",
        sha256 = "c017b00245688613e7fdd4b53d531c9f1f793e786620ecccfe11774a0a797250",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1/hal-cpp-2023.1.1-linuxarm32staticdebug.zip",
        sha256 = "cd6e8345efc6cc0c0e1c174b233476b7dc38d69ac89708282a12dafa29ef2baa",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1/hal-cpp-2023.1.1-linuxarm64staticdebug.zip",
        sha256 = "c045607f7592bca33819d08d95302a4cf69534406580d91e97b292ee3cfd8652",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1/hal-cpp-2023.1.1-linuxx86-64staticdebug.zip",
        sha256 = "7d789d5f80af9559b9675d1bf6cfc289487bfc84e2d2de82ff1eb5440d5bf237",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1/hal-cpp-2023.1.1-osxuniversalstaticdebug.zip",
        sha256 = "e5d2e234eb75356596202d0095b7ab72ec0d04a6ee2f8ba120a07e0702cc8956",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1/hal-cpp-2023.1.1-windowsx86-64staticdebug.zip",
        sha256 = "ad05e9b5220a4ae90f1f54e98cd11ee035af68ce553c7b88a9b031a90eead13b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1/hal-cpp-2023.1.1-linuxathena.zip",
        sha256 = "d5dec6332ccd5655bfc956fb49531183c7befcb59d785c02fa27b5988c4e7e86",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1/hal-cpp-2023.1.1-linuxathenastatic.zip",
        sha256 = "b5aecdb9251c0c92dc475fc703cef8f81eb5751c0468179b37107a7a29eab64c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1/hal-cpp-2023.1.1-linuxathenadebug.zip",
        sha256 = "11c43a75cfc3a8e5cd54c52c6442a236ef65952d970d92193b69a7a7de254db9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.1.1/hal-cpp-2023.1.1-linuxathenastaticdebug.zip",
        sha256 = "023f790bc7926fd3881e7c2a2ea408c667217374664ef756ba02bcff0d2ab777",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1/ntcore-cpp-2023.1.1-headers.zip",
        sha256 = "43478dba549cbd829af14d01ec5df04e82a747d33af9bc56db7b9d23c5c634ab",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1/ntcore-cpp-2023.1.1-sources.zip",
        sha256 = "5a18f781f338d3b98960c806463b4f5de639a5fb900df7c5f6b004557c702028",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1/ntcore-cpp-2023.1.1-linuxarm32.zip",
        sha256 = "de686901e5266efa603c10b7ffc6ae4fcc2d3fb5575b9997a012a7d2dea6ed80",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1/ntcore-cpp-2023.1.1-linuxarm64.zip",
        sha256 = "1872d4cd8d5d0e989b48ba6c9d21cd34bc3601503f5f1a8491140c3c1f93e41b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1/ntcore-cpp-2023.1.1-linuxx86-64.zip",
        sha256 = "7c71c96d4303f946738beddcc77e0c4d4959da28b13b3e06fd7f00be9d7efffb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1/ntcore-cpp-2023.1.1-osxuniversal.zip",
        sha256 = "7dcf6dd7f636db762ea19252c97c29a750f9db3094d6ab18b3859ce1646c5095",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1/ntcore-cpp-2023.1.1-windowsx86-64.zip",
        sha256 = "d91ec68841f02e48ae653b2d21020468b3eba69183da876644b72c0f357707e2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1/ntcore-cpp-2023.1.1-linuxarm32static.zip",
        sha256 = "f0ce319f2a3ccfdab3f4c4dc4462379fbf5c8b8c48d071fc02a1daf117944609",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1/ntcore-cpp-2023.1.1-linuxarm64static.zip",
        sha256 = "b4c00c3a04f1e3669a5487596d24728fa66996cf03f83eb28b41d4b572a49926",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1/ntcore-cpp-2023.1.1-linuxx86-64static.zip",
        sha256 = "6353ec7924c4398842a6ea5f1be997d129089ebd1da634fa2afef57f06153485",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1/ntcore-cpp-2023.1.1-osxuniversalstatic.zip",
        sha256 = "ab3a02b9c54ec0567675549396f02903efb3cffb1b0bf0c7457ab6da7eec89ac",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1/ntcore-cpp-2023.1.1-windowsx86-64static.zip",
        sha256 = "c2915dd0fb8682142f6ed790e9918643e340f3ce63a7e3e0e337ea3a2a946488",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1/ntcore-cpp-2023.1.1-linuxarm32debug.zip",
        sha256 = "116144c4fabf9e04b5be5a47cbc4d3943f5a83248e7d4a94ab992dc4a4111857",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1/ntcore-cpp-2023.1.1-linuxarm64debug.zip",
        sha256 = "c804ce18708cb6241860c08121627c011c4cece5443058d929878a86905536c3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1/ntcore-cpp-2023.1.1-linuxx86-64debug.zip",
        sha256 = "68dba856969ef7d0039a515faa2969374714861b9cb506c94e7c44765ce0e709",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1/ntcore-cpp-2023.1.1-osxuniversaldebug.zip",
        sha256 = "4ceec4d132294896ebf788bf8c7f1b9cbf716d04711f262c0c9036bc5cfa031d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1/ntcore-cpp-2023.1.1-windowsx86-64debug.zip",
        sha256 = "da3c3589f2b638e60c220a875cbae3bb54000c1e2c95f0358f92609dc2ae4f27",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1/ntcore-cpp-2023.1.1-linuxarm32staticdebug.zip",
        sha256 = "1d507cee1d7e634f9e6e02a315022aec852c6f726e479d0bfe31e4093c7b1634",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1/ntcore-cpp-2023.1.1-linuxarm64staticdebug.zip",
        sha256 = "b44eb689bb4e4f0613be3b5f2f6fe1de84eb3369a7e931ca06f58f7200b4142d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1/ntcore-cpp-2023.1.1-linuxx86-64staticdebug.zip",
        sha256 = "330da6d9cb053b387b7234147b88c03d97c60ee48397bb75ce3790e984a0c000",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1/ntcore-cpp-2023.1.1-osxuniversalstaticdebug.zip",
        sha256 = "e96afd4902d2842c895bc75db2c587815e33a6877bdf05e970c96cd48d0f7525",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1/ntcore-cpp-2023.1.1-windowsx86-64staticdebug.zip",
        sha256 = "49a241e81200dae921df875037a07cec7e04941a5a08d9002ed13d899806736d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1/ntcore-cpp-2023.1.1-linuxathena.zip",
        sha256 = "0236f5ff06068ed20e16ebb03f61f7fa1dfe04f2372ab8c59d20eae2cbc31173",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1/ntcore-cpp-2023.1.1-linuxathenastatic.zip",
        sha256 = "1eaef2f5cc218a89a3eda93c6933f459f5ae5447896edd9feb829d7505a2bed9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1/ntcore-cpp-2023.1.1-linuxathenadebug.zip",
        sha256 = "479f43fb89f40e4ea80a2a2b8a6155fd7661abb189e2b69494fdd6c1b72af32c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.1.1/ntcore-cpp-2023.1.1-linuxathenastaticdebug.zip",
        sha256 = "7e03b88b0b37356e62b5e913da8b7fb0aee6912ace8f5fc783dc0d53babbd1fe",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1/cscore-cpp-2023.1.1-headers.zip",
        sha256 = "6fb4858d4e7a4813177f69ee6ca2e6784c2778d8c570aa6b8c752728ebebbc44",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1/cscore-cpp-2023.1.1-sources.zip",
        sha256 = "76d3b0eccd469aadcd57bedc0c7739520e4c34314823170ff47b0ba863491c40",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1/cscore-cpp-2023.1.1-linuxarm32.zip",
        sha256 = "4bc2fa75dd7ba523ea73c518e7564e3d1c62a785f43bdfd72054eda12c3cca0c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1/cscore-cpp-2023.1.1-linuxarm64.zip",
        sha256 = "f787679d834565a635c0230600deb8d91ea6e1cf04def3707d35fb4aa6b745bf",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1/cscore-cpp-2023.1.1-linuxx86-64.zip",
        sha256 = "743b2fb2ea84b1111a4554b621d71df2c84c034fc50a05d90f335c466c051ad3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1/cscore-cpp-2023.1.1-osxuniversal.zip",
        sha256 = "2d5824ae9def0e568053b2c0285a343013723e28d97a5b65e654cc95d00d1973",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1/cscore-cpp-2023.1.1-windowsx86-64.zip",
        sha256 = "54188d404b0739c9069ed3e78aa18455f0f4e39f8cbd5e0fe514ac27f111c507",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1/cscore-cpp-2023.1.1-linuxarm32static.zip",
        sha256 = "6c5ec2c9d0673d1b102806a8a9355c03dc43b30b2060bed0fb1713ce508fdef7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1/cscore-cpp-2023.1.1-linuxarm64static.zip",
        sha256 = "3aaad09c18ed65aba91b002aa700a3a4a33951e7a1f4b412c8f32757c01544bd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1/cscore-cpp-2023.1.1-linuxx86-64static.zip",
        sha256 = "83effbae7ffa19402bb3999a32ccdea3bf119f83adc6e7dfcd7852729b726911",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1/cscore-cpp-2023.1.1-osxuniversalstatic.zip",
        sha256 = "6b89c9c1fb046c655bea86a23df9f68d2d88a08c5264cf7e0238aaf88a70f135",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1/cscore-cpp-2023.1.1-windowsx86-64static.zip",
        sha256 = "599ace03365c0f1cff1c807eecd43656ea4abb8c4cf17f8a9dc7e5d93d8f986d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1/cscore-cpp-2023.1.1-linuxarm32debug.zip",
        sha256 = "1f25ca1d2a9d02e1de670f08130eb5657425f7a7cf838d4e63a0d90fb7bb4c00",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1/cscore-cpp-2023.1.1-linuxarm64debug.zip",
        sha256 = "c64977d1310674a92343abc4cfdd64b8476411c417191e05a0e74f1c08b5f900",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1/cscore-cpp-2023.1.1-linuxx86-64debug.zip",
        sha256 = "907451b15aa5c7e90f2305268a20677bdbd85727b8d46fd56de1536a9d23ac88",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1/cscore-cpp-2023.1.1-osxuniversaldebug.zip",
        sha256 = "5a7d225e7e3f9f1e34b192d9366075206fa0a532849d0222b668b3b1346de835",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1/cscore-cpp-2023.1.1-windowsx86-64debug.zip",
        sha256 = "17522c2e71a570bf808a3d9b3cd6d412c86024338fdb282b001b9105a0cb2efe",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1/cscore-cpp-2023.1.1-linuxarm32staticdebug.zip",
        sha256 = "bc3cf439a2bc30f7eaa4a5a5271a2118977520df3860218a574e8acb5653a7aa",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1/cscore-cpp-2023.1.1-linuxarm64staticdebug.zip",
        sha256 = "889a3a8b014b6a8cb4352ac82a198744e5fd23c879b1b1b2d438335793d39d15",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1/cscore-cpp-2023.1.1-linuxx86-64staticdebug.zip",
        sha256 = "c9c35070b8666a673b136f616cd56a51a5261ced3f884230c79a649d409c7b41",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1/cscore-cpp-2023.1.1-osxuniversalstaticdebug.zip",
        sha256 = "b6611a2f73d8e51066b9757bd21ff60885ce24dc5b4503f0f7bd651562f986b7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1/cscore-cpp-2023.1.1-windowsx86-64staticdebug.zip",
        sha256 = "f67363ce14804be45e83c30ded2d21d69506d3ba87811c7a03cc7652caf552b6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1/cscore-cpp-2023.1.1-linuxathena.zip",
        sha256 = "7453adade9eb5c7003c3e4b051cd4d6c30dffe812e5086d7d6e46673bc25de6e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1/cscore-cpp-2023.1.1-linuxathenastatic.zip",
        sha256 = "785f64f6ee9cfb77461d51b32c8a67389f48a1501ef90d70fd69d38d0428c59d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1/cscore-cpp-2023.1.1-linuxathenadebug.zip",
        sha256 = "3d19c81d3295a38fa68eac10abc7ac095992c6db4f5e975f17a4c950e060a46d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.1.1/cscore-cpp-2023.1.1-linuxathenastaticdebug.zip",
        sha256 = "70f1b68ee29d2cfba29fd223a6ed07cf5b2814443d77a5d175afea48a5676b12",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1/cameraserver-cpp-2023.1.1-headers.zip",
        sha256 = "330489f16999cd403fd0d62c3aa89999398fe83fb4f4dbe8ba0530d63852dbcf",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1/cameraserver-cpp-2023.1.1-sources.zip",
        sha256 = "894810206f477f27b59067e2fda4c6b11d526ecf3802d00bcd53602d90c294db",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1/cameraserver-cpp-2023.1.1-linuxarm32.zip",
        sha256 = "3a6a6d0408761e012df2592a4e735c96da6a323c971be9e844fea449b0ab7d8c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1/cameraserver-cpp-2023.1.1-linuxarm64.zip",
        sha256 = "a2a9a82dc38a03555c0478c8689addacb6476c1ea099a6cc123ac06d4c8531b7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1/cameraserver-cpp-2023.1.1-linuxx86-64.zip",
        sha256 = "3d7bb1b603f530e0a67b5e09a34bc5114fbaee50dce62be3701c1e24c1cb7618",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1/cameraserver-cpp-2023.1.1-osxuniversal.zip",
        sha256 = "81cf2d8156a458f1f18db88a5235431fa9b77d5fd23ed586d9002f26661a5a67",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1/cameraserver-cpp-2023.1.1-windowsx86-64.zip",
        sha256 = "0b7edbdea262429511601e1f80da0f0a1a629e4c2f3c7beb37e15c767637e241",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1/cameraserver-cpp-2023.1.1-linuxarm32static.zip",
        sha256 = "f68723e771ca959cbf662b924efca1e9f55b8b9dd96fd3783e20848be35073a9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1/cameraserver-cpp-2023.1.1-linuxarm64static.zip",
        sha256 = "adc462b614307f23ceeae6eb2f3bf937c465774e7b77688412a5220025cd873b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1/cameraserver-cpp-2023.1.1-linuxx86-64static.zip",
        sha256 = "965dbbf887c683acaab196f2443ac7b688a41237efc4c76cdb655380b6212cee",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1/cameraserver-cpp-2023.1.1-osxuniversalstatic.zip",
        sha256 = "9970ae75ee83d215542b303bb03d2c4fda68ba95b045e22e6f8662539bb23aa5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1/cameraserver-cpp-2023.1.1-windowsx86-64static.zip",
        sha256 = "5b499109b3fbf09ee7947bfc23d2b3533e39175f19aa5e608d3b62a301499ff4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1/cameraserver-cpp-2023.1.1-linuxarm32debug.zip",
        sha256 = "28303bdef4f62484bb4e4d9a160a15f7d41c6d3ca47609cfc270dde00c8b45de",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1/cameraserver-cpp-2023.1.1-linuxarm64debug.zip",
        sha256 = "ce0e9b22318fe378b52343d89961694f9ede898ba621277b9fcb3317471c2255",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1/cameraserver-cpp-2023.1.1-linuxx86-64debug.zip",
        sha256 = "6d3fe4801043fead1b8406c55aa181b34a7f4f0c8e66dae355b796643203d377",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1/cameraserver-cpp-2023.1.1-osxuniversaldebug.zip",
        sha256 = "0e7dd7101b694bb2297b930cb8936c1ac47fcc697e38a4c002a18f99ee427a27",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1/cameraserver-cpp-2023.1.1-windowsx86-64debug.zip",
        sha256 = "89a15742d1d5ca3b160f8d373799942ae7f44676def55f9caa266fe73d48cf11",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1/cameraserver-cpp-2023.1.1-linuxarm32staticdebug.zip",
        sha256 = "d11e87b6d770471041833169c3e4bd48800ca4a0574dd01c9ee27228e3360235",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1/cameraserver-cpp-2023.1.1-linuxarm64staticdebug.zip",
        sha256 = "f01cbf1b36402d36a501534d91c943019948f4d170cc74b7dd8f26f915dc0677",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1/cameraserver-cpp-2023.1.1-linuxx86-64staticdebug.zip",
        sha256 = "7f41fe42af4a712e40e673200bbe0b8e8812dfa90b1c6a82200dd30df05d5ed4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1/cameraserver-cpp-2023.1.1-osxuniversalstaticdebug.zip",
        sha256 = "fe1ed7162aac4fde1793b1718e250563c74e9cc25673616f8490cce22644ce9d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1/cameraserver-cpp-2023.1.1-windowsx86-64staticdebug.zip",
        sha256 = "4ba8f69262081ec1260cca5197b70c2344c15790328550f4aef8189c6b987f1b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1/cameraserver-cpp-2023.1.1-linuxathena.zip",
        sha256 = "7bdf55970d8f95ab2ccf3c945291507183d500777e43ac9b6e72b06de7f773a8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1/cameraserver-cpp-2023.1.1-linuxathenastatic.zip",
        sha256 = "29d9d9ba2d676a32dec86860ec511119cce9e63131ea4aded90ce473920f7d21",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1/cameraserver-cpp-2023.1.1-linuxathenadebug.zip",
        sha256 = "5e58b7e85bea4344e96ae40e96a45faef2a78a0780e867666932c9c7f5ae47de",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.1.1/cameraserver-cpp-2023.1.1-linuxathenastaticdebug.zip",
        sha256 = "806e776c049bd389d557d480f30ba0bd42e972e187af950531b08e3a4e514211",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1/wpilibc-cpp-2023.1.1-headers.zip",
        sha256 = "b57b5fb9e2f81aa678e72559fe17124e7b074db758681287fe26e8cc1849f1a2",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1/wpilibc-cpp-2023.1.1-sources.zip",
        sha256 = "1901d5317e9adc5baa342455248381b03fdb013018de95ab09bfcb1733e8e2b6",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1/wpilibc-cpp-2023.1.1-linuxarm32.zip",
        sha256 = "b0c496ff51a5bbf5148cce2bafa65a928fbc6eb0e1420d1b32a5dbd7ccbe7b01",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1/wpilibc-cpp-2023.1.1-linuxarm64.zip",
        sha256 = "0dca5ff33aacca1eda2c852c6e2d06a6f119c61af825c0eec99d304b38c7c57a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1/wpilibc-cpp-2023.1.1-linuxx86-64.zip",
        sha256 = "2fbc4c418d09980f88284f8b47c6073a33f978c9bf18299555a237e90a324ac0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1/wpilibc-cpp-2023.1.1-osxuniversal.zip",
        sha256 = "d1a71eefb6c2a948ce80aabab0592bdb22cb2abfc524feff9be86edd1f15b1f1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1/wpilibc-cpp-2023.1.1-windowsx86-64.zip",
        sha256 = "18e51118c38546a29fa4db07e1405d2c083cd72f7f966912a2929e7f41bbc7b3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1/wpilibc-cpp-2023.1.1-linuxarm32static.zip",
        sha256 = "d5c083ce19276fe13327cca080b4af7897556fbecb58f6d2a10081f922db9362",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1/wpilibc-cpp-2023.1.1-linuxarm64static.zip",
        sha256 = "eae1a83da6bcc4ea7f328527e00aacf01df0d3e28569a633e05765f01fc504a1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1/wpilibc-cpp-2023.1.1-linuxx86-64static.zip",
        sha256 = "9942ff8f14679c0cc37ef1b28cfdacb9158307995531b8fe883995d3c7644e07",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1/wpilibc-cpp-2023.1.1-osxuniversalstatic.zip",
        sha256 = "14b772faf5a7b71c4023961ff4f5059d5efa8b63e9f067fa462fc086c42cae70",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1/wpilibc-cpp-2023.1.1-windowsx86-64static.zip",
        sha256 = "7fe18407c102a49941663e65c4c1ce0e87b89945ab224db7c44d67f3e6ea54d9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1/wpilibc-cpp-2023.1.1-linuxarm32debug.zip",
        sha256 = "e9ce577dfda2e89dfbc706962501ae12ccc22344adb7a1678dffb427d11879dd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1/wpilibc-cpp-2023.1.1-linuxarm64debug.zip",
        sha256 = "ddd741c9046369b86af6e2434364e990991d3c8c3ed59621135b9e0610bb121d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1/wpilibc-cpp-2023.1.1-linuxx86-64debug.zip",
        sha256 = "f224f9810bda4592914170e5d5c02809809ee3e7a57d94de9b510a0ea2756426",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1/wpilibc-cpp-2023.1.1-osxuniversaldebug.zip",
        sha256 = "5c6e81973bca5cef9c16de8b167b9e2fa6aac4138150c324c01157cf0451cb1c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1/wpilibc-cpp-2023.1.1-windowsx86-64debug.zip",
        sha256 = "96d06b5d2c9d0bf893485d61cbe402239d1ab81b90c30f51a2cdf2f52c161093",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1/wpilibc-cpp-2023.1.1-linuxarm32staticdebug.zip",
        sha256 = "845a4ae2a636f690893f78e5f31c902d549e78a346bb3cc3cf57f231e516f8ec",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1/wpilibc-cpp-2023.1.1-linuxarm64staticdebug.zip",
        sha256 = "e3c22501015f99ccb455328b84f38fc2304e1c68c08bd5465789e664188f99d0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1/wpilibc-cpp-2023.1.1-linuxx86-64staticdebug.zip",
        sha256 = "5b9cc35a4540f8c168c334f3ed3c6b68caf7ee782ad3139730fe86a731c513f1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1/wpilibc-cpp-2023.1.1-osxuniversalstaticdebug.zip",
        sha256 = "cdbf27761ffd6d70d4f37e8d8cb5f52fee49b345f2845043e6bf2b0a1d28154f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1/wpilibc-cpp-2023.1.1-windowsx86-64staticdebug.zip",
        sha256 = "66df3a59087a3f46f4c1e0fd957ab71d001ad740ebd2e4d12f09dda0734c237a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1/wpilibc-cpp-2023.1.1-linuxathena.zip",
        sha256 = "beb7b66fa550f2673557c9a18098b8fab6afac6144c34148aed45c174ed3ee28",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1/wpilibc-cpp-2023.1.1-linuxathenastatic.zip",
        sha256 = "5884727d21836dcf865cf5e85f203aa159f33ba2cd73e7c15639ca7f3856caf7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1/wpilibc-cpp-2023.1.1-linuxathenadebug.zip",
        sha256 = "5244519d2c7bb304d7ae23113bb53212f7bf0351a308796bd2a39738c87c5526",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.1.1/wpilibc-cpp-2023.1.1-linuxathenastaticdebug.zip",
        sha256 = "d8ac38092c10eda6febba1fd61689a4457e8af909e0489f548a751e8a22b0761",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1/wpilibNewCommands-cpp-2023.1.1-headers.zip",
        sha256 = "9e1810a33c6dc9d1d5e20a04701e6ac479ae80d2fe066cf591b592a25849e335",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1/wpilibNewCommands-cpp-2023.1.1-sources.zip",
        sha256 = "da650c9ccc39529e771fdb8ef15675394ad74269d9b618644ea107cb8b65b337",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1/wpilibNewCommands-cpp-2023.1.1-linuxarm32.zip",
        sha256 = "f95caed48f39cd8aa22a27a127c9b197808ae6a376be21e7c1df3520acbd34fa",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1/wpilibNewCommands-cpp-2023.1.1-linuxarm64.zip",
        sha256 = "cfa5b8d5e272bc6e15a9e185f92a00006ae0130e5e14093052abf0d35b63e68a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1/wpilibNewCommands-cpp-2023.1.1-linuxx86-64.zip",
        sha256 = "edcbfeb5464e308b0d03e6340d62bf74d3cd1d76b20807c0a60eeae77aa99272",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1/wpilibNewCommands-cpp-2023.1.1-osxuniversal.zip",
        sha256 = "d1438c3834f86a34e33e91ff5933279f525fd7c54ab16cba3cfb690f84990c02",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1/wpilibNewCommands-cpp-2023.1.1-windowsx86-64.zip",
        sha256 = "081f5e4656108af93eb43f5bf695996d965dda3fd709add53dfadf2001fb2aa1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1/wpilibNewCommands-cpp-2023.1.1-linuxarm32static.zip",
        sha256 = "a9ee302cae7ae935aeed9aa4191132ff71af271421631a5407e4ccc113401ab5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1/wpilibNewCommands-cpp-2023.1.1-linuxarm64static.zip",
        sha256 = "05371c77fc3caded4529b2e8a49d63de5ccd2a7da0ff37b74ec00187b693aba5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1/wpilibNewCommands-cpp-2023.1.1-linuxx86-64static.zip",
        sha256 = "fb23903fae3ead4bd2e173907f83e1df547b250c6b8bdf05d1a025e585b00cb2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1/wpilibNewCommands-cpp-2023.1.1-osxuniversalstatic.zip",
        sha256 = "ff21705373b970ee747d3f2522de15be2fe1bc1447bc6c731f645700ef1e519d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1/wpilibNewCommands-cpp-2023.1.1-windowsx86-64static.zip",
        sha256 = "cf5ce6816b087191548ef832dd8a6e2811412276c4c7feff184e160d8755d004",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1/wpilibNewCommands-cpp-2023.1.1-linuxarm32debug.zip",
        sha256 = "77a42613d984156796db11790338b3e4fd98eeaa71d5e90bb3514c372a10db2d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1/wpilibNewCommands-cpp-2023.1.1-linuxarm64debug.zip",
        sha256 = "c12691c51e1e5a8cd94ec2a3483545759940e250fd2d8992572cbf68e151315b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1/wpilibNewCommands-cpp-2023.1.1-linuxx86-64debug.zip",
        sha256 = "00946c775e007e8252274a47097033092ddbf900d812aec6d2d91d241ac9d13c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1/wpilibNewCommands-cpp-2023.1.1-osxuniversaldebug.zip",
        sha256 = "58526f73653067e5a892995799ef363e370a854b9006934e12017b06f72846eb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1/wpilibNewCommands-cpp-2023.1.1-windowsx86-64debug.zip",
        sha256 = "2e274d5503f2e62f9138bd9c78caed1e1afc6ee6be301cdeaf99fa46a1151cd8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1/wpilibNewCommands-cpp-2023.1.1-linuxarm32staticdebug.zip",
        sha256 = "a4902d3d27ea9d15f98aba1cd77c799b4b67de8bf5415bd548c820211bcae39e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1/wpilibNewCommands-cpp-2023.1.1-linuxarm64staticdebug.zip",
        sha256 = "1096338a905d45eb67c5ee7fcbcde5125985364dca23b274e4929bdcf44cca0d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1/wpilibNewCommands-cpp-2023.1.1-linuxx86-64staticdebug.zip",
        sha256 = "80da0fd9fae30e8f38ad482873db0be91b0b270bd8dca29edf016bdfcdd78af2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1/wpilibNewCommands-cpp-2023.1.1-osxuniversalstaticdebug.zip",
        sha256 = "5cfbcf588a12a745467553b9ec99427d36d0ecfed6378de6b131c2a5283cb560",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1/wpilibNewCommands-cpp-2023.1.1-windowsx86-64staticdebug.zip",
        sha256 = "b1c2e36d9345e2cd8f65b88fff37395cc6a1a4c6f2da28040042d7127370586b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1/wpilibNewCommands-cpp-2023.1.1-linuxathena.zip",
        sha256 = "1f73e5e69be07f0d4aa2a85acf57de30cb940ecd10464e1883573436606a4ee0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1/wpilibNewCommands-cpp-2023.1.1-linuxathenastatic.zip",
        sha256 = "97f887a7ed2ab65c67ff02b860c99d3f2419554376a57b65c79f684140b8f294",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1/wpilibNewCommands-cpp-2023.1.1-linuxathenadebug.zip",
        sha256 = "4a5281a4f370daa5b49a43a7ec3ef94d3e43b5bff48a1b52022ca0201e2988c0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.1.1/wpilibNewCommands-cpp-2023.1.1-linuxathenastaticdebug.zip",
        sha256 = "31668588562615c9c0e3a40496886b6c08e706a520a5822a2e240575195c4956",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.1.1/halsim_ds_socket-2023.1.1-sources.zip",
        sha256 = "6ca0d255f79e01bfa15c432c48e72e10062548a559ea0a85e55048e1cd9adbce",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.1.1/halsim_ds_socket-2023.1.1-linuxarm32.zip",
        sha256 = "80e45ce32689740d45b326c14e0a8d5b7c9c1c698b0c56b4c47fbe433ef5d33b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.1.1/halsim_ds_socket-2023.1.1-linuxarm64.zip",
        sha256 = "e75135e7c9efd83a2ae5da1c9555eb6059932f7a7e68d21721aee86d51ace4aa",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.1.1/halsim_ds_socket-2023.1.1-linuxx86-64.zip",
        sha256 = "8aaedae887da32174acc714f6144f6d91a5b14bea29f5a37a66e1aeed82044d5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.1.1/halsim_ds_socket-2023.1.1-osxuniversal.zip",
        sha256 = "256d087c0499bc645e817f48b240b2e692afe6e1ffbe54622643ccfdaeb0b95a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.1.1/halsim_ds_socket-2023.1.1-windowsx86-64.zip",
        sha256 = "2a8846642c42d086d406dbe6a05fe9ed8afaa55609675b08205da2241f83548b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.1.1/halsim_ds_socket-2023.1.1-linuxarm32static.zip",
        sha256 = "3fbac72c5c9c0d47618a57baba529edde9c6402f885dd3859140b9ee63f1cd49",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.1.1/halsim_ds_socket-2023.1.1-linuxarm64static.zip",
        sha256 = "c119d3a0e2def04372ac83dc0d0d0b5bd8be10634351d60c0a2d98395c08fffe",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.1.1/halsim_ds_socket-2023.1.1-linuxx86-64static.zip",
        sha256 = "0772927ecf6275e2ed18ce63dd4bf2790133364599b3f0e69955e337ebf83f8c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.1.1/halsim_ds_socket-2023.1.1-osxuniversalstatic.zip",
        sha256 = "368e9c0f69dab4fb6e3db2baef3700f7d88556e25305552d51c262508bcbdfbc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.1.1/halsim_ds_socket-2023.1.1-windowsx86-64static.zip",
        sha256 = "0f8a2611f1f96dd2adc9be570455c268194639c1e7974da16ceee7279b658329",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.1.1/halsim_ds_socket-2023.1.1-linuxarm32debug.zip",
        sha256 = "dfa0245b74af22ab247164de5e21d77ad50ae7e2d50fbe51a2ea35b5a6254398",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.1.1/halsim_ds_socket-2023.1.1-linuxarm64debug.zip",
        sha256 = "8b9886d96339238176b4b949ae49b1bf329866ed810fe4eb2989e57be26eacf2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.1.1/halsim_ds_socket-2023.1.1-linuxx86-64debug.zip",
        sha256 = "75ea8b2e33f58fd4df66be03f9d7a3df584d97caf77938f8e93a91bcd2636acb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.1.1/halsim_ds_socket-2023.1.1-osxuniversaldebug.zip",
        sha256 = "7d72332986665d0a42df79b62475d0770f2ccd265405ea7d514039a657673d79",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.1.1/halsim_ds_socket-2023.1.1-windowsx86-64debug.zip",
        sha256 = "71d7d349c398ba9e136a5ba691e00902299cf0d5b62d96d8cabd7e05c7f53e57",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.1.1/halsim_ds_socket-2023.1.1-linuxarm32staticdebug.zip",
        sha256 = "4a1b2a9ddc57130471aeedfbf5b0ad5e626abfb6e33519fe3603668719599b26",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.1.1/halsim_ds_socket-2023.1.1-linuxarm64staticdebug.zip",
        sha256 = "2952fad757bede829df34a7a4cc7050ecec56a37d6d2b07e5682187bcbfc6c18",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.1.1/halsim_ds_socket-2023.1.1-linuxx86-64staticdebug.zip",
        sha256 = "d7b52bcd20a6b465bd0cc597725d8897531b29eb729f1a29707d8a2c3e75bc4c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.1.1/halsim_ds_socket-2023.1.1-osxuniversalstaticdebug.zip",
        sha256 = "f119c81b5d5d51ee2c8b9059ad564e4a76cf4c82372109e0464b7e5c7ad3168f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.1.1/halsim_ds_socket-2023.1.1-windowsx86-64staticdebug.zip",
        sha256 = "fd609e3f1f2bc59cd91f27313902bd21831df7300ee80b496d12802b20e198f3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.1.1/halsim_gui-2023.1.1-sources.zip",
        sha256 = "f3879d22195c4f6bbe99dc6a79d5718464b39c47de3e4f4be8cb95aa2cac7d5e",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.1.1/halsim_gui-2023.1.1-linuxarm32.zip",
        sha256 = "d53f3952d20f9d6c9eadfc5a091b749c4aebe95e8df48ddec58a1588ba8dd4b8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.1.1/halsim_gui-2023.1.1-linuxarm64.zip",
        sha256 = "809bfce61ae070169da4da03f1c0142b94ddcf0e9559107c7ae8660295d65b48",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.1.1/halsim_gui-2023.1.1-linuxx86-64.zip",
        sha256 = "f8035f404647f42e49550530aecfd244341ccc4c7352ad26e3e3cfb0c9616179",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.1.1/halsim_gui-2023.1.1-osxuniversal.zip",
        sha256 = "c41eb8f0c6c56b28f780473a473f5c4b50268b5644aaacd7bae2c7011f29e0c8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.1.1/halsim_gui-2023.1.1-windowsx86-64.zip",
        sha256 = "1ae591f9f999cff328f9805ae61690144ea61a589b208ed002b0ec3376009615",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.1.1/halsim_gui-2023.1.1-linuxarm32static.zip",
        sha256 = "ca252742418920fc7938a41a6cdcbbf2a7c4bc83533137132ce2cfa4c4d7a290",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.1.1/halsim_gui-2023.1.1-linuxarm64static.zip",
        sha256 = "aa1effc380d1383e7c24dff80af6891b3e75931e37176296d677b1898551e5f1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.1.1/halsim_gui-2023.1.1-linuxx86-64static.zip",
        sha256 = "0a4564ea0b602704a6cff7ce612b28a5ab99b8ac5cd50b93e4e584d910e8b311",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.1.1/halsim_gui-2023.1.1-osxuniversalstatic.zip",
        sha256 = "9eef3cb4348db51a2b08acc322251d8349a8b86b17926c76405dc72c5d7ec212",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.1.1/halsim_gui-2023.1.1-windowsx86-64static.zip",
        sha256 = "a28ee0f87b0ae394cdbdf7e0136d59131f4ad4addf82df98d6958553a84b704c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.1.1/halsim_gui-2023.1.1-linuxarm32debug.zip",
        sha256 = "e49ea94947c9af5543a3a54247a9bf6fe3240574ed1c60db5b9da3b27015bde8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.1.1/halsim_gui-2023.1.1-linuxarm64debug.zip",
        sha256 = "845fbb864245430b247360ff8f24b6939cf5273b0db3339c23683436d28ec05b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.1.1/halsim_gui-2023.1.1-linuxx86-64debug.zip",
        sha256 = "0e959b2295c023238e9e2ec3a1f7d72616028e29b46b84406312fda1a0d9d8da",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.1.1/halsim_gui-2023.1.1-osxuniversaldebug.zip",
        sha256 = "dd582db2ce30f5a5a320f796d88f4b1e6727d383bf88656b8d58cb874951e209",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.1.1/halsim_gui-2023.1.1-windowsx86-64debug.zip",
        sha256 = "bc2047f432917b6cfd8a5f3237a4def63f5085ef692cc0b737fe17e3f6b3c05f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.1.1/halsim_gui-2023.1.1-linuxarm32staticdebug.zip",
        sha256 = "8ec0dd5c8061aa868836e586b352bbaa345bb289e521fde8541a6ebf36e3e97c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.1.1/halsim_gui-2023.1.1-linuxarm64staticdebug.zip",
        sha256 = "a085f3bd128b8dfce844bb906fe0c9e2fbc76c3af584a5912f3211d049e62bde",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.1.1/halsim_gui-2023.1.1-linuxx86-64staticdebug.zip",
        sha256 = "fb03bc69d4655aa99594b8b7aeda6fe896535c8bb055b04c93fcd3411f0b8587",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.1.1/halsim_gui-2023.1.1-osxuniversalstaticdebug.zip",
        sha256 = "b78600fe736104eb412dfdd443bb34778f9cb9ef47177f94516561bb2575abee",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.1.1/halsim_gui-2023.1.1-windowsx86-64staticdebug.zip",
        sha256 = "787b5d4ce0524482c682274b8b0ea2d955b9605039bca783bd475cfe0e8856f7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.1.1/halsim_ws_client-2023.1.1-sources.zip",
        sha256 = "78b1d5c119feabc36f4894cfbad817aa99a525e1580d9d082294d4b6959d13b0",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.1.1/halsim_ws_client-2023.1.1-linuxarm32.zip",
        sha256 = "9aba0de71064d558f54abb9f4080d04aec9985b3b5c91b9a52393d4036b0c2c6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.1.1/halsim_ws_client-2023.1.1-linuxarm64.zip",
        sha256 = "89bd3a9143b27c29204c01727d1907e5664d413970746db0303b81973638f582",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.1.1/halsim_ws_client-2023.1.1-linuxx86-64.zip",
        sha256 = "34ad282a5f1ff0e71207297e06161aa326b1304a2bda738da2ba95555ed9f4d9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.1.1/halsim_ws_client-2023.1.1-osxuniversal.zip",
        sha256 = "845be21c91ed55b13e819a2e50948c2e1b4a492413e637876be32fd6a5e74df8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.1.1/halsim_ws_client-2023.1.1-windowsx86-64.zip",
        sha256 = "6b581dcc7c4c976eec76a720e542f3db192e29205ff231517fa1b165445a262f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.1.1/halsim_ws_client-2023.1.1-linuxarm32static.zip",
        sha256 = "13270c22be7b35a40172f134377c94f53422004a9296a576db20fe37c75182d6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.1.1/halsim_ws_client-2023.1.1-linuxarm64static.zip",
        sha256 = "d0e710675a643792c46676a824b9b3bec80315933fcd3d5fb6bb13e26e5877e0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.1.1/halsim_ws_client-2023.1.1-linuxx86-64static.zip",
        sha256 = "4a481fe3f91e5ffb4f720d7cda682ca6d27d74bca5e8c78a584059ac0f05abda",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.1.1/halsim_ws_client-2023.1.1-osxuniversalstatic.zip",
        sha256 = "fd25de5c257f9b3e254f5794644af6372090163394bd420b84219e04b0d1e88c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.1.1/halsim_ws_client-2023.1.1-windowsx86-64static.zip",
        sha256 = "555bf883a5df126dfea684b959d45e496d5a1485f74e3c0a780e23918a22ae1b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.1.1/halsim_ws_client-2023.1.1-linuxarm32debug.zip",
        sha256 = "63c60e23a6e4b4ae78bc80d34eb9c7eae3543c4cc0ec2f0c1f95441c0d88878c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.1.1/halsim_ws_client-2023.1.1-linuxarm64debug.zip",
        sha256 = "469d746e461e6c406aad0a51a727645dd5b23549485467c128c05e537e30afd2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.1.1/halsim_ws_client-2023.1.1-linuxx86-64debug.zip",
        sha256 = "5687fc5c85b3eb04de621c61062b7f8466835b7d576383347fbfec219aaea599",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.1.1/halsim_ws_client-2023.1.1-osxuniversaldebug.zip",
        sha256 = "6c45c26e639ebe326bc017e6add3eba767589e622d9140ae84eafa68b7115fb1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.1.1/halsim_ws_client-2023.1.1-windowsx86-64debug.zip",
        sha256 = "299b0012904ae77a01076862359338d22d9d35ecc610401c6034be35feaf7783",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.1.1/halsim_ws_client-2023.1.1-linuxarm32staticdebug.zip",
        sha256 = "0ad205ecfe6a6ecb208adef6b5624bd5fad77aec3bfb2d9f041b18b2c12fdec1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.1.1/halsim_ws_client-2023.1.1-linuxarm64staticdebug.zip",
        sha256 = "303c40dd801da53588f04cb42396c2d05b9572baa8605751632d21373e639575",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.1.1/halsim_ws_client-2023.1.1-linuxx86-64staticdebug.zip",
        sha256 = "1d71ad580058b59aa527e55f934894e779ad34d23718a8316784bed17ed426e2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.1.1/halsim_ws_client-2023.1.1-osxuniversalstaticdebug.zip",
        sha256 = "03e694616b1c406736f786ea4e76eeed049f6209556c792a8f4717c5b7b203eb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.1.1/halsim_ws_client-2023.1.1-windowsx86-64staticdebug.zip",
        sha256 = "e44388aaa8ed16342353d875605c0ff25f44d7855fcf2b0df49017526a1c7b0a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.1.1/halsim_ws_server-2023.1.1-sources.zip",
        sha256 = "a5ab7022dc3ee5f60bb199d890ed01639ad592a586fb0659d5724143b632120d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.1.1/halsim_ws_server-2023.1.1-linuxarm32.zip",
        sha256 = "d7de197df623c625ff090562088941b69ff106bcb6ad9e083d159a6597813abb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.1.1/halsim_ws_server-2023.1.1-linuxarm64.zip",
        sha256 = "56b31d37a9ee5b2b9a6fb7cb6fef81f56581b3653f0c9d66e1352ee791e21e9e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.1.1/halsim_ws_server-2023.1.1-linuxx86-64.zip",
        sha256 = "950277866b2052994131a7f611c04417b2aa13d80e52398e5a72cdbcf13956c8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.1.1/halsim_ws_server-2023.1.1-osxuniversal.zip",
        sha256 = "59278f9b620943af85bc4e6481897578dfcd27062e0d25834944b86ebffa0609",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.1.1/halsim_ws_server-2023.1.1-windowsx86-64.zip",
        sha256 = "1a9822d5b2a00402686859f86ed4ef7ba15569e15a0aa55cb4922e09aedde969",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.1.1/halsim_ws_server-2023.1.1-linuxarm32static.zip",
        sha256 = "47a113f43e96449352a6b1579746003346676e8898fa35f21dc481b5dc8dbaff",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.1.1/halsim_ws_server-2023.1.1-linuxarm64static.zip",
        sha256 = "b58ade843ec9a6b8bd052ba181c15437852c23d63de11931285ddfb0456c30f8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.1.1/halsim_ws_server-2023.1.1-linuxx86-64static.zip",
        sha256 = "dc7231739c031a029bf0652452a8e091937a193d46e226d68df401f807540323",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.1.1/halsim_ws_server-2023.1.1-osxuniversalstatic.zip",
        sha256 = "586cb49b89894892646e06224f3ba9ff7be7b536564c04a97de972e15a621a74",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.1.1/halsim_ws_server-2023.1.1-windowsx86-64static.zip",
        sha256 = "6605870e5a4562c41561c2eb4b92b71894cdc8c28c8bff989f6f5908631c1d80",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.1.1/halsim_ws_server-2023.1.1-linuxarm32debug.zip",
        sha256 = "29d6f9542dadea4ecd0f081946cab60f3effef06bcdf45ef9d0195f2067eca9f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.1.1/halsim_ws_server-2023.1.1-linuxarm64debug.zip",
        sha256 = "7293a787001dc2f9be08a59747511480dbe6b67e62b78853031650a3310c081b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.1.1/halsim_ws_server-2023.1.1-linuxx86-64debug.zip",
        sha256 = "3fdc59d39eb2f1539bffaaee8562196ae7156333d692e71f59ebff5f49d24a3d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.1.1/halsim_ws_server-2023.1.1-osxuniversaldebug.zip",
        sha256 = "0889aa78d1adca45838b048078e6ee2a14b7e24b11089668c8d17ad2337fd823",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.1.1/halsim_ws_server-2023.1.1-windowsx86-64debug.zip",
        sha256 = "0e003d7fa4a0ba2f40e747bfd93f4167582e994ccf4483c810b1d6f7df94b1a8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.1.1/halsim_ws_server-2023.1.1-linuxarm32staticdebug.zip",
        sha256 = "a4817734b3ff2b4eada844e78e6535950d8fe1b3147975c0d77975eaaba94341",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.1.1/halsim_ws_server-2023.1.1-linuxarm64staticdebug.zip",
        sha256 = "836811ecd79b913c691b05a9adbb69cb33822a17b5f2203cb2b63b3b6f01ab11",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.1.1/halsim_ws_server-2023.1.1-linuxx86-64staticdebug.zip",
        sha256 = "48aa3a63794766e8618e3508043d7a0802b3c8d9da3109a865629dfec1a8c1a5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.1.1/halsim_ws_server-2023.1.1-osxuniversalstaticdebug.zip",
        sha256 = "43a6f74031e7672e7a2a27ac98bbdbdfc9bf861696969736f5b234bc7914dbfd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.1.1/halsim_ws_server-2023.1.1-windowsx86-64staticdebug.zip",
        sha256 = "31d06e91a489a1703bba7bfbbfa93d14da58d6793515ca81206c0cabfd3ab4c3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2023.1.1/SmartDashboard-2023.1.1-linuxx64.jar",
        sha256 = "31049852abd7c05ce03e5c1e2b7b2b64fdbe3ea049b2c3b68e656e0cab2f9407",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2023.1.1/SmartDashboard-2023.1.1-macx64.jar",
        sha256 = "c2ae3d6055bcbb0305ee72cc4d961f4198bd097c3a639c8383dbe08dda7acc11",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2023.1.1/SmartDashboard-2023.1.1-winx64.jar",
        sha256 = "714ddacd7dae737321131f53b64d73b064dc46127185e829e14f74fee5c525c7",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.1.1/PathWeaver-2023.1.1-linuxarm32.jar",
        sha256 = "52f85afdc5a9eb4e113bf7c55e78d52fac097d76dd8db4b19377e6aad1b91307",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.1.1/PathWeaver-2023.1.1-linuxarm64.jar",
        sha256 = "c8898b5c28373b6699386dd08ac05a83af6fb50c3758799394c75757ce6feaa4",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.1.1/PathWeaver-2023.1.1-linuxx64.jar",
        sha256 = "2b2b713c4f631841d16a8752f4b4f5e644844ec651b813709655bd872df7658d",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.1.1/PathWeaver-2023.1.1-macx64.jar",
        sha256 = "1dec045da16f2046e99d229c61d346bd72238c200ccfb99dc9f1dabbd4dfbd4b",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.1.1/PathWeaver-2023.1.1-winx64.jar",
        sha256 = "8c6e6726ecc5f41deb4b4dbced13d8e166c8ccfd7b1ac7b817f7dc0969c1fda6",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2023.1.1/RobotBuilder-2023.1.1.jar",
        sha256 = "c3709ecab75ae7e4bddfb0c4c3400598732f582e3f67f5940670be1c09d94ceb",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.1.1/Shuffleboard-2023.1.1-linuxarm32.jar",
        sha256 = "bd9dee4bf794a5f4b5a0d7b0b4e0960118de853f649be9d8ba0b0ef90e8e00ce",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.1.1/Shuffleboard-2023.1.1-linuxarm64.jar",
        sha256 = "fc8816b0a10b2e15e02514c5e9c5caaaa085d73a02d77fc92140c8cf082dcc7d",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.1.1/Shuffleboard-2023.1.1-linuxx64.jar",
        sha256 = "c9c6b6acccdde806f0e4b3445b5422ff9c771705f974d8e3811bef559b4dd9bb",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.1.1/Shuffleboard-2023.1.1-macarm64.jar",
        sha256 = "e7b315301830cf2357b9b25885d77e68c481163c182879ee9091fc90b07c5f35",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.1.1/Shuffleboard-2023.1.1-macx64.jar",
        sha256 = "8514fe3115ad50a351e49acd7e3d766cd17a586bf7d6821ef48f95bb0a7df98e",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.1.1/Shuffleboard-2023.1.1-winx64.jar",
        sha256 = "07c5dec55797de68a3e03659e2e369cb8c15ec16011e9db42e90ad7b3a489dbc",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.1.1/Glass-2023.1.1-linuxarm32.zip",
        sha256 = "0926d67274c7723df28448a348d4a6478bd699a8c67bcaa984d03b5fb9ba7650",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.1.1/Glass-2023.1.1-linuxarm64.zip",
        sha256 = "4f4fe38a7a4ea2d9c026e9f42c0076e2b4d3953d5410aac4b2298f50bd4cd212",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.1.1/Glass-2023.1.1-linuxx86-64.zip",
        sha256 = "537e027372ab159f727d48a95e0375a8c5f76f4a963ce3280a7fbb4f96828882",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.1.1/Glass-2023.1.1-osxuniversal.zip",
        sha256 = "465ddb455bf25a85e34bdd28fdb0ce760262a34ad4117b58d957c0b4d99f3286",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.1.1/Glass-2023.1.1-windowsx86-64.zip",
        sha256 = "e96530e1f4c6fb9134443031108ea3e919c40150d7374edb6c51070be768c0a8",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.1.1/OutlineViewer-2023.1.1-linuxarm32.zip",
        sha256 = "104e026c28fbdaff749b9650cfb2bb019ca52b8d668d5dffbe764b6fe392a517",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.1.1/OutlineViewer-2023.1.1-linuxarm64.zip",
        sha256 = "0678c0b3aa583fb070701c8f8ebbf947f40723c3b9bc2a6e5a209a618cab4ddc",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.1.1/OutlineViewer-2023.1.1-linuxx86-64.zip",
        sha256 = "fbb7fa89062f2ed46267fc30f76560838c796e1d9f81ae6ba93f5257b4a01a72",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.1.1/OutlineViewer-2023.1.1-osxuniversal.zip",
        sha256 = "2fa8953e5aca5c024c5cfbe9cf9428fa57103b022d8611e933989561e0b3aa81",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.1.1/OutlineViewer-2023.1.1-windowsx86-64.zip",
        sha256 = "1e2047e486e805037d9b0ae59b8908e792ba1b3a6f0e6d7f92f4ac63a06d0f6d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.1.1/roboRIOTeamNumberSetter-2023.1.1-linuxarm32.zip",
        sha256 = "29d1ec9a74b9d2c512f5806c238953ae186c4ee936a0371dbe3acdd534830667",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.1.1/roboRIOTeamNumberSetter-2023.1.1-linuxarm64.zip",
        sha256 = "5ac4a85084398b3f66998417c3d479fb12788eea57ef56d8594ac94713a2c61d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.1.1/roboRIOTeamNumberSetter-2023.1.1-linuxx86-64.zip",
        sha256 = "f9c42efba430a5e71cfad712b8b1e065159175a08e6c840c0bd9b735c14fa08e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.1.1/roboRIOTeamNumberSetter-2023.1.1-osxuniversal.zip",
        sha256 = "b9281df007ffb551fb6135bee682646f06f5d25c1ba3a6a91884af9d83230e6e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.1.1/roboRIOTeamNumberSetter-2023.1.1-windowsx86-64.zip",
        sha256 = "d370a08c3d3a6e2d4c2997b22c056af7e230a001bea5c95872f53c13fc1bbef2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.1.1/DataLogTool-2023.1.1-linuxarm32.zip",
        sha256 = "2db507bf81874876de532ff876372ecf7010ee2953ee8e90c1a9ce9a2be27167",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.1.1/DataLogTool-2023.1.1-linuxarm64.zip",
        sha256 = "a38660913d8b68cdd7b4219fa0c4733532744976fba8dca3d0d7b7636d6121f0",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.1.1/DataLogTool-2023.1.1-linuxx86-64.zip",
        sha256 = "434a72a2ecd2e0051e85bd976d76ce980f4c810a217a92185f7595bee2982b86",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.1.1/DataLogTool-2023.1.1-osxuniversal.zip",
        sha256 = "c9876de8099663a29efc1389896d4086f9fd80576f203b4e1430c50df720995c",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.1.1/DataLogTool-2023.1.1-windowsx86-64.zip",
        sha256 = "ffb77e23a18b8db3024c3a24432ce3904f5efc353d31123ab8a1c49f16a8b889",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2023.1.1/SysId-2023.1.1-linuxx86-64.zip",
        sha256 = "7a31114bfc8579e72fe3ed717bcb36ba88a82b6556b223a8c76ae6ce365542e1",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2023.1.1/SysId-2023.1.1-osxuniversal.zip",
        sha256 = "53d4cd269687369a0b258efa372aa12167c61bc8600f0c708e90322483e51281",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2023.1.1/SysId-2023.1.1-windowsx86-64.zip",
        sha256 = "8622ca4431436d98288079cea5917842e1b2f6a6e96d4716573256d329e7aa5f",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
